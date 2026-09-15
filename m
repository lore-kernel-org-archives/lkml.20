Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445884AEBED
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475444; cv=none; b=UPkUIzyOXD6QDCtMJ/Oyy1eLVeteWL9RDNspGSLvvgI6sZtgXnnH0TtRd7hT81GM7BDVR32eRT8g3VQaKsmH28qnkvapNDNVuQcIdD7d6EPFvCB6AainLEIpHPQyYbna2tvfCc3mIsTcO43v3hxWyi0C1Bo6oFld7gSqri4JgVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475444; c=relaxed/simple;
	bh=rD24ettfq/yp1pQmJ0kLVwsU5W/LV5RYcqusbnnOepQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+tutuu062yv1uoOtitTHgRdW0O/vapj0eKmbhjC6XR959PsouDUVzsecGjQHQvI1AFZ7y9T9fFNZMpOqGdcmwFMakdTNQ4oG/deRHqRTX+BogF9h8+zED2SJGk/wsKjnPoN+xqkVmq9cC6ofu+btN+kk4lJejTZzHA2Nf5Hq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/COkGoT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/COkGoT"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so33590545ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475441; x=1790080241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqadnkZnQpvwO0yu2aZCQtLbtAViRwE5+Ankys+V6vM=;
        b=U/COkGoTdqCZ3PzMJeQoGEqlBmkJtD462nSvTKU8IJtDFfhKPkKvN7wlWYcdkVes8Y
         +SRiXks97fDsrx5QAXMyWGa2ZEHBA2SDlbdsHdn6hnD3HkP0wDPym6ySyBezYy1WxXW6
         HAbvikdPtdyIATJ5l3iW1WgawFyBe9Y6QWLlwg7tlrvfvHBjLb5pmttoltbgU7a1gOJf
         NaBv+Hc8gKigH9ffHQYHczHV+dQ8mfT0D16iUVdmlfH4yONVwAlWYbX5nDlenuE5bC2s
         0SEM2OnjDqp3ZcYvjsCFa0DjI5VNmzc2r4R7LZosqX0M6QxKmCGbIyxuD96k+2Qzid/8
         QgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475442; x=1790080242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqadnkZnQpvwO0yu2aZCQtLbtAViRwE5+Ankys+V6vM=;
        b=vxaCzqFV/xV5TOuahzNNSo4jTSiiTnNAcId2f2G2Wqlo9Hbg1csrZDkO5yfKuhIPJ2
         AaZsC+P+3fxMzlFfUNFaLYN+sFmV0EdvQtgDHGhKroJDrnOhEaQnAzpQUK6/X++VchZt
         tjEcb67kNsa2eq0R3MYw54xiXBIv83uASCw3JC3Xh/oML7OgHY4z0uvmDCJgirKIHHl1
         QU4D0NSWVB1Aj0YYua1bg76PViMrbi1pg8weStnA7OMN1kiVfnLg/y94b4zYcrRzmXdA
         hFUOvJfUaRjXIcsbauxXYp/XMAT7Mbc9oCdo8I3pVr0XxXA5Khq37utngY2pVo/4HExq
         jSEg==
X-Forwarded-Encrypted: i=1; AKwUvBy0Li/rtRxRIJNKf0vlrZanAFKfKvTinelrgBXP19+tNkhtoRJ6EZ2GJMyli2GtRiJipbsE1d55oSJjMP0=@vger.kernel.org
X-Gm-Message-State: AFuF++lOgLBP6i/+Fa+JldE2L/YfpJsvTXX9LFCmkjUpv8ciTHq660Vt
	wtVy/lR1zNaNuXTjdMNrn/+emtK6SEpFAyEpDOqunavoHGJWqXZYi4Ad
X-Gm-Gg: AYBFou3oto4/u8OowA+1aZsP/RJaGe56NLjPUxLMTT4wZ/ds34VjDcKLkKOMTH76DFd
	/ECt4y6HcDMt/Xj+igAko4LESEpW8CWNJS5JL5ZsfiX4xLrL5zOReC0RnBNFpOLRgGBlw0q1MrF
	ptsVagbssyLOz8KFPHih1oceAvPojp0qsaxQFC3hZhEPnv2aJKEVP4gr4b0IjpUjovOV+/iQB3n
	NWoDWZoK3BO+F2NsLp7/E4lNzvDRYxnbSzg03OAG4ANnTImAy9L+W7qtTjK9tQ7FaHBhnP+2sXi
	eQFaRHGPywqe5r6hAB6XZM2V/S8KWx8s91UotSbR+6qFlGOgbi5ySrm56Iz3rQad8iUoaZBExhA
	S0yDEsbirJcPUQeGtmgBjGs71DRYzyIzfX0gWyerumtAQDyOq19IsMmhBzHGlrj4u6wRmkYDTKI
	0Z6UPHmyeKtZzwnsfxHB7Y6fuH1GgNP28zZ12b0WjG9dqNec0FsWwQvno=
X-Received: by 2002:a17:902:e54b:b0:2d7:203b:9863 with SMTP id d9443c01a7336-2dd6c5b1084mr131399045ad.1.1789475441464;
        Tue, 15 Sep 2026 05:30:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd76fc2c54sm12402345ad.72.2026.09.15.05.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:30:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: venus: avoid HFI resource leak on IRQ request failure
Date: Tue, 15 Sep 2026 20:30:09 +0800
Message-ID: <20260915123009.2420780-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_probe() calls hfi_create() before requesting the IRQ, but the IRQ
request failure path does not call hfi_destroy().

The history patch moved hfi_create() before the IRQ request to ensure
that the interrupt handler context is initialized before an interrupt
can be delivered. However, if devm_request_threaded_irq() fails after
hfi_create() succeeds, the error path jumps directly to err_core_put
and leaves the HFI resources allocated.

Request the IRQ with IRQF_NO_AUTOEN before creating the HFI device so
that the interrupt remains disabled during HFI initialization. Enable
the IRQ only after hfi_create() succeeds.

This preserves the protection against interrupts arriving before HFI
initialization while ensuring that an IRQ request failure cannot leak
HFI resources.

This issue was found by manual code inspection.

Fixes: 3200144a2fa4 ("media: venus: protect against spurious interrupts during probe")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..42348bdc2332 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -432,16 +432,19 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
-	ret = hfi_create(core, &venus_core_ops);
+	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr,
+					venus_isr_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN, "venus", core);
 	if (ret)
 		goto err_core_put;
 
-	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-					"venus", core);
+	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		goto err_core_put;
 
+		enable_irq(core->irq);
+
 	venus_assign_register_offsets(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
-- 
2.43.0

