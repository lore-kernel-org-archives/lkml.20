Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989704;
	b=poANjKNPvkEjM87m0dXONZwDaXINNbX7A564oxWmJsPdgRxWBlLHOe0VZOpl1OecNWET
	 uDu6hqZAbO/WOomWTVXZdDryUWC4Dqjpcr9Hwp810u43kKWYDo8+X3Q7TtXWbBfaNbdyl
	 qrMytlTqwFe8BwOmNTvFoGYWTcqNlzo5LmcD9cK75EZOLKHCCsielz8wcdSJ2nKbpxm+B
	 mjVYzSIirXgLozcmHacH0DpjextPAWsy6lXtjMDeS6f2D3Ii4lMTYKFoPL0IgjjBNkqlF
	 KyWk6wbyY5u0F4w1q7g62OgM1fcSOq+cNBuWh7v0fJzz6dpEeW3c9aAZElqU+mbSbdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989704;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=8Uha6gBOHxxpMhg5C4HSAGVuxKhZmxnkljAaEvU5MkM=;
	b=ElZVsIFUWX2viIPCuYGwbZc/bKDtylklo7I0dAueC9jsZTEzZveunCzIxszOiVvsZVaO
	 BXX9cWYbncFwz8d7mfRA9UHz0DsdVXJ6OV5gUoIu2vOt0P706iQM34GR8Mfx1S6YSGlXa
	 gvOtge2WLBwpejtpKDHhpDBxLd0gFxDd5DoLgwEG5W9K3v6MYKWqpBBob2bB7v5DR558U
	 c0kn3crDAryeBTQ+5Q7O56cxQ9z+iqvz+8CvznbkCLfV24wImcVWMWvHl9lSnaBJ9lCYM
	 wp1taW4btqOv8QFRCI25PXC4YZ0XQ8MjisP278qiTYL7UwAvIVM/BkDaazLyTPSYlQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uYBHNih4;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uYBHNih4
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261026044139epoutp025068b7e82bcaadfd0e838f5459160e60~h_qHIP7wH2412224122epoutp024
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:41:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261026044139epoutp025068b7e82bcaadfd0e838f5459160e60~h_qHIP7wH2412224122epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792989699;
	bh=8Uha6gBOHxxpMhg5C4HSAGVuxKhZmxnkljAaEvU5MkM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uYBHNih4LGnqNhzVOIdotzXDYvZ+IRjIFhXj9zoYDaXhgLHqnC5RiZXDl63aN3TpN
	 grVxEFRiTTDBoBXEHRZ84kFxPRTacLwEOztLgfGjFao4wn7bMbDM3+meFZP3apP8Wl
	 YkelrVcpvO5ZV5DuKFhRhvAGVQNb2Vd7MR/L7aBo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20261026044139epcas2p2303decafac496954077a710720e638e1~h_qG3nwto1713717137epcas2p2f;
	Mon, 26 Oct 2026 04:41:39 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.199]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jCgv65V0zz6B9m7; Mon, 26 Oct
	2026 04:41:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026044138epcas2p19feb1c8130a1c07b67b1f27eefb1c300~h_qGCWphS2359023590epcas2p1Z;
	Mon, 26 Oct 2026 04:41:38 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026044138epsmtip1fff4495ec607331d61b51e7d3947f3a2~h_qF9SeyM2136321363epsmtip1I;
	Mon, 26 Oct 2026 04:41:38 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, bvanassche@acm.org, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v3 0/2] scsi: ufs: core: Avoid redundant link recovery
 during system resume
Date: Mon, 26 Oct 2026 13:37:19 +0900
Message-Id: <cover.1792989286.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261026044138epcas2p19feb1c8130a1c07b67b1f27eefb1c300
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026044138epcas2p19feb1c8130a1c07b67b1f27eefb1c300
References: <CGME20261026044138epcas2p19feb1c8130a1c07b67b1f27eefb1c300@epcas2p1.samsung.com>

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

Changes in v3:
- Patch 2: reword the commit message only, no code change. The error
  handler does not always run a full recovery after a failed system
  resume; it stops according to ufshcd_err_handling_should_stop() (e.g.
  in UFSHCD_STATE_ERROR). Describe this behavior and refer to the commit
  that added the early link recovery (Sashiko review).
- Patch 1: no change.

HOYOUNG SEO (2):
  scsi: ufs: core: Clear saved errors in ufshcd_link_recovery
  scsi: ufs: core: add is_sys_suspended state before recovery

 drivers/ufs/core/ufshcd.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1

