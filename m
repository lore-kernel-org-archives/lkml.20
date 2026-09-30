Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440B45D1A5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752764; cv=none; b=k8FTnmXHUD6CnkL/SPLb9jRwSqRiBfD2yMQV4BUwjPZ0Lg1N8X0yvpY6KoAs4c65nyDqo9FlE/94RJEiIPR2o/NmrEVrG94OuYGwbycb8XwzzHcXQfOUcvxaaKAOdbf5NuTnvuXL4/7jxmPKb8vrrDBnGNGsj4XMUtpJLtfZWKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752764; c=relaxed/simple;
	bh=mY+zgtJj+iTIDRlZKQWXzIByvsvSdOL6GtCpfqvuq+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utj18iAxYEnohqdoyYVDPu/WS3/8jjDMCQXEgXXbqtVdV8AjfZ+SOVVEuSw9YK266xNGEL/llcK6oIQ4ykxdR446XcJD0FMUY2r3PL1Rb3rF4hB+RN/BU7NPx0W4AAGt+mAKRfJZUJeCdTws5hoK1JjXYU2xeWq0uWg+BdEKEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orsBWHRE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orsBWHRE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so31648725e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752760; x=1791357560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrvN1TB14dIbJUQBdXmdGtNzr7nTUfaMcgDWbjg2fl0=;
        b=orsBWHREYDl85J2M/4coytJnvmohLwrxJtFC/wvROI+eW6tcNtJLCEn1CqnqGzn5j3
         5gHwCVe4mrW2+qP+bphE2B1cBWRyGlIBexlPozHSQ+V9JgbJJEjFInRPrf5F5bqDLXOo
         pz3FWfXpA9ZmBwk94HwFqeNgKs8J8007DkOaxphRlxqzBrlqEKMBWBKDZBzWCxo+Ucrh
         jEszXtBch/b0tVLNQQ3H8oxirOnCg3Vp24yZkDKcoTFnCmCRHYQrh57HRbUsoE9P3y+H
         0ErNPio6PtGtmnu3x7zopoD1d+adeZhuge+iPS9GuNdubjOdq9WW592wovxSBvzbc4pk
         iZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752760; x=1791357560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrvN1TB14dIbJUQBdXmdGtNzr7nTUfaMcgDWbjg2fl0=;
        b=xSP6Q8Y3fJrLUcs+j76pcsVXEAVnZ7ueIbogUZX2XoApbChiBA11X8u11jEY+ZUs9M
         4t59Y59OHZrfdlXIMxiVNkKSi/Jey79Pic6rrKLZE7c7pArJr0ugqHkwttclLRGjggPV
         5+W23yMcOmYUtrXVj+nLra1ncbnqWPDUqyJx7/qA1XiUlA1W7KJhkkyNFMpIrkUSvT+r
         kmkjmaS2LRSbPXPmibGmxZvE6ga1bBuk6ORMoIuxfGHvycmne5GNQubpfnyWNLVY12pM
         xzBnmOxN+Ei09yYDl4fi5qIK8qyO1NfY2rq7hPS4ZAspnAl10FeAJXjogrSjwVolhs9R
         +O/Q==
X-Gm-Message-State: AFuF++lHqNaMRjuPW1bpKuDi2yRE3DWQTO2kFXVpEWL35O8AbJPlD6Bh
	9STrV4F2PaoM0RXur52T0SD96TjOVQzw51sn5UWajP76elYNJSBRplp4
X-Gm-Gg: AYBFou24rn6+dhNZbnm2uRr1aFN/I3xw+5LI22ILP07Mfe7Z74IZXCYbSPKQ8y+8N7N
	++doaQ264tUUCOAXOV6akwc4BTPCHeN7AoEOcYmSdkFg/16V76WcyREi4i4xM9Ix33IANAGJWuh
	/9pG792mMmLgfvF1sO3UEfVf/WjiE5VhRsC9QMQyH9fSitf+WXens7z7fin1MqzBsZRyyC8sFLu
	pHjJixfn9A16I6kV1kMoM3sDbr4Yj6bRXvg3MxpYySELpLJVOSFXvSEtcs3c2NqcIqGrNxfYmrU
	1esW2qrhDEPNqWuoir+yb6PW+jYfE+PHgrFORXCOI0X4qhDicqYi3M2vpwu08YyRoglb6PbQUkD
	LmzJQBREhtteT/xTopR1UiYNmjXTlwlQMqRCKJHx/XYD6r/Y3LFOzrOh43a4+MaJwmC0rLLLH/P
	bMVZ7aplWjfVrGBzub8mfwbEmQolXaAbxMhGykNVzAx/Y30P5yq5qNzISMVGNUDU4WzIMTaoyf8
	JJ20baQxlO++q1K7E8+n4RZFHqM7w==
X-Received: by 2002:a05:600c:6206:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a01b016f12mr6850545e9.15.1790752760130;
        Wed, 30 Sep 2026 00:19:20 -0700 (PDT)
Received: from localhost.localdomain ([38.71.42.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm10644255e9.2.2026.09.30.00.19.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 00:19:19 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: Markus.Elfring@web.de,
	dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jonathanh@nvidia.com,
	ldewangan@nvidia.com,
	vkoul@kernel.org
Subject: [PATCH v3] dmaengine: tegra186-gpc-dma: Read channel state under the lock
Date: Wed, 30 Sep 2026 09:19:16 +0200
Message-ID: <20260930071916.35722-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260929194434.29937-1-ginger.jzllee@gmail.com>
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My static analyzer detected a potential issue in the dmag engine.
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

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v3:
 - Acknowledge the usage of static analysis in detecting this problem.
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

