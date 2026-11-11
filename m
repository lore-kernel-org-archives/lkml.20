Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387791;
	b=tBG2Jqa/IJg0nVztsJBoUxQ/6fis13LeOFRTKlb/FvsUbmLdQdtlWEcxkJhihG9bAWYh
	 lZH9uGRBnvs+cYu/zmXcpT17qLre9JZwIyheJiaMZ5K4CzUyXL5Y2XtYtTtjCBGVWIZDF
	 1QOhTUqZ8cxGi82DxGYscV8iUV2h6uFSCf8XxPrauUXFm+taTrOI1Noqmhz3XwuhaEEF+
	 UL2DZgWrFrc0WbWqA1+qpIzIG8N3dtzmKDwTwXOVvubPfmogE3amksJBuKkMu9piuDr8e
	 md6UqNQrWBrIOQ8ALMorF/LzvgAAKJ8iaD9a/qpCnu/xc54W45JnAgNzvF0Ikqo35Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387791;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-Hop-Count:
	 X-CMS-RootMailID:References;
	bh=AS0pCPbH18eJRmR4rzNpPLlA+TQu/BzWsgtimyCQfl8=;
	b=H97kc+2nLIBs3ck2kOKhG8INFzVbf7TEeRIz7ZnPXyPh+L5eEx2yyQFWA4gfnmvFSQPr
	 ZvJ2je+jVX4S4LuFH94RsifsjGd5+lEIWMuGAaAU5LLfza6s08mUgJfw4Vo8ZcSjFWM9a
	 /JKTTqfHSHKG03dFm02hIvw6R2VEWMf3UMkif6ZkstKrPHoBvJJAvh7EDPE39JP1lgg+a
	 jaMx3B+SKRNLuJABve5mMfTrObDQhzupiqtWYar9i0t8cHILVRChrfmrbvh9NgGtkGzJZ
	 HFKZcv9CriaV8hzej6TqRR0abQ185i3ZK0PoCSkDrFrTyPaPGKTs3Cq7cFVA9pA8HbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=iuiSx1yw;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FB6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=iuiSx1yw
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261111090308epoutp04d505bca904895cb3bb8059a380f27d45~m8i_0Pi0B2239422394epoutp04V
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:03:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261111090308epoutp04d505bca904895cb3bb8059a380f27d45~m8i_0Pi0B2239422394epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794387788;
	bh=AS0pCPbH18eJRmR4rzNpPLlA+TQu/BzWsgtimyCQfl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iuiSx1ywueyvJunGOuAeYjAZ4t8o804Z2Q/XxUVvOgzaHImWsxNtUg296mK8vVym9
	 idQXMfvueMfaN9SsRWMKUhk2cylwkk7arFaA1i1HcSmQvXofT9QGO4RphzMMSt8N8L
	 mOeet4TpvvrDPJk8oPtl5VxbvwB/vMripT8+CtIE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261111090307epcas2p4e0bbf75065f4a36fa44b29f9c2896771~m8i_YGS801310813108epcas2p4M;
	Wed, 11 Nov 2026 09:03:07 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jPcxR5KlCz6B9mB; Wed, 11 Nov
	2026 09:03:07 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20261111082305epcas2p28dd4b104523c10c82457a29e7e89c56c~m8ABO46m62289822898epcas2p2w;
	Wed, 11 Nov 2026 08:23:05 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261111082305epsmtip23dd718d42a98361b556dc4cea06816db~m8ABJiIIh1505915059epsmtip20;
	Wed, 11 Nov 2026 08:23:05 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, mkp@kernel.org, martin.petersen@oracle.com,
	stanleyjhu@google.com, peter.wang@mediatek.com, alim.akhtar@samsung.com,
	kwangwon.min@samsung.com, kwmad.kim@samsung.com, cpgsproxy1@samsung.com,
	h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v10 2/4] scsi: ufs: core: Add a helper for the system
 suspend callbacks
Date: Wed, 11 Nov 2026 17:18:32 +0900
Message-Id: <331418503.141794387787744.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794384665.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261111082305epcas2p28dd4b104523c10c82457a29e7e89c56c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Hop-Count: 3
X-CMS-RootMailID: 20261111082305epcas2p28dd4b104523c10c82457a29e7e89c56c
References: <cover.1794384665.git.hy50.seo@samsung.com>
	<CGME20261111082305epcas2p28dd4b104523c10c82457a29e7e89c56c@epcas2p2.samsung.com>

Move the body of ufshcd_wl_suspend() into ufshcd_wl_system_suspend(),
which takes the PM operation as a parameter, so that it can be shared
with ufshcd_wl_poweroff() in the next patch. ufshcd_wl_suspend() calls it
with UFS_SYSTEM_PM.

No functional change, except that the error message printed when the
suspend fails now contains the name of the new function.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3b5580ac390c..4825349e87fd 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10712,7 +10712,7 @@ static int ufshcd_wl_runtime_resume(struct device *dev)
 #endif
 
 #ifdef CONFIG_PM_SLEEP
-static int ufshcd_wl_suspend(struct device *dev)
+static int ufshcd_wl_system_suspend(struct device *dev, enum ufs_pm_op pm_op)
 {
 	struct scsi_device *sdev = to_scsi_device(dev);
 	struct ufs_hba *hba;
@@ -10725,7 +10725,7 @@ static int ufshcd_wl_suspend(struct device *dev)
 	if (pm_runtime_suspended(dev))
 		goto out;
 
-	ret = __ufshcd_wl_suspend(hba, UFS_SYSTEM_PM);
+	ret = __ufshcd_wl_suspend(hba, pm_op);
 	if (ret) {
 		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__,  ret);
 		up(&hba->host_sem);
@@ -10741,6 +10741,11 @@ static int ufshcd_wl_suspend(struct device *dev)
 	return ret;
 }
 
+static int ufshcd_wl_suspend(struct device *dev)
+{
+	return ufshcd_wl_system_suspend(dev, UFS_SYSTEM_PM);
+}
+
 static int ufshcd_wl_resume(struct device *dev)
 {
 	struct scsi_device *sdev = to_scsi_device(dev);
-- 
2.34.1


