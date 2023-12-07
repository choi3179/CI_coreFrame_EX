<?xml version="1.0" encoding="UTF-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">

  <jsp:directive.page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />

  <jsp:directive.page extends="coreframe.http.JspController" />
  <jsp:directive.page import="java.io.*" />
  <jsp:directive.page import="coreframe.http.*,coreframe.data.*" />
  
  <jsp:declaration>
  <![CDATA[
  
  private static final String JSP_BASE="/coreframe/sample-application/case3/";
           
  private static final String JSP_LIST=JSP_BASE+"_list.jsp";
  
  private static final String JSP_VIEW=JSP_BASE+"_view.jsp";
  
  private static final String JSP_UPDATE=JSP_BASE+"_update.jsp";
                            
  private static final String URL_LIST="./city.jsp";
  
  protected String getDefaultMethodName()
  {
    return "list";
  }
  
    
  public void list(HttpServletRequest req,HttpServletResponse resp, ViewMeta view)
    throws ServletException, IOException
  {
    //input model : DataSet
    DataSet input = new DataSet();
    DataSet output = new DataSet();

    bind(req, input);

    executeBL("samples/database/listCities", input, output);
    
    req.setAttribute("output", output.toList());
    
    view.setViewPage(JSP_LIST);
  }

  
  /**
   * ���� ����
   */
  public void view(HttpServletRequest req,HttpServletResponse resp, ViewMeta view)
      throws ServletException, IOException
    {
      //input model : DataSet
      DataSet input = new DataSet();
      DataSet output = new DataSet();

      bind(req, input);

      executeBL("samples/database/readCity", input, output);
      
      req.setAttribute("output", output);
      
      view.setViewPage(JSP_VIEW);
    }

    
    /**
     * ���� ����
     */
   public void delete(HttpServletRequest req,HttpServletResponse resp, ViewMeta view)
        throws ServletException, IOException
   {
        DataSet input = new DataSet();
        
        bind(req, input);
        // input.put("id", req.getParameter("id") );

        executeBL("samples/database/deleteCity", input);
        
        view.setViewPage(URL_LIST);
        view.setViewMethod(ViewMeta.REDIRECT);
    }

    /**
    * ���� ����
    */
   public void preUpdate(HttpServletRequest req,HttpServletResponse resp, ViewMeta view)
       throws ServletException, IOException
   {
       view(req,resp,view);
       
       view.setViewPage(JSP_UPDATE);
     }

    
   /**
    * ���� ����
    */
  public void update(HttpServletRequest req,HttpServletResponse resp, ViewMeta view)
       throws ServletException, IOException
  {
       DataSet input = new DataSet();
       
       bind(req, input);

       executeBL("samples/database/updateCity", input);
       
       view.setViewPage(URL_LIST);
       view.setViewMethod(ViewMeta.REDIRECT);
   }    
  
  ]]></jsp:declaration>

</jsp:root>