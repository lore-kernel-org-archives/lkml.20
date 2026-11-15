Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734201;
	b=KDZ4GvbO+nGOal6wIaS0u8TLfalxvR+pwnI/vNGwsgDQI/eVw264Ql6M423giltdyq5A
	 xMe42IGG7d8Zl21MUNPzeuy8ZeFgis3Vn76FHOLUcoAhMt/PJQafPsq07rGv2lXB+GbaO
	 x5qLHjKE+FtPVBvh8hVE6ZiFwr4T8nLPFajLi6hrX+dMaQXTfXBPbh/0FEvqE3W1Mge6O
	 Vy4oBeJYobAp4TPmxOKN0MOrJjjLR44FqohONCZ9oGuW4jN6B2k84G5UJdmGO9mkyDbx0
	 oW9vtxKovP3VDqY3wthNHuH8fIkXgWm1Ro5wfxC+09yp3VSFNl+HEi3OsV8XD9JdsCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734201;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=VFfPv3wKcuX9N1VHsMNx2IAlOzO2GAMzpmOnX5q2q1s=;
	b=W9dzbpfmnmbi4m5Kl51dYovFxOoE311EM7x5FpMzSgHCzmvgx/zmekhY7ROpzx0uzXJP
	 FmN80FJ9oOA5ymP7tXvoZm7WZf+Bqjrm3Q9VuQ+435fSdEgKSTbZLur1WjOnCtzmf4Jkj
	 BWxfAxG1t0BZHFVQ3CvdYluHO0bNG3xLZ2596Ci0O+sfWvqCDnW7VkJsG5u859LUNHIaD
	 6VwBI4E1DbSvvLL2HjX3GDGGLReNa7+aVI+1o8mM9mUnC2ZyDN7m9Q7LHa9xAzhn3/8yE
	 qBjuEeg2b5ID+TCOM3WltdpkkswHrlAw/qYlBm12wSCUNV1QLGdLf/gaKASZjIa5awg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FlSb0Yr1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFA8606A31E;
	Sun, 15 Nov 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FlSb0Yr1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E4A1F000C4;
	Sun, 15 Nov 2026 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794734200;
	bh=VFfPv3wKcuX9N1VHsMNx2IAlOzO2GAMzpmOnX5q2q1s=;
	h=From:Date:Subject:To:Cc;
	b=FlSb0Yr1f7r0gLFyOAPKzi6+w0mcv7DpyRp5RusLjNQEoNjJRFQ/c6H8gsJ572Ach
	 H1fC0t5AH0Ocw8pjkbCf/u/GcD5Tdk338MNDpyp4qB9rikHJJvqxW09ciUGrS2cXVw
	 8H4XqKOQyDDVrZUHyJTDNKro4awe6jmuS2trcqdr09dQuIq0B9Zm3f/fGV8l6+3njM
	 3VedprbEwxmmkw42hXcHZ/HUtyWDNkc7/poBAxqvx+4a/SLf0J1HKRmqBO/vf93ZCl
	 4RnqGAnfX+aGJCy2CbJwG99gSkWtJrpSEx0Qp35culzJ3C3l5qaq3ZqQkVmKf0yka/
	 fosXZqU7sNcnw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 10:16:34 +0100
Subject: [PATCH RFC] wifi: ralink: Add RT2880F iNIC PCI driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-ralink-inic-v1-1-cb8fc7116c56@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQpAQBAG4KtM/7OtnS3UvioH8CoPG4OJlnZLS
 u6ufAf4HmRJKhmeHiS5NOsR4YkLwriGuIjRCZ7grKuYmU0Ku8bNaNTRSF2Xs2XHbCsUhDPJrPe
 /9ejaBsP7fk84Fm9iAAAA
X-Change-ID: 20261111-ralink-inic-e775f0121106
To: Stanislaw Gruszka <stf_xl@wp.pl>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
X-Mailer: b4 0.16.0

The RT2880F runs the WLAN MAC and encryption on an embedded MIPS CPU.
Ethernet data and RaCfg control messages share PCI DMA rings, with an
outer tag selecting the firmware interface. Load the original PCI AP
firmware 2.0.0.0 (20090310) through FW_LOADER.

Use CFG80211/nl80211 for AP configuration, station events and key
management, with hostapd handling authentication and EAPOL. The packet
path uses the DMA API, NAPI and GRO.

Derive conservative regulatory power restrictions from FCC test report
RF970821H05. Apply the firmware power setting before enabling beacons
and keep per-rate powers at their EEPROM calibration values.

Features:
- One 2.4 GHz 802.11b/g AP on channels 1-11.
- Open and WPA2-PSK/CCMP operation with controlled-port filtering.
- Pairwise keys, deferred GTK activation and live CCMP sequence queries.
- A conservative 20 dBm EIRP bound for DIR-685, with regulatory shutdown.

Tested on the D-Link DIR-685:
- Firmware startup, AP stop/start and open/WPA2 association.
- Authorization, bidirectional IPv4 traffic and live client reconnect.
- 124 successive group rekeys at 60-second intervals.
- Broadcast GTK counter advance and reconnect with a nonzero GTK RSC.
- WPA2 pings: 180/180 client-to-AP and 177/180 AP-to-client replies.

Validated with packet and authentication KUnit tests.

Requires ralink/rt2880-inic-ap.bin in /lib/firmware.

Based on ages old implementation attempts.
Developed with LLM assistance.

Link: https://fccid.io/RRK-WMPND02A1
Link: https://wireless.docs.kernel.org/en/latest/en/users/drivers/rt2880_inic.html
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 MAINTAINERS                                 |   6 +
 drivers/net/wireless/ralink/Kconfig         |   1 +
 drivers/net/wireless/ralink/Makefile        |   1 +
 drivers/net/wireless/ralink/inic/Kconfig    |  16 +
 drivers/net/wireless/ralink/inic/Makefile   |   3 +
 drivers/net/wireless/ralink/inic/cfg.c      | 792 ++++++++++++++++++++++++++++
 drivers/net/wireless/ralink/inic/firmware.c | 492 +++++++++++++++++
 drivers/net/wireless/ralink/inic/inic.h     | 155 ++++++
 drivers/net/wireless/ralink/inic/pci.c      | 591 +++++++++++++++++++++
 9 files changed, 2057 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..213fb1d17f18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23299,6 +23299,12 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/ralink/mt7621*
 
+RALINK RT2880F INIC WIRELESS LAN DRIVER
+M:	Linus Walleij <linusw@kernel.org>
+L:	linux-wireless@vger.kernel.org
+S:	Maintained
+F:	drivers/net/wireless/ralink/inic/
+
 RALINK RT2X00 WIRELESS LAN DRIVER
 M:	Stanislaw Gruszka <stf_xl@wp.pl>
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/net/wireless/ralink/Kconfig b/drivers/net/wireless/ralink/Kconfig
index 135a191c435d..316c304b31ac 100644
--- a/drivers/net/wireless/ralink/Kconfig
+++ b/drivers/net/wireless/ralink/Kconfig
@@ -13,5 +13,6 @@ config WLAN_VENDOR_RALINK
 if WLAN_VENDOR_RALINK
 
 source "drivers/net/wireless/ralink/rt2x00/Kconfig"
+source "drivers/net/wireless/ralink/inic/Kconfig"
 
 endif # WLAN_VENDOR_RALINK
diff --git a/drivers/net/wireless/ralink/Makefile b/drivers/net/wireless/ralink/Makefile
index fd9ae217e9d0..b2ea3f388351 100644
--- a/drivers/net/wireless/ralink/Makefile
+++ b/drivers/net/wireless/ralink/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RT2X00)	+= rt2x00/
+obj-$(CONFIG_RALINK_INIC)	+= inic/
diff --git a/drivers/net/wireless/ralink/inic/Kconfig b/drivers/net/wireless/ralink/inic/Kconfig
new file mode 100644
index 000000000000..c181ec8c9997
--- /dev/null
+++ b/drivers/net/wireless/ralink/inic/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RALINK_INIC
+	tristate "Ralink RT2880 iNIC PCI support"
+	depends on PCI && CFG80211
+	select FW_LOADER
+	select CRC32
+	help
+	  Experimental FullMAC driver for the RT2880 PCI intelligent NIC
+	  (1814:0801). Supports one 2.4 GHz access point using the original
+	  PCI AP firmware. This is a different device from the RT2800
+	  supported by rt2x00.
+
+	  Requires ralink/rt2880-inic-ap.bin in /lib/firmware.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called ralink-inic.
diff --git a/drivers/net/wireless/ralink/inic/Makefile b/drivers/net/wireless/ralink/inic/Makefile
new file mode 100644
index 000000000000..3b381205e46d
--- /dev/null
+++ b/drivers/net/wireless/ralink/inic/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RALINK_INIC) += ralink-inic.o
+ralink-inic-y := pci.o firmware.o cfg.o
diff --git a/drivers/net/wireless/ralink/inic/cfg.c b/drivers/net/wireless/ralink/inic/cfg.c
new file mode 100644
index 000000000000..c22ea5e6be07
--- /dev/null
+++ b/drivers/net/wireless/ralink/inic/cfg.c
@@ -0,0 +1,792 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Translate cfg80211 AP settings to the RT2880 firmware profile. */
+#include <linux/ctype.h>
+#include <linux/module.h>
+#include <linux/if_vlan.h>
+#include <linux/of.h>
+#include <linux/unaligned.h>
+#include <linux/wireless.h>
+
+#include "inic.h"
+
+/* Firmware ieee80211req_key layout. */
+#define INIC_KEY_REQUEST_SIZE	60
+#define INIC_KEY_INDEX_PAIRWISE	0xffff /* Look up the station by MAC address. */
+
+/* Firmware ieee80211req_key cipher and flags. */
+#define INIC_CIPHER_CCMP	4
+#define INIC_KEY_TX		BIT(0)
+#define INIC_KEY_RX		BIT(1)
+#define INIC_KEY_DEFAULT	BIT(7) /* Default transmit key. */
+
+static struct ieee80211_rate inic_rates[] = {
+	{ .bitrate = 10, .hw_value = 0 },
+	{ .bitrate = 20, .hw_value = 1 },
+	{ .bitrate = 55, .hw_value = 2 },
+	{ .bitrate = 110, .hw_value = 3 },
+	{ .bitrate = 60, .hw_value = 4 },
+	{ .bitrate = 90, .hw_value = 5 },
+	{ .bitrate = 120, .hw_value = 6 },
+	{ .bitrate = 180, .hw_value = 7 },
+	{ .bitrate = 240, .hw_value = 8 },
+	{ .bitrate = 360, .hw_value = 9 },
+	{ .bitrate = 480, .hw_value = 10 },
+	{ .bitrate = 540, .hw_value = 11 },
+};
+
+static const u32 inic_ciphers[] = { WLAN_CIPHER_SUITE_CCMP };
+static const u32 inic_akms[] = { WLAN_AKM_SUITE_PSK };
+
+static struct inic_station *inic_find_station(struct inic *inic, const u8 *mac)
+{
+	int i;
+
+	for (i = 0; i < INIC_MAX_STATIONS; i++)
+		if (inic->stations[i].used && ether_addr_equal(inic->stations[i].mac, mac))
+			return &inic->stations[i];
+	return NULL;
+}
+
+bool inic_port_allowed(struct inic *inic, const struct ethhdr *eth, bool tx)
+{
+	struct inic_station *station;
+	unsigned long flags;
+	bool allowed;
+	u8 group_key;
+
+	if (!inic->control_port || eth->h_proto == htons(ETH_P_PAE))
+		return true;
+	if (tx && is_multicast_ether_addr(eth->h_dest)) {
+		if (!inic->secure)
+			return true;
+		group_key = READ_ONCE(inic->group_key);
+		return group_key < 4 && (READ_ONCE(inic->group_keys_installed) & BIT(group_key));
+	}
+	spin_lock_irqsave(&inic->lock, flags);
+	station = inic_find_station(inic, tx ? eth->h_dest : eth->h_source);
+	allowed = station && station->authorized && (!inic->secure || station->key_installed);
+	spin_unlock_irqrestore(&inic->lock, flags);
+	return allowed;
+}
+
+static int inic_deauth(struct inic *inic, const u8 *mac, u16 reason)
+{
+	u8 request[8];
+
+	put_unaligned_le16(reason, request);
+	ether_addr_copy(request + 2, mac);
+	return inic_auth_command(inic, false, INIC_AUTH_DEAUTH, request, sizeof(request), NULL);
+}
+
+static void inic_abort_ap(struct inic *inic)
+{
+	inic_hw_stop(inic);
+	cfg80211_stop_iface(inic->wiphy, &inic->wdev, GFP_KERNEL);
+}
+
+/*
+ * FCC report RF970821H05, pp12 and 105: legacy b/g uses one TX chain;
+ * maximum measured power is 24.81 dBm conducted, with 3.20 dBi net gain.
+ * Round these up to 25 dBm and 4 dBi, add a 3 dB engineering margin,
+ * and credit only the coarse 12 dB BBP reduction: 20 dBm EIRP.
+ * This bound applies to the original DIR-685 module and antennas only.
+ * The firmware startup fix applies the reduction before beaconing;
+ * TxPower=5 preserves it, with per-rate powers fixed to EEPROM values.
+ */
+static bool inic_ap_allowed(struct wiphy *wiphy, struct cfg80211_chan_def *chandef)
+{
+	return chandef->chan->max_power >= INIC_MAX_EIRP_DBM &&
+		cfg80211_reg_can_beacon(wiphy, chandef, NL80211_IFTYPE_AP);
+}
+
+static void inic_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+
+	/* The wiphy mutex serializes this with AP startup and shutdown. */
+	if (!inic->ap_started || inic_ap_allowed(wiphy, &inic->chandef))
+		return;
+	/* Reset the autonomous transmitter before notifying cfg80211. */
+	inic_abort_ap(inic);
+	dev_warn(&inic->pdev->dev, "regulatory change forced AP shutdown\n");
+}
+
+static int inic_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+			     int radio_idx, enum nl80211_tx_power_setting type, int mbm)
+{
+	/* A bound is available, not an exact output level or a finer power step. */
+	switch (type) {
+	case NL80211_TX_POWER_AUTOMATIC:
+		return 0;
+	case NL80211_TX_POWER_LIMITED:
+		return mbm >= DBM_TO_MBM(INIC_MAX_EIRP_DBM) ? 0 : -ERANGE;
+	case NL80211_TX_POWER_FIXED:
+		return -EOPNOTSUPP;
+	default:
+		return -EINVAL;
+	}
+}
+
+void inic_station_event(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	struct sk_buff *skb;
+
+	if (READ_ONCE(inic->events_lost)) {
+		/* Without a complete event stream, neither station table is reliable. */
+		inic_abort_ap(inic);
+		skb_queue_purge(&inic->events);
+		return;
+	}
+	while ((skb = skb_dequeue(&inic->events))) {
+		const struct inic_msg *msg = (const void *)(skb->data + ETH_HLEN);
+		const u8 *mac = msg->data + 2;
+		struct inic_station *station = inic_find_station(inic, mac);
+		struct station_info sinfo = {};
+		unsigned long flags;
+		u8 ies[256] = {};
+		u16 length = 0;
+		int i, ret;
+
+		if (!READ_ONCE(inic->ap_started))
+			goto next;
+		if (le32_to_cpu(msg->status) == IWEVEXPIRED) {
+			if (station) {
+				spin_lock_irqsave(&inic->lock, flags);
+				memzero_explicit(station, sizeof(*station));
+				spin_unlock_irqrestore(&inic->lock, flags);
+				inic->station_generation++;
+				cfg80211_del_sta(&inic->wdev, mac, GFP_KERNEL);
+			}
+			goto next;
+		}
+		if (!station) {
+			for (i = 0; i < INIC_MAX_STATIONS; i++) {
+				if (!inic->stations[i].used) {
+					station = &inic->stations[i];
+					break;
+				}
+			}
+		}
+		if (!station) {
+			inic_deauth(inic, mac, WLAN_REASON_DISASSOC_AP_BUSY);
+			goto next;
+		}
+		/* Close the previous association's port before querying new IEs. */
+		spin_lock_irqsave(&inic->lock, flags);
+		station->authorized = false;
+		station->key_installed = false;
+		spin_unlock_irqrestore(&inic->lock, flags);
+		if (inic->secure) {
+			ether_addr_copy(ies, mac);
+			ret = inic_auth_command(inic, true, INIC_AUTH_RSN_IE, ies, sizeof(ies),
+						&length);
+			if (ret || length < 2 || ies[0] != WLAN_EID_RSN || ies[1] + 2 != length) {
+				inic_deauth(inic, mac, WLAN_REASON_INVALID_IE);
+				goto next;
+			}
+			sinfo.assoc_req_ies = ies;
+			sinfo.assoc_req_ies_len = length;
+		}
+		spin_lock_irqsave(&inic->lock, flags);
+		memzero_explicit(station, sizeof(*station));
+		station->used = true;
+		station->connected = jiffies;
+		station->authorized = !inic->control_port;
+		ether_addr_copy(station->mac, mac);
+		spin_unlock_irqrestore(&inic->lock, flags);
+		sinfo.generation = ++inic->station_generation;
+		cfg80211_new_sta(&inic->wdev, mac, &sinfo, GFP_KERNEL);
+next:
+		kfree_skb(skb);
+	}
+}
+
+static int inic_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
+			int link_id, u8 index, enum nl80211_key_type type,
+			const u8 *mac, struct key_params *params)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	struct inic_station *station = NULL;
+	unsigned long flags;
+	u8 request[INIC_KEY_REQUEST_SIZE] = {};
+	int ret;
+
+	if (!inic->ap_started || !inic->secure)
+		return -ENETDOWN;
+	if (link_id > 0 || params->cipher != WLAN_CIPHER_SUITE_CCMP ||
+	    params->key_len != WLAN_KEY_LEN_CCMP || index > 3 ||
+	    params->mode != NL80211_KEY_RX_TX || params->vlan_id || params->ltf_keyseed_len ||
+	    (type != NL80211_KEYTYPE_PAIRWISE && type != NL80211_KEYTYPE_GROUP) ||
+	    (params->seq_len && (params->seq_len != 6 ||
+				memchr_inv(params->seq, 0, params->seq_len))))
+		return -EOPNOTSUPP;
+	if (type == NL80211_KEYTYPE_PAIRWISE) {
+		if (!mac || index)
+			return -EINVAL;
+		station = inic_find_station(inic, mac);
+		if (!station)
+			return -ENOENT;
+		if (station->key_installed && !memcmp(station->key, params->key, params->key_len))
+			return 0;
+		put_unaligned_le16(INIC_KEY_INDEX_PAIRWISE, request + 2);
+		ether_addr_copy(request + 6, mac);
+		request[5] = INIC_KEY_TX | INIC_KEY_RX;
+	} else {
+		int i;
+
+		if ((inic->group_keys_valid & BIT(index)) &&
+		    !memcmp(inic->group_keys[index], params->key, params->key_len))
+			return 0;
+		/* Reusing an existing GTK in another slot would reset its PN. */
+		for (i = 0; i < ARRAY_SIZE(inic->group_keys); i++)
+			if ((inic->group_keys_valid & BIT(i)) &&
+			    !memcmp(inic->group_keys[i], params->key, params->key_len))
+				return -EOPNOTSUPP;
+		/*
+		 * The firmware always selects and resets a GTK when installing
+		 * it, ignoring the default-key flag. AP group keys protect TX;
+		 * stage them here until set_default_key() activates the new key.
+		 * Client-to-AP data is protected by the client's pairwise key.
+		 * A fresh key may also replace the active slot; clearing its
+		 * installed bit blocks group TX until the replacement is selected.
+		 */
+		memcpy(inic->group_keys[index], params->key, params->key_len);
+		inic->group_keys_valid |= BIT(index);
+		WRITE_ONCE(inic->group_keys_installed, inic->group_keys_installed & ~BIT(index));
+		return 0;
+	}
+	/* Firmware's fixed 60-byte ieee80211req_key, including two zero counters. */
+	request[0] = INIC_CIPHER_CCMP;
+	request[4] = WLAN_KEY_LEN_CCMP;
+	memcpy(request + 28, params->key, WLAN_KEY_LEN_CCMP);
+	ret = inic_auth_command(inic, false, INIC_AUTH_SET_KEY, request, sizeof(request), NULL);
+	memzero_explicit(request, sizeof(request));
+	if (ret) {
+		/* An ambiguous key update must not leave an active, uncontrolled AP. */
+		inic_abort_ap(inic);
+		return ret;
+	}
+	spin_lock_irqsave(&inic->lock, flags);
+	station->key_installed = true;
+	memcpy(station->key, params->key, WLAN_KEY_LEN_CCMP);
+	spin_unlock_irqrestore(&inic->lock, flags);
+	return 0;
+}
+
+static int inic_get_key(struct wiphy *wiphy, struct wireless_dev *wdev,
+			int link_id, u8 index, enum nl80211_key_type type,
+			const u8 *mac, void *cookie,
+			void (*callback)(void *cookie, struct key_params *params))
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	u8 sequence[6] = {};
+	struct key_params params = {
+		.cipher = WLAN_CIPHER_SUITE_CCMP,
+		.key_len = WLAN_KEY_LEN_CCMP,
+		.seq = sequence,
+		.seq_len = sizeof(sequence),
+	};
+	int ret;
+
+	if (!inic->ap_started || !inic->secure)
+		return -ENETDOWN;
+	if (link_id > 0 || index > 3 || type != NL80211_KEYTYPE_GROUP || mac)
+		return -EOPNOTSUPP;
+	if (!(inic->group_keys_valid & BIT(index)))
+		return -ENOENT;
+	if (inic->group_keys_installed & BIT(index)) {
+		/* The ASIC has one live group counter per BSSID, not per slot. */
+		if (index != inic->group_key)
+			return -EOPNOTSUPP;
+		ret = inic_group_sequence(inic, index, sequence);
+		if (ret)
+			return ret;
+	}
+	/* A staged key has never transmitted, so its PN is still zero. */
+	params.key = inic->group_keys[index];
+	callback(cookie, &params);
+	return 0;
+}
+
+static int inic_del_key(struct wiphy *wiphy, struct wireless_dev *wdev,
+			int link_id, u8 index, enum nl80211_key_type type, const u8 *mac)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	struct inic_station *station = NULL;
+	unsigned long flags;
+	u8 request[INIC_KEY_REQUEST_SIZE] = {};
+	int ret;
+
+	if (!inic->ap_started)
+		return 0;
+	if (link_id > 0 || index > 3)
+		return -EINVAL;
+	if (type == NL80211_KEYTYPE_PAIRWISE && mac) {
+		station = inic_find_station(inic, mac);
+		if (!station || !station->key_installed)
+			return 0;
+		spin_lock_irqsave(&inic->lock, flags);
+		station->key_installed = false;
+		station->authorized = false;
+		spin_unlock_irqrestore(&inic->lock, flags);
+		put_unaligned_le16(INIC_KEY_INDEX_PAIRWISE, request + 2);
+		ether_addr_copy(request + 6, mac);
+	} else if (type == NL80211_KEYTYPE_GROUP) {
+		if (!(inic->group_keys_valid & BIT(index)))
+			return 0;
+		inic->group_keys_valid &= ~BIT(index);
+		memzero_explicit(inic->group_keys[index], WLAN_KEY_LEN_CCMP);
+		/* A staged replacement may still have an older key in its ASIC slot. */
+		WRITE_ONCE(inic->group_keys_installed, inic->group_keys_installed & ~BIT(index));
+		put_unaligned_le16(index, request + 2);
+	} else {
+		return -EINVAL;
+	}
+	ret = inic_auth_command(inic, false, INIC_AUTH_DEL_KEY, request, sizeof(request), NULL);
+	if (ret) {
+		inic_abort_ap(inic);
+		return ret;
+	}
+	if (station) {
+		spin_lock_irqsave(&inic->lock, flags);
+		memzero_explicit(station->key, sizeof(station->key));
+		spin_unlock_irqrestore(&inic->lock, flags);
+	}
+	return 0;
+}
+
+static int inic_default_key(struct wiphy *wiphy, struct net_device *dev, int link_id,
+			    u8 index, bool unicast, bool multicast)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	u8 request[INIC_KEY_REQUEST_SIZE] = {};
+	int ret;
+
+	if (!inic->ap_started || !inic->secure)
+		return -ENETDOWN;
+	if (link_id > 0 || index > 3 || unicast || !multicast)
+		return -EOPNOTSUPP;
+	if (!(inic->group_keys_valid & BIT(index)))
+		return -ENOENT;
+	if (inic->group_keys_installed & BIT(index)) {
+		/* Reinstallation of an old GTK would reset its packet number. */
+		return index == inic->group_key ? 0 : -EOPNOTSUPP;
+	}
+	request[0] = INIC_CIPHER_CCMP;
+	put_unaligned_le16(index, request + 2);
+	request[4] = WLAN_KEY_LEN_CCMP;
+	request[5] = INIC_KEY_TX | INIC_KEY_RX | INIC_KEY_DEFAULT;
+	eth_broadcast_addr(request + 6);
+	memcpy(request + 28, inic->group_keys[index], WLAN_KEY_LEN_CCMP);
+	ret = inic_auth_command(inic, false, INIC_AUTH_SET_KEY, request, sizeof(request), NULL);
+	memzero_explicit(request, sizeof(request));
+	if (ret) {
+		inic_abort_ap(inic);
+		return ret;
+	}
+	WRITE_ONCE(inic->group_key, index);
+	WRITE_ONCE(inic->group_keys_installed, inic->group_keys_installed | BIT(index));
+	return 0;
+}
+
+static int inic_change_station(struct wiphy *wiphy, struct wireless_dev *wdev,
+			       const u8 *mac, struct station_parameters *params)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	struct inic_station *station = inic_find_station(inic, mac);
+	unsigned long flags;
+	u32 mask;
+	bool authorized;
+	int ret;
+
+	if (!station)
+		return -ENOENT;
+	ret = cfg80211_check_station_change(wiphy, params, CFG80211_STA_AP_MLME_CLIENT);
+	if (ret)
+		return ret;
+	mask = params->sta_flags_mask;
+	authorized = params->sta_flags_set & BIT(NL80211_STA_FLAG_AUTHORIZED);
+	if (mask & ~(BIT(NL80211_STA_FLAG_AUTHORIZED) | BIT(NL80211_STA_FLAG_WME) |
+		     BIT(NL80211_STA_FLAG_SHORT_PREAMBLE) | BIT(NL80211_STA_FLAG_AUTHENTICATED) |
+		     BIT(NL80211_STA_FLAG_ASSOCIATED)))
+		return -EOPNOTSUPP;
+	if (!(mask & BIT(NL80211_STA_FLAG_AUTHORIZED)))
+		return 0;
+	if (authorized && inic->secure && !station->key_installed)
+		return -EINVAL;
+	/* Key installation opens the firmware's port. Revoke it by disconnecting. */
+	if (!authorized && station->authorized) {
+		spin_lock_irqsave(&inic->lock, flags);
+		station->authorized = false;
+		spin_unlock_irqrestore(&inic->lock, flags);
+		return inic_deauth(inic, mac, WLAN_REASON_PREV_AUTH_NOT_VALID);
+	}
+	spin_lock_irqsave(&inic->lock, flags);
+	station->authorized = authorized;
+	spin_unlock_irqrestore(&inic->lock, flags);
+	return 0;
+}
+
+static int inic_del_station(struct wiphy *wiphy, struct wireless_dev *wdev,
+			    struct station_del_parameters *params)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	unsigned long flags;
+	int i, ret;
+
+	if (!inic->ap_started)
+		return 0;
+	if (params->mac && !is_broadcast_ether_addr(params->mac)) {
+		struct inic_station *station = inic_find_station(inic, params->mac);
+
+		if (!station)
+			return 0;
+		spin_lock_irqsave(&inic->lock, flags);
+		station->authorized = false;
+		spin_unlock_irqrestore(&inic->lock, flags);
+		return inic_deauth(inic, params->mac, params->reason_code);
+	}
+	for (i = 0; i < INIC_MAX_STATIONS; i++) {
+		if (!inic->stations[i].used)
+			continue;
+		spin_lock_irqsave(&inic->lock, flags);
+		inic->stations[i].authorized = false;
+		spin_unlock_irqrestore(&inic->lock, flags);
+		ret = inic_deauth(inic, inic->stations[i].mac, params->reason_code);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int inic_get_station(struct wiphy *wiphy, struct wireless_dev *wdev,
+			    const u8 *mac, struct station_info *sinfo)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	struct inic_station *station = inic_find_station(inic, mac);
+
+	if (!inic->ap_started || !station)
+		return -ENOENT;
+	sinfo->generation = inic->station_generation;
+	sinfo->connected_time = (jiffies - station->connected) / HZ;
+	sinfo->filled = BIT_ULL(NL80211_STA_INFO_CONNECTED_TIME);
+	sinfo->sta_flags.mask = BIT(NL80211_STA_FLAG_AUTHORIZED);
+	if (station->authorized)
+		sinfo->sta_flags.set = BIT(NL80211_STA_FLAG_AUTHORIZED);
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_STA_FLAGS);
+	return 0;
+}
+
+static int inic_dump_station(struct wiphy *wiphy, struct wireless_dev *wdev,
+			     int index, u8 *mac, struct station_info *sinfo)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	int i;
+
+	for (i = 0; i < INIC_MAX_STATIONS; i++) {
+		if (!inic->stations[i].used || index--)
+			continue;
+		ether_addr_copy(mac, inic->stations[i].mac);
+		return inic_get_station(wiphy, wdev, mac, sinfo);
+	}
+	return -ENOENT;
+}
+
+/* The card generates a fixed legacy beacon. Accept only matching security IEs. */
+static bool inic_beacon_supported(const struct cfg80211_beacon_data *beacon, bool secure)
+{
+	static const u8 rsn[] = {
+		1, 0, 0, 0x0f, 0xac, 4, 1, 0, 0, 0x0f, 0xac, 4,
+		1, 0, 0, 0x0f, 0xac, 2, 0, 0,
+	};
+	static const u8 extended_rates[] = { 48, 72, 96, 108 };
+	const struct element *element;
+	bool found = false;
+
+	for_each_element(element, beacon->tail, beacon->tail_len) {
+		switch (element->id) {
+		case WLAN_EID_RSN:
+			if (!secure || found || element->datalen != sizeof(rsn) ||
+			    memcmp(element->data, rsn, sizeof(rsn)))
+				return false;
+			found = true;
+			break;
+		case WLAN_EID_ERP_INFO:
+			/* The legacy profile uses long preambles. */
+			if (element->datalen != 1 ||
+			    (element->data[0] & ~WLAN_ERP_BARKER_PREAMBLE))
+				return false;
+			break;
+		case WLAN_EID_EXT_SUPP_RATES:
+			if (element->datalen != sizeof(extended_rates) ||
+			    memcmp(element->data, extended_rates, sizeof(extended_rates)))
+				return false;
+			break;
+		case WLAN_EID_EXT_CAPABILITY:
+			if (memchr_inv(element->data, 0, element->datalen))
+				return false;
+			break;
+		default:
+			return false;
+		}
+	}
+	return for_each_element_completed(element, beacon->tail, beacon->tail_len) &&
+		(!secure || found);
+}
+
+static int inic_change_beacon(struct wiphy *wiphy, struct net_device *dev,
+			      struct cfg80211_ap_update *update)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+
+	if (!inic->ap_started)
+		return -ENETDOWN;
+	/* The firmware owns the beacon and cannot apply userspace templates. */
+	return -EOPNOTSUPP;
+}
+
+static int inic_change_bss(struct wiphy *wiphy, struct net_device *dev,
+			   struct bss_parameters *params)
+{
+	static const u8 basic_rates[] = { 2, 4, 11, 22 };
+
+	/* Match the legacy profile; firmware maintains ERP protection itself. */
+	if (params->link_id > 0 || params->ap_isolate == 0 ||
+	    params->use_short_preamble > 0 || params->ht_opmode >= 0 ||
+	    params->p2p_ctwindow > 0 || params->p2p_opp_ps > 0)
+		return -EOPNOTSUPP;
+	if (params->basic_rates &&
+	    (params->basic_rates_len != sizeof(basic_rates) ||
+	     memcmp(params->basic_rates, basic_rates, sizeof(basic_rates))))
+		return -EOPNOTSUPP;
+	return 0;
+}
+
+static int inic_set_wiphy_params(struct wiphy *wiphy, int radio_idx, u32 changed)
+{
+	if (changed & ~(WIPHY_PARAM_RTS_THRESHOLD | WIPHY_PARAM_FRAG_THRESHOLD))
+		return -EOPNOTSUPP;
+	if ((changed & WIPHY_PARAM_RTS_THRESHOLD) &&
+	    wiphy->rts_threshold != (u32)-1 && wiphy->rts_threshold != 2347)
+		return -EOPNOTSUPP;
+	if ((changed & WIPHY_PARAM_FRAG_THRESHOLD) &&
+	    wiphy->frag_threshold != (u32)-1 && wiphy->frag_threshold != 2346)
+		return -EOPNOTSUPP;
+	return 0;
+}
+
+static int inic_start_ap(struct wiphy *wiphy, struct net_device *dev,
+			 struct cfg80211_ap_settings *settings)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+	struct cfg80211_crypto_settings *crypto = &settings->crypto;
+	struct ieee80211_channel *channel = settings->chandef.chan;
+	char *profile;
+	bool secure = crypto->wpa_versions != 0;
+	__le32 auth[] = {
+		cpu_to_le32(secure ? BIT(3) | BIT(4) : BIT(1)), /* WPA2 + PSK / open */
+		0, /* No IEEE8021X. */
+		cpu_to_le32(secure ? BIT(2) : BIT(0)), /* CCMP / no encryption */
+		cpu_to_le32(1), /* Association events. */
+	};
+	int len, ret, i;
+
+	if (inic->running)
+		return -EBUSY;
+	if (!channel || channel->band != NL80211_BAND_2GHZ ||
+	    settings->chandef.width != NL80211_CHAN_WIDTH_20_NOHT ||
+	    settings->ssid_len < 1 || settings->ssid_len > IEEE80211_MAX_SSID_LEN ||
+	    settings->hidden_ssid != NL80211_HIDDEN_SSID_NOT_IN_USE ||
+	    (settings->auth_type != NL80211_AUTHTYPE_OPEN_SYSTEM &&
+	     settings->auth_type != NL80211_AUTHTYPE_AUTOMATIC) ||
+	    settings->beacon_interval < 20 || settings->beacon_interval > 1000 ||
+	    settings->dtim_period < 1 || settings->dtim_period > U8_MAX ||
+	    settings->privacy != secure ||
+	    settings->beacon.assocresp_ies_len || settings->beacon.proberesp_ies_len ||
+	    settings->beacon.beacon_ies_len ||
+	    settings->p2p_ctwindow || settings->p2p_opp_ps || crypto->sae_pwe ||
+	    settings->mbssid_config.tx_wdev || settings->acl || settings->pbss ||
+	    settings->ht_cap || settings->vht_cap || settings->he_cap ||
+	    settings->eht_cap || settings->twt_responder || settings->inactivity_timeout)
+		return -EOPNOTSUPP;
+	/* The vendor profile is line-oriented and cannot represent binary SSIDs. */
+	for (i = 0; i < settings->ssid_len; i++)
+		if (!isprint(settings->ssid[i]) || settings->ssid[i] == ';')
+			return -EOPNOTSUPP;
+	if (secure) {
+		if (crypto->wpa_versions != NL80211_WPA_VERSION_2 || crypto->psk ||
+		    crypto->cipher_group != WLAN_CIPHER_SUITE_CCMP ||
+		    crypto->n_ciphers_pairwise != 1 ||
+		    crypto->ciphers_pairwise[0] != WLAN_CIPHER_SUITE_CCMP ||
+		    crypto->n_akm_suites != 1 || crypto->akm_suites[0] != WLAN_AKM_SUITE_PSK)
+			return -EOPNOTSUPP;
+	} else if (crypto->cipher_group || crypto->n_ciphers_pairwise ||
+		   crypto->n_akm_suites) {
+		return -EOPNOTSUPP;
+	}
+	/* SA Query offload support is a userspace capability, not a request. */
+	if (crypto->control_port_over_nl80211 || crypto->sae_pwd ||
+	    (crypto->control_port_ethertype &&
+	     crypto->control_port_ethertype != htons(ETH_P_PAE)) ||
+	    (settings->flags & ~NL80211_AP_SETTINGS_SA_QUERY_OFFLOAD_SUPPORT))
+		return -EOPNOTSUPP;
+	if (!inic_beacon_supported(&settings->beacon, secure))
+		return -EOPNOTSUPP;
+	if (!of_machine_is_compatible("dlink,dir-685")) {
+		dev_err(&inic->pdev->dev, "no qualified transmit-power bound for this board\n");
+		return -EOPNOTSUPP;
+	}
+	if (!inic_ap_allowed(wiphy, &settings->chandef)) {
+		dev_err(&inic->pdev->dev, "AP requires a permitted channel with at least %u dBm EIRP\n",
+			INIC_MAX_EIRP_DBM);
+		return -EINVAL;
+	}
+	profile = kzalloc(2048, GFP_KERNEL);
+	if (!profile)
+		return -ENOMEM;
+	/* Firmware owns the AP SME and encryption; hostapd owns the handshake. */
+	len = scnprintf(profile, 2048,
+			"Default\nCountryRegion=0\nBssidNum=1\nWirelessMode=0\n"
+			"SSID1=%.*s\nChannel=%u\nAutoChannelSelect=0\n"
+			"BeaconPeriod=%u\nDtimPeriod=%u\nBasicRate=15\nTxRate=0\n"
+			"TxPower=%u\nBGProtection=0\nTxPreamble=0\nShortSlot=1\n"
+			"RTSThreshold=2347\nFragThreshold=2346\nTxBurst=0\nPktAggregate=0\n"
+			"WmmCapable=0\nAPSDCapable=0\nHideSSID=0\nIEEE8021X=0\n"
+			"AuthMode=%s\nEncrypType=%s\nDefaultKeyID=1\n"
+			"RekeyMethod=DISABLE\nNoForwarding=1\n"
+			"NoForwardingBTNBSSID=1\nWdsEnable=0\nApCliEnable=0\n"
+			"HT_BW=0\nHT_AutoBA=0\nHT_AMSDU=0\nExtEEPROM=0\n"
+			"WirelessEvent=1\nWscConfMode=0\n"
+			"__SkipIfNotINIC__MAC=%pM\n__SkipIfNotINIC__BUILT_IN_BRIDGE=0\n",
+			(int)settings->ssid_len, settings->ssid,
+			ieee80211_frequency_to_channel(channel->center_freq),
+			settings->beacon_interval, settings->dtim_period,
+			INIC_TX_POWER_PERCENT,
+			secure ? "WPA2PSK" : "OPEN", secure ? "AES" : "NONE", dev->dev_addr);
+	ret = inic_boot(inic, profile, len);
+	kfree_sensitive(profile);
+	if (ret)
+		return ret;
+	inic->secure = secure;
+	inic->control_port = secure || crypto->control_port;
+	WRITE_ONCE(inic->events_lost, false);
+	memzero_explicit(inic->stations, sizeof(inic->stations));
+	memzero_explicit(inic->group_keys, sizeof(inic->group_keys));
+	inic->group_keys_valid = 0;
+	inic->group_keys_installed = 0;
+	inic->group_key = 0xff;
+	inic->chandef = settings->chandef;
+	/* Publish the AP policy before RX and TX can use it. */
+	smp_store_release(&inic->ap_started, true);
+	/* Match the stock authenticator's auth mode, 802.1X, cipher and event setup. */
+	for (i = 0; i < ARRAY_SIZE(auth); i++) {
+		ret = inic_auth_command(inic, false, i + 2, &auth[i], sizeof(auth[i]), NULL);
+		if (ret) {
+			inic_hw_stop(inic);
+			wiphy_work_cancel(wiphy, &inic->event_work);
+			skb_queue_purge(&inic->events);
+			return ret;
+		}
+	}
+	netif_carrier_on(dev);
+	netif_wake_queue(dev);
+	return 0;
+}
+
+static int inic_stop_ap(struct wiphy *wiphy, struct net_device *dev,
+			unsigned int link_id)
+{
+	struct inic *inic = wiphy_priv(wiphy);
+
+	inic_hw_stop(inic);
+	wiphy_work_cancel(wiphy, &inic->event_work);
+	skb_queue_purge(&inic->events);
+	WRITE_ONCE(inic->events_lost, false);
+	memzero_explicit(inic->stations, sizeof(inic->stations));
+	memzero_explicit(inic->group_keys, sizeof(inic->group_keys));
+	inic->group_keys_valid = 0;
+	inic->group_keys_installed = 0;
+	return 0;
+}
+
+static int inic_change_iface(struct wiphy *wiphy, struct net_device *dev,
+			     enum nl80211_iftype type, struct vif_params *params)
+{
+	return type == NL80211_IFTYPE_AP ? 0 : -EOPNOTSUPP;
+}
+
+const struct cfg80211_ops inic_cfg_ops = {
+	.add_key = inic_add_key,
+	.get_key = inic_get_key,
+	.del_key = inic_del_key,
+	.set_default_key = inic_default_key,
+	.change_station = inic_change_station,
+	.del_station = inic_del_station,
+	.get_station = inic_get_station,
+	.dump_station = inic_dump_station,
+	.change_beacon = inic_change_beacon,
+	.change_bss = inic_change_bss,
+	.set_wiphy_params = inic_set_wiphy_params,
+	.set_tx_power = inic_set_tx_power,
+	.start_ap = inic_start_ap,
+	.stop_ap = inic_stop_ap,
+	.change_virtual_intf = inic_change_iface,
+};
+
+int inic_wireless_register(struct inic *inic)
+{
+	struct wiphy *wiphy = inic->wiphy;
+	struct net_device *dev = inic->netdev;
+	int i, ret;
+
+	set_wiphy_dev(wiphy, &inic->pdev->dev);
+	wiphy->interface_modes = BIT(NL80211_IFTYPE_AP);
+	wiphy->max_ap_assoc_sta = 32;
+	wiphy->cipher_suites = inic_ciphers;
+	wiphy->n_cipher_suites = ARRAY_SIZE(inic_ciphers);
+	wiphy->akm_suites = inic_akms;
+	wiphy->n_akm_suites = ARRAY_SIZE(inic_akms);
+	wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;
+	wiphy->flags |= WIPHY_FLAG_HAVE_AP_SME;
+	wiphy->reg_notifier = inic_reg_notifier;
+	for (i = 0; i < ARRAY_SIZE(inic->channels); i++) {
+		inic->channels[i].band = NL80211_BAND_2GHZ;
+		inic->channels[i].center_freq = 2412 + 5 * i;
+		inic->channels[i].hw_value = i + 1;
+		inic->channels[i].max_power = INIC_MAX_EIRP_DBM;
+	}
+	inic->band.channels = inic->channels;
+	inic->band.n_channels = ARRAY_SIZE(inic->channels);
+	inic->band.bitrates = inic_rates;
+	inic->band.n_bitrates = ARRAY_SIZE(inic_rates);
+	wiphy->bands[NL80211_BAND_2GHZ] = &inic->band;
+	inic->wdev.wiphy = wiphy;
+	inic->wdev.iftype = NL80211_IFTYPE_AP;
+	inic->wdev.netdev = dev;
+	dev->ieee80211_ptr = &inic->wdev;
+	SET_NETDEV_DEV(dev, &inic->pdev->dev);
+	dev->netdev_ops = &inic_netdev_ops;
+	dev->needed_headroom = 2 * VLAN_HLEN;
+	dev->max_mtu = ETH_DATA_LEN;
+	strscpy(dev->name, "wlan%d", IFNAMSIZ);
+	eth_hw_addr_random(dev);
+	netif_carrier_off(dev);
+	ret = wiphy_register(wiphy);
+	if (ret)
+		return ret;
+	ret = register_netdev(dev);
+	if (ret)
+		wiphy_unregister(wiphy);
+	return ret;
+}
+
+void inic_wireless_unregister(struct inic *inic)
+{
+	unregister_netdev(inic->netdev);
+	wiphy_lock(inic->wiphy);
+	wiphy_work_cancel(inic->wiphy, &inic->event_work);
+	skb_queue_purge(&inic->events);
+	wiphy_unlock(inic->wiphy);
+	wiphy_unregister(inic->wiphy);
+}
diff --git a/drivers/net/wireless/ralink/inic/firmware.c b/drivers/net/wireless/ralink/inic/firmware.c
new file mode 100644
index 000000000000..609697029e19
--- /dev/null
+++ b/drivers/net/wireless/ralink/inic/firmware.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Firmware bootstrap protocol, carried in Ethernet frames over PCI PDMA. */
+#include <linux/crc32.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/hex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+#include <linux/wireless.h>
+
+#include "inic.h"
+
+static bool fw_debug;
+module_param(fw_debug, bool, 0600);
+MODULE_PARM_DESC(fw_debug, "Log firmware console messages");
+
+struct inic_trailer {
+	__le32 magic;
+	__le32 crc;
+	char version[12];
+	char date[16];
+	__le32 size;
+} __packed;
+
+/* APStartUp()'s MIPS16 jal AsicLockChannel(), excluding its delay slot. */
+#define INIC_FW_POWER_OFFSET		0x45ffe
+#define INIC_FW_LOCK_CHANNEL		0xaaca1810
+#define INIC_FW_ADJUST_POWER		0xb0351810
+/* AsicAdjustTxPower()'s per-rate lw a0, 68(sp), loading the TSSI delta. */
+#define INIC_FW_RATE_DELTA_OFFSET	0x2b4ca
+#define INIC_FW_LOAD_DELTA		0x9411
+#define INIC_FW_ZERO_DELTA		0x6c00
+
+static int inic_firmware_check(struct inic *inic, const struct firmware *fw)
+{
+	const struct inic_trailer *trailer;
+	size_t len;
+	u32 crc;
+
+	if (fw->size != 492448)
+		return -EINVAL;
+	len = fw->size - sizeof(*trailer);
+	trailer = (const void *)(fw->data + len);
+	if (le32_to_cpu(trailer->magic) != 0x18140801 ||
+	    le32_to_cpu(trailer->size) != len ||
+	    memcmp(trailer->version, "\"2.0.0.0\"\0\0\0", 12) ||
+	    memcmp(trailer->date, "20090310\0\0\0\0\0\0\0\0", 16))
+		return -EINVAL;
+	crc = crc32_le(~0, fw->data, len) ^ ~0;
+	if (crc != le32_to_cpu(trailer->crc))
+		return -EBADMSG;
+	/*
+	 * The startup power fix, power bound and runtime RX DMA bound are
+	 * qualified for this exact image.
+	 */
+	if (crc != 0x7f1c8649 ||
+	    get_unaligned_le32(fw->data + INIC_FW_POWER_OFFSET) != INIC_FW_LOCK_CHANNEL ||
+	    get_unaligned_le16(fw->data + INIC_FW_RATE_DELTA_OFFSET) != INIC_FW_LOAD_DELTA)
+		return -EINVAL;
+	dev_info(&inic->pdev->dev, "PCI AP firmware %.12s date %.16s, %zu bytes, CRC %08x\n",
+		 trailer->version, trailer->date, len, crc);
+	return 0;
+}
+
+static u8 *inic_firmware_prepare(const struct firmware *fw)
+{
+	struct inic_trailer *trailer;
+	u8 *image;
+	size_t len = fw->size - sizeof(*trailer);
+
+	image = kvmemdup(fw->data, fw->size, GFP_KERNEL);
+	if (!image)
+		return NULL;
+	/*
+	 * Replace the empty AsicLockChannel() call after AsicSwitchChannel()
+	 * with AsicAdjustTxPower(), before AsicEnableBssSync() and initial
+	 * RTMPEnableRxTx(). Keep the argument setup and MIPS16 delay slot.
+	 * Otherwise the profile's power reduction first takes effect from
+	 * the periodic MLME callback, leaving startup transmissions at full
+	 * power. The uploaded profile selects the coarse 12 dB reduction.
+	 */
+	put_unaligned_le32(INIC_FW_ADJUST_POWER, image + INIC_FW_POWER_OFFSET);
+	/*
+	 * Replace the per-rate TSSI delta load with li a0, 0. Keep EEPROM
+	 * rate powers unchanged: an idle startup TSSI reading or a positive
+	 * temperature correction must not add power above this reference.
+	 * The engineering margin covers RF variation without compensation.
+	 */
+	put_unaligned_le16(INIC_FW_ZERO_DELTA, image + INIC_FW_RATE_DELTA_OFFSET);
+	trailer = (void *)(image + len);
+	trailer->crc = cpu_to_le32(crc32_le(~0, image, len) ^ ~0);
+	return image;
+}
+
+static int inic_command(struct inic *inic, u16 type, u16 id, u16 sequence,
+			u16 command_sequence, u16 dev_type, const u8 *data, u16 len)
+{
+	static const u8 source[ETH_ALEN] = { 1, 0x0c, 0x43, 0, 0, 0 };
+	struct sk_buff *skb;
+	struct ethhdr *eth;
+	struct inic_msg *msg;
+	int ret;
+
+	skb = alloc_skb(ETH_HLEN + sizeof(*msg) + len, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+	eth = skb_put(skb, ETH_HLEN);
+	eth_broadcast_addr(eth->h_dest);
+	ether_addr_copy(eth->h_source, source);
+	if (type != INIC_BOOT) {
+		/* Runtime PCI commands use the card MAC, with the vendor group bit. */
+		ether_addr_copy(eth->h_dest, inic->netdev->dev_addr);
+		ether_addr_copy(eth->h_source, inic->netdev->dev_addr);
+		eth->h_dest[0] |= 1;
+		eth->h_source[0] |= 1;
+	}
+	eth->h_proto = htons(0xffff);
+	msg = skb_put_zero(skb, sizeof(*msg));
+	msg->magic = cpu_to_le32(INIC_MAGIC);
+	msg->type = cpu_to_le16(type);
+	msg->id = cpu_to_le16(id);
+	msg->sequence = cpu_to_le16(sequence);
+	msg->command_sequence = cpu_to_le16(command_sequence);
+	msg->dev_type = cpu_to_le16(dev_type);
+	msg->length = cpu_to_le16(len);
+#ifdef __BIG_ENDIAN
+	if (type == INIC_BOOT)
+		msg->flags = cpu_to_le16(BIT(0));
+#endif
+	if (len)
+		skb_put_data(skb, data, len);
+	ret = inic_send(inic, skb, true);
+	if (ret) {
+		memzero_explicit(skb->data, skb->len);
+		kfree_skb(skb);
+	}
+	return ret;
+}
+
+static int inic_upload(struct inic *inic, u16 id, const u8 *data, size_t len)
+{
+	unsigned long flags;
+	u16 sequence = 0;
+	int ret = 0;
+
+	while (len) {
+		u16 chunk = min_t(size_t, len, INIC_CHUNK_SIZE);
+		int retry;
+
+		spin_lock_irqsave(&inic->lock, flags);
+		reinit_completion(&inic->reply);
+		inic->expected_id = id;
+		inic->expected_seq = sequence;
+		inic->expected_len = chunk;
+		memcpy(inic->expected, data, chunk);
+		inic->reply_error = 0;
+		inic->pending = true;
+		spin_unlock_irqrestore(&inic->lock, flags);
+		for (retry = 0; retry < 3; retry++) {
+			ret = inic_command(inic, INIC_BOOT, id, sequence, 0, 0, data, chunk);
+			if (ret && ret != -ENOSPC)
+				break;
+			if (wait_for_completion_timeout(&inic->reply, msecs_to_jiffies(1000))) {
+				ret = inic->reply_error;
+				break;
+			}
+			ret = -ETIMEDOUT;
+		}
+		spin_lock_irqsave(&inic->lock, flags);
+		inic->pending = false;
+		memzero_explicit(inic->expected, sizeof(inic->expected));
+		spin_unlock_irqrestore(&inic->lock, flags);
+		if (ret) {
+			dev_err(&inic->pdev->dev, "bootstrap command %u chunk %u failed: %d\n",
+				id, sequence, ret);
+			return ret;
+		}
+		/* Match the vendor pacing rather than saturating the boot ROM. */
+		if (id == INIC_UPLOAD)
+			msleep(30);
+		sequence++;
+		data += chunk;
+		len -= chunk;
+	}
+	return 0;
+}
+
+/* The firmware uses its original private ioctl numbers on the wire only. */
+static int inic_iwreq(struct inic *inic, u16 id, u16 parameter, bool query,
+		      void *data, u16 length, u16 *result_length)
+{
+	u8 *request;
+	unsigned long flags;
+	u16 wire_length = 4 + ALIGN(length, 2) + 2;
+	int ret;
+
+	lockdep_assert_wiphy(inic->wiphy);
+	if (!inic->running)
+		return -ENETDOWN;
+	if (length > sizeof(inic->command_data))
+		return -EMSGSIZE;
+	request = kzalloc(wire_length, GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+	/* IW_POINT: length, two padding bytes, inline data, even padding, flags. */
+	put_unaligned_le16(length, request);
+	memcpy(request + 4, data, length);
+	put_unaligned_le16(parameter, request + wire_length - 2);
+	spin_lock_irqsave(&inic->lock, flags);
+	reinit_completion(&inic->command_reply);
+	inic->command_sequence++;
+	inic->command_id = id;
+	inic->command_capacity = length;
+	inic->command_length = 0;
+	inic->command_copied = 0;
+	inic->command_copy_sequence = 0;
+	inic->command_decoded = false;
+	inic->command_error = 0;
+	inic->command_pending = true;
+	spin_unlock_irqrestore(&inic->lock, flags);
+	ret = inic_command(inic, INIC_IWREQ, id, 0, inic->command_sequence, 1,
+			   request, wire_length);
+	kfree_sensitive(request);
+	/* Do not retry key installation after an ambiguous timeout. */
+	if (!ret && !wait_for_completion_timeout(&inic->command_reply, 2 * HZ))
+		ret = -ETIMEDOUT;
+	spin_lock_irqsave(&inic->lock, flags);
+	inic->command_pending = false;
+	if (!ret)
+		ret = inic->command_error;
+	if (!ret && query) {
+		if (!inic->command_decoded || inic->command_copied != inic->command_length) {
+			ret = -EBADMSG;
+		} else {
+			memcpy(data, inic->command_data, inic->command_length);
+			if (result_length)
+				*result_length = inic->command_length;
+		}
+	}
+	memzero_explicit(inic->command_data, sizeof(inic->command_data));
+	spin_unlock_irqrestore(&inic->lock, flags);
+	if (ret)
+		dev_err_ratelimited(&inic->pdev->dev, "firmware ioctl %04x parameter %u: %d\n",
+				    id, parameter, ret);
+	return ret;
+}
+
+int inic_auth_command(struct inic *inic, bool query, u16 parameter,
+		      void *data, u16 length, u16 *result_length)
+{
+	return inic_iwreq(inic, query ? INIC_AUTH_GET : INIC_AUTH_SET,
+			  parameter, query, data, length, result_length);
+}
+
+/* The MAC-read ioctl's fixed response format: [0x%08x]:%08x followed by two spaces. */
+static int inic_mac_word(const char *reply, u32 address, u32 *value)
+{
+	char prefix[14];
+	u8 bytes[4];
+
+	snprintf(prefix, sizeof(prefix), "[0x%08x]:", address);
+	if (memcmp(reply, prefix, 13) || reply[21] != ' ' || reply[22] != ' ' ||
+	    hex2bin(bytes, reply + 13, sizeof(bytes)))
+		return -EBADMSG;
+	*value = get_unaligned_be32(bytes);
+	return 0;
+}
+
+int inic_group_sequence(struct inic *inic, u8 index, u8 *sequence)
+{
+	u32 high, low, again;
+	char reply[128];
+	u16 length;
+	int retry, ret;
+
+	/*
+	 * BSSID 0 uses WCID 212, whose ASIC IV/EIV entry is at 0x66a0.
+	 * The pinned firmware's RTMPGetTxTscFromAsic() at 0x88050128 maps
+	 * CCMP PN0/PN1 from IV bytes 0/1 and PN2..PN5 from EIV bytes 0..3.
+	 * Use its existing MAC-read ioctl, taking EIV/IV/EIV snapshots to
+	 * detect carry into the upper 32 bits while transmission continues.
+	 */
+	for (retry = 0; retry < 3; retry++) {
+		memset(reply, 0, sizeof(reply));
+		strscpy(reply, "66a4,66a0,66a4", sizeof(reply));
+		ret = inic_iwreq(inic, 0x8be5, 0, true, reply, sizeof(reply), &length);
+		if (ret)
+			return ret;
+		if (length != 70 || reply[0] != '\n' ||
+		    inic_mac_word(reply + 1, 0x66a4, &high) ||
+		    inic_mac_word(reply + 24, 0x66a0, &low) ||
+		    inic_mac_word(reply + 47, 0x66a4, &again))
+			return -EBADMSG;
+		if (!(low & BIT(29)) || (low >> 30) != index)
+			return -EIO;
+		if (high != again)
+			continue;
+		sequence[0] = low;
+		sequence[1] = low >> 8;
+		put_unaligned_le32(high, sequence + 2);
+		return 0;
+	}
+	return -EAGAIN;
+}
+
+static void inic_auth_reply(struct inic *inic, const struct inic_msg *msg,
+			    u16 type, u16 len)
+{
+	unsigned long flags;
+	int status;
+
+	spin_lock_irqsave(&inic->lock, flags);
+	if (!inic->command_pending || msg->dev_id ||
+	    le16_to_cpu(msg->id) != inic->command_id ||
+	    le16_to_cpu(msg->command_sequence) != inic->command_sequence)
+		goto unlock;
+	if (type == INIC_COPY_REPLY) {
+		if (le16_to_cpu(msg->sequence) != inic->command_copy_sequence ||
+		    len > inic->command_capacity - inic->command_copied)
+			goto malformed;
+		memcpy(inic->command_data + inic->command_copied, msg->data, len);
+		inic->command_copied += len;
+		inic->command_copy_sequence++;
+	} else if (type == INIC_IWREQ_REPLY) {
+		if (le16_to_cpu(msg->dev_type) != 1 || len < 6 ||
+		    get_unaligned_le16(msg->data) > inic->command_capacity)
+			goto malformed;
+		inic->command_length = get_unaligned_le16(msg->data);
+		inic->command_decoded = true;
+	} else {
+		/* Vendor transport status values differ from Linux errno values. */
+		status = (s32)le32_to_cpu(msg->status);
+		switch (status) {
+		case 0:
+			break;
+		case -1:
+			inic->command_error = -EFAULT;
+			break;
+		case -2:
+			inic->command_error = -EOPNOTSUPP;
+			break;
+		case -3:
+			inic->command_error = -EINVAL;
+			break;
+		case -4:
+			inic->command_error = -ENETDOWN;
+			break;
+		case -5:
+			inic->command_error = -EAGAIN;
+			break;
+		default:
+			inic->command_error = -EIO;
+			break;
+		}
+		goto done;
+	}
+	goto unlock;
+malformed:
+	inic->command_error = -EBADMSG;
+done:
+	inic->command_pending = false;
+	complete(&inic->command_reply);
+unlock:
+	spin_unlock_irqrestore(&inic->lock, flags);
+}
+
+void inic_receive_control(struct inic *inic, struct sk_buff *skb)
+{
+	struct inic_msg *msg;
+	unsigned long flags;
+	u16 type, id, len;
+
+	if (skb->len < ETH_HLEN + sizeof(*msg))
+		return;
+	msg = (void *)(skb->data + ETH_HLEN);
+	if (le32_to_cpu(msg->magic) != INIC_MAGIC)
+		return;
+	len = le16_to_cpu(msg->length);
+	if (len > skb->len - ETH_HLEN - sizeof(*msg) || len > INIC_CHUNK_SIZE)
+		return;
+	type = le16_to_cpu(msg->type);
+	id = le16_to_cpu(msg->id);
+	if (type == INIC_COPY_REPLY || type == INIC_IWREQ_REPLY || type == INIC_STATUS_REPLY) {
+		inic_auth_reply(inic, msg, type, len);
+	} else if ((type & ~0x8000) == INIC_BOOT) {
+		if (id == INIC_NOTIFY) {
+			complete(&inic->notify);
+			return;
+		}
+		spin_lock_irqsave(&inic->lock, flags);
+		if (inic->pending && id == inic->expected_id &&
+		    le16_to_cpu(msg->sequence) == inic->expected_seq) {
+			inic->reply_error = len != inic->expected_len ||
+				memcmp(msg->data, inic->expected, len) ? -EBADMSG : 0;
+			inic->pending = false;
+			complete(&inic->reply);
+		}
+		spin_unlock_irqrestore(&inic->lock, flags);
+	} else if (type == INIC_GET_MAC && !id && len == 18) {
+		u8 mac[ETH_ALEN];
+		char text[18];
+
+		memcpy(text, msg->data, sizeof(text));
+		text[17] = '\0';
+		if (!mac_pton(text, mac) || !is_valid_ether_addr(mac))
+			return;
+		/* Do not change a registered netdev address from softirq context. */
+		dev_info(&inic->pdev->dev, "firmware ready, card MAC %pM\n", mac);
+		complete(&inic->ready);
+	} else if (type == INIC_ASYNC && id == 0) {
+		if (fw_debug)
+			dev_info_ratelimited(&inic->pdev->dev, "firmware: %.*s\n", len, msg->data);
+	} else if (type == INIC_ASYNC && id == 5 && !msg->dev_id &&
+		   !msg->dev_type && len >= sizeof(struct sockaddr)) {
+		/* Vendor wireless_send_event2 transports an inline sockaddr. */
+		const u8 *mac = msg->data + 2;
+		u32 event = le32_to_cpu(msg->status);
+		struct sk_buff *event_skb;
+
+		if (!READ_ONCE(inic->ap_started) || !is_valid_ether_addr(mac))
+			return;
+		if (event != IWEVREGISTERED && event != IWEVEXPIRED)
+			return;
+		if (skb_queue_len(&inic->events) >= 128)
+			goto events_lost;
+		event_skb = skb_clone(skb, GFP_ATOMIC);
+		if (!event_skb)
+			goto events_lost;
+		skb_queue_tail(&inic->events, event_skb);
+		wiphy_work_queue(inic->wiphy, &inic->event_work);
+	}
+	return;
+events_lost:
+	WRITE_ONCE(inic->events_lost, true);
+	wiphy_work_queue(inic->wiphy, &inic->event_work);
+}
+
+int inic_boot(struct inic *inic, const u8 *profile, size_t len)
+{
+	const struct firmware *fw;
+	u8 *image = NULL;
+	int ret;
+
+	ret = request_firmware(&fw, INIC_FIRMWARE, &inic->pdev->dev);
+	if (ret)
+		return ret;
+	ret = inic_firmware_check(inic, fw);
+	if (ret) {
+		dev_err(&inic->pdev->dev, "invalid PCI AP firmware: %d\n", ret);
+		goto release;
+	}
+	image = inic_firmware_prepare(fw);
+	if (!image) {
+		ret = -ENOMEM;
+		goto release;
+	}
+	reinit_completion(&inic->notify);
+	reinit_completion(&inic->ready);
+	ret = inic_hw_start(inic);
+	if (ret)
+		goto release;
+	if (!wait_for_completion_timeout(&inic->notify, msecs_to_jiffies(5000))) {
+		dev_err(&inic->pdev->dev, "no boot-ROM notification\n");
+		ret = -ETIMEDOUT;
+		goto stop;
+	}
+	dev_info(&inic->pdev->dev, "boot ROM ready; uploading AP profile\n");
+	ret = inic_upload(inic, INIC_INITCFG, profile, len);
+	if (ret)
+		goto stop;
+	dev_info(&inic->pdev->dev, "uploading firmware with startup power fix (%zu bytes)\n",
+		 fw->size);
+	ret = inic_upload(inic, INIC_UPLOAD, image, fw->size);
+	if (ret)
+		goto stop;
+	ret = inic_command(inic, INIC_BOOT, INIC_STARTUP, 0, 0, 0, NULL, 0);
+	if (ret)
+		goto stop;
+	if (!wait_for_completion_timeout(&inic->ready, msecs_to_jiffies(20000))) {
+		dev_err(&inic->pdev->dev, "firmware did not report its MAC\n");
+		ret = -ETIMEDOUT;
+		goto stop;
+	}
+	goto release;
+stop:
+	inic_hw_stop(inic);
+release:
+	kvfree(image);
+	release_firmware(fw);
+	return ret;
+}
diff --git a/drivers/net/wireless/ralink/inic/inic.h b/drivers/net/wireless/ralink/inic/inic.h
new file mode 100644
index 000000000000..7eb196f4c15a
--- /dev/null
+++ b/drivers/net/wireless/ralink/inic/inic.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _RALINK_INIC_H
+#define _RALINK_INIC_H
+
+#include <linux/completion.h>
+#include <linux/etherdevice.h>
+#include <linux/firmware.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <net/cfg80211.h>
+
+#define INIC_FIRMWARE		"ralink/rt2880-inic-ap.bin"
+/* Qualified DIR-685 configuration; TxPower is a vendor percentage. */
+#define INIC_TX_POWER_PERCENT	5
+#define INIC_MAX_EIRP_DBM	20
+#define INIC_TX_COUNT		128
+#define INIC_RX_COUNT		64
+/* Full PCI frame size, including the firmware's four-byte BSSID tag. */
+#define INIC_BUFFER_SIZE	1536
+#define INIC_CHUNK_SIZE		1024
+#define INIC_MAGIC		0x18142880
+#define INIC_BOOT		1
+#define INIC_NOTIFY		1
+#define INIC_INITCFG		2
+#define INIC_UPLOAD		3
+#define INIC_STARTUP		4
+#define INIC_ASYNC		0x8005
+#define INIC_GET_MAC		0x8009
+#define INIC_IWREQ		7
+#define INIC_COPY_REPLY		0x8006
+#define INIC_IWREQ_REPLY	0x8007
+#define INIC_STATUS_REPLY	0x8008
+#define INIC_AUTH_SET		0x8bfe
+#define INIC_AUTH_GET		0x8bff
+#define INIC_AUTH_EVENTS	5
+#define INIC_AUTH_RSN_IE	7
+#define INIC_AUTH_SET_KEY	10
+#define INIC_AUTH_DEL_KEY	11
+#define INIC_AUTH_DEAUTH	12
+#define INIC_MAX_STATIONS	32
+
+struct inic_station {
+	u8 mac[ETH_ALEN];
+	unsigned long connected;
+	u8 key[WLAN_KEY_LEN_CCMP];
+	bool used;
+	bool key_installed;
+	bool authorized;
+};
+
+struct inic_desc {
+	__le32 address;
+	__le32 control;
+	__le32 address1;
+	__le32 info;
+};
+
+struct inic_msg {
+	__le32 magic;
+	__le16 type;
+	__le16 id;
+	__le16 length;
+	__le16 sequence;
+	__le16 dev_id;
+	__le16 dev_type;
+	__le16 command_sequence;
+	__le16 flags;
+	__le32 status;
+	__le32 reserved[2];
+	u8 data[];
+} __packed;
+
+struct inic_buffer {
+	struct sk_buff *skb;
+	dma_addr_t dma;
+	bool sensitive;
+};
+
+struct inic {
+	struct pci_dev *pdev;
+	void __iomem *regs;
+	struct wiphy *wiphy;
+	struct wireless_dev wdev;
+	struct net_device *netdev;
+	struct napi_struct napi;
+	/* Serializes hardware startup, teardown and permanent shutdown. */
+	struct mutex hw_mutex;
+	bool shutting_down;
+	/* Serializes TX producer/reclaimer and interrupt mask updates. */
+	spinlock_t lock;
+	struct inic_desc *rx_desc;
+	struct inic_desc *tx_desc;
+	dma_addr_t desc_dma;
+	struct inic_buffer rx[INIC_RX_COUNT];
+	struct inic_buffer tx[INIC_TX_COUNT];
+	u32 tx_head;
+	u32 tx_tail;
+	u32 rx_head;
+	/* Transport active; the shared IRQ handler may access registers. */
+	bool running;
+	bool ap_started;
+	/* A single bootstrap transaction; protected against NAPI by lock. */
+	struct completion reply;
+	struct completion notify;
+	struct completion ready;
+	bool pending;
+	u16 expected_id;
+	u16 expected_seq;
+	u16 expected_len;
+	u8 expected[INIC_CHUNK_SIZE];
+	int reply_error;
+	/* Runtime commands and station state are serialized by the wiphy mutex. */
+	struct completion command_reply;
+	u16 command_sequence;
+	u16 command_id;
+	u16 command_copy_sequence;
+	u16 command_length;
+	u16 command_capacity;
+	u16 command_copied;
+	bool command_pending;
+	bool command_decoded;
+	int command_error;
+	u8 command_data[256];
+	struct sk_buff_head events;
+	bool events_lost;
+	struct wiphy_work event_work;
+	struct inic_station stations[INIC_MAX_STATIONS];
+	u32 station_generation;
+	bool secure;
+	bool control_port;
+	u8 group_key;
+	u8 group_keys[4][WLAN_KEY_LEN_CCMP];
+	u8 group_keys_valid;
+	u8 group_keys_installed;
+	struct cfg80211_chan_def chandef;
+	struct ieee80211_channel channels[11];
+	struct ieee80211_supported_band band;
+};
+
+int inic_hw_start(struct inic *inic);
+void inic_hw_stop(struct inic *inic);
+int inic_send(struct inic *inic, struct sk_buff *skb, bool control);
+void inic_receive_control(struct inic *inic, struct sk_buff *skb);
+int inic_boot(struct inic *inic, const u8 *profile, size_t len);
+int inic_auth_command(struct inic *inic, bool query, u16 parameter,
+		      void *data, u16 length, u16 *result_length);
+int inic_group_sequence(struct inic *inic, u8 index, u8 *sequence);
+void inic_station_event(struct wiphy *wiphy, struct wiphy_work *work);
+bool inic_port_allowed(struct inic *inic, const struct ethhdr *eth, bool tx);
+int inic_wireless_register(struct inic *inic);
+void inic_wireless_unregister(struct inic *inic);
+extern const struct net_device_ops inic_netdev_ops;
+extern const struct cfg80211_ops inic_cfg_ops;
+
+#endif
diff --git a/drivers/net/wireless/ralink/inic/pci.c b/drivers/net/wireless/ralink/inic/pci.c
new file mode 100644
index 000000000000..32befa2fa15c
--- /dev/null
+++ b/drivers/net/wireless/ralink/inic/pci.c
@@ -0,0 +1,591 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Ralink RT2880 iNIC PCI packet transport. */
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/if_vlan.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/sizes.h>
+#include <linux/unaligned.h>
+
+#include "inic.h"
+
+#define INIC_INT_STATUS		0x10
+#define INIC_INT_ENABLE		0x14
+#define INIC_DMA_CFG		0x100
+#define INIC_DELAY_INT		0x10c
+#define INIC_TX_BASE		0x110
+#define INIC_TX_MAX		0x114
+#define INIC_TX_CPU		0x118
+#define INIC_RX_BASE		0x130
+#define INIC_RX_MAX		0x134
+#define INIC_RX_CPU		0x138
+#define INIC_RESET		0xfffc
+#define INIC_INT_TX		BIT(1)
+#define INIC_INT_RX		BIT(2)
+#define INIC_INTERRUPTS		(INIC_INT_TX | INIC_INT_RX)
+#define INIC_TX_ENABLE		BIT(0)
+#define INIC_TX_BUSY		BIT(1)
+#define INIC_RX_ENABLE		BIT(2)
+#define INIC_RX_BUSY		BIT(3)
+#define INIC_TX_WRITEBACK	BIT(6)
+#define INIC_DONE		BIT(31)
+#define INIC_LAST		BIT(30)
+#define INIC_LENGTH		GENMASK(29, 16)
+#define INIC_DESC_BYTES		((INIC_RX_COUNT + INIC_TX_COUNT) * sizeof(struct inic_desc))
+
+static void inic_write(struct inic *inic, u32 reg, u32 value)
+{
+	writel(value, inic->regs + reg);
+}
+
+static void inic_reset(struct inic *inic)
+{
+	unsigned long flags;
+
+	/* Other devices can invoke our shared handler while the BARs are absent. */
+	spin_lock_irqsave(&inic->lock, flags);
+	WRITE_ONCE(inic->running, false);
+	spin_unlock_irqrestore(&inic->lock, flags);
+	synchronize_irq(inic->pdev->irq);
+	/* Reset loses the BARs and command register on this conventional PCI NIC. */
+	pci_save_state(inic->pdev);
+	inic_write(inic, INIC_RESET, 1);
+	msleep(100);
+	pci_restore_state(inic->pdev);
+}
+
+static void inic_free_rings(struct inic *inic)
+{
+	struct device *dev = &inic->pdev->dev;
+	int i;
+
+	for (i = 0; i < INIC_TX_COUNT; i++) {
+		if (!inic->tx[i].skb)
+			continue;
+		dma_unmap_single(dev, inic->tx[i].dma, inic->tx[i].skb->len,
+				 DMA_TO_DEVICE);
+		if (inic->tx[i].sensitive)
+			memzero_explicit(inic->tx[i].skb->data, inic->tx[i].skb->len);
+		dev_kfree_skb_any(inic->tx[i].skb);
+		inic->tx[i].skb = NULL;
+	}
+	for (i = 0; i < INIC_RX_COUNT; i++) {
+		if (!inic->rx[i].skb)
+			continue;
+		dma_unmap_single(dev, inic->rx[i].dma, INIC_BUFFER_SIZE,
+				 DMA_FROM_DEVICE);
+		dev_kfree_skb_any(inic->rx[i].skb);
+		inic->rx[i].skb = NULL;
+	}
+	if (inic->rx_desc) {
+		dma_free_coherent(dev, INIC_DESC_BYTES, inic->rx_desc, inic->desc_dma);
+		inic->rx_desc = NULL;
+		inic->tx_desc = NULL;
+	}
+}
+
+static int inic_alloc_rings(struct inic *inic)
+{
+	struct device *dev = &inic->pdev->dev;
+	int i;
+
+	inic->rx_desc = dma_alloc_coherent(dev, INIC_DESC_BYTES,
+					   &inic->desc_dma, GFP_KERNEL);
+	if (!inic->rx_desc)
+		return -ENOMEM;
+	memset(inic->rx_desc, 0, INIC_DESC_BYTES);
+	inic->tx_desc = inic->rx_desc + INIC_RX_COUNT;
+	for (i = 0; i < INIC_TX_COUNT; i++) {
+		inic->tx_desc[i].control = cpu_to_le32(INIC_DONE | INIC_LAST);
+		inic->tx_desc[i].info = cpu_to_le32(BIT(24)); /* Destination port 1. */
+	}
+	/*
+	 * RX descriptors have no known capacity field. The pinned runtime
+	 * firmware's PCI sender at 0x880073dc rejects frames above 1536 bytes
+	 * (length check at 0x88007418) before queuing DMA, for both data and
+	 * control traffic. The completion length check cannot bound DMA writes.
+	 */
+	for (i = 0; i < INIC_RX_COUNT; i++) {
+		struct sk_buff *skb;
+		dma_addr_t dma;
+
+		skb = netdev_alloc_skb_ip_align(inic->netdev, INIC_BUFFER_SIZE);
+		if (!skb)
+			goto fail;
+		dma = dma_map_single(dev, skb->data, INIC_BUFFER_SIZE, DMA_FROM_DEVICE);
+		if (dma_mapping_error(dev, dma)) {
+			dev_kfree_skb_any(skb);
+			goto fail;
+		}
+		inic->rx[i].skb = skb;
+		inic->rx[i].dma = dma;
+		inic->rx_desc[i].address = cpu_to_le32(dma);
+		inic->rx_desc[i].control = cpu_to_le32(INIC_LAST);
+	}
+	inic->tx_head = 0;
+	inic->tx_tail = 0;
+	inic->rx_head = 0;
+	return 0;
+fail:
+	inic_free_rings(inic);
+	return -ENOMEM;
+}
+
+/* lock held; the DMA engine has returned ownership before unmapping. */
+static void inic_tx_complete(struct inic *inic)
+{
+	while (inic->tx_tail != inic->tx_head) {
+		u32 index = inic->tx_tail % INIC_TX_COUNT;
+		struct inic_buffer *buf = &inic->tx[index];
+
+		if (!(le32_to_cpu(READ_ONCE(inic->tx_desc[index].control)) & INIC_DONE))
+			break;
+		dma_rmb();
+		dma_unmap_single(&inic->pdev->dev, buf->dma, buf->skb->len,
+				 DMA_TO_DEVICE);
+		if (buf->sensitive)
+			memzero_explicit(buf->skb->data, buf->skb->len);
+		dev_consume_skb_any(buf->skb);
+		buf->skb = NULL;
+		inic->tx_tail++;
+	}
+	if (inic->ap_started && netif_queue_stopped(inic->netdev) &&
+	    inic->tx_head - inic->tx_tail < INIC_TX_COUNT - 4)
+		netif_wake_queue(inic->netdev);
+}
+
+int inic_send(struct inic *inic, struct sk_buff *skb, bool control)
+{
+	struct device *dev = &inic->pdev->dev;
+	unsigned long flags;
+	dma_addr_t dma;
+	u32 index;
+	int ret = -ENOSPC;
+
+	spin_lock_irqsave(&inic->lock, flags);
+	if (!inic->running)
+		goto unlock;
+	inic_tx_complete(inic);
+	/* Leave slots for bootstrap/control traffic when the data queue is full. */
+	if (inic->tx_head - inic->tx_tail >= INIC_TX_COUNT - (control ? 1 : 4)) {
+		if (!control)
+			netif_stop_queue(inic->netdev);
+		goto unlock;
+	}
+	if (skb_linearize(skb)) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+	dma = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, dma)) {
+		ret = -EIO;
+		goto unlock;
+	}
+	index = inic->tx_head % INIC_TX_COUNT;
+	inic->tx[index].skb = skb;
+	inic->tx[index].dma = dma;
+	inic->tx[index].sensitive = control;
+	inic->tx_desc[index].address = cpu_to_le32(dma);
+	dma_wmb();
+	WRITE_ONCE(inic->tx_desc[index].control,
+		   cpu_to_le32(INIC_LAST | FIELD_PREP(INIC_LENGTH, skb->len)));
+	inic->tx_head++;
+	inic_write(inic, INIC_TX_CPU, inic->tx_head % INIC_TX_COUNT);
+	if (!control && inic->tx_head - inic->tx_tail >= INIC_TX_COUNT - 4)
+		netif_stop_queue(inic->netdev);
+	ret = 0;
+unlock:
+	spin_unlock_irqrestore(&inic->lock, flags);
+	return ret;
+}
+
+static void inic_rx_data(struct inic *inic, struct sk_buff *skb)
+{
+	struct vlan_ethhdr *vh;
+
+	if (skb->len < ETH_HLEN)
+		goto drop;
+	if (eth_hdr(skb)->h_proto == htons(0xffff)) {
+		inic_receive_control(inic, skb);
+		goto free;
+	}
+	/* Pair with the AP policy publication in inic_start_ap(). */
+	if (!smp_load_acquire(&inic->ap_started) || skb->len < VLAN_ETH_HLEN)
+		goto drop;
+	/* The outer tag selects a firmware interface, not an Ethernet VLAN. */
+	vh = (struct vlan_ethhdr *)skb->data;
+	if (vh->h_vlan_proto != htons(ETH_P_8021Q) ||
+	    (ntohs(vh->h_vlan_TCI) & VLAN_VID_MASK) != 1)
+		goto drop;
+	memmove(skb->data + VLAN_HLEN, skb->data, 2 * ETH_ALEN);
+	skb_pull(skb, VLAN_HLEN);
+	if (!inic_port_allowed(inic, (const void *)skb->data, false))
+		goto drop;
+	skb_reset_mac_header(skb);
+	skb->protocol = eth_hdr(skb)->h_proto;
+	if (vlan_get_protocol(skb) == htons(0xffff))
+		goto drop;
+	skb->protocol = eth_type_trans(skb, inic->netdev);
+	DEV_STATS_INC(inic->netdev, rx_packets);
+	DEV_STATS_ADD(inic->netdev, rx_bytes, skb->len + ETH_HLEN);
+	napi_gro_receive(&inic->napi, skb);
+	return;
+drop:
+	DEV_STATS_INC(inic->netdev, rx_dropped);
+free:
+	dev_kfree_skb_any(skb);
+}
+
+static int inic_poll(struct napi_struct *napi, int budget)
+{
+	struct inic *inic = container_of(napi, struct inic, napi);
+	struct device *dev = &inic->pdev->dev;
+	unsigned long flags;
+	int done = 0;
+
+	spin_lock_irqsave(&inic->lock, flags);
+	inic_tx_complete(inic);
+	spin_unlock_irqrestore(&inic->lock, flags);
+	while (done < budget) {
+		u32 index = inic->rx_head % INIC_RX_COUNT;
+		struct inic_buffer *buf = &inic->rx[index];
+		struct inic_desc *desc = &inic->rx_desc[index];
+		u32 status = le32_to_cpu(READ_ONCE(desc->control));
+		struct sk_buff *skb;
+		u32 len;
+
+		if (!(status & INIC_DONE))
+			break;
+		dma_rmb();
+		len = FIELD_GET(INIC_LENGTH, status);
+		dma_sync_single_for_cpu(dev, buf->dma, INIC_BUFFER_SIZE, DMA_FROM_DEVICE);
+		if (len >= ETH_HLEN && len <= INIC_BUFFER_SIZE && (status & INIC_LAST)) {
+			skb = napi_alloc_skb(napi, len);
+			if (skb) {
+				skb_put_data(skb, buf->skb->data, len);
+				skb_reset_mac_header(skb);
+				inic_rx_data(inic, skb);
+			} else {
+				DEV_STATS_INC(inic->netdev, rx_dropped);
+			}
+		} else {
+			DEV_STATS_INC(inic->netdev, rx_length_errors);
+		}
+		dma_sync_single_for_device(dev, buf->dma, INIC_BUFFER_SIZE, DMA_FROM_DEVICE);
+		dma_wmb();
+		WRITE_ONCE(desc->control, cpu_to_le32(INIC_LAST));
+		inic_write(inic, INIC_RX_CPU, index);
+		inic->rx_head++;
+		done++;
+	}
+	if (done < budget && napi_complete_done(napi, done)) {
+		spin_lock_irqsave(&inic->lock, flags);
+		if (inic->running)
+			inic_write(inic, INIC_INT_ENABLE, INIC_INTERRUPTS);
+		spin_unlock_irqrestore(&inic->lock, flags);
+	}
+	return done;
+}
+
+static irqreturn_t inic_irq(int irq, void *data)
+{
+	struct inic *inic = data;
+	unsigned long flags;
+	irqreturn_t ret = IRQ_NONE;
+	u32 status;
+
+	spin_lock_irqsave(&inic->lock, flags);
+	if (!inic->running)
+		goto unlock;
+	status = readl(inic->regs + INIC_INT_STATUS);
+	if (status == U32_MAX || !(status & INIC_INTERRUPTS))
+		goto unlock;
+	inic_write(inic, INIC_INT_ENABLE, 0);
+	inic_write(inic, INIC_INT_STATUS, status & INIC_INTERRUPTS);
+	napi_schedule_irqoff(&inic->napi);
+	ret = IRQ_HANDLED;
+unlock:
+	spin_unlock_irqrestore(&inic->lock, flags);
+	return ret;
+}
+
+int inic_hw_start(struct inic *inic)
+{
+	unsigned long flags;
+	u32 cfg;
+	int ret;
+
+	mutex_lock(&inic->hw_mutex);
+	if (inic->shutting_down) {
+		ret = -ESHUTDOWN;
+		goto unlock;
+	}
+	if (inic->running) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+	inic_reset(inic);
+	pci_write_config_byte(inic->pdev, PCI_LATENCY_TIMER, 0x20);
+	inic_write(inic, INIC_INT_ENABLE, 0);
+	cfg = readl(inic->regs + INIC_DMA_CFG);
+	cfg &= ~(INIC_TX_ENABLE | INIC_RX_ENABLE | INIC_TX_WRITEBACK);
+	inic_write(inic, INIC_DMA_CFG, cfg);
+	ret = readl_poll_timeout(inic->regs + INIC_DMA_CFG, cfg,
+				 !(cfg & (INIC_TX_BUSY | INIC_RX_BUSY)), 100, 100000);
+	if (ret)
+		goto unlock;
+	ret = inic_alloc_rings(inic);
+	if (ret)
+		goto unlock;
+	inic_write(inic, INIC_RX_BASE, lower_32_bits(inic->desc_dma));
+	inic_write(inic, INIC_TX_BASE,
+		   lower_32_bits(inic->desc_dma + INIC_RX_COUNT * sizeof(struct inic_desc)));
+	inic_write(inic, INIC_RX_MAX, INIC_RX_COUNT);
+	inic_write(inic, INIC_TX_MAX, INIC_TX_COUNT);
+	inic_write(inic, INIC_TX_CPU, 0);
+	inic_write(inic, INIC_RX_CPU, INIC_RX_COUNT - 1);
+	/* Delayed TX IRQ: at most 64 packets or 255 * 20 microseconds. */
+	inic_write(inic, INIC_DELAY_INT, BIT(31) | (64 << 24) | (255 << 16));
+	inic_write(inic, INIC_INT_STATUS, INIC_INTERRUPTS);
+	napi_enable(&inic->napi);
+	spin_lock_irqsave(&inic->lock, flags);
+	WRITE_ONCE(inic->running, true);
+	spin_unlock_irqrestore(&inic->lock, flags);
+	pci_set_master(inic->pdev);
+	dma_wmb();
+	inic_write(inic, INIC_DMA_CFG,
+		   cfg | INIC_TX_ENABLE | INIC_RX_ENABLE | INIC_TX_WRITEBACK);
+	inic_write(inic, INIC_INT_ENABLE, INIC_INTERRUPTS);
+	ret = 0;
+unlock:
+	mutex_unlock(&inic->hw_mutex);
+	return ret;
+}
+
+static void __inic_hw_stop(struct inic *inic)
+{
+	unsigned long flags;
+	u32 cfg;
+	int ret;
+
+	if (!inic->running)
+		return;
+	spin_lock_irqsave(&inic->lock, flags);
+	WRITE_ONCE(inic->running, false);
+	WRITE_ONCE(inic->ap_started, false);
+	if (inic->command_pending) {
+		inic->command_error = -ENETDOWN;
+		inic->command_pending = false;
+		complete(&inic->command_reply);
+	}
+	inic_write(inic, INIC_INT_ENABLE, 0);
+	spin_unlock_irqrestore(&inic->lock, flags);
+	/* Completion cannot wake TX again once ap_started has been cleared. */
+	netif_tx_disable(inic->netdev);
+	netif_carrier_off(inic->netdev);
+	synchronize_irq(inic->pdev->irq);
+	napi_disable(&inic->napi);
+	cfg = readl(inic->regs + INIC_DMA_CFG);
+	inic_write(inic, INIC_DMA_CFG,
+		   cfg & ~(INIC_TX_ENABLE | INIC_RX_ENABLE | INIC_TX_WRITEBACK));
+	ret = readl_poll_timeout(inic->regs + INIC_DMA_CFG, cfg,
+				 !(cfg & (INIC_TX_BUSY | INIC_RX_BUSY)), 100, 100000);
+	if (ret)
+		dev_warn(&inic->pdev->dev, "DMA stop timed out; resetting card\n");
+	pci_clear_master(inic->pdev);
+	/* Reset also stops the autonomous AP, even if DMA was already idle. */
+	inic_reset(inic);
+	inic_write(inic, INIC_INT_ENABLE, 0);
+	inic_free_rings(inic);
+}
+
+void inic_hw_stop(struct inic *inic)
+{
+	mutex_lock(&inic->hw_mutex);
+	__inic_hw_stop(inic);
+	mutex_unlock(&inic->hw_mutex);
+}
+
+static int inic_open(struct net_device *dev)
+{
+	netif_carrier_off(dev);
+	netif_start_queue(dev);
+	return 0;
+}
+
+static int inic_stop(struct net_device *dev)
+{
+	struct inic *inic = *(struct inic **)netdev_priv(dev);
+
+	inic_hw_stop(inic);
+	return 0;
+}
+
+static netdev_tx_t inic_xmit(struct sk_buff *skb, struct net_device *dev)
+{
+	struct inic *inic = *(struct inic **)netdev_priv(dev);
+	unsigned int len = skb->len;
+	int ret;
+
+	/* Pair with the AP policy publication in inic_start_ap(). */
+	if (!smp_load_acquire(&inic->ap_started) || !pskb_may_pull(skb, ETH_HLEN) ||
+	    get_unaligned_be16(skb->data + 12) == 0xffff ||
+	    vlan_get_protocol(skb) == htons(0xffff))
+		goto drop;
+	if (!inic_port_allowed(inic, (const void *)skb->data, true))
+		goto drop;
+	if (skb_vlan_tag_present(skb)) {
+		skb = __vlan_hwaccel_push_inside(skb);
+		if (!skb)
+			goto dropped;
+	}
+	/* Always add a separate firmware BSSID tag, preserving user VLANs. */
+	skb = vlan_insert_tag_set_proto(skb, htons(ETH_P_8021Q), 1);
+	if (!skb)
+		goto dropped;
+	if (skb->len > INIC_BUFFER_SIZE)
+		goto drop;
+	ret = inic_send(inic, skb, false);
+	if (ret)
+		goto drop;
+	DEV_STATS_INC(dev, tx_packets);
+	DEV_STATS_ADD(dev, tx_bytes, len);
+	return NETDEV_TX_OK;
+drop:
+	dev_kfree_skb_any(skb);
+dropped:
+	DEV_STATS_INC(dev, tx_dropped);
+	return NETDEV_TX_OK;
+}
+
+const struct net_device_ops inic_netdev_ops = {
+	.ndo_open = inic_open,
+	.ndo_stop = inic_stop,
+	.ndo_start_xmit = inic_xmit,
+	.ndo_set_mac_address = eth_mac_addr,
+	.ndo_validate_addr = eth_validate_addr,
+};
+
+static int inic_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct inic *inic;
+	struct wiphy *wiphy;
+	int ret;
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		return ret;
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto disable;
+	ret = pci_request_regions(pdev, "ralink-inic");
+	if (ret)
+		goto disable;
+	if (!(pci_resource_flags(pdev, 1) & IORESOURCE_MEM) ||
+	    pci_resource_len(pdev, 1) < SZ_64K) {
+		ret = -ENODEV;
+		goto release;
+	}
+	wiphy = wiphy_new(&inic_cfg_ops, sizeof(*inic));
+	if (!wiphy) {
+		ret = -ENOMEM;
+		goto release;
+	}
+	inic = wiphy_priv(wiphy);
+	inic->wiphy = wiphy;
+	inic->pdev = pdev;
+	spin_lock_init(&inic->lock);
+	mutex_init(&inic->hw_mutex);
+	init_completion(&inic->reply);
+	init_completion(&inic->notify);
+	init_completion(&inic->ready);
+	init_completion(&inic->command_reply);
+	skb_queue_head_init(&inic->events);
+	wiphy_work_init(&inic->event_work, inic_station_event);
+	inic->regs = pci_iomap(pdev, 1, SZ_64K);
+	if (!inic->regs) {
+		ret = -ENOMEM;
+		goto free_wiphy;
+	}
+	inic_write(inic, INIC_INT_ENABLE, 0);
+	pci_clear_master(pdev);
+	inic->netdev = alloc_etherdev(sizeof(struct inic *));
+	if (!inic->netdev) {
+		ret = -ENOMEM;
+		goto unmap;
+	}
+	*(struct inic **)netdev_priv(inic->netdev) = inic;
+	netif_napi_add(inic->netdev, &inic->napi, inic_poll);
+	ret = request_irq(pdev->irq, inic_irq, IRQF_SHARED, "ralink-inic", inic);
+	if (ret)
+		goto free_netdev;
+	ret = inic_wireless_register(inic);
+	if (ret)
+		goto free_irq;
+	pci_set_drvdata(pdev, inic);
+	dev_info(&pdev->dev, "RT2880 iNIC BAR1 %pR IRQ %u; firmware loaded on AP start\n",
+		 &pdev->resource[1], pdev->irq);
+	return 0;
+free_irq:
+	free_irq(pdev->irq, inic);
+free_netdev:
+	netif_napi_del(&inic->napi);
+	free_netdev(inic->netdev);
+unmap:
+	pci_iounmap(pdev, inic->regs);
+free_wiphy:
+	wiphy_free(wiphy);
+release:
+	pci_release_regions(pdev);
+disable:
+	pci_disable_device(pdev);
+	return ret;
+}
+
+static void inic_remove(struct pci_dev *pdev)
+{
+	struct inic *inic = pci_get_drvdata(pdev);
+
+	inic_wireless_unregister(inic);
+	free_irq(pdev->irq, inic);
+	netif_napi_del(&inic->napi);
+	free_netdev(inic->netdev);
+	pci_iounmap(pdev, inic->regs);
+	wiphy_free(inic->wiphy);
+	pci_release_regions(pdev);
+	pci_disable_device(pdev);
+}
+
+static void inic_shutdown(struct pci_dev *pdev)
+{
+	struct inic *inic = pci_get_drvdata(pdev);
+
+	wiphy_lock(inic->wiphy);
+	mutex_lock(&inic->hw_mutex);
+	inic->shutting_down = true;
+	__inic_hw_stop(inic);
+	pci_clear_master(pdev);
+	mutex_unlock(&inic->hw_mutex);
+	wiphy_unlock(inic->wiphy);
+}
+
+static const struct pci_device_id inic_ids[] = {
+	{ PCI_DEVICE(0x1814, 0x0801) },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, inic_ids);
+
+static struct pci_driver inic_driver = {
+	.name = "ralink-inic",
+	.id_table = inic_ids,
+	.probe = inic_probe,
+	.remove = inic_remove,
+	.shutdown = inic_shutdown,
+};
+module_pci_driver(inic_driver);
+
+MODULE_DESCRIPTION("Ralink RT2880 iNIC PCI FullMAC driver");
+MODULE_LICENSE("GPL");
+MODULE_FIRMWARE(INIC_FIRMWARE);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-ralink-inic-e775f0121106

Best regards,
--  
Linus Walleij <linusw@kernel.org>

