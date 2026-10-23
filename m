Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755559;
	b=m3973iiO/e3wEuF+RBw9XunXwRjoEXjX8d6XdVK/TcInzi5NDH60BWkagJAmzyR3kD1L
	 TPcwslcJt8RkKAgp9Y7gtoQSKULfGgFAWlMNJ/9EIPQxDYYmTttrQ9vOYeA7OKAYbqpMq
	 X1EGxk9cdYavCZP3alBuLFbeBULlRwaQfaFLcb5Cm8JUlQ08LYA9cquD8HO8niCXnFspl
	 4uHuxNBzWHyYDETbymaGxouDQDdu2mhCvpMXg09FwpOGHHD2gV7PBA96oJU3LqRg6jK2p
	 BifKPgjAf5dM/SqndlO9geY6sbHDOtUt2IsUbhRlXybWqCRKNJ9y7PJbv0vWDWaeYOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755559;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=i9Ml4qigH7DzspM/Amzf5XaHAXSm7xpnRAKJSyb+B5s=;
	b=F4Gz2eXnkFKGS6u9wJ2x6sWQpUqJHy88losfBaIWF0VZsgrY6A+nr2K5GTnbaTGPgrd8
	 VpRNPBu3UdmB1MyLHNRFPCMO0XGkAJPTPLeaVwcpVm9fUTFvQm155bUGX3hJNBCAzEzqH
	 C/gXFytbdmtFfyqxKBQGRIJTapCjpzHHhjGyDNLJ5pn2jKTWCcTlnsAEP/rtDeVRFv5Ls
	 R6JQs5h/rrpGC8qVHMgwyfdKcfXQ37yxzHR8Q2Drdgio/YH/vlpsTtSbPhfeM5wNY4tNA
	 GasahslKRkKSgBMxa+arN7BkLT7RYaZuuynYJnIH4dTMCSizc82PgnWFTip04sVVsXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dXi8KQNX;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECEA606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECEA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dXi8KQNX
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261023113912epoutp0321ec1e2b820281e89a18072e67bf1000~hJa0eDq5E1754617546epoutp03d
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:39:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261023113912epoutp0321ec1e2b820281e89a18072e67bf1000~hJa0eDq5E1754617546epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792755552;
	bh=i9Ml4qigH7DzspM/Amzf5XaHAXSm7xpnRAKJSyb+B5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dXi8KQNXJnCPRZS6jy8UX4JgmQg+GMR9cx9jkBmDmUoT0qKFYC7mZD1rRFkJR52kK
	 ff+OZ4S0azuM3zn0tVlHpmU4VOEnk+cFopov3O9q3weKVE2JUT5wfUWxDwaD1pPGlB
	 ppreflV7lcvASFCf8jj8NB60eOf5QLqEHXsHxEBU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261023113911epcas2p47c77c8bc9b8ad66a09a130fa78fafb1e~hJa0JrZbn1351613516epcas2p45;
	Fri, 23 Oct 2026 11:39:11 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.202]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jB1JH2k0tz6B9m7; Fri, 23 Oct
	2026 11:39:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20261023113910epcas2p1479bbb9200be2c1e0c31a86ba36efbcc~hJayi8j2D2090120901epcas2p1z;
	Fri, 23 Oct 2026 11:39:10 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261023113909epsmtip140e3e47c06d9bc66693dfee4a7178969~hJayetg8T0801708017epsmtip1u;
	Fri, 23 Oct 2026 11:39:09 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, bvanassche@acm.org, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v2 1/2] scsi: ufs: core: Clear saved errors in
 ufshcd_link_recovery
Date: Fri, 23 Oct 2026 20:34:51 +0900
Message-Id: <31fc787b76a2586ca6d3c442afdb694aab3d14bb.1792755091.git.hy50.seo@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792755091.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261023113910epcas2p1479bbb9200be2c1e0c31a86ba36efbcc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023113910epcas2p1479bbb9200be2c1e0c31a86ba36efbcc
References: <cover.1792755091.git.hy50.seo@samsung.com>
	<CGME20261023113910epcas2p1479bbb9200be2c1e0c31a86ba36efbcc@epcas2p1.samsung.com>

ufshcd_link_recovery() resets both the device and the host and then
re-establishes the link. Unlike ufshcd_reset_and_restore(), however, it
does not clear hba->saved_err, hba->saved_uic_err and hba->force_reset,
so the errors latched before the recovery remain pending after the link
has already been recovered.

When ufshcd_err_handler() runs afterwards,
ufshcd_err_handling_should_stop() sees these stale errors. The error
handler then quiesces all queues and, depending on the latched errors
(e.g. a fatal error or UFSHCD_UIC_DL_PA_INIT_ERROR), performs another
full ufshcd_reset_and_restore() on a link that is already operational.

Cache and clear the saved errors before the reset, as
ufshcd_reset_and_restore() does, so that only errors raised during or
after the recovery are left to the error handler. Put them back if the
recovery fails.

Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bcc2512bf34b..74dfbb98129e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4690,10 +4690,20 @@ EXPORT_SYMBOL_GPL(ufshcd_uic_change_pwr_mode);
 
 int ufshcd_link_recovery(struct ufs_hba *hba)
 {
+	u32 saved_err, saved_uic_err;
 	int ret;
 	unsigned long flags;
 
 	spin_lock_irqsave(&hba->host->host_lock, flags);
+	/*
+	 * The errors saved so far are handled by this full reset, so cache and
+	 * clear them first, in case new errors are generated during recovery.
+	 */
+	saved_err = hba->saved_err;
+	saved_uic_err = hba->saved_uic_err;
+	hba->saved_err = 0;
+	hba->saved_uic_err = 0;
+	hba->force_reset = false;
 	hba->ufshcd_state = UFSHCD_STATE_RESET;
 	ufshcd_set_eh_in_progress(hba);
 	spin_unlock_irqrestore(&hba->host->host_lock, flags);
@@ -4704,8 +4714,11 @@ int ufshcd_link_recovery(struct ufs_hba *hba)
 	ret = ufshcd_host_reset_and_restore(hba);
 
 	spin_lock_irqsave(&hba->host->host_lock, flags);
-	if (ret)
+	if (ret) {
 		hba->ufshcd_state = UFSHCD_STATE_ERROR;
+		hba->saved_err |= saved_err;
+		hba->saved_uic_err |= saved_uic_err;
+	}
 	ufshcd_clear_eh_in_progress(hba);
 	spin_unlock_irqrestore(&hba->host->host_lock, flags);
 
-- 
2.34.1

