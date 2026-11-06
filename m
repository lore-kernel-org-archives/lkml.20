Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793931626;
	b=zwfk5suq04rRluEbaNpF3NtSvdl2Ish4OQECZzRhrhXCAC/VRvmtbM45lPX1r/1R9WK/
	 0Y+3AbkEwdr8vDQXbkzpxVIuv04MF5f9DLYIvuJslKPDMh6riT4pfuwUJlGSDK0hkLS2R
	 mbm7oGm0OaTUP9SE9DMcO1LnLvlEROQFqra1dEAARXxzWOzJNAkoglj1gcdHwuTguxVJP
	 loCJc6qpAn7iAnkkcM6tuGW1+0wtfnoCWq50sjT3yyDsNLNZTGUHV4hsqCLSLXxso+t5J
	 al7HVReEomCHIQXSx+r0qi1iV127su0ovIfO1NG7G/7WvPC5QAalQC0Yj+vZnlbjhOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931626;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=MZKaMktugBAXwZw8hjvmkbkgozIKruWx23/wUHTIGAg=;
	b=EYOlzXC6D5lF0XadaenQem0Cjvk2rxrDXniKQo0ypaWtEN/z4tagafXPgfixYIw0JKrM
	 KwBqAUfSlLZpiD8izDh/ooqS6QqdUF63wK0eCUlrt+1KNUeY/Tmk+SA9Z99X+aB9eFagN
	 bTWN2wYPTgkisyQuRfJE95qgwtBYa0wEPPgviGQ9CtLMh1n3zxMRlZXNdBHyRP4FwFzEa
	 Q2l6hS/q/vaQpPdFB1BXsxhYYA3W3X6hr66QW0S96sre8YKjtX6RRSGiezMWcI/0vO6j4
	 qncP+74PFSWKinPE5casRVPuy8ASR2w9QNbNYM60ZBH5Srn44IgxSS/BvYbWZET1+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mjZuQjXK;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6C606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E6C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mjZuQjXK
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261106022023epoutp02e687426b630b598650b89fcbde4e633b~lU056b_Br2940629406epoutp02D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:20:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261106022023epoutp02e687426b630b598650b89fcbde4e633b~lU056b_Br2940629406epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793931623;
	bh=MZKaMktugBAXwZw8hjvmkbkgozIKruWx23/wUHTIGAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mjZuQjXKurxuUC8hnhVrLAulaEfPV57vJbUb62IH9w7jdSJwe5ou5G+PP/QWfrht8
	 7iHDSVN+k7to3sMwN+c9aHvyukjKFwuisbz/uh3en/13bKpnEaT0i4HnEyCa5tActu
	 cakwlOfviR7o+d9DN1AWunwqiEmqCHg0M+ZJwpPI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261106022022epcas2p3cc2ae667471eda1c6089735149705a87~lU05X1IgA0947409474epcas2p3-;
	Fri,  6 Nov 2026 02:20:22 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.202]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jLNF22DqTz3hhT9; Fri,  6 Nov
	2026 02:20:22 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106022021epcas2p20d78ac51e55f03348d496f45e96031e1~lU04pLqto2787827878epcas2p2G;
	Fri,  6 Nov 2026 02:20:21 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106022021epsmtip1a4929d9c6492f47a1e103f93adbc18b5~lU04iPpFt0408404084epsmtip1w;
	Fri,  6 Nov 2026 02:20:21 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, mkp@kernel.org, martin.petersen@oracle.com,
	stanleyjhu@google.com, alim.akhtar@samsung.com, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v6 3/3] scsi: ufs: core: Set shutting_down in
 ufshcd_wl_poweroff()
Date: Fri,  6 Nov 2026 11:15:53 +0900
Message-Id: <66845a28b3014bb53b7f1332c258009b80707297.1793931113.git.hy50.seo@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793931113.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261106022021epcas2p20d78ac51e55f03348d496f45e96031e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261106022021epcas2p20d78ac51e55f03348d496f45e96031e1
References: <cover.1793931113.git.hy50.seo@samsung.com>
	<CGME20261106022021epcas2p20d78ac51e55f03348d496f45e96031e1@epcas2p2.samsung.com>

ufshcd_wl_shutdown() sets hba->shutting_down under host_sem before it
suspends the device, so that ufshcd_err_handling_should_stop() makes the
error handler return instead of recovering the HBA while it is being shut
down.

ufshcd_wl_poweroff(), which is used for hibernation, also suspends the
device with UFS_SHUTDOWN_PM but neither holds host_sem nor sets
hba->shutting_down. An error handler that runs in the meantime can reset
the link concurrently with __ufshcd_wl_suspend().

Set hba->shutting_down in ufshcd_wl_poweroff() in the same way as
ufshcd_wl_shutdown() does.

Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 95beb95bb036..a52d6ccfa56b 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11583,6 +11583,10 @@ static int ufshcd_wl_poweroff(struct device *dev)
 	struct scsi_device *sdev = to_scsi_device(dev);
 	struct ufs_hba *hba = shost_priv(sdev->host);
 
+	down(&hba->host_sem);
+	hba->shutting_down = true;
+	up(&hba->host_sem);
+
 	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
 	return 0;
 }
-- 
2.34.1

