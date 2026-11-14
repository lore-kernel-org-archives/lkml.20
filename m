Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660586;
	b=bYjPDi1JCE+KZPBoLbnk2YnX3sys7iZnCgsYK4vguP5CdSBmSuw0Ps6h5JjBhznEqton
	 I1rSAxkSgpN8c78/XWWI1bzyIcFf2sVqi8lTgyQ6W7ta1AHN9FzP1nOQ0oa1m1oXiExkq
	 vD0/GZgy3r8gjxRJBF34g+SLEiXYvsiOzKPRZA9Be9LNodW6Qx0pVJNmNpcuF1NYks3+X
	 ibV/TpezGbaNrxnKlAxDxvqgFqZq91BuWo6iSXN+RXXBUNYSa45oP8MBkHXulRzOnJYMR
	 ghGiHBSJToVGNde5cccanZMTmvN175DqhptjWAGj1qW9Di5FzDUUSZdbzU0zebBSquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660586;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=KEM4YGG5ygN17VLr1WQz2hJ2gZgDzlnIP8CmpPo1DiY=;
	b=xdXbyN7zuT6/M0d605d5tO85eZf87yzvwDIxgIuY/5Y/FkrILyvC1nE0bkZoQ3/8c/Nd
	 5gT2z4OKSM+Uoqr2ouK4NtRdWrfbRqAWwz9ehnZ4aOpBLDDuT+K5YnjP618TQ4em91gZR
	 H/zB0KQ8owSmCQBD+882rDl4NDkEJXN2m/eZuvHpkZIFi4gZ1hpUKx6DLjtwHUQojQVJ1
	 xzmOrpOXqEo6IwQWArp8c8H1SCy27M5v99ajYaZyfh3xC/0DOj4ZTz9lXkoPGv4PdI6hd
	 KlY/8WGhhf9SIaLa3lNo/JkfcRwPJV6L8SkSFWUzdZT6j38hYZIEFpRxcyf7TYuY35g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=TLya7g0i;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84663606A329;
	Sat, 14 Nov 2026 12:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84663606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=TLya7g0i
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jRYqT15R5zKp8n;
	Sat, 14 Nov 2026 13:49:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794660581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KEM4YGG5ygN17VLr1WQz2hJ2gZgDzlnIP8CmpPo1DiY=;
	b=TLya7g0iYN9dKmG34UTsq+6tYGcAb8vHzj7rq7tJS8/hklsaLpPMhqrjepRvDCDHFhj4ur
	qlab3jeWSCTUQ3zHPuRfknKyUpRbe+8JGNN6BNsJRnpiozrGrJspfA//W2/Wlh9HJtrAQV
	84h1a3k44veaPPnSWCv2mwFUJjiKacaHeq+ao0gn+276jqsp6lIUHYbECm2/m8Vp+G7ThJ
	a12f7Lk2OSC+1QcBQE+lZdcxetLaGLWMZ4dydutmfm2K0uTApQA0HOoAj71+59os0pHZhp
	jL7oviBupSkz51MHxlicl6BvdTcgb0Uj0JZCKyb/0XutmWJ2n3Haty3AME881A==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kernel-docs: Update book info
Date: Sat, 14 Nov 2026 13:48:14 +0100
Message-ID: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9d6be96a53f0e9cfeb6
X-MBO-RS-META: 17htyzo9xg71zqsn9em1x6ts6fmqsgqz

Update info about Lorenzo's 'The Linux Memory Manager'. The source is:
https://nostarch.com/linux-memory-manager

CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/process/kernel-docs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
index c67ac12cf7..dd5bef154d 100644
--- a/Documentation/process/kernel-docs.rst
+++ b/Documentation/process/kernel-docs.rst
@@ -79,11 +79,11 @@ Published books
 
       :Author: Lorenzo Stoakes
       :Publisher: No Starch Press
-      :Date: February 2025
-      :Pages: 1300
+      :Date: Spring 2027
+      :Pages: 1350
       :ISBN: 978-1718504462
       :Notes: Memory management. Full draft available as early access for
-              pre-order, full release scheduled for Fall 2025. See
+              pre-order, full release scheduled for Spring 2027. See
               https://nostarch.com/linux-memory-manager for further info.
 
     * Title: **Practical Linux System Administration: A Guide to Installation, Configuration, and Management, 1st Edition**
-- 
2.56.0

