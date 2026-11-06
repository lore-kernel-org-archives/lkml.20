Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793931624;
	b=TucldUk2XgMZjJQHc4Vphb+CcESUfxVpeGiQb/pro0xBZG8FDPllZZvwgM3y+ocVZD5w
	 3Nro45K8ZtZpJjWT3IgGOLnGBeTnFesqRLw3jlDlErkzYh/rvn+dmjtRpIBoMGFHEdI4c
	 PJi770mBIE+1U+ijfJKeuwyaLde4Rf0oNxoF512eyhT3n/gRzFEbRLVpFBM5CSyrIPltc
	 MOXJiw8f++kCCMTBUxu6tyDHfupOpQiAQdzSNYtzjSUNcFT4bvWM3udiSiWcO2UDdA3Rw
	 VBRKMCz5OPrRZOfSfp9WE2wO0DPz9ZvLoAv1uhwDezaOZt8xVCzh8xankoJwFvzD+9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931624;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=10o+RTT7nhlUXmfSR4iy+K6C3b+86o10l9/Zd7+pSA0=;
	b=GV7AVj+SwHUPARqGLM2zQXSrrrRK2WAuXtyQMfdmOWVT5GruTxn6y5ed35jzS+67ly8u
	 Y+mokOKsAnJnjeM790+Ya2Ro/9VpTZIf7fhj86c6a0tCV1EN3TXWDIE7GhEatFTP/mO1D
	 keLA+eDCs0azQQBPReqfBE3qFhSgN2XPCLd8C1lhrNgxm8XKz1Nid/TpAzo1YfBAm0RfM
	 DvKKQGg+bi7qfQI6NgrzXWSxbi4gFE/dsD1YJlesCW+Nbx/AjtPgG0iyAbb2Oczz++bIS
	 RsGcM9266NmkcCBeJcLQe5+hqKJp9ZCas1O/m28l/ywHIyWvMEwUOI4qsCufLVlsQ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=No+2Bjfl;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6668A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=No+2Bjfl
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261106022019epoutp02b7558b2ed8bc336d8516c924a37c5325~lU02_2oiy3101931019epoutp02G
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:20:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261106022019epoutp02b7558b2ed8bc336d8516c924a37c5325~lU02_2oiy3101931019epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793931619;
	bh=10o+RTT7nhlUXmfSR4iy+K6C3b+86o10l9/Zd7+pSA0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=No+2Bjflxklbn5PKnaG3qnnlEJAJKgyayUdAoFX/J0BbcRu0xf2SHswKDXUqKb9Lo
	 1exFGkO2DHRZ/UuDBb0bwXj7yTuzDhoTqPilLi/33b7Wwjhxml4jHIs0YMYnebGVh8
	 CpHkoPBWLYJ05FFBNqjE0qJTWr9+iYN6ThH3/5is=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261106022019epcas2p3b2cde84807f9a09df799b4a5a080acf5~lU02u-4jM0947409474epcas2p3o;
	Fri,  6 Nov 2026 02:20:19 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.211]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jLNDz2R8Sz3hhTN; Fri,  6 Nov
	2026 02:20:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20261106022018epcas2p44e9634ca254c1a5d4c1ecb64723512ef~lU01xu25V3101631016epcas2p4P;
	Fri,  6 Nov 2026 02:20:18 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106022018epsmtip1292c924dd6a38df0347e663e35f54460~lU01suhY10269602696epsmtip1d;
	Fri,  6 Nov 2026 02:20:18 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, mkp@kernel.org, martin.petersen@oracle.com,
	stanleyjhu@google.com, alim.akhtar@samsung.com, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v6 0/3] scsi: ufs: core: Avoid redundant link recovery from
 the error handler during PM
Date: Fri,  6 Nov 2026 11:15:50 +0900
Message-Id: <cover.1793931113.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261106022018epcas2p44e9634ca254c1a5d4c1ecb64723512ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261106022018epcas2p44e9634ca254c1a5d4c1ecb64723512ef
References: <CGME20261106022018epcas2p44e9634ca254c1a5d4c1ecb64723512ef@epcas2p4.samsung.com>

If a LINERESET is reported and the hibern8 exit fails during system
resume, both ufshcd_err_handler() and __ufshcd_wl_resume() call
ufshcd_link_recovery(), and the two recoveries are not serialized.

Patch 1 makes ufshcd_link_recovery() clear the saved errors like
ufshcd_reset_and_restore() does, so the error handler does not act on
errors that have already been recovered.

Patch 2 restricts the early link recovery in ufshcd_err_handler(), which
does not hold host_sem, to runtime PM. For system PM the error handler
now waits for host_sem, and for shutdown and poweroff it stops.

Patch 3 sets hba->shutting_down in ufshcd_wl_poweroff() like
ufshcd_wl_shutdown() does, so that the error handler stops during
poweroff.

The early link recovery is kept for runtime suspend and runtime resume.
During runtime resume it can still run concurrently with
__ufshcd_wl_resume(). Removing it there needs a closer look at the
deadlock that it avoids.

Changes in v6:
- Go back to a single flag for runtime PM, hba->runtime_pm_in_progress,
  instead of the system PM flag of v5, and set it in
  ufshcd_wl_runtime_suspend() and ufshcd_wl_runtime_resume(). The error
  handler no longer reads two variables that are not updated atomically
  (Sashiko review of v5).
- Add patch 2. With patch 3, poweroff no longer takes the early path,
  and ufshcd_wl_poweroff() holds neither host_sem nor sets
  hba->shutting_down (Sashiko review of v4).

Changes in v5:
- Patch 2: track system PM (hba->system_pm_in_progress) instead of
  runtime PM, so that the early link recovery is only skipped where
  host_sem is held.

Changes in v4 (as suggested by Bart Van Assche):
- Replace the is_sys_suspended check of v3 patch 2 with a flag set in
  __ufshcd_wl_suspend() and __ufshcd_wl_resume(), which also covers a
  system suspend failure.
- Add Fixes: tags.
- Do not serialize ufshcd_link_recovery() with a mutex: it calls
  ufshcd_probe_hba(), and a device command timing out inside it ends up
  in ufshcd_eh_timed_out(), which calls ufshcd_link_recovery() again.

Changes in v3:
- Patch 2: reword the commit message only, no code change. The error
  handler does not always run a full recovery after a failed system
  resume; it stops according to ufshcd_err_handling_should_stop() (e.g.
  in UFSHCD_STATE_ERROR). Describe this behavior and refer to the commit
  that added the early link recovery (Sashiko review).
- Patch 1: no change.

Changes in v2:
- Add patch 1. As pointed out by the Sashiko review, saved_err and
  saved_uic_err are still set after the resume path recovered the link,
  so with v1 alone ufshcd_err_handler() would run a redundant recovery
  once host_sem is released.
- Patch 2: describe the race and the system/runtime PM difference in
  the commit message, and add a comment.

v5: https://lore.kernel.org/linux-scsi/cover.1793865172.git.hy50.seo@samsung.com/
v4: https://lore.kernel.org/linux-scsi/cover.1793851432.git.hy50.seo@samsung.com/
v3: https://lore.kernel.org/linux-scsi/cover.1792989286.git.hy50.seo@samsung.com/
v2: https://lore.kernel.org/linux-scsi/cover.1792755091.git.hy50.seo@samsung.com/

HOYOUNG SEO (3):
  scsi: ufs: core: Clear saved errors in ufshcd_link_recovery()
  scsi: ufs: core: Limit early link recovery in the error handler to
    runtime PM
  scsi: ufs: core: Set shutting_down in ufshcd_wl_poweroff()

 drivers/ufs/core/ufshcd.c | 30 ++++++++++++++++++++++++++++--
 include/ufs/ufshcd.h      |  2 ++
 2 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.34.1

