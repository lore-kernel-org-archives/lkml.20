Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560250;
	b=T+8DcdW4pM+G1aS7zIvxbyk3p/qH0EsvwxHQ7Lt23RlEHlH2D8BGVlbaVTWtWhKz6TiR
	 DopGAeoNmOJOCfXAr2N7p9JgEdNZ3pAMf0AQK/bPkHVZqd0x6D8FvU7irSnaV9PWKArzI
	 9HeIrNeWhDjOGs6JRaMNFvbrpDkmQL7BOcEgHOahCqTOjlwLNJ2QS8bM3Lc0KT7nMXL+G
	 CE8Na9EMRJ6MDDeVRg3Ek0EBP3IOCp7MS6qASxOhvoGlr94Jn+7v/Cp+UGHlxNr3NCIBk
	 PqsPVedkJLYPWv5wIImgemK8epr8CO3h+UIFEfpfbnu34OPBOBAWgdzLgsr6ItEQbtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560250;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=eueLmUgBHormXL0YdXB8lmaaPSvLGfd8pLaCio6533E=;
	b=msapjETu4iNyhlfGaDc2EYlOEITawlaCHAw3v5VF4w3wbwmBj2QMPmiqLlnyq0faSr73
	 wvRDMr/Qb8dKZSS9suEchRDJjM7Ugg869dtMRqwu6gI9xtGrsmqeBn+wi2wXerXiWEMY3
	 zoS4+f9wZSMJg1jjyIWYn/jja5TbsWQvYEbkDxovbRr+pVDZ5Che08VkyRoP0GdPDrkDh
	 3vZAQDvuU+8RgkrN3PPAL1VdRmWkffFN8cZ2WK2cpup7x/M9S7COtMeFfrez5km1Vl6d7
	 qg2DkqU0o8gvY7oWg9k8hw3GIQXW+fTz6JalMxOeZB3osahOspn5ZWvvmx0hFLrfNdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HbRzwLk+;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602B9606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HbRzwLk+
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261021052405epoutp039780de5b75466abbf465d14beb775843~gdAvZO-822285822858epoutp03D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:24:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261021052405epoutp039780de5b75466abbf465d14beb775843~gdAvZO-822285822858epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792560245;
	bh=eueLmUgBHormXL0YdXB8lmaaPSvLGfd8pLaCio6533E=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HbRzwLk+aAEvM7Ed11Rn+u72v2ojtBUiSKzaO0CDjIeq10vvy+CdmCAY5Z3D2r7el
	 QctYnTToXqj8RHah5GVRy/M+GoAWu6QUwD5VADAtxwcDnI+20JVKWuTRZzqnyJsCh5
	 5hRs7t1uQRY6d5eJFUUSzZ8I6PNym3mMFtJe38zw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261021052404epcas2p30c068e388e3a097b351063e822889628~gdAtugqzJ0478904789epcas2p3V;
	Wed, 21 Oct 2026 05:24:04 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.212]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j8d4M6Mppz6B9m7; Wed, 21 Oct
	2026 05:24:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20261021052403epcas2p43e1a022f46314c1a9d1ffb66502c29eb~gdAs-fzEa2899728997epcas2p4p;
	Wed, 21 Oct 2026 05:24:03 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261021052403epsmtip14daee3bd67032b8ce5cada0055d00126~gdAs4KP9X2305023050epsmtip1r;
	Wed, 21 Oct 2026 05:24:03 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, bvanassche@acm.org, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v1] scsi: ufs: Change the error check sequence for auto
 hibern8
Date: Wed, 21 Oct 2026 14:19:51 +0900
Message-Id: <20261021051951.1687479-1-hy50.seo@samsung.com>
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
X-CMS-MailID: 20261021052403epcas2p43e1a022f46314c1a9d1ffb66502c29eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261021052403epcas2p43e1a022f46314c1a9d1ffb66502c29eb
References: <CGME20261021052403epcas2p43e1a022f46314c1a9d1ffb66502c29eb@epcas2p4.samsung.com>

In the case of auto hibern8, hibern8 entering or exiting occurs
without a cmd, so it is not correct to check 
for the presence of a cmd before checking for auto hibern8 errors.
Thus, the order of the auto hibern8 error check changed.

Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bcc2512bf34b..c8a70d7d210d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5928,6 +5928,9 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
 	struct uic_command *cmd;
 
 	guard(spinlock_irqsave)(&hba->host->host_lock);
+	if (ufshcd_is_auto_hibern8_error(hba, intr_status))
+		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
+
 	cmd = hba->active_uic_cmd;
 	if (!cmd) {
 		dev_err(hba->dev,
@@ -5935,9 +5938,6 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
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

