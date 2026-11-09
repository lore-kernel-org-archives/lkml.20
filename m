Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194713;
	b=aWG4aSsZdPTrtAaP8E+VifGkG/ZgBCviF1OUSDosWssH+VnyvPQR4eNMRb+TIU7Prk2S
	 0uL5xfvas51FPwPX8+I7dv2d1FVXMlSpvXO53AUcyLEbOhBRwLI2vNg0VzlyiVw070vU+
	 iPHC0EKV2dcdP0WarJQ0BaGUjQXJirBh7GSzxLipa+ThPBJ+G75CjCdHraY4+x0OCj8VW
	 3EhWCZfahHpyPNnIrr/9iobYNGKrcH+rwKM5iL8prjt6dKjMve/pXtEFuXxJkBacHyY0U
	 UMCCl1NC477Msx6+3pOYj5FMrt313GjvSZT51RjvlPcdM/FkiV5D+w68q0YuerGZXzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eTaG4po7JA0cxHHzPKYf/i0rJCeMPEuRJN+blMdHnPo=;
	b=us+L7scUalTkicbUO8Q95y5jL/1abq+DAGM0Nt4GATy4tuvOtX/p0UKC7uyeQeh/4Q3+
	 JLYnSS3nxdHCkXBSjD+Vat9os+kDo50TEQrsAoRCRI5phfKZSLcSgx5G5+ouEIH2mmMPy
	 0NSM5IKmJ3ZaezpMloiPv+zSWeZUMCpnzhvlSwY29UI2HZECrxHLoncT6XCSmN6kwBiH6
	 DGBms9CC9Fjjw/fG3gxJKaP264yAn+hS4dB//05iAX9ziA2AuTqZ2VD7JIwve1LZ2QzL9
	 uxQFabtaEOXgSKYz3H53jSRPJn0QpyNnQKYwrBXS078HZJmFxBvlo/yziQNcnzyWStQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvVTg2dR;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F263606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F263606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvVTg2dR
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b31ca7e0bcso3807987b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794194711; x=1794799511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTaG4po7JA0cxHHzPKYf/i0rJCeMPEuRJN+blMdHnPo=;
        b=PvVTg2dR3OKpP6HA7e7DbCF1MMxbk5NaYLH96vkhoAn5lQd3YrGLlsO0jwmJErNu00
         vZNjutx4Ef34lntLPR1OQfgGInJq7nUZc10ZQYnMAUuHENnVmG3HUKzW/CXNQ9wa8f6q
         tMtZBBb8UXGge06ygaecVzmBm2WClKmNqjjOwREYT8trqbjKxiSKrzw5STtjvguewHxW
         SDoHTKSKmtVFSdse6UzYblJXOHCN4rGOME7ZDY3n+TpaOgLpqrDVX2spc7+WYfKY6hnB
         r9ya/j0bJrEL6JvOjJfAPkFAYo0L2VqUr2DrP9ZUygI6D5osMCzwA4Tf4bQpLAnULQni
         ujpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794194711; x=1794799511;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eTaG4po7JA0cxHHzPKYf/i0rJCeMPEuRJN+blMdHnPo=;
        b=L4RbIxbMUS4bAwD0Mf+SQ6foUHmkkd1Kz0bF9OXmU4ath2FLpQTWBVr3zsJ/azVlJX
         s03gRqK4MUvl6Ho8hFeDRnAtBj2dYazDr/2KMYGIlCk5WIbIRR5RGLfLO/t1XSps47Wp
         kutvrngOP01qOBIywYdhl3s9jNcmQubGpUOZkQjBnrf7w7kBJSrGGGYQYuE16LutUg3Z
         9VzlOmeq2uvse8XR8dV+ayZrrq8IdMir+CI+IGBwYHfL6Z6ulQn3jxcATXj6BVUsRiJK
         0mC7u9XQ4lRTaYCcZ3gu32vaUJB3Zr00ACrJiDyxgI2Vyrz64Wh3oEadTGRDm8TNKh8V
         W4EQ==
X-Forwarded-Encrypted: i=1; AL+hErE9m1MyJtrCBr1sS/s5cP83iyY9ENjnZTEc02rowBXMcuIv9mnSPNmT+NLh0XgmXlHzdbuOloenImWHuYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HXMpBO07UoKkLIws9qu9ArdRSLgeizJ4GUtiJw6JIMqSdwpTo
	Aukmm+rSmU6s3TJ8XO9N02MDMKyks5wJZz8iQQFcsejpkMJDk6UMWv1x
X-Gm-Gg: AYBFou1iAH5insArBwUg9apuMtHmIO792yBK3BC2Fq7dWgaq5191xDDHW8+91FXNgKD
	0RHsgaSpOQaO4U8mMyi0eOMHANpZ1ElPTGd5H98vcv2xOhKOIHro2LIsmeMQJl3pGaNYx3SGo1t
	06vldDbrlrwLSDCuYKmBXO9J/gQF12UW84YKXLgt/47ghNyXjd8fddnhcpl9zyPFAWtfQWCm9tR
	18z8VOJ8JYzR8M1bSWwUOmZx+l95zKRLtIIP6P+t8FB9UbvRJ4Z7o/4KraC4+z5lpS/mW+HdTim
	HCd2KKRDzV9AletO15ijS7/oJjQk/z34i4JGEoSYAmMk1W5GAtsNn+FvG9BBH4rfyXGmw+du4hH
	seXzJNwVfvixArT6imFpwYHeHmzbKqqfc/gFLfrekYozyUECR9b+mlR2JqX6lt+t4YH5mJ0feUG
	L+95o5g0/bYVLuPE7Zw6W2q6pFYr5b6IPAS2ukenmqAmGaCwyukV57vuLa/imFCciYPQCZBWQdk
	yQwBO3W49jDeuLgiH/0R1GvEQBM4FQ0aGhA3sqvnrC+x56bOTSv1dgplE1Dmn8u+mGOZ6XCZYIK
	do8kFvP/tqGHTbt/LlIOFA1PXisD3g==
X-Received: by 2002:a05:690c:83:b0:8b2:e27b:95db with SMTP id 00721157ae682-8b36c844f03mr21523687b3.2.1794194711580;
        Sun, 08 Nov 2026 19:25:11 -0800 (PST)
Received: from pop-os ([2804:14c:daa2:8daa:7f0e:a9ca:25e0:599f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bb42553sm26782717b3.15.2026.11.08.19.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:25:11 -0800 (PST)
From: Giovanna Macedo Cox <giovannamccds@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giovanna Macedo Cox <giovannamccds@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate gdb-kernel-debugging
Date: Mon,  9 Nov 2026 00:24:53 -0300
Message-ID: <20261109032455.33944-1-giovannamccds@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate gdb-kernel-debugging to Brazilian Portuguese
and add toctree section in index.

Signed-off-by: Giovanna Macedo Cox <giovannamccds@gmail.com>
---
 .../debugging/gdb-kernel-debugging.rst        | 187 ++++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   6 +-
 2 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst

diff --git a/Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst
new file mode 100644
index 000000000..cc1146aea
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst
@@ -0,0 +1,187 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. highlight:: none
+
+Depuração do kernel e módulos via gdb
+=====================================
+
+O depurador de kernel kgdb, hipervisores como o QEMU ou interfaces de
+hardware baseadas em JTAG permitem depurar o kernel do Linux e seus módulos
+durante a execução utilizando o gdb. O gdb vem com um poderoso script de
+interface python. O kernel fornece uma coleção de scripts de ajuda que
+podem simplificar passos de depuração típicos do kernel. Este é um pequeno
+tutorial sobre como habilitar e usá-los. Ele se concentra em máquinas
+virtuais QEMU/KVM como destino, mas os exemplos também podem ser adaptados
+para outros stubs do gdb.
+
+Requisitos
+----------
+
+- gdb 7.2+ (recomendado: 7.4+) com suporte python habilitado (normalmente
+  habilitados em distribuições)
+
+Configurações:
+--------------
+
+- Crie uma máquina virtual Linux para QEMU/KVM (veja www.linux-kvm.org
+  www.qemu.org para mais detalhes). Para desenvolvimento cruzado,
+  https://landley.net/aboriginal/bin mantém um conjunto de imagens de
+  máquinas e conjuntos de ferramentas que podem ser úteis como ponto de
+  partida.
+
+- Construa (Build) o kernel com CONFIG_GDB_SCRIPTS habilitado, mas deixe
+  CONFIG_DEBUG_INFO_REDUCED desabilitado. Se sua arquitetura suportar
+  CONFIG_FRAME_POINTER, mantenha habilitado.
+
+- Instale esse kernel no sistema convidado e desative o KASLR se
+  necessário, adicionando “nokaslr” à linha de comando do kernel. Como
+  alternativa, o QEMU permite inicializar o kernel diretamente
+  usando -kernel, -append, -initrd troca de comando de linha. Isso é
+  geralmente usado apenas se você não depender de módulos. Veja a
+  documentação QEMU para mais detalhes sobre esse modo. Nesse caso,
+  você deve construir(Build) o kernel com CONFIG_RANDOMIZE_BASE
+  desabilitado se a arquitetura suportar KASLR.
+
+- Construa os scripts gdb(necessário no kernel v5.1 ou superior)
+
+        - Crie scripts_gdb
+
+- Habilite o stub gdb do QEMU/KVM, seja
+
+    - No momento da inicialização da VM adicione "-s" na linha de
+      comando QEMU
+
+  ou
+
+    - durante o tempo de execução, digitando "gdbserver" no console de
+      monitor QEMU
+
+- cd /path/to/linux-build
+
+- Inicie a gdb: gdb vmlinux
+
+    Observação: algumas distribuições podem restringir o carregamento
+    automático de scripts do gdb a diretórios conhecidos como seguros.
+    Caso o gdb informe que se recusa a carregar o vmlinux-gdb.py,
+    adicione::
+
+        add-auto-load-safe-path /path/to/linux-build
+
+    Para ~/.gdbinit. Veja gdb help para mais detalhes.
+
+- Conecte-se ao sistema convidado já inicializado::
+
+    (gdb) target remote :1234
+
+Exemplos de uso do Linux-provided gdb helpers
+----------------------------------------------
+
+- Carregue os símbolos do módulo (e do kernel principal)::
+
+    (gdb) lx-symbols
+    loading vmlinux
+    scanning for modules in /home/user/linux/build
+    loading @0xffffffffa0020000: /home/user/linux/build/net/netfilter/xt_tcpudp.ko
+    loading @0xffffffffa0016000: /home/user/linux/build/net/netfilter/xt_pkttype.ko
+    loading @0xffffffffa0002000: /home/user/linux/build/net/netfilter/xt_limit.ko
+    loading @0xffffffffa00ca000: /home/user/linux/build/net/packet/af_packet.ko
+    loading @0xffffffffa003c000: /home/user/linux/build/fs/fuse/fuse.ko
+    ...
+    loading @0xffffffffa0000000: /home/user/linux/build/drivers/ata/ata_generic.ko
+
+- Defina um ponto de interrupção em alguma função de um módulo que ainda
+  não foi carregado, por exemplo::
+
+    (gdb) b btrfs_init_sysfs
+    Function "btrfs_init_sysfs" not defined.
+    Make breakpoint pending on future shared library load? (y or [n]) y
+    Breakpoint 1 (btrfs_init_sysfs) pending.
+
+- Continue com o alvo::
+
+    (gdb) c
+
+- Carregue o módulo no alvo e veja os símbolos serem carregados, bem como o
+  ponto de interrupção sendo acionado::
+
+    loading @0xffffffffa0034000: /home/user/linux/build/lib/libcrc32c.ko
+    loading @0xffffffffa0050000: /home/user/linux/build/lib/lzo/lzo_compress.ko
+    loading @0xffffffffa006e000: /home/user/linux/build/lib/zlib_deflate/zlib_deflate.ko
+    loading @0xffffffffa01b1000: /home/user/linux/build/fs/btrfs/btrfs.ko
+
+    Breakpoint 1, btrfs_init_sysfs () at /home/user/linux/fs/btrfs/sysfs.c:36
+    36              btrfs_kset = kset_create_and_add("btrfs", NULL, fs_kobj);
+
+- Descarregue o buffer de log do kernel de destino::
+
+    (gdb) lx-dmesg
+    [     0.000000] Initializing cgroup subsys cpuset
+    [     0.000000] Initializing cgroup subsys cpu
+    [     0.000000] Linux version 3.8.0-rc4-dbg+ (...
+    [     0.000000] Command line: root=/dev/sda2 resume=/dev/sda1 vga=0x314
+    [     0.000000] e820: BIOS-provided physical RAM map:
+    [     0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
+    [     0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
+    ....
+
+- Examinar os campos da estrutura da tarefa atual (compatível apenas com
+  x86 e arm64)::
+
+    (gdb) p $lx_per_cpu(runqueues).nr_running
+    $3 = 1
+    (gdb) p $lx_per_cpu(runqueues, 2).nr_running
+    $4 = 0
+
+- Explore os hrtimers usando o auxiliar `container_of`::
+
+    (gdb) set $leftmost = $lx_per_cpu(hrtimer_bases).clock_base[0].active.rb_root.rb_leftmost
+    (gdb) p *$container_of($leftmost, "struct hrtimer", "node")
+    $5 = {
+      node = {
+        node = {
+          __rb_parent_color = 18446612686384860673,
+          rb_right = 0xffff888231da8b00,
+          rb_left = 0x0
+        },
+        expires = 1228461000000
+      },
+      _softexpires = 1228461000000,
+      function = 0xffffffff8137ab20 <tick_nohz_handler>,
+      base = 0xffff888231d9b4c0,
+      state = 1 '\001',
+      is_rel = 0 '\000',
+      is_soft = 0 '\000',
+      is_hard = 1 '\001'
+    }
+
+Lista de comandos e funções
+---------------------------
+
+O número de comandos e funções úteis pode mudar com o tempo; esta é apenas
+uma visão geral da versão inicial::
+
+ (gdb) apropos lx
+ função lx_current -- Voltar à tarefa atual
+ função lx_module -- Encontrar o módulo pelo nome e retornar a variável
+ do módulo
+ função lx_per_cpu -- Retorna a variável por CPU
+ função lx_task_by_pid -- Localiza uma tarefa do Linux pelo PID e retorna a
+ variável `task_struct`
+ função lx_thread_info -- Calcula as informações da thread do Linux a
+ partir da variável da tarefa
+ lx-dmesg -- Exibe o buffer de log do kernel do Linux
+ lx-lsmod -- Lista os módulos carregados no momento
+ lx-symbols -- (Re)carrega os símbolos do kernel do Linux e dos módulos
+ carregados no momento
+
+Detalhes da ajuda podem ser obtidos por "help <command-name>" para
+comandos e "help function <function-name>" para funções.
+
+Depuração de scripts GDB
+------------------------
+
+O GDB não permite um backtrace completo do Python, o que pode tornar a
+depuração de scripts do GDB mais difícil do que o necessário. O código a
+seguir permitirá exibir um backtrace completo do ambiente Python::
+
+ (gdb) set python print-stack full
diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index b223fae34..179d1a1e3 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -7,10 +7,14 @@ Dicas de depuração para desenvolvedores do Kernel Linux
 Guias gerais
 ------------
 
+.. toctree::
+    :maxdepth: 1
+
+    Guia de depuração do kernel com gdb <gdb-kernel-debugging>
+
 Todolist:
 
 *   driver_development_debugging_guide
-*   gdb-kernel-debugging
 *   kgdb
 *   userspace_debugging_guide
 
-- 
2.55.0

