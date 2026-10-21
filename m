Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554896;
	b=PwufTgKAv8d/SAciXEzmA714WCAMlkkOSodX+1epgPHVZI56n+YDuAbcuAy6bdw6y6W8
	 JZPOYvV4PI1ukO0dV6ZQnjNwxfjerfVJ+Jcg64UJts7Z4fZCGqrN+d7N3IWmjYLq3WPn8
	 ILtNNbZiIP5+eNuAMIgeBX20vL9/Qdhtcb5I81hLSuGMi574fv4V1UHRtY9YjnjnLLAqd
	 OGPj0bIU9h4sks+2WyklBJwQmzD2N99e1Twaq2kTYr5ZNxHuTxFAcWFwWRk4Yi2ShupJr
	 go+iOqlG9j+cNHmR95DrlN1VVIpiFLUbOl0YWfbnpoC7IRczVjGQUMMyViCm/VQO0PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9paoukZlfMxNYNsrD2iQm9b4wSqYDltUgKwGmmCVVPQ=;
	b=OBSsSd+yUwfmtKrlBmo2bDrYf4qQMsJJEksR1j2dvxi4rMDHwr4iLMMFlxUFD1Bg2aEd
	 GfDVrGQ0kgrYeUJvUA8L6PMcFR0SYTQU83e3j8OiFELqRZTLHej2ZukCQroQkg3qTjXSW
	 7BFBnf7xha6y9qf6R5drT2mYi4JkblsB9wkP0E9thUVLP1ypDsgxP/xaMNTToowtdqsRm
	 /FS27TSSNoE8xDbx93l1K14g1U2h0awd4cWZVdNiwKEvCNhimlD6yJ3W1FOQLIHFMdU+T
	 7YClFqM19T7igwMCw2G1ojX7OdUdymw+CuaiWfXhTiFdXgk7E0keB1L2/viFEBMhatg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=phQP2BIh;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636E606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3636E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=phQP2BIh
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so171966a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792554895; x=1793159695; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9paoukZlfMxNYNsrD2iQm9b4wSqYDltUgKwGmmCVVPQ=;
        b=phQP2BIhoCXepnswZa3bId9csGeDQ4GEpLH89FLpqg1YliMUze8HOj3zWT+EwGbT3d
         t4FbL2ER/JTFhNDy2xtC+G0L+p3lAnQqtWEZ8VP/nkyuvho8khnf9oj+Ldc9lE3pP0Ii
         zlQIjipWAU2ne036P0/6t23ZMLIuQpEG8RbwhiqKWflIqs50OgwlWNfbXDGA98V7xBAR
         n8cGVsteBL+9nSoBUUW+97Wufnehn7etoKD7K9s86bXXxv+BnbTma7AS5ZZNW5yqd9CD
         6r3aasZ2q7AdmXAsKnLmGvpjdmVNS6Ahg/RrrtMLvcZGWRfiDoLtYHyM5M2cAuprhNbP
         myAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554895; x=1793159695;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9paoukZlfMxNYNsrD2iQm9b4wSqYDltUgKwGmmCVVPQ=;
        b=s86RKdE51HsX7GfLfY8rNrDVYyi8Q2n23MK+s2yODDHLeYb8M+ApUpFUxL3lgtMmRR
         Q68yISt8Si1Lqr+cLbLvsoAjAqCULCPKreA4XZf8QHGOGNmJkfZCCbO9t9KaeNlvV8xi
         Kgv39i+Ie75tWzF9MbMEObPU7nfixRU+RQA/GYuxl1DnK2ZArTvkcSrgIQbq9lQhGrx+
         aHYBa34LKlpor5mz9YkpvLsviJYDK12+BwD8KOhp01P4zuf+uwjkF4BLN6hguBo5HBik
         Gr0f3fnz1/Pj0lOkSHaGnnWU8RI6y/NnZtqCeYv9gRI5oGTYTDnGkwz1rMg8f8R0SomB
         S8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/eSdQSWpawAJKkoN167fQSvbroAheMFf4A4wuctEUBOOwXWcOdyQhloehoQWkozDXQaLMuXWoQN3+sMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG0S8gIzOJ83RcCQvUxXvHVpTGo6cO5uoUZ6DEImun9/l67bNF
	hhQCMI3Vud1ps9eQQ+m3WwOsLo5wbSlCkaHMgdXbe9HgSSTWMiU8pU92DFEiGMsC/dOUdPK6SyY
	Ych0dnDVWKY4Ps9VLK92cbg==
X-Received: from pge2.prod.google.com ([2002:a05:6a02:2d02:b0:cc7:81a1:7ffa])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a42:b0:3e1:73d6:692d with SMTP id adf61e73a8af0-3e287bb4274mr725097637.10.1792554894165;
 Tue, 20 Oct 2026 20:54:54 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:54:45 +0800
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
Message-ID: <20261021035450.3488805-2-stanleyjhu@google.com>
Subject: [PATCH v4 1/6] scsi: ufs: core: Remove an always-false WARN_ONCE()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The WARN_ONCE() in ufshcd_poll() can never fire. completed_reqs is set
to ~tr_doorbell & hba->outstanding_reqs on the line above, and
hba->outstanding_reqs cannot change in between because ufshcd_poll()
holds hba->outstanding_lock. So completed_reqs & ~hba->outstanding_reqs
is always zero. Remove it. No functional change.

Cc: stable@vger.kernel.org
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bcc2512bf34b..12aafcf1f9b3 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6072,9 +6072,6 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	spin_lock_irqsave(&hba->outstanding_lock, flags);
 	tr_doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
 	completed_reqs = ~tr_doorbell & hba->outstanding_reqs;
-	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
-		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
-		  hba->outstanding_reqs);
 	if (queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
 		/* Do not complete polled requests from interrupt context. */
 		ufshcd_clear_polled(hba, &completed_reqs);
-- 
2.56.0.212.g129ede20d9-goog

