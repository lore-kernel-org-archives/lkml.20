Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200287;
	b=ShhttCYVAMe2wTUJ/AyNkpOso5S8jGXJ8E9gndRCfAy7i0r4RFOr0pC3b86bfQRwrc44
	 C2CpcxjXSLfAis2R9vBP8+Jvq9QMsJ105feCBOLYSlRpVY5oHFouKXRgGQGTiWpQfaQAm
	 gsnrIP32tc3eWnZfxpHnjPipkQ6tUhqgVh5Dtp+JkX0i+Qyj/cNjBUuKAEfYZoYTqjZyx
	 nADXzTYdACKDgau3F6OVdi1pNxdev/D7vMRsykzpcWeUHiMkzqw9h7lglCA3pYuyizHMv
	 BAljTs5p9ijchz4TXeUrIqGAWrITfq7OOEyrPFYNJEf+E+p1rBYl6CRnPGV9lCZ0WeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200287;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=hJGdgt492bpGMsWySAoBQPxndMzVOyfJANErPbzuzA8=;
	b=1YyeL9h+Fax/7QTq/lU5P261IoN/hAb7YdRpNYpF2F6E2RcUdiLNBXykk8EhkAl1DDLr
	 GFSIWerb0xdnEtDc+9qXH9bqCUZoEGJ1EQYSm/4C0KPazmD4+lrOc8jNAu5EKEZWybPMu
	 uZZGyfkQKcqjaNRc/70QQ5Kh59L1vU+JT9/j38LOQy4rGgJiPCaGfNak7xR68kdfzEmV4
	 CLSF0Vm5Rdy1TydXsA3qDGtEgS0OYsI1JifGOmCZEq7/l7ixZJNfh3ojCIE3+7SUu479K
	 7OafHM3Nzvvh33vqO/qDA05TQVgFShE40/o7iqajrSePr0F4WCrOS9bN4/DjftG43gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="X/PIKzHl";
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A042F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=X/PIKzHl
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261109045803epoutp02b1f8ac882335d52cf47233cc008bfef6~mR6bXk_Lb0792707927epoutp02G
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:58:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261109045803epoutp02b1f8ac882335d52cf47233cc008bfef6~mR6bXk_Lb0792707927epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794200283;
	bh=hJGdgt492bpGMsWySAoBQPxndMzVOyfJANErPbzuzA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X/PIKzHlnghW+esBclYI48qhc+QKPP5Cw6O69HdcVpZYKRZ1w6x2Lo85cQ2qi5N5e
	 HwCrqFUIkfE3WnL3IKY8txnhJW7Xd1w0OGrGbyGWlk4pIK0W5hJTKbggiata89K05V
	 SsR0YYh6e9xNGeRDX/T4jg/ZzE4vOSnY5fWqp8wk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20261109045802epcas2p1a532ac5e9960b5d11566befbe207590f~mR6a1DuXQ1665916659epcas2p1D;
	Mon,  9 Nov 2026 04:58:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jNHbZ5zWZz6B9mF; Mon,  9 Nov
	2026 04:58:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20261109041347epcas2p17b5c0fd7b693f92eb2af35b12a24de31~mRTxrjBTr2701327013epcas2p1U;
	Mon,  9 Nov 2026 04:13:47 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261109041347epsmtip1d584ccfa64ae0209e71bb4ef7356335b~mRTxmLGZZ2834428344epsmtip1t;
	Mon,  9 Nov 2026 04:13:47 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, mkp@kernel.org, martin.petersen@oracle.com,
	stanleyjhu@google.com, peter.wang@mediatek.com, alim.akhtar@samsung.com,
	kwangwon.min@samsung.com, kwmad.kim@samsung.com, cpgs@samsung.com,
	h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v8 2/3] scsi: ufs: core: Hold host_sem in
 ufshcd_wl_poweroff()
Date: Mon,  9 Nov 2026 13:09:16 +0900
Message-Id: <973576304.21794200282836.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794196863.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261109041347epcas2p17b5c0fd7b693f92eb2af35b12a24de31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261109041347epcas2p17b5c0fd7b693f92eb2af35b12a24de31
References: <cover.1794196863.git.hy50.seo@samsung.com>
	<CGME20261109041347epcas2p17b5c0fd7b693f92eb2af35b12a24de31@epcas2p1.samsung.com>

ufshcd_wl_suspend() takes hba->host_sem and ufshcd_wl_resume() releases
it, which serializes the error handler against system suspend and
resume. ufshcd_wl_poweroff(), the hibernation poweroff callback, also
suspends the device with UFS_SHUTDOWN_PM but does not take host_sem. An
error handler that runs in the meantime can reset the link concurrently
with __ufshcd_wl_suspend().

It also leaves host_sem unbalanced: if hibernation is aborted after
ufshcd_wl_poweroff() has been called, ufshcd_wl_resume() is called as
the .restore callback and releases host_sem, which was not acquired.

Make ufshcd_wl_poweroff() behave like ufshcd_wl_suspend() and keep
holding host_sem. It is released by ufshcd_wl_resume() if hibernation is
aborted. Do not use hba->shutting_down here: it makes
ufs_mtk_system_suspend(), which is also the .poweroff callback of the
MediaTek host controller, fail with -EBUSY, and nothing clears it when
hibernation is aborted.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufshcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3b5580ac390c..1c935a8d016d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11574,6 +11574,8 @@ static int ufshcd_wl_poweroff(struct device *dev)
 	struct scsi_device *sdev = to_scsi_device(dev);
 	struct ufs_hba *hba = shost_priv(sdev->host);
 
+	/* Released by ufshcd_wl_resume() if hibernation is aborted. */
+	down(&hba->host_sem);
 	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
 	return 0;
 }
-- 
2.34.1


