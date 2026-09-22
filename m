Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44274F85AC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061768; cv=none; b=K2ywgE8kCLGIrbn78i4ppm1XfxbLJ0cTy/tV8yyclCu3AWabp3nv/sUT9SA2H9Vlnh4bCOlUIi4SfRjowTsy4Rur27gsY+DF45rtvUXUS9EgcYJU0PYFH6ibXj86a2no6s/9VZoSnycPKFBazA/7W1JU+2fl5I4h90TI3PCeU10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061768; c=relaxed/simple;
	bh=40KTFaOhOR4XVyPXvsqIHuRMnZah7jhj6hPfzoMJXEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xf1zpT2wDIImi+98DQC0NvC5CE6JHTDuGuAYCiYMiomFpqMRJFyQ9FGc1jQQBPdBNyRiSC5KSzrqonshJEStyYrVJ+82gUNVmzGC5gmoCeddkI9XYb1ASq3yqKIqtjqZuC7emmJqQkcgcj0a01/f4Oiz3ov0jdB4xPPhs7bDXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deOKtKe2; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deOKtKe2"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so34213385ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061766; x=1790666566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqRdsoSwZuMFprPz4Ho4sF3JUn0Ps5OUJkmXS6wpmHg=;
        b=deOKtKe2IVbb3OSLqVuOXpITb8Q/YCFXj8+XlsXLIX+oyESUOeOczT/gJ3q85CRIB5
         ZwLE3rAARMpfCQfKJBMS6nN3r4PDJxjhaz67wtjznXdfmFf6lAlSqd7RXpu9+xjejzGz
         ZRzhWM76wcNMAQ4fkEOAQCvlLCg6jO6oD83NdgGtBlDCDvjLtNShUFo4gwOg6yEuhviC
         V0aH0CHVHqLO8y9PLNvbl/DBuINSqN8+dsTEFn7SFkTX+bBmV3rZfPbTnfkuPxN7lpbD
         fx1bkJpDzwjkv8cnJa5aagZIEFTjBGzzf5HslQ612PemJ1ozEzyaQsHpDVxLINh/sEFi
         YtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061766; x=1790666566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqRdsoSwZuMFprPz4Ho4sF3JUn0Ps5OUJkmXS6wpmHg=;
        b=WWKGma7CHMbPjUFsrHr/46j9yVqcELaMa92c06+vgTH1eQKDTdNWwo0gCAm8+RQ6mP
         3CJ1FCF85sLhZyizskXytP5ycA1ReNuOsdZfjtJt2876qm0lZ7zm8QEgUuTKmssDSAi3
         IvZMxKyRof8+mhMkGCGKe4egbCvudVCDGFc/ckXGhOJSWv2kzmtPKGjt8B7+Q5sXt1Bv
         YguJbeuWjt9ebC/iogFer6pBUndrI7Fqdtp8BmL/ZsLGgxv2IYI5m40K1yzwG6W+/wu9
         ZgbUf9MYilm6h2ZUOaIAiePl4XT3NZK9jILLJ1QnAfj5VrhDOLNUq17NtcGY7y/xKkDo
         b73g==
X-Forwarded-Encrypted: i=1; AKwUvBy9p8elLdIxQM5kqPMo/aqdYAo6u903W8blZ5EJbC3HUnrTxsh23RFhk6BrCdLUx8LAZYqDRgCQcPR/t/k=@vger.kernel.org
X-Gm-Message-State: AFuF++l0dwRnp5urhi3nDi/i7KfGJNiNC3RLZItrwa0gGXPzRJaSQUNb
	e+WkTYWneGtAhj/t9Dn3qZW9Qw/ihcf9DikFg/IkXa/oc1HuDk0Vb29I
X-Gm-Gg: AYBFou2ni1dAZsBZqu5qtu/ueYWufh4C9qsFdcTmTKEtnleA3JQWhyUhtcQ5ZIozOdV
	QzZwz1GwEw/6o0k+ZOWRF6BoWB+n30BOFDtzfNETU2tM0beis0Q6kLShRQvO/Cfu3z/a7ZsqvSK
	KH48Ua7uSIHkGsMqTvbFyQKrb6QeaqQ7DF8txBMzy5EeghGfkK0LZNt2iQ6J3b0YZRYPMH7BsDL
	2aHn54EMxtZzpLcqBfs/khDH6UV3Gz74RvF1TkYC1FT1tkUEuhlFKVBib5/oSXk5G7lwsC7X8Ar
	l5EFOlFdueDHy9DJlCHiMRRf9nKF6KqV6bIIOToA2BVQ8P1X5BW5rptEriLqOjqTw1QP1a/eRbQ
	XfUg6r4BRV+dlQPiajh4rIYFycxOiu+ugvomyEog9o655ElUFlp+iZCiLXLdGKzde53InrDXUVg
	yt3nq4/SP/5DAGkQx1t5ksRMkY+/uTq1vVwjQ9VXOUSL9pEWSgLK5GFhTJhI7b/Gvh49BxtfERT
	JiEt8F8ooTyPeV+b3elICicJgXCkC35cYDBMvPT6WnZtTZsbOEaonP+qqT1QDO3kYE=
X-Received: by 2002:a17:90b:4c81:b0:39e:6c69:34dd with SMTP id 98e67ed59e1d1-3a07334d199mr238687a91.65.1790061765828;
        Tue, 22 Sep 2026 00:22:45 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06dfd6705sm1851848a91.0.2026.09.22.00.22.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 00:22:45 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: ldewangan@nvidia.com,
	jonathanh@nvidia.com,
	vkoul@kernel.org
Cc: dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: tegra186-gpc-dma: Read channel state under the lock
Date: Tue, 22 Sep 2026 15:22:33 +0800
Message-ID: <20260922072233.19592-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_dma_tx_status() reads tdc->status before taking tdc->vc.lock, and
tegra_dma_isr() snapshots tdc->dma_desc before taking the same lock.  All
writers of these fields (tegra_dma_start(), tegra_dma_xfer_complete(),
tegra_dma_pause(), tegra_dma_resume() and tegra_dma_terminate_all()) update
them under tdc->vc.lock.

The unlocked read in tegra_dma_tx_status() can therefore report DMA_PAUSED
for a transfer that has already completed, and the unlocked read in
tegra_dma_isr() can pick up a tdc->dma_desc which is being cleared
concurrently, in which case the handler keeps using a stale descriptor
pointer.

Read both fields while holding tdc->vc.lock.

Fixes: ee17028 ("dmaengine: tegra: Add tegra gpcdma driver")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/tegra186-gpc-dma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -606,7 +606,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id
 static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 {
 	struct tegra_dma_channel *tdc = dev_id;
-	struct tegra_dma_desc *dma_desc = tdc->dma_desc;
+	struct tegra_dma_desc *dma_desc;
 	struct tegra_dma_sg_req *sg_req;
 	u32 status;
 
@@ -619,6 +619,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id
 	}
 
 	spin_lock(&tdc->vc.lock);
+	dma_desc = tdc->dma_desc;
 	status = tdc_read(tdc, tdc->regs->status);
 	if (!(status & TEGRA_GPCDMA_STATUS_ISE_EOC))
 		goto irq_done;
@@ -786,10 +787,10 @@ static enum dma_status tegra_dma_tx_status(struct dma_
 	if (ret == DMA_COMPLETE)
 		return ret;
 
+	spin_lock_irqsave(&tdc->vc.lock, flags);
 	if (tdc->status == DMA_PAUSED)
 		ret = DMA_PAUSED;
 
-	spin_lock_irqsave(&tdc->vc.lock, flags);
 	vd = vchan_find_desc(&tdc->vc, cookie);
 	if (vd) {
 		dma_desc = vd_to_tegra_dma_desc(vd);
-- 
2.43.0

