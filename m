Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484484;
	b=WeVKw7Y5EKKzCUyxf9AKOxJ+xj7BbvhR328Mte6y9V7/Bf4JJCCc2G/b8y3nV5J/i8Wy
	 5fmtQ3Bd9siIPGsA0nNG7aX8L3S9R5/3yIwsuXCVNfzPCyxWic9tl3uSOvjzy7OzBRBS5
	 teQT54q5+mmSyQjBdEQKb2FWmdhDkU6k96WYmDi/DOn8vQ8bjxkO+OpXAk/XgLrYcsAnx
	 lGC+XM+ELRD5xSgDYvV0k/dJlzIC1+84x8fZsaBj9V1zSKyofkPYHpjp9SUpGfWPE5+QU
	 bPEduvtRnKtP+tTT0kmj3KO6xh/DzXqi3H8Xk7lLDT3HC68XPNaLyT6VQiolLWyHXww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Y0S2/1HTQXjT7j6wQIYRpSV26ZEjZ5U4TjqBh9LMm6s=;
	b=SVmILLMKDtAXLAkmhqhYb2KvF5/8bFFiAzob7SVTaoOFoRPF3kd1t2gHP+EehjzQE77d
	 MMJE0xlCGfl6uG0u9rHUmdNqAmYhOeJhyPEWl4l1/kpStCszGEPIkiNGNrflPCiWQI2hm
	 5ft1+MC0kZPRpwKEF0QkhMj4Q/c9scKbmfO9HUSvoXiefhhTpaChaVpZkuwEO5El1JlDU
	 awHyVXhHMvvpYblOBma492JmV6a0wLiYhc2/NTIGrm2Dcdij38RZk9mfz0dJf+9znhXCm
	 jEzN23pTAy9fMcCVwOoxEWpglzHqa3OwsNRaaqsRQ2PMBOU0jL7ybCd0Qt/6793QY3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NIlruYmw;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996360A2608
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8996360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NIlruYmw
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so4135957b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792484483; x=1793089283; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0S2/1HTQXjT7j6wQIYRpSV26ZEjZ5U4TjqBh9LMm6s=;
        b=NIlruYmwjbEE6hjnJ33S+zXOLPmcQLJDErdhDRBEDCb3kF2A9sX7NUITVUGIL5TNDW
         ecTIMM6NdFKmyJT7aVJ4YLansxWpZL9v7YBlfVimFCN3jjyFgUjV+gpsEMJ7jGO6aPAo
         xW4sMgoeE9fQ9yZI6SFiHx35epu3MZoSUPByg/BTM7yQkScU6czeOWzlJQHj2KbQ5GxL
         uN8iTk/WikJDiMI863/+SOhBQCabPHFuGXUEh/4zx1FKxEBg9k3V9Fpx4aGcs+dRTr43
         ufEI40eNlrcYwUNEitEQ50Su+DlCI3LvoHtvANmsOeG5+s7tDdTD/AsTDsh8IWGco/vK
         vz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484483; x=1793089283;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0S2/1HTQXjT7j6wQIYRpSV26ZEjZ5U4TjqBh9LMm6s=;
        b=faaMKNYIIDi1IMnAAM5SP0a8Fq1smO4EF82IBpP9fJhWfXZ2lqWp7Uf1M3JGlpUvyw
         6JQXMxN4LqccbJhgr63wP9Bfwav8Ucy24yg32FZCvf8G9CvLsW14uVOCGzC2BDlAqjIt
         gB3Dkhev+LQy0V6CIkTTcgzwg3fCVZCTbMDQaylSZinwQnxP82cDR8TutUcN4D95o5CC
         JLbpfEEAp69E6v4vLLOPVyPp9uwZqFPXpSHzuohM4nQ32AXljGk43qgHisztfvHzC5DW
         xFpugzMpp87Jlu622w5T4r4r+Zz7hEBergCjdvQwE8NRXba7M+D0ABxsfAsysRh+sZYo
         69Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzkCEwYC4wrHW/EvXkKDwVNukqMYmShXMG9TI9b91+64jk14oGPCSiEyx0GnmYwYyFhMoa3sJ3V1NilYSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaAAL0Ihk0lZ9dB77WE56bQtcO5rSxk+WTtbBTFMykXQiehrAA
	OoyMc3kTx+I/DLFCBkmE1B9ojHvXrTEB7RGvoBS3d0g4ZOWNgriXmB1/eI38EhWMQQvEM+V8fCU
	1tgnGHor/a1W33OpNJP5NNQ==
X-Received: from pfbhw24.prod.google.com ([2002:a05:6a00:8918:b0:89e:a4f5:3f5])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:8009:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a04ba04bcdmr8600296b3a.16.1792484482530;
 Tue, 20 Oct 2026 01:21:22 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:21:08 +0800
In-Reply-To: <20261020082110.3511797-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020082110.3511797-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020082110.3511797-6-stanleyjhu@google.com>
Subject: [PATCH v3 5/7] scsi: ufs: core: Fix double release in ufshcd_eh_timed_out()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, a command that times out during a power management
operation can be released twice:

1. The command times out while its normal completion is running.
2. The completion path clears BIT(rq->tag) in hba->outstanding_reqs and
   releases the command. It has not called scsi_done() yet, so
   SCMD_STATE_COMPLETE is still clear.
3. ufshcd_eh_timed_out() recovers the link, sees SCMD_STATE_COMPLETE
   clear, clears BIT(rq->tag) in hba->outstanding_reqs without checking
   whether it was still set, and releases the same command a second
   time.

Return SCSI_EH_DONE when ufshcd_clear_outstanding_reqs() returns 0, as
another path has already claimed the command.

Fixes: 01d5e237b339 ("scsi: ufs: core: Handle PM commands timeout before SCSI EH")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 03efbd85bba9..111f5805f178 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9653,7 +9653,8 @@ static enum scsi_timeout_action ufshcd_eh_timed_out(struct scsi_cmnd *scmd)
 		if (!hba->mcq_enabled) {
 			struct request *rq = scsi_cmd_to_rq(scmd);
 
-			ufshcd_clear_outstanding_reqs(hba, BIT(rq->tag));
+			if (!ufshcd_clear_outstanding_reqs(hba, BIT(rq->tag)))
+				return SCSI_EH_DONE;
 		}
 
 		if (ufshcd_is_scsi_cmd(scmd)) {
-- 
2.56.0.212.g129ede20d9-goog

