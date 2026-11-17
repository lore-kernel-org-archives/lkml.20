Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895383;
	b=q3gUKXSgUkvqSdXUQDzeAH0gnosb432BX1pzIEsRid6fYgjmD7pn7slYPxTfbd+LtHBO
	 NgPsvg32X4uzYkWPCK0UBFnbGsqbrMdD9SrV7WC5C5TUZ5nExnB+bvO3by0tVvV35ktPm
	 4o0/1735TBURVxSEa9BIAppl+2Bn5IgZMBeuzBrXi4YJQRWefiZJGYr/7hSlLfxgozG4A
	 Xt3e3JqvpVYS2RPyet+FpHhc0t4CsJfb4YF4Wsc6vfR/njjxIdVtn+Fczbx5FLKsb/Ov/
	 SeLJ6Ay+UprVlpcEUMHBawSqYTe1nSCAqJiqBsN7PSW4ISG/yFXBXovTFfQ42y0tDBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895383;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=f7VlE0zcGKb0b4GYQW7+3g3TlX7RHOh3p13S4cKGkUs=;
	b=bnMwBPnSKHgBiLJeFbN8FfIP3PDrg9BHUkA0DbgCkSehYJmhepMRmU6wWtKMgiFSExjK
	 4aJGbk44EoSMxZmwdtpXDgnGW6+D5PDkBFmN7X/sdVlY4KrGFR38ZrZXrZ/ObWC+XCL2b
	 nxNx1WmfnuC+SK8++JJ/SahciRe+4/bqS3kj3kZ5Cr9GKUG+lExCSwPmR6fbP/DgE9O6a
	 b+mIugsHZoxJYGWctKotF9BuDe9QvkiTDv3zT2twg54g9TPhOLOKIOL6S/TLB40kRmbug
	 6X7ZYOOGx4clJHQJcRvZ3OFkqlfXhOTkMo7uMGq3OJAIUUPdbKsE3Sq76E3Z/q0ikHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=L4dSc0gF;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A90606A323;
	Tue, 17 Nov 2026 06:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A90606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=L4dSc0gF
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH61OvH44166715, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1794895285;
	bh=f7VlE0zcGKb0b4GYQW7+3g3TlX7RHOh3p13S4cKGkUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=L4dSc0gF0G1wWK5v4D0rCHjDsM5EqHzkShID0mWWW0NH3dcZ1SKLJhY8780zMBnRV
	 t3ZgEzjEbrRgc5ITS65mdcyyfWsQu5E5o6C+DUy5/4vp0KNJNDQatEwmISf137bd1W
	 mAN+7pu6ex1zrAVorwTq7AJUb/qK397MdV/CaqbTkM85e9P+XkovCEjKJpmYyPj7tD
	 umUkBOIffBfZxyLBi5JCCeT9ogUJF42dvU31JVTAWNtoEoH6uLkbjzROVSy1O3LZU6
	 GHCqeBY2RlT3sK1kCbRecHQb1xsiTthvRJh2SN7bA2pgQsbNO4vG++SIt2bdlR2n+w
	 iHxqxCx+fiCQA==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH61OvH44166715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 14:01:24 +0800
Received: from RS-EX-MBS1.realsil.com.cn (172.29.17.101) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:01:24 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS1.realsil.com.cn
 (172.29.17.101) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 14:01:24 +0800
From: javen <javen_xu@realsil.com.cn>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <nb@tipi-net.de>, <maxime.chevallier@bootlin.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<daniel@makrotopia.org>, <vladimir.oltean@nxp.com>, Javen Xu
	<javen_xu@realsil.com.cn>
Subject: [PATCH net-next v3 2/3] net: phy: realtek: add PTP clock support for RTL8127a
Date: Tue, 17 Nov 2026 14:01:19 +0800
Message-ID: <20261117060120.1175-3-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261117060120.1175-1-javen_xu@realsil.com.cn>
References: <20261117060120.1175-1-javen_xu@realsil.com.cn>
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
Content-Type: text/plain

From: Javen Xu <javen_xu@realsil.com.cn>

The internal PHY of RTL8127A (RTL8261C, PHY ID 0x001cc890) contains a
PTP block with a free running clock that can be read, set, stepped and
frequency adjusted through vendor MMD registers.

Register a PTP hardware clock for it. All register accesses go through
the normal blocking MDIO path, multi register sequences are serialized
by a driver mutex. The clock is started from the system tinme unless it
is already running, so a PHY re-initialization does not make it jump.

Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
---
Changes in v3:
   - Keep the clock running across PHY re-initializations, only start it
     from the system time if the counter has been reset
   - Only bracket the latching EXEC write with the system timestamps in
     gettimex64()
   - Clear phydev->priv in remove()
   - Add defines for the PHY reset register
   - Depend on NETWORK_PHY_TIMESTAMPING from this patch on
---
 drivers/net/phy/realtek/Kconfig        |  11 +
 drivers/net/phy/realtek/Makefile       |   1 +
 drivers/net/phy/realtek/realtek.h      |  20 ++
 drivers/net/phy/realtek/realtek_main.c |  19 +-
 drivers/net/phy/realtek/realtek_ptp.c  | 401 +++++++++++++++++++++++++
 5 files changed, 451 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/realtek/realtek_ptp.c

diff --git a/drivers/net/phy/realtek/Kconfig b/drivers/net/phy/realtek/Kconfig
index a741b34d193e..feb9a7fd1582 100644
--- a/drivers/net/phy/realtek/Kconfig
+++ b/drivers/net/phy/realtek/Kconfig
@@ -13,4 +13,15 @@ config REALTEK_PHY_HWMON
 	help
 	  Optional hwmon support for the temperature sensor
 
+config REALTEK_PHY_PTP
+	bool "PTP support for Realtek PHYs"
+	default y
+	depends on PTP_1588_CLOCK && NETWORK_PHY_TIMESTAMPING
+	depends on !(REALTEK_PHY=y && PTP_1588_CLOCK=m)
+	help
+	  Optional PTP hardware clock support for the internal PHY of
+	  RTL8127A. The clock is provided by the PHY itself and can be
+	  read and adjusted through the PTP clock device, no support from
+	  the MAC driver is needed.
+
 endif # REALTEK_PHY
diff --git a/drivers/net/phy/realtek/Makefile b/drivers/net/phy/realtek/Makefile
index dd21cf87f2f1..450bd05b7ef9 100644
--- a/drivers/net/phy/realtek/Makefile
+++ b/drivers/net/phy/realtek/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 realtek-y			+= realtek_main.o
 realtek-$(CONFIG_REALTEK_PHY_HWMON) += realtek_hwmon.o
+realtek-$(CONFIG_REALTEK_PHY_PTP) += realtek_ptp.o
 obj-$(CONFIG_REALTEK_PHY)	+= realtek.o
diff --git a/drivers/net/phy/realtek/realtek.h b/drivers/net/phy/realtek/realtek.h
index a39b44fa18a0..384bde5fff3b 100644
--- a/drivers/net/phy/realtek/realtek.h
+++ b/drivers/net/phy/realtek/realtek.h
@@ -7,4 +7,24 @@
 
 int rtl822x_hwmon_init(struct phy_device *phydev);
 
+#if IS_ENABLED(CONFIG_REALTEK_PHY_PTP)
+int rtl8127a_ptp_probe(struct phy_device *phydev);
+void rtl8127a_ptp_remove(struct phy_device *phydev);
+int rtl8127a_ptp_config_init(struct phy_device *phydev);
+#else
+static inline int rtl8127a_ptp_probe(struct phy_device *phydev)
+{
+	return 0;
+}
+
+static inline void rtl8127a_ptp_remove(struct phy_device *phydev)
+{
+}
+
+static inline int rtl8127a_ptp_config_init(struct phy_device *phydev)
+{
+	return 0;
+}
+#endif
+
 #endif /* REALTEK_H */
diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
index ca2d515b77b3..e21d10e57a13 100644
--- a/drivers/net/phy/realtek/realtek_main.c
+++ b/drivers/net/phy/realtek/realtek_main.c
@@ -1839,6 +1839,21 @@ static int rtl822x_probe(struct phy_device *phydev)
 	return 0;
 }
 
+static int rtl_internal_nbaset_probe(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = rtl822x_probe(phydev);
+	if (ret)
+		return ret;
+
+	/* Only the internal PHY of RTL8127A has a PTP block */
+	if (phydev->phy_id == RTL_8261C)
+		return rtl8127a_ptp_probe(phydev);
+
+	return 0;
+}
+
 /* RTL822x cannot access MDIO_MMD_VEND2 via MII_MMD_CTRL/MII_MMD_DATA.
  * A mapping to use paged access needs to be used instead.
  * All other MMD devices can be accessed as usual.
@@ -3413,7 +3428,9 @@ static struct phy_driver realtek_drvs[] = {
 		.match_phy_device = rtl_internal_nbaset_match_phy_device,
 		.name		= "Realtek Internal NBASE-T PHY",
 		.flags		= PHY_IS_INTERNAL,
-		.probe		= rtl822x_probe,
+		.probe		= rtl_internal_nbaset_probe,
+		.remove		= rtl8127a_ptp_remove,
+		.config_init	= rtl8127a_ptp_config_init,
 		.get_features	= rtl822x_get_features,
 		.config_aneg	= rtl822x_config_aneg,
 		.read_status	= rtl822x_read_status,
diff --git a/drivers/net/phy/realtek/realtek_ptp.c b/drivers/net/phy/realtek/realtek_ptp.c
new file mode 100644
index 000000000000..9622571249f4
--- /dev/null
+++ b/drivers/net/phy/realtek/realtek_ptp.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * PTP hardware clock support for the internal PHY of RTL8127A
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/netdevice.h>
+#include <linux/phy.h>
+#include <linux/ptp_clock_kernel.h>
+#include <linux/timekeeping.h>
+
+#include "realtek.h"
+
+#define RTL8127A_PTP_CTL		0xe400
+#define	RTL8127A_PTP_CTL_EN		BIT(0)
+#define	RTL8127A_PTP_CTL_TYPE_3		0x003f
+#define RTL8127A_PTP_INER		0xe402
+#define RTL8127A_PTP_INSR		0xe404
+#define	RTL8127A_PTP_INT_RX_TS		BIT(2)
+#define	RTL8127A_PTP_INT_TX_TS		BIT(3)
+#define RTL8127A_PTP_SYNCE_CTL		0xe406
+#define	RTL8127A_PTP_SYNCE_EN		BIT(0)
+#define RTL8127A_PTP_GEN_CFG		0xe408
+#define	RTL8127A_PTP_INT_CLR_MODE	BIT(0)
+#define RTL8127A_PTP_CLK_CFG		0xe410
+#define	RTL8127A_PTP_CLK_CFG_EXEC	BIT(0)
+#define	RTL8127A_PTP_CLK_CFG_MODE	GENMASK(3, 1)
+#define RTL8127A_PTP_RESET_SEC		10
+#define RTL8127A_PHY_RST_CTL		0xa640
+#define RTL8127A_PHY_RST		BIT(15)
+/* Time registers */
+#define RTL8127A_PTP_CFG_TIME		0xe412
+#define	RTL8127A_PTP_NS_LO		0x0
+#define	RTL8127A_PTP_NS_HI		0x2
+#define	RTL8127A_PTP_S_LO		0x4
+#define	RTL8127A_PTP_S_MI		0x6
+#define	RTL8127A_PTP_S_HI		0x8
+#define	RTL8127A_PTP_NS_HI_MASK		GENMASK(13, 0)
+#define	RTL8127A_PTP_NSEC_MASK		GENMASK(29, 0)
+#define	RTL8127A_PTP_SEC_MASK		GENMASK_ULL(47, 0)
+#define	RTL8127A_PTP_RATE_HI_MASK	GENMASK(21, 16)
+
+#define RTL8127A_PTP_MAX_ADJ		488281
+
+/* RTL8127A_PTP_CLK_CFG clock adjust modes */
+enum rtl8127a_ptp_clkadj_mode {
+	RTL8127A_PTP_DIRECT_READ	= 4,
+	RTL8127A_PTP_DIRECT_WRITE	= 6,
+	RTL8127A_PTP_INC_STEP		= 8,
+	RTL8127A_PTP_DEC_STEP		= 10,
+	RTL8127A_PTP_RATE_WRITE		= 14,
+};
+
+struct rtl8127a_ptp {
+	struct phy_device *phydev;
+	struct ptp_clock_info info;
+	struct ptp_clock *clock;
+	struct mutex lock;	/* serializes PTP register access sequences */
+};
+
+static int rtl8127a_ptp_read(struct rtl8127a_ptp *ptp, u16 reg)
+{
+	return phy_read_mmd(ptp->phydev, MDIO_MMD_VEND2, reg);
+}
+
+static int rtl8127a_ptp_write(struct rtl8127a_ptp *ptp, u16 reg, u16 val)
+{
+	return phy_write_mmd(ptp->phydev, MDIO_MMD_VEND2, reg, val);
+}
+
+/* Unlike phy_modify_mmd() always write the register back, some of the
+ * bits are commands to the PTP block.
+ */
+static int rtl8127a_ptp_modify(struct rtl8127a_ptp *ptp, u16 reg, u16 mask,
+			       u16 set)
+{
+	int val = rtl8127a_ptp_read(ptp, reg);
+
+	if (val < 0)
+		return val;
+
+	return rtl8127a_ptp_write(ptp, reg, (val & ~mask) | set);
+}
+
+/* Poll until (reg & mask) is non-zero (set == true) or zero (set == false).
+ * Returns the last register value read, or a negative error code.
+ */
+static int rtl8127a_ptp_poll(struct rtl8127a_ptp *ptp, u16 reg, u16 mask,
+			     bool set)
+{
+	int ret, val;
+
+	ret = read_poll_timeout(rtl8127a_ptp_read, val,
+				val < 0 || !!(val & mask) == set, 1, 1000,
+				false, ptp, reg);
+	if (val < 0)
+		ret = val;
+	if (ret) {
+		if (net_ratelimit())
+			phydev_err(ptp->phydev,
+				   "PTP reg 0x%04x poll failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	return val;
+}
+
+static int rtl8127a_ptp_clkadj_sts(struct rtl8127a_ptp *ptp,
+				   enum rtl8127a_ptp_clkadj_mode mode,
+				   struct ptp_system_timestamp *sts)
+{
+	int val, ret;
+
+	val = rtl8127a_ptp_read(ptp, RTL8127A_PTP_CLK_CFG);
+	if (val < 0)
+		return val;
+
+	val &= ~RTL8127A_PTP_CLK_CFG_MODE;
+	val |= RTL8127A_PTP_CLK_CFG_EXEC | mode;
+
+	/* Only the exec write latches the counter. */
+	ptp_read_system_prets(sts);
+	ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_CLK_CFG, val);
+	ptp_read_system_postts(sts);
+	if (ret)
+		return ret;
+
+	ret = rtl8127a_ptp_poll(ptp, RTL8127A_PTP_CLK_CFG,
+				RTL8127A_PTP_CLK_CFG_EXEC, false);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int rtl8127a_ptp_clkadj(struct rtl8127a_ptp *ptp,
+			       enum rtl8127a_ptp_clkadj_mode mode)
+{
+	return rtl8127a_ptp_clkadj_sts(ptp, mode, NULL);
+}
+
+static int rtl8127a_ptp_read_time(struct rtl8127a_ptp *ptp, u16 base,
+				  struct timespec64 *ts)
+{
+	static const u16 regs[] = {
+		RTL8127A_PTP_NS_HI, RTL8127A_PTP_NS_LO,
+		RTL8127A_PTP_S_HI, RTL8127A_PTP_S_MI, RTL8127A_PTP_S_LO,
+	};
+	int val[ARRAY_SIZE(regs)];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(regs); i++) {
+		val[i] = rtl8127a_ptp_read(ptp, base + regs[i]);
+		if (val[i] < 0)
+			return val[i];
+	}
+
+	ts->tv_nsec = (val[0] & RTL8127A_PTP_NS_HI_MASK) << 16 | val[1];
+	ts->tv_sec = (u64)val[2] << 32 | (u64)val[3] << 16 | val[4];
+
+	return 0;
+}
+
+static int rtl8127a_ptp_write_time(struct rtl8127a_ptp *ptp,
+				   const struct timespec64 *ts)
+{
+	u64 sec = ts->tv_sec & RTL8127A_PTP_SEC_MASK;
+	u32 nsec = ts->tv_nsec & RTL8127A_PTP_NSEC_MASK;
+	const struct {
+		u16 reg;
+		u16 val;
+	} regs[] = {
+		{ RTL8127A_PTP_NS_LO, nsec },
+		{ RTL8127A_PTP_NS_HI, nsec >> 16 },
+		{ RTL8127A_PTP_S_LO, sec },
+		{ RTL8127A_PTP_S_MI, sec >> 16 },
+		{ RTL8127A_PTP_S_HI, sec >> 32 },
+	};
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(regs); i++) {
+		ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_CFG_TIME + regs[i].reg,
+					 regs[i].val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rtl8127a_ptp_hwtstamp_enable(struct rtl8127a_ptp *ptp, bool enable)
+{
+	int ret;
+
+	mutex_lock(&ptp->lock);
+
+	ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_SYNCE_CTL,
+				  RTL8127A_PTP_SYNCE_EN, 0);
+	if (ret)
+		goto out;
+
+	if (enable) {
+		ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_INER, 0,
+					  RTL8127A_PTP_INT_RX_TS |
+					  RTL8127A_PTP_INT_TX_TS);
+		if (ret)
+			goto out;
+
+		ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_GEN_CFG, 0,
+					  RTL8127A_PTP_INT_CLR_MODE);
+		if (ret)
+			goto out;
+
+		ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_INSR, 0xffff);
+		if (ret)
+			goto out;
+
+		ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_CTL,
+					 RTL8127A_PTP_CTL_TYPE_3 | BIT(12));
+	} else {
+		ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_INER,
+					  RTL8127A_PTP_INT_RX_TS |
+					  RTL8127A_PTP_INT_TX_TS, 0);
+		if (ret)
+			goto out;
+
+		ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_CTL,
+					  RTL8127A_PTP_CTL_EN, 0);
+	}
+	if (ret)
+		goto out;
+
+	ret = rtl8127a_ptp_modify(ptp, RTL8127A_PHY_RST_CTL, 0,
+				  RTL8127A_PHY_RST);
+out:
+	mutex_unlock(&ptp->lock);
+
+	return ret;
+}
+
+static int rtl8127a_ptp_settime(struct rtl8127a_ptp *ptp,
+				const struct timespec64 *ts)
+{
+	int ret;
+
+	mutex_lock(&ptp->lock);
+	ret = rtl8127a_ptp_write_time(ptp, ts);
+	if (!ret)
+		ret = rtl8127a_ptp_clkadj(ptp, RTL8127A_PTP_DIRECT_WRITE);
+	mutex_unlock(&ptp->lock);
+
+	return ret;
+}
+
+static int rtl8127a_ptp_adjfine(struct ptp_clock_info *info, long scaled_ppm)
+{
+	struct rtl8127a_ptp *ptp = container_of(info, struct rtl8127a_ptp, info);
+	s32 ppb = scaled_ppm_to_ppb(scaled_ppm);
+	u32 rate;
+	int ret;
+
+	rate = div_u64((u64)abs(ppb) << 32, NSEC_PER_SEC);
+	if (ppb < 0)
+		rate = -rate;
+
+	mutex_lock(&ptp->lock);
+	ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_CFG_TIME + RTL8127A_PTP_NS_LO,
+				 rate);
+	if (ret)
+		goto out;
+
+	ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_CFG_TIME + RTL8127A_PTP_NS_HI,
+				 FIELD_GET(RTL8127A_PTP_RATE_HI_MASK, rate));
+	if (ret)
+		goto out;
+
+	ret = rtl8127a_ptp_clkadj(ptp, RTL8127A_PTP_RATE_WRITE);
+out:
+	mutex_unlock(&ptp->lock);
+
+	return ret;
+}
+
+static int rtl8127a_ptp_adjtime(struct ptp_clock_info *info, s64 delta)
+{
+	struct rtl8127a_ptp *ptp = container_of(info, struct rtl8127a_ptp, info);
+	struct timespec64 d = ns_to_timespec64(abs(delta));
+	int ret;
+
+	mutex_lock(&ptp->lock);
+	ret = rtl8127a_ptp_write_time(ptp, &d);
+	if (!ret)
+		ret = rtl8127a_ptp_clkadj(ptp, delta < 0 ?
+						RTL8127A_PTP_DEC_STEP :
+						RTL8127A_PTP_INC_STEP);
+	mutex_unlock(&ptp->lock);
+
+	return ret;
+}
+
+static int rtl8127a_ptp_gettimex64(struct ptp_clock_info *info,
+				   struct timespec64 *ts,
+				   struct ptp_system_timestamp *sts)
+{
+	struct rtl8127a_ptp *ptp = container_of(info, struct rtl8127a_ptp, info);
+	int ret;
+
+	mutex_lock(&ptp->lock);
+	ret = rtl8127a_ptp_clkadj_sts(ptp, RTL8127A_PTP_DIRECT_READ, sts);
+	if (!ret)
+		ret = rtl8127a_ptp_read_time(ptp, RTL8127A_PTP_CFG_TIME, ts);
+	mutex_unlock(&ptp->lock);
+
+	return ret;
+}
+
+static int rtl8127a_ptp_settime64(struct ptp_clock_info *info,
+				  const struct timespec64 *ts)
+{
+	struct rtl8127a_ptp *ptp = container_of(info, struct rtl8127a_ptp, info);
+
+	return rtl8127a_ptp_settime(ptp, ts);
+}
+
+static const struct ptp_clock_info rtl8127a_ptp_info = {
+	.owner		= THIS_MODULE,
+	.name		= "RTL8127A PHC",
+	.max_adj	= RTL8127A_PTP_MAX_ADJ,
+	.adjfine	= rtl8127a_ptp_adjfine,
+	.adjtime	= rtl8127a_ptp_adjtime,
+	.gettimex64	= rtl8127a_ptp_gettimex64,
+	.settime64	= rtl8127a_ptp_settime64,
+};
+
+int rtl8127a_ptp_config_init(struct phy_device *phydev)
+{
+	struct rtl8127a_ptp *ptp = phydev->priv;
+	struct timespec64 ts;
+	int ret;
+
+	if (!ptp)
+		return 0;
+
+	/* Keep the clock running across a PHY re-init, a running PTP
+	 * client would otherwise see it jump. Only start it from the
+	 * system time if the counter has been reset.
+	 */
+	ret = rtl8127a_ptp_gettimex64(&ptp->info, &ts, NULL);
+	if (ret)
+		return ret;
+
+	if (ts.tv_sec >= RTL8127A_PTP_RESET_SEC)
+		return 0;
+
+	ktime_get_real_ts64(&ts);
+
+	return rtl8127a_ptp_settime(ptp, &ts);
+}
+
+int rtl8127a_ptp_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct rtl8127a_ptp *ptp;
+	int ret;
+
+	ptp = devm_kzalloc(dev, sizeof(*ptp), GFP_KERNEL);
+	if (!ptp)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &ptp->lock);
+	if (ret)
+		return ret;
+
+	ptp->phydev = phydev;
+	ptp->info = rtl8127a_ptp_info;
+
+	ret = rtl8127a_ptp_hwtstamp_enable(ptp, false);
+	if (ret)
+		return ret;
+
+	ptp->clock = ptp_clock_register(&ptp->info, dev);
+	if (IS_ERR(ptp->clock))
+		return PTR_ERR(ptp->clock);
+
+	phydev->priv = ptp;
+
+	return 0;
+}
+
+void rtl8127a_ptp_remove(struct phy_device *phydev)
+{
+	struct rtl8127a_ptp *ptp = phydev->priv;
+
+	if (!ptp)
+		return;
+
+	rtl8127a_ptp_hwtstamp_enable(ptp, false);
+	ptp_clock_unregister(ptp->clock);
+	phydev->priv = NULL;
+}
-- 
2.43.0

