Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750603;
	b=nGU1fn6Nh3TFaxe+zSzVcqFc8Ucb1wMfCis+CMiIoVu+ajmDNoG7bZUnyLqKFDrerLFJ
	 BEo8eI736jwFvIdvba/NRthjzJXLQJ/g2Ny/lFPq0lfqAH2l3+C+EQ3vH/i4ZS+Hlc7QW
	 HfAbAq2zSpYLg73fRr0kLRvflTEju/QmZlsJGWcmqM129tNtkA4wGLvFm3dh6qpA20GzH
	 VAmx7tOaMmcuP/yYkPEZvejoH1DO9bPGIgxJtoBbs4wbOAYCPLkZmcIdQYAS02sCYJ0bS
	 w2hcsxFKalgWrmrkdabVDklny2o68zRzn8axDGbpEb6jVI9aU5GfpvXbgjMWDS5yDcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/z+CNiWz7aa6AS1V1mN86DIGD1P9Q5f6dX5ydwPWWJ8=;
	b=XjgWVz/W/cHXY1kOtITFf4trXz//xAzKKhfiv6+lUaQ0qzwkx6oS88MG176ekkdsjFi/
	 9N3O71BomjR16UUc/IwCKhOSOXewYt8KAVcHk0bjhCQLcKYObi8543PAdUO0pCwebXGHE
	 j8KZgSUIa1AyZ62nRLDNUzNsHq7ZzL80ffW7BmAuxChq3ZRLLU/DoW5WOSF4vXu3NOnp8
	 NfO+zx1dv1Z04Ek+zSxTiiDRAC4dlhxW4HuRYuXBpHI8bIXOzkdcOShZC6Nvoznt71R33
	 tSz/EtCZMZTOCHjDEyaxuiz4Ifn78qdrTJWtmm0nepbunCVGv0Ks6TiqSQCAJiILilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QjncHXzV;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D83606A333
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D83606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QjncHXzV
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a028616bebso5246075e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792750596; x=1793355396; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/z+CNiWz7aa6AS1V1mN86DIGD1P9Q5f6dX5ydwPWWJ8=;
        b=QjncHXzVqh8zHbTAxnjVY0N8VzXDR70plAjCDKAabNbo1hsw9DqwCx5SyR7SCwOh7e
         jVgwxcf0zmCg/w+KYUn+2gIrMf9mMTVd1qW78Oe/EuDXm2PtJ163wPwLlqsrXvQ2f0LH
         O9Ak3UiRb9qdookhCrOwSDeuiy2nSEY6ijemnARRHVgJTGj5fluPCEvwJykaVbEaNoN9
         q3cb9+BO4+rff3u1vzHAqxJNp5a0eRx2I3jA5/aHbEZjsI2TJmcqhmOuolWFj553wtRW
         qoqtZmazAWwQwVeoJ2MAcx80ifdMJ3YzmLQKYSAxVfdVpiptiOr1HfBVm995w9MsgCAH
         P5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750596; x=1793355396;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/z+CNiWz7aa6AS1V1mN86DIGD1P9Q5f6dX5ydwPWWJ8=;
        b=ghSpRv1DwyJGKVTpNLSHa3j7DfW/ybOQAaBUVCvWNe/UZtUNazTsanrPc1sN4cFq2z
         l4l6nQ69TwP8mo5u7uIQqOmFilZn6IrqrFIlZ1kOWZSIsaJGbRijYBhjPlKpWxQfUh90
         5K2WZUQAMEbCxS5Q19v1YrWpS/Jk+ru5DRX2Rh/hlIqWIr8MGmYNrxzsidgbVWYro0Pe
         CsIr/u5Hvm5Rgxk5UtVCtPcg4CwHDV0kyR7B73ltiLG53NfYJAcBZermqhIE4dWwZZqu
         LvzmtYn+ibPGBSHDh3SkLEBL2sbsJ+TLa8qZC6LG5xkLCjBrj+A7Zq8rGYTyBGr1SPHe
         j9Cw==
X-Gm-Message-State: AFq9FYJtslZsjbXAct1ZpqrnQoozHu90TPSX/9efDSRgDszNkjcYHgrd
	EfDLgLSgFlFR9XUeFiTnFGGwGb9PvYZVq650NKkFSySRbq8xU7H56uMLQhoKSgE4FwE6LEOGj0w
	aZnAe3pz+BMvroAtPSpQ2BsB7GUWwf52unQq8ye07r+F7IupYZ4Qn0YZjIbn5R1z6a0K31Q0FVw
	8eyZRAvFHnyeDAPzj9XiCCA5c+0Rm98uEf0pbFv7J2LxXcNSw4HRv3dBc=
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:4a2:1396:ef32])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1909:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a21398df21mr25661445e9.16.1792750595975;
 Fri, 23 Oct 2026 03:16:35 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:36 +0000
In-Reply-To: <20261023101536.3965344-1-smostafa@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023101536.3965344-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023101536.3965344-3-smostafa@google.com>
Subject: [PATCH v2 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Unbinding the crypto BAM through sysfs on X1P42100 resets the board.
bam_dma_remove() clears BAM_IRQ_SRCS_MSK_EE unconditionally. For a BAM
that is controlled or powered remotely the register may not be
accessible: the clock and power of the block belong to the remote side
or to the consumer of the BAM, which is why bam_init() already avoids
every register access for such a BAM when the DT provides num-channels
and qcom,num-ees.

The write is also unnecessary. On a remotely controlled BAM the driver
only ever sets per channel bits in the EE mask, in bam_chan_init_hw(),
and bam_free_chan() clears them again. Both run on behalf of a
consumer, which keeps the block clocked while they do.

Skip the write for both kinds of remotely managed BAM, using the same
condition as bam_init().

Fixes: 5172c9eb89d4 ("dmaengine: qcom: bam_dma: add controlled-remotely dt property")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8a1f4e5d24d1..e01f0fec1599 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1407,8 +1407,15 @@ static void bam_dma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 
 	pm_runtime_get_sync(&pdev->dev);
-	/* mask all interrupts for this execution environment */
-	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
+
+	/*
+	 * Mask all interrupts for this execution environment. A remotely
+	 * controlled or powered BAM is left alone: it may be unclocked, and
+	 * the only bits this driver sets in its mask are the per channel
+	 * ones that bam_free_chan() cleared.
+	 */
+	if (!bdev->controlled_remotely && !bdev->powered_remotely)
+		writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
 	free_irq(bdev->irq, bdev);
 
-- 
2.56.0.307.g5fe7bd680c-goog

