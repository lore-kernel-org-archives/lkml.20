Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3B94C6D;
	Sat, 29 Aug 2026 05:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983122; cv=none; b=OS/7tnw/THsAWjBPOP4AnG3QYU881bqiv9Huw70Farh7ecEO6noTFQQCuSLak6aOhK+VVNMa0BikPuwxg5r7gn0ztzxAhoBc6xhZ+04vAKNWGOu42JwHtsFa0p8MDIlOvr2YvNIdWFHJInjBbqMAT6yWu49LAGh+mt0pUtdPfoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983122; c=relaxed/simple;
	bh=/TxLx9J5HzwTXHednsjPDF2yi4h8t6ltsWbouvJbCI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4zfpWAbqyBGPuf6iglzunCVhKAFvcGXpQWbM4K7Ls4KhYzAlhWq3A0T5xUY+P4xwL7BptHCxu375y1E7RJ4oYjNDaU9yMFzgdNFfVAji0Z8Z3eq97lDzBkltd3b3jsqs+ZGk8v8t1tdzFs3hWiQgujr6S4ufTz4L0ogZC4/JbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EIrQnX+v; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wrrSrdmh; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EIrQnX+v";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wrrSrdmh"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hX4Lk0StNzKm6C;
	Sat, 29 Aug 2026 07:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787983118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KbPz2xBZoXJbUZ8oevv/a7H4ZD26uamS2HZqRDyGHTM=;
	b=EIrQnX+vB5+ICif9LopVFv3G6gozdFI4E3rm38LRWyIrWOaA6xvKdqbIXdgcE/sp59ywTF
	X9qA1dnS08QIYAP+NcXOzeh0mkX+scuUfKWkFhVI5Ld6HFo5vIB5xBf3H6yXm7gAZcDBe/
	5TWKi5o8kwcvpXx8JCADrYiGYUenwTQrGe9A/tU65HLTwJzhC5vqTUltBQdEoN1JuLMxa6
	EuPBw7G36y1SE2EC/r+JHDrg+9m6y4hEaBKSG5nBTS/3A6KorEZsohO2YLTNskUMOZeCHo
	0bNv/TQ6ochuSHjgyrJ2yozcXlI7yiKO5b8TwFNFVvkSWfNGHfuEz75qj2xS/Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wrrSrdmh;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787983116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KbPz2xBZoXJbUZ8oevv/a7H4ZD26uamS2HZqRDyGHTM=;
	b=wrrSrdmh8mIEhwXWMMMvcBL2xxHMCvVAKX3jwkstjoy/Qq6vi/df46mvYq3xcSVNqsrsni
	hHW+0HZMZlMIfyeSC1yzMEKC31p5QVX06e+gKksonO3hfL6mAoPd5JBFdKxFEEEB52ujDZ
	eBcjR0vlhMMiYttntmcmBbI23DIcZCMf1+t3C7Wb64M9GohCeHWtzaz9o7saeLWnX0VBIU
	afxmzuh2lOnfoKoN0ywNETltx9RrUD2V+anpkEP1cxE7AiVPCB60r4PURWozm9fIAM8gK0
	tH8jpv8FUOJB2RdsiLsYJcijZL/Co42DdTQuX2whjvtJGYAdBLSNKkmAcy2wmQ==
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: verify/bisect: fix typos
Date: Sat, 29 Aug 2026 07:55:00 +0200
Message-ID: <20260829055501.581856-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: w75a8zgrr8thaqrozii5me1zy55ypgsn
X-MBO-RS-ID: 9f0b2edf8c72a3bbaa8
X-Rspamd-Queue-Id: 4hX4Lk0StNzKm6C

'your' -> 'you' twice.
'kernel kernel' -> 'kernel'
'hay attention' -> 'pay attention'
'as disabling then will reduce the consumed disk space'
              vvvv
'as disabling them will reduce the consumed disk space'
'You for example might' -> 'For example you might'
'that create or modify' -> 'that creates or modifies'
'and not from a one that' -> 'and not from one that'

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
I could't figure out what the "'" is for, they do show up in the .html.
Would this be a sane change?

@ -1186,4 +1186,4 @@ safe side, so often you will need less.
 If you have space constraints, be sure to pay attention to the :ref:`step about
-debug symbols' <debugsymbols_bissbs>` and its :ref:`accompanying reference
-section' <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
+debug symbols <debugsymbols_bissbs>` and its :ref:`accompanying reference
+section <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
 space by quite a few gigabytes.
---
 .../verify-bugs-and-bisect-regressions.rst    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 7d38393f31f..43e15b16894 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -163,7 +163,7 @@ will be considered the 'good' release and used to prepare the .config file.
      section 'Complementary tasks: cleanup during and after the process'
      below.
 
-  d) Once your finished the bisection, put a few things away::
+  d) Once you finished the bisection, put a few things away::
 
        cd ~/linux/
        git bisect log > ~/bisect-log
@@ -178,8 +178,8 @@ will be considered the 'good' release and used to prepare the .config file.
        ./scripts/config --set-str CONFIG_LOCALVERSION '-local-cafec0cacaca0-reverted'
 
     This is optional, as some commits are impossible to revert. But if the
-    second command worked flawlessly, build, install, and boot one more kernel
-    kernel; just this time skip the first command copying the base .config file
+    second command worked flawlessly, build, install, and boot one more kernel;
+    just this time skip the first command copying the base .config file
     over, as that already has been taken care off.
 
 * **Complementary tasks**: cleanup during and after the process.
@@ -232,7 +232,7 @@ set to report the bug -- unless it did not happen with earlier kernel versions,
 as then your want to at least continue with *segment 2* to **check if the issue
 qualifies as regression** which receive priority treatment. Depending on the
 outcome you then are ready to report a bug or submit a preliminary regression
-report; instead of the latter your could also head straight on and follow
+report; instead of the latter you could also head straight on and follow
 *segment 3* to **perform a bisection** for a full-fledged regression report
 developers are obliged to act upon.
 
@@ -1183,9 +1183,9 @@ Space requirements
 The numbers mentioned are rough estimates with a big extra charge to be on the
 safe side, so often you will need less.
 
-If you have space constraints, be sure to hay attention to the :ref:`step about
+If you have space constraints, be sure to pay attention to the :ref:`step about
 debug symbols' <debugsymbols_bissbs>` and its :ref:`accompanying reference
-section' <debugsymbols_bisref>`, as disabling then will reduce the consumed disk
+section' <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
 space by quite a few gigabytes.
 
 [:ref:`back to step-by-step guide <diskspace_bissbs>`]
@@ -1254,8 +1254,8 @@ distributions:
       kernel-install-tools libelf-devel make modutils openssl openssl-devel \
       perl-base zlib-devel rpm-build ncurses-devel qt6-base-devel
 
-These commands install a few packages that are often, but not always needed. You
-for example might want to skip installing the development headers for ncurses,
+These commands install a few packages that are often, but not always needed. For
+example you might want to skip installing the development headers for ncurses,
 which you will only need in case you later might want to adjust the kernel build
 configuration using make the targets 'menuconfig' or 'nconfig'; likewise omit
 the headers of Qt6 if you do not plan to adjust the .config using 'xconfig'.
@@ -1365,7 +1365,7 @@ Start defining the build configuration for your kernel
   *Start preparing a kernel build configuration (the '.config' file).*
   [:ref:`... <oldconfig_bissbs>`]
 
-*Note, this is the first of multiple steps in this guide that create or modify
+*Note, this is the first of multiple steps in this guide that creates or modifies
 build artifacts. The commands used in this guide store them right in the source
 tree to keep things simple. In case you prefer storing the build artifacts
 separately, create a directory like '~/linux-builddir/' and add the parameter
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

