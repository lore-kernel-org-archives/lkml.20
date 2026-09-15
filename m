Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD24A6CFE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486110; cv=none; b=d2tRg2eW3Eg8pEWXTTyg3HmUdqy0ErnNmFTRVYHpiOCNsYx46b9dRAKJNEgL4pURGTBf1dzk/T0pRn7ln4fFZz7EKJYriUy+GbvMEFfG9PPRgAhS9mnOcGC4hVh3xjm2gBc33IlnvJtMsgG3wvqi9xTn34ZIWB3PFysHOIo9IIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486110; c=relaxed/simple;
	bh=15+SZqGZ+rKb58cj8l9a3UfjccfUiCU49btU1/YB8gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kAsm3REi9/DS0KTpG+PUgYaOcAmd9RkabtPGq8akFMMCgY9ShK0J/ODY/SDPhtna9evJV1rC9H/vD+ZNG/oMXAlR7ebxe07Rm4DPINQpXn7QXlH1aiYTQ2O5do3M035Vk7KiPeX9l8hEMWBj3S+GMGvsMWf7mPnJG3nnBk9ULZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfEibjiI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfEibjiI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso14273025e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789486106; x=1790090906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33gYF2jzy1G9rIQBj+NprKHNDmK+lqFhKcN1EOQ8yF8=;
        b=jfEibjiIwhZaYtGUuadVegONxUPC3HS7ouSb7i+RW4hkJn3ugSOYCnbX3shhzSbNGh
         Vm65BmU109xm8lgJZ6JmhJO1e3qu0K0KgbI6jXTiXoFoSmb4hw+pQBN4A3eQSc8HuqDJ
         6SL4kMY3suUG1ZiWLsAmEBFIoWT3gwDIabsq5GYfx7wNzJpFBwqLPkn8PnGuerzxyKI1
         WuYvLHi6kvcXL6R4jF1oO6b0/4sN3ABxbfav1UooLx+EmDSo+YpzdILM2jXsT90xjat3
         BymEefJvN/eL08EswWh1GZD4LVDp2p2XMiT9XtmgkhYWfzZb8N/fO/Ig+wJ2H2bwZ04p
         deWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486106; x=1790090906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33gYF2jzy1G9rIQBj+NprKHNDmK+lqFhKcN1EOQ8yF8=;
        b=PerK2aBnHGf+f+hknPnckC2odAqNT0+MdwJz560OPz1zQsTFQxe2vNa8FsHkYPXBJH
         U1cCktQX318Aaei6n6VNcinw48xE+25wltXJxPadb2GDzLHP2Xlh1U2bznV5QVXNfJRB
         iewv4nQ+/0ueczO0APoboXoC2X8VYnw51PhUS9GC3BhogoICjmRVXxE+wlQ/vvVEDYIO
         5rbTC25tj7VLFoiKeCu9VYVJez+kDyfjVJmWBf1bHDZEo53s/qQBBQifFtWoYYpoazst
         dvgJLZFLx0f9zMUOGHZ66Vp3Dfz4W13XyGghK05u3QzDJgWeMxhzfvhy+EIrjfX5QRjI
         t//g==
X-Forwarded-Encrypted: i=1; AKwUvBzChguY40jYbHB8T/sn/Vj5iFNZPLozLT89ZdSGkWO2YqWmR9PZCdwLgXpemOquYoihE9iUURlBLbeMRQI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGi2xdRDnihVqMaCgM99sWENB4aGAI1sTwqxkr12CckTnXDN0A
	BAXLBOSoBJl9j/MJHNnCWKSKZwQitXa+qToPaC6QMa+fUBn2cOUiUL0B
X-Gm-Gg: AYBFou0+xsA6PXh7b7kkkgmwvmsjdgHM7oe4RxSRX7nzmUlICEF8OYVfs7Xm+rla/BP
	M2yW7VF8ZR68MHknml6rO+Zg7ljYgyVg7rtBR6pi+8Z0JbeMbdQXluMhrHAeWwCk/C44BYjaGQR
	1GvNDAcLYxWmncns9OnCu2Zx0RT1Rp6x7r2YyvvpA5UgYIootxYbhw0bFqWAHMPtExiDUXcVdiu
	OQYIkfgo97cufjvssa1RJLrTZTiyhkD8A0/GD6Mw0tdzBlJpzrv/p6/M4jj8dDhla0DsVHbL+O+
	iJIkxhht4M2qTVLeigjfrUOFeexh6BuJm5sHboOsLZQBa7swtUiRBtFUc/Xd3aJDcainKMGkBpR
	bbB18PyX3cFUKthvFLBAkJvkqayZop+akb9Xu5e6HQrkRDQvYITa0c+HYFX9t85IbCafn38ITVt
	gkat/Vky9wKzYEGWJj2p2kM2Z4iwsvpyv/S0sTDHiBZ6wC4oPU2zMYZM9Kv2xYdhM=
X-Received: by 2002:a05:600c:a47:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49e7a677980mr92009675e9.25.1789486106257;
        Tue, 15 Sep 2026 08:28:26 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:a903:f291:2714:83e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm36312931f8f.5.2026.09.15.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:28:25 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	kang.yang@oss.qualcomm.com
Subject: [PATCH ath-next v2] wifi: ath12k: provide MAC address list for single-radio wiphys
Date: Tue, 15 Sep 2026 16:28:15 +0100
Message-ID: <20260915152815.254016-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

ath12k supports creating vdevs with addresses provided by mac80211.
Userspace can already make concurrent interfaces work by explicitly
assigning different locally administered addresses.

However, ath12k does not advertise an address list, so when a second
interface is created without an explicit address, mac80211 has nothing
to pick from and falls back to the permanent address. If the first
interface is already running with that address, bringing up the second
one fails with -ENOTUNIQ.

As in ath11k, provide a list of usable addresses so
ieee80211_assign_perm_addr() can hand each new interface an unused one.
Keep the first entry as the radio's own MAC address. Generate the
remaining entries as locally administered variants by changing only the
upper nibble of the first octet, which naturally limits the pool to 16
unique addresses.

The wiphy->addresses semantics are hardware-specific in ath12k: some
platforms use it as an interface MAC address pool, while others use it
for firmware-provided per-radio addresses. Gate host-generated addresses
behind host_alloc_iface_mac and enable it for WCN7850.

Handle only single-radio WCN7850 wiphys. Wiphys with more than one radio
and other hardware families behave exactly as before.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Assisted-by: LLM
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v2:
- Gate generated interface MAC address list behind hw_params
  host_alloc_iface_mac, as suggested by Kang Yang.
- Enable it only for WCN7850, the only part available for testing here.
- Add Assisted-by: tag.
- Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/mac.c      | 52 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 011bb22e21c7..03cb35071e0b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -238,6 +238,7 @@ struct ath12k_hw_params {
 	} client;
 
 	bool host_alloc_ml_id;
+	bool host_alloc_iface_mac;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..45be5b08aa40 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14743,6 +14743,54 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
 }
 
+static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
+{
+	kfree(ah->hw->wiphy->addresses);
+}
+
+static void ath12k_mac_setup_mac_address_list(struct ath12k_hw *ah,
+					      const u8 *mac_addr)
+{
+	struct mac_address *addresses;
+	struct ath12k *ar;
+	u16 n_addresses;
+	int i;
+
+	/* The pool is derived from one base address, so it can describe only a
+	 * single-radio wiphy: with more radios each radio has its own base
+	 * address, possibly from a different ath12k_base.
+	 */
+	if (ah->num_radio != 1)
+		return;
+
+	ar = ath12k_ah_to_ar(ah, 0);
+	if (!ar->ab->hw_params->host_alloc_iface_mac)
+		return;
+
+	/* Only the upper nibble of the first octet is varied, so at most 16
+	 * addresses can be derived from one base.
+	 */
+	n_addresses = min_t(u16, TARGET_NUM_VDEVS(ar->ab), 16);
+	if (n_addresses <= 1)
+		return;
+
+	addresses = kzalloc_objs(*addresses, n_addresses);
+	if (!addresses)
+		return;
+
+	ether_addr_copy(addresses[0].addr, mac_addr);
+	for (i = 1; i < n_addresses; i++) {
+		ether_addr_copy(addresses[i].addr, mac_addr);
+		/* set Local Administered Address bit */
+		addresses[i].addr[0] |= 0x2;
+
+		addresses[i].addr[0] += i << 4;
+	}
+
+	ah->hw->wiphy->addresses = addresses;
+	ah->hw->wiphy->n_addresses = n_addresses;
+}
+
 static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 {
 	struct ieee80211_hw *hw = ah->hw;
@@ -14762,6 +14810,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 
 	ath12k_mac_cleanup_iface_combinations(ah);
+	ath12k_mac_cleanup_mac_address_list(ah);
 
 	SET_IEEE80211_DEV(hw, NULL);
 }
@@ -14878,6 +14927,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->available_antennas_tx = antennas_tx;
 
 	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
+	ath12k_mac_setup_mac_address_list(ah, mac_addr);
 	SET_IEEE80211_DEV(hw, ab->dev);
 
 	ret = ath12k_mac_setup_iface_combinations(ah);
@@ -15120,6 +15170,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 	}
 
+	ath12k_mac_cleanup_mac_address_list(ah);
+
 	SET_IEEE80211_DEV(hw, NULL);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index a20c21807344..8658828ea47d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.host_alloc_iface_mac = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 };
 
-- 
2.55.0

