Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5674DF4DC;
	Wed,  9 Sep 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961430; cv=none; b=OTig05ovN0DU83aZ8j6Cm7eURE8WknLBBoe5/scdJ0rTVKBvfhm3Vaq1yUKX6yn+jaHDpsK9GHyZtLYqMF50Qs4+tkmE1MTEo2tBtrghzG2M6hwkQKoaRxoIOj3DGuW8yQ0yxG+3XvWsyLtMg0iik2RuPBJscJ8Kadg6npIh5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961430; c=relaxed/simple;
	bh=lGZMY+3lAngy6LJnPBj5kG3thttQubogRdMtqJgJ8SY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVDIDyTEIFDPJFjv6A7YyBK9LtVPid6yFs9lAdBs5tqbGtqcJkTm7Indk7wkvAh3H+lhcdqLS425xzcQGuZvTEAhxpc7TzgCHgZMQ9zms5D2X6G78Nkv5XHR4piETE404IHA6NRvrqeGnGTuivYrSmON98XP/dvi+jAWBs2dAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K4De/OwX; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g+nPYSIw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K4De/OwX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g+nPYSIw"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hg28D34d5zMlJn;
	Wed, 09 Sep 2026 15:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788961420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=173Ob8EsXjCsDgI7WafhFI278v9VXpWYuN1ryz1+J+U=;
	b=K4De/OwXl48mVzuflGWaba+fk06HgvVNc0iCVeoYOVFA9DZw5JpFP+k4tTFeLv3QI9jZVz
	IcohJzScDD/EYDL5HPDgA1GHx5u5LLuaEBbC00OFsxp5K2xKk/AJ8HoNysdiY5D4n9+ZbH
	/pPvskHWLBN82JCoduTaSP5WSvQIl4+Q/xAFYmQt9tAyHIIlaWyyLOiTRv2NY4IonbQnQz
	D0XhAhCtasOu9xS+NUmuzfNCeqRKYQB5QI3EwEc/oscJKbIYMFfmgjWAUp+AgHbc0ZmncO
	UbBSGXXkGvJvLpWw7v88G0oPv/K+3MDfWMuD1Rx5Y1k4ehofZH+wjTlOq8mjOA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788961418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=173Ob8EsXjCsDgI7WafhFI278v9VXpWYuN1ryz1+J+U=;
	b=g+nPYSIwxmHjahoNqvWsMcrreHe343Hb7STFC/W8arrY2azmdbjDK4LhO13PLoSw0/THOE
	aINPRGGnzCeBYx0BHRTl/0rxTFaGQJGhLxy/DUx90YOgOnQXPWdpxlL7hu7w3FKmpMZZ6H
	9dEEeSEV4fPzK0M4B3lZBhwrijgjOMs2RJbgNem98tcGHx4MMIH7salfAfJjlABo6VvOpQ
	nr64058IRXEdP9fMGVcNic2PX4PCETOLhT7S+DcMFHj2NN+Bg90JV+Jy3haQR4APA/tunC
	Y5dDRqjmp5Fn8jPwjXrCbHtvz8OSBDzb7ohcX/B2ZsIPDoeOHeqlWvrGPlPSZA==
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] docs: verify/bisect: fix typos, formatting and punctuation
Date: Wed,  9 Sep 2026 15:41:34 +0200
Message-ID: <20260909134135.1358766-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: k5469s64fh6efpaitdjkyqji9ieze3ks
X-MBO-RS-ID: 93e1a78525eec12d051

Fix a few typos, formatting and some grammar issues.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Thorsten Leemhuis <linux@leemhuis.info>
---
[v5]
 - fix changelog

[v4]
 https://lore.kernel.org/all/20260904114606.756700-3-manuelebnerli@mailbox.org/
 - remove 'Reviewed-by: Randy Dunlap'

[v3]
 https://lore.kernel.org/all/20260903154336.732305-3-manuelebnerli@mailbox.org/
 + incorporate Thorsten's suggestions

[v2]
 https://lore.kernel.org/all/20260902115121.687986-2-manuelebnerli@mailbox.org/
 + one more 'your' -> 'you'
 + 'it'
 + incorporate Randy's suggestions
    https://lore.kernel.org/all/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/
 + Reviewed-by: Randy Dunlap (added by mistake)

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

