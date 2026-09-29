Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D25A53E2E6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711093; cv=none; b=VzuOlRY31xzPD5nPTIJg1Pf4sy01nlzLI6qdreGI7qtGovvCDd54EpTuZXQ0v+uAg5kAoWTXRddBx+BJS3b4cu8gSrCi12l/Q0lBaaGDWb+1Y/HpZV+01kTAEtwgZ7VSWE2u94pcIf8eWPG6L389hFRmFCc+SzdmXlVa5e4AySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711093; c=relaxed/simple;
	bh=hPRoakWCFNkBhMs2RbAhu48KvrLhveA9lMJ+VhoTSvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTa55I39+woVVqitR4HJHPbPT7Cl652+LRt7qDidB7Y0vvFk+Mwb8a/ytqc/FKaYxvFju8yQYDDKiDgDGT4sd6g9b7I5PUuC1nCD/0LNKFzBJgqhwHFfwToRbNDrPTPACdBOjY/ZE71pY4A3wkLel3kDstRba1++EKSaENtYeW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2RrGCuz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2RrGCuz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso43068975e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790711090; x=1791315890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xPmHroPUS9i0jXfxLubKHHis3db3+ArB5MF0c1e2XM=;
        b=W2RrGCuzyiUo486ZWweqmInm0hRPG5G0t6Cg1EgLa+tV+YpF5jOgrIQAsiZ7GdCo8b
         +Z2i5tSLY9pTrw21j+6FI17GnWAa4EIm9tJrMVMZ9Z1vnpzXz611kdDp+6HNIelFY0oo
         TtbeinbHNapMT5yYJfeazHt7UBGQ/V8jmd/pgm6dv3CNe35VTRyYL5plK3MhlvPse4zv
         gMSPjzext4OLWDJPNODcfU0O598DYsWt1MZlx/OqP3qao6hobl0jjIKGtZwTsDJPPdx3
         edZ4Efp1RLcnRufEOYWxzMP9nMT5Txns3bCTDb4ulqmbids+dUcP2vE66WiiNbb96QIa
         D7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790711090; x=1791315890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xPmHroPUS9i0jXfxLubKHHis3db3+ArB5MF0c1e2XM=;
        b=VTnXNstT1etoc2lXlHTJeSn7FSAwcsW7us2rGLBQGBqwY/hZgmDph6TRd9Tfazq/7K
         98YdSH3NvMEf72ggpDG7ZAl8VyFSIqFn+uVXi9wTPvTL+fXZ9Wu37kemWlWV92SFabOe
         1W1bf5dSHdMheKVfhp+QIIzg92xSsIIWzSyVFcnGJTe8OEUZVmy3aegNECSGG91pyIjv
         lnbGigmoY4nWgrcuzHsNwfq8pLGHkKMDrJk2ZVZFQ1l1+c4o/fqB/Y/buHxarvHh3Lgw
         bqxuAvHk63YV/i6ed7s97jiO75iQbMB3/QOiwOCp6QBPqOSepaIFKwIqPsFWqgQmASNQ
         5D3g==
X-Gm-Message-State: AFuF++mpOXFZX3AB7hmepel6FnqwXDeYQ+dIDfvFgf57otVcgZlLZw49
	gS1UCXA0VXo7+bVs9Ui5aw4sNAmwvMbru7XxYx6wdrV7Kj3Q7oj27Izl2NX0/hscsI4=
X-Gm-Gg: AYBFou2OjzIDn2skcojwxqnPXbwwTGBuZiY7+AmnWPH4KZwR08QoO3FqmGgSHydB+v9
	0XZ8q33fl3EJI6fiGBfl4J8ddonT2eGZhLSZDq6aKUa7hSktqZjXvlpheJSv86wIMK9OAnvh8vh
	BL3Im+jtmVgIMfrvRR4gHwKem/PEZyTdM6f/dBOBdraWigXTgsDRVUQASmcKdTNZ+XdPvnogblI
	kxpP+OmU+QAh7R/qON1VBcGeisRDoqWueL0bv7uFUCuI50el7YWlRa4hv2T5JPethfilqh7Csm/
	1Za7a9hFk8GUiB6SU5IWVZqcaVxwNzm5l82wAb7oXwjE1wNQczvpg2siouiMjwUeW8LDHFhOmPs
	iG98eK0fTbiWeXMt5mKx6FWTZis61JBUBO5oRhB7AmsCtIBMsIItAoEQEHpZctyY99LzvrU1Cxu
	7VTqOtverhqtjkqIByNRKY9S39G44PqN2fwfgE/mAxczI5feO2961jhwy0E3RBFakU8XJsEGvVe
	PpU+F6RtnQATmjpUmIy7KF9
X-Received: by 2002:a05:600c:1546:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-4a014fd1e9cmr2899905e9.3.1790711089450;
        Tue, 29 Sep 2026 12:44:49 -0700 (PDT)
Received: from localhost.localdomain ([82.142.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014895428sm5265825e9.0.2026.09.29.12.44.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 12:44:48 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: Markus.Elfring@web.de,
	dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jonathanh@nvidia.com,
	ldewangan@nvidia.com,
	vkoul@kernel.org
Subject: [PATCH v2] dmaengine: tegra186-gpc-dma: Read channel state under the lock
Date: Tue, 29 Sep 2026 21:44:34 +0200
Message-ID: <20260929194434.29937-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260922072233.19592-1-ginger.jzllee@gmail.com>
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
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

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v2:
 - Fixes: expanded to 12 hex digits.
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

