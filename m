Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869307;
	b=rv9d/6s73/DzmZmlhcaCR7PazcCvp92TBjWIEFuWVfPw3GGMK0KwQrYzS0A2P2W94zTV
	 oOgvs+SXcusnf2r397wlOdDXit5XalpPZ3Q1GtUWnopL1nN5Tqlw9xJ5007zRO+BfR7Uw
	 U866xSAc1iXAlqv64cs4MzEMRyVsMu9P1tttu8cCURIJiW5AlOC0jPRrNsFDUSKWPzs2Z
	 h5EPKefPhMpsJWb25qlYjZWzalsl8lFrUZoetEOVpRqJ7w6sJ7dmZELRMNCdd8kTMqa+/
	 xo8m7/6jhNppxP490m3ByIf1Hnd9JndDAo2AA9tHr7zLRZNVT/haflIrQs0At6opR4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=sKyXdvYuJa/KtkqrhdgwSrX9FLTPK01qJW0rS1xuBqs=;
	b=IzOnoAqdXKHLHbP8kWZ8hURzhDcX9vQTiwuFxRqA7Z7r4aNjONxqWjc6ROQV7CouLdXj
	 4H42g+kXzhb3H7N/5WBiM6ct7ZkZSnIS8KxJcj5gSerhAijCS5rGbK851FQtVNdK9TikK
	 v9T1PsAlntq8QK8+L901ZEuiHv9cgxFZodeBK+gU++1/+OPXJ+C1Ipb18dkRSGiamouV9
	 gcY5Ee1UgPWE86HWLP7osXc0VuBLQq2ZtqvKSDAhL2ii4B0ye3ulRYEc2l9WGuNt9sxSc
	 nqoXZB/MFZS5T+BTBCgr2SKh2n62Z1gHtEfFA+4EVqxRl1sez2DZbjSY+GU+hugWkbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tadamsjr.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fbeVdRbW;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB22606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB22606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tadamsjr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fbeVdRbW
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso2926365b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794869306; x=1795474106; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKyXdvYuJa/KtkqrhdgwSrX9FLTPK01qJW0rS1xuBqs=;
        b=fbeVdRbW+33PMOUdcC98RGt+WP500GXUuskQtJRV8JYSXITp88QaLdyelV/cf231e8
         QeqOcJWKTAvvgg6E9UyNs6y32bS9l3qp3mAb3aA9IFjYtgggM+iO1/zBNAhurYs7ELVl
         J50sUAaCv7+on1FEvg3PvRLkvy6+y6qBSfFieQCdEDoMqe+JiiM8c1XfKUEK92Zx4fop
         8ipvjEi5rf26kuYGMd38XaVKhVigc3tGwixC7COXypYrN07BSCJKW14RqLLs2Nzn+Yxv
         Q/DjbvVdfQfpsEuLd/2qrVYZbOR7OlMbOm/pwqPxsdiw9WyMbnIShnDniwL61uMbrJXW
         LNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869306; x=1795474106;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKyXdvYuJa/KtkqrhdgwSrX9FLTPK01qJW0rS1xuBqs=;
        b=NmZKRC60uwW4ge0OPkDVXKrQaDZ7sfmpwsyZU4lBARzpndRGIwfZzqA3TvcckfE59h
         FraGjSzbCOvM0clAh01eiClpIISXEuoS8RbncEfj79eo3Yg4s3a7zVb2I62Spk908fH7
         DC3hbfz3nE/o6AC3+D+CAsaoPW0PZZ5aTYpTvzWpa/usU45eusGSiE1IoBvZtenmdz1L
         RVplSiajGvIWkLp47dlZmBBrtFctrVdgoe9OgYWY5qeAbOZ1Sv9+njIRWqrOg+ClDpMd
         O0mkjVKsKazNcHROjMHv5g2slvqYTbb/IqLf+Remd1hp2N6azeD/b8AqYRMDgkYalBkF
         Ug4w==
X-Forwarded-Encrypted: i=1; AL+hErEJp2MNK2F6fTHNXo8q2Ph4B7a+frkqcm4v0vKwiggm1rWTFd13+rYsTWYyaKXoW7DdV0hKx4fT4Oguyv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wZVENdS5LppvywPlATsL8rIXd8TnCacLdiMMhOXu1HqKNWNIi
	K2um+mDtF6Osu3Q+IJEiTJKmepgpujPpeH3ite/UY9c7T+uZXoaueT5lqMvXSVIjOTZFtEg11hx
	fRSl5L5+M/yWrGA==
X-Received: from iox6.prod.google.com ([2002:a05:6602:4906:b0:9c4:a4a1:b54d])
 (user=tadamsjr job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:16a7:b0:4b3:98f4:f057 with SMTP id 5614622812f47-56e605a4a03mr9996378b6e.3.1794869305698;
 Mon, 16 Nov 2026 14:48:25 -0800 (PST)
Date: Mon, 16 Nov 2026 14:48:11 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261116224811.3362188-1-tadamsjr@google.com>
Subject: [PATCH] scsi: pm8001: Offset hardware queue index for MSI-X pre-vector
From: TJ Adams <tadamsjr@google.com>
To: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: John Garry <john.garry@linux.dev>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Terrence Adams <tadamsjr@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Terrence Adams <tadamsjr@google.com>

When MSI-X interrupt vectors are configured in pm8001_setup_msix(), the
driver requests vector affinity with .pre_vectors = 1 to reserve Vector
0 for non-affinitized housekeeping interrupts.

blk_mq_map_hw_queues() maps hardware queues (hwq 0 to nr_hw_queues - 1)
with an offset of 1, mapping hwq 0 to Vector 1, hwq 1 to Vector 2, etc.

However, pm80xx_chip_get_q_index() retrieves the queue index directly
from blk_mq_unique_tag_to_hwq(tag) without adding 1 for the pre-vector
offset. Consequently, commands on hwq 0 are issued with responseQueue 0
(firing unmanaged Vector 0 on CPU 0), while hwq k fires Vector k (the
CPU affinitized to hwq k-1).

This results in 100% of I/O completion interrupts being delivered to the
wrong CPU core, causing heavy cross-CPU IPIs, cache line bouncing, and
increased kernel and IRQ CPU processing overhead.

Update pm80xx_chip_get_q_index() to accept pm8001_ha and add the
required +1 offset to blk_mq_unique_tag_to_hwq() whenever multi-queue is
enabled (number_of_intr > 1), routing completion interrupts to their
affinitized CPU cores.

Fixes: 42f22fe36d51 ("scsi: pm8001: Expose hardware queues for pm80xx")
Signed-off-by: Terrence Adams <tadamsjr@google.com>
---
LLM assisted with drafting the fix and commit message.

 drivers/scsi/pm8001/pm80xx_hwi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index d2572dd66071..9cb73d316654 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -4328,14 +4328,18 @@ static int check_enc_sat_cmd(struct sas_task *task)
 	return ret;
 }
 
-static u32 pm80xx_chip_get_q_index(struct sas_task *task)
+static u32 pm80xx_chip_get_q_index(struct pm8001_hba_info *pm8001_ha,
+				   struct sas_task *task)
 {
 	struct request *rq = sas_task_find_rq(task);
 
 	if (!rq)
 		return 0;
 
-	return blk_mq_unique_tag_to_hwq(blk_mq_unique_tag(rq));
+	if (pm8001_ha->number_of_intr > 1)
+		return blk_mq_unique_tag_to_hwq(blk_mq_unique_tag(rq)) + 1;
+
+	return 0;
 }
 
 /**
@@ -4371,7 +4375,7 @@ static int pm80xx_chip_ssp_io_req(struct pm8001_hba_info *pm8001_ha,
 	ssp_cmd.ssp_iu.efb_prio_attr |= (task->ssp_task.task_attr & 7);
 	memcpy(ssp_cmd.ssp_iu.cdb, task->ssp_task.cmd->cmnd,
 		       task->ssp_task.cmd->cmd_len);
-	q_index = pm80xx_chip_get_q_index(task);
+	q_index = pm80xx_chip_get_q_index(pm8001_ha, task);
 
 	/* Check if encryption is set */
 	if (pm8001_ha->chip->encrypt &&
@@ -4510,7 +4514,7 @@ static int pm80xx_chip_sata_req(struct pm8001_hba_info *pm8001_ha,
 	u32 opc = OPC_INB_SATA_HOST_OPSTART;
 	memset(&sata_cmd, 0, sizeof(sata_cmd));
 
-	q_index = pm80xx_chip_get_q_index(task);
+	q_index = pm80xx_chip_get_q_index(pm8001_ha, task);
 
 	if (task->data_dir == DMA_NONE && !task->ata_task.use_ncq) {
 		ATAP = 0x04; /* no data*/

base-commit: 141b164bbe186423e295b139e40e8e2d11cf1341
-- 
2.56.0.679.gc527c65306-goog

