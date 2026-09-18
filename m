Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3D4B270B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742298; cv=none; b=uOf7JfYkGGOwvFDnjoG8DkNFMNAUWhYd/XHf/Ow47j13sM7G+feCIcX91I06Y9LVjEzUdtXjTMwts7j9bYG5q2qPk3/56eTYGb7z2zVacg5u0WQIyWZ2d8Up045Nr0rZx7Mqo8r0F5ekNQGbBEov7xSNg51ap5qir/Kk9ybGUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742298; c=relaxed/simple;
	bh=+KPB1lKxojDRY5zT5v7uCSLpxLCh41smyn55eJFDsZA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XWZgsZro43XiB4/88VYoMXJaOKs2g6m1t3+1QKxZiT/ekg2xJ4IkkvNflQ1hVkPQAviCwf8XHd7i55Jgf68YAJwFjetW7N2Zr0Ka3qk7Hiix78FqFLk0clmHhZBemyhHyHlUwKdRIdU+GNjxW8apDVcoDhkqX0MbRDxJI7VUdzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aVA9Qz11; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aVA9Qz11"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8716b158692so544506b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789742295; x=1790347095; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OT5P6cXKt1EfvL7fMqaW1ELy2bttp1x4RCZYKi6/zc=;
        b=aVA9Qz11E+sndk2B8QAwwmKWPBlneksH4yfSSdzKeubSpR/SVYdfogf1Bryyx2iccS
         o6k0zdw2O5U5b/7T9+oxnt2pyd043paq04LFdy/1oGuwA+kFO4U6NqMAIsGO2Q3eM+FS
         unXb9a6zllXduCkfxvcBeYdy8anD/0rRayKqneJzzdEjYHHXzNKJnwyR+bmaQFV6zL8X
         NVchZyw9bN3H7UDpLmzzRM4GRGdPe8Bfa6NZyLFbxTsfinuJ+Yk+l4vyYdZ4glW272Ix
         sS+2k4hh+1BLD8wbno5iRA5P2giVQ4NM1BrwMGXKwZkeN7RVJA0kZ2aAEBoiLY9oX+qP
         ILLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742295; x=1790347095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OT5P6cXKt1EfvL7fMqaW1ELy2bttp1x4RCZYKi6/zc=;
        b=N15rUp8aG78j22debNbQ8ATUiuhOvUbR5EVB2rMzYS4M9U7WT+2v2M10NSEl16Gk41
         cy46PimEH1Scf3ff7odJx2rsj8J9OxvZyK2vPDm4IRVUxyPVWvTXc2ZU3YzTZIHUeu4s
         r29UdFeoGfd8Ym2MZjynaEJH7o9ZkClSSIBC3ttUTPtkZRNc41QJvnN4Ouyx9fduDFIw
         lElIjVRN/kEPTZYS0C8K/X5+Hk94hQSpdf1F4K1wtzdAtMY2jSfLd85ZlQ89iuC+OYui
         aFNayr0pHgTfGvZguFffWSEWm2vffj3AooMBvcqHfnh5JgnfKpnSOHDRW1Krz5ZHFKjQ
         B0kA==
X-Forwarded-Encrypted: i=1; AKwUvBxNS/qaPJ0vgd9y8T9suMqS83ud0vhC4TzPZSMoq4Fw5QxFIKUR1hM98slIchnQ3FyDGVIpPunE5+7VA3I=@vger.kernel.org
X-Gm-Message-State: AFuF++kp+N8DhXvbYw/VeF7lOFZH/w6W2lJAT8yN0nw+57dwGpgRgSw9
	NbkV7C/TNj0inM8FvEsuf0JRZrEEQrJ4Wxc+a4k4zeQWqWYK1fDWU3hIzSeh7lPE/sVrQYNNAsb
	tadeYn0D4rcGeuxSCzcLVxw==
X-Received: from pfqf14.prod.google.com ([2002:aa7:9d8e:0:b0:847:9be8:84d5])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4409:b0:872:b1f1:aa8d with SMTP id d2e1a72fcca58-874dc0f8b95mr5056873b3a.14.1789742295298;
 Fri, 18 Sep 2026 07:38:15 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:38:08 +0800
In-Reply-To: <20260918143809.3034592-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAE14pdek6ynze+muDZrK+yNX-3ioe3vprxOA4W22qokg352tJQ@mail.gmail.com>
 <20260918143809.3034592-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918143809.3034592-3-stanleyjhu@google.com>
Subject: [PATCH v2 2/2] scsi: ufs: core: Decouple CQ sweep from request
 iterator in MCQ
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, 
	Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Peter Wang <peter.wang@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stanleyjhu@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In MCQ mode, ufshcd_mcq_compl_pending_transfer() uses
blk_mq_tagset_busy_iter() to iterate over busy requests during error
recovery and host reset. However, both iterator callbacks perform
whole-queue operations redundantly for each visited request:

- force_compl == true: ufshcd_mcq_force_compl_one() calls
  ufshcd_mcq_compl_all_cqes_lock() on every busy request, sweeping the
  entire completion ring (hwq->max_entries slots) once per active
  request under spin_lock_irqsave even though the first sweep already
  cleared all completion entries.
- force_compl == false: ufshcd_mcq_compl_one() acquires cq_lock and
  polls CQTPy over MMIO via ufshcd_mcq_poll_cqe_lock() for every busy
  request without doing any per-request work.

Sweep or poll each hardware queue (hba->uhq[i]) once at the start of
ufshcd_mcq_compl_pending_transfer(). When force_compl is true, run
blk_mq_tagset_busy_iter() afterward to complete residual in-flight
requests with DID_REQUEUE, and remove the now-unused
ufshcd_mcq_compl_one() callback.

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 2ba244cf40ac..a69dcb04d985 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6044,8 +6044,6 @@ static bool ufshcd_mcq_force_compl_one(struct request *rq, void *priv)
 	if (blk_mq_is_reserved_rq(rq) || !hwq)
 		return true;
 
-	ufshcd_mcq_compl_all_cqes_lock(hba, hwq);
-
 	/*
 	 * For those cmds of which the cqes are not present in the cq, complete
 	 * them explicitly.
@@ -6061,19 +6059,6 @@ static bool ufshcd_mcq_force_compl_one(struct request *rq, void *priv)
 	return true;
 }
 
-static bool ufshcd_mcq_compl_one(struct request *rq, void *priv)
-{
-	struct scsi_device *sdev = rq->q->queuedata;
-	struct Scsi_Host *shost = sdev->host;
-	struct ufs_hba *hba = shost_priv(shost);
-	struct ufs_hw_queue *hwq = ufshcd_mcq_req_to_hwq(hba, rq);
-
-	if (!blk_mq_is_reserved_rq(rq) && hwq)
-		ufshcd_mcq_poll_cqe_lock(hba, hwq);
-
-	return true;
-}
-
 /**
  * ufshcd_mcq_compl_pending_transfer - MCQ mode function. It is
  * invoked from the error handler context or ufshcd_host_reset_and_restore()
@@ -6088,10 +6073,18 @@ static bool ufshcd_mcq_compl_one(struct request *rq, void *priv)
 static void ufshcd_mcq_compl_pending_transfer(struct ufs_hba *hba,
 					      bool force_compl)
 {
-	blk_mq_tagset_busy_iter(&hba->host->tag_set,
-				force_compl ? ufshcd_mcq_force_compl_one :
-					      ufshcd_mcq_compl_one,
-				NULL);
+	int i;
+
+	for (i = 0; i < hba->nr_hw_queues; i++) {
+		if (force_compl)
+			ufshcd_mcq_compl_all_cqes_lock(hba, &hba->uhq[i]);
+		else
+			ufshcd_mcq_poll_cqe_lock(hba, &hba->uhq[i]);
+	}
+
+	if (force_compl)
+		blk_mq_tagset_busy_iter(&hba->host->tag_set,
+					ufshcd_mcq_force_compl_one, NULL);
 }
 
 /**
-- 
2.55.0.1082.g2b9226bbc0-goog

