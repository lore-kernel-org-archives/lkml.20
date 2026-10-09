Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D634E36D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556541; cv=none; b=Izlfi6j0zvucZmwMKxVnlgjlleprpGTk3pF/VFUxrQuEcxReeISmJzOU9iduwY/320zpm4AORQg8sQ+tqlm4wfWvHWZor699fmV7z7QmNq70ZE/0Yd4ODYRM2ktggUDM8H/9JLJin0Lw2NXqZWkABiau5+drNIvoOYbXPKOzst0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556541; c=relaxed/simple;
	bh=ARJUZomiNWr2Esi35N49l0FhoUlm2R7xfcFwjyL02JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/vj79yMJ53RI9JjzC0zwo/E0hOiWmY3LoRO4KiRucX9J7U0aMPxVWn/yR9R1kRV4c//76NFwpUh5nIIly8BdLnsoR/m5KmQkn94xWgSwCST1VMSXXt4SHqdDVqIzJORMS8iqYes3VKpXwxYQei/TiO2sttIBgrrYHEuX36zeRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=kY3Ipb0B; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="kY3Ipb0B"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917bab38b14so72915096d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791556539; x=1792161339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnICXPRNt7kphCrcnyQTA5McOgtnsdRXgEC40bg24aY=;
        b=kY3Ipb0Bwk2iKVIPw4yeVy7dmFbIc6WFEbalyseA6R5Ima7CkngmC8/BlbZuYUEtq0
         AZm9hIRCNSHnwFRqRVwFz5kNbum0Tjw3G1cbdev1YhLaO+RYPpI5pergEDtumOMLrtQB
         2kyUfeJ/zx7NQTTWitx/B3Ou/aMNl8/8Nzl15xTF9z4o7OOJDLmZ+PFNfgOhPP3C4ZZo
         xUp28NWVeAJrHKDvdpONoGdKW6w26KfIRw9BPNJy7ZrWYkgOr3oyoc5WKLXvmxnpwghY
         pEkLoGX/k22Hi1BODJpjieterxvYW+vyHPuboeK136iGKV9Pv1rRrjdW8VjOaq3NP7ny
         RX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556539; x=1792161339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnICXPRNt7kphCrcnyQTA5McOgtnsdRXgEC40bg24aY=;
        b=pnSYyR1K2jXplpZPaxq6gv/aSV8XaUD4gvrC4OSlZnqftKkYvKSav2E9y8o/GyQSsm
         Br16NpOfR4sWdeaZtlpNR/acQwVf0wYfR6/ecFg11xVZ+O+DCcUjb8478s/kiSI7wFj7
         nEkPHpSWV6ieFUidApeNkq6HUIAMnXzZzXVT2diV5BEHeWFXUYQSAgudOojpH/K+s4Ia
         pJupQXtfNzM+pGJ9LST49Rt9v0ROcFk87kWvleGAD6IJ8CldN5BR4zEi8bd7omq4nWtT
         Ry0bLQEuTkmBVd1c/GHV5J/WbP+cxibjETNDVGV+v6xe1Evm85RiidZ+cJ2ozwLj7cHX
         trSg==
X-Forwarded-Encrypted: i=1; AKwUvBxzbTQcWuUGz6EMYfLMtQOBFbvYXBFkHk8/F3S6V9OWCrViDvNBI+FGx6HqAvIVcoTHYBa7MR8OkGAUPjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvLzMWTHb+rAr6ag8LC9x6vpEtYxe0dGDzohAnPzdcY8h5d/XC
	HAq5ntxhhLsQe5WhRz/nkn2XQ4ySK/ykfsol3VI6RNOOdbNWHliTMk1LOjloQILtlw==
X-Gm-Gg: AYBFou3KXTP5uvPjJYTS+vSs54Yq+fF05YClbOJ3imWKZRFcY+xZ7xe2dGkaxI+tgwW
	aad4C6A0O4byJRNc3bKRnYpwDBpB1FZ8Bh+TQgnkDqSszgKhW+LYU7+xzZRQ/6FeantXcoiabxe
	A56CEoeBZCmew5XtXUH2oEHjtHUgT3NhYmAeU7SqfiQBpefe/5QZNvtHM+9ErmRXtMGaTM5Qw4i
	OgLzJO7/062Cq6rZAe1picxoJ54K5cuajaxyzz7xesMyUMIYYFmQEv0vqYK0PTcvOmyh8T9lsXv
	apUgUXNPGUYFbqNZSnZ01XyF1RBq/OStFoJIK31O3rqpxZSX1T134yjFgmnyB+OtO4/pVrJDr8U
	jRVAT+gLNOmlEjaV2HNP7M34VkKuGv1hOrHx7CbSIKdgL886C8JPphgv1DS4Iah9zqTnbm/nF88
	BHRnTk1o9Kl7a5K93PKYJ+DSL3lmJJm836JCeRGhYLxRFIle3E4A+gdil6/9TotcmjJ6Fm/sY=
X-Received: by 2002:a05:6214:411e:b0:914:483b:82ea with SMTP id 6a1803df08f44-91b5555f8b8mr34591656d6.33.1791556538673;
        Fri, 09 Oct 2026 07:35:38 -0700 (PDT)
Received: from cantal.lan ([58.136.72.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501751dsm19769456d6.17.2026.10.09.07.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:35:38 -0700 (PDT)
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
Cc: Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/5] net: macb: implement timestamped MDIO writes
Date: Fri,  9 Oct 2026 21:35:05 +0700
Message-ID: <20261009143506.2507607-5-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009143506.2507607-1-jjc@jclark.com>
References: <20261009143506.2507607-1-jjc@jclark.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement write_sts to provide system timestamp bounds for completion
of an MDIO write. This enables tighter system timestamp bounds in PHY
implementations of gettimex64.

Take system timestamps around the command register write, then add
the time from the command write until the MDC edge that clocks the
last data bit, calculated from the peripheral clock rate and the
configured MDC divider.

On RP1 that edge comes 63.5 MDC periods after the command write. This
was measured on a Raspberry Pi CM5 with its BCM54210PE PHY. The PHY's
PHC was read with PTP_SYS_OFFSET_EXTENDED while the MDC divisor was
switched between 48 and 128 through /dev/mem. Any error in the number
of periods would make the PHC offset jump at each switch. After
compensating for drift, the jump with 63.5 periods was under 2 ns.
The MDC divider does not appear to run freely: the spread of the PHC
offsets did not change with the divisor.

Signed-off-by: James Clark <jjc@jclark.com>
Assisted-by: LLM
---
The 63.5-period delay has been measured only on RP1, but the code
assumes it holds for all MACB and GEM variants. I am not sure whether
that is a reasonable assumption; if not, write_sts could be enabled
only for RP1.

 drivers/net/ethernet/cadence/macb.h      |  1 +
 drivers/net/ethernet/cadence/macb_main.c | 95 ++++++++++++++++++++++--
 2 files changed, 88 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 1cb2778fe49..3670731690f 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1334,6 +1334,7 @@ struct macb {
 	struct macb_or_gem_ops	macbgem_ops;
 
 	struct mii_bus		*mii_bus;
+	unsigned long		mdio_sts_rate;
 	struct phylink		*phylink;
 	struct phylink_config	phylink_config;
 	struct phylink_pcs	phylink_usx_pcs;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index c4223ca848d..cec6e5a48e9 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -384,11 +384,47 @@ static int macb_mdio_read_c45(struct mii_bus *bus, int mii_id, int devad,
 	return status;
 }
 
-static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
-			       u16 value)
+static u64 macb_mdio_sts_delay(struct macb *bp)
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
+	unsigned long rate = READ_ONCE(bp->mdio_sts_rate);
+	u32 config = macb_readl(bp, NCFGR);
+	u32 divisor;
+
+	if (macb_is_gem(bp))
+		divisor = gem_divisors[GEM_BFEXT(CLK, config)];
+	else
+		divisor = macb_divisors[MACB_BFEXT(CLK, config)];
+
+	/* On RP1 the MDC edge that clocks the last bit of a clause 22
+	 * write comes 63.5 periods after the command write.
+	 */
+	return div64_ul(127ULL * divisor * NSEC_PER_SEC, 2 * rate);
+}
+
+static int macb_mdio_write_c22_sts(struct mii_bus *bus, int mii_id, int regnum,
+				   u16 value, struct ptp_system_timestamp *sts)
 {
 	struct macb *bp = bus->priv;
+	unsigned long flags;
+	u64 delay_ns;
 	int status;
+	u32 cmd;
 
 	status = pm_runtime_resume_and_get(&bp->pdev->dev);
 	if (status < 0)
@@ -398,12 +434,32 @@ static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 	if (status < 0)
 		goto mdio_write_exit;
 
-	macb_writel(bp, MAN, (MACB_BF(SOF, MACB_MAN_C22_SOF)
-			      | MACB_BF(RW, MACB_MAN_C22_WRITE)
-			      | MACB_BF(PHYA, mii_id)
-			      | MACB_BF(REGA, regnum)
-			      | MACB_BF(CODE, MACB_MAN_C22_CODE)
-			      | MACB_BF(DATA, value)));
+	cmd = MACB_BF(SOF, MACB_MAN_C22_SOF)
+	      | MACB_BF(RW, MACB_MAN_C22_WRITE)
+	      | MACB_BF(PHYA, mii_id)
+	      | MACB_BF(REGA, regnum)
+	      | MACB_BF(CODE, MACB_MAN_C22_CODE)
+	      | MACB_BF(DATA, value);
+
+	if (sts) {
+		delay_ns = macb_mdio_sts_delay(bp);
+		local_irq_save(flags);
+		ptp_read_system_prets(sts);
+		/* macb_writel() is relaxed; order it after the timestamp. */
+		mb();
+	}
+	macb_writel(bp, MAN, cmd);
+	if (sts) {
+		/* Flush the posted write before taking the upper bound. */
+		macb_readl(bp, NSR);
+		/* Order the read-back before the system timestamp. */
+		rmb();
+		ptp_read_system_postts(sts);
+		local_irq_restore(flags);
+
+		ptp_adjust_system_prets(sts, delay_ns);
+		ptp_adjust_system_postts(sts, delay_ns);
+	}
 
 	status = macb_mdio_wait_for_idle(bp);
 	if (status < 0)
@@ -415,6 +471,12 @@ static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 	return status;
 }
 
+static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
+			       u16 value)
+{
+	return macb_mdio_write_c22_sts(bus, mii_id, regnum, value, NULL);
+}
+
 static int macb_mdio_write_c45(struct mii_bus *bus, int mii_id,
 			       int devad, int regnum,
 			       u16 value)
@@ -1141,6 +1203,13 @@ static int macb_mdiobus_register(struct macb *bp, struct device_node *mdio_np)
 	return mdiobus_register(bp->mii_bus);
 }
 
+static bool macb_mdio_init_sts(struct macb *bp)
+{
+	bp->mdio_sts_rate = clk_get_rate(bp->pclk);
+
+	return bp->mdio_sts_rate != 0;
+}
+
 static int macb_mii_init(struct macb *bp)
 {
 	struct device_node *mdio_np, *np = bp->pdev->dev.of_node;
@@ -1166,6 +1235,8 @@ static int macb_mii_init(struct macb *bp)
 	bp->mii_bus->name = "MACB_mii_bus";
 	bp->mii_bus->read = &macb_mdio_read_c22;
 	bp->mii_bus->write = &macb_mdio_write_c22;
+	if (macb_mdio_init_sts(bp))
+		bp->mii_bus->write_sts = &macb_mdio_write_c22_sts;
 	bp->mii_bus->read_c45 = &macb_mdio_read_c45;
 	bp->mii_bus->write_c45 = &macb_mdio_write_c45;
 	snprintf(bp->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
@@ -3095,12 +3166,20 @@ static void macb_configure_dma(struct macb *bp)
 
 static void macb_init_hw(struct macb *bp)
 {
+	unsigned long rate;
 	u32 config;
 
 	macb_reset_hw(bp);
 	macb_set_hwaddr(bp);
 
 	config = macb_mdc_clk_div(bp);
+	/* Record the pclk rate the MDC divider is chosen from, for
+	 * write_sts, which can't call clk_get_rate() under the MDIO bus
+	 * lock.
+	 */
+	rate = clk_get_rate(bp->pclk);
+	if (rate)
+		WRITE_ONCE(bp->mdio_sts_rate, rate);
 	/* Make eth data aligned.
 	 * If RSC capable, that offset is ignored by HW.
 	 */
-- 
2.56.0

