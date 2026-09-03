Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898764E66A4;
	Thu,  3 Sep 2026 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450534; cv=none; b=dd1gLqOaKoY5/JwExZCUIRCZQ3zklpklOFyALTuSmBJdGQ99OckKNSPBkDtrvQaToHMFQ5C4H3th+T+YPWIi0saIzBWTTPQOqrLJm6gPqNg+OqAOKGFgGFHw8K11T6c2XN763ECGpGj68C0liW9Nypxp5o024m+J7Cidl2+/+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450534; c=relaxed/simple;
	bh=9LcJdngf59ejuQ0Ec2ZiDfsGu6VLWow6ZZNLs/T9cGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZEEgFgm7b0k8+/sJDJ6NklkH6C6WFUCC+mC/pFvcYGF8w7Jwcpg4Ax9iPOuCw3i0L9U4h65GObDVE0NE46F3d9vQgNhJlBWx0t6+On6oSqf4lF2DPP9rivEHJiwhMxaYGnnJ+yTBtJlS9izxffMmsLKh5RJXpVzhlLnObxCgQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hzd5FOnz; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jh4EPZ8X; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hzd5FOnz";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jh4EPZ8X"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hbPCH3Z8fzMlN5;
	Thu, 03 Sep 2026 17:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788450523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LN4TTjsQ9JoZgSfygMV13r66ZZvngAgYJdgxhZ2BMQs=;
	b=hzd5FOnzwECux1EuRF70piosSX06JpxU6WfOc6xM3XVJvuh9GjTebR3KHtfP1ETQKH35/V
	NLoaYNN1FcU/WlTKs3QKHgrA5KO613SqG0jlkSrcLx9Rqmk4UTBa21b5A12FToI3mPj4sD
	9SJyL5cCi+rsHQiwOy7xnK1fqh+sER/8QxHPmv0Bry5MvJw9yCtAFzfCTLNpFXbhhGMC2E
	wIe4we9WES22hPZbdT0957P8YCJvn8x5ICl1fSmLTpE1YCSbw8mchcQU/IADQT4yP64KYr
	Qy2TIPCnFA2r/JeToT0sd7Y8K9C+jnlfA0n1+7ivXHTckxfJuA+OhuSg7drQ9w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=jh4EPZ8X;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788450521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LN4TTjsQ9JoZgSfygMV13r66ZZvngAgYJdgxhZ2BMQs=;
	b=jh4EPZ8XqioUPD+ZaUdcZd5k5dK6pQB6whK22IdKCEsBCeb+ogBVKZ8V8z/0WYAg5pjpH9
	cw0kH6AZwSuNQMyFLQLsMndJmSy2ETepU5EHrZzqmY74AANstUxkAi9TbiTYA36l1Z9nop
	cuBRULKvMOlUKSGkFKFhpxIk/0PUWDB1Z6g0nPciVyB9Y6yt+tGQoy1PBt4HIh8zCyag//
	lH2JfKPQe/xFsUd9/CeGhqSZN0a2/NbEY1Pa5JiMAPxRbdWJogPUENwBI6XzyoXX7ZXtD9
	W0nXgEAECKVCPp7S+vOmXWb0PuCQ3qA0XH7TrC0nxjVTiQFYgx15Xj9/o94eHA==
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: verify/bisect: fix typos, formating and punctuation
Date: Thu,  3 Sep 2026 17:43:36 +0200
Message-ID: <20260903154336.732305-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gu7ychr15pib9sbxd79ytdcumrfd98u9
X-MBO-RS-ID: de8e29818527fd920e2
X-Rspamd-Queue-Id: 4hbPCH3Z8fzMlN5

Improve readability.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---

[v3]
 + incorporate Thorsten's suggestions

[v2]
 https://lore.kernel.org/all/20260902115121.687986-2-manuelebnerli@mailbox.org/
 + one more 'your' -> 'you'
 + 'it'
 + incorporate Randy's suggestions
    https://lore.kernel.org/all/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/
 + Reviewed-by: Randy Dunlap

[v1]
 https://lore.kernel.org/all/20260829055501.581856-2-manuelebnerli@mailbox.org/

---
 .../verify-bugs-and-bisect-regressions.rst    | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 7d38393f3..91ebb631a 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -163,7 +163,7 @@ will be considered the 'good' release and used to prepare the .config file.
      section 'Complementary tasks: cleanup during and after the process'
      below.
 
-  d) Once your finished the bisection, put a few things away::
+  d) Once you have finished the bisection, put a few things away::
 
        cd ~/linux/
        git bisect log > ~/bisect-log
@@ -178,9 +178,9 @@ will be considered the 'good' release and used to prepare the .config file.
        ./scripts/config --set-str CONFIG_LOCALVERSION '-local-cafec0cacaca0-reverted'
 
     This is optional, as some commits are impossible to revert. But if the
-    second command worked flawlessly, build, install, and boot one more kernel
-    kernel; just this time skip the first command copying the base .config file
-    over, as that already has been taken care off.
+    second command worked flawlessly, build, install, and boot one more kernel;
+    just this time skip the first command copying the base .config file over,
+    as that already has been taken care off.
 
 * **Complementary tasks**: cleanup during and after the process.
 
@@ -229,10 +229,10 @@ depends on your issue:
 Execute all steps till the end of *segment 1* to **verify if your kernel problem
 is present in code supported by Linux kernel developers**. If it is, you are all
 set to report the bug -- unless it did not happen with earlier kernel versions,
-as then your want to at least continue with *segment 2* to **check if the issue
+as then you want to at least continue with *segment 2* to **check if the issue
 qualifies as regression** which receive priority treatment. Depending on the
 outcome you then are ready to report a bug or submit a preliminary regression
-report; instead of the latter your could also head straight on and follow
+report; instead of the latter you could also head straight on and follow
 *segment 3* to **perform a bisection** for a full-fledged regression report
 developers are obliged to act upon.
 
@@ -550,7 +550,7 @@ be a waste of time. [:ref:`details <introlatestcheck_bisref>`]
       cd ~/linux/
       git switch --discard-changes --detach stable/linux-6.1.y
 
-    Your series is unsupported, if is not listed or carrying a 'end of life'
+    Your series is unsupported if it is not listed or it is carrying a 'end of life'
     tag. In that case you might want to check if a successor series (say
     linux-6.2.y) or mainline (see next point) fix the bug.
 
@@ -1183,9 +1183,9 @@ Space requirements
 The numbers mentioned are rough estimates with a big extra charge to be on the
 safe side, so often you will need less.
 
-If you have space constraints, be sure to hay attention to the :ref:`step about
-debug symbols' <debugsymbols_bissbs>` and its :ref:`accompanying reference
-section' <debugsymbols_bisref>`, as disabling then will reduce the consumed disk
+If you have space constraints, be sure to pay attention to the :ref:`step about
+debug symbols <debugsymbols_bissbs>` and its :ref:`accompanying reference
+section <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
 space by quite a few gigabytes.
 
 [:ref:`back to step-by-step guide <diskspace_bissbs>`]
@@ -1254,8 +1254,8 @@ distributions:
       kernel-install-tools libelf-devel make modutils openssl openssl-devel \
       perl-base zlib-devel rpm-build ncurses-devel qt6-base-devel
 
-These commands install a few packages that are often, but not always needed. You
-for example might want to skip installing the development headers for ncurses,
+These commands install a few packages that are often, but not always needed. For
+example, you might want to skip installing the development headers for ncurses,
 which you will only need in case you later might want to adjust the kernel build
 configuration using make the targets 'menuconfig' or 'nconfig'; likewise omit
 the headers of Qt6 if you do not plan to adjust the .config using 'xconfig'.
@@ -1407,7 +1407,7 @@ Occasionally odd things happen when trying to use a config file prepared for one
 kernel (say 6.1) on an older mainline release -- especially if it is much older
 (say 5.15). That's one of the reasons why the previous step in the guide told
 you to boot the kernel where everything works. If you manually add a .config
-file you thus want to ensure it's from the working kernel and not from a one
+file you thus want to ensure it's from the working kernel and not from one
 that shows the regression.
 
 In case you want to build kernels for another machine, locate its kernel build
-- 
2.54.0

