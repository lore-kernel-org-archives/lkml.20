Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515068;
	b=eOHt8zfEd2staeOoHum6cc/yFt58/6ylWz4g7grzxNCTpZdgRkq4YB1/FqNWP4vxIag+
	 wYM2zkhpRQ7Qpg25A2vB3XN8wI3+33BUYBNbqJpN/DoxETWedk0Ean9OYsMHZTzOYqZqv
	 KvPO1kbSdTGkDmswM7qxvmA2tQNGbwIpveFrgtenBdH2Illug3oBGwaUiW3Un9cQgtz2c
	 tkVsI6B9AXYa/EYQPs4OyHIttXdoRyk6mNL0rYSvLn8/kwus5QyPbrFYpGu8odEq+usOa
	 s/cg2I/oNqYNZoVGWqh7p6gzv6uJJkW5DXhZfWBRCqpqXQD9yocgCGVFZEd2pUCgCxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jk+Iv7E50Op3JEPwALwZ9u6FV2ftF6XFRcZ7NgdVWFo=;
	b=rGANXkvxdWdm4e8vDk6Oi4FMcvSZuTBk5WwLZrzevGxAslTcrsreY5h4eXKwci7IeJr3
	 VKN3Ok706uHVr9slz63xOSRI/sSDweeuuvi5MChTQzAbaZZWxqvtkRqdnG4uVuGQrTEBh
	 RRl12ymt5ivuO++OQWPjTTta1XsSXaiqyVriXP9GOxZF/mFRxe5XGTiWgL7AGxaGrE9Fl
	 kyzSHNfnG0XHIDaYbXYN+g6xBg6YuSdVHZUukr0UnLkjlsiwJW1oSNAusSez67XFd/vMD
	 3QD+MXv1zDkkHKdUueaIwp5iP0fVPDovGKAnL7gbvo5vVQRXy5elk3dZv2SiCCRQm9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhQPQbUU;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7ED606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhQPQbUU
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso941742a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793515067; x=1794119867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jk+Iv7E50Op3JEPwALwZ9u6FV2ftF6XFRcZ7NgdVWFo=;
        b=zhQPQbUUhCYQFoTxvL8ZHBMO96oNrXROIr4p5ptS2/BMhHSy7+unGTDNoxZL7y+CpH
         aCUMkZFs7uwjg0LU+wIt3SSdjhm8qYaGqv0zLKFbrJGofDnBPFWyhuMUxc0FQUF3kuml
         xj8Sj1Fh6y/iEh2p+nPAHb3FwgaGz2tn28dSbOa6vpG5PO87zXCa49pBhgmZlCtPpA4f
         yrSliOz1yG+L5b7v1F4hCkn9eb266rcddg6ryjPhDkvjodoODsQXtNEVyHG9aOsVAXP7
         5a5VVJXFl5HRFanN5VzsV2jvfh1v7uJ4zF5DXFuGhUhpr9LjSxdNx5ALv+7TNOazvy4V
         ZX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793515067; x=1794119867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jk+Iv7E50Op3JEPwALwZ9u6FV2ftF6XFRcZ7NgdVWFo=;
        b=Alker4qA+DCE3u2B7FY5YfBNxuLbpyF5PKic7E5u/C7kV+4CuHP1elykhdydtuIOqo
         Qytc3RL38pkPP5AKLlz8FCNRNVduBXgnZiqmVLH7C+GlwiZm1ZBN2HL76bhlqKFmjhic
         ssbPCXyvALNn6TQaiwI57DibkggFNDAhmal3L0VE4rVZ/RVqynCj4qxv0SJ/Ui3XMBdJ
         Zr1cz0IfyEr774jQppNiYZdNlz2EbBjO2YqaiHzz8eEd72OIC2IEJJyRNEpyDQHFFUqO
         grSAzZ2B3ICnacgJqGljNKBDXi6radf4qlOMP8is24tekHdyNS2cXL3GYmLawKxjj9bL
         imxQ==
X-Forwarded-Encrypted: i=1; AKwUvByyCpecv/19HiIg/GDMnprFus+nTGaQ/nPtJRylIqf2CTAYPGSXUoJkc43qfpOCCaMZislpzUiv2wftIYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e7CaVjEJZTOFtam41U2uPZoQh8p+Rz2lTDF0pAVE+GmrAXOQv
	vQYr/Q/qhRf7MuJnw2wDfiyyMpXxJdtDcchDNO8jHaVhB9cC6SbjSUsH
X-Gm-Gg: AYBFou1nqmMNNjLNw6IfIm0pRoR1VCRUo8OnMjSccHlCwCpmHWZcd73S44ytgSDsQJX
	u7G/eziWltF3IihEU25RWr3CviCdQb1QIRp90KpcWwUVkICO+5zpVlWbCEDYQ5Mz9HydXrVSIVD
	R4csvN87GJD2d30Sd6RZkBG72YAs6MalZGXqdb/BiS9hNFY0hiLkctaoBsCwdzpJk67zjtt471M
	FG/wGOhX7aHAu6gdve/2l9k2fYrMNh/FTzJiogJ5oN6bV5Y04CCN4m+XEWS6Dv8H9p0r0MM8YIs
	XQIOOnSodhKPHThz5mitugr73nDcFeBrN05igZdpRjHKfe7xVB0if7tn65pPhpgiHZVtEf5w3Xz
	3fg0RbU2kcFsAg8LRjwYdgmtZL9iUrCLpfEMdiZCsZ1cHaH2xtbpQFsPD+dLdcemcOfU586Xbha
	5//o36TmC0HBPQBVgSEzQA4h1BxIIELI/oTW5OTC9DtJjD9rsNPDIicy5NclLHuxOq8sUg9eEfw
	vSgElvIgEK59CaKSzEAxwjQckS8KGgBAHWR8Yzh4m4jRrUnM2o+RWx/QPUsxRYHizOjBBUurgPS
	UPJ9RuWHA92n2uKSb5P2FccTD+0vXsD54E/X+Dipz0aScaH9z/5NlghcPZuT1eavHSMt
X-Received: by 2002:a17:90b:5807:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3ae8981dd4dmr5417304a91.54.1793515066743;
        Sat, 31 Oct 2026 23:37:46 -0700 (PDT)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm14120742a91.0.2026.10.31.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 23:37:46 -0700 (PDT)
From: BeaCox <0xbeac@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH] mmc: tmio: disable dma_issue work before releasing DMA
Date: Sun,  1 Nov 2026 14:37:39 +0800
Message-ID: <20261101063739.89331-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
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

tmio_mmc_host_remove() drains done and delayed_reset_work, but leaves
dma_issue pending or running when it releases the DMA resources. Its
backend callback accesses the host, controller registers and DMA state.

Disable dma_issue synchronously before releasing DMA. This also rejects
late queue attempts from an interrupt handler that is still running;
cancel_work_sync() alone does not provide that guarantee.

Some DMA backends fall back to PIO before initializing dma_issue. Move
their work initialization ahead of the fallible setup so the work is
always initialized when a DMA backend is present. Skip the disable call
when no DMA backend is configured.

The analysis, patch and validation were assisted by OpenAI Codex.

Fixes: 85683fb39d9b ("mmc: sdhi: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
Testing: x86_64 COMPILE_TEST object builds with gcc 13.3 and W=1 for
tmio_mmc_core, renesas_sdhi_core, both Renesas DMA backends and
uniphier-sd. A userspace model of the extracted remove function checks
the no-DMA case and modeled late queue attempts before DMA release.
It does not simulate real IRQ/DMA concurrency or backend hardware.

No matching hardware, kernel crash trace or demonstrated unprivileged
trigger is available. Please review DMA-to-PIO fallback, probe failure
and teardown on Renesas and UniPhier. The initialization changes cover
backends that can return before setting up DMA. Other work items and
the wider IRQ teardown remain outside this patch.

 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
 drivers/mmc/host/tmio_mmc_core.c         | 2 ++
 drivers/mmc/host/uniphier-sd.c           | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 426308b73b..45e34d57ab 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -340,6 +340,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
+	INIT_WORK(&host->dma_issue, renesas_sdhi_sys_dmac_issue_work_fn);
+
 	/* We can only either use DMA for both Tx and Rx or not use it at all */
 	if (!host->pdev->dev.of_node &&
 	    (!pdata->chan_priv_tx || !pdata->chan_priv_rx))
@@ -402,8 +404,6 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 			goto ebouncebuf;
 
 		init_completion(&priv->dma_priv.dma_dataend);
-		INIT_WORK(&host->dma_issue,
-			  renesas_sdhi_sys_dmac_issue_work_fn);
 	}
 
 	renesas_sdhi_sys_dmac_enable_dma(host, true);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 775e0d9353..d0d3dd05a0 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1272,6 +1272,8 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
 	dev_pm_qos_hide_latency_limit(&pdev->dev);
 
 	mmc_remove_host(mmc);
+	if (host->dma_ops)
+		disable_work_sync(&host->dma_issue);
 	cancel_work_sync(&host->done);
 	cancel_delayed_work_sync(&host->delayed_reset_work);
 	tmio_mmc_release_dma(host);
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 1eae2f4b6c..cd0fdffa30 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -187,6 +187,8 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	struct uniphier_sd_priv *priv = uniphier_sd_priv(host);
 	struct dma_chan *chan;
 
+	INIT_WORK(&host->dma_issue, uniphier_sd_external_dma_issue);
+
 	chan = dma_request_chan(mmc_dev(host->mmc), "rx-tx");
 	if (IS_ERR(chan)) {
 		dev_warn(mmc_dev(host->mmc),
@@ -198,8 +200,6 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	priv->chan = chan;
 	host->chan_rx = chan;
 	host->chan_tx = chan;
-
-	INIT_WORK(&host->dma_issue, uniphier_sd_external_dma_issue);
 }
 
 static void uniphier_sd_external_dma_release(struct tmio_mmc_host *host)

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0

