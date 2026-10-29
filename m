Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257731;
	b=Kan9rFzpyhYSJKt+MEz/uG+UUY5UuCEfGlB1PEYQNLfPNUg3J2Mo2+II4+zGa9EYmDKB
	 B1mHyN4e2ajVJdazahQVxDAFkDL7jJvVec0shNAj9wMh4GSmOl6Xol37/3NKpDrhbtHZa
	 mFnSDnIi9jay3q/YxARLdO0IbG5dvMpTKYqfJBIAQkPuJKQCkhU+F/qBHgU8Ho1qf0SH7
	 v/a0M75ShJySE3W2V5e0fyMPylxXvCg0mPAk+zQyD3F5ODLTNCPyZhOxgkR9R9KnQRhvn
	 fdRYDXxltm6wMgd5MPBC3wP0VG3DC2lfNi1qr2xfAE9zdqb01tRSCbZP1dwVt+KGaCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Uif8SUPiQxvyHMNjuvXHHFnBYtEULndqqGbcF57aROM=;
	b=RKSxMsYOOOTQtQdgZsoQgXr0C5+qT0jrSV2CfQMjOK0IK9nQjZiSZEceUUz2Mk3iTagE
	 fw9QugZf555qAL/5lHEpEvl2cvVzomJb5RY1KDdvtSxRkPAa/XtQgYoc4DR460Hig35ws
	 GxrHxsYv9t6IJ3m9sbRqWJe2Jfhsbc13kCISzrvoXL0GrMZCpfobSQEyE62TUNsZDWrNZ
	 Mc1KesW93dsA1RQ05ovYKBMIaBFwdk/IPp8R2JMgrl04sw4Vi4qLlioO65IYO1zlK/dyT
	 kfm9C0DoissR2NI5XREnVmGttk+CMKMGH2C+EphfQYHL6b9kGYtqgtt2hq0Kk6KIrDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F/h5VAaW";
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3029B606A339
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3029B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F/h5VAaW
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso2276508b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793257730; x=1793862530; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uif8SUPiQxvyHMNjuvXHHFnBYtEULndqqGbcF57aROM=;
        b=F/h5VAaWMxiH+za1B5Ex14pfj2Q3R2j5BfA5jvwvwgh7NU1VdN23MnxXbbaQcIA80Z
         NYyYanIIBoOQeQBBnLySKyy18thxfRn6fK7RyQxH1LxnNVW/eebRhoMUeKp4yHRSwLfB
         QFz8vjnPnbdJk9DNp6vokaehhxuP8aeOkmIweJLwi+Cp3vzD52cYPwrptjtebPoIztJq
         rTjYOl4Akuzv/koMaTxFO3FxHAHl400hl+3F1OVHb55tsvue8UdyDNiWXG6/9PFwEf2a
         5DwJ5j/OsgaNrXmy5ab1An9qfGp1yqkeLCY3nN7GgWn0n4ngs2mG2fuuRS+J6+3aD2w4
         uyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257730; x=1793862530;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uif8SUPiQxvyHMNjuvXHHFnBYtEULndqqGbcF57aROM=;
        b=W1e9uhbSbwZ2t0wkXf3osYlWA7gbOFUW8hc3HYAMtasAdYIIkcNdaBZK9eFTtquDFK
         7Py6yMbYEJts4Y7Lqp0MACtS+DHiIYJUl8a+j0BrVQ/1vRfvrTl7Ae7iQpr+kJ08x727
         qJeDWkAe7YguQO8+amwp2OrdBPJ8+HdXEYMaByQ6MoFZy90vPMVgv/m8qicd+UXSUqor
         QULiturj+QdhOC4H+Mdh7wtrQO21PS/LKGyT6SSe2zD8C/zGB44TLGxeftoNuhjiEL6a
         JiRRAERQe37lgX0W8/304TT/yGHLgO8NufDz5GmJ4MJYFrcRs1rSZt2sUh6kgH79gJ3P
         uimg==
X-Forwarded-Encrypted: i=1; AKwUvBzu+CkSuI72HIPujr52OJ++RvrWSp8r9RA6u4RD/91qV8QnfBUNew1/WprAlnXvIDgd5+m3r7Z5EKZesM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZZ+9U8++Aqvf7TGb19H0UQI9a9b+2nTmdu3UcMu/+HLJUlK9V
	5+xOt4168RHSVVP1GpZuAL+6ctvWHscGciT6M/VTSi/gF/RbUQhp1HNOIZGJ6agxheAXpslt9Ir
	COjA7onknLdNrheak5ftszw==
X-Received: from pgbj18-n2.prod.google.com ([2002:a05:6a02:61d2:20b0:cd8:c6c2:d403])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:49a:b0:3d3:ae50:97c7 with SMTP id adf61e73a8af0-3e90226ce3amr3469934637.20.1793257730310;
 Thu, 29 Oct 2026 00:08:50 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:08:39 +0800
In-Reply-To: <20261029040003.2100003-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029040003.2100003-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029040003.2100003-5-stanleyjhu@google.com>
Subject: [PATCH v2 4/5] scsi: ufs: bsg: Abort ufs_bsg_request() when runtime
 resume fails
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>
Cc: Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufs_bsg_request() resumes the UFS device W-LUN with
ufshcd_rpm_get_sync() and ignores its return value:

1. The W-LUN is runtime suspended.
2. User space submits a BSG request.
3. ufs_bsg_request() calls ufshcd_rpm_get_sync().
4. The W-LUN runtime resume fails and the W-LUN stays suspended.
5. ufshcd_rpm_get_sync() returns a negative errno, which is ignored.
6. ufs_bsg_request() dispatches the BSG command while the W-LUN is
   still suspended.

Use ufshcd_rpm_resume_and_get() and jump to out_complete on error so
the BSG job is completed via bsg_job_done() with the failure code
without dropping an unacquired runtime PM reference.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Cc: stable@vger.kernel.org # needs "scsi: ufs: core: Introduce ufshcd_rpm_resume_and_get() helper"
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs_bsg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs_bsg.c b/drivers/ufs/core/ufs_bsg.c
index baf6ae917d36..8df1a2c6abf6 100644
--- a/drivers/ufs/core/ufs_bsg.c
+++ b/drivers/ufs/core/ufs_bsg.c
@@ -150,7 +150,9 @@ static int ufs_bsg_request(struct bsg_job *job)
 		goto out_complete;
 	}
 
-	ufshcd_rpm_get_sync(hba);
+	ret = ufshcd_rpm_resume_and_get(hba);
+	if (ret)
+		goto out_complete;
 
 	msgcode = bsg_request->msgcode;
 	switch (msgcode) {
-- 
2.56.0.313.g2479322e68-goog

