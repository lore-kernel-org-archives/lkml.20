Received: from a4i850.smtp2go.com (a4i850.smtp2go.com [158.120.83.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6D49553A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.83.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641438; cv=none; b=bFCslby6ea1iMaSo+bnytz5z04yefpQio1E+jiEz7TWJu6ttvxJPdcSHD8bSXAYdu6tMCDJWUn9JGhGZBoGh27ecMT73XZ453aOOhBpEz9NOMASfNvVaMvQ+qFFqFtoQ7QAwJ+DsWkdg3DvKWE2/ldPyyjiTAkCyr3SE4AXG8cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641438; c=relaxed/simple;
	bh=KurMqRYTtfK7Q2u2yEmmD+g6KxcgzV/eyli+dy2Qm2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CoLS2Dc3SUOWyrYpwGI8l+jqId9L3sSDQQJxEfklMx31l5s9AGnFqa4n4otSenAZVqxQYswfioQJsA/i7ulxszWw5PmDtIDP23PNE2sx+FtbnA9MYWQpcplxJraixOX8Xsmp6eEb/BzkK7kbuyIm1VKYwJHI2UEcS7o4HSrDc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dilluti0n.com; spf=pass smtp.mailfrom=em840244.dilluti0n.com; dkim=pass (2048-bit key) header.d=dilluti0n.com header.i=@dilluti0n.com header.b=EuhGIoDG; arc=none smtp.client-ip=158.120.83.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dilluti0n.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em840244.dilluti0n.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dilluti0n.com header.i=@dilluti0n.com header.b="EuhGIoDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dilluti0n.com;
 i=@dilluti0n.com; q=dns/txt; s=s840244; t=1791640529; h=from : subject
 : to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=r2qIUuIj7U6tM96spZZJ0rqFYcbWjd0y9e3WDSS49yk=;
 b=EuhGIoDGpy/Bxe2xo2y2qWMNnwOiFf8WaPFpcCvACO323wrr82SP0L8Wfwfd0oCNqsfEl
 twtA7rC3YHy2vrPJSElYYzamlz47ugv/ajIhFQu97WVZjWsK1AQx3KQPRwzdCoA7sQsV6mP
 eEklPaJ85hgmEKaimqcYpMKCHoPYt1PfyaVGJfclM8wJg69ItLXUFrALygl4dsybL0UHitU
 yKwKk+mgq5Fvh5QMqbe/jgFCGCpz8KvaX/ag4xqnewh3zk0wVN38GIqLswWZIHBp+3m/rVb
 NqstIXnt2W1jxVRzLYWaGfvMaN1BtC2/0SLoaqYwXSfkmxOgmmboHN8D3Xgg==
Received: from [10.40.244.132] (helo=dilluti0n.com)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <hskim@dilluti0n.com>)
	id 1xFXXn-4o5NDgrmnGh-t6LZ;
	Sat, 10 Oct 2026 13:55:23 +0000
Received: from localhost (<unknown> [10.42.0.2])
	by dilluti0n.com (OpenSMTPD) with ESMTP id c195b92f;
	Sat, 10 Oct 2026 13:55:15 +0000 (UTC)
From: Hee-Suk Kim <hskim@dilluti0n.com>
To: netdev@vger.kernel.org
Cc: Hee-Suk Kim <hskim@dilluti0n.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	nic_swsd@realtek.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] r8169: allow Giga Lite fallback on RTL8168EP
Date: Sat, 10 Oct 2026 22:53:52 +0900
Message-ID: <20261010135356.85454-1-hskim@dilluti0n.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 840244m:840244atORciv:840244sg2a5K__8p
X-smtpcorp-track: JoBaAKvogW9T.L-8bRn06nRlz.bmRUAwQQgvy

Giga Lite is a Realtek proprietary mode which allows links of up to
500 Mbps over two-pair cabling. In South Korea, it is widely used to
support 500 Mbps plans by most ISPs. The vendor driver [1] sets PHY
page 0xa42, reg 0x14, bit 9 to allow it on RTL8168H and FP. The driver
does not handle RTL8168EP but I confirmed the same works for it by
setting the PHY register via SIOCSMIIREG on an SK Broadband 500 Mbps
plan [2].

With the bit set, the link still came up at about 470 Mbps even when
only 10/100 was advertised. So set it only when autonegotiating with
1000baseT/Full advertised, and clear it otherwise, to respect a lower
advertised speed. This matches what the vendor driver does for
RTL8168H and FP.

PHYSR reports 0x30 in its speed field to denote a Giga Lite link. This
value is not handled in rtlgen_decode_physr(), so the reported speed
varies between 100 and 1000 Mbps on the same link. Handle it to report
1000, as there is no 500 Mbps uAPI.

[1] https://github.com/mtorromeo/r8168/blob/b3e24e4aa74a3561618d0abf01b708bd55def57a/src/r8168_n.c#L6375-L6390
[2] https://www.tworld.co.kr/web/product/callplan/NI00000567

Assisted-by: LLM
Signed-off-by: Hee-Suk Kim <hskim@dilluti0n.com>
---
Test results on a ThinkPad T14 Gen 5 (RTL8168ep/8111ep, XID 502) with
an SK Broadband 500 Mbps plan ("before"/"after" = without/with this
patch, throughput by fast.com):

  kernel  bit 9          advertised   PHYSR  reported     throughput
  ------  -------------  -----------  -----  -----------  ----------
  before  clear          10/100/1000  0x10   100          94 Mbps
  before  set manually   10/100/1000  0x30   100 or 1000  470 Mbps
  after   set manually   10/100       0x30   1000         470 Mbps
  after   clear          10/100       0x10   100          95 Mbps
  after   set            10/100/1000  0x30   1000         470 Mbps

"set manually" means bit 9 was set via SIOCSMIIREG. Happy to share the
script if useful.

 MAINTAINERS                               |  1 +
 drivers/net/ethernet/realtek/r8169_main.c |  4 ++++
 drivers/net/phy/realtek/realtek_main.c    | 26 +++++++++++++++++++++++
 include/linux/realtek_phy.h               | 10 +++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 include/linux/realtek_phy.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b5a0e7..a54370ae80a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9789,6 +9789,7 @@ F:	include/linux/phy_fixed.h
 F:	include/linux/phy_link_topology.h
 F:	include/linux/phylib_stubs.h
 F:	include/linux/platform_data/mdio-bcm-unimac.h
+F:	include/linux/realtek_phy.h
 F:	include/net/phy/
 F:	include/trace/events/mdio.h
 F:	include/uapi/linux/mdio.h
diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 43c46d483eb8..fe49197c4d7b 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -28,6 +28,7 @@
 #include <linux/bitfield.h>
 #include <linux/phylink.h>
 #include <linux/prefetch.h>
+#include <linux/realtek_phy.h>
 #include <linux/ipv6.h>
 #include <linux/unaligned.h>
 #include <net/ip6_checksum.h>
@@ -5619,6 +5620,9 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
 		return -EUNATCH;
 	}

+	if (tp->mac_version == RTL_GIGA_MAC_VER_51)
+		tp->phydev->dev_flags |= RTL_PHY_F_GIGA_LITE;
+
 	/* Keep EEE off but the version stays EEE-capable so that link-up
 	 * still clears the MAC TX-LPI bits.
 	 */
diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
index e14960192e79..319122270bca 100644
--- a/drivers/net/phy/realtek/realtek_main.c
+++ b/drivers/net/phy/realtek/realtek_main.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/pm_wakeirq.h>
+#include <linux/realtek_phy.h>
 #include <linux/netdevice.h>
 #include <linux/module.h>
 #include <linux/delay.h>
@@ -1706,6 +1707,7 @@ static void rtlgen_decode_physr(struct phy_device *phydev, int val)
 		phydev->speed = SPEED_100;
 		break;
 	case 0x0020:
+	case 0x0030:	/* Giga Lite */
 		phydev->speed = SPEED_1000;
 		break;
 	case 0x0200:
@@ -1735,6 +1737,29 @@ static void rtlgen_decode_physr(struct phy_device *phydev, int val)
 	}
 }

+static int rtlgen_config_aneg(struct phy_device *phydev)
+{
+	int ret = 0;
+
+	/* With Giga Lite enabled, the PHY can link in Giga Lite even
+	 * when 1000baseT/Full is not advertised.  Only allow it when
+	 * autonegotiating with 1000baseT/Full advertised, so that a
+	 * lower speed set by the user is respected.
+	 */
+	if (phydev->dev_flags & RTL_PHY_F_GIGA_LITE) {
+		bool en = phydev->autoneg == AUTONEG_ENABLE &&
+			  linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
+					    phydev->advertising);
+
+		ret = phy_modify_paged_changed(phydev, 0xa42, 0x14, BIT(9),
+					       en ? BIT(9) : 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	return __genphy_config_aneg(phydev, ret > 0);
+}
+
 static int rtlgen_read_status(struct phy_device *phydev)
 {
 	int ret, val;
@@ -3248,6 +3273,7 @@ static struct phy_driver realtek_drvs[] = {
 	}, {
 		.name		= "Generic FE-GE Realtek PHY",
 		.match_phy_device = rtlgen_match_phy_device,
+		.config_aneg	= rtlgen_config_aneg,
 		.read_status	= rtlgen_read_status,
 		.suspend	= genphy_suspend,
 		.resume		= rtlgen_resume,
diff --git a/include/linux/realtek_phy.h b/include/linux/realtek_phy.h
new file mode 100644
index 000000000000..7fcde616c070
--- /dev/null
+++ b/include/linux/realtek_phy.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _REALTEK_PHY_H
+#define _REALTEK_PHY_H
+
+#include <linux/bits.h>
+
+/* phy_device::dev_flags */
+#define RTL_PHY_F_GIGA_LITE	BIT(0)
+
+#endif /* _REALTEK_PHY_H */

base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
--
2.55.0
