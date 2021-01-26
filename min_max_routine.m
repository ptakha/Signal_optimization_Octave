function [params_d_min, params_d_max, params_f_min, params_f_max] = min_max_routine(params_d, error_d, params_f, error_f)
  d_min=find(error_d==min(error_d));
  d_max=find(error_d==max(error_d));
  f_min=find(error_f==min(error_f));
  f_max=find(error_f==max(error_f));
  
  params_d_min=params_d(:,d_min);
  params_d_max=params_d(:,d_max);
  params_f_min=params_d(:,f_min);
  params_f_max=params_d(:,f_max);

endfunction