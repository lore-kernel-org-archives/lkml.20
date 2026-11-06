Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945750;
	b=g58AMf/+a/LTU3MCr7wEV2PjjZ0wu/aYjd3IYPlsVikLNR2t5/pPKFVwrrfxYuQnzHqL
	 P0mLmqs1WYdJCawRi4oMQaGMhKa9ffcAJwNXnncvv4YoycdAJL8gwJ9CwxMmR+MbPcIPZ
	 e3Z4ak8cScyMJGf/27CL63BlXAogTPZiAIdC9hu1q0dPtg7m8sJg8VtaHmI6VKZ81qwkU
	 kMiNjVVZk0kJZ5BdrZB1fLoFz0BEOJibvEE2IyOIOhMGp/szRazfxtP0CXDZB9208tbpe
	 TQnlsvImhbdXyLD4UzTOyjToVlwox2wOQxkL6WrmWngZrzghDyu34LZhizXrMRF3rZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945750;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=Ku5sw3Ub/1O1Vdt25dmkNsNWzvVEElE3jfi32lpOUeQ=;
	b=pPbESjUGBy13zQOVg5uGOvAzid1NlOaoAiSKyyZqHHdk/aEAu/dvJEWkwTM1d6J7V0Wv
	 tBZzZKMkD/SQYi0PfHPLquug5KKxwbtBG3N5Y7L5D/5SZW9SaxWoJ1PC95jVu/pGb+geZ
	 2FByhpicYOh3TAg+04LIU/3NImmF+nwKcYB5okv5CzIh4ClH+dCMj5LUqZv7GaTp/yIWr
	 4jUig8+KnjNQl8VZ5S9skstqsbBetmngs2RNkMwRkE6QSJqDkx3iRx2K98LM8gkVm9nYS
	 6bAmvKzzFIYYuOIGcuzPvYmb+qnxCoynnUUevvaYF9xkSt3X5KgxOzAEm3tE38FxlJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qPPKd259;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60D4606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qPPKd259
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261106061548epoutp02f1a3d06361bef67dd0d09cc84d40d2a5~lYCc6ARZB2780127801epoutp02I
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:15:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261106061548epoutp02f1a3d06361bef67dd0d09cc84d40d2a5~lYCc6ARZB2780127801epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793945748;
	bh=Ku5sw3Ub/1O1Vdt25dmkNsNWzvVEElE3jfi32lpOUeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qPPKd259frYesTlyexFYfMz6IQST15PNi87zGct0xI7dy1BIFIq5+Z7/ls6Uj0TM8
	 hCBWj1ECtkXpY+0tQCJrEckF5KEGD82rxNuXzxq/hs44fX5MZ18pO2oJDrnR9+HH5n
	 RZpBmyni/AEBIMCMmSVbXvztbRwEcSq9AtT8OTP4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261106061547epcas2p495a1c780bc1d7fc7714a3ad40d42a284~lYCceHX-_0225202252epcas2p44;
	Fri,  6 Nov 2026 06:15:47 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jLTSg2Y8rz6B9m7; Fri,  6 Nov
	2026 06:15:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20261106061546epcas2p3b0d54ffe9fcea407f7d0e27ed579de0d~lYCbrIH4H2965429654epcas2p3n;
	Fri,  6 Nov 2026 06:15:46 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106061546epsmtip1f556f4c3a86b8d2590423bfcd2b6414e~lYCbmthQf0380503805epsmtip1a;
	Fri,  6 Nov 2026 06:15:46 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, mkp@kernel.org, martin.petersen@oracle.com,
	stanleyjhu@google.com, alim.akhtar@samsung.com, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v7 2/3] scsi: ufs: core: Hold host_sem in
 ufshcd_wl_poweroff()
Date: Fri,  6 Nov 2026 15:11:17 +0900
Message-Id: <c408e7a7167984a07dc714f43273d029b8904939.1793943246.git.hy50.seo@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793943246.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261106061546epcas2p3b0d54ffe9fcea407f7d0e27ed579de0d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261106061546epcas2p3b0d54ffe9fcea407f7d0e27ed579de0d
References: <cover.1793943246.git.hy50.seo@samsung.com>
	<CGME20261106061546epcas2p3b0d54ffe9fcea407f7d0e27ed579de0d@epcas2p3.samsung.com>

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

