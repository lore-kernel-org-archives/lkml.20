Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857761;
	b=aP0nGZ+O3R+dO2eDipb/wXOq6Jcw86CR587YgHyBiZRq6nqzsPCk4h2qHo6v3fZH1L4g
	 7tACB6dhy+tzQ4sHU0kQkjjGmPy1G5Ju6a8ODZaoYfMMxrIZYMLwSIh4UuIvbTEMyv02w
	 iZ6g258ue7PquJIIcjZtYOpkgkEadsG34QNRc3gINYfMo5RtHXvVkrBA0f+z1itt8VQ6g
	 yYQdOzYCvYT466V3C7dgJ2mOcurc4Dr1HBWfQkIHsyn+W9wW+8gE+bjy790KQ/igcY+6m
	 Lkf7y8sGCQtmTx/aBfC/ZeoDOkbuR2OdJck15+DTb/sNG/wqUFbVoQV9lPSHkC/EQIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tcMipQjCxk6KpxhghZ33X+zD0NDiIBNGo1RCNpsRpC0=;
	b=uchyyxc/tY+Zbeq5itgeoATJzEOXb+E9rvy5pKFXpt6XHpyAJkRl727RmLSIZLHbKP6Y
	 OH3K+XKc0Uwy+CyXqaTpyhk5EQ/mjv46X4yjlnpJDYEIC/kZ6YGC/YiMrGQWuPZgy5YEN
	 Cy1Pk6+H24FGbKxS0SI06DOUdyuIQTfeii99GggMnXyRWKTwaT1yirVQZwhkYnajHdGZS
	 Q+ilXlsPJ+rXaCpboGyCl1dJU2V7w6fQ+jl/qFPDbM0DVr1EIPXk0UXxYDhpszNXXLorE
	 UlbzWMhrvpMfFfhNiRfIIFzlTDNhcDzNCdUIqj2pFtFD/dkzXFaqbk2C8JzKsamHmFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wy9SrfRT;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CE606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3CE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wy9SrfRT
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso837189a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793857760; x=1794462560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tcMipQjCxk6KpxhghZ33X+zD0NDiIBNGo1RCNpsRpC0=;
        b=Wy9SrfRTldNls0AxzaGcFYC4tVRUG531DXAaFntVkITuXsP+elg52r9Y7mSocnvQEE
         yN4BLkkgSMpFrX7Q6/fP9aZuA8kD2zh26CWgC4rDU/Tsyer1TCJ+p2uXQEjuVsw/0J77
         Jg7plRJ1ivgHYTr3U/GdwvYuh7DDwBENe0h7nXK3j1Olbnb+2V7vWBtBDUvjcCsRTiQR
         lWLmM9/qoFc1MikB70IF/y9XYCAcumI6EbB9UqYthYHkOuQuRt7UUUuUAhd6loWeDXl7
         JuQ5gxoUhuna109NElo5pokZR8JetliAjfz8Un9Cb3imQO04uJDyXMl4SBzHIjiKFj/T
         6VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857760; x=1794462560;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcMipQjCxk6KpxhghZ33X+zD0NDiIBNGo1RCNpsRpC0=;
        b=SNwLLyBj0Qmb6Opqc76V2v6enyDxgW3B7Lc4wFBLhgO0rALSX2z25OomMc5bepBBSQ
         MJGJgLIEvCu8RAfNK0EtNsnktC4OuD/Thb6W+ax+EVU4R8kHGJZiWtSQyfSkISqEaBEd
         HgXXEHlH1ded8ZnX8oxoLmye5S4/0XL3wlB047DByfjM7CiANHTFBMPGmAnFsPZ1FtpX
         RvsfQnZCXRkfvl7KdVtAlsmEwahDhLI0oSRaEozVf5e0l2LgmnjaVC/28oFn934X6rjS
         R66mO6p0nMYS9KmoUOqi4h2U0qRip/E35faMVXBkPoXmaL15yL4E1/JgKVVRTabpbqbp
         sS7g==
X-Forwarded-Encrypted: i=1; AKwUvBzb4CJBLEYWjaH3FfP0dCqmBth6cidHZcpbZfOvbWdpEhptGXUv3XrUyIOMWwki2mIZRId+gf/93Ic2EBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZpXKLarlZxk5+MZhWvNVua0HKAYeaDo5Z3WZbPT3A4iopMkHA
	3nJUjPe3WCOCccUq0BEaMy6nibKve7W+pTXYTrxLViHWudMTA6Q5T3NrGppprB/PGQ==
X-Gm-Gg: AYBFou2Fd7KOXrj+/spf2o9M6BZfFxsoEzb9nXgaOfIsymMuWIQcYaadbr994eOM38Q
	c/J0HPlMxD1e/vu3qNUciyWdYoc2Mod5VSXOEdrOsTcSfwt95qmIFpwwAK1byvqSsdMIu/v5Mxj
	2FWaJaGDaP0tTu/bs5cSrRa1VGqsMZoQjrvXj+0Ex602VHA0EoKS5Re8lx6qYOt/FGZQ1LuYFmq
	1Ch7XoD8KGGEAdVZQr4Ul2dwzS5HV9OjWtvKiFf32EIw4VEKGuQhW5gRwWPFn5X6/Z+pQOr2/xa
	umMYqHppSSYnV3i1X+a3ykvVoiPbLjN90QE5ol7H72q9m6RVmwK6hmR+H03GMZ0HwgD3cEBV7xn
	ykwCpb35UE9SV7ov2gS4DC4DGeKyOAYTXNtkiatLTX2vRKfW2tWjpAIsoQUyhDv7wYu9o3VO0nv
	RCU/9GxmN8nJP1WlgppExa5SrYtZb10L3Fb5zi3VXj9oNDsYfUVncp4Iy7Gm30iVNiI8n+2L+xD
	xKRw75NeLDBLvo9eUEQZoNkvHCBU54yhFWtU6+/FaH0/0GeYMq+vdtit/bSe9h2MPhAMB6GGTvE
	KanLrMsqcAA1dg1WTHxc55JzkjMtvSDwa04kpWuTbL9Yofg4e3TCf2GR48aXNzdz4dPKZDLMLSX
	Rr0M3x+rlDCrwnBUvLA==
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr14683833a91.8.1793857759926;
        Wed, 04 Nov 2026 21:49:19 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b319f2c9sm1989676a91.10.2026.11.04.21.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:49:19 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Hubert Feurstein <h.feurstein@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 5/6] net: macb: implement timestamped MDIO writes
Date: Thu,  5 Nov 2026 12:48:38 +0700
Message-ID: <20261105054839.2248046-6-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105054839.2248046-1-jjc@jclark.com>
References: <20261105054839.2248046-1-jjc@jclark.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement write_sts to provide system timestamp bounds for completion
of an MDIO write. This enables tighter system timestamp bounds in PHY
implementations of gettimex64.

Take system timestamps around the command register write, then shift
them by the time from the command write until the MDC edge that
clocks the last data bit, calculated from the MDC rate.

A clause 22 frame is 64 MDC periods long, and the transfer ends on the
rising edge of MDC in the last period, half way through it. So if the
frame starts with the command write, that edge comes 63.5 periods after
the command write. If MDC runs freely, the frame can start up to one
period after the command write, so by default bound the edge by 63.5 and
64.5 periods. Add the MACB_CAPS_MDC_WRITE_SYNC flag for a MAC that
starts the frame with the command write, and use exactly 63.5 periods
there.

Set the flag for RP1. Measurements performed on a Raspberry Pi CM5 with
its BCM54210PE PHY show the transfer consistently takes 63.5 periods.
The PHY's PHC was read with PTP_SYS_OFFSET_EXTENDED while the MDC
divisor was switched between 48 and 128 through /dev/mem. With 63.5
periods, the PHC offset jumped by under 2 ns at each switch, after
compensating for drift. A frame starting on average half a period after
the command write would have made it jump by 200 ns. The spread of the
PHC offsets also did not change with the divisor.

write_sts runs under the MDIO bus lock, so it can't call clk_get_rate(),
which takes the clock framework's prepare_lock: a clock provider that
does MDIO accesses, such as air_en8811h's, takes the two locks in the
other order. So record the MDC rate when macb_mdc_clk_div() chooses the
divisor, which it does at probe and when the MAC is opened or resumed.
If the pclk rate changes after that, neither the driver nor write_sts
adjusts to the new rate; handling this is outside the scope of this
patch.

Signed-off-by: James Clark <jjc@jclark.com>
---
Changes in v3:
- Pass &bp->info to macb_is_gem(), which takes struct macb_info in
  net-next

Changes in v2:
- Bound the edge by 63.5 and 64.5 MDC periods by default, and use
  exactly 63.5 with MACB_CAPS_MDC_WRITE_SYNC, which RP1 sets
- Explain how 63.5 follows from the frame timing
- Record the MDC rate when the divisor is chosen, in place of reading
  NCFGR (Théo)
- Explain why clk_get_rate() can't be called under the MDIO bus lock
  (Théo)
- Say that neither the driver nor write_sts adjusts to a change of the
  pclk rate, and that handling one is outside the scope of this patch
- Make macb_mdio_write_c22_sts() separate from macb_mdio_write_c22(),
  as Andrew asked for UniMAC
- Express the delay with MDIO_C22_FRAME_BITS (Andrew)

 drivers/net/ethernet/cadence/macb.h      |   2 +
 drivers/net/ethernet/cadence/macb_main.c | 115 ++++++++++++++++++++++-
 2 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index b7b4b6a38298..fa32e4100a45 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -785,6 +785,7 @@
 #define MACB_CAPS_USRIO_HAS_MII			BIT(26)
 #define MACB_CAPS_USRIO_HAS_REFCLK_SOURCE	BIT(27)
 #define MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE	BIT(28)
+#define MACB_CAPS_MDC_WRITE_SYNC		BIT(29)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
@@ -1373,6 +1374,7 @@ struct macb {
 	}			hw_stats;
 
 	struct mii_bus		*mii_bus;
+	unsigned long		mdc_rate;
 	struct phylink		*phylink;
 	struct phylink_config	phylink_config;
 	struct phylink_pcs	phylink_usx_pcs;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index f087f278f9e5..c8ed34fc6d28 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -444,6 +444,112 @@ static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 	return status;
 }
 
+static u32 macb_mdc_divisor(struct macb *bp, u32 config)
+{
+	static const u16 gem_divisors[] = {
+		[GEM_CLK_DIV8] = 8,
+		[GEM_CLK_DIV16] = 16,
+		[GEM_CLK_DIV32] = 32,
+		[GEM_CLK_DIV48] = 48,
+		[GEM_CLK_DIV64] = 64,
+		[GEM_CLK_DIV96] = 96,
+		[GEM_CLK_DIV128] = 128,
+		[GEM_CLK_DIV224] = 224,
+	};
+	static const u16 macb_divisors[] = {
+		[MACB_CLK_DIV8] = 8,
+		[MACB_CLK_DIV16] = 16,
+		[MACB_CLK_DIV32] = 32,
+		[MACB_CLK_DIV64] = 64,
+	};
+
+	if (macb_is_gem(&bp->info))
+		return gem_divisors[GEM_BFEXT(CLK, config)];
+	return macb_divisors[MACB_BFEXT(CLK, config)];
+}
+
+/* write_sts runs under the MDIO bus lock, so it can't call
+ * clk_get_rate(): that takes the clock framework's prepare_lock, and a
+ * clock provider that does MDIO accesses, such as air_en8811h's, takes
+ * the two locks in the other order. So record the MDC rate when the
+ * divisor is chosen.
+ */
+static void macb_record_mdc_rate(struct macb *bp, unsigned long pclk_hz,
+				 u32 config)
+{
+	unsigned long rate = pclk_hz / macb_mdc_divisor(bp, config);
+
+	if (rate)
+		WRITE_ONCE(bp->mdc_rate, rate);
+}
+
+static void macb_mdio_sts_delays(struct macb *bp, u64 *pre_ns, u64 *post_ns)
+{
+	u64 rate2 = 2ULL * READ_ONCE(bp->mdc_rate);
+	u64 half_periods = 2ULL * MDIO_C22_FRAME_BITS - 1;
+
+	/* The MDC edge that clocks the last bit comes half a period
+	 * before the end of the frame. A MAC with MACB_CAPS_MDC_WRITE_SYNC
+	 * starts the frame with the command write. Otherwise MDC may run
+	 * freely, so the frame starts up to one period after the command
+	 * write.
+	 */
+	*pre_ns = div64_u64(half_periods * NSEC_PER_SEC, rate2);
+	if (!(bp->caps & MACB_CAPS_MDC_WRITE_SYNC))
+		half_periods += 2;
+	*post_ns = div64_u64(half_periods * NSEC_PER_SEC + rate2 - 1, rate2);
+}
+
+static int macb_mdio_write_c22_sts(struct mii_bus *bus, int mii_id, int regnum,
+				   u16 value, struct ptp_system_timestamp *sts)
+{
+	struct macb *bp = bus->priv;
+	u64 pre_ns, post_ns;
+	unsigned long flags;
+	int status;
+	u32 cmd;
+
+	status = pm_runtime_resume_and_get(&bp->pdev->dev);
+	if (status < 0)
+		goto mdio_pm_exit;
+
+	status = macb_mdio_wait_for_idle(bp);
+	if (status < 0)
+		goto mdio_write_exit;
+
+	cmd = MACB_BF(SOF, MACB_MAN_C22_SOF)
+	      | MACB_BF(RW, MACB_MAN_C22_WRITE)
+	      | MACB_BF(PHYA, mii_id)
+	      | MACB_BF(REGA, regnum)
+	      | MACB_BF(CODE, MACB_MAN_C22_CODE)
+	      | MACB_BF(DATA, value);
+	macb_mdio_sts_delays(bp, &pre_ns, &post_ns);
+
+	local_irq_save(flags);
+	ptp_read_system_prets(sts);
+	/* macb_writel() is relaxed; order it after the timestamp. */
+	mb();
+	macb_writel(bp, MAN, cmd);
+	/* Flush the posted write before taking the upper bound. */
+	macb_readl(bp, NSR);
+	/* Order the read-back before the system timestamp. */
+	rmb();
+	ptp_read_system_postts(sts);
+	local_irq_restore(flags);
+
+	ptp_adjust_system_prets(sts, pre_ns);
+	ptp_adjust_system_postts(sts, post_ns);
+
+	status = macb_mdio_wait_for_idle(bp);
+	if (status < 0)
+		goto mdio_write_exit;
+
+mdio_write_exit:
+	pm_runtime_put_autosuspend(&bp->pdev->dev);
+mdio_pm_exit:
+	return status;
+}
+
 static int macb_mdio_write_c45(struct mii_bus *bus, int mii_id,
 			       int devad, int regnum,
 			       u16 value)
@@ -1231,6 +1337,8 @@ static int macb_mii_init(struct macb *bp)
 	bp->mii_bus->name = "MACB_mii_bus";
 	bp->mii_bus->read = &macb_mdio_read_c22;
 	bp->mii_bus->write = &macb_mdio_write_c22;
+	if (bp->mdc_rate)
+		bp->mii_bus->write_sts = &macb_mdio_write_c22_sts;
 	bp->mii_bus->read_c45 = &macb_mdio_read_c45;
 	bp->mii_bus->write_c45 = &macb_mdio_write_c45;
 	snprintf(bp->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
@@ -3196,6 +3304,8 @@ static u32 gem_mdc_clk_div(struct macb *bp)
 	else
 		config = GEM_BF(CLK, GEM_CLK_DIV224);
 
+	macb_record_mdc_rate(bp, pclk_hz, config);
+
 	return config;
 }
 
@@ -3217,6 +3327,8 @@ static u32 macb_mdc_clk_div(struct macb *bp)
 	else
 		config = MACB_BF(CLK, MACB_CLK_DIV64);
 
+	macb_record_mdc_rate(bp, pclk_hz, config);
+
 	return config;
 }
 
@@ -6182,7 +6294,8 @@ static const struct macb_config raspberrypi_rp1_config = {
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_EEE |
-		MACB_CAPS_USRIO_HAS_MII,
+		MACB_CAPS_USRIO_HAS_MII |
+		MACB_CAPS_MDC_WRITE_SYNC,
 	.dma_burst_length = 16,
 	.usrio = &at91_default_usrio,
 	.jumbo_max_len = 10240,
-- 
2.56.0

