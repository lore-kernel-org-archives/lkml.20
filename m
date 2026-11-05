Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865666;
	b=cFMXw3ya+y2j4hGXiOWk8ZM/nTIDxzCrfFgzmMT9qAffi7X6ueBHB67eboxjhWFtujUh
	 RLMlu+Hx1xiPipu5259MB8iV10cgnwgESC/RTbDv30XfFXf7H86RngBEeESlY+Yec0K3M
	 xQtDQtOIUn+FL/qJlRxbWhuPu+uDUpl71AN8pRtScRpBpndMW6hfpor820Gqs69oEJdDc
	 m1vsm7jjV3v0LH0kBLrnqBls2Oqs/37FH2WHT5KLqMR8YkcN9wrsCwJVE/V7MptwG+TsS
	 rKoTGwbMqTjvrTAlwYSVxNHczy+RADs9fd4OjTd7pV2KEGPBesLuw3dT5o/jA9Z6Snw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865666;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=yw5tsAO5lS0AS/1qLsze/Yemgcp7JrJeZNULuFKQn/4=;
	b=FOfWVw4c+v0nlGGnag6pYvJdQ4sAGL4n2JybP8NFPDsHXLW04RqLt/mlXw1fLKv2429K
	 luuEQIdcjRYuHV7a6Vn8vK3MI1VmwK7W81118eDsUaQFOm7yHRnses+ku26dCuSnXgJft
	 wCM72xa0/P2iuoq/tGwl8zaf4BZTYfObOX7AtTBPzCZhDgwrS/BzcJ1VCJ98SAmzkmhSV
	 YIJ1cZ8PSfU41zcdcrnFZuqHM5Al5vCAMNrNgo5YICONMX4J2E2WDvFDmQp+cfx3o4Cz+
	 In47jawH0D+jbzk/PtcPOfXv3U6nSrtJ8WcYyj4N31UWc2VjNZJcGas7LE/iD4SGf5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cngaEQJ6;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0AB606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C0AB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cngaEQJ6
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261105080102epoutp02ffa16665b298933dce6b73dd22d447b5~lF1Dd4f0W0982409824epoutp02e
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:01:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261105080102epoutp02ffa16665b298933dce6b73dd22d447b5~lF1Dd4f0W0982409824epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793865662;
	bh=yw5tsAO5lS0AS/1qLsze/Yemgcp7JrJeZNULuFKQn/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cngaEQJ6+Hm2wuMdUX56qYpCDmxveVm0a+tMU+8F0UTjiR3Q+BK+g2W410rqeYiK1
	 XDgJ4uSQ7hNhKAon0X3iOJp5SDlUY+eoFa2OXSWV2s188Ju2SRrBBtcAP+CAf+Zljl
	 Er4t4dJSfi1299vme0pDCxHEVRvFcYTLD75XA280=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261105080102epcas2p39ace591585cadb66d08a63f51fffab23~lF1C-U9nt2411424114epcas2p3c;
	Thu,  5 Nov 2026 08:01:02 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.201]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jKvrY5Mn0z3hhT8; Thu,  5 Nov
	2026 08:01:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20261105080101epcas2p4c40f0278beb94d27c7de0621f54f91fd~lF1B9nCO70642006420epcas2p4U;
	Thu,  5 Nov 2026 08:01:01 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261105080100epsmtip21e3b13c2c3281af270758cef04d849a4~lF1B2wWCT2552925529epsmtip2x;
	Thu,  5 Nov 2026 08:01:00 +0000 (GMT)
From: HOYOUNG SEO <hy50.seo@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, mkp@kernel.org, martin.petersen@oracle.com,
	stanleyjhu@google.com, alim.akhtar@samsung.com, kwangwon.min@samsung.com,
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Cc: HOYOUNG SEO <hy50.seo@samsung.com>
Subject: [PATCH v5 2/2] scsi: ufs: core: Do not recover the link early in
 the error handler during system PM
Date: Thu,  5 Nov 2026 16:56:36 +0900
Message-Id: <acafa54491e27cab79150be04bd7dc91b6b352ad.1793865172.git.hy50.seo@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793865172.git.hy50.seo@samsung.com>
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
X-CMS-MailID: 20261105080101epcas2p4c40f0278beb94d27c7de0621f54f91fd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105080101epcas2p4c40f0278beb94d27c7de0621f54f91fd
References: <cover.1793865172.git.hy50.seo@samsung.com>
	<CGME20261105080101epcas2p4c40f0278beb94d27c7de0621f54f91fd@epcas2p4.samsung.com>

ufshcd_err_handler() recovers the link without taking hba->host_sem
whenever hba->pm_op_in_progress is set. That early path was added by
commit f966e02ae521 ("scsi: ufs: core: Fix runtime suspend error
deadlock") because the regular error handling would wait for a runtime
PM operation that cannot complete while the error handler is waiting.

pm_op_in_progress is also set during system suspend and system resume,
where the early path is not needed and runs concurrently with the PM
path itself. For example, if a LINERESET is reported and the hibern8
exit fails in __ufshcd_wl_resume() during system resume, both
ufshcd_err_handler() and __ufshcd_wl_resume() call
ufshcd_link_recovery(), and the host and the device may be reset at the
same time.

The system PM callbacks hold host_sem from ufshcd_wl_suspend() until
ufshcd_wl_resume() returns, so the regular error handling can simply
wait for them. Skip the early link recovery while a system PM operation
is in progress. Runtime PM, shutdown and poweroff do not hold host_sem
and keep the early link recovery.

Since pm_op_in_progress does not tell which PM operation is running, add
hba->system_pm_in_progress and set it in __ufshcd_wl_suspend() and
__ufshcd_wl_resume().

Fixes: e23ef4f22db3 ("scsi: ufs: core: Fix error handler host_sem issue")
Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
---
 drivers/ufs/core/ufshcd.c | 10 +++++++++-
 include/ufs/ufshcd.h      |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3b5580ac390c..761ffc8f0a32 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7091,9 +7091,13 @@ static void ufshcd_err_handler(struct work_struct *work)
 		 * runtime resume. This avoids potential deadlocks that could
 		 * happen if we tried to resume the device while a PM operation
 		 * is already in progress.
+		 *
+		 * Do not do this for system PM. The system PM callbacks hold
+		 * host_sem, so the regular path below runs after them instead
+		 * of resetting the link concurrently.
 		 */
 		ufshcd_rpm_get_noresume(hba);
-		if (hba->pm_op_in_progress) {
+		if (hba->pm_op_in_progress && !hba->system_pm_in_progress) {
 			ufshcd_link_recovery(hba);
 			ufshcd_rpm_put(hba);
 			return;
@@ -10393,6 +10397,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	enum uic_link_state req_link_state;
 
 	hba->pm_op_in_progress = true;
+	hba->system_pm_in_progress = (pm_op == UFS_SYSTEM_PM);
 	if (pm_op != UFS_SHUTDOWN_PM) {
 		pm_lvl = pm_op == UFS_RUNTIME_PM ?
 			 hba->rpm_lvl : hba->spm_lvl;
@@ -10565,6 +10570,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		hba->clk_gating.is_suspended = false;
 		ufshcd_release(hba);
 	}
+	hba->system_pm_in_progress = false;
 	hba->pm_op_in_progress = false;
 	return ret;
 }
@@ -10576,6 +10582,7 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	enum uic_link_state old_link_state = hba->uic_link_state;
 
 	hba->pm_op_in_progress = true;
+	hba->system_pm_in_progress = (pm_op == UFS_SYSTEM_PM);
 
 	/*
 	 * Call vendor specific resume callback. As these callbacks may access
@@ -10666,6 +10673,7 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
 	hba->clk_gating.is_suspended = false;
 	ufshcd_release(hba);
+	hba->system_pm_in_progress = false;
 	hba->pm_op_in_progress = false;
 	return ret;
 }
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index be62165b785e..0d28853e4107 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -974,6 +974,7 @@ enum ufshcd_mcq_opr {
  * @spm_lvl: desired UFS power management level during system PM.
  * @pm_lvl_min: minimum supported power management level.
  * @pm_op_in_progress: whether or not a PM operation is in progress.
+ * @system_pm_in_progress: whether or not a system PM operation is in progress.
  * @ahit: value of Auto-Hibernate Idle Timer register.
  * @outstanding_tasks: Bits representing outstanding task requests
  * @outstanding_lock: Protects @outstanding_reqs.
@@ -1129,6 +1130,7 @@ struct ufs_hba {
 	enum ufs_pm_level spm_lvl;
 	enum ufs_pm_level pm_lvl_min;
 	int pm_op_in_progress;
+	bool system_pm_in_progress;
 
 	/* Auto-Hibernate Idle Timer register value */
 	u32 ahit;
-- 
2.34.1

