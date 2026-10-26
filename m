Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992652;
	b=0F96Q5iFcSLchF9/9mIWw9YzJ3qMFBaa3/ZnJpyBS3Jl96uj3hgthAUHG1SfyXdkv8I5
	 F6G9sjNCvn7aFk73fWrmV02DHwGpbNn/QOGAuksImLFFGtHgAOp5Ike1BmhVzub3Qg9un
	 +qvpwWSio8KdNGN/kAXE92nDlzh19FveyNXOaxAdHtsRgkUEqHK9V0+g5ofX9MEnnUEKp
	 ZhTLOvbZXcA3XxrxeypRN7q9C4osq13OCf9iTcgF42JH/JAnYp1wk0FQOGSd/kyoVGAON
	 Qj/WiDz6EuCAE3w5pQqiyBLk4C0cKM8Vj57toacfWX8oMcdovQRVZiDfA9h/7D+UXUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992652;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=C8BMVtqrQ6mF6BER4qpDCqBNmiEwk6DFbCT1JE/nmBI=;
	b=YJl3kdB4t6c1mipsvIBKCQKk6vgupzc9NdE5+UpU3zQT4j2C6B9S9eYfb+JkNVEi1ycz
	 NkJ/j40tWAZyeyi3QTNxNwfBzNklmBQOH1yPj4V+eFl6OEIef6/2vyC7KiNDQY2wW//yJ
	 Gf7tSVGFReBeF315cfxmwT4IEJwPjWIM3A1d/lpxpikb8onR5FnDXoLdDk1PTdQPexbmL
	 d5NFI1cY6KKQTy9DK8NSohYiPjiRQ+Lk/iDZE7JJv+o+nyTCeAI7e3F7aDoOML6M5eKPb
	 xIUdea1YC9Gyd1Qurc5x+9UYSTnvTOS6evhb4OwDJmYuwWF9aA6VueB8+aoleRkqGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Cu3ydTzH;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F5B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F5B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Cu3ydTzH
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261026053047epoutp0179d712b451274c058ee77afa68a79506~h-VAz_Ksp0579505795epoutp01g
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:30:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261026053047epoutp0179d712b451274c058ee77afa68a79506~h-VAz_Ksp0579505795epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792992647;
	bh=C8BMVtqrQ6mF6BER4qpDCqBNmiEwk6DFbCT1JE/nmBI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Cu3ydTzH1u/2U+jVooeasteYdoaSQADp4+aKOJq/1ujz3Y0QqV7B5ysT7Yromo34m
	 k5AQyqmwredKSGH6gMQ2F96mE/SOlNu4PUdiIGPxVn+BizW7LnSGmZadJvpuh1XmQU
	 GF9TybranXmzfGPRZOR5l4yWQFiwStF85EOHPwT4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261026053047epcas2p3b7ce77ea13dc440f9e4433e7bd93d5bf~h-VAaVVoo2178921789epcas2p3E;
	Mon, 26 Oct 2026 05:30:47 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jChzp6HvHz6B9mR; Mon, 26 Oct
	2026 05:30:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20261026053046epcas2p31ae8a493f40c0f12523feec6e036072f~h-U-liB7U2178521785epcas2p3F;
	Mon, 26 Oct 2026 05:30:46 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026053046epsmtip24230dbb5163b217d45d3409aed7c05d2~h-U-fQ8UQ2777927779epsmtip2L;
	Mon, 26 Oct 2026 05:30:46 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, bvanassche@acm.org, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v4] scsi: ufs: Change the error check sequence for auto
 hibern8
Date: Mon, 26 Oct 2026 14:26:32 +0900
Message-Id: <20261026052632.1848929-1-hy50.seo@samsung.com>
X-Mailer: git-send-email 2.34.1
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
X-CMS-MailID: 20261026053046epcas2p31ae8a493f40c0f12523feec6e036072f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026053046epcas2p31ae8a493f40c0f12523feec6e036072f
References: <CGME20261026053046epcas2p31ae8a493f40c0f12523feec6e036072f@epcas2p3.samsung.com>

Auto-hibern8 enter and exit are performed by the host controller without
a UIC command, and the auto-hibern8 idle timer only runs while no UIC
command is outstanding. An auto-hibern8 error (IS.UHES or IS.UHXS) is
therefore usually reported while hba->active_uic_cmd is NULL.

Since commit fcd8b0450a9a ("scsi: ufs: core: Make ufshcd_uic_cmd_compl()
easier to analyze"), ufshcd_uic_cmd_compl() returns early when
hba->active_uic_cmd is NULL, before ufshcd_is_auto_hibern8_error() is
called. Such auto-hibern8 errors are no longer recorded in hba->errors,
so ufshcd_check_errors() is not called for them and the error handler is
not scheduled.

Check for auto-hibern8 errors before checking for an active UIC command,
as was done before that commit, but keep returning early when there is
no active UIC command so that a NULL cmd is never dereferenced. Only
report the missing UIC command if no auto-hibern8 error was found.

Fixes: fcd8b0450a9a ("scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier to analyze")
---
Changes in v4:
 - Change patch version

Changes in v3:
 - Check auto-hibern8 errors before the NULL check again, so that errors
   reported while a non-hibernate UIC command is active are still
   detected (Sashiko review).
 - Return early when no UIC command is active instead of falling
   through, to avoid dereferencing a NULL cmd (Sashiko review).
 - Add Fixes tag, reword subject and commit message.

Changes in v2:
 - Check UFSHCD_UIC_HIBERN8_MASK for auto-hibern8 only when cmd is NULL.

v2: https://lore.kernel.org/linux-scsi/20261022074249.3098100-1-hy50.seo@samsung.com/

Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index d085d394858f..4541776e8d38 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5941,16 +5941,22 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
 	struct uic_command *cmd;
 
 	guard(spinlock_irqsave)(&hba->host->host_lock);
+
+	/*
+	 * Auto-hibern8 is performed without a UIC command, so check for
+	 * auto-hibern8 errors before checking for an active UIC command.
+	 */
+	if (ufshcd_is_auto_hibern8_error(hba, intr_status)) {
+		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
+
 	cmd = hba->active_uic_cmd;
 	if (!cmd) {
-		dev_err(hba->dev,
-			"No active UIC command. Maybe a timeout occurred?\n");
+		if (!(hba->errors & UFSHCD_UIC_HIBERN8_MASK))
+			dev_err(hba->dev,
+				"No active UIC command. Maybe a timeout occurred?\n");
 		return retval;
 	}
 
-	if (ufshcd_is_auto_hibern8_error(hba, intr_status))
-		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
-
 	if (intr_status & UIC_COMMAND_COMPL) {
 		/*
 		 * Store the UIC command result in the lowest byte of
-- 
2.34.1

