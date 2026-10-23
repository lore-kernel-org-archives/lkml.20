Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755551;
	b=eJaF4WIyIeBWoPqKSkVHhp/NHKFr/H8ztu3OlZ8baFA9txW1oeU4jkrixC9s619VLNLo
	 xRbTze1TgbpsnL8n2PBnysx+aw4yc5dO9Kw/7M7PYXA0HYc2Bsh1CGZwXpetkD4DRgsJQ
	 2+1S0SM3fdypa9CE5UkcXHGT+bxWRBVzvMUEE1YFe1TBgM7fhghjgz7rI419be68uCPvN
	 PRGuesiA7J8+7+AJdttiwI5WYR0g/+iVN6QMnccLeHcnFXq4xSXygA6i4xgyzMuZ0+KA4
	 B03sQlbBK5jTfHZRgTzyc+gnhyqY8QNhvdT+ZQ70ukJa++oeRb8eWqW9zcsxMY6W6Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755551;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=S+vCK1YIdasZf4CYFvvYVy8frf6VJ05KbEUpJ4Pi40s=;
	b=xsFHQb9/GLAY5nNvOwhVXPVMX4RcrMSpq4W5P/EIo8/OMv0eGcrmWz7PYmXMJkaU+il8
	 pyuF+QoKZW+roBsz45PQHmhhguyFz8ig/Pp6RFjrAK/mm6cRNjFXDEAP8EgiskFFKWTGu
	 dZ9I7PH3CMmox7m5mQdeE/J9WrdTWrrtYPwhhexizfZ/gzQ76g59vSDgFIBx1c3H1uKIR
	 wFLR+ZdSvnKiZY7zOmQoQussnJhR4q4Iq/V3DiKNULxYNlxGcTJ4JkhxqVecEmMchHEAo
	 lQ5clgfF0NQhQJx1lIfLG8HchI5MzrcqmbmKR2iZWnGbVl+8MIb8XUvfj+jgX9CO5PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=sThAEvrd;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93620606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93620606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=sThAEvrd
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261023113908epoutp03ff88c86a433c083bc4f5045e665e67af~hJaxH9uvw1754617546epoutp03b
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:39:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261023113908epoutp03ff88c86a433c083bc4f5045e665e67af~hJaxH9uvw1754617546epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792755548;
	bh=S+vCK1YIdasZf4CYFvvYVy8frf6VJ05KbEUpJ4Pi40s=;
	h=From:To:Cc:Subject:Date:References:From;
	b=sThAEvrdfO4fX4NqsBPXz/lrm3kx8BMcRJT1+oKJrkgIuVyqBkQwBMb6hpx8XEJHR
	 0nok3+4DqUsg+DxeFGVtcik7KaA6dTYUaYl53shjR4AdFenrEstkucJNZ+7ukAE1cQ
	 eMIXeQ7AaKxf3MlqwJSByr75dH5xRLc0ojSphYls=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261023113907epcas2p41c0623414bb6fe91917a13e48db5600f~hJav_0z6z1753517535epcas2p4m;
	Fri, 23 Oct 2026 11:39:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.205]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jB1JC0dG6z6B9m6; Fri, 23 Oct
	2026 11:39:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20261023113905epcas2p36f5e7bf1d3954ac8c666a25a922fc031~hJauitFHw2175721757epcas2p30;
	Fri, 23 Oct 2026 11:39:05 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261023113905epsmtip1c4b2e52ba9070c8f9aef7078737e67f4~hJaucArbO0611306113epsmtip1h;
	Fri, 23 Oct 2026 11:39:05 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, bvanassche@acm.org, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v2 0/2] scsi: ufs: core: Avoid redundant link recovery
 during system resume
Date: Fri, 23 Oct 2026 20:34:50 +0900
Message-Id: <cover.1792755091.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261023113905epcas2p36f5e7bf1d3954ac8c666a25a922fc031
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023113905epcas2p36f5e7bf1d3954ac8c666a25a922fc031
References: <CGME20261023113905epcas2p36f5e7bf1d3954ac8c666a25a922fc031@epcas2p3.samsung.com>

If a LINERESET is reported and the hibern8 exit fails during system
resume, both ufshcd_err_handler() and __ufshcd_wl_resume() call
ufshcd_link_recovery(), and the two recoveries are not serialized.

Patch 1 makes ufshcd_link_recovery() clear the saved errors like
ufshcd_reset_and_restore() does, so the error handler does not act on
errors that have already been recovered.

Patch 2 makes ufshcd_err_handler() wait for host_sem instead of
recovering the link early when the hba is system suspended.

Changes in v2:
- Add patch 1. As pointed out by the Sashiko review, saved_err and
  saved_uic_err are still set after the resume path recovered the link,
  so with v1 alone ufshcd_err_handler() would run a redundant recovery
  once host_sem is released.
- Patch 2: describe the race and the system/runtime PM difference in
  the commit message, and add a comment.

HOYOUNG SEO (2):
  scsi: ufs: core: Clear saved errors in ufshcd_link_recovery
  scsi: ufs: core: add is_sys_suspended state before recovery

 drivers/ufs/core/ufshcd.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1

