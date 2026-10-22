Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640690;
	b=II4TJeXrcivdBcIOJ+EjIdtLunw8GFhpk170kgzhqe0p+iGnZB3JOQjMirO0JexiGijt
	 0eOox6FPrBFYJyf03F/Md+byJMqe2vfeFOcAPeFc1s5XLh3bfyzybBdyIHwCdcbAg4Cnv
	 MYnJplczYoAD3zNXbN4u1prVAlMO9I+M3JIMrCUhkf4xYxDY6j1ZP8alTx+uk+4uG7PFc
	 4r6Q8Wl7iHDJiey8PPVqxPaXtDKf8Yp1nvkguyAyu9dLmtclk9gdWeTqt/eBqnQyXUBw2
	 iPnnbLdva+fmt6CwCdh8wZa2ax/kQdmb9fjmGmxCh3Lg3epaX1A7Dxcvq4yU7nzy+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8T5L2Doo4hafhgE4IIDG7Xgemkp+4Eg0v8OcH6PLgGM=;
	b=RNTMUxlZ9113p2y8ChPdFDN/MJ17Sg408OYiwh40W5TMgIuaQIbX5IuKlGAlzG88Pqkx
	 noP8ZxwMzUvbYC/UEUzqBbkiFl5SHewK8BaTFiN29X7BSRqBZ/075gsPyY0+w02o8aIDx
	 4JdckqmVwhlHHpLxThhRM+nrXwjND4Q7YU6qSoUQDOAaO6wMIPH64wVfmX0JCQg6GHZNZ
	 1k7NDtEviP+/zDvlN2bVS7ftOq1DdKDX6qUpraHmNAs4yzhd/DszvUtj6LdAz1k3KP4Ej
	 igw70F5iN6JFZlHiJJ2icEe1+BqzvY4fdczOT5gAV3v/ECmugRe0q6jZZreWXv6hhJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kqW3zQRB;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91C4606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91C4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kqW3zQRB
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so1085891a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792640689; x=1793245489; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8T5L2Doo4hafhgE4IIDG7Xgemkp+4Eg0v8OcH6PLgGM=;
        b=kqW3zQRBOvd8I2Jq+gdYfLCHqX9hdeBCX9rrNtPdsQ9l9EWTsenYVI3Xi1yPaMw4Jl
         MyCLwDwZDu15WwiOzm6CarutKDjUNyBO1gglmooNCunQP2XX2KUhgbzCSLDvN3oC1FTq
         4GpJtC2T/DXCD7jggVgnvEhOn91VGe1HL+SPjqrKsMi1Y+Wijtwez/rhmizLgtwzXKPo
         5qeF4iyCOhiQwj/q4/kYzqHO9TPJQmcPqvCuNpTt6veKxmJb2rhKupB244xNsVxq7GfH
         HJqbkYUjk0ylTZ0uV9iD7kq4+gio5zYYapsT+1XmfrCmaAyt44RJRmcoQy9F0z3QlmHw
         b1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792640689; x=1793245489;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8T5L2Doo4hafhgE4IIDG7Xgemkp+4Eg0v8OcH6PLgGM=;
        b=aVKz7laeDmyiJ3vznf4bzJYuzVCZ/tSXrs1Kvi/LNFmcEDBbT3YqEnJl9nYPyXnaM3
         XssbJerBbRJrjWu0JcgXCDnlgkLxcbG4m+mU22Pm1TJHMJld5VveB47rEKTamJfw2sDR
         b7Bez+2efvq1rDQaxsace4uNb5N/D398FIB48Novn2uUXsjPL5B8sX0xbpoFwJe3WgUu
         bSHl2A2a0mQEQmtV81q57D0H5E4TFLyPpeg5N+hlnAKWt6iymz2B/5kaJXK91JuGqKOt
         m/cTOW2xzfK8XGsCDvI3hM/YmMBbEv/ELHo6DWPtt98ajRws1oUxKp9ukkXY8TBZM9cN
         Eh7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAJbeBtyECdz47B8YCSZr2Qso78XgTriUMVb/82szgMPLZtfCQtSksbtOvt8bJ2iciMp/37Ig0YZyiUrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdsSCy7sIG2QhF03PoDEDP10Q0uqzGnxLgXcQT9ovo7FSJJfHZ
	a9tOoGbM6v2Yxb0dJ85zXZ51jJLevHpZ1fvpRD4pwEBmWwZnfPdBNWrdB1zJr3YIo7yxn8Oj28M
	htkgL9HPnsi3OZwtRgpCD8Q==
X-Received: from pgbd23-n2.prod.google.com ([2002:a05:6a02:64d7:20b0:cd6:261d:5bde])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5251:b0:3aa:fc22:8aa7 with SMTP id 98e67ed59e1d1-3ad86dc12eemr3420030a91.53.1792640688818;
 Wed, 21 Oct 2026 20:44:48 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:44:39 +0800
In-Reply-To: <20261022034443.3034432-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022034443.3034432-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022034443.3034432-3-stanleyjhu@google.com>
Subject: [PATCH v5 2/6] scsi: ufs: core: Add a helper for clearing hba->outstanding_reqs
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
2.56.0.218.g1ec904b173-goog

