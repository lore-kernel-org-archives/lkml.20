Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554897;
	b=y+1k8kYgtXdfC5n6X95H29Hp2s+EBGgjdn4qev2nAYGLLyIX/2QSNQrQIrCaId33ugwM
	 KaXHIgBrgo8do1HdyHJkAR5gLHD13ph2XBHQWxbo2MGmgHphO+AkCxxfg0X6bEK0B/S4x
	 8GY7gpI+gdrXHGGSSf3/qHzSVwEubyGYz6ncsa9yJIlaeND/DPmZ0+8TAlgtWdOz+d4qr
	 Lxi3U4riKkBqTh81md605YDPMfOiuXtHcsmIQzPpM43P36gK38pydSJDdGCaeUHqTldUe
	 1THFvrnKuZgx+VQYH2NlrAJQui7fniNoBf1mXJI2P1EDA4VOCNmhCDixqeszcAIEqfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WwcZhsMFt/apL5mEt1XweWG8RyzKB1xDE1OfQpTu8h8=;
	b=cd8WF+/hQmPAlzfZnrYRuYQeUrvnhHGSoMCASOKfwkqx1tbcILSDax2seb9Z7T0wct+7
	 fhorCx8qtSw7QaHDUyAFf+jjaQ4BOs05FAf5lnP9KBfONyz1p9sw4Rq23x4rgk8z4Vzyh
	 7OWbIry1Vap7y97PcGgVDtw7CmzpfB+R3j307wqiJdPsTg/0gl3pn/wj2Dy75EMUI8To8
	 EgVNsb6Kcwy80q3pvOvKDkEuftUPy9IU6Fj9GriKnQgnxENy8wFPjwPWQHvOi9WoHqzAL
	 1n1Yz9OCo+BFNJP0JvMiCvaVwoEHMJWXJiZm6smJi/0Q4dlFfNZMdrvQokkpjODdjIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z8lTzLRP;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDA60A260F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFDA60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z8lTzLRP
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so4841985ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792554896; x=1793159696; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwcZhsMFt/apL5mEt1XweWG8RyzKB1xDE1OfQpTu8h8=;
        b=Z8lTzLRPnWfrXP2L3M9hvGN7+vNqk/JArPo16UvXNIJNjrUEe47Lu2A753zDNK+Ifm
         0Z0fo5sECDprjMZrgx017qiGBjFiJuD7T8hTh3G4BrSFmf87ifINmg98qQZeeRSFuN3Z
         iVNvWj+OofcEcFF653WvHycDJs4ysKQGY+l2vxmK3lAorv4qgvZBKk8yTYG1ukl67/yy
         B77dGPMN1LgIwgNVVCbwbk4Y952eTrP9YhvKtMKO6y+QaspzX5byEQBeO+CFOCLk1xUw
         NR37RimIqWtXaUYnZ6JK+ab6/9G9aq3Bt+XIdAHNWKVyf2nFyC6XQVhWdEw7npkf2y+R
         2bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554896; x=1793159696;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwcZhsMFt/apL5mEt1XweWG8RyzKB1xDE1OfQpTu8h8=;
        b=BIwNu5G07jg0XNqxUl2N3m+afIuEhsLTCtujHiFNhIP+QRzQ7QVi0K79yt7oSZrZL9
         +Hffc70j3QsDxGpMnFDc52iCks5EwJPtzrOXpIHJdOgoOPe9w7vpFNr6EjiLOw23v9QA
         SF03Y2ueVubH+qZnGn/Ggj0YVd7IcuAxBp9gXApX79TXFbK24z7uoVrUt30QFAzmOo+5
         8DbjPOMB/qYbfmQVzIoOhRyS3MZtQWayEV8nOwav50SPQn/zY1dnd6hTllqSyZzuaz9B
         8q7TeffiQneVojGdqAreBHz/sj6Lhz9lZFvYWq7kV1xxbMrpyLPZBDrMD0zX3goYV3X9
         s2Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzL33uoRawQCtP93XYUg4vfYkEQIB535tsrfvmh3goMcwy8/ovVMXv5qN38agVHjPeFmZ3pOhOsWI84pD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1df8hfES52CpLa5mef+Aw5k29mDgwEBXwcA9dzNB+QNithYwK
	3dNY7AVTxvMX81Hs4tHYRZRCkFyurJ1MXFO9Fl5LfO6vrSeZYppnXcJiWytMjVEbrNp8h5WAX/O
	rvQdNfLeJ/QdOOVzZ6I8s3g==
X-Received: from plwg6.prod.google.com ([2002:a17:902:f746:b0:2e8:531a:afe2])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:b45:b0:2e9:4008:6fda with SMTP id d9443c01a7336-2ea43da223fmr7140255ad.28.1792554896111;
 Tue, 20 Oct 2026 20:54:56 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:54:46 +0800
In-Reply-To: <20261021035450.3488805-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021035450.3488805-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021035450.3488805-3-stanleyjhu@google.com>
Subject: [PATCH v4 2/6] scsi: ufs: core: Add a helper for clearing hba->outstanding_reqs
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
Link: https://lore.kernel.org/r/3779e125-9acc-42c8-9489-51b9e3c6716d@acm.org
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 48 +++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 12aafcf1f9b3..1db572f84971 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6052,6 +6052,37 @@ static void ufshcd_clear_polled(struct ufs_hba *hba,
 	}
 }
 
+/*
+ * Return a bitmask of the transfer requests cleared from
+ * @hba->outstanding_reqs.
+ */
+static unsigned long __ufshcd_clear_outstanding_reqs(struct ufs_hba *hba,
+						     unsigned long mask,
+						     bool from_irq)
+	__must_hold(&hba->outstanding_lock)
+{
+	unsigned long completed_reqs = mask & hba->outstanding_reqs;
+
+	if (from_irq) {
+		/* Do not complete polled requests from interrupt context. */
+		ufshcd_clear_polled(hba, &completed_reqs);
+	}
+	hba->outstanding_reqs &= ~completed_reqs;
+
+	return completed_reqs;
+}
+
+/*
+ * Return a bitmask of the transfer requests cleared from
+ * @hba->outstanding_reqs.
+ */
+static unsigned long ufshcd_clear_outstanding_reqs(struct ufs_hba *hba,
+						   unsigned long mask)
+{
+	guard(spinlock_irqsave)(&hba->outstanding_lock);
+	return __ufshcd_clear_outstanding_reqs(hba, mask, false);
+}
+
 /*
  * Return: > 0 if one or more commands have been completed or 0 if no
  * requests have been completed.
@@ -6062,6 +6093,7 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	unsigned long completed_reqs, flags;
 	u32 tr_doorbell;
 	struct ufs_hw_queue *hwq;
+	bool from_irq;
 
 	if (hba->mcq_enabled) {
 		hwq = &hba->uhq[queue_num];
@@ -6071,12 +6103,9 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 
 	spin_lock_irqsave(&hba->outstanding_lock, flags);
 	tr_doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
-	completed_reqs = ~tr_doorbell & hba->outstanding_reqs;
-	if (queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
-		/* Do not complete polled requests from interrupt context. */
-		ufshcd_clear_polled(hba, &completed_reqs);
-	}
-	hba->outstanding_reqs &= ~completed_reqs;
+	from_irq = queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT;
+	completed_reqs = __ufshcd_clear_outstanding_reqs(hba, ~tr_doorbell,
+							 from_irq);
 	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
 
 	if (completed_reqs)
@@ -8111,7 +8140,6 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
 	unsigned long flags;
 	int err = FAILED;
-	bool outstanding;
 	u32 reg;
 
 	ufshcd_hold(hba);
@@ -8206,11 +8234,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
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
2.56.0.212.g129ede20d9-goog

