Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E63D0BE5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792317821; cv=none; b=YNDNcKWpiha3RG0+oBmP5APhJ9GXK0HWH2XWq3XRvaBsETX+uWawqomIBf9VheJ0KbE3R2tz91D3dhn52ki80uOXZelUo3IqA9JRh5cyiDKDoktXwKtBK5Ngnp45LYm7MDlmdQIx71hdbL8YoYYoufw+R8fYZtt966znjaYLFjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792317821; c=relaxed/simple;
	bh=1RCOLIz6NsNsEwRTsIyu+OY3DDSgfYddaH+1Cq/lpLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgM+n3F+mVZYx2B6AQCOIf56QCYk28nqZlT7dASUhSgfcYpoAi71PkH3/XjmoCw4tJCVlkFZzxdrX9qFc5xORCRRWgeRb3HjD1CAs1Gor59OAf3WeWlRNGN98kQbk38RfNgfaiLAU/yux5dfrHqCy3+CNYALTomYmXq1pb0OmNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=Em+YwggU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="Em+YwggU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1102287a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792317820; x=1792922620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOYcKRD2TDbNXNNWs/hgOZE8Ik30+d31hhXArwOuaKo=;
        b=Em+YwggU8jmVoLLzcfMcSZHh6QZXvtTR6c7saEt4UJ210g36Ozxfv32TKoIj7XrwaU
         KRmd67nmmtGaY9RPFsq2Go/QuhZUxv2AxB7XSgfEkKw/vSVedVWqGMVAXhvGdHMZ+tuk
         2njKGmqrRXw3r/yZBEPj1F5oTUJKC2VsjU4+P7s+dZoqm7zSMTaStX+gXDzb8aSAY96I
         kd4EOKhNAXLxY/nAM1P1TOF5LhHeogX3ZB1y5ZSEVdNCo+FMSSQVQ1HGVJVZ6suyQ+mG
         Ztub23JeUfQEtE7VeCMbpxLPxL5bOoc9O4umWBNLRXwWt5nxe6l9JakyBPBkZs8aShFy
         LSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792317820; x=1792922620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOYcKRD2TDbNXNNWs/hgOZE8Ik30+d31hhXArwOuaKo=;
        b=QPofI7UC88VyWYRCQcmysR8U1ZA2aZC6HE83uuI3O05Gjj/OeE91lNxdY8xuM0ebhr
         /dq0NUY9Kf9StKvZUqqOkVT7xWP0sQtM0vBHUmnL7PD1aAmS0TJ3PXfhO55HPeNXkl6G
         2rJ2+4+De+uGO/EdGwKoIL2moQ3knV/7md8VTd4qkxArv5b0GlJOKxJpKZ5k8+cHHNX3
         UgvaOCgW32go+OvIbYgcki1BcsTF8ET4ntj1rscoAOHI9L0yBtwKGGgeZLC1NES9lUTb
         t2JwfmAngJqyAZrzPkzHWUtaI/UWZT6cAxw27j432pl2vQ+G0G2Zn3/eNR1khjHqLoGi
         u6Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwkmgmH+2g9T6+X90ypBzsdWCGKCmmlceHJVxxfXpGzDHv4N69jV4DNOVK+wLh+B6JrZlbr2wZr+eEf5j8=@vger.kernel.org
X-Gm-Message-State: AFq9FYItACExkZzYd9TEn6BHBSqxCAVN8PeQyzfYUxDPuIJU5dyWRjme
	UImd2xO5xoK39ZvqYKPZGeuaJPBlkPRAYRcp75smwlaq4+42mcnf+DWQzqgIaOptHQ==
X-Gm-Gg: AYBFou35ByjfA6FvJxz0nPR6aJCNRU7rVAd8qkl4ANO6ZIiExkI7QE3wMWEC5n6aMeQ
	LjepSfhR2CQzeX0/9FN150uolKiqxB3vXA8NkU+99Mu7xay//kjk8YldlADFJRVucyoDPraOkjh
	qVZvIK9jNeZ8a0CacggjjpvBfv2oAaUyd6qWshZ4w6ozgcN1GZ67s4IcM2WaOedqNck1fuLDnx8
	M0F9jlcPNgieQaCMQa+6V4MHBh9/n/w5sCxIwp7T7faPTY30iKEWZeObCBb+YGZgNCfJFXmJTno
	c6a+G6rrQjfZTVw/AqWR4PVqlXjSJG+OYplrUXFv4iB1C1D2hoAo9ihSbTW2AvOYkhsuaxSRybC
	Uj6wHPiOZBFO4VG5GkYUszmI+cnI5YFsCV0vZjtvU3TfztMtph0S/CTw8FmOOtKao1XjVUnp5hz
	PAneBxBc66g5Wsh0vZwRVLXSZHyEdYK4DvFP+KSYzo8h1hDEjHvps8wv1DjiT84DplvAEiejZlb
	DQUf45OpgaXxBfHr8g1GoZ21VchIieiqZhiBD6oAfut3WujhXAPR36pdC/iPqY=
X-Received: by 2002:a17:90b:1dc3:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3acef108633mr4548897a91.19.1792317819707;
        Sun, 18 Oct 2026 03:03:39 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm16101210a91.0.2026.10.18.03.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:03:39 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/6] net: phy: broadcom: use timestamped MDIO writes in gettimex64
Date: Sun, 18 Oct 2026 17:02:55 +0700
Message-ID: <20261018100257.566267-5-jjc@jclark.com>
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

When the MDIO bus provides the write_sts operation, use
__phy_write_sts() to obtain tighter system timestamp bounds in
gettimex64 by timestamping completion of the write that triggers
capture of the PHC time.

The PHY captures its time a short delay after the last MDC edge of the
write. This delay is not documented. The correctness of gettimex64
requires that the event delay passed to __phy_write_sts() is an upper
bound on the actual delay.

The upper bound BCM_FRAMESYNC_CAPTURE_NS was established by measurements
performed on a Raspberry Pi CM4. The same PPS signal was wired both to
the SYNC_OUT pin connected to the PHY's PHC and to GPIO pin 18. Two
programs were run simultaneously. One used polling of GPIO registers to
estimate the system time of each pulse. The other waited for the extts
event for each pulse, and then performed a PTP_SYS_OFFSET_EXTENDED
ioctl. Combining these gives a PHC/system time pair for each pulse. The
system time of the PHC reading in each PTP_SYS_OFFSET_EXTENDED sample
was estimated by interpolating between the PHC/system time pairs of the
pulses on either side of it. Over about 30,000 samples, every estimate
was at least 285 ns after the lower system time bound of the sample.
The write cannot complete before the lower bound, so the delay can be no
more than the gap from the lower bound to the capture.
However, the polling brackets are about 150 ns wide. Compensating for
polling error by considering neighbouring pulses gives an upper bound of
at most 330 ns; BCM_FRAMESYNC_CAPTURE_NS uses this rounded up to 350 ns,
which also covers a possible variation of 8 ns in the delay,
corresponding to one period of the PHY's 125 MHz clock.

This assumes that the delay is a property of the PHY, so that it applies
equally with other MDIO buses. Changing the MDC period between 100 and
400 ns changed the delay by less than 10 ns. Measurements on a Raspberry
Pi CM5, where the same PHY is on the RP1's macb, are consistent with the
CM4 measurements. But there the GPIO is polled across PCIe, so the
polling brackets are wider.

gettimex64 can now return -EBUSY if the clock is stepped during the
write, as gettimex64 already can in other drivers, such as mvpp2 and
ionic.

This patch does not try to fix the error handling in the existing
framesync code, which ignores MDIO write errors.

Signed-off-by: James Clark <jjc@jclark.com>
Assisted-by: LLM
---
Changes in v2:
- Take into account the PHY's capture delay, with a bound of 350 ns
  found by measurement
- Say that gettimex64 can now return -EBUSY if the clock is stepped
  during the write
- Say that the tighter bounds need a bus driver with write_sts
  (Sashiko)

Does Broadcom know the BCM54210PE's capture delay, from the end of the
MDIO write to the framesync capture? If so, I can use it in place of
the 350 ns bound found by measurement.

 drivers/net/phy/bcm-phy-lib.c | 27 +++++++++++++++++++++++++++
 drivers/net/phy/bcm-phy-lib.h |  7 +++++++
 drivers/net/phy/bcm-phy-ptp.c | 33 +++++++++++++++++++++++++++------
 3 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/bcm-phy-lib.c b/drivers/net/phy/bcm-phy-lib.c
index b64beade8dd..5f8813d01a8 100644
--- a/drivers/net/phy/bcm-phy-lib.c
+++ b/drivers/net/phy/bcm-phy-lib.c
@@ -42,6 +42,33 @@ int bcm_phy_write_exp(struct phy_device *phydev, u16 reg, u16 val)
 }
 EXPORT_SYMBOL_GPL(bcm_phy_write_exp);
 
+static int __bcm_phy_write_exp_sts(struct phy_device *phydev, u16 reg, u16 val,
+				   u32 event_delay_ns,
+				   struct ptp_system_timestamp *sts)
+{
+	int rc;
+
+	rc = __phy_write(phydev, MII_BCM54XX_EXP_SEL, reg);
+	if (rc < 0)
+		return rc;
+
+	return __phy_write_sts(phydev, MII_BCM54XX_EXP_DATA, val,
+			       event_delay_ns, sts);
+}
+
+int bcm_phy_write_exp_sts(struct phy_device *phydev, u16 reg, u16 val,
+			  u32 event_delay_ns, struct ptp_system_timestamp *sts)
+{
+	int rc;
+
+	phy_lock_mdio_bus(phydev);
+	rc = __bcm_phy_write_exp_sts(phydev, reg, val, event_delay_ns, sts);
+	phy_unlock_mdio_bus(phydev);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(bcm_phy_write_exp_sts);
+
 int __bcm_phy_read_exp(struct phy_device *phydev, u16 reg)
 {
 	int val;
diff --git a/drivers/net/phy/bcm-phy-lib.h b/drivers/net/phy/bcm-phy-lib.h
index bba94ce9619..08ab59fb9b8 100644
--- a/drivers/net/phy/bcm-phy-lib.h
+++ b/drivers/net/phy/bcm-phy-lib.h
@@ -34,6 +34,8 @@ int __bcm_phy_write_exp(struct phy_device *phydev, u16 reg, u16 val);
 int __bcm_phy_read_exp(struct phy_device *phydev, u16 reg);
 int __bcm_phy_modify_exp(struct phy_device *phydev, u16 reg, u16 mask, u16 set);
 int bcm_phy_write_exp(struct phy_device *phydev, u16 reg, u16 val);
+int bcm_phy_write_exp_sts(struct phy_device *phydev, u16 reg, u16 val,
+			  u32 event_delay_ns, struct ptp_system_timestamp *sts);
 int bcm_phy_read_exp(struct phy_device *phydev, u16 reg);
 int bcm_phy_modify_exp(struct phy_device *phydev, u16 reg, u16 mask, u16 set);
 
@@ -48,6 +50,11 @@ static inline int bcm_phy_read_exp_sel(struct phy_device *phydev, u16 reg)
 	return bcm_phy_read_exp(phydev, reg | MII_BCM54XX_EXP_SEL_ER);
 }
 
+static inline bool bcm_phy_supports_write_exp_sts(struct phy_device *phydev)
+{
+	return phy_supports_write_sts(phydev);
+}
+
 int bcm54xx_auxctl_write(struct phy_device *phydev, u16 regnum, u16 val);
 int bcm54xx_auxctl_read(struct phy_device *phydev, u16 regnum);
 
diff --git a/drivers/net/phy/bcm-phy-ptp.c b/drivers/net/phy/bcm-phy-ptp.c
index 65d609ed69f..61593dd2dbc 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -161,6 +161,11 @@ struct bcm_ptp_capture {
 #define BCM_MAX_PULSE_8NS	((1U << 9) - 1)
 #define BCM_MAX_PERIOD_8NS	((1U << 30) - 1)
 
+/* Allowed for the PHY to capture its time after the last MDC edge of
+ * the framesync write.
+ */
+#define BCM_FRAMESYNC_CAPTURE_NS	350
+
 #define BRCM_PHY_MODEL(phydev) \
 	((phydev)->drv->phy_id & (phydev)->drv->phy_id_mask)
 
@@ -214,22 +219,35 @@ static void bcm_ptp_framesync(struct phy_device *phydev, u16 ctrl)
 	bcm_phy_write_exp(phydev, NSE_CTRL, ctrl | NSE_CPU_FRAMESYNC);
 }
 
+static int bcm_ptp_framesync_sts(struct phy_device *phydev, u16 ctrl,
+				 struct ptp_system_timestamp *sts)
+{
+	return bcm_phy_write_exp_sts(phydev, NSE_CTRL,
+				     ctrl | NSE_CPU_FRAMESYNC,
+				     BCM_FRAMESYNC_CAPTURE_NS, sts);
+}
+
 static int bcm_ptp_framesync_ts(struct phy_device *phydev,
 				struct ptp_system_timestamp *sts,
 				struct timespec64 *ts,
 				u16 orig_ctrl)
 {
 	u16 ctrl, reg;
-	int i;
+	int i, err = 0;
 
 	ctrl = bcm_ptp_framesync_disable(phydev, orig_ctrl);
 
-	ptp_read_system_prets(sts);
-
 	/* trigger framesync + capture */
-	bcm_ptp_framesync(phydev, ctrl | NSE_CAPTURE_EN);
-
-	ptp_read_system_postts(sts);
+	if (sts && bcm_phy_supports_write_exp_sts(phydev)) {
+		/* cannot ignore error since sts may be uninitialized,
+		 * but still poll for any triggered capture
+		 */
+		err = bcm_ptp_framesync_sts(phydev, ctrl | NSE_CAPTURE_EN, sts);
+	} else {
+		ptp_read_system_prets(sts);
+		bcm_ptp_framesync(phydev, ctrl | NSE_CAPTURE_EN);
+		ptp_read_system_postts(sts);
+	}
 
 	/* poll for FSYNC interrupt from TS capture */
 	for (i = 0; i < 10; i++) {
@@ -242,6 +260,9 @@ static int bcm_ptp_framesync_ts(struct phy_device *phydev,
 
 	bcm_ptp_framesync_restore(phydev, orig_ctrl);
 
+	if (err)
+		return err;
+
 	return reg & INTC_FSYNC ? 0 : -ETIMEDOUT;
 }
 
-- 
2.56.0

