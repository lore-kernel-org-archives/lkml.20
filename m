Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745897;
	b=LolG651eAYVNZaNY2/Ao2t4s5EVgoEL8jWjLxq1tSYrVIwkLrmtJm7GvkbKtsGetGG43
	 qFBn/H5NBwfRnrWBFXMBbpUrMmUWGDC8YPOeetwZh9+/D8uBntTSVliywnbjCNUtdOCkY
	 xLEcveJ9YEERte9gZadXWWEV57oej7vb+5/E967/D92LIY98SrSuhZpzFxI8beNociFo2
	 hnIX7j0AVY/j4qpbXBJRMtaqTqKexB3mS/XhUCsjkY9oqdDAiAnK9s0oSYrw5qhPINkpv
	 hhJy7OXOhd9YlrjU6ZfJMKSB0Z8B3wk40iSI3rJhtHDKCfeUg/hcGiZLYmGqmH5L5+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745897;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:X-Hop-Count:
	 X-CMS-RootMailID:References;
	bh=U2a7kuFhlELNf+MmGZOqsc2PxuXwSEDIwnIA4z6ukmE=;
	b=zeAzpmpWBvRtKfLZUrcyi0I95uiMetHuOcSYWQuza0QdIrKNrNt6SvWevXveBi9LULal
	 wkfP8c2ZHpc9bmVK7eSlR8Va99dCzFhVmMS1cBtmZXkcGIOGtWsa4Lbu09stXu9RLRX4S
	 +jU81gKXLoCJRRzy+DEWr78IPsorzailFQR5cKIv7rnes2foLf3NLA8Rj2D+0BZO8pU3a
	 Bepg/Yz9B3pUXY3/zvpnT1zGLyVgJbMxA+nvZ3A+fJeusHlJhbO0l1ozeF3djHRDag2FQ
	 6ysxMkaXXVuxcbUl2BudUMzqi9oDN5qm0A4hly6H+80Ew1mlmD/m7rJECLbKc0AOang==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JlEjxIFz;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76BC606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76BC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JlEjxIFz
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261023085803epoutp02a6a7ac4693787b4d0c97a491a44024ab~hHOIBuLLm0590005900epoutp02T
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:58:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261023085803epoutp02a6a7ac4693787b4d0c97a491a44024ab~hHOIBuLLm0590005900epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792745883;
	bh=U2a7kuFhlELNf+MmGZOqsc2PxuXwSEDIwnIA4z6ukmE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=JlEjxIFzthyIx9KZq83wP5HNnK2eV4x6jBn7JMUZMTZ/YA4t1U5zhs7MejELjpUlr
	 VFZepre60nAzAFweeG1ow4yO+fLKOASSYuCk+gS7vQs1aJ+mT1YjEuTtk6j3Yu7iHL
	 RtvDjdO7V5+rKQQGgsXeGB5Nli9/m93bs+0Q2C8A=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261023085803epcas2p31a4742e1500cb7a7413ad9b331bbda04~hHOHuhcxo1339413394epcas2p3C;
	Fri, 23 Oct 2026 08:58:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j9xkM2Lzzz6B9m6; Fri, 23 Oct
	2026 08:58:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20261023085501epcas2p3cc1319f4442d8fc77fdd64064bede2ed~hHLetksEP2290922909epcas2p33;
	Fri, 23 Oct 2026 08:55:01 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023085501epsmtip24b8ca6dd99dc5fc49e638b761bcd1265~hHLelS3Hj2401224012epsmtip2j;
	Fri, 23 Oct 2026 08:55:01 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, bvanassche@acm.org, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com,
	peter.wang@mediatek.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v1] scsi: ufs: core: add is_sys_suspended state before
 recovery
Date: Fri, 23 Oct 2026 17:50:46 +0900
Message-Id: <1582071873.61792745883325.JavaMail.epsvc@epcpadp2new>
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
X-CMS-MailID: 20261023085501epcas2p3cc1319f4442d8fc77fdd64064bede2ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261023085501epcas2p3cc1319f4442d8fc77fdd64064bede2ed
References: <CGME20261023085501epcas2p3cc1319f4442d8fc77fdd64064bede2ed@epcas2p3.samsung.com>

If a linereset occurs during ufshcd_wl_resume and
a hibern8_exit fail occurs, recovery is performed redundantly
in both the err_handler and the __ufshcd_wl_resume function.
To prevent this redundant recovery, a check for the is_sys_suspended
state has been added to the err_handler.

Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bcc2512bf34b..a164f23e8968 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7042,7 +7042,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 		 * is already in progress.
 		 */
 		ufshcd_rpm_get_noresume(hba);
-		if (hba->pm_op_in_progress) {
+		if (hba->pm_op_in_progress && !hba->is_sys_suspended) {
 			ufshcd_link_recovery(hba);
 			ufshcd_rpm_put(hba);
 			return;
-- 
2.34.1


