Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336258;
	b=yeP21B94SbjbgW/RYO+Rq30Em4a7ordOqwXqXc08CHJKsXsIHF+IMWiZ/0FCT/znR1AY
	 3647VmGE950IgcpAFx+i59Enz48fzPeH4ZZXS9n/J7/XMU28esC4c0m3VBFKSYuYxSzUK
	 vAuVErivBN2No/fUQANmVySoPQsGJOjgJg76WtS7OYGKCv0+Kw1I1Q2e2K3r9MuaHC+n0
	 KqxUkYBLWghMg0mmxtCMsomgcXyrSWEX5tdWUy83Fzua3Q8k9DrrtYiVdAxn16wvwSJ14
	 hZOzFAjUwndDzQZSGxM0jlqRQRZtN/gNttFCWMXFQn5s4fF7yxxSlxff+2MmDBWq15w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FrckW9zYKMVqkZPBuh2imu7DOw9yI7/mNlAYhX3+6TA=;
	b=Mc91+6Vx8cy8jH7iM164PbmpQwOsdmLs5YExYsdz7z3WWxj26MRFmVrR7/Bk4yS0eLGb
	 FeCsLmXno2Xj/W6niDGKobj6MLmRfIO7JJlxq5cFa4FRTL+hQUjjsouz5wKadGCiRSEtY
	 ZK2td0pIyrMSE0Zo3HjdbTTcJWyPbzlTGu7dVi1dlMGwU0hvcHIONYu76X/vqD128hHMF
	 ADX2SuJuzq/ZHdICIiFGJnUfgo2SOy0giHABKeIj/XpCLvwGyJAKDc12j6Lrzeubn2inj
	 U2PKRS8EHuwr91GnQQzdaS67dyz0LRj+Gd5gyjz9u9J9IbalJDHCgzSIxNqHduz+pew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezuDOzpi;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BB4606B59A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BB4606B59A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezuDOzpi
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-84621d8c7aaso1062277a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336257; x=1794941057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrckW9zYKMVqkZPBuh2imu7DOw9yI7/mNlAYhX3+6TA=;
        b=ezuDOzpiJeWUtcdcQp/08EvyTvbUD5TuEAxOAs2jZakpnklSz3xV1bsYx5/OtST4pZ
         r+Spj69PFtMzYBU1jLqjevAy+bxJsHSwtMgW4aksv0klf1gsp1JDSYqOrW10hyKhG/+O
         gr/PtAy52AfNebb1ketiutaYZA5HToEyA+kff+Q687te9vbpJaWxW6guHUmhAGQcAWP4
         GKyEbWJy8eqPIrRYpD+GmiRXjMxOOIXMpoPHqMIMucz/Qj9pqZTrBA5jxWtcRuMAkYLS
         qkKwJTyAKh8K2YgFzxMmQyWbPS7LFMCoFFFQT0UGtWzbqJpxzkUzXtt9Bb6N5EZ6HIfP
         GJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336257; x=1794941057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrckW9zYKMVqkZPBuh2imu7DOw9yI7/mNlAYhX3+6TA=;
        b=bXcw1/Fe3YU1sToW6AiuJSoN6cGXHoATyYv2Q8ZkjJ/QO9w+DJ3gNJAv1GEMEkZCPO
         cjgQzS/N+33gP70U+Ei+IsQAhlXEquraqRI3xLiOJxhM5cM48C8zKLPhhc0Tb6ZrJQyp
         Vsy4Ta+/V2OHEVtdw4DZ7+dl8+58rMb4a8fl5aI55r/zy9TOrH0J5OKI1n9Bpx6H74BB
         C6we6QVtwFheiOqtrhd832WQN/zVw0sZpqCvJDxifpb9Z8qZwiQCIUg3cZVwo2A0mOy9
         YOpCgitMNPiEQaQR+7taXhnqLaGRzChsCXLr4J/9Bw0MHnp+gX7Z2q0NFGyO5F9XDttL
         kV3A==
X-Forwarded-Encrypted: i=1; AL+hErGP5dR34/L5nCK+aLd4CmS7+UiJQbAb0/JDwBwG0tXKB93a2dSPXX+2GpCJVd998N9+XX8kWxnrx6ns6i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z89ueyEpwSEuIb211BXyWndx0QUK4mA8RmRW38UpwQGdZWknbvW
	AfWgP1Mu0ubgaxn/XfKpys//miQGZB6P7jhStJbROTfL5zvS4b+8CdIbnfkB+MNpfOk=
X-Gm-Gg: AYBFou2mzqx8JVM/OblCVS8LQTXA/o3QwDySIWUDX17PwvHCkpGuvGVRlKjX3V4OSab
	mn/A6hb3e6ShPbsH0qToOUVSFkIrSop3+Pi/ag/0EJkSVXwPxFJ9cVQoNrp9zx0xHJKM61xPGyG
	W2I5OAouFIvU84Wd5E+LYvFwkh37+B78S03pJWTubLLWzDmu23ok3UOqdpAqk0F9/qWQm64xG6S
	1G3EvsAPkrhkH8sJ7rAxOrWPqO9dh7q14uKpmcDbhnXiilzczkmbXbd3BrNe9gmtytH6cgF+Js0
	cSDTPxcG/3SbecpTrm05xLar1PbRmiovEWj1eierqxMassSCqJwJT0KvLLW/aGv6BFkVrkMcLtT
	xhdzG+m04iw4yOA4SB7BA4diWvqKsGWEw3mS/hWx5+/7N8WhDWqRHfzoOqvdN426gzya+hI1Efx
	684Meny2HQI7gY0a9vIDeZ3saBFjx7EqpYaS6yNMl1Woxc1sLfR4hmTxo5OQkRRi0o380oN1QIF
	InzrlozXpm8hHohN/R3aHVHJPbF13UOgPy24azm9nQ+Qf7VuS7HlQmrD9Qt8oydeUvscLCqhF0V
	QWsiMEElUfFtFI7Wl+YFJYnoZyBf1xzBpw==
X-Received: by 2002:a05:6820:4418:b0:6f5:f71c:1acf with SMTP id 006d021491bc7-718a6b35a93mr1418391eaf.58.1794336256417;
        Tue, 10 Nov 2026 10:44:16 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:15 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 5/6] wifi: rtlwifi: use ieee80211_is_ctl() instead of WLAN_FC_GET_TYPE()
Date: Tue, 10 Nov 2026 12:44:08 -0600
Message-ID: <20261110184409.42205-6-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
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

Six RX status parsers read the frame type with WLAN_FC_GET_TYPE() from
wifi.h only to compare it against IEEE80211_FTYPE_CTL.
ieee80211_is_ctl() from <linux/ieee80211.h> does that test directly on
the little endian frame control.

Use it at the six sites, drop the type variables that only held the
result, and remove WLAN_FC_GET_TYPE() together with WLAN_FC_GET_VERS(),
WLAN_FC_GET_STYPE() and WLAN_FC_MORE_DATA(), which have no users.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/wifi.h                | 4 ----
 7 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
index 99472053ccff..3ab08b345df7 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
@@ -221,7 +221,7 @@ static void _rtl92ce_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
-	u16 type, c_fc;
+	u16 c_fc;
 	bool packet_matchbssid, packet_toself, packet_beacon = false;
 
 	tmp_buf = skb->data + pstats->rx_drvinfo_size + pstats->rx_bufshift;
@@ -229,11 +229,10 @@ static void _rtl92ce_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	c_fc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
 
 	packet_matchbssid =
-	    ((IEEE80211_FTYPE_CTL != type) &&
+	    (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (c_fc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (c_fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c
index a76f2dc8a977..c3ea858af693 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c
@@ -719,17 +719,16 @@ void rtl92c_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
-	u16 type, cpu_fc;
+	u16 cpu_fc;
 	bool packet_matchbssid, packet_toself, packet_beacon = false;
 
 	tmp_buf = skb->data + pstats->rx_drvinfo_size + pstats->rx_bufshift;
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	cpu_fc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
 	packet_matchbssid =
-	    ((IEEE80211_FTYPE_CTL != type) &&
+	    (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (cpu_fc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (cpu_fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
index 9f9a34492030..0fcba5b56c71 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
@@ -355,7 +355,7 @@ static void _rtl92d_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	bool packet_matchbssid;
 	bool packet_beacon;
 	bool packet_toself;
-	u16 type, cfc;
+	u16 cfc;
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
@@ -364,9 +364,8 @@ static void _rtl92d_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	cfc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
-	packet_matchbssid = ((type != IEEE80211_FTYPE_CTL) &&
+	packet_matchbssid = (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (cfc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (cfc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
index b057d035a3a8..3fb8a641770d 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
@@ -201,7 +201,7 @@ static void _rtl92se_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
-	u16 type, cfc;
+	u16 cfc;
 	bool packet_matchbssid, packet_toself, packet_beacon = false;
 
 	tmp_buf = skb->data + pstats->rx_drvinfo_size + pstats->rx_bufshift;
@@ -209,10 +209,9 @@ static void _rtl92se_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	cfc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
 
-	packet_matchbssid = ((IEEE80211_FTYPE_CTL != type) &&
+	packet_matchbssid = (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (cfc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (cfc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
index f40b0efebe3a..976d840d9e49 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
@@ -225,17 +225,16 @@ static void translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	/*u8 *psaddr;*/
-	u16 fc, type;
+	u16 fc;
 	bool packet_matchbssid, packet_toself, packet_beacon;
 
 	tmp_buf = skb->data + pstatus->rx_drvinfo_size + pstatus->rx_bufshift;
 
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = le16_to_cpu(hdr->frame_control);
-	type = WLAN_FC_GET_TYPE(hdr->frame_control);
 	praddr = hdr->addr1;
 
-	packet_matchbssid = ((IEEE80211_FTYPE_CTL != type) &&
+	packet_matchbssid = (!ieee80211_is_ctl(hdr->frame_control) &&
 		(ether_addr_equal(mac->bssid, (fc & IEEE80211_FCTL_TODS) ?
 		 hdr->addr1 : (fc & IEEE80211_FCTL_FROMDS) ?
 		 hdr->addr2 : hdr->addr3)) &&
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
index b6029bfaedac..bb9fc0783bdc 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
@@ -197,19 +197,18 @@ static void _rtl8723be_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	u8 *psaddr;
-	u16 fc, type;
+	u16 fc;
 	bool packet_matchbssid, packet_toself, packet_beacon;
 
 	tmp_buf = skb->data + pstatus->rx_drvinfo_size + pstatus->rx_bufshift;
 
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = le16_to_cpu(hdr->frame_control);
-	type = WLAN_FC_GET_TYPE(hdr->frame_control);
 	praddr = hdr->addr1;
 	psaddr = ieee80211_get_SA(hdr);
 	memcpy(pstatus->psaddr, psaddr, ETH_ALEN);
 
-	packet_matchbssid = ((IEEE80211_FTYPE_CTL != type) &&
+	packet_matchbssid = (!ieee80211_is_ctl(hdr->frame_control) &&
 	     (ether_addr_equal(mac->bssid, (fc & IEEE80211_FCTL_TODS) ?
 				  hdr->addr1 : (fc & IEEE80211_FCTL_FROMDS) ?
 				  hdr->addr2 : hdr->addr3)) &&
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index 24c6db867421..e289a88e9666 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2810,10 +2810,6 @@ enum bt_radio_shared {
 
 #define packet_get_type(_packet) (EF1BYTE((_packet).octet[0]) & 0xFC)
 #define RTL_WATCH_DOG_TIME	2000
-#define WLAN_FC_GET_VERS(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_VERS)
-#define WLAN_FC_GET_TYPE(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_FTYPE)
-#define WLAN_FC_GET_STYPE(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_STYPE)
-#define WLAN_FC_MORE_DATA(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_MOREDATA)
 #define rtl_dm(rtlpriv)		(&((rtlpriv)->dm))
 
 #define	RT_RF_OFF_LEVL_ASPM		BIT(0)	/*PCI ASPM */
-- 
2.43.0

