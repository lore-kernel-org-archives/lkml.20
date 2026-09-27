Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF053822B5;
	Sun, 27 Sep 2026 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503489; cv=none; b=KZY1P74i4BPDynX9fRJLLKOA8/jK2ks+iL/W593Y2q9Ql5KTx9xxkjp0AqE3ebpkFJzBy/CMgz1BYvjJ+ZL3ZsGVs43CHFIby2lHdDmxpAVLXimxhzSnftTz+pO0ReJsVenOlIN+JzvL91pan4Q5VRC2X/rr80bTW76uNxXAaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503489; c=relaxed/simple;
	bh=90xiEUN5KxiDaoM/U66Fsk+6l5IYVxSniyU3Z6JsKjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgMQSO9OX5c1hMjaIfGewWo2o6ltp2TQHCGvzbyJtVKZNMH5c5BwqtSAJBwuH2tkig3EHdg83JF7oLLB9ce7sExP9lYffd5dJOgfX7HC0JnxlUvH64ZSb9fGAsyYcDs869JTxNbJpeNG8JBCFt4tgLobtlBxOo04Tan/W6Ea0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FNe1PY63; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FNe1PY63"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ht0FF5bG3zKmTP;
	Sun, 27 Sep 2026 11:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790502961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f1pVNscHFIFNHSERIixqOv7sH99O3Iy1QxsB/idegdQ=;
	b=FNe1PY63MqXFR4UUUL2nvMy1pTF7T6lkhahv8vAs5e+Ldyo+ixaw5v0a2yjxHV7XuD430n
	VDqN9ux3lt649BNAsnN54m6idRr+a9erYyc1v9dMTSvTrES6WGtDnyaUgc2ZwRf75tp8Uu
	nKD8DIkSUx4nZqFepE2bBIdFlbO7UhuQk1pm/GWbm1pw4Eegpo9HRXCBAa8fhkyHB31DZe
	h/KJl9xar6j+dTn12i83LDw0rcV4lt2k8ZT81Z1o7bKdWZbRXbDrxRZVIAh2QJFnOyWDrN
	l1cc7Wpmzo263X5ZsBFboCsFwvxiifME4xyHPtFC0CACCk69Np3661ZSYq1onw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 RESEND] Docs: changes.rst: Refine language
Date: Sun, 27 Sep 2026 11:53:18 +0200
Message-ID: <20260927095318.1077890-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7b195pnibdcfoxxtxzfdyodxwazuqtys
X-MBO-RS-ID: 626fd30a7934801542a

This document grew over the years and isn't limited to compilling or
running the kernel anymore. Update the heading and intro accordingly.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
[v3]
 - improved commit message
 - removed other patches from this series, they are due later.
   [original SEND] https://lore.kernel.org/all/20260905055655.789265-2-manuelebnerli@mailbox.org/

[v2]
 - no change to this patch
 https://lore.kernel.org/all/20260831152607.639027-2-manuelebnerli@mailbox.org/

[v1]
 https://lore.kernel.org/all/20260812121945.1635085-2-manuelebnerli@mailbox.org/
---
 Documentation/process/changes.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 0aa232b11..eb339eb8c 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -1,13 +1,14 @@
 .. _changes:
 
-Minimal requirements to compile the Kernel
-++++++++++++++++++++++++++++++++++++++++++
+Minimal requirements to interact with the Kernel
+++++++++++++++++++++++++++++++++++++++++++++++++
 
 Intro
 =====
 
-This document is designed to provide a list of the minimum levels of
-software necessary to run the current kernel version.
+This document is designed to provide a list of the minimum versions of
+software necessary to change code, compile, install and boot the current
+kernel version.
 
 This document is originally based on my "Changes" file for 2.0.x kernels
 and therefore owes credit to the same people as that file (Jared Mauch,
-- 
2.54.0

