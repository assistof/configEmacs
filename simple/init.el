(custom-set-variables                                                                                                                                                                                                                                                            
 '(custom-enabled-themes (quote (wombat)))                                                                                                                                                                                                                                       
 '(blink-cursor-mode nil)                                                                                                                                                                                                                                                        
 '(scroll-bar-mode nil)                                                                                                                                                                                                                                                          
 '(show-paren-mode t)                                                                                                                                                                                                                                                            
 '(tool-bar-mode nil))                                                                                                                                                                                                                                                           
                                                                                                                                                                                                                                                                                 
(set-face-attribute 'default nil                                                                                                                                                                                                                                                 
                    :height 105)                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                                 
;; disable backup                                                                                                                                                                                                                                                                
(setq backup-inhibited t)                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                 
;; disable auto save

(setq auto-save-default nil)                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                 
;; scrolling line by line                                                                                                                                                                                                                                                        
(setq scroll-conservatively 1)                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                 
;; no startup                                                                                                                                                                                                                                                                    
(setq inhibit-startup-screen t)