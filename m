Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2AC360EC5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896345; cv=none; b=u6xWu6qa3VvE7jMiGk2JSF2obiuVH8MC5w9ub+MbKFaAgrp/W9TazqXWZur5L6M1eJSSXHULeNPt7RAJ4XOq6nELY/wytTOXWhIOKeCYh54y7FyXmvxc9MwrMsf9RTCTCnfN2csxRflHE9Jdzbh9SbAKvvkvVSvGFD3ic1DeLiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896345; c=relaxed/simple;
	bh=V5ok3ihiqFCc6bmYhoyZHFAuEeRzA730jiDfzp3tsI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZMntiRfgZ9LDDs5AGKj0PYwos+gp6c+Wo0g8pUSEHsZu+g+n2zj+mst+Eho7crkOiyOwOeOu8gC4PRlKy4wo5I/GsRAQ8NLRbs6jAw17mkS8HWo/5KukygRHaMJS/eS7kKK3phe8kba1wFlHwxA2OhdPQlbusFiBEZo59utNdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH7DDFp9; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH7DDFp9"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a18eb44812so1329175e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896342; x=1792501142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubS41ZohAvdQJ8eUZfnOc+bFZozvbJltYH0gQUtIqhc=;
        b=SH7DDFp9zPUZvPAe1rBO8be0OIK8unnmqF7xwyfB/lYv+IuFx/GG5dXr8SjUD6b9AS
         gfHjt++GteuehVFp8D1d/YdOdiaBJoWHA54wtrF45/5xx1F07gW5Y+fLNkEErbRRoAvb
         lJFJKoCO5BcZ8aRCMetOu+QlYgJzgmVyBLVnLdlbrGVqyuxppYRv8k28nFtrQR3WsSaP
         sNyUCrQp5LtJwhzFY/GPvXHcZZVfvXCngKf6wjirkp/T8Lua/aFMpPUafqPeUiGpRd7+
         99GPcXmR25mbNWfF41jqrxXY3CzkI4PjoP+J7K2ehXH0G32ZoNppn0iux/2E2sYlvRkM
         ukhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896342; x=1792501142;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ubS41ZohAvdQJ8eUZfnOc+bFZozvbJltYH0gQUtIqhc=;
        b=l8acdpicFR6DYRfPSQ9OTEIzM9YpNzeSAfbEb1/a3qPw6w0/Sb63H7KZ6xLX+ZrsZ1
         YxISscAZ9Tw8E2I2O4I08uPyFRfoltimx8eCuatsVxSltYFpSer1G67Z35p6gZ+WMFMg
         pxQT0nmDJdeiaUtND61VZX/IRr0UUzpuvYu9KZqLxFnIHZ01xH5rAWYfgHyIGKFOr8hA
         ECu5ehnrm/qc2XU2oIdDkrqLIWy1eBTEtu1rghRj/gtScJjplWtrcfO1gnVhKZpukg+f
         qtQhYz5eTP3p9cp2tDwsbpMZz1j1CCXVXuDHYTNnnzMeexTK6jzZJpvI5+IDYrvXQB3D
         TM3g==
X-Forwarded-Encrypted: i=1; AKwUvByINEi4tERcz6nDgKMEQRBYeGZ8C+40XDLg0RVB7xc7cm7bFexGwruDGVZcqJD7ev70AomF58wdyF3BlbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSBfPkRVoY2kn6Qgu2xIvnjRhTbdQfUxTgbL2AbSDZTidL8bnZ
	5bnzrNK7szpuUh0zd14g43i/GCIii2qaJH/7AYle8oTvboeMm9eJSXP1
X-Gm-Gg: AYBFou0upjFUg+D5p02bLjXfq0HDht4tJ0l1jni7V8r3febkKJbFpgiOPd/x1BzyJzg
	n9YSZ2l7NJXO7l69aV9dLu5FqEpQtSL/10avU1URNNS2aA2m1WJQY5cqI+AfJGZ3xRko5Dr0rQK
	SqMqWFGGqxrk1LtfrcPOtTrY8h/u/oHpyxExdQ1hoPrVdwkXuT3LOJ1wq9hsn41GdlRrIbSM3Uv
	hVDOzrbtIQxzAAsMOcHdsmn6J6OLtrMqIEHjas57Slo2yULu6Vdn5osBvJSH+LN6VM+QoSpz0ns
	XmWz0oNiMMwhvAKvBFWJJpp5KZBLMwvFONeEcX/afXhGR7OF5bfZfazGXkinIjZlAfroGc3xISF
	lLxD2fpxPpFYC7BCxPpTF7q6PYeX5P9HakZNtgHXUuuyQGDoEEMDbOPIumd9P6uTZlb15E/akL4
	P5FVomZE9Xf3/HdYLDLo9OBpv0a1Eu1yz9ZnNqhHU4Jbdk1jmx8KnwyYUaS/O15tfPzXtuyHlPJ
	jCOsZAFL5Y3S07Iex9ndpOqi+pDvY6MnIks2A==
X-Received: by 2002:a05:600c:1912:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a18e3ee97dmr207720645e9.0.1791896341892;
        Tue, 13 Oct 2026 05:59:01 -0700 (PDT)
Received: from localhost.localdomain ([160.242.20.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm5113320f8f.20.2026.10.13.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:59:01 -0700 (PDT)
From: "Efraim E. Vander" <efraimvander64@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Efraim E . Vander" <fraimvander64@gmail.com>,
	"Efraim E. Vander" <efraimvander64@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate cpu-load.rst
Date: Tue, 13 Oct 2026 12:58:25 +0000
Message-ID: <20261013125825.3080-1-efraimvander64@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate cpu-load.rst into Brazilian Portuguese and
add it to the pt_BR admin-guide documentation index.

Assisted-by: LLM

Signed-off-by: Efraim E. Vander <efraimvander64@gmail.com>
---
 .../pt_BR/admin-guide/cpu-load.rst            | 126 +++++++++---------
 1 file changed, 65 insertions(+), 61 deletions(-)

diff --git a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
index 0c76acabe..f0bb48e82 100644
--- a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
+++ b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
@@ -1,27 +1,26 @@
-
-
 .. SPDX-License-Identifier: GPL-2.0
 
 =============
 Carga da CPU
 =============
-O Linux exporta diversas informações por meio de `/proc/stat` e `/proc/uptime`, que ferramentas do espaço do usuário (*userland*), como `top(1)`, utilizam para calcular o tempo médio que o sistema passou em determinado estado. Por exemplo:
-
 
-$ iostat
-Linux 2.6.18.3-exp (linmac)     02/20/2007
+O Linux exporta diversas informações por meio de `/proc/stat` e `/proc/uptime`, que ferramentas do espaço do usuário (*userland*), como `top(1)`, utilizam para calcular o tempo médio que o sistema passou em determinado estado, por exemplo::
 
-avg-cpu:  %user   %nice %system %iowait  %steal   %idle
-           10.01    0.00    2.92    5.44    0.00   81.63
+    $ iostat
+    Linux 2.6.18.3-exp (linmac)     02/20/2007
 
+    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
+               10.01    0.00    2.92    5.44    0.00   81.63
 
-Nesse caso, o sistema considera que, durante o período de amostragem padrão, passou 10,01% do tempo executando tarefas no espaço do usuário, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo total.
+Nesse caso, o sistema considera que, durante o período de amostragem padrão, passou 10,01% do tempo executando tarefas no espaço do usuário, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo.
 
-Na maioria dos casos, as informações de `/proc/stat` refletem a realidade com bastante precisão. No entanto, devido à natureza da forma como e do momento em que o kernel coleta esses dados, às vezes essas informações não são confiáveis.
+Na maioria dos casos, as informações de `/proc/stat` refletem a realidade com bastante precisão. No entanto, devido à natureza da forma como e do momento em que os dados são coletados, esses valores podem apresentar imprecisões.
 
 Então, como essas informações são coletadas?
-Sempre que uma interrupção do temporizador (*timer interrupt*) é sinalizada, o kernel verifica que tipo de tarefa estava em execução naquele instante e incrementa o contador correspondente ao tipo ou estado dessa tarefa.
-O problema é que o sistema pode ter alternado entre vários estados diversas vezes entre duas interrupções do temporizador. Ainda assim, o contador é incrementado apenas para o último estado observado.
+
+Sempre que uma interrupção do temporizador (*timer interrupt*) é sinalizada, o kernel verifica que tipo de tarefa estava em execução naquele instante e incrementa o contador correspondente.
+
+O problema é que o sistema pode ter alternado entre vários estados diversas vezes entre duas interrupções do temporizador. Ainda assim, o contador é incrementado apenas uma vez, de acordo com o estado observado no instante da interrupção.
 
 Exemplo
 -------
@@ -35,67 +34,72 @@ Imagine um sistema com uma única tarefa que, periodicamente, consome ciclos de
     |_ algo começa a trabalhar             |_ algo entra em suspensão
                                               (mas é despertado pouco depois)
 
-
-Na situação acima, de acordo com `/proc/stat`, a carga do sistema será de 0%, pois a interrupção do temporizador sempre ocorrerá quando o sistema estiver executando o tratador de ociosidade (*idle handler*).
+Na situação acima, de acordo com `/proc/stat`, a carga do sistema será de 0%, pois a interrupção do temporizador sempre ocorrerá quando o sistema estiver executando a tarefa ociosa.
 
 Na realidade, porém, a carga estará mais próxima de 99%.
 
 É possível imaginar muitas outras situações em que esse comportamento do kernel pode gerar informações bastante inconsistentes em `/proc/stat`:
 
 
-        /* gcc -o hog smallhog.c */
-        
-        #include <time.h>
-        #include <limits.h>
-        #include <signal.h>
-        #include <sys/time.h>
-        #define HIST 10
 
-        static volatile sig_atomic_t stop;
+    /* gcc -o hog smallhog.c */
+    #include <time.h>
+    #include <limits.h>
+    #include <signal.h>
+    #include <sys/time.h>
 
-        static void sighandler(int signr)
-        {
-                (void) signr;
-                stop = 1;
-        }
+    #define HIST 10
 
-        static unsigned long hog (unsigned long niters)
-        {
-                stop = 0;
-                while (!stop && --niters);
-                return niters;
-        }
+    static volatile sig_atomic_t stop;
 
-        int main (void)
-        {
-                int i;
-                struct itimerval it = {
-                        .it_interval = { .tv_sec = 0, .tv_usec = 1 },
-                        .it_value    = { .tv_sec = 0, .tv_usec = 1 } };
-                sigset_t set;
-                unsigned long v[HIST];
-                double tmp = 0.0;
-                unsigned long n;
-                signal(SIGALRM, &sighandler);
-                setitimer(ITIMER_REAL, &it, NULL);
-
-                hog (ULONG_MAX);
-                for (i = 0; i < HIST; ++i) v[i] = ULONG_MAX - hog(ULONG_MAX);
-                for (i = 0; i < HIST; ++i) tmp += v[i];
-                tmp /= HIST;
-                n = tmp - (tmp / 3.0);
-
-                sigemptyset(&set);
-                sigaddset(&set, SIGALRM);
-
-                for (;;) {
-                        hog(n);
-                        sigwait(&set, &i);
-                }
-                return 0;
-        }
+    static void sighandler(int signr)
+    {
+        (void) signr;
+        stop = 1;
+    }
 
+    static unsigned long hog(unsigned long niters)
+    {
+        stop = 0;
+        while (!stop && --niters);
+        return niters;
+    }
+
+    int main(void)
+    {
+        int i;
+        struct itimerval it = {
+            .it_interval = { .tv_sec = 0, .tv_usec = 1 },
+            .it_value    = { .tv_sec = 0, .tv_usec = 1 }
+        };
+        sigset_t set;
+        unsigned long v[HIST];
+        double tmp = 0.0;
+        unsigned long n;
+
+        signal(SIGALRM, &sighandler);
+        setitimer(ITIMER_REAL, &it, NULL);
+
+        hog(ULONG_MAX);
+        for (i = 0; i < HIST; ++i)
+            v[i] = ULONG_MAX - hog(ULONG_MAX);
+
+        for (i = 0; i < HIST; ++i)
+            tmp += v[i];
+
+        tmp /= HIST;
+        n = tmp - (tmp / 3.0);
+
+        sigemptyset(&set);
+        sigaddset(&set, SIGALRM);
+
+        for (;;) {
+            hog(n);
+            sigwait(&set, &i);
+        }
 
+        return 0;
+    }
 
 Referências
 -----------
-- 
2.43.0

