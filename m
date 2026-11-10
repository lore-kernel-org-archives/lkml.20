Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310537;
	b=o4aSnqcoYvA6MfbZo37zLgmez9Rg2B9n9v6FHQaGvUqsNOz/vWGbJBvC9Zyz9jtIXUhv
	 klc+kH1y55RsdqSZ3dPZCxaIDUiVFat3ti2+4+Uas4Wn2DXiTFemhQ3uvFOQYpHVUcG/1
	 ss6RMJ1GeGJzDtSq0RbB3W+c4L6qzeeapTpZDiv6FCqD7pEpG589HxkBZa6Qj3bwJDYJq
	 93c2k6da9XMfcgHnzESDtYkPwfaXbGSSPubgBBygBe71Rnj0K1WY1Eh1RUaXJHnFIOQ1b
	 5r7u2nFEwlZlEyhtSbHl8Vq7qAVekHrj57nB7HefA9Nq27IVLLkW3ccrEObwCCoZRPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hz2duDh2X9IqKj9QHw0i2rUbwpVwIMp0NVPlYZKXIes=;
	b=CjPwZLLeWrdntAMqY4IPPOpDW4pDvadKrAOmwDnfaQcmA3reyahoy1Yd2gOkOQdFAxM0
	 zgFXQOgzaKxupP7+BEaTs6g31X3jbhZ787TVIw7t/o8hkDivZmM838QasOrM5uyN8cNJX
	 8kf7C1rPlyL/hOXFg8ybzLIMrdaDGgwX9pXPB8rVVV+7EaLFL411sM1H2ZVILs6Nb8uky
	 dSnAYvFYV6s1ZdKyxzqJV2KIQAWr+XLZLMoxqgX8mUsrslNv3CL7SQ4P5N2QdmKBC323U
	 vkfHeb8DlgKWwONA8XsXSSKOpC4EH04diSI2KdbSj0vZvDOkrg6R1okwypyQpg+RRtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lE0qWE6r;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC05606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lE0qWE6r
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so6165eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794310536; x=1794915336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hz2duDh2X9IqKj9QHw0i2rUbwpVwIMp0NVPlYZKXIes=;
        b=lE0qWE6rLEzHfNoA21IpOUbmmJ7E2tUdoftzBvHiwSlWedBAdOfuaIZzQyiS7ZKfBM
         k7BPoYeQ4s6Yfajesc/InpK9TbrfkTJTk4lOBh+h7z9AxaMilIfLJtH/OsSP0Gnqslzf
         gRYSfht5DQfLdZJS1/EAc+xGqXXKvNbOpsrNl4yuKM7p+NXGjERwCNvte85gdgJ35G4P
         cW2Fuozs/4KQmL26oyOVulrshCNzNzizyAlJwFUlXJzi/mBUB7jAIPc39cog06dzfPoV
         AHL4jRyPbgS9xQaJr222eTWaiez8kJt5AG++eIDCTuRY2MTNI8NRgSmPjjGMuDBTUybY
         8+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310536; x=1794915336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2duDh2X9IqKj9QHw0i2rUbwpVwIMp0NVPlYZKXIes=;
        b=HdPsVbSTHiMLPiGsrHaDReSkyU4r+DwEwCKhuXnws2cFVy+vpY7NV+tB0NWHX+pX72
         LQFmg6YqoQuCNfQJmWbAmTRaitbi1lyiyR9DSVf28KLZV+N1ubkPVMiJBpQb+Na9wI+C
         qKB7B7oa/O6tBGaWggboK8+D142PPWXZ+k54B4KXTeTIW5QE6r7NYucJeH2z0Ep29JK+
         FfUxDEEYZ27N9QVWefm4JWvO6r+36uXseDEPG9CEDd2d5Y+xrZhajKO3CJGR+tMMEsUj
         dI8bY776aD8NGld9FN1Xz75dgSO5EeUrB8ZGAJnuDytJFEuxNGp48tlR5ZFwqMKU63Ng
         S4Iw==
X-Forwarded-Encrypted: i=1; AL+hErGfJYZmrSqEF/ALnn2tRxAq4sdrHEv+yIknZx9qhX5GKDsMjDlKJX+jBK+MRbJ+P+9tH/0e5EUataAI5OQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jx/IujJFB4WpTi0yYor4DGxTCR7DlDWL5PcaowY5fCrtdDYaY
	P3sq5fPGLrikmpC8Wf0GCktVt52EJos1dlYQmyulftwO79JhFaU5Nb4p
X-Gm-Gg: AYBFou3nCLk5/Um6SGdmMtGVfyXJIfXzhruhdmWWiKC4lEwPip+C3TQkCpzN+whFNyH
	Eqs3I6TgEcf0JD2edElNbHUOX22TAgi1BFdLSByGenM7PW/BS7olg768NmbNb2V16uQ3gRG+LfY
	FgwapmyKiDejqZYz4AmTcjcKGJ/x8C9aIeXWq4gZQ8zVzVRiJBslA+DFZFSzahuSfIpFIJX8cIh
	WvxKFBO5fqZdKcsyg/L/uVRFgcuRcuWOdHh4pXjxIqTdhWpbYLCzxhNVE2AoZHZU1PK4UlLoCHj
	2WEGtfsAhvt2PmUxZkPC4jaRJ3+1tOWJBN4A5vYRj/Xc0xSOVQKOfUc8kyMF0FauLi9cT6xSxiv
	LzH1QbVIGJp7hZSZus+oPZMK36DvFlUNt+KcX0EE9V/mc+IIGXHxsZWBpGI4kkQ0+ZnnQ03IQQE
	d/KUjQUFNGVwKWOtA2XYyuPZwsdef0yj0sxq6x0A3Ti+pSzw/yx9JnNySf78mWVRi2l/YFDnG5o
	ckXUo/fkmvTukzWWCM5b9OCzvb7HAn370sC1oeGrMFDOIC6Xvmcxar3YCyUw5rKBP+fnImTmQhJ
	JCaha6P8EC5/ycYvl9/DZA/f034R0DG0SuibpyhvhTNlNaIV
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4851767eec.31.1794310535882;
        Tue, 10 Nov 2026 03:35:35 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm6098205eec.12.2026.11.10.03.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:35:35 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-usb@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: gadget: aspeed_udc: cancel wake work on device removal
Date: Tue, 10 Nov 2026 20:35:23 +0900
Message-ID: <20261110113523.2517891-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ast_udc_wakeup() schedules udc->wake_work to drive remote wakeup from
process context. The work handler ast_udc_wake_work() dereferences udc and
takes udc->lock.

udc is allocated with devm_kzalloc(), so devres frees it after
ast_udc_remove() returns. Removal never cancels wake_work, so a work queued
by a remote-wakeup request just before unbind can run after udc has been
freed and dereference freed memory -- a use-after-free.

Cancel wake_work in ast_udc_remove(), after the gadget is unregistered so
no new work can be queued, before the devm-allocated udc is freed.

Found by static analysis; not runtime-reproduced (needs Aspeed ast_udc
gadget hardware issuing a remote wakeup that races unbind).

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 81fa495..20dcbd9 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1460,6 +1460,14 @@ static void ast_udc_remove(struct platform_device *pdev)
 	struct ast_udc_dev *udc = platform_get_drvdata(pdev);

 	usb_del_gadget_udc(&udc->gadget);
+
+	/*
+	 * ast_udc_wakeup() schedules wake_work, whose handler dereferences udc.
+	 * The gadget is unregistered above, so no new work is queued; drain a
+	 * pending one before the devm-allocated udc is freed.
+	 */
+	cancel_work_sync(&udc->wake_work);
+
 	if (udc->driver) {
 		/*
 		 * This is broken as only some cleanup is skipped, *udev is
--
2.43.0
