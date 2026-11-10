Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316640;
	b=DyVIBYrol7nAf0bOjjnGM2Cqy5iJB9+5VUD5xMfyNQS6Xhp+x41IlxL7Cuchg7yRXFgP
	 MmECX3z1r7/kO4rkgKDvkvVi9c/CkLLm26FJr7coAEcbEx0eNMfLquKIWrxOfOQI63+rX
	 Vz4jG+1x6DXwwF9ECmKF/1t0pGOAXmLB83Z34lYz9pwZ98O+LgVfDaPa8TZ6cdQRQ1zlg
	 FL8+5JA1Qy5GJ0+nMUqAikKTUCrqi588ztoAnCxapyTQFm8G1myytfKNruJyI2r+Dgax2
	 zccU58vgb0RK1hhzAZwxgz5eXGGF5Z7dXJMXT1suvx0qqOYtSjqhjiLJ4SLaCiAYD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tzsWFUVnlVTKWO65URSlr8hhMmNwegmKs5HUULFUgi0=;
	b=RSVIrbgKUNLkg9QXk1xKkDTLDZYGtZAictH702eIb+qmACRTlkSbfznT6N/n02q4hTSl
	 khqdg0crlewyAL6OU7UCBAdovXGLCdgiqrIyMLKkX/Nmx+OSpqiJKxGs2SCnVTSkuqZ/f
	 ppv30b/KhvfL/lsn9AjPaYwzzG9lPKeO49/u7oFGeYr1kxdsJ5n76TWxnwzJ+fD/QEAnC
	 mmexZj6KHI/h6JxJhrZIZuvxxrkn6H+LI9Rwo9DHRUww26Nc0ugRtxrOrtdCUaLiNd/nO
	 VaYZANNCMZzaSMtlIZUarQ+8wXoAR6HK5uJ8Nk9sqzR3GycKMfg7ahS6ntZOBNxfr7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ws9P6B0t;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809C606ACE3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4809C606ACE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ws9P6B0t
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so899271a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316640; x=1794921440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzsWFUVnlVTKWO65URSlr8hhMmNwegmKs5HUULFUgi0=;
        b=Ws9P6B0tanhf8knyV2bk0DEpG4Le0vDjqeQLuhrlET9FL01cOu5qLx7s9pWy2EQCEa
         mfBVYdbVdUiUqxTL05Woie3qnXuLqTuvYtBfAaQXvP82LWcdnmKUAqsNEteFkUAy2DSP
         2wHl/+NQndeEBL9Ag/mhD8e/J/uJSf5wVjWFJBDroBbcChGwo/RvLfmKAvyNUc58DRle
         qLAdPdHgPr9K+Xa9oHYTPkIGKkwCV20ThugaMPPmtPUTHPGs5gg6ulZ/htZ6VNFOdG08
         BA7VIlaPS3CBwFBDHVuBl0E/S5n2CLiPE/UKucHwxG7tNm952YD88MmWRDnBNaojqfxh
         I4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316640; x=1794921440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tzsWFUVnlVTKWO65URSlr8hhMmNwegmKs5HUULFUgi0=;
        b=H6yEY7Au9oNH9BsmHAHgwRRgBI3Bn+nDjt/BRUsTT9pKzT4ikJX/fo/Ilm6hbgjMgQ
         94xc8y5fvb/+W/w/iHPUKsk4HfXs9xlo7EGcyIaVTgCPl4W+Ko4VgMLo9rypbzzioknS
         Lj0mmaJTGsF7/9QhNPB6VY3WSBr/8cTrsTPWbG0NrIU9bof8/QAJqtwCmuJerb+r480S
         9BORt2IPwc9Urn3ri0NQ3JWTjEi2+xLAPjM+bxkLrer9V6QGXf6PonOLtGF/iIDpMweD
         dpVAH4C4LPEdDpktz8lj/Zxncjun84u9I4FQVzd8pSHpzViBIl6cizz2H4uVbVWlXQSb
         V0Kw==
X-Forwarded-Encrypted: i=1; AL+hErH/W+27PshcXFm/oweqc/q4xot3YSeaYHvPFqwJehkiz60mJsDfDLgg4nCSdevoanGaEtHWK+7L/5AbtxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ly+4BJxLjqAc1zt+/Pl5iTf949hHc2/BpuB6tRgGCpA19mNdR
	nOaCNMpGNDDv5O6TUseISD0OoWWITdbI+MOzzUa6SL1/BPkXs2WIvPyV
X-Gm-Gg: AYBFou0Sxf923JD8DrtpQxNxjqdN0G3Uk45wimQjbBdeKdtW7i0k8TNZfoTFBf5nVFM
	2HT+r5KLK0UFtgXxGXK5qY2qL3BQAfUnlyMGtlHY2te2RgVC+YaWaVXTGbF6+TLPjvxe+s7HUMf
	/F783uJVLkZcJn/7VF+DuM0rvv95Rt8uNcK+JEWi9JspA9zrOHMmYBwG/ZKL50zF96rL4Pk9TXd
	7mXKhBE/Yf0CJmQn1LFWSJTiP7akiotaJSesNCKBh0NxmdKngdZAcSzI7OsDt/HjOdt1804ETtO
	E0vqS2KrqoZR+KLf7jlnmOOTDN7ll4ivIW+oxYyDuPl2jamJE+F3VItRmmcvRUyNQI7poh5UZdJ
	IEnXNTpY6kJJ6Wkye/hXTsa18cF2Mvly/Sx+pvZMk3lD8QSDi44BzmwQqKdvDjhap+iIubiEOTL
	cdSmKGym0m2q3uNHZZQjk4fGi7zTOJUvqDw0pdQIMPYGLq0I2tPTRceiDnZ31vsCSnwZZn1067s
	KycKxEwtLM76eN4i0HGy9MBsXKzlQou9E9kwy3GnOHRYc9Sjg+Jv0JhyAeEz8C479KfcRkfJWjH
	qPJoCIYbAa9PuFm4rPEPxO16OSKKpnOLJweWt5Nwabl+nS45t03p2g==
X-Received: by 2002:a17:90b:50cc:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b166cdeae7mr2955003a91.11.1794316639647;
        Tue, 10 Nov 2026 05:17:19 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:19 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Logan Gunthorpe <logang@deltatee.com>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 27/33] dmaengine: plx_dma: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:27 -0800
Message-ID: <01b0cd0d2c1c0a5d866fbc2035f940dd59623c0d.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the device tasklet with the per-channel BH helper so completion
callbacks run via dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/plx_dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 409898e92c32..00187327e86a 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -105,7 +105,6 @@ struct plx_dma_dev {
 	struct dma_chan dma_chan;
 	struct pci_dev __rcu *pdev;
 	void __iomem *bar;
-	struct tasklet_struct desc_task;
 
 	spinlock_t ring_lock;
 	bool ring_active;
@@ -241,9 +240,10 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
 	rcu_read_unlock();
 }
 
-static void plx_dma_desc_task(struct tasklet_struct *t)
+static void plx_dma_desc_task(struct dma_chan *chan)
 {
-	struct plx_dma_dev *plxdev = from_tasklet(plxdev, t, desc_task);
+	struct plx_dma_dev *plxdev = container_of(chan, struct plx_dma_dev,
+						  dma_chan);
 
 	plx_dma_process_desc(plxdev);
 }
@@ -366,7 +366,7 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
 		return IRQ_NONE;
 
 	if (status & PLX_REG_INTR_STATUS_DESC_DONE && plxdev->ring_active)
-		tasklet_schedule(&plxdev->desc_task);
+		dmaengine_schedule_bh(&plxdev->dma_chan);
 
 	writew(status, plxdev->bar + PLX_REG_INTR_STATUS);
 
@@ -471,7 +471,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	if (irq > 0)
 		synchronize_irq(irq);
 
-	tasklet_kill(&plxdev->desc_task);
+	dmaengine_kill_bh(&plxdev->dma_chan);
 
 	plx_dma_abort_desc(plxdev);
 
@@ -505,7 +505,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&plxdev->ring_lock);
-	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
+	dmaengine_init_bh(&plxdev->dma_chan, plx_dma_desc_task);
 
 	RCU_INIT_POINTER(plxdev->pdev, pdev);
 	plxdev->bar = pcim_iomap_table(pdev)[0];
-- 
2.43.0

