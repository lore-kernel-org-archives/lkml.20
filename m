Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523834BD781
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844218; cv=none; b=NGZn4TybH7LcA9s3pTlzVRsCV2ZyjA266UAsZwujwImDSrFr046pBiHmDZhpdXyTj5otZrYLgiqcuZudNcUKLITz27asngygBDXLKoc+/HXPj96c6XrSIuKmlfHF+0Q7Ma/gOb3QJl0occJwj2ZAkHSjds7iGAZ1wpMV9t0l+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844218; c=relaxed/simple;
	bh=05hckqbzWrSWg6nAu4ayXZJ0SnccK6eIRIGmfGXur/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jhUO1gT5B/cJfMyHVEo8q78+yB67/XfhMSJ0+gkohTqJaJkbBE9f9w1S/3cJN2ktt42hyejvMiBhIPjG4b3JcmP6SAVWd/jQlgMpRDMsF1PmYZkfGtG/5L9QVhvLK7KtCJkK0P5wV6xNiNp1yfvwgmOfqIAqR77JH3u884ai7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=pbwkf557; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="pbwkf557"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso17500505e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790844213; x=1791449013; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4dA/c3M5G0xH9p5gUF/XWZZJAKjMX6RGI0WkDKQAyf0=;
        b=pbwkf557ZGNCP9lc0N1jmU3Q5ZvPrSXEbLkj5MWyaxICF46fCOwhGSoMy+Wk4ey542
         7vqN3/KmZSyiMSr+s1QUUsU4gIeXKt5NYjD3J0LBjMaOWNw2USkSGEWfUxKKKF/a33Zu
         MX+BSu6beTSm150gvkoK5tbTifJZfPgho30Ym2KtdsV+lWvGdzUcUceD19a9ZX13sO0L
         AwD8hMHD+pa5QazEOeJwebxrbKN8vmHV3gb37NorF2HU32TKjY6RS2cbKRdychz2YFWT
         tI2Y427waCRWOXKpqKyalQQ81Gulgp9Cgnopa4y032HBvIMPNfEs+AKz5LRlMVPG/sQl
         7D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844213; x=1791449013;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4dA/c3M5G0xH9p5gUF/XWZZJAKjMX6RGI0WkDKQAyf0=;
        b=TE5P6IselBA3l4nqqio6V6N7XexWpKvLshg9idalCNnOdhWUqN6slpMtGv52HZtWO/
         qcvLEpGxztJNW9yHFet7dgbJWz6FlmnsWkIrn2Mn20MfOwD3lZTTKe/icQA1TstnBSqG
         ngHbQsEYxzeG4eAmars6hlekECR2pyYcEoTUzTPiM62o8zcGn2TZt+J8+GlgcIfOShRY
         /tCjlPxlWCAai+i/hh/tK5kP8iH9bjtab3vQx/KWpUM403l6tbFCS8tqJPDcSuywiXtD
         9LU31VV/8WODBwFzpBoVKeAjSTG7g4wUFRGpyHgsh7G5+81bY+oaIgZA7CcV41XFHWiv
         HCzw==
X-Forwarded-Encrypted: i=1; AKwUvBytp+xYD78rFU2+xR4P//HiNS3BDXFi3ANsdcUjYy3849qGUDkXaUQQk9U4M6Zef4nAy9GHEhjbR+qx10U=@vger.kernel.org
X-Gm-Message-State: AFuF++kXT1DR5hxTyrvcpiVqVMIzljlc2S1MJ8GGCGeIw3L5jBqDs+1C
	mk384+9UMfeGCbSzqdzLLhyTeHNqCjZNrJhjEXowcuLLi3F4+HpMAayea7LM6z9klR4=
X-Gm-Gg: AYBFou2xD+5g6cv9eAXsDlygsWtU/XJ9lW7oYk5SHS1WccwyW1mvrF1X0MRrizKySEF
	6v1BKnkvLRpPkdGLaL4nmno8zViMdl7xVNHTBFnGYG4BfIr0z1RB/kxwK6gVmyfx7h6xKJ+12SA
	v6Yv1U+Sly22h3kiLre+Sq8S89G5esBEy9C0ogYlgF7qLdv1lU2Wj9eZAOWYaXpBZQih41KpJOT
	R35YONGHgBHHe0zr6JjK1o4TQgTzFM3DFJiQTwDJJMD+/J/U6rsR4ftevwxLAbjO5w0kgCqTlBR
	DWiI/BNwnsyaeFKR2lYGs2XKsH/eI06uoptELfYfPobtrJa0TLqmkk71cFfPGyoKtnkBY3QvKub
	TpEmKOp8is4XK2I9Gl7/9xa8EhcUG4c5bBK1d13nxa8vFsIDXNWLic0DidlSOUp1DlTc4shMS6a
	dPP3jrRi9NP6lQbpjVQQty5KgihEzDE+RIhnKXuntNxUzCS37rN8q5hNxDP3/dqdZm9yuKrrwc1
	Ow7o5ZQNrAoBenBh5s/AgKjDKI=
X-Received: by 2002:a05:600c:c8a:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-4a01adec28amr66837005e9.14.1790844212958;
        Thu, 01 Oct 2026 01:43:32 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979c05sm84307725e9.3.2026.10.01.01.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:32 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 01 Oct 2026 12:43:20 +0400
Subject: [PATCH] i2c: rk3x: Add generic GPIO based bus recovery
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-rki2c-recovery-v1-1-ea29ce7317fc@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWRtIpiDiVcRFnf7RUUhl0paW0
 Ls31eW3eK9QhikyXZtChlmzDqkinBqSV5eecNpXE3s+B++Ds4+yOIMMM2x1nvnCEjvEtqUafQ1
 Rl9/wdv87T483ZDwutG07saLDvXIAAAA=
X-Change-ID: 20261001-rki2c-recovery-02282cfaef33
To: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6657; i=alchark@flipper.net;
 h=from:subject:message-id; bh=05hckqbzWrSWg6nAu4ayXZJ0SnccK6eIRIGmfGXur/8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtkzWVi7jpc3tlDsfnVxOXxnW1ZOn/TjjDtVTsezira
 pm1ofb6joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ6tREjQ0+r8oZFpSU3uU7NfzblsvXPtyYvL3UyNj5WPL+I92XD08sM/yyzUh6
 c9b90RMxTvUaR+VTJLeaMKz/mP9phss3cqEXGnAMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A target that loses track of the framing can be left driving SDA low while
it waits for a clock to shift out an ACK, e.g. after decoding a data byte
in another device's reply as its own address. The controller then cannot
generate a START, and the target takes the first bytes of the next
transfer as data for itself, silently corrupting its registers. This has
been observed on RK3576 with a TI BQ25792 charger and a TI BQ28Z620 gauge
sharing the bus, with gauge reads ending up in the charger's registers.

Use the I2C core's generic GPIO bus recovery so that boards can describe
the recovery pins, so that the core can clock the target out of the wedged
state and issue a STOP when SDA reads low before a transfer.

Some newer SoCs such as RK3576 have a dedicated bus status register which
can be read atomically with a single MMIO access, so use it as a fast path
to detect a wedged bus where available, falling back to the generic GPIO
based detection otherwise. Recovery itself is always GPIO based and thus
only available in non-atomic contexts due to the need to switch pinctrl.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/i2c/busses/i2c-rk3x.c | 84 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index fcede9f6ed54..a4ca2585a39b 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -41,6 +41,12 @@
 #define TXBUFFER_BASE 0x100
 #define RXBUFFER_BASE 0x200
 
+/* Registers present on some SoCs only */
+#define REG_SCL_OE_DB  0x24  /* target clock stretching debounce */
+#define REG_ST         0x220 /* SCL/SDA line status */
+#define REG_DBGCTRL    0x224 /* SCL glitch filter, clock stretching detection */
+#define REG_CON1       0x228 /* automatic STOP control */
+
 /* REG_CON bits */
 #define REG_CON_EN        BIT(0)
 enum {
@@ -66,6 +72,10 @@ enum {
 /* REG_MRXADDR bits */
 #define REG_MRXADDR_VALID(x) BIT(24 + (x)) /* [x*8+7:x*8] of MRX[R]ADDR valid */
 
+/* REG_ST bits */
+#define REG_ST_SDA        BIT(0) /* 1: SDA is high */
+#define REG_ST_SCL        BIT(1) /* 1: SCL is high */
+
 /* REG_IEN/REG_IPD bits */
 #define REG_INT_BTF       BIT(0) /* a byte was transmitted */
 #define REG_INT_BRF       BIT(1) /* a byte was received */
@@ -163,11 +173,13 @@ enum rk3x_i2c_state {
  * struct rk3x_i2c_soc_data - SOC-specific data
  * @grf_offset: offset inside the grf regmap for setting the i2c type
  * @calc_timings: Callback function for i2c timing information calculated
+ * @has_bus_status: REG_ST reports the SCL/SDA line levels
  */
 struct rk3x_i2c_soc_data {
 	int grf_offset;
 	int (*calc_timings)(unsigned long, struct i2c_timings *,
 			    struct rk3x_i2c_calced_timings *);
+	bool has_bus_status;
 };
 
 /**
@@ -181,6 +193,7 @@ struct rk3x_i2c_soc_data {
  * @clk_rate_nb: i2c clk rate change notify
  * @irq: irq number
  * @t: I2C known timing information
+ * @rinfo: bus recovery information, filled in by the I2C core from firmware
  * @lock: spinlock for the i2c bus
  * @wait: the waitqueue to wait for i2c transfer
  * @busy: the condition for the event to wait for
@@ -206,6 +219,7 @@ struct rk3x_i2c {
 
 	/* Settings */
 	struct i2c_timings t;
+	struct i2c_bus_recovery_info rinfo;
 
 	/* Synchronization & notification */
 	spinlock_t lock;
@@ -1056,6 +1070,60 @@ static int rk3x_i2c_wait_xfer_poll(struct rk3x_i2c *i2c)
 	return !i2c->busy;
 }
 
+/*
+ * A target that lost track of the framing may be left driving SDA low, e.g.
+ * waiting for a clock to shift out an ACK. The controller cannot generate a
+ * START then, and the target takes the next bytes on the bus as data for
+ * itself. Clock the target out and issue a STOP before starting a transfer.
+ */
+static bool rk3x_i2c_sda_held_low(struct rk3x_i2c *i2c, bool polling)
+{
+	struct i2c_bus_recovery_info *bri = i2c->adap.bus_recovery_info;
+	u32 st;
+
+	if (i2c->soc_data->has_bus_status) {
+		clk_enable(i2c->clk);
+		clk_enable(i2c->pclk);
+		st = i2c_readl(i2c, REG_ST);
+		clk_disable(i2c->pclk);
+		clk_disable(i2c->clk);
+
+		return !(st & REG_ST_SDA);
+	}
+
+	/* Reading the recovery GPIO may sleep */
+	if (polling || !bri || !bri->get_sda)
+		return false;
+
+	return !bri->get_sda(&i2c->adap);
+}
+
+/*
+ * Polling transfers come in through .xfer_atomic, which the I2C core only uses
+ * when the caller cannot sleep.
+ */
+static int rk3x_i2c_clear_bus(struct rk3x_i2c *i2c, bool polling)
+{
+	int ret;
+
+	if (!rk3x_i2c_sda_held_low(i2c, polling))
+		return 0;
+
+	/* Recovery switches pinctrl states, which may sleep */
+	if (polling || !i2c->adap.bus_recovery_info) {
+		dev_warn_ratelimited(i2c->dev, "SDA held low, cannot recover the bus\n");
+		return 0;
+	}
+
+	dev_warn_ratelimited(i2c->dev, "SDA held low, recovering the bus\n");
+
+	ret = i2c_recover_bus(&i2c->adap);
+	if (ret)
+		dev_err_ratelimited(i2c->dev, "bus recovery failed: %d\n", ret);
+
+	return ret;
+}
+
 static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 				struct i2c_msg *msgs, int num, bool polling)
 {
@@ -1066,6 +1134,10 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 	int ret = 0;
 	int i;
 
+	ret = rk3x_i2c_clear_bus(i2c, polling);
+	if (ret)
+		return ret;
+
 	spin_lock_irqsave(&i2c->lock, flags);
 
 	clk_enable(i2c->clk);
@@ -1200,6 +1272,12 @@ static const struct rk3x_i2c_soc_data rk3399_soc_data = {
 	.calc_timings = rk3x_i2c_v1_calc_timings,
 };
 
+static const struct rk3x_i2c_soc_data rk3576_soc_data = {
+	.grf_offset = -1,
+	.calc_timings = rk3x_i2c_v1_calc_timings,
+	.has_bus_status = true,
+};
+
 static const struct of_device_id rk3x_i2c_match[] = {
 	{
 		.compatible = "rockchip,rv1108-i2c",
@@ -1229,6 +1307,10 @@ static const struct of_device_id rk3x_i2c_match[] = {
 		.compatible = "rockchip,rk3399-i2c",
 		.data = &rk3399_soc_data
 	},
+	{
+		.compatible = "rockchip,rk3576-i2c",
+		.data = &rk3576_soc_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rk3x_i2c_match);
@@ -1261,6 +1343,8 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	i2c->adap.dev.of_node = np;
 	i2c->adap.algo_data = i2c;
 	i2c->adap.dev.parent = &pdev->dev;
+	/* The core picks up recovery GPIOs and pinctrl states, if described */
+	i2c->adap.bus_recovery_info = &i2c->rinfo;
 
 	i2c->dev = &pdev->dev;
 

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-rki2c-recovery-02282cfaef33

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

