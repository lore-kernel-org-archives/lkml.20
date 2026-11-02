Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598803;
	b=wgRR6gmSegl0ZxZKA8RKwy/F9r3NGGxn6bCkhAMws1Lzr1nzty23jh26AIAjmrfrsSo/
	 DLwuJIxNGJOYAi1cXblYmOkMlStr+fXkMHLPm11FaQZ5gVmZD9CFFU6nF3G8uzwqWLttT
	 COvNO2CmvxoXxvZpg8LP9buLYCnayFIrBiCltyzHE8FYwaB5LYoQKG4QiVrVajLmxTV5e
	 TWB5pfb3JiZFq0qrx67vvJ85Sn+SEeT6PnudvSk9pwDqf+RBIBS9XllOKWUr7c/9Mr2qU
	 HmZaTefrGuQS4evYOV/SWy/L7zR3O4/zZF3Kf28gRhhNhJpaoeyBpjdTlfvQgX3jA5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598803;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=2rZuY/4dfde7YrWhMWEJ6Ysyy8teBsK1KI95adX/tjw=;
	b=N3sbsxvhm0npyEdbChNTt99bzqYF8SUlVE9UfFOL78fK8xDy2KmdJclWB9bkzWbT2dHs
	 Y+R4Az30suxRhBL6gvHm/XedZnE5Ita35Ae1PtnKS4e4jkC7q3Eh/mRwknw9qASPHsENw
	 LXAAU+H9+H0DCh6u88z4UQYNEcFSXFZxH4U5OdvDQMWy2O/gtrAkHbroZ9LTcYsLM02C6
	 nQkherty4HAdnLcFz3Q6z5itKfr8I/j9INhPzcMAdT/4I+X7X/nN23F8Yol3t8V0Zn95h
	 JClfr3+d/gWsEHtUC6mTethVE5jO5Ksb+49hZ8xHq7WdkKwX+W4eSgwP4EM7pI81pLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=USqK37wu;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE2606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FE2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=USqK37wu
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261102055319epoutp045468b7c1d8139c641db4bc1ad9f6241d~kJJrdxWWW2054420544epoutp049
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:53:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261102055319epoutp045468b7c1d8139c641db4bc1ad9f6241d~kJJrdxWWW2054420544epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793598799;
	bh=2rZuY/4dfde7YrWhMWEJ6Ysyy8teBsK1KI95adX/tjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=USqK37wu20Mgui0AcyY8/i8l7KwB5VahLCDp+wVFIvwD1ulf++0/BOYopFoDvYNXG
	 HAEp8nKxh/NUtgFVO0ygfcl8nwy0bGlnrEst+g5CRneWwN+1r+I8J5y56PWrz4fP99
	 CccvdkS1MC+WdzBJ1MSMK1Z7Z/oFVHnGSex2IYkE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261102055318epcas2p46d6db10285a93ab5904ae97d5fcf9cf9~kJJrE9RH10407604076epcas2p4b;
	Mon,  2 Nov 2026 05:53:18 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jJ18Z2t1Yz3hhTb; Mon,  2 Nov
	2026 05:53:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20261102055317epcas2p48b638d0c25fd024ce01960afd1e6dee6~kJJqKZxla2911529115epcas2p4q;
	Mon,  2 Nov 2026 05:53:17 +0000 (GMT)
Received: from apsw.samsungds.net (unknown [12.80.211.160]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261102055317epsmtip2cec25f8ad452d6ecd57afd1cfe9066ca~kJJqE3tKk1526815268epsmtip2X;
	Mon,  2 Nov 2026 05:53:17 +0000 (GMT)
From: Kiwoong Kim <kwmad.kim@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
	bvanassche@acm.org, kwangwon.min@samsung.com, hy50.seo@samsung.com,
	cpgs@samsung.com, h10.kim@samsung.com
Cc: stable@vger.kernel.org, stanleyjhu@google.com, Kiwoong Kim
	<kwmad.kim@samsung.com>
Subject: [PATCH v4 2/2] ufs: mcq: poll OCS after sq cleanup for device
 management commands
Date: Mon,  2 Nov 2026 14:52:58 +0900
Message-ID: <8c4bbbd746e7fc1d8c27b6b87b2d684abb74a3b3.1793598099.git.kwmad.kim@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793598099.git.kwmad.kim@samsung.com>
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
X-CMS-MailID: 20261102055317epcas2p48b638d0c25fd024ce01960afd1e6dee6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261102055317epcas2p48b638d0c25fd024ce01960afd1e6dee6
References: <cover.1793598099.git.kwmad.kim@samsung.com>
	<CGME20261102055317epcas2p48b638d0c25fd024ce01960afd1e6dee6@epcas2p4.samsung.com>

Extend ufshcd_mcq_sq_cleanup() to poll the OCS field in the UTRD of a
device management command after a successful SQ_CUS poll. UFSHCI does not
specify the order between the OCS update and the SQ_CUS update, so OCS may
still be stale when cleanup returns. Without this poll, a late response to
a timed-out query can arrive while a retry is already in flight, leaving
the host with two query contexts and raising IS.UTPES.

The poll is limited to device management commands because
ufshcd_compl_one_cqe() copies the OCS from the CQE into the UTRD only for
them. For SCSI commands, the OCS in the UTRD stays
OCS_INVALID_COMMAND_STATUS, so polling it would always time out.

The poll waits until OCS is no longer OCS_INVALID_COMMAND_STATUS or
MCQ_POLL_US elapses. -ETIMEDOUT is returned only if OCS is still
OCS_INVALID_COMMAND_STATUS after the poll. Any other value, such as
OCS_ABORTED reported by the host controller for the cleaned-up request,
means the cleanup has completed.

Here is the timeline of an actual case for this that happened with kernel 6.18.
1. The host sent a query but the device didn't respond with it for a long time.

[ 7384.156142] [4:  kworker/u40:5:10671] exynos-ufs 38300000.ufs: ufshcd_mcq_sq_cleanup, hwq 0: cleanup return code (RTC) 0
[ 7384.156154] [4:  kworker/u40:5:10671] exynos-ufs 38300000.ufs: ufshcd_query_flag: Sending flag query for idn 14 failed, err = -11

2. So after the query was timed out, the driver did SQ cleanup.
Then the host updated CQ update and raised IS.CQES,
Unfortunately, complete() was called the driver's ISR afterward.

3. The driver started to retried the query. In the meantime, it set OCS to 0xF.
Then the driver didn't wait for completion due to the previous complete() call,
and just checked OCS.

[ 7384.156163] [4:  kworker/u40:5:10671] exynos-ufs 38300000.ufs: ufshcd_query_flag: Sending flag query for idn 14 failed, err = 15

4. The driver retried the query again, but the device didn't return anything,
so the query was also timed-out.

[ 7385.660108] [3:  kworker/u40:5:10671] exynos-ufs 38300000.ufs: ufshcd_query_flag: Sending flag query for idn 14 failed, err = -11

5. A few seconds later, the device returned the response of the 1st query,
but since the host was holding two query contexts and couldn't handle it,
it raised IS.UTPES.

Fixes: 8d7290348992 ("scsi: ufs: mcq: Add supporting functions for MCQ abort")
Signed-off-by: Kiwoong Kim <kwmad.kim@samsung.com>
---
 drivers/ufs/core/ufs-mcq.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 8106d55f4041..7c2aa0e9466a 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -550,6 +550,13 @@ static int ufshcd_mcq_sq_start(struct ufs_hba *hba, struct ufs_hw_queue *hwq)
 	return err;
 }
 
+static enum utp_ocs ufshcd_mcq_read_ocs(struct ufs_hw_queue *hwq,
+					struct ufshcd_lrb *lrbp)
+{
+	guard(spinlock_irqsave)(&hwq->cq_lock);
+	return READ_ONCE(lrbp->utr_descriptor_ptr->header.ocs);
+}
+
 /**
  * ufshcd_mcq_sq_cleanup - Clean up submission queue resources
  * associated with the pending command.
@@ -609,6 +616,20 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 			 __func__, id,
 			 FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)));
 
+	/*
+	 * For device management commands, there is no order guaranteed between
+	 * OCS update and CUS update, which is why we need to wait here. SCSI
+	 * commands are excluded because the OCS in their UTRD is not updated
+	 * from the CQE.
+	 */
+	if (!err && blk_mq_is_reserved_rq(rq)) {
+		enum utp_ocs ocs;
+
+		err = read_poll_timeout(ufshcd_mcq_read_ocs, ocs,
+					ocs != OCS_INVALID_COMMAND_STATUS, 20,
+					MCQ_POLL_US, false, hwq, lrbp);
+	}
+
 	if (ufshcd_mcq_sq_start(hba, hwq))
 		err = -ETIMEDOUT;
 
-- 
2.43.0

