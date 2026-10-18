Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6C44B693
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792317836; cv=none; b=CVbMJ+xK4B2HzTMgfftA6xIKPWxyavD2uPLIZ+cPcb3CcO0s0rocNwrFT5Wl8+ldasqEK47vleWFy0vE+2BgKsRJKYxnUPL9dX0MJf7LDurxI1z7uPn0dcHubMRh8KmZGGRN34QAcnHgq9LIjOZ9haNI4PmRxwItEyTy84fjogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792317836; c=relaxed/simple;
	bh=jzqpau56VN3IE3iVC5vb2dGoOd4juOAncsoECpWr6AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksw/0aexzMLNEi7uOXpCeJaOephT1mbEDs+0JZd8gLDwrFTpbLDctRUpCxzpZtGXyXs+g4BBH0h/ETZvNR9xd6oczS7gJ3Zv9mHtjugc7vRFyHvT2vbSxfbbVpcjCvlGbkgqFEIc0pi/u2yUvmn7cTeV/hEFW5ZLRSiPYP3KOHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=ZggQkM3M; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="ZggQkM3M"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so839485a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792317834; x=1792922634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCfhRxE7qYlrgHwKZ8TjP+Iw1tU1/S+jN6DMoQb7zIU=;
        b=ZggQkM3MVMalbK1YN01e6omTnMDmu4Zf2U1RsvF1xb6zNkSDZGW6Lr67mwKcSMd2fz
         SDHMM3+mCE9bKmb+6Z0hvcJmQgkbzUy6BMZXd18FMm4/OC4gJfr5XOuWF2XwiKhjPq+j
         xaSnDrIST8uA6bY9mTDd29l1a3JDLXg9spmHyz/qLID9tpnU9R5nU3CnPTaBZ8Mc7Ult
         hXXnDETiue/VaGybWYtzXoYnMyTuQON5Z6DQTQcHkWQubpMbjs6EXIQPoJr3A8ez0Zdi
         +ZzQiLIxJhqgD8lDwc+XhF2V15BScQEAJX23/Ap6RTy+y1Uf4sP7CbiuCkxT2ihgjgAS
         HQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792317834; x=1792922634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCfhRxE7qYlrgHwKZ8TjP+Iw1tU1/S+jN6DMoQb7zIU=;
        b=VvaGDJ/rZjyBzSb7ljb2GsO6R/mG9mnnCtSoOe/cd6llAKNzGUkclXZMGBhdwMQSW8
         9xekJyM5T9DX0oVsY5z4lvvgNmQmOHinB1ScFezmKYClDwWccfFniew2J4mz4vCIOyCE
         bRJRpdi3GSQhY1KOU/ORTdUcqQMu6viy8MFkQg6q2B3jfMMTg67jDChwogMRr8mSoy3x
         36s7qBz/YtV1yBNs9Kb8CTvWl+Fa68jkk7oFGUzHmeJHhim3B3bPL42biXpDizzMvZgg
         oKn9aJzDRTV2GyZxi6yLNH5epsQGLG1OIV4IxRVnmgaGFoWpaZQQBd9TM1N85zpGAG3s
         uqmw==
X-Forwarded-Encrypted: i=1; AKwUvBzB/9Njao61YezbyCuwUaZpSkIX6MXmbJfyUZrbGex6gd9kaDD65D/5vhpjoOuU7hDbhJAzjKj6JACJ0ZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItIwScBMylSnKg3NGkot+ojaoJrBfbYyN0jlU9MT+9cVkfg14P
	IZluQG340vyDNNgWLdTHoVDrJVVj0FOszNDW/SMCHN71e6q30G2PxFgNqlGGwwz5bg==
X-Gm-Gg: AYBFou3RgafaTAxFjne8o6WO9mxNEuNzSO3AWOkcPV8MhKZPAjE4Dymb8pbx3emhZkv
	0d8Jie+G82k9bF8fiB2rhzGzPp/xteAx8K+Mc0kx2OseG+YrzYDvmlbAgiDELIX7Zvo/mi5dnbk
	5/wo3xM6BAeLlGwWWCyj+GqFCeM9grxT0OshdLCAnhwzfsOrFwWHieA8cwoCe/ry09xvl8V11H8
	jl06ZKwRxgxyIHtujSvqNmNvShIum6n1jTgtIObkGsI85VpYuyH9gWNxwb2AT5kln8GyzSHm8/t
	vVFhfgVP6XlDlM8kMwWzf+hD0x/jZ5Nazv5O0vc+nnuEcpCTWwasZ+in+IIb1lqhz9pnM9f4uNe
	QdpsMLjLKbQrrTKXk/0ObsrU4+GrJrEZgYJfQgnCUegWt0uL8OlOTd3/zyq936oQ1SkpaYA5Qt7
	8cgrcUkQV5j/+kTXIzDstaHtLDGijqKEpavRpxeIBcHgOutYNa3lIRMKRmlR6TGa0kjDBSzOWwP
	qesqMAGNrznN3Xsi9EVduMLrAt1HMHoXVU2HwfyNVGctL64wwQZ8FVdVkreF9k=
X-Received: by 2002:a17:90b:4d88:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3acef134c30mr4826419a91.19.1792317834545;
        Sun, 18 Oct 2026 03:03:54 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm16101210a91.0.2026.10.18.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:03:54 -0700 (PDT)
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
Subject: [PATCH net-next v2 6/6] net: mdio: bcm-unimac: implement timestamped MDIO writes
Date: Sun, 18 Oct 2026 17:02:57 +0700
Message-ID: <20261018100257.566267-7-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018100257.566267-1-jjc@jclark.com>
References: <20261018100257.566267-1-jjc@jclark.com>
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

Take system timestamps around the command start, then shift them by
the time from the command start until the MDC edge that clocks the last
data bit, calculated from the reference clock rate and the configured
MDC divider.

A clause 22 frame is 64 MDC periods long, and the transfer ends on the
rising edge of MDC in the last period, half way through it. So if the
frame starts with the command start, that edge comes 63.5 periods after
the command start. If MDC runs freely, the frame can start up to one
period after the command start, so bound the edge by 63.5 and 64.5
periods. A UniMAC whose divider restarts with the command puts the edge
at 63.5 periods, still within these bounds.

Measurements performed on a Raspberry Pi CM4 with its BCM54210PE PHY
show that the MDC divider of BCM2711 runs freely. The PHY's PHC was read
with PTP_SYS_OFFSET_EXTENDED while the MDC divider field was switched
between 9 and 39 through /dev/mem. With 64 periods, the midpoint of the
bounds, the PHC offset jumped by under 10 ns at each switch, after
compensating for drift. With 63.5 periods it would have jumped by
150 ns. The PHC offsets also spread evenly over one MDC period at each
divider.

Without the preamble, a clause 22 frame is 32 MDC periods long. But with
the preamble suppressed, the same test put the edge one period later
than a 32-bit frame would, as if the UniMAC still sent one preamble bit.
So without the preamble, bound the edge by 31.5 and 33.5 periods, which
also covers a UniMAC that sends just the 32-bit frame.

Take the reference rate from a clock on the mdio node, and offer
write_sts only when there is one. This is how the standalone UniMAC
already uses that clock: unimac_mdio_clk_set() computes the MDC divider
from its rate. When GENET creates the UniMAC device, the clock it passes
is its own main clock, which gates register access but is not the MDC
reference. No in-tree DT gives an mdio node a clock yet. For BCM2711,
the GISB clock, which MDC is divided from, is being added to clk-bcm2835
separately. It is marked critical there, so the UniMAC driver does not
need to enable it. A deferral of the clock lookup is passed on, as for
any clock, so the MDIO bus waits for the clock's provider.

Signed-off-by: James Clark <jjc@jclark.com>
Assisted-by: LLM
---
Changes in v2:
- Take the reference rate from a clock on the mdio node, and offer
  write_sts only when there is one, instead of hardcoding 200 MHz for
  brcm,bcm2711-genet-v5 (Florian, Nicolai)
- Allow for a suppressed preamble, in place of not offering write_sts
  (Andrew)
- Explain how 63.5 to 64.5 follows from the frame timing
- Make unimac_mdio_write_sts() separate from unimac_mdio_write()
  (Andrew)
- Express the delay with MDIO_C22_FRAME_BITS and MDIO_PREAMBLE_BITS
  (Andrew)
- Wrap a line to 80 columns (checkpatch)

On BCM2711 this has no effect until the mdio node gets its clock.
Nicolai Buchwitz's patches adding the GISB clock:
https://lore.kernel.org/netdev/41c32f5a6f38ec9df8a79ce896912fb9@tipi-net.de/

 drivers/net/mdio/mdio-bcm-unimac.c | 128 +++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 31e396cc9fb..a18e213e383 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -16,6 +16,7 @@
 #include <linux/phy.h>
 #include <linux/platform_data/mdio-bcm-unimac.h>
 #include <linux/platform_device.h>
+#include <linux/ptp_clock_kernel.h>
 #include <linux/sched.h>
 
 #define MDIO_CMD		0x00
@@ -42,6 +43,7 @@ struct unimac_mdio_priv {
 	void			*wait_func_data;
 	struct clk		*clk;
 	u32			clk_freq;
+	unsigned long		mdio_ref_rate;
 };
 
 static inline u32 unimac_mdio_readl(struct unimac_mdio_priv *priv, u32 offset)
@@ -73,6 +75,27 @@ static inline void unimac_mdio_start(struct unimac_mdio_priv *priv)
 	unimac_mdio_writel(priv, reg, MDIO_CMD);
 }
 
+static void unimac_mdio_start_sts(struct unimac_mdio_priv *priv,
+				  struct ptp_system_timestamp *sts)
+{
+	unsigned long flags;
+	u32 reg;
+
+	reg = unimac_mdio_readl(priv, MDIO_CMD);
+	reg |= MDIO_START_BUSY;
+	local_irq_save(flags);
+	ptp_read_system_prets(sts);
+	/* Order the timestamp before the relaxed command write. */
+	mb();
+	unimac_mdio_writel(priv, reg, MDIO_CMD);
+	/* Flush the posted write before taking the upper bound. */
+	unimac_mdio_readl(priv, MDIO_CMD);
+	/* Order the read-back before the system timestamp. */
+	rmb();
+	ptp_read_system_postts(sts);
+	local_irq_restore(flags);
+}
+
 static int unimac_mdio_poll(void *wait_func_data)
 {
 	struct unimac_mdio_priv *priv = wait_func_data;
@@ -151,6 +174,82 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 	return ret;
 }
 
+static int unimac_mdio_sts_delays(struct unimac_mdio_priv *priv,
+				  u64 *pre_ns, u64 *post_ns)
+{
+	u32 cmd, config, divisor, bits, extra_bit = 0;
+	u64 ref_rate2 = 2ULL * priv->mdio_ref_rate;
+	int ret;
+
+	/* The delays assume the controller is idle. */
+	ret = read_poll_timeout(unimac_mdio_readl, cmd,
+				!(cmd & MDIO_START_BUSY),
+				1, 1000, false, priv, MDIO_CMD);
+	if (ret)
+		return ret;
+
+	config = unimac_mdio_readl(priv, MDIO_CFG);
+	divisor = 2 * (((config >> MDIO_CLK_DIV_SHIFT) &
+			MDIO_CLK_DIV_MASK) + 1);
+	bits = MDIO_C22_FRAME_BITS;
+	if (config & MDIO_SUPP_PREAMBLE) {
+		bits -= MDIO_PREAMBLE_BITS;
+		/* Measured on BCM2711: with the preamble suppressed, the
+		 * UniMAC sends one period more than the 32-bit frame, as if
+		 * one preamble bit were still sent. The upper bound allows
+		 * for that period.
+		 */
+		extra_bit = 1;
+	}
+	/* Assume that the PHY acts on the write at the earliest time it
+	 * physically can: when it samples the last bit, on the rising
+	 * MDC edge halfway through the last period of the frame, which
+	 * is bits periods long. Measurements on BCM2711 support this
+	 * assumption and show that the MDC divider can run freely, so
+	 * that the frame starts up to one period after the write that
+	 * sets MDIO_START_BUSY. The edge therefore comes between
+	 * bits - 0.5 and bits + 0.5 periods after that write.
+	 */
+	*pre_ns = div64_u64((2ULL * bits - 1) * divisor * NSEC_PER_SEC,
+			    ref_rate2);
+	*post_ns = div64_u64((2ULL * (bits + extra_bit) + 1) * divisor *
+			     NSEC_PER_SEC + ref_rate2 - 1, ref_rate2);
+
+	return 0;
+}
+
+static int unimac_mdio_write_sts(struct mii_bus *bus, int phy_id, int reg,
+				 u16 val, struct ptp_system_timestamp *sts)
+{
+	struct unimac_mdio_priv *priv = bus->priv;
+	u64 pre_ns, post_ns;
+	u32 cmd;
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		return ret;
+
+	ret = unimac_mdio_sts_delays(priv, &pre_ns, &post_ns);
+	if (ret)
+		goto out;
+
+	/* Prepare the write operation */
+	cmd = MDIO_WR | (phy_id << MDIO_PMD_SHIFT) |
+		(reg << MDIO_REG_SHIFT) | (0xffff & val);
+	unimac_mdio_writel(priv, cmd, MDIO_CMD);
+
+	unimac_mdio_start_sts(priv, sts);
+	ptp_adjust_system_prets(sts, pre_ns);
+	ptp_adjust_system_postts(sts, post_ns);
+
+	ret = priv->wait_func(priv->wait_func_data);
+out:
+	clk_disable_unprepare(priv->clk);
+
+	return ret;
+}
+
 /* Workaround for integrated BCM7xxx Gigabit PHYs which have a problem with
  * their internal MDIO management controller making them fail to successfully
  * be read from or written to for the first transaction.  We insert a dummy
@@ -234,11 +333,21 @@ static int unimac_mdio_clk_set(struct unimac_mdio_priv *priv)
 	return ret;
 }
 
+static bool unimac_mdio_init_sts(struct unimac_mdio_priv *priv,
+				 struct clk *ref_clk)
+{
+	/* The reference rate is taken to be fixed, so read it once. */
+	priv->mdio_ref_rate = clk_get_rate(ref_clk);
+
+	return priv->mdio_ref_rate != 0;
+}
+
 static int unimac_mdio_probe(struct platform_device *pdev)
 {
 	struct unimac_mdio_pdata *pdata = pdev->dev.platform_data;
 	struct unimac_mdio_priv *priv;
 	struct device_node *np;
+	struct clk *ref_clk;
 	struct mii_bus *bus;
 	struct resource *r;
 	int ret;
@@ -277,11 +386,23 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 		priv->wait_func_data = pdata->wait_func_data;
 		bus->phy_mask = ~pdata->phy_mask;
 		priv->clk = pdata->clk;
+		/* priv->clk is GENET's main clock, which gates register
+		 * access. ref_clk is the clock used as the MDC reference,
+		 * which we get from the MDIO node. The presence of this
+		 * clock enables write_sts.
+		 */
+		ref_clk = devm_clk_get_optional(&pdev->dev, NULL);
+		if (IS_ERR(ref_clk) && PTR_ERR(ref_clk) != -EPROBE_DEFER) {
+			dev_warn(&pdev->dev, "no MDC reference clock: %pe\n",
+				 ref_clk);
+			ref_clk = NULL;
+		}
 	} else {
 		bus->name = "unimac MII bus";
 		priv->wait_func_data = priv;
 		priv->wait_func = unimac_mdio_poll;
 		priv->clk = devm_clk_get_optional(&pdev->dev, NULL);
+		ref_clk = priv->clk;
 	}
 
 	if (IS_ERR(priv->clk)) {
@@ -289,9 +410,16 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 		goto out_mdio_free;
 	}
 
+	if (IS_ERR(ref_clk)) {
+		ret = PTR_ERR(ref_clk);
+		goto out_mdio_free;
+	}
+
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	if (unimac_mdio_init_sts(priv, ref_clk))
+		bus->write_sts = unimac_mdio_write_sts;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
-- 
2.56.0

