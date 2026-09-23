Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625524399FB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142026; cv=none; b=PYZipcuaA+ajpMRseDlXdYOPMnN0o0frUixR6PQc849PMI+yM3AKBBefU6boqCExnBqiJp43TWbt6KH1zGnCjYM45J4pXUDmiAI8l+E9WR2Lmi3mOq2TuDYCNObIiB2UIwwerO0jejQOOycSrwULpzKOxRTqHqT55BayRgT9s3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142026; c=relaxed/simple;
	bh=s3xFOpyusB+gbcdNu45N3zv7siv6m0mWV55Nz23kMrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ox9Yf3FPGb6ShMaZ2IeIqKXLKZaTsNu0yctnF4ODW5N4z6b+8HjoiUDyh7OGwoIUFLGRtQA/h1dG85Tiog7PtQIZWkIcoE5JiSb27yjXmcTvWGDPMCfM0ja8HsqWZtnD/epqPfDX8WMLSyH7f5aN49Hz2kgh++923BqLINGxviU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReiNCX2W; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReiNCX2W"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bd580489dso64074785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142023; x=1790746823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4t2QKwvgTvrUqgLrxmE0i6NBCj41D7R9VJyZdg6puRQ=;
        b=ReiNCX2Wknwb02PTP7CnNJBfhVDaCcNxdzWqxlhROjyjnu01WsOs1zUtP1ueFYT1IE
         tnjog2Vidu6pzfnZ7R/OH+4qvPC/RTm0ZXm1ipiaVDIgbaQI2D39gGtsR2MmaVmNMtVQ
         syxLvMdXdSHTAOg9KlPedGRBqPX9slpmdcra/4fy99zR8ZGKQ84dXjv88B+AmBKLgG01
         Olu0e5dEFXJjVHWt63+jURAbOWmRhWtzyXP6r+RuZBKTvFv+mB5NpLsjMbhLUUGxymKF
         IX48R3i7EnAcBdy0gI2A9+2XY1oxJmLT8x50Ca4PD041csmSKYlZZtRRKSYwZK/gCNX0
         LAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142023; x=1790746823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4t2QKwvgTvrUqgLrxmE0i6NBCj41D7R9VJyZdg6puRQ=;
        b=nL6Ch4KOLh4OpO1RD2timg1148hyBJw/tiISQ6yp201ZjujhV+7o9vv5QOpTqoslIT
         lZoNHEgDCgiFOgNgBTu916Tjjnrv4PVsyvRGxprh5ECMuKImkLhTHF31cFiussCoeVF8
         DpxSSfvP789d1sZWgJKbZzwbCJhVGKslWGrM78hhADZ5HKrGCKtVTA8VpCnq92lOn5SA
         4VWZ10uNvoALALB+SWqijnc8hOcKBz/QKfTq8QymtTa2DNXAUQog1eZOgAaCJbP8qjD2
         aCnNmU1uwWlrBRTlT+Yo+UwmcHpcaiv+vRfWJLfjQRbHhJcvnejgckWBpyxGoL4wDcXM
         HZ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzphLdA+tQ4MoZg9KDAqqg/8QN72PDcWG3RA3ilVYd/Mt92uEYCDpwbkX8ZujA4PWjNNUWkBc5lfJTeZdc=@vger.kernel.org
X-Gm-Message-State: AFuF++mA9vyBUvGKHKhOpT21fqw3GtapSzUbsV3PfG9DH/M2KXwsugch
	9vXrYZDgqTkE6tvRQgBqS7h9hVi0lfdLQ66BBZNLKAg3lDbiz2HgbDU=
X-Gm-Gg: AYBFou2pNS0L/zJyOW37C76ET6nfY83R4cEwQ8uYLeQaHxrrAKfxCiHK6+HCyNs8ZMj
	RyE++xR2WeZt93gcwtoDK1brQZWazl0T/23q4biT0Sk7cEem6Sf1Q22V8VruslEgFQ+VTteF3JW
	Mku+nq3QSk0NBfUwANbq9UjN5FE6V8X31Yx1PJmeCWjAMoJSCmY/sH71bQR9fK2PUVEkpVFjnuA
	xD+dDSpq+eahXWncvLkpY5SKpLuQIdYo4fS+M8N4dn7ecgUnOs+aUA6BSpg4TgWDJEsSJfo5nUn
	p8ZISwRIb2Gyt8odp59MeY4V39xn5FdLw5G2eFPnU+1BQo13nTAGjFdg7alYBfnnhyWICf+cHnK
	gj2l3/MKk6Aat5afthzgI0N0ODn9UFNwxdv4ZkEkz6bpSiHItQf3tX2cPnpQwFg8ytSfzR01tcE
	ZmdL/g4OjSHJW1P/qQ8MKpDmRdhJKp1/0Nbm8RCNoHzcUqhF4KMGyn/qIaQPr5AJRcNxcNjXnYI
	j18U8E3cRHEyHfNs5RmMrFR5pOp3tKQ0K1PBMLpniE8mr2oggttbHxKyqWqI7GPeFo+lcfQs/iq
	pw2rfeo+dkVjB9tq46j8Y9+gZuVN44f4Lo+WDkcjuufspPQVtsEqMVT81XwvuTzupo4LjWe1YRh
	/iQ==
X-Received: by 2002:a05:620a:6409:b0:939:1483:55c with SMTP id af79cd13be357-93c25118d3fmr276086185a.19.1790142023287;
        Tue, 22 Sep 2026 22:40:23 -0700 (PDT)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c277636e4sm88496685a.41.2026.09.22.22.40.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 22:40:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: fsl_xcvr: free IRQ before canceling reset work
Date: Wed, 23 Sep 2026 01:40:17 -0400
Message-ID: <20260923054017.93553-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq0_isr() schedules work_rst on a preamble error, and reset_rx_work()
touches regmap.  remove() cancels that work while the IRQ is still
registered, so the handler can queue it again during teardown.  The IRQ
is also requested before INIT_WORK() and spin_lock_init().  Probe
failure does not call remove(), so freeing the IRQ leaves queued work
running, and an earlier interrupt schedules uninitialized work.

Initialize the lock and devm_work_autocancel() before the IRQ.  Failed
probe then frees the IRQ and cancels the work.  Unbind frees the IRQ
before cancel_work_sync() and pm_runtime_disable().

Fixes: 1e5d0f106164 ("ASoC: fsl_xcvr: reset RX dpath after wrong preamble")
Cc: stable@vger.kernel.org # 6.13+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 sound/soc/fsl/fsl_xcvr.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 9828272..29929df 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitrev.h>
 #include <linux/clk.h>
+#include <linux/devm-helpers.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -57,6 +58,7 @@ struct fsl_xcvr {
 	struct snd_aes_iec958 tx_iec958;
 	u8 cap_ds[FSL_XCVR_CAPDS_SIZE];
 	struct work_struct work_rst;
+	int irq;
 	spinlock_t lock; /* Protect hw_reset and trigger */
 	struct snd_pcm_hw_constraint_list spdif_constr_rates;
 	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
@@ -1617,7 +1619,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	struct fsl_xcvr *xcvr;
 	struct resource *rx_res, *tx_res;
 	void __iomem *regs;
-	int ret, irq;
+	int ret;
 
 	xcvr = devm_kzalloc(dev, sizeof(*xcvr), GFP_KERNEL);
 	if (!xcvr)
@@ -1705,12 +1707,22 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(xcvr->reset),
 				     "failed to get XCVR reset control\n");
 
+	/*
+	 * irq0_isr() schedules work_rst. Prepare the work and its lock
+	 * before the IRQ, and register the cancel action first so a failed
+	 * probe frees the IRQ and then cancels any queued work.
+	 */
+	spin_lock_init(&xcvr->lock);
+	ret = devm_work_autocancel(dev, &xcvr->work_rst, reset_rx_work);
+	if (ret)
+		return ret;
+
 	/* get IRQs */
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	xcvr->irq = platform_get_irq(pdev, 0);
+	if (xcvr->irq < 0)
+		return xcvr->irq;
 
-	ret = devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr);
+	ret = devm_request_irq(dev, xcvr->irq, irq0_isr, 0, pdev->name, xcvr);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to claim IRQ0\n");
 
@@ -1751,8 +1763,6 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 			fsl_xcvr_comp.name);
 	}
 
-	INIT_WORK(&xcvr->work_rst, reset_rx_work);
-	spin_lock_init(&xcvr->lock);
 	return ret;
 }
 
@@ -1760,6 +1770,8 @@ static void fsl_xcvr_remove(struct platform_device *pdev)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(&pdev->dev);
 
+	/* Free the IRQ first so irq0_isr() cannot requeue work_rst. */
+	devm_free_irq(&pdev->dev, xcvr->irq, xcvr);
 	cancel_work_sync(&xcvr->work_rst);
 	pm_runtime_disable(&pdev->dev);
 }
