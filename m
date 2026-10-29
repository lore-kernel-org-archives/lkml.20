Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257713;
	b=AufI+VZRgf1ZK3i9XnSKp8l4Y7EgK1zLX5PLIZQsWTp/OICWjc6LuOpxVFPDg1pc+LSj
	 43pN7AjFHFE3oacWASqhIYXOdRV1FdjYjipbNCsjuX+WUwj9IEvSJjj8TPG/yCgOz1qPV
	 TJ3BUuCx7KuUVVQPMk7MUQNuSu2BxFViilbIa/wzkbdrT/lYeax4hapvS8E2s99Nl/W7F
	 7xX3UlhdWOu8sJ+bBv5ClJtxqDv80BB10/8gJ26obaYCcCTietN1LFl0PDLfvcYDWgXp2
	 o+rc/0aGdwE8YklLCMQFOT26tbOP2G9sSXuBzFlopFh5yV4vBdyP3szWOdsYHc6IzgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=K3AM1SjPaLQrVo38ruBsuLHnWg43JcXaTUMKROby+Fo=;
	b=X8HpP5Y+8KEl2RXQKB1Oa49HeTqe35Q1wt0F2VOUaSn0VkmOKV7f5nbAHM4W0PFyPEsU
	 8pyRlFSWSPZS3fQJEILEew33u99L8zro6sC9xUhP+wcL6KPL7gJf1C0PZDlodMzU0xg7v
	 PyZUMUPC0pVZqwesE1NpRcLEL7TPQARc3m0dwPZA6O9Z7cuiyE5JuuOVcXQS31otlDINP
	 sXlG4X1rpf3gdUwCk7IJFZ8SFJwIgpsgrxWnruuc3BcEQ324k8kZ8fl65icn80CYh5c02
	 iwHDu5G8bbRCOYvUTcmUZaBWott9mXp2cg2w/WZMS6ldBHJ7nCHAfGnTNcCDIKBL7NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pFB8TQ1Y;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41777606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41777606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pFB8TQ1Y
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c768886a6so1262120b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793257713; x=1793862513; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3AM1SjPaLQrVo38ruBsuLHnWg43JcXaTUMKROby+Fo=;
        b=pFB8TQ1YQeWXLYAhWLUJDr0NRIH+pHeQCd/sMwybIjbx0s3gCj3YS29wqxvoDu0OUr
         ct1iojtLwKHcbNd5MMnSB9zKrxw/3NvzSvk1vSoaR58s89pKr78xQPTHir4jx0N/BBnN
         3CDhboZUvLIt7XZxYmlJuAEP8i5XkYI0VqilBE3DhOwj22lvjmaO4vj37KLu4AUg2sIt
         90PJQZUSyrYfAFFlXiv3tTfTDY4bY/d8B+Wby79KdgT9tUgouHq8jh9ymFcPi5brf9eb
         IJj45uyVGJEgbX/xBnhNFjPf0puvQvhRRMfS7f8uMkMC8H7CIK95yDpyYmPr8xnjlsGC
         rcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257713; x=1793862513;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3AM1SjPaLQrVo38ruBsuLHnWg43JcXaTUMKROby+Fo=;
        b=RbCeTJHQtb6faajIHg0An7aH3VJDIU3MCy4BXfRmQ6xgxJLVoJgM72tgRwpIhG0p9A
         v88MT4k0HmP/xdBCIuk5rQ5bIh2ICq0csUiUZWOjmbkeqKU6rgeyyUXyXwhLgN2toQcv
         oGWUllAKQ11wnwEyKjQDk26kdI8hFQQAZ/ZCVaZjSJIs6fxAr77XVJp1issAhyxeeZHt
         PAxzZhJjbVpOR6OaA0p5VIG7JXnSqCHXhJ8x8D3JCxL5Wc+AI20hHFuUXrW+LhM8xoUA
         Oxxzn964YYijY33c7DEGJXFzM2L40Y/AUiRUs8uoHfLTCJWUN7CcO1btdmlt/XoeVgC4
         rTvw==
X-Forwarded-Encrypted: i=1; AKwUvBwM/y+YJApfP01NPFJJ7ihEFY5UYpzF9GSnAolGHU7lyrmpQ/KLM0m9opMA4I9l4aRaq0TxV3oO1uKy24Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+1y/JeD/CwQ4YxkykHlzeH+4SUoSyyJGDcnLkiRn5QFV8fNVm
	UnM1fNvouOpnnEFRcmiNExniKpvjmYZW+awSEQqnTXiUCRIEALBKp9dau3MH9+/1lSb6GlqXxAB
	5XB0vK3lcPK3N3Gqn/mrLqA==
X-Received: from pfbbr15.prod.google.com ([2002:a05:6a00:440f:b0:8a0:7c0e:8263])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6372:a810:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e9023432c4mr3356622637.42.1793257712327;
 Thu, 29 Oct 2026 00:08:32 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:08:30 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029040002.2100002-1-stanleyjhu@google.com>
Subject: [PATCH] scsi: ufs: core: Keep clock-gating hold on failed W-LUN
 runtime resume
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Peter Wang <peter.wang@mediatek.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	John Garry <john.garry@linux.dev>, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

1. __ufshcd_wl_suspend() takes one ufshcd_hold() reference and sets
   hba->clk_gating.is_suspended while the UFS device W-LUN enters
   RPM_SUSPENDED.
2. Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
   suspend callback failures"), a failed runtime resume (for example
   START STOP UNIT completing with an error) leaves the W-LUN in
   RPM_SUSPENDED with power.runtime_error == 0, while
   __ufshcd_wl_resume() already clears hba->clk_gating.is_suspended and
   calls ufshcd_release().
3. The next W-LUN runtime resume runs __ufshcd_wl_resume() again without
   an intervening suspend and calls ufshcd_release() a second time,
   dropping a reference it does not own and underflowing
   hba->clk_gating.active_reqs on UFSHCD_CAP_CLK_GATING hosts.

Keep hba->clk_gating.is_suspended and the suspend hold across a failed
W-LUN runtime resume, so the hold stays paired with the W-LUN
RPM_SUSPENDED state and the next successful resume releases it.

Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index cc75384c6502..9be370cea52a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10626,8 +10626,14 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 out:
 	if (ret)
 		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
-	hba->clk_gating.is_suspended = false;
-	ufshcd_release(hba);
+	/*
+	 * A failed runtime resume leaves the W-LUN RPM_SUSPENDED, so keep
+	 * is_suspended and the suspend hold for the next resume.
+	 */
+	if (!ret || pm_op != UFS_RUNTIME_PM) {
+		hba->clk_gating.is_suspended = false;
+		ufshcd_release(hba);
+	}
 	hba->pm_op_in_progress = false;
 	return ret;
 }
-- 
2.56.0.313.g2479322e68-goog

