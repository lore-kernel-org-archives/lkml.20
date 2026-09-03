Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449A34165B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401774; cv=none; b=e+QuF0dOLbIjWr9I5nyuCMjpKoNTyycTzA89oSliM47PkMV9zYgWnfUIqdsOBM/lJ4b16UfwRzW/N4WiwS6bQ8seITjxTpz98ei88rSVS7TYWw2w5rKpol5A7xOTYqA8iB2CngOlCLmNPYeYae7tnCxxFinty/u+s5EjgQDEOP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401774; c=relaxed/simple;
	bh=7uDxDA+9YGPfFObepLXMSaNMgViB4yTDUFprc9wOwvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rz9OmuX9MzQ1nEJyR0myNRz6gV0t7v31eGa/1qZsfbfxE9v0v+NIcHixPCUuevLCGonDYIlQffU7+cFRajSzJ+9rasc2pqlYeODNBUvRxS2Fc9zM75NKjMmoBo0T07zmNBbZ4xACg1qfYNwPECVmzfxK/T4+24oChFzIeeZmADs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ORWCSIhl; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ORWCSIhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788401718;
	bh=e1VUNUQlMg1MCx8hA5n24AtoXedvcMVZEK6NYKkfTKg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ORWCSIhla07GA7oppnADl/3g7RLe/w590zxolRcn9gSoxg9gMoWXJ4Yc5jg3csAQI
	 L06Xv+5kjeXWfd/7LRnLr6evAgQ5Lz93Er/tPffcMn6eACdsULt/UgwqvhUS7NuD1S
	 yVUih3xMhL7JCwgAHgeuJv0wy/4zF7cDxTFx4XIM=
X-QQ-mid: esmtpgz16t1788401712t3e9f05e1
X-QQ-Originating-IP: bMS2EqBMEyD8n8HuSXP+i7ZyiGSYTxj0CYMPqPnOlp0=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 10:15:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6501738363549994098
EX-QQ-RecipientCnt: 15
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org,
	laurent.pinchart@ideasonboard.com
Cc: tuhaowen@uniontech.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	huangbibo@uniontech.com,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	oneukum@suse.com,
	pavel@kernel.org,
	stern@rowland.harvard.edu
Subject: [PATCH v5 1/4] PM: hibernate: clear in_suspend before freeing the snapshot
Date: Thu,  3 Sep 2026 10:14:56 +0800
Message-Id: <55f5c4da1e27b13d97266989166e2d877f518957.1788399733.git.tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1788399733.git.tuhaowen@uniontech.com>
References: <20260730153817.GA1555869@killaraus.ideasonboard.com> <cover.1788399733.git.tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MzCu24z+DPuU/c4yQWhZHbt0qK33nVkZQZO5/j/455jd7xEsYg9UZkGo
	KfgOjaa1fcWWIDh6ODTSty+NHWnJoL5EVOrxzCJ9ujmeXR7Yyw8Wq2WuQ331UQWtJ4Y8LG3
	862YdzqKF5214U6GSpftaulD66yP+SWg/PAbvIb9Lb8o0M5wpTQ3s1q2jex92PR8a4Ix8UR
	fYIsDm8Y5x83Sm+KNZKgJEME0AXTgROmdjXWRvjWNnjvi55MaAlS2abOqI4UutlrR1C48+x
	fA4viu8WoAm4hKGm6jTvomckyHSzayy7U60SPT0oH2Z3B3gzJazkkZQ2H4numccEmB4maFd
	wWz9G7NYwH8DhLyaVcaZQwe1V2qBVoeucQYLypLfqUGqIjQiJCPDlbC9RrmyciFYF7kCBtr
	R5vmA64cL1XteRi87y2Egq6nexo7MeWwib4r2pSfP0Zkl5JdIIOptu/nESGR53BWfsO6mDF
	XZdJ4KIIDe0zCjQgSrJ7ucX6y7ZozxLJSAZU31x6TDHZBC0GARxVAcYT/hM4lFY6oDn74vm
	fiygGLXI6usLV8ZjCZCVHGZ7N2eP//1SQxDztocyDTk/xtJA0YrBAzRdzOSlg9nGmyNEswR
	4xZyBTgJXBhtusRd6beXZrk0ONqMGKCwyGKkBAaqpCAOTg1lfjSPvt926Aot5JqImi4c1I7
	Lly5Q8ityrwfVC79NVJNk1V/0ec6PrpJokn7vRdkMrXPWyUVlPFxTqAULH8GOtZ7eIuq6bf
	4+juM320RcDNqatuPN1I76gjnwfDsAZ5FGXnOIAdUnuxlfhmFC3HCfBEdr78Idtp6h65f/N
	Aq++yD0wFKY17YnPzEVOGyBfoY22w8/vKTX1Re/8ukQNQdGv7OUdSxfs/jFevMJRUG2Q3Oo
	pC4+Mj3ta+wZ6ygB843BgryI5qzBkwrV/ZrJFT8H6FqZ69ZM7i3ztmHGXQ2gWtH4f45SX/F
	0tj1fNMRv03Ih+yBPKcBWqwmk1QM9w+9+jTlzr1kkjIqQkUYji98B2igRYWBHkmdp4yKHRS
	kOqgFoMvH6ZicH4EI/4Dn+2nAR5SGs6f/Zt72WuMw31vmE3r8Rr3XUgo1x3n+rxj5Zv0oxA
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

in_suspend indicates that a hibernation snapshot has been created and is
still available.  Keep that state consistent with the lifetime of the
snapshot memory by clearing in_suspend before swsusp_free() releases it.

If image creation fails after in_suspend has been set,
hibernation_snapshot() releases the snapshot memory but currently leaves
in_suspend set.  Preserve its value locally long enough to select the
appropriate device resume message, then clear it before releasing the
snapshot.

Also clear in_suspend before releasing the snapshot after swsusp_write()
returns.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
---
 kernel/power/hibernate.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index af8d07bafe02..6d3e637c5a02 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -418,6 +418,7 @@ static void shrink_shmem_memory(void)
 int hibernation_snapshot(int platform_mode)
 {
 	pm_message_t msg;
+	bool snapshot_done;
 	int error;
 
 	pm_suspend_clear_flags();
@@ -474,15 +475,18 @@ int hibernation_snapshot(int platform_mode)
 	 * returns here (1) after the image has been created or the
 	 * image creation has failed and (2) after a successful restore.
 	 */
+	snapshot_done = in_suspend;
 
 	/* We may need to release the preallocated image pages here. */
-	if (error || !in_suspend)
+	if (error || !snapshot_done) {
+		in_suspend = 0;
 		swsusp_free();
+	}
 
-	msg = in_suspend ? (error ? PMSG_RECOVER : PMSG_THAW) : PMSG_RESTORE;
+	msg = snapshot_done ? (error ? PMSG_RECOVER : PMSG_THAW) : PMSG_RESTORE;
 	dpm_resume(msg);
 
-	if (error || !in_suspend)
+	if (error || !snapshot_done)
 		pm_restore_gfp_mask();
 
 	console_resume_all();
@@ -865,6 +869,7 @@ int hibernate(void)
 
 		pm_pr_dbg("Writing hibernation image.\n");
 		error = swsusp_write(flags);
+		in_suspend = 0;
 		swsusp_free();
 		if (!error) {
 			if (hibernation_mode == HIBERNATION_TEST_RESUME)
@@ -872,7 +877,6 @@ int hibernate(void)
 			else
 				power_down();
 		}
-		in_suspend = 0;
 		pm_restore_gfp_mask();
 	} else {
 		pm_pr_dbg("Hibernation image restored successfully.\n");
-- 
2.20.1
