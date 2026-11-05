Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857754;
	b=kUAapoKWyeYPxGLc8UaKIeqMkUDFZl13fOVT1BsEpb5vFTDgWVJd4FstmhiPcDFRn/3f
	 rGwpjzdYpGTI1fY8nwoUoZryKnTg6BySDzZGsNx9kOYBiWcmtL+99wiq/vKWW4lTdF/+K
	 CeV43dIDpliSin4mdBw6k2uzQFrn4I4pE/EB362QNVXYFGORsPeNdl5AJnOeLF+w8j8v7
	 HzahKXpe5qrM9Dye1BWNxR+t55c5vcjlwnkxDcHtcDgdnykLCwF5TMRNsH9fv3FOgAJCt
	 XT15Z0Aa4gJZruRc0Bh2XE8HWzIYdlv5BpmPCmsbcmwFworcGBsEatSR13fXk+sOjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knxpemwIgRXpfCw7909LRGVkkjzWdBAEoQQwEqa/ptA=;
	b=TcD7/cfcV0lWQ0JEtWxIbDxeX0tcuF2n5OIwzyKc2XDdEB1GShqnEpnUQQ/2sWFcY2V/
	 /Rdcq6zqGcRGCr8LKOv0CI2erVPd9Jh3vjPkrFX+YqGkTAqoi42j2ZexjWd4UWymgVwYu
	 ToS1eKQvAODoHOAbfz/Wj6yXrkAWja7r9lg4PyBZTD4e77Gb4nheYYXlWQgN/asD5ztvU
	 rGws5fmr4EvmcrxSc3FrrIZRNOyzCxtYk1Hb1bgTX8lVxUqqW96FaQ1MXBSwajdop/QIO
	 enhQl5gSHWyoBGCupTnTOuGDUcIlmdJ4knrtnpVXFhWEs9nT0mfb385bb5K4AqFUtcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GS64Jqzk;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456FB606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456FB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GS64Jqzk
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso796604a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793857754; x=1794462554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knxpemwIgRXpfCw7909LRGVkkjzWdBAEoQQwEqa/ptA=;
        b=GS64Jqzk4Jufax3KoKuoeN1tTZ5mo+cnIki+/HYGOCBeaItOFKQVR8vkOrhF1hi8TV
         O0a+CMLGGugNUBgeGzhZu4Ye/Nlc0zdEwbQxMIVivuo8S4otgDi7e0T/Zc3VlvziVcG0
         lJwtLUWaMoM8HyOgLL5b0y22BE0fecVwJ8KUK2grEA5qs6gfSANXIvCH3z47wpNTXpbU
         CoxoagPMCC2hzoZdLnqMj23IGq1irB/mXiC9Dl0KJZs82VKYBB2KGsLIhhp6wgYCVaQ+
         eKhxkkLm/62cZ43UxAysF9tCc3zO0dq9IrxDAs5snXoB3HJMda98BgkIHKbMEM12TcQ3
         R5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857754; x=1794462554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knxpemwIgRXpfCw7909LRGVkkjzWdBAEoQQwEqa/ptA=;
        b=J83A2JqFaLsuw7s7TC/VwqFVSMUBjsQiNn/51d9Bh2U9OZnRK0DfjXdLKvQFt/4uxC
         OfpnxHWxkYBJcxXNnpC7BaQ+DWUHNzh7roTlc9VJ8Kj17yhL/HyXMj+6tR11xIyNxLAx
         a3yM7G8Rx/+A7r4IOBzkuqfwmmGyDAPtBYanEgr3olgpOVflGYXQmecvdjiio1Qhy+lR
         WrmhnPDoW703odXOmLaCnKX9V8mufy+bH/vhcw94XNdWBM611WCuJy0Ir+y4Mf7ScLRD
         BeR4aGYxKpfTUfT1F0gIdiicxm35m6JVes40CRXHk8E3ZUOPkFw/bV80Ge2fcGY/zo7F
         UWKQ==
X-Forwarded-Encrypted: i=1; AKwUvBySbM6wyHIxSp6isU2RoN/DHBGnYsSxDSQHZ+ZqLR8qzew4KdDRoUNmfwPmeTMVKtw8GugBC+utsr1k+GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z3nZJrZizXrZQGivV4qXsYDXGaMS9ki4jNvZvdrEnnP3HPLmU
	gWQSEpMLAVIea+xGFkS5op1d3SX1yZqTfrVaSbCaCUwGGB5vIuXkLN0HbYk18Gm3kg==
X-Gm-Gg: AYBFou11xRMDPVeehng3M7zi1ifyuBhC+kR43IfcmI6DVY8Ps0jGlhXJxsxPbm78bvv
	GDYsb9yMJg8ASVLD3dqabl7+6Lh7wzf1e26YqmHP7JfmPXWN/o7T251VMvaRNC0tLE0aKhhA0fz
	dirg+O25lhVjBmIS9cWHu3sgd44KcLA+FYvIQHpjVhhUPhGlMtM1oJVGg7BR91I4x8MQLeZHfYv
	B/4h8T3aqLAsgEBkSa8WZ6FDOZQBn5omwWjmnxyMCq05SRL8oG6TCp6+V+6ZzorGMDSA/kUOzBF
	7pHkIBCAaXAas3Ehylw00327dFxs/q0ITnUt8pJ1vqDMYS3OTuPw9PdxqWjD5XDy1DI93ue8qBt
	rUF9xYsgnwwnrXwwIrMsB6z7W1bVJ9ONpZvRGFhAZ7QRE9HZ/Fwu1gKig51d4wI/fN3B9GaC15f
	erre5VRsMpISON+rWThw6VdaV0Io6H5rL6sEv3b8n8CIuFznIW7/Y+p93bVBzgvEeKTr+jiy1g+
	2YGIFADPac88yxRbqtTFbbYaProgfU34A+xA/w5jHTfGYrNvk2RzYQJQgfL0FU8Qah6mtMszwGK
	JRBYukpbzSUvVpWv+SJsWmMI0tGt8kNVcay+J8xGZ1nOLGOIukS04Aueet/gVhgnDirYjwLQIfW
	VZqca+leSHqh3ftCblg==
X-Received: by 2002:a17:90b:1644:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b0a7e76afamr2202042a91.7.1793857753548;
        Wed, 04 Nov 2026 21:49:13 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b319f2c9sm1989676a91.10.2026.11.04.21.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:49:12 -0800 (PST)
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
Subject: [PATCH net-next v3 4/6] net: phy: broadcom: use timestamped MDIO writes in gettimex64
Date: Thu,  5 Nov 2026 12:48:37 +0700
Message-ID: <20261105054839.2248046-5-jjc@jclark.com>
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
Content-Transfer-Encoding: 8bit

When the MDIO bus provides the write_sts operation, use
__phy_write_sts() to obtain tighter system timestamp bounds in
gettimex64 by timestamping completion of the write that triggers
capture of the PHC time.

The PHY captures its time a short delay after completion of the write,
the rising MDC edge that clocks its last data bit. This delay is not
documented. The correctness of gettimex64 requires that the event
delay passed to __phy_write_sts() is an upper bound on the actual
delay.

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
---
Changes in v3:
- Say that the capture delay is measured from completion of the write,
  the rising MDC edge that clocks its last data bit (Sashiko)

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
index b64beade8dd9..5f8813d01a8e 100644
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
index bba94ce96195..08ab59fb9b88 100644
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
index 65d609ed69fb..b1f61e4f0034 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -161,6 +161,11 @@ struct bcm_ptp_capture {
 #define BCM_MAX_PULSE_8NS	((1U << 9) - 1)
 #define BCM_MAX_PERIOD_8NS	((1U << 30) - 1)
 
+/* Allowed for the PHY to capture its time after the rising MDC edge
+ * that clocks the last data bit of the framesync write.
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

