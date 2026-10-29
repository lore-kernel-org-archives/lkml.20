Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265982;
	b=VrRYeiLkyblvksGhNbbvriyN7n1bOAIA0ve/wLJ9jCPMIIjzFPrn2FO6OSE3CRr9H3HO
	 q2oWmAxg5aFp+i5XgeIzFz+nRs3z+nX9lGhaz2lkSAXfTrbiB8gti4aNAhXkfvUMGX2pl
	 DNas7zefk49YUAtxTCBr/KsRHJPwTj7X7gyJhTh8PYyDoazOwnG75ksiF97YDZtAazC6B
	 HvtAtpHcxFajzBKWLnIKWdXHKp1t8Rvu/U2r/Bihe9ve7bmJOBIgksktCiQiNFlKFbpkc
	 0ruiq6YfhnBKthCDQXMDYPwWYir+dvb+qjdh0LRFXJ2QJGbWjXB1zArzug4vhWDAR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265982;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=tAQEh4b++pVve/ioXaXSgT5PVOtBYojYtT+jFL5BfII=;
	b=jKczOhBTcO4kA7qo7FNjINNKREJtmxPfEp84+O4YaGYG8wWvYIP4+g5jIRJkNwSDxT1o
	 JPpFz64OgwuuswT3jBBNiTy10a0xHw+m98JGi21NLy649SW3t7BZ8sVowaz/5x7m4GzSh
	 V+Fxm+YZ6vhoHFdEZFk6+6gQK5kiAVOwXr6Yfl/VNpHXgKMEN+3eB+LKOdtFwSuAhchwV
	 ki4pOZnk7AWmQELHRH+0rTOPxW54UbdNzzx5EM3J7Lp8kNzAHL3q0eCTuF0ZSsGVlbQIs
	 3J/hLqLjvHfpOW0TgWkmz/QHYqqCszaBYdUlZ16v0DyrVShMuu1yCAdV9SU8vmEJsxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.80
Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2182606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2182606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1FtM7Migx9dzZdG1vymUR6EU2ZfvoOws1XUBq1EJFgU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793265978; v=1; x=1793870778;
 b=SkjL1+GtO7rI3G2LWL3DxmeoGrRLUOCOcMWmofzDgEMK2s1DCz5PMtrMz9Pwlx3A4/xdIOvn
 2f49bHUObuuM095Pkg8maz2XwdVoL5mcUSA4Vl/7r8++6fwT5VRoxKys6U1nCfrKhqSgnxbZ44g
 pnBqdLKoCML8kRdOTtrELts6wSLES/syCfbpYbHnjlbpPcAHKcOHI35CpoFz7fM5FPMieMOhX9I
 wBB8dJpyBivkLlWoPTvGeU7jhHhk7hxWuLv7JOYPdEjhhu0j3kSh5LNFD9rAgUMjTF1uPhCQZYY
 7s9468U/k/UyyzYb7amuvNwBTgH850StfOcSS219JVKTg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a6f7e260be4e957a;
	Thu, 29 Oct 2026 09:26:18 +0000
X-Mizu-Trace-ID: a6f7e260be4e957a
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 17:26:04 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs/zh_TW: remove top-level labels from process/
Message-ID: <f851e36f0ca9db7a0f71200964fe97a2efa85c13.1793265072.git.wy@wyuan.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

I happened to notice that there was actually an embarrassing label on
this page [*] that had been rendered in HTML.

 * https://docs.kernel.org/translations/zh_TW/process/kernel-enforcement-statement.html

Therefore let me drop these labels in process dir but leave the cleanup
job later.

--- >8 ---
From: Weijie Yuan <wy@wyuan.org>

We can link to these documents by path, so the top-level labels
do not buy us anything.

Drop these redundant labels from the Traditional Chinese process
documents.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---

 * Tested with '(make cleandocs && make htmldocs) 2>&1 | grep -F -e zh_CN -e zh_TW'
   seems work fine. But please leave an eye on this if available.

 * Based on these series on top of Alex's docs-next branch..
   - [v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
   - [0/4] docs/zh_TW: relocate translations to follow the English layout
   - [1/1] docs/zh_TW: remove the unreachable plain-text translations
   - [0/3] docs/zh_TW: mark translations that are not kept in sync

   which are currently queued here for 7.5:
   https://github.com/kernel-zh/linux-zh_TW.git docs-next

 Documentation/translations/zh_TW/process/1.Intro.rst            | 2 --
 Documentation/translations/zh_TW/process/2.Process.rst          | 2 --
 Documentation/translations/zh_TW/process/3.Early-stage.rst      | 2 --
 Documentation/translations/zh_TW/process/4.Coding.rst           | 2 --
 Documentation/translations/zh_TW/process/5.Posting.rst          | 2 --
 Documentation/translations/zh_TW/process/6.Followthrough.rst    | 2 --
 Documentation/translations/zh_TW/process/7.AdvancedTopics.rst   | 2 --
 Documentation/translations/zh_TW/process/8.Conclusion.rst       | 2 --
 .../zh_TW/process/code-of-conduct-interpretation.rst            | 2 --
 Documentation/translations/zh_TW/process/code-of-conduct.rst    | 2 --
 Documentation/translations/zh_TW/process/coding-style.rst       | 2 --
 .../translations/zh_TW/process/development-process.rst          | 2 --
 Documentation/translations/zh_TW/process/email-clients.rst      | 2 --
 Documentation/translations/zh_TW/process/howto.rst              | 2 --
 Documentation/translations/zh_TW/process/index.rst              | 2 --
 .../translations/zh_TW/process/kernel-driver-statement.rst      | 2 --
 .../translations/zh_TW/process/kernel-enforcement-statement.rst | 2 --
 Documentation/translations/zh_TW/process/license-rules.rst      | 2 --
 Documentation/translations/zh_TW/process/management-style.rst   | 2 --
 .../translations/zh_TW/process/programming-language.rst         | 2 --
 .../translations/zh_TW/process/stable-api-nonsense.rst          | 2 --
 .../translations/zh_TW/process/stable-kernel-rules.rst          | 2 --
 Documentation/translations/zh_TW/process/submit-checklist.rst   | 2 --
 Documentation/translations/zh_TW/process/submitting-patches.rst | 2 --
 .../translations/zh_TW/process/volatile-considered-harmful.rst  | 2 --
 25 files changed, 50 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 65c5ae095504..0c1c6709b1cb 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/1.Intro.rst <development_process_intro>`
 
-.. _tw_development_process_intro:
-
 引言
 ====
 
diff --git a/Documentation/translations/zh_TW/process/2.Process.rst b/Documentation/translations/zh_TW/process/2.Process.rst
index cf9bd1b1444a..85e1444b3be6 100644
--- a/Documentation/translations/zh_TW/process/2.Process.rst
+++ b/Documentation/translations/zh_TW/process/2.Process.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/2.Process.rst <development_process>`
 
-.. _tw_development_process:
-
 開發流程如何進行
 ================
 
diff --git a/Documentation/translations/zh_TW/process/3.Early-stage.rst b/Documentation/translations/zh_TW/process/3.Early-stage.rst
index 7d7ecf9658e5..be3dadcf1663 100644
--- a/Documentation/translations/zh_TW/process/3.Early-stage.rst
+++ b/Documentation/translations/zh_TW/process/3.Early-stage.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/3.Early-stage.rst <development_early_stage>`
 
-.. _tw_development_early_stage:
-
 早期規劃
 ========
 
diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
index 423d51f4b3de..982735fd6134 100644
--- a/Documentation/translations/zh_TW/process/4.Coding.rst
+++ b/Documentation/translations/zh_TW/process/4.Coding.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/4.Coding.rst <development_coding>`
 
-.. _tw_development_coding:
-
 使代碼正確
 ======================
 
diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
index d54b16364474..ba3b8a79f21a 100644
--- a/Documentation/translations/zh_TW/process/5.Posting.rst
+++ b/Documentation/translations/zh_TW/process/5.Posting.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/5.Posting.rst <development_posting>`
 
-.. _tw_development_posting:
-
 發布補丁
 ========
 
diff --git a/Documentation/translations/zh_TW/process/6.Followthrough.rst b/Documentation/translations/zh_TW/process/6.Followthrough.rst
index 76082a15677f..e9a70eec850c 100644
--- a/Documentation/translations/zh_TW/process/6.Followthrough.rst
+++ b/Documentation/translations/zh_TW/process/6.Followthrough.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
 
-.. _tw_development_followthrough:
-
 跟進
 ====
 
diff --git a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
index 392c00213078..fb2e3764802f 100644
--- a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/7.AdvancedTopics.rst <development_advancedtopics>`
 
-.. _tw_development_advancedtopics:
-
 進階主題
 ========
 
diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index 2436263c6506..82e89d992964 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
 
-.. _tw_development_conclusion:
-
 更多資訊
 ========
 
diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index 4fc568409198..fbb9fb719b19 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
 
-.. _tw_code_of_conduct_interpretation:
-
 Linux核心貢獻者契約行為準則解釋
 ===============================
 
diff --git a/Documentation/translations/zh_TW/process/code-of-conduct.rst b/Documentation/translations/zh_TW/process/code-of-conduct.rst
index 0266cd74a0b1..4db8ddc71474 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/code-of-conduct.rst <code_of_conduct>`
 
-.. _tw_code_of_conduct:
-
 貢獻者契約行爲準則
 ++++++++++++++++++
 
diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index 5778b707503f..166b952cb54e 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -4,8 +4,6 @@
 
 :Original: Documentation/process/coding-style.rst
 
-.. _tw_codingstyle:
-
 Linux 核心程式碼風格
 ====================
 
diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 1d22aa0d3711..e3e69882d8f6 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
 
-.. _tw_development_process_main:
-
 內核開發過程指南
 ================
 
diff --git a/Documentation/translations/zh_TW/process/email-clients.rst b/Documentation/translations/zh_TW/process/email-clients.rst
index 272e3073521d..7a5cf79fe4f9 100644
--- a/Documentation/translations/zh_TW/process/email-clients.rst
+++ b/Documentation/translations/zh_TW/process/email-clients.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-.. _tw_email_clients:
-
 :Original: Documentation/process/email-clients.rst
 
 Linux郵件客戶端設定資訊
diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 1ffc076ce26c..46c7a63398f7 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. _tw_process_howto:
-
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/howto.rst <process_howto>`
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index bd638264bbe4..b27af36ce3bb 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -9,8 +9,6 @@
 
 :Original: :ref:`Documentation/process/index.rst <process_index>`
 
-.. _tw_process_index:
-
 ========================
 與Linux核心社群一起工作
 ========================
diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
index 34bcb6f164cb..e6ff67f75650 100644
--- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. _tw_process_statement_driver:
-
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
index d54d20529294..45bb50fd1e6a 100644
--- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-﻿.. _tw_process_statement_kernel:
-
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
diff --git a/Documentation/translations/zh_TW/process/license-rules.rst b/Documentation/translations/zh_TW/process/license-rules.rst
index 0a4558b7fc76..8f9b57e223a7 100644
--- a/Documentation/translations/zh_TW/process/license-rules.rst
+++ b/Documentation/translations/zh_TW/process/license-rules.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
 
-.. _tw_kernel_licensing:
-
 Linux核心許可規則
 =================
 
diff --git a/Documentation/translations/zh_TW/process/management-style.rst b/Documentation/translations/zh_TW/process/management-style.rst
index 2cef0ef25ede..9908724e37a2 100644
--- a/Documentation/translations/zh_TW/process/management-style.rst
+++ b/Documentation/translations/zh_TW/process/management-style.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/management-style.rst <managementstyle>`
 
-.. _tw_managementstyle:
-
 Linux內核管理風格
 =================
 
diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
index 9aac89e2c23b..04ad22a25a4e 100644
--- a/Documentation/translations/zh_TW/process/programming-language.rst
+++ b/Documentation/translations/zh_TW/process/programming-language.rst
@@ -4,8 +4,6 @@
 
 :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
 
-.. _tw_programming_language:
-
 程式語言
 ========
 
diff --git a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
index 94748429c182..2e82df8544ef 100644
--- a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
+++ b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. _tw_stable_api_nonsense:
-
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/stable-api-nonsense.rst
diff --git a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
index d182d625728d..bd0a1599dbff 100644
--- a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
+++ b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. _tw_stable_kernel_rules:
-
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index 452fecc7c425..f5b2cb56eec4 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -4,8 +4,6 @@
 
 :Original: Documentation/process/submit-checklist.rst
 
-.. _tw_submitchecklist:
-
 Linux內核補丁提交檢查單
 ~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
index 514903daae25..967e558350c0 100644
--- a/Documentation/translations/zh_TW/process/submitting-patches.rst
+++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-.. _tw_submittingpatches:
-
 :Original: Documentation/process/submitting-patches.rst
 
 提交補丁：如何讓你的改動進入核心
diff --git a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
index edfc83f32672..a2384b60b874 100644
--- a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
+++ b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
@@ -1,7 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. _tw_volatile_considered_harmful:
-
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/volatile-considered-harmful.rst
-- 
