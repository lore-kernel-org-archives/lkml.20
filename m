Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464053D47A6
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226649; cv=none; b=dTYcKYiyOOV4sv7VUslyBH/9fetomSVrca7hK6kEbn2rfTfowrkYJi7pzbHklZPvggsVonAVoI36rIj3keg/sUlRjQlX4ipFAOyfALQ9Vq8sjASgWwwqG8UQITirEP5kut1vqPRnS0B2X1Vc+nfenBI7dk+qCT8YTeAFrZ6n8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226649; c=relaxed/simple;
	bh=t+rPDyaXR43NUuKqM+DHsvqolGp6JjYXlb5sDdMydvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cpJoYfkx1N1570LB3MRQ1/nCr07pNavoGqoWosRUGDFcOumytzJdFUjriYQUDuACsUwLxiDizqHvVXlMELkaKhM/VqhbpMoai/3GgOyjsWRe7HSmUeYhLDJreVF5ZsyJxPJ/r/nh+N27o1MP/g5TV/DcjPWnOrQZRZjTSfh1NyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ixNHFmMR; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ixNHFmMR"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd61df4951cso652953a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792226648; x=1792831448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDczfTEMVNXX8ypwJnRuxvfRrqGlS2E1C1kChOy0r7Q=;
        b=ixNHFmMRmbptFaY1VztZEfLScsbbcyaNp71OnmFy1NJY8x072T+FIzCEvB6fgRAWbs
         0rUR2mfTHqjsRMc3FAXmiT/0uLZ/cxbJ++3Hdh/gbW4wldRwPJPEH+7XGNGJma+3pKRM
         ZUsv/SFYFsmA554rZQO2D1VlDUeEDbyxuTmgsQgFoPllwXfwaiGkBzWrUJu+UH2Fm1NN
         dNAAYDEwzGJEI7oKYqYo+qhQD6wFDoLak/kvrbWcYgGVYs8UP/4LuOcKbj/dA63MT/pf
         HVtln5G2xipjhuQx1AB/UPTIngVKyBLakAW0pns60yUQFO4JJxJ6FFRtTAMse7EJSAVr
         MttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226648; x=1792831448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDczfTEMVNXX8ypwJnRuxvfRrqGlS2E1C1kChOy0r7Q=;
        b=KowBX9awwf0U6NYkaCS+2+y+sMPcnr98H13aTYwTU8J+y6V3BwKfwiNNFlD+A9+db+
         /fmeGNCsduQD0BPFEMjbmic+6Jk3YvnPEbDebOlY5ZNQGSKqe9UfFwtX4fsVA4s6oPpy
         gbIdGd436tJO7Rs3593nxXMH8WM6jm3sJhUIKoHw3pn2WggMQ+aTWLpqinyqyEzC+Njk
         vginR99BUmWUgiyegoYhQP9GkZBBlnAB0qIIBxjhOdppNTTm6TwGq44hRyqP3X2+Ya+h
         jxaXlV7ztQ/+azsN2wuUYq+Vmognu/54gi3MPWQ2P30VeRCVZBQRWkTng3SqFclbMIY9
         Zj6w==
X-Forwarded-Encrypted: i=1; AKwUvByyBX9yHIJppErtZq0eqcTB/ZXbDVzI232rkF96k+ybfF1ugkfTNZms8sxACqhjS9yTqH+veFV3AUm6QLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8bBol8mI+Oq3Y/rk5iynRxf/+L3iDrxuAbF8oXJgBKipR8ZoV
	vqf3q/SUG5c/5dWQHw52psdhJUqG4AYJCkzxPmXf4YgCvRwpV7ilrzm+624IyNyy+5EnsdUjINv
	KALiNmUz/Ik+sHoG2ag5ocg==
X-Received: from pfwy14.prod.google.com ([2002:a05:6a00:1c8e:b0:88b:8b90:725d])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:670a:b0:3e1:549d:eedb with SMTP id adf61e73a8af0-3e225af40d8mr1465995637.0.1792226647481;
 Sat, 17 Oct 2026 01:44:07 -0700 (PDT)
Date: Sat, 17 Oct 2026 16:44:00 +0800
In-Reply-To: <20261017084403.875420-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261017084403.875420-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261017084403.875420-2-stanleyjhu@google.com>
Subject: [PATCH v2 1/4] scsi: ufs: core: Add a helper for clearing hba->outstanding_reqs
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufshcd_poll() and ufshcd_abort() each have their own copy of the code
that clears bits in hba->outstanding_reqs under hba->outstanding_lock.

Move that code into ufshcd_clear_outstanding_reqs() and its locked
variant __ufshcd_clear_outstanding_reqs(), and use them in both
functions. No functional change.

Cc: stable@vger.kernel.org
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/r/3779e125-9acc-42c8-9489-51b9e3c6716d@acm.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 50 +++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bcc2512bf34b..71f4b9d0a850 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6052,6 +6052,37 @@ static void ufshcd_clear_polled(struct ufs_hba *hba,
 	}
 }
 
+static unsigned long __ufshcd_clear_outstanding_reqs(struct ufs_hba *hba,
+						     unsigned long mask,
+						     bool from_irq)
+{
+	unsigned long completed_reqs = mask & hba->outstanding_reqs;
+
+	lockdep_assert_held(&hba->outstanding_lock);
+	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
+		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
+		  hba->outstanding_reqs);
+	if (from_irq) {
+		/* Do not complete polled requests from interrupt context. */
+		ufshcd_clear_polled(hba, &completed_reqs);
+	}
+	hba->outstanding_reqs &= ~completed_reqs;
+
+	return completed_reqs;
+}
+
+static unsigned long ufshcd_clear_outstanding_reqs(struct ufs_hba *hba,
+						   unsigned long mask)
+{
+	unsigned long completed_reqs, flags;
+
+	spin_lock_irqsave(&hba->outstanding_lock, flags);
+	completed_reqs = __ufshcd_clear_outstanding_reqs(hba, mask, false);
+	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+
+	return completed_reqs;
+}
+
 /*
  * Return: > 0 if one or more commands have been completed or 0 if no
  * requests have been completed.
@@ -6071,15 +6102,9 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 
 	spin_lock_irqsave(&hba->outstanding_lock, flags);
 	tr_doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
-	completed_reqs = ~tr_doorbell & hba->outstanding_reqs;
-	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
-		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
-		  hba->outstanding_reqs);
-	if (queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
-		/* Do not complete polled requests from interrupt context. */
-		ufshcd_clear_polled(hba, &completed_reqs);
-	}
-	hba->outstanding_reqs &= ~completed_reqs;
+	completed_reqs =
+		__ufshcd_clear_outstanding_reqs(hba, ~tr_doorbell,
+						queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT);
 	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
 
 	if (completed_reqs)
@@ -8114,7 +8139,6 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
 	unsigned long flags;
 	int err = FAILED;
-	bool outstanding;
 	u32 reg;
 
 	ufshcd_hold(hba);
@@ -8209,11 +8233,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 * Clear the corresponding bit from outstanding_reqs since the command
 	 * has been aborted successfully.
 	 */
-	spin_lock_irqsave(&hba->outstanding_lock, flags);
-	outstanding = __test_and_clear_bit(tag, &hba->outstanding_reqs);
-	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
-
-	if (outstanding)
+	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)))
 		ufshcd_release_scsi_cmd(hba, cmd);
 
 	err = SUCCESS;
-- 
2.56.0.176.g3575e65682-goog

