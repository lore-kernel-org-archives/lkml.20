Received: from mail-vs2-f31.google.com (mail-vs2-f31.google.com [74.125.227.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B098352029
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705740; cv=none; b=P2946fDxqSr8H8/kzWrZ3zcratkLMc58RQic/qojGLs6eUDUH8vD4dhSqfT+WOr/TMYk3122hhJ1QqIYX3zkp5Dibu3pe8EB8AN+6R0viOlXkSyMo4EzCtm5BIiWWiITW39YomnzAokYD+pjmCvNA5mBbNpKXMz2Fph/LOCRUR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705740; c=relaxed/simple;
	bh=NLc0HoS5CDxb/vNyBpcFWKWT6ejlrNxD0kMK7WDUD6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p0jojt41FUnRU9jq1ELBPZ5CDM2cu1fkirw3zlTnx1XAB6lTA+RQjFjf+/h2K1vM/ZRNzBX4ZuYF2fur0edSr2P03Sl9K9RSAFW+UWES6k8Z+8dWt2uXA3BYzrYPjAHVgm1YRmtIhAUlY1dICu19bU3x120auDuJweJaFZFH20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwmmlMQD; arc=none smtp.client-ip=74.125.227.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwmmlMQD"
Received: by mail-vs2-f31.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so72783e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789705737; x=1790310537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/Xwv7JnfwEW9nFpq+3urZq4FaVHMWgugCG1w4cu5G0=;
        b=ZwmmlMQDDuKKOBDoi1mHMbxvOARxdJJ2x0Qvn6DF10XjR3V39OSWQ092EvNtwdYnHg
         AZNVI+Nv5dBa5jg+PWcgxHFXc4o+6q/j+sgJAFV+oO0GP0C1PGdR8VaqkyrzuAaoK1Zh
         45L9W4QsgfF9Y8TnLU+KGDuVoZ0vhWti6W04w8HX2Xa/eIr32K6Me/RP6YLXpiMlo7GT
         GFhuU7jNXGEVR6X+cOJ3rYftZsoYHcBARWJ7Y7QT6zCzZFOYkrVLlVr4F5Nktzmlmkq2
         UXZYgKHa6pFQtojizxYLhEjlp5igyRJw83DU6bMrCoWFtpE1/CLFiXjgCACirzFQEnRI
         6oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705737; x=1790310537;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/Xwv7JnfwEW9nFpq+3urZq4FaVHMWgugCG1w4cu5G0=;
        b=qtkdqNh3dZ7krKYXrPHrmDMAjPTvKWdPA1CnM028rdRiqKhVqtJikrfEAKz8CfGf8O
         ay3QYn3J0M0ZVPx3Kku0VtBSRtLl4t/FZpgilsvyrJNH6VIxyTazLUAGf1UhqwD1wccL
         m9pNo6Ke4r06/YZwLNzvvgNMpB3MZ9hifK5BmKxkarHZLx0phBP5d9wgSpvG2g9lONgS
         G2Mw2nj+Y2XOvbgx2dH+Sj/RMkH0lWNrf2/0hfi1NZ0fivB8mPPN3bP6fXk0tmF5g1uU
         3H7JXltB8kYjkPRkgfmstSeKddnyx4CtJw6ky0j+ZWFx3Y6z6QqqMXfWluF1BfO+Xa5w
         cKwQ==
X-Forwarded-Encrypted: i=1; AKwUvByWfSyiEicJXT2Cs9ChV3xSpvYpSf9Ppt8ISpVwL0HiRRd1dXMtfh1Hq9IlKJfFUZ406EB/i7nFSxlZ0Qc=@vger.kernel.org
X-Gm-Message-State: AFuF++kIticx34BrMZHkYRU4YrmXo93KBvv0mAUWRE0wf1akoVjlRlUB
	eb+oUiv3NAacDDaOtas25iMMziKkAKr4ljC0U7ug/ZOxbx2sCqAjRbI5
X-Gm-Gg: AYBFou1pkT7qfQZ7h5ksqP1DPEt9fgdl1il2GBhll+Zgn5gt2/aZWQSgm+4VLLdnb+o
	UfXNqWcJI4nIcIOhCEQuKFbYcmtSijworYIE4pqDIowm5mXCMWG8H0mn6I7NEmmQSF8/ivxCKT1
	xJTqZnzHbhBxbvdPIUeYQRX/cKmCBUgXInkY33gIvklcaFTpUtmrVpHv40C9QMIWNQIvCPLjihD
	kVQOnLnwPZatyf/2wWSECifEWGW+GhveyVtHe2hZc9W57f5YxPD+7HA7IWJVza/DtJnHKvw7En3
	Wrq5Nhz6crDG3+yEEXpO2W5U6KtYJsUE0uNGNz3GSvh0+oD1r1PLisXfzIK4d79BNKM2UH4j2OZ
	0S8lOze9QajMsm6Tdg2bG2ZntutXoioN19mP9Lfnke69RbknUW3kEGiqDT4NBdQYvFA/EQOPd/G
	1CbQcAPcRlG7mx5v2erDTv5R0LQ02ZrflBSiLbC5LausNmnz4fzQNv0dF8eaNkVRa4wgy2lp0+P
	co=
X-Received: by 2002:a05:6122:3d4b:b0:5ab:26f:49e3 with SMTP id 71dfb90a1353d-5c9b58bc60cmr602929e0c.3.1789705737381;
        Thu, 17 Sep 2026 21:28:57 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9b8369f03sm525630e0c.11.2026.09.17.21.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:28:56 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: add debugging index
Date: Fri, 18 Sep 2026 01:28:34 -0300
Message-ID: <20260918042835.156030-1-lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a Brazilian Portuguese index for process/debugging, mirroring the
section layout of the original. No debugging documents have been
translated yet, so every entry is listed under a Todolist marker
instead of a toctree.

Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 .../pt_BR/process/debugging/index.rst         | 73 +++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/index.rst

diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
new file mode 100644
index 000000000..b223fae34
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================================
+Dicas de depuração para desenvolvedores do Kernel Linux
+=======================================================
+
+Guias gerais
+------------
+
+Todolist:
+
+*   driver_development_debugging_guide
+*   gdb-kernel-debugging
+*   kgdb
+*   userspace_debugging_guide
+
+Guias específicos de subsistemas
+--------------------------------
+
+Todolist:
+
+*   media_specific_debugging_guide
+
+Dicas gerais de depuração
+-------------------------
+
+Dependendo do problema, um conjunto diferente de ferramentas está disponível
+para rastrear o problema ou até mesmo para perceber se há algum problema em
+primeiro lugar.
+
+Como primeiro passo, você precisa descobrir que tipo de problema você deseja
+depurar. Dependendo da resposta, sua metodologia e escolha de ferramentas podem
+variar.
+
+Preciso depurar com acesso limitado?
+------------------------------------
+
+Você possui acesso limitado à máquina ou não consegue parar a execução em
+andamento?
+
+Nesse caso, sua capacidade de depuração depende do suporte de depuração
+embutido no kernel fornecido pela distribuição.
+O :doc:`/process/debugging/userspace_debugging_guide` fornece uma breve visão
+geral sobre uma variedade de ferramentas de depuração possíveis nessa situação.
+Você pode verificar a capacidade do seu kernel, na maioria dos casos, olhando o
+arquivo de configuração dentro do diretório /boot.
+
+Eu tenho acesso root ao sistema?
+--------------------------------
+
+Você consegue facilmente substituir o módulo em questão ou instalar um novo
+kernel?
+
+Nesse caso, sua gama de ferramentas disponíveis é muito maior. Você
+pode encontrar as ferramentas
+no :doc:`/process/debugging/driver_development_debugging_guide`.
+
+A temporização é um fator?
+--------------------------
+
+É importante entender se o problema que você deseja depurar se manifesta
+de forma consistente (ou seja, para um determinado conjunto de entradas, você
+sempre obtém a mesma saída incorreta) ou de forma inconsistente. Se ele se
+manifestar de forma inconsistente, algum fator de temporização pode estar em
+jogo. Se a inserção de atrasos no código alterar o comportamento, é bastante
+provável que a temporização seja um fator determinante.
+
+Quando a temporização altera o resultado da execução do código, o uso de um
+simples printk() para fins de depuração pode não funcionar; uma alternativa
+semelhante é usar trace_printk(), que registra as mensagens de depuração no
+arquivo de rastreamento, em vez de no log do kernel.
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index 2c63d82bf..13cedb9fa 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -77,6 +77,7 @@ gerenciamento de bugs e vulnerabilidades.
 .. toctree::
    :maxdepth: 1
 
+   Dicas de depuração para desenvolvedores do Kernel Linux <debugging/index>
    Falhas de segurança <security-bugs>
    Problemas de hardware sob embargo <embargoed-hardware-issues>
    CVEs <cve>
-- 
2.55.0

