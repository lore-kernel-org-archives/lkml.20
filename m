Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA008395AE6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791151129; cv=none; b=F4yJcWTxkA8ygvngz6+fBpQwnJA3Xjnn7sxfdoZU/DclK4iJ94DDjlt+7txdQOGraVj1Tf4A4Nfbec0O26T3eDF9lCN1PX0E/OgguVWlqoSrBNBVKkqO6oAPBwCpaCT4NK1lPMlOP+wLgndET7VRur+HZE2tE4QoQEVAFp+s2gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791151129; c=relaxed/simple;
	bh=TifrLpDp7jzI8H9J5GPoqfk4/AG6Qcni0rAiGsSLeJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=srw1cHSE0h2My3/t5UytgVoUJI3g3uF4SOt+1voShpgF+o0hjemRQSA4/CKP1X7VYjDBg8xm0TjOTMhWY0zrbEVPJCVAwUDAWx5llYgqcSSHYiUgCsmvq9oOc6VaDMG6NORY3LyPAA2UT8/n/Ly5jnEEbfK5ceFrJSUeguTnPOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnEHFhlZ; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnEHFhlZ"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c4c92477so574062a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 14:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791151127; x=1791755927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkvJoLK373ln4zs4Nd5alF3ccwEdYezxl+TGr5Jtiqw=;
        b=RnEHFhlZg3xgnCQeFt1pVwu8fSDBnsNIH/GifzWNg5FxzBOuv4VqQ/UJnnZfQEgg5S
         PN8YgnEMS3rmCE7Ez2VtZtZSjGIm9sXKqkyzWBau1XnlCdYiEi1XIL2GjLPBzGHyzJw0
         CemIA++Z/s1zokI8AZOPmqfeShqOiuVGo9jDZEQ3mZkm8yO7OjUDA5m/2Wk4PsoW+AqL
         LEelRc0rAOObV89E9IF8PXWex8+L5MJ9dUMlFZtiD7XCejdHMVX/I+8LoGC1eYWH52ei
         iRX4wY4gSLptnbLDQIZ1Z/0LLFTtxEoO/oIXS0+vHvPNlo3KpkMY/t7utswHx+j2IfpH
         EbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791151127; x=1791755927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkvJoLK373ln4zs4Nd5alF3ccwEdYezxl+TGr5Jtiqw=;
        b=gW2RdibJJjE0N4pDWERAccZGW5w0roiOqA3j1uIhulCT9vPgKEKusybkX2ezko478W
         WMVXm8ejwFcFaXSmwHFsZhfMMcpYtnBerbWB1RMY95SwuwWJf4RKuCh1g/C3yWFrnpOq
         4IIHZiNCmnd9Bjlro0iQRmHHWsbhqT0i5m0Wm9YdwyoL7ipS+/7Rqhad7RptAq3c+3ab
         wZ79ZB+xFh0FALCHfH9idIYgdkomkYXkJzAFo2vkb6bSk+FauXhAnzcYFljbpF2qDkrp
         TAzvumiUFtwIwXG7/KagbPLDbCe07Kgy+hiGdcYWpPUz/opaktMWln5/VWsOwl7DE7YL
         VypQ==
X-Forwarded-Encrypted: i=1; AKwUvByPgj79XL2YFXIVJvwQByzM4wr+cdqkTLsJYImS/KzJSPugxRNTCBiUD9xRdj3mMT2ADxWOV6H+/jrsq18=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoMEEPqsy0ID17xsdIjy1uqRCoZGFLHuUKt75JbrKZk91Vfghs
	UGv2qyCBt1BSp7d/A930zmEJ/8v4liFjahLmRegZWGnilTO9iAPOFBcp
X-Gm-Gg: AYBFou0Ktlub81wTT79XgpNs/AbxLWn/bK2/jUN2rF8rKU72hgkgoqHP4ZcRSD0XwBK
	TpqXr10nQYjrZDyFFGz7Iom7ikg7aOWjIr/GvecSUSOA7zeZXiGiSLU/cyPGoJrQnIiyYqlljEQ
	kVLUT+BjyXv2eBRhVqeotEjrP/xGAPBoOPEcb8Dv8PTJeMvRAjGwoeUa52wGir6hX9zyuGe0cMo
	UD8ApN7rmKm/noqIEESLlMRpLeW1CfHfyBM8U1ps5yGyP0Pnhmf2AjGTmGn0/ErMOBzsXwELZn9
	Uh671hbPa40LVkFuNT6QjZXT/w9s3YAucJU7uugwF28P9NAUaXSghOG3+zLGNNYOgiruzvTAtYQ
	WC7hMZh75UIoVTjwO0eyyRpaNRSS4TCRKFI0pYpBS0u87FyC/mZxswIV/JJcrU6GZrqBIe0o2Wy
	GZM+KfjjegOngOC07GTFjwRyKI8HkemOuO312BcYe4r8sAo2PRMe3bxry1ASK557pu74fRuWgo7
	bwhjb9XUoeXAZQHxCH/1hnH9kuJUtFhoFCfOvIscRktvARD46nJv5yEPNr8A/qMWS/VEnLdIXWz
	EhNnBT1KgKODuHhFwGSdIx0ivaCwjAKXvjv/7n+zUvY0zAUV
X-Received: by 2002:a17:90b:2d4c:b0:3a0:2817:1fcf with SMTP id 98e67ed59e1d1-3a6ce6ca6c8mr7611689a91.11.1791151126977;
        Sun, 04 Oct 2026 14:58:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d661ef5sm8486218a91.5.2026.10.04.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 14:58:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dave Gerlach <d-gerlach@ti.com>,
	Keerthy <j-keerthy@ti.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS)
Subject: [PATCH] rtc: omap: fail rtc-only suspend without a power-off RTC
Date: Sun,  4 Oct 2026 14:58:43 -0700
Message-ID: <20261004215843.396867-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_rtc_power_off_program() dereferences omap_rtc_power_off_rtc
unconditionally, but that pointer is only set when an RTC with the
"system-power-controller" property probed while pm_power_off was still
free, and it is cleared again when that RTC is removed.

pm33xx uses the function for rtc-only suspend whenever off mode is
enabled and an "rtc0" class device exists, which guarantees none of
that. Without the property, with another driver owning pm_power_off,
or with a different RTC registered as rtc0, suspending to mem
dereferences NULL in the cpu_suspend() finisher.

Return -ENODEV when no power-off RTC is set up, and propagate it from
am33xx_rtc_only_idle(). A non-zero return from the finisher makes
cpu_suspend() abort, so pm33xx reports a suspend failure instead of
oopsing.

Fixes: 5a99ae0092fe ("soc: ti: pm33xx: AM437X: Add rtc_only with ddr in self-refresh support")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-omap.c  | 11 +++++++++++
 drivers/soc/ti/pm33xx.c |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 18492165a19f..540232d6f26c 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -407,6 +407,9 @@ static struct omap_rtc *omap_rtc_power_off_rtc;
  * omap_rtc_power_off_program: Set the pmic power off sequence. The RTC
  * generates pmic_pwr_enable control, which can be used to control an external
  * PMIC.
+ *
+ * Return: 0 on success, or -ENODEV if no RTC was registered as the system
+ * power controller.
  */
 int omap_rtc_power_off_program(void)
 {
@@ -416,6 +419,14 @@ int omap_rtc_power_off_program(void)
 	int seconds;
 	u32 val;
 
+	/*
+	 * Only set when an RTC with "system-power-controller" took over
+	 * pm_power_off. pm33xx calls this for rtc-only suspend whenever an
+	 * rtc0 exists, which does not guarantee that.
+	 */
+	if (!rtc)
+		return -ENODEV;
+
 	rtc->type->unlock(rtc);
 	/* enable pmic_power_en control */
 	val = rtc_readl(rtc, OMAP_RTC_PMIC_REG);
diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index 82979122417d..02ebf5a6f4b5 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -174,7 +174,13 @@ static struct wkup_m3_wakeup_src rtc_wake_src(void)
 
 static int am33xx_rtc_only_idle(unsigned long wfi_flags)
 {
-	omap_rtc_power_off_program();
+	int ret;
+
+	/* A non-zero return makes cpu_suspend() abort the suspend. */
+	ret = omap_rtc_power_off_program();
+	if (ret)
+		return ret;
+
 	am33xx_do_wfi_sram(wfi_flags);
 	return 0;
 }
-- 
2.56.0

