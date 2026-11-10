Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277207;
	b=xDnUeTF4ldHosV5tTETJWuxG/xrYAzZ7pdx+XDp+Yumu0WsWsr/SwxB7pwmjTpNV8UU5
	 N0NUU6q+dLZ6GiIsZr9fQCmqOtkf5sqqRSIGNf95U8I5tJkXAoqmV7qiGshufwWc1N/cG
	 tewRfOvK3xk9h02LwUgpBzAW+zU+I5sagxjYuFkc+nlYv+KEvZa187bPMkrEPskOKkEsV
	 hMNqgzWQDe6MBmgcP7s9R/Jq4EtIt663wLuWWrkJ2mU5fTh5TrNTsIG2V8i/3G7KEwMKa
	 MNOkuWSpznSVmv7z8XLHHe+VO35r6zI98k3DU69tnCVF0Qx4SBSirKSoC752czQOxhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277207;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-Hop-Count:
	 X-CMS-RootMailID:References;
	bh=2+s202QoutxUmEvepFDYQvUdSyrjcM8qHM+Zg8RHfes=;
	b=3UfBOqsLCwd0lkmSqajA0H2GlkQOX60lAaD7pt9odCK9lADyos2r/VuUoO3cXQn8F1Wl
	 VR6vsrTDzM7kJKAX9Y3cTrKSj+UMrEzC/uWmi63XNO21gWc7zOfkR+KNDg7g+WMaEern6
	 ophjjFWfBlV8YjwqiGLi6jjYXL6NEKgKHgLSAfzw0Hh5xh26i6JWJopIk+jx4q2LTPdbA
	 7zKINjokkJhrkbp9kRzWNX0Y2tgr38YI22fuk2/SY9TU1p4ghbPnhQ85Lz6aQhgpCDqhJ
	 rG5jcDYLisBUljMWvW3fphMdIUnj11/H4JLfKz13H4q6HuiPd5dbedRpsfzbjlNmQJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HZ+9LuT5;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA35606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HZ+9LuT5
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261110022003epoutp0283b270aab4301e1daad27a27cc806d3c~mjZwotg1h0538505385epoutp02Q
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:20:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261110022003epoutp0283b270aab4301e1daad27a27cc806d3c~mjZwotg1h0538505385epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794277203;
	bh=2+s202QoutxUmEvepFDYQvUdSyrjcM8qHM+Zg8RHfes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HZ+9LuT5h7Azwe+JDrqF9vYWgHNo9YrIMceZD8sOb/k2zzHdOGSEmsZItnZk7swaP
	 IbrzzJxHbgTTbZhWPWuoU4oOhJlHlBsB933LpzOAnF0hrQHMum0f1JJJEQR099+7tP
	 DgzL+piouz2OJrNszXYIHkki347lE0pbFDoC+k6c=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261110022002epcas2p36b294ea6b82a3d6ec18d7d9f2bd93740~mjZwKdd0U0204302043epcas2p3M;
	Tue, 10 Nov 2026 02:20:02 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jNr2p61t2z6B9mD; Tue, 10 Nov
	2026 02:20:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20261110020747epcas2p20410190486c9b48b4b2a4e9d8a4c2292~mjPC6dp0q1166111661epcas2p2T;
	Tue, 10 Nov 2026 02:07:47 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261110020747epsmtip13daab7e96cd78af106306fb0d2cc0312~mjPC02NeJ0065900659epsmtip1W;
	Tue, 10 Nov 2026 02:07:47 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, mkp@kernel.org, martin.petersen@oracle.com,
	stanleyjhu@google.com, peter.wang@mediatek.com, alim.akhtar@samsung.com,
	kwangwon.min@samsung.com, kwmad.kim@samsung.com, cpgsproxy1@samsung.com,
	h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v9 2/3] scsi: ufs: core: Hold host_sem in
 ufshcd_wl_poweroff()
Date: Tue, 10 Nov 2026 11:03:14 +0900
Message-Id: <973576304.21794277202839.JavaMail.epsvc@epcpadp1new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794275305.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261110020747epcas2p20410190486c9b48b4b2a4e9d8a4c2292
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Hop-Count: 3
X-CMS-RootMailID: 20261110020747epcas2p20410190486c9b48b4b2a4e9d8a4c2292
References: <cover.1794275305.git.hy50.seo@samsung.com>
	<CGME20261110020747epcas2p20410190486c9b48b4b2a4e9d8a4c2292@epcas2p2.samsung.com>

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
aborted. If __ufshcd_wl_suspend() fails, release host_sem and return the
error as ufshcd_wl_suspend() does, otherwise the error handler, which
waits for host_sem, would block forever.

This changes the behavior on failure: the error is now returned from the
.poweroff callback, which aborts hibernation, instead of being ignored.

Do not use hba->shutting_down here: it makes ufs_mtk_system_suspend(),
which is also the .poweroff callback of the MediaTek host controller,
fail with -EBUSY, and nothing clears it when hibernation is aborted.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3b5580ac390c..0d86c67f0b1a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11573,9 +11573,15 @@ static int ufshcd_wl_poweroff(struct device *dev)
 {
 	struct scsi_device *sdev = to_scsi_device(dev);
 	struct ufs_hba *hba = shost_priv(sdev->host);
+	int ret;
 
-	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
-	return 0;
+	/* Released by ufshcd_wl_resume() if hibernation is aborted. */
+	down(&hba->host_sem);
+	ret = __ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
+	if (ret)
+		up(&hba->host_sem);
+
+	return ret;
 }
 #endif
 
-- 
2.34.1


