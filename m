Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687323A8755
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935187; cv=none; b=R2M92JF6qPDfDHjv3T1mdrLELu1COVYzBwFMhflJtOK8FtAmEWdGIWU4DxZqduY63CK2FRqtz9ydEapgW/b9VDfYS5Lk0SbS+O4g287niwzQv+Z5EPAVKVdPY/FavaLfVGI1jdZFi5b/kRtPhfKOuYHt/OWNxliftXhX3QFbkrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935187; c=relaxed/simple;
	bh=0HIh/ClcpmLydAoRJhxTHosE/5DNHH8JYuP7tTOSabI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cb+lZ0UgKzF6jApzbsa70PisNljaLx9YYL2Rg3gPHtrQMOROIppvbvD+Hx7iQb54d+AdvLIMfz1cfEykmVrnFAyR7P9SNMMdSYMq+C+b7iAZGb4XUfxEU2s8sgNrUS+J2MtXak+/nc9Cjki5sJOoV7XA33TvUBd5abwcHgfYGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiLVWiOE; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiLVWiOE"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso6129709eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791935184; x=1792539984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4AKWT/qrixGDjaLjnExvV+5L03lDjF4xmb2OXY1KbYU=;
        b=OiLVWiOEp6KOYkAUi7wEa4Zi+Y+I0AzB69nyqt96I9b2phHcfA9+QL/61v9Bg6ooAi
         jaaCbLC40UD4F+jN8RkB3Ccgk7fsjjLHLUD3kpRR9oklkiCP8engZLJE6ZkKgIXeuuRk
         9Na6VCM8uUDFvnzYrmdlTLigXC5+IoTxJOEbM7rEnnva+ebaFEbsDR6seJy3hA+H7982
         6OXY0rSQeevaJKVX6PcwkANVWZikxi+rp396VKTFSu+Q0StIowMD4jIssCQamIXhfBqg
         X1lLZ++lzDZWEdo9PS3XRTI7sI8wxa5gGmzCf8fwGLVt6Ng/5kStrb/T4+Od0aXM2heD
         jM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791935184; x=1792539984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AKWT/qrixGDjaLjnExvV+5L03lDjF4xmb2OXY1KbYU=;
        b=vOBEl8Yj/tQazAJVdODYPjBvQpLzasFEkTO4gsI9iqxbLCphD2oUkjhV81KFIN3Q6c
         7C6bj+GaKiUn5t8xBJ/Fa7e2z5e3Plt8007gWnw0TcIFYBdhxcbRKSnZ2nTR86NZllpK
         PATZayJfcnPjt5tTCQxHTLjJI/VM6IMZ6GkMfhoSLAH2RNkAIgH1fl+KJ1GA0TBr+2Wh
         z20HLW52w9AWpDCcAYv0x6zYhqnV05M+8f0vFoN152y4osZVnSBG10TtbUlP3cECWivt
         b1AmWTk+JjtvBsBa2yn4bsWCFk0+0Insk8zfN4QVE6KIkHZGo9NuHw2XVwRcRq7Vcm2h
         Xg0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8vS7HhRWOVlveEWpD1uw96Xegd54fOgqGHUE64EmIMWQlh9gtIuOnmTZ2//EHSS95wyiY/VOI3i1IulQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe47w4YqQ7ttkPXJXnNxDSPm+jaZfUJw9zzbcWiS474tKmVclk
	3c7C7YYa5tLQC+Kts6NQdKBBELB79sd8fd/39nlKVU/H0JuexFWodKbt
X-Gm-Gg: AYBFou3a9LHtxDxyUrYvAf6RJT9jSUdgSWzUfmkje6fP3jok/MxwI8vRfl4Eu/in4Sa
	vEIJLPN/oDUgcuT7fyl1d3p89w9l358mygKoDU6ok4F9R/nDFkJFElQqjKm0qaqcSNa8+iv6t2Y
	7urG6LrhzWfQ6LWrnrvpF44+N63NDdBQXTfZmd6czjvIn41xu4SrBkQV6zkKrZHUN+dLHbL1fN2
	JQoKF6k8baQflhxVsUzx6DLcB011rtK6nYWQTuDL/owrKuCo39Ks8j+EDJ+DFzeIGzM9YTOspcn
	tUhhejstRRpP5EGAI0jo8Q3CCiPATVPV23biGZq1uRSwWpJppfFSWHPqZ4ciCfBTGhabsw9hvki
	auKIG7PTlYNN4eVKqtUDKdmIvJktCI5OyDcPWw/Oo8vnGtmJEFAeuMohSGaQGUYS27fPUE4IZ4q
	Q4dSNmM8XFQxftE7jY4lqNQa0/534MLWAh/3i3Xq6GQdu0sF8y7Rl7MqFLl32hbj5EaDV61RAWa
	IyX
X-Received: by 2002:a05:693c:88c7:10b0:359:2729:1797 with SMTP id 5a478bee46e88-35927292f58mr13042070eec.30.1791935184134;
        Tue, 13 Oct 2026 16:46:24 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm51257744eec.0.2026.10.13.16.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 16:46:23 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH v1 1/3] docs: translations: pt_BR: process: add driver_development_debugging_guide
Date: Tue, 13 Oct 2026 20:45:42 -0300
Message-ID: <3f9bdd755f3db2405ec44471ebdcfb614bf41725.1791933697.git.lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791933697.git.lucasadramalho@gmail.com>
References: <cover.1791933697.git.lucasadramalho@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate driver_development_debugging_guide and add to debugging/index.rst.

Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 .../driver_development_debugging_guide.rst    | 244 ++++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   6 +-
 2 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst

diff --git a/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst b/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
new file mode 100644
index 000000000..4d0613ddf
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
@@ -0,0 +1,244 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================================================
+Orientações de depuração para o desenvolvimento de drivers
+==========================================================
+
+Este documento serve como ponto de partida e referência geral para a
+depuração de drivers de dispositivos.
+Enquanto este guia se concentra na depuração que exige recompilar o
+módulo ou o kernel, o :doc:`guia de depuração em espaço de usuário
+</process/debugging/userspace_debugging_guide>` orienta sobre ferramentas
+como depuração dinâmica, Ftrace e outras ferramentas úteis para investigar
+problemas e analisar comportamentos.
+Para orientações gerais sobre depuração, consulte o
+:doc:`guia geral de depuração </process/debugging/index>`.
+
+.. contents::
+    :depth: 3
+
+As seções a seguir mostram as ferramentas disponíveis.
+
+printk() e amigos
+-----------------
+
+Esses derivados de printf() podem enviar mensagens a destinos diferentes e
+podem ser ativados ou desativados dinamicamente, quando há suporte para isso.
+
+Simples printk()
+~~~~~~~~~~~~~~~~
+
+O método clássico é simples e pode ser muito útil para desenvolver módulos
+rapidamente ou extrair dados necessários para investigar problemas.
+
+Pré-requisito: ``CONFIG_PRINTK`` (geralmente habilitado por padrão)
+
+**Prós**:
+
+- Não há necessidade de aprender nada, simples de usar
+- Fácil de adaptar às suas necessidades, incluindo a formatação dos dados
+  (consulte :doc:`/core-api/printk-formats`) e a visibilidade no log
+- Pode causar atrasos na execução do código (benéfico para confirmar se o
+  tempo é um fator)
+
+**Contras**:
+
+- Requer reconstrução do kernel/módulo
+- Pode causar atrasos na execução do código (o que pode fazer com que os
+  problemas não sejam reproduzíveis)
+
+Para a documentação completa, consulte :doc:`/core-api/printk-basics`.
+
+trace_printk()
+~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_DYNAMIC_FTRACE`` & ``#include <linux/ftrace.h>``
+
+É um pouco menos confortável de usar que printk(), porque as mensagens devem
+ser lidas no arquivo de rastreamento (consulte :ref:`read_ftrace_log`),
+em vez de no log do kernel. Ainda assim, é muito útil quando printk() causa
+atrasos indesejados na execução do código, tornando os problemas intermitentes
+ou difíceis de reproduzir.
+
+Se isso ainda causar problemas de temporização, tente trace_puts().
+
+Para a documentação completa, consulte trace_printk().
+
+dev_dbg
+~~~~~~~
+
+Chamada de depuração que pode ser controlada por
+:ref:`process/debugging/userspace_debugging_guide:dynamic debug` e inclui
+informações adicionais sobre o dispositivo associado.
+
+**Quando é apropriado manter uma mensagem de depuração no código?**
+
+
+As mensagens de depuração permanentes devem ajudar o desenvolvedor a investigar
+problemas no funcionamento do driver. Avaliar quais mensagens são úteis é mais
+uma arte do que uma ciência, mas algumas diretrizes estão nas
+:ref:`Diretrizes de estilo de codificação
+<translations/pt_BR/process/coding-style:13) Imprimindo mensagens do kernel>`.
+Em quase todos os casos, as mensagens de depuração não devem ser enviadas
+ao upstream, pois um driver funcional deve ser silencioso.
+
+printk personalizado
+~~~~~~~~~~~~~~~~~~~~
+
+Exemplo::
+
+  #define core_dbg(fmt, arg...) do { \
+	  if (core_debug) \
+		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
+	  } while (0)
+
+**Quando você deve fazer isso?**
+
+É melhor usar pr_debug(), que pode ser ativado ou desativado posteriormente
+com a depuração dinâmica. Além disso, muitos drivers ativam essas mensagens
+por meio de uma variável como ``core_debug``, definida por um parâmetro do
+módulo. No entanto, os parâmetros de módulo `não são mais recomendados
+<https://lore.kernel.org/all/2024032757-surcharge-grime-d3dd@gregkh>`_.
+
+Ftrace
+------
+
+Criando um ponto de rastreamento Ftrace personalizado
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Um ponto de rastreamento adiciona um gancho ao seu código que será chamado e
+registrado quando o ponto de rastreamento estiver ativado. Isso pode ser usado,
+por exemplo, para rastrear a execução de um ramo condicional ou para gerar um
+dump do estado interno em pontos específicos do fluxo do código durante uma
+sessão de depuração.
+
+Aqui está uma descrição básica de
+:ref:`como implementar novos pontos de rastreamento
+<trace/tracepoints:usage>`.
+
+Para a documentação completa sobre rastreamento de eventos, consulte
+:doc:`/trace/events`.
+
+Para a documentação completa do Ftrace, consulte :doc:`/trace/ftrace`.
+
+DebugFS
+-------
+
+Pré-requisito: ``CONFIG_DEBUG_FS`` e ``#include <linux/debugfs.h>``
+
+O DebugFS difere das outras abordagens de depuração, pois não grava mensagens
+no log do kernel nem adiciona rastros ao código. Em vez disso, permite que o
+desenvolvedor gerencie um conjunto de arquivos.
+Com esses arquivos, é possível armazenar valores de variáveis ou gerar
+dumps de registros/memória, ou ainda tornar esses arquivos graváveis e modificar
+valores/configurações no driver.
+
+Possíveis casos de uso, entre outros:
+
+- Armazenar valores de registros
+- Acompanhar variáveis
+- Armazenar erros
+- Armazenar configurações
+- Ativar ou desativar uma configuração, como o modo de depuração
+- Injeção de erros
+
+Isso é especialmente útil quando o tamanho de um dump de dados dificultaria
+sua análise como parte do log geral do kernel (por exemplo, ao despejar dados
+brutos de um fluxo de bits) ou quando você não precisa acompanhar todos os
+valores continuamente, mas quer poder inspecioná-los quando necessário.
+
+A ideia geral é:
+
+- Criar um diretório durante a execução do ``probe`` (``struct dentry *parent =
+  debugfs_create_dir("my_driver", NULL);``)
+- Criar um arquivo:
+
+  ``debugfs_create_u32("my_value", 444, parent, &my_variable);``
+
+  - Neste exemplo, o arquivo está localizado em
+    ``/sys/kernel/debug/my_driver/my_value`` (com permissões de leitura para
+    usuário/grupo/outros)
+  - Qualquer leitura do arquivo retornará o conteúdo atual da variável
+    ``my_variable``
+
+- Limpe o diretório ao remover o dispositivo
+  (``debugfs_remove(parent);``)
+
+Para a documentação completa, consulte :doc:`/filesystems/debugfs`.
+
+KASAN, UBSAN, lockdep e outros verificadores de erros
+-----------------------------------------------------
+
+KASAN (Kernel Address Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_KASAN``
+
+O KASAN é um detector dinâmico de erros de memória que ajuda a identificar
+bugs de uso após liberação (*use-after-free*) e acessos fora dos limites
+(*out-of-bounds*). Ele utiliza instrumentação em tempo de compilação para
+verificar cada acesso à memória.
+
+Para a documentação completa veja :doc:`/dev-tools/kasan`.
+
+UBSAN (Undefined Behavior Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_UBSAN``
+
+O UBSAN usa instrumentação do compilador e verificações em tempo de execução
+para detectar comportamentos indefinidos. Ele identifica vários problemas,
+incluindo estouro de inteiro com sinal e índice de array fora dos limites.
+
+Para a documentação completa, consulte :doc:`/dev-tools/ubsan`.
+
+lockdep (Lock Dependency Validator)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_DEBUG_LOCKDEP``
+
+O lockdep é um validador de dependências de bloqueio em tempo de execução que
+detecta possíveis deadlocks e outros problemas relacionados a bloqueios no
+kernel. Ele rastreia a aquisição e a liberação de bloqueios, constrói um
+gráfico de dependências e o analisa em busca de possíveis deadlocks. O lockdep
+é especialmente útil para validar a ordem correta dos bloqueios no kernel.
+
+PSI (Pressure stall information tracking)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Pré-requisito: ``CONFIG_PSI``
+
+O PSI é uma ferramenta de medição que identifica a sobrecarga excessiva dos
+recursos de hardware, capaz de causar perda de desempenho ou até encerramentos
+de processos por falta de memória (OOM).
+
+coredump do dispositivo
+-----------------------
+
+Pré-requisito: ``CONFIG_DEV_COREDUMP`` e ``#include <linux/devcoredump.h>``
+
+Essa infraestrutura permite que um driver envie dados arbitrários ao espaço do
+usuário. Ela é usada com frequência em conjunto com o udev ou outro aplicativo
+de espaço de usuário que monitore os uevents do kernel indicando que o dump
+está pronto. O udev pode ter regras para copiar o arquivo para armazenamento e
+análise de longo prazo, pois, por padrão, os dados do dump são removidos após
+cinco minutos. Esses dados são analisados com ferramentas específicas do driver
+ou com o GDB.
+
+Um coredump do dispositivo pode ser criado a partir de uma área vmalloc, com
+métodos de leitura e liberação ou como uma lista scatter/gather.
+
+Você pode encontrar um exemplo de implementação em:
+`drivers/media/platform/qcom/venus/core.c
+<https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/platform/qcom/venus/core.c#L30>`__,
+na camada HCI do Bluetooth, em vários drivers sem fio e em vários
+drivers DRM.
+
+Interfaces do devcoredump
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/linux/devcoredump.h
+
+.. kernel-doc:: drivers/base/devcoredump.c
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index b223fae34..5c2c73493 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -7,9 +7,13 @@ Dicas de depuração para desenvolvedores do Kernel Linux
 Guias gerais
 ------------
 
+.. toctree::
+   :maxdepth: 1
+
+   Orientações de depuração para o desenvolvimento de drivers <driver_development_debugging_guide>
+
 Todolist:
 
-*   driver_development_debugging_guide
 *   gdb-kernel-debugging
 *   kgdb
 *   userspace_debugging_guide
-- 
2.55.0

