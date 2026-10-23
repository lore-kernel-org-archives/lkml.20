Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750597;
	b=KzEWQffMyIoexid1mNT9/nkVplWbRua+7KH/Sa2E5gLSCy/ocLffhstNTT41UX4lAeBA
	 r5WCldqntTH7vuuzSHx7M1DKyzNgT8GsipGhAb84XLGAueOw3o6uHOyf0eSWjyQGt3Rcc
	 rNiVKvP0lWa/2zaDk3LnrNVgUryIeadhCDjUTu667ZPupxPmCjAknmMc6T9S30DvppYz2
	 veHf7p2r0qUal2gIfhGa2kc2IHIY3SIAIcETPQQBgqJ9ZPUyhN+Zuf4vGbEV9X2m+zsxA
	 drIuOS/FH8iioRw8YFtLoPiIp/nKf7bmyD4O9orW3TOgWd5dSoAfAAZfvr7ArKFVpNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=w3JinBf0Z2jF81QKjb6rRVvSkFxoBcyPBCQyWjZnSYE=;
	b=RKiwD5WnbDYpZ7qDA1nvZcaUNH+nO0PDHmshii6yDoKjbO8xDarkQm7uFEFExYytVD1S
	 vrwRy1jbj0h0pKNELidrTFT1jPa1XljFae3xMeZaBU/SakgwLXIm9qRkdB4TssOs0q/gf
	 D1iy3cf+FI3F3ooq1un0PPvF+AO0Z9OUSp84QJi4FSZBMwNJkKbdqpkhc6885Welj6cn/
	 zCFAwh07BvrRis7QGB0L3bne4OVsEq2hZ0hbJ06W5bD9VkQnLhZj2I9zHFo4gCUc+G4t5
	 dGaO4DsK++bhPr3PLs90k8dnZbCmOVam40y1r0eDJz/vw/Voj/l6xFNPJdgBhliBIDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lKBxdyju;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lKBxdyju
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c4163a5400eso198129666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792750595; x=1793355395; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3JinBf0Z2jF81QKjb6rRVvSkFxoBcyPBCQyWjZnSYE=;
        b=lKBxdyjushZ+5eg971tfk2uIwBETMu3NrDXozbFHyWCXB5At8VD7ucPRFqLIBZunsz
         m8VpXVYAo8CRUVTcSsaqPf84rMM6G81z6tdjEUf1xbsvUAQR4pKPJm0U41XIK9UbaFxR
         Xc/hMMQ2BKe22GNP3SNK3PJDQ09YBvn5/T0Sgn1D5cZEwNaXD9HImYqcr4BwOhD4wE7R
         32zBUf349CB+OtDLe4HHr7EVHwCYdGcWwYwom8ge4ZIEEWrOhD6iwjM47tUsrBceEGHw
         C3DpV3vxZ77EGR9vEr3PQal9vx/SdL0yjK55oPgXmqPCX/V4j07QviSvXjiY22h6BwYU
         MZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750595; x=1793355395;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3JinBf0Z2jF81QKjb6rRVvSkFxoBcyPBCQyWjZnSYE=;
        b=w50iDvrWxHsSZ7eyAaqMMWeDHVZIeLob/0UK9hfg65DYMZSgrboe5XRxoJJy4mXAGY
         UomZRIUMzBV1wWJdHySV4YjEdWL1mumxAe9k4sshztKPFgxDDhO4ID0LckP4IXkvjMDf
         r/aJr+hFF9QyKXeA3WWkW8aiJNWEE5W1FDprLK9teYT4GSdyuJjAT4vPR7hpHr8hSd1O
         TaMEgiupCqyzgghvfKFY+fzHrLNZecOJShdxSZM95f/V0IRDzKt1XKG75eWhncpF38Tx
         lBEIfKcsqdlAmccsMUbvmTLv0a4JZTF4B0cFL4SC7+lOPn3Ygdx2tfMd30Sexr9uZ4v4
         6OUA==
X-Gm-Message-State: AFq9FYIuOtCQh4ntzJS3cogiOoIMp+pW5WbltPqbeHXF7+3lutZtFoYw
	ahHpKL3gx27bYO+KOjNhbi4VyUKJ3vrmJLKurCCy7K9F9eUGH2awaoE9re1VX8JOS5bf5FuFnOO
	AbA49aMQ23zdZW/t0ozfWxj+cOGo2quI3K51XCLntjEtn8J6eN07161kE2Z9J9yLEqd8kyrlkA4
	i0KqLdZjiTZRkIKpDFlxltDKjO8UGnq2rTs0ThsxOtdgtq2/GIQB2CffU=
X-Received: from ejcog42.prod.google.com ([2002:a17:907:1dea:b0:c31:81f2:c52b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:da2:b0:c2a:ac35:95fb with SMTP id a640c23a62f3a-c468d88a5c0mr676886766b.24.1792750595024;
 Fri, 23 Oct 2026 03:16:35 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:35 +0000
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
Message-ID: <20261023101536.3965344-2-smostafa@google.com>
Subject: [PATCH v2 1/2] dmaengine: qcom: bam_dma: Take a PM ref at remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

bam_dma_remove() calls pm_runtime_dont_use_autosuspend() and
pm_runtime_force_suspend(), which on a BAM with its own clock disables
bam_clk, and only then writes BAM_IRQ_SRCS_MSK_EE and terminates the
channels, touching registers of a block whose clock has just been
removed, causing the board to reset.

Sashiko(Locally) also reports, it then calls clk_disable_unprepare()
on a clock that runtime suspend already disabled, which can trigger
"already disabled" warning in clk_core_disable().

Hold a runtime PM reference across the register accesses and the
channel teardown. Once the hardware is quiet, disable runtime PM with
the device still active and drop the clock exactly once, balancing the
clk_prepare_enable() in probe.

Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f67a93a37d48..8a1f4e5d24d1 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1403,12 +1403,10 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_force_suspend(&pdev->dev);
-
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&bdev->common);
 
+	pm_runtime_get_sync(&pdev->dev);
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
@@ -1428,6 +1426,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	tasklet_kill(&bdev->task);
 
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(bdev->bamclk);
 }
 
-- 
2.56.0.307.g5fe7bd680c-goog

