Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820715;
	b=pPMXT2TwTHjbrh8BiEogZjcB63gVCRVA1kX2U8DVmQx3bAmH0XDx/eWCKeqOpjLZgO2J
	 EVioT3ZudmVBD+CQhOsuSBXrwaDWhsU7jKjecoLfYyeuZSfs/q9dW+QNY7aKsbG1NZ+Ds
	 w8BVq8uvOEK5FN9zUeAuHrTcXPg1UpKwWyYuByn2MfjXjjnpf9lTCLxxhUkhpLN/VXt5D
	 UnNtvhFmiOhmrV+33oJhY0u+rTW29nXKNF+Y0LnmCeP2A9wym69Ps6xKBapeNRNIOpo3y
	 HicYtPSfiSrjWltIXpSQlsj43wcUZ+9hITXjJWzpiT74qM2k0uQcFpZ5zl44lQu6ZUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820715;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SgJ7BK9z38GBLKp8mxDyHBEYHCSkmLsXlDmIbALFGSI=;
	b=qBoGKuS33ZmzbH8XsXxZk2USWlVtGtaWWew7GK6RcT0ERZopA6PwXuj5+Myn0BwVPla9
	 xsCJ/k6X9KZvDbCP1U7FpqdqkmcA2h/JQNd6vYeoMdKs9PWGwdP6+eEixemG3GOs8Sldx
	 er4M/a26Zln3BvX2o+5fs8cE9J/D4U7Zt7VOXUqxJhKZ/M300XopcPkR9BGGiaRFLgiIL
	 OV5uYzZAdKJjRh+TLl4WUCt/shjiUugK7eATsRCmMOASPAfBzy69dJt4cHanOSmxX1VrT
	 He1DWy2hTQj++YokuycTzPqgOQf20p0gn6QbKrCPsslLs1idGN9xNAgkQNGwywNnUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=oh+sID6m;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93276606A331;
	Mon, 16 Nov 2026 09:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93276606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=oh+sID6m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794820713;
	bh=BPD043+SMPaCp0olzTzGi087fGrg3ldseuRGBtPKZkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=oh+sID6m3rbTSEXklfmHVTwMLDYbmiOyVThP2nXus5VFX8uJdqUK9+6yCFHArut6f
	 Rl8UZPMKiSYztLrh9x+Xki2BWf8f0/XMj2VZMmb24rTus1jVSjXza0mmiGOOXxYK5/
	 YMp+p4Yg3dSXPWKk3nYrvjrPiUI5m3DC/QZS3szoQOavH2ioau7f3hG1JbxkfiD1l1
	 tzt1esxmFHOO2ZWZu8fyaHZPOUSn7dz5Ag+e14vYoH6/clIdGNcK8mXgnBu52CXpHj
	 32PvhPS4PLRbXtyXY49BYi+uj00ooc3fT3wQ5FAdFqiyWXdXztLGYh5/sILxU9xw9/
	 lp42JVuM4N4nQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id E27AF8D754; Mon, 16 Nov 2026 09:18:33 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Mon, 16 Nov 2026 06:17:57 -0300
Message-ID: <20261116091757.1656602-3-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
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

The driver reports "Supports Wake-on: ug" and accepts "wol g", but a
YT6801 in S5 ignores magic packets. At power-off stmmac_suspend() arms
the PMT register, but the chip's out-of-band WoL block stays disabled
as motorcomm_init() leaves it, the packet wake bit in WOL_CTRL is clear
and PME is turned off.

When powering off with Wake-on-LAN set, the interface up and wakeup
enabled for the device, keep PME enabled and arm the chip after
stmmac_suspend():

 - Enable OOB WoL. Without it the chip does not wake.
 - Write the MAC address in use to the first address filter again.
   Enabling OOB WoL reloads the factory address there. Without the
   rewrite the chip wakes on the factory address and ignores the one
   in use. The rewrite follows a 2 ms wait, as in the vendor driver:
   without the wait the reload lands after the rewrite.
 - Set the packet wake enable bit in WOL_CTRL. Without it the chip
   does not wake.

The sequence follows the vendor driver, with two differences. The
vendor also sets bit 9 of LPW_CTRL. The chip wakes without it, so it is
left alone. The vendor puts the function in D3hot. Here it stays in D0.
With MAC Wake-on-LAN phylink keeps the PHY running and phylib keeps
polling it until power is removed. In D3hot the MDIO registers read as
all-ones, the poll fails with -EBUSY and phylib warns from
phy_error_precise(). That warning was seen 111 ms after entering D3hot
on a normal power-off.

The PHY is left at the negotiated speed. Reboot and kexec are not
armed: OOB WoL can only be disabled again by a chip reset, so it is
enabled only when powering off, and the next probe resets the chip. If
the interface is down at power-off, the system does not wake.

Suspend is not changed. Hibernation that powers off through the
shutdown path arms the chip the same way. Neither was tested.

Tested on a Celeron N3350 mini PC, magic packets sent from another host
75 s after power-off:

  net-next  wol g                         no wake, 3 of 3
  patched   wol g                         wake, 8 of 8 (28-31 s to ping)
  patched   wol u                         wake on unicast, 1 of 1
  patched   wol d                         no wake, 3 of 3
  patched   wol g, interface down         no wake, 1 of 1
  patched   wol g, power/wakeup disabled  no wake, 1 of 1
  patched   wol g, reboot                 reboots, link back, 3 of 3

The kernel log of each of these shutdowns, read back after the next
boot, shows no warning from the shutdown path.

A second board, a PSJ8500-N97 mini PC (Intel N97), behaves the same.

Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 68 ++++++++++++++++++-
 1 file changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 1e142ad39e33..034547ad1e98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -27,6 +27,9 @@
 #define EPHY_CTRL				0x1004
 /* Clearing this bit asserts resets for internal MDIO bus and PHY */
 #define  EPHY_MDIO_PHY_RESET			BIT(0)
+#define WOL_CTRL				0x100c
+/* Magic and remote wake-up packet enable */
+#define  WOL_CTRL_PKT_EN			BIT(1)
 #define OOB_WOL_CTRL				0x1010
 #define  OOB_WOL_CTRL_DIS			BIT(0)
 #define MGMT_INT_CTRL0				0x1100
@@ -204,9 +207,51 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
 	return 0;
 }
 
+/*
+ * Arm the chip to wake the system from S5. stmmac_suspend() has already
+ * programmed the PMT register of the GMAC. The rest lives in the wrapper.
+ */
+static void motorcomm_arm_s5_wake(struct net_device *ndev)
+{
+	struct stmmac_priv *spriv = netdev_priv(ndev);
+	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
+	u32 reg;
+
+	/*
+	 * motorcomm_init() disables OOB WoL right after the chip reset, as
+	 * normal operation requires. With it disabled the chip ignores wake
+	 * packets once the system is off. Once it has been enabled, only a
+	 * chip reset disables it again, so enable it only when powering off.
+	 */
+	reg = readl(priv->base + OOB_WOL_CTRL);
+	reg &= ~OOB_WOL_CTRL_DIS;
+	writel(reg, priv->base + OOB_WOL_CTRL);
+
+	/*
+	 * Enabling OOB WoL reloads the address from eFuse into the first
+	 * MAC address filter. Write the address in use again, or the chip
+	 * wakes on the factory address only. The reload is not immediate:
+	 * without the wait, taken from the vendor driver, it overwrites
+	 * the address written here.
+	 */
+	usleep_range(2000, 3000);
+
+	rtnl_lock();
+	phylink_rx_clk_stop_block(spriv->phylink);
+	stmmac_set_umac_addr(spriv, spriv->hw, ndev->dev_addr, 0);
+	phylink_rx_clk_stop_unblock(spriv->phylink);
+	rtnl_unlock();
+
+	reg = readl(priv->base + WOL_CTRL);
+	reg |= WOL_CTRL_PKT_EN;
+	writel(reg, priv->base + WOL_CTRL);
+}
+
 static void motorcomm_shutdown(struct pci_dev *pdev)
 {
 	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
+	struct stmmac_priv *spriv = netdev_priv(ndev);
+	bool wake;
 
 	/*
 	 * A failed resume leaves the netdev detached with NAPI disabled, and
@@ -215,14 +260,31 @@ static void motorcomm_shutdown(struct pci_dev *pdev)
 	if (!netif_device_present(ndev))
 		return;
 
-	/* Stop the device before reboot, kexec or power-off */
+	wake = system_state == SYSTEM_POWER_OFF && netif_running(ndev) &&
+	       spriv->wolopts && device_may_wakeup(&pdev->dev);
+
+	/*
+	 * Stop the device before reboot, kexec or power-off. With
+	 * Wake-on-LAN set, this arms the PMT register and keeps the PHY up.
+	 */
 	stmmac_suspend(&pdev->dev);
 
 	/*
 	 * stmmac_pci_plat_suspend() enables PME if wakeup is enabled for the
-	 * device. Nothing arms the chip to wake the system, so undo that.
+	 * device. Keep it only when the chip is armed.
+	 */
+	if (!wake) {
+		pci_wake_from_d3(pdev, false);
+		return;
+	}
+
+	/*
+	 * The device is left in D0. The platform removes main power anyway,
+	 * and with MAC Wake-on-LAN phylib keeps polling the PHY until then:
+	 * in D3hot the MDIO registers read as all-ones and the poll fails
+	 * with a warning.
 	 */
-	pci_wake_from_d3(pdev, false);
+	motorcomm_arm_s5_wake(ndev);
 }
 
 static struct plat_stmmacenet_data *
-- 
2.56.1

