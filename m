Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7747D921;
	Wed,  2 Sep 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350236; cv=none; b=qWXwayAsL7PZ42W+Aoy7JxbQBydv4ENRR9kwmHvg5QvP6ujlvkuyrrdWq8dqp3dZor23D4YooNYGm9BCbmw613ZGu0/Bj3Fa8Ncp2I/Lxy7R2hJv2t6UOLz7B/59rTN7+h1Ml34aB2G6jEw0eAMiKqvdHMokSpqNtJjn3CSav7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350236; c=relaxed/simple;
	bh=ftZRUVJZfjss2duRNkuAguYBd15Jr8SHSTMJsa0ZVhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gx7oltuc59XyLNFpwGWt06x7yweiJozkvfs4odn/1kSnuJLbw3S/GSi8qjOINjNV8X1QzohEIcDuyc3zZsiZyEtLubcLSoiws1hZUKBGPkFgmob+CYbIqP0J2qr4OOhDevWVtM3ujFt54xB4w+/+OBL1f3bGvK3Jo7oyzlZH2Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BscPMFc8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aScso83l; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BscPMFc8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aScso83l"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hZh683tGgz8tCW;
	Wed, 02 Sep 2026 13:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788350208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jbpGG5XSRwwmpQZAzirJeCrpQQmqAFe9GjwgzU8mklg=;
	b=BscPMFc807SzH/aq4w6Ka4kf6gwP20WWJqDdhiXJJSuofp+9Sz/lR6m2gF7vpoxyL9x1P4
	JAeZjYeaWtcFR3R+LCnyljRYOn4ehhWbiCYLy6kuQEWTC1uFdI7b5EFdO6z6/xIB3bE747
	/oPIBlgaUGz2n+sLRvBAv9rQs51A+4zCmeGNKJR3JiekFsu373ikB6a6REr3Mv390vrpLq
	Sdk8fgiiRJhEZ/AyBvOPToi8uQ1e2fjZgXK9OuyH17GzV5wVKxJKLR6TEZus6ScxtRENZp
	ZAXSN0iKuIqeMtrLL0D35D9Pbh9Hi5ntiTBtc5Sc2KUAxXTZkv18z2i2GwPBlQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788350206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jbpGG5XSRwwmpQZAzirJeCrpQQmqAFe9GjwgzU8mklg=;
	b=aScso83lUCEYYE+KAkd/+wpu04UAAe+S8HkR2Dd4BdknpvY476yZ4cXmzME1c8XsnBZbmE
	t33mPCYXsug7lZfYz4wNtmVnrYWfRYRNODRfoJqhMk9pHVXWASOvnehcY1wLwxkDY4jAQN
	0RC5x6VLw6UXg4TsKYXYQIwr5UH3duq9y36Ba57VfCeMnn8Vn88d0qyUi8jqdaZ/s1JXD6
	q3KIl6wrnJj7raftPx7iaG2KdUufRB7wV5MuCTsI9/66A/3DkWlrp0Zhni6Td3fTk44UIw
	IwyyXl6Te3hqVuqDqI/cA/uQrHtR1XBnKtSfAtw8LbbuefWY1zGkCkkgX8owFw==
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: verify/bisect: fix typos
Date: Wed,  2 Sep 2026 13:51:21 +0200
Message-ID: <20260902115121.687986-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fk1nm8t4cd3y5as9dztho6ujmug38c68
X-MBO-RS-ID: bf19591de3cd9350d87

'your' -> 'you have'
'kernel kernel' -> 'kernel'
'your' -> 'you' twice
'if is not listed' -> 'if it is not listed'
'hay attention' -> 'pay attention'
remove needless "'" in sphinx link
'as disabling then will reduce the consumed disk space'
              vvvv
'as disabling them will reduce the consumed disk space'
'You for example might' -> 'For example you might'
'and not from a one that' -> 'and not from one that'

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
[v2]
 + one more 'your' -> 'you'
 - 'it'
 + incorporate Randy's suggestions
    https://lore.kernel.org/all/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/
 + Reviewed-by: Randy Dunlap

[v1]
 https://lore.kernel.org/all/20260829055501.581856-2-manuelebnerli@mailbox.org/

Wouldn't it make sense to add how to skip pure documentation and formating
commits? Commits like this one. Or is it better to keep the document short
and simple - which it already isn't anymore.
---
 .../verify-bugs-and-bisect-regressions.rst    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 7d38393f31f..9296e3f5410 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -163,7 +163,7 @@ will be considered the 'good' release and used to prepare the .config file.
      section 'Complementary tasks: cleanup during and after the process'
      below.
 
-  d) Once your finished the bisection, put a few things away::
+  d) Once you have finished the bisection, put a few things away::
 
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
+    Your series is unsupported, if it is not listed or it is carrying a 'end of life'
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
+example you might want to skip installing the development headers for ncurses,
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

