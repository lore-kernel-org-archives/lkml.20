Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B02EEE93
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788579635; cv=none; b=uDFxTfLN5aipktkkzQ1tQ/qhHYb6ROqgrx6gNC5djTxxNXoyLIbbWzELwvCbmpKwhSXolJSgFf3+3MMry/BYWYLD5EDy4bMHKk+vVemKtbbC4xztcX1RSHm/fzY9aRkyrBsvBoNfl3avBw+y3FJ90Xw8/te/aPf712I0i3n5VaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788579635; c=relaxed/simple;
	bh=h58rRfgQOT1BFyheD9hG5lpbczY7NlBk2zXRfllj/ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9BvQs9cFlmabzqLYb51ZCPS22+0oF5i+kiYp8/SkmpKMsJt+z6DdIv7/hRAjT3k8u+tlWxjJ32zLmBY7gfN2zbUm51MrACCx4Rpue2CZ15B8YoCM6UJV/3+991ANiRNGdMsU7Tjx0V1FNyFoRwb3P3S6ixkdZUDMPCk043P/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qifJ7q3F; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qifJ7q3F"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1340812a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1788579633; x=1789184433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEg9KwaHVCx+xXyU3Ht7Kg/Y6eHD9fATek7hVNpbXCg=;
        b=qifJ7q3FemsdrK1TtoF1WrPgYMusWAqbgpKtOPEA3DiiOjCqEaxtxop3Owp1w9LrKJ
         cjp0ulI91m15doPi+VzuvEtQM1jRQoLEwM8laG8M15VB3V0O94yaDNTUbIeQbujku9oW
         s9lG6vRq8fTgrJRBr+jijS1vkfHfEJYvZd7YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788579633; x=1789184433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEg9KwaHVCx+xXyU3Ht7Kg/Y6eHD9fATek7hVNpbXCg=;
        b=AjO01f+i1Iyjnoc0ts9+kYX+DvivPGkm7gGhxHK4CYcWPtTtA+dDGMFjozTi7NXRuW
         XxRPkhBehDpKkD8HuK5xfSan11j7tiCrq/5yY2ydlZZl3qE/QRqgWlCVlxkRBKz4lUVU
         XhNNPyZvcDpuULw2NwNtADhuwpyxS6X26pJyfpLBOX4zkaCWA2auB29g1u0HE6v0aZyP
         sZr9bsIhjPd90lvGmDG2x6dPW/OKVyB//s4dDf3HhhRZV6doU4POlEk01qOCqR4sG9HQ
         v54GQJzPWKbsNMsICWEO9wiBmBqCO5hT+y93jal4De4fjEKSsm5OxNZQgsoTawRbjmCa
         lUDg==
X-Forwarded-Encrypted: i=1; AKwUvBzaBZzf63/07AvP1/omeq+hgo6L8tS4tgqSFS21qehHcwX37v+hba1/w2+mwbsectwA0WOkd0Xmn20DCE0=@vger.kernel.org
X-Gm-Message-State: AFuF++mcvekXXgNyJ4VgbzE0FbvrpYPDCSFwhrFJG2bFGXpqj8WZIic9
	ew/EWY/3TKxXHz6Gjq8p0ajc4ZLwTsl0q7bCJBPoe3U8DWfe8gJUANWQTN9AeRH6G/o=
X-Gm-Gg: AYBFou3fKGidm896heA36cCVMvtTaY7vtjqXSRcY98xGiCGdqyzIEC6xB7gAig/Plla
	W8ZYaHi0/S6wPPg4toLSLStlizvSmkDKZwJgR0PBY7NdNzel6jzl860A81VjYjP3Wyc7n+eQQYw
	2E5V0nHVxZuQVBRHA45KxUW5irM2g1lcYDF0F0yvTGma3l5OE6QdXdvfDFUBsvoH+rWvA6QV1TL
	bzkNKYt+oIgh1bLjMx1hxv/DjhnHRgmGq9dBWxiAMjYR6ttbK2s2y1TiBU657DwNffDEAr2GHBD
	RD0OzvxpONLqEtZ32Pxef77kqUOV1Wy8bXLsP7/VWirCdckg0FWTWpbl+lYJ49zj/tB4x0SouIg
	rMGmSBICnXsbEY6Fxy3OkWE03DFBwilxfNMn9eIPAOkxAxjfeB00PiYUii5RPhushpeN5r6Ipwo
	8bvKA2yDLY2KnYfyTiz+yqIlDmO9EmPv59S61UTh/4U13MsEUrXiNOaRNYdxkTYvG4Ulw6f/Ne1
	xRVkyXpNU2KFufMQtVGTCLmv3N8Kp6Ya/Lk/SPWqgmzMYW4+/ePWxIPqGO+Me3gHL9ZSms2aWna
	RcOIhd/MCQukL/XidU7EuyyeVFNANOD/axRLRRwrJ1w2j0PvEWuuqdiy7f55qkhWlfe4fnkpMh6
	bNfmyEnbIjHdMWM9GpRBCk9hW1w==
X-Received: by 2002:a17:90b:2c87:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39b26191cf2mr15056485a91.9.1788579633576;
        Fri, 04 Sep 2026 20:40:33 -0700 (PDT)
Received: from aegis ([2001:fd8:4d02:cd00:fe3b:5611:12cf:6ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b06cea473sm4210052a91.2.2026.09.04.20.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:40:33 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] firmware: qcom: tzmem: use sleepable variant of DO_ONCE()
Date: Sat,  5 Sep 2026 11:04:41 +0800
Message-ID: <20260905030450.34800-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_tzmem_enable() runs qcom_tzmem_init() using DO_ONCE(), taking
the once_lock spinlock. qcom_tzmem_init() subsequently takes the
qcom_scm_lock mutex, potentially sleeping holding the spinlock,
triggering:

  BUG: sleeping function called from invalid context at drivers/firmware/qcom/qcom_scm.c:334
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 112, name: kworker/u49:4
  Call trace:
   __might_resched+0x378/0x698
   __might_sleep+0x9c/0x220
   qcom_scm_call+0x3c/0xf0
   __qcom_scm_is_call_available+0xec/0x198
   qcom_scm_shm_bridge_enable+0xc4/0x158
   qcom_tzmem_enable+0x178/0x218
   qcom_scm_probe+0x4d4/0xcb8

Fix this by using DO_ONCE_SLEEPABLE().

Fixes: 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe retry")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/firmware/qcom/qcom_tzmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..ebcdee3c5975 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -518,7 +518,7 @@ int qcom_tzmem_enable(struct device *dev)
 	static int result;
 
 	qcom_tzmem_dev = dev;
-	DO_ONCE(qcom_tzmem_do_init, &result);
+	DO_ONCE_SLEEPABLE(qcom_tzmem_do_init, &result);
 	return result;
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
-- 
2.53.0

