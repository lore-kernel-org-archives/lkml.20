Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484482;
	b=fIDBr5HZi+wP8dz6Hq4I3O2MSKqjIGEKOBMd+FPTQCdUX7WtHVtD54F+OPJSo7gY2N+H
	 ZrtUdFPKodPH1W4s1eeoX5kJd+BEhNYurZybbLOmtdIpvnCeOYHAZFnzRw97eubkhk9hw
	 opzXFPcP0hVigo19AjIJr8DB+or5G2WrPf75qmON/NSErBr/vJedj5Gn5sPk9wJoiMtNk
	 5Bf5p4w40xIeVSzy7fjWr+eWq6pQ7o+zwjRJpCPgWB1qKC6BsgcJxu6IuMghS6oVNb67Q
	 C5QLQvrZsagHwKX1BVIByDvxPKw7sAyB8pr3nf7XMSu3+BjlcZGJDQZSHKi3mFZNoIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kUb4PjDJE3jmbIXPSQFsF3M/wgWILtNCIkP/sO++VrQ=;
	b=pygFIVgEabtBDz5GK/gnU8LNOWZEAMfVji9cO4yRV8SZflleCE8aZcBx8NhmSLy3Bz0N
	 mC0nd/Qa3CUU046VU3Mhpz438I7FA5JETWvNNDPQgNUmT1jHNE7ycqRN3/o4eu5Irz8/w
	 R0v6suOhSVTQp9tn0F9IsuiVgGDcaz/+KaCXqosFSe+TVk82yUfTESOUs933UjSz0HE+F
	 rf4sM/kOPeyHYakHWwcoqunIff7mFb5zp2AlrLyuSli84+XqNsN3ZWlVEEqDebHarkm/1
	 99xtVIDgIO+I7ypSlMY+ztqOpIU3LI70w8IffxUghigVZRlalbrqoAFc2frA1P7Yq9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NWyv+XgA;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AEE606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AEE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NWyv+XgA
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso2118161a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792484481; x=1793089281; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUb4PjDJE3jmbIXPSQFsF3M/wgWILtNCIkP/sO++VrQ=;
        b=NWyv+XgAyn89Cjyc1kpyFtEvrseSFaaSjvJKD00zUxxAqRwBDNLtDh7+0yKZ2rayjb
         b7pJ4qSmGrbQs8tV8jYWtw8yzkEI7A7bjoBckHaNcEwjfmPmkk1L5aLmcxqeE1rYjqP1
         GjemQvDzEjslx97UJ6jiiFrT94X5dPgIG2LlKYmx53KFctsNjEkcp2lN9Pfmn2IiUctL
         AYxU+d1EO8dBOdNd1q+6cMeMAgXry2ZEBeVTxwP/3FC+17HXXMaQG487bl9K/lgwXfmB
         lV3QGv/DxOmcV0LKaJhrjXJzA/uIn7PJku5X7L7Fzx/yo3nNx7+lB0j9lyqkLD/oN2UF
         7y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484481; x=1793089281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUb4PjDJE3jmbIXPSQFsF3M/wgWILtNCIkP/sO++VrQ=;
        b=WkBqXYhOybppxYMQXEVRpxfsnwdbfo3wCKou0tif/9ra6pai7vuSGU5ilhRJriC315
         JXppkg8DgadiE67N0qJVV+JS/7aIQ1NSUm2944u5BEAfu+sc/W030e8Ss+6Ab411tl4l
         VXRotzHfqmPBJh3B2hEoQPUCFStJTISDN2BPyEzGy35gAzPBnHj9ohTVe7rKgYnAFSHm
         LFZk+HKsS1F0kwa+LEkR3BfVr+/lpCPvWFXGHORqAn6zrc+R+RZPYMdnASQhKindrVuz
         FyUq6xy/DQ4sZwjk/CLJuKRymjChKrNDuzVJcQSBQccyXTp9CEwMV/pqDUNWOTD1bC4L
         GQ0w==
X-Forwarded-Encrypted: i=1; AKwUvByFqwB0kcde7GVmNmknqY9ODOfILjxDol1erscQc5kDYmZFUMAJ4IBqDj/mLVgj/o0iz1+3Jou1IdFRPa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEMCdDLoUmJfDrt8IWDhswm8xChGakaq/TPfUylDQrgjee/caI
	RWINCLnDMGnska4JREzzrTYGT+y+ATbOSpRh15uhOEe82gn7MpYy94rK9OrDrekMxSyvrTWOWOV
	mwHbhAUNVrSXChLuVH8X9RQ==
X-Received: from pfbct6.prod.google.com ([2002:a05:6a00:f86:b0:8a0:4085:d831])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:730c:b0:3e1:e757:205e with SMTP id adf61e73a8af0-3e225f9fd41mr8502692637.42.1792484480229;
 Tue, 20 Oct 2026 01:21:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:21:07 +0800
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
Message-ID: <20261020082110.3511797-5-stanleyjhu@google.com>
Subject: [PATCH v3 4/7] scsi: ufs: core: Use ufshcd_clear_outstanding_reqs()
 in ufshcd_eh_timed_out()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufshcd_eh_timed_out() has its own copy of the code that clears the
timed-out tag in hba->outstanding_reqs. Use
ufshcd_clear_outstanding_reqs() instead. No functional change.

Cc: stable@vger.kernel.org
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 778932298e27..03efbd85bba9 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9651,12 +9651,9 @@ static enum scsi_timeout_action ufshcd_eh_timed_out(struct scsi_cmnd *scmd)
 	 */
 	if (!test_bit(SCMD_STATE_COMPLETE, &scmd->state)) {
 		if (!hba->mcq_enabled) {
-			unsigned long flags;
 			struct request *rq = scsi_cmd_to_rq(scmd);
 
-			spin_lock_irqsave(&hba->outstanding_lock, flags);
-			__clear_bit(rq->tag, &hba->outstanding_reqs);
-			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+			ufshcd_clear_outstanding_reqs(hba, BIT(rq->tag));
 		}
 
 		if (ufshcd_is_scsi_cmd(scmd)) {
-- 
2.56.0.212.g129ede20d9-goog

