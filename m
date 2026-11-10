Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336254;
	b=In0vC21yajopZT0kWoiZ6r1PuqRCVwPgl/ZH8uZzPPfQbsQc+1Fyiqc+p0cOsfeAWnj4
	 8M08g087WmKagqxOSquiEV25odrAbf707vvdQxdfn4SUTuQPK+HcPVYk5PU5ZfmtzT7dN
	 F+y99SPL/M8Rmhl8bGGhxdLh6QaOzJ4CAUizh8ncAZgKm03dFZ3taWUlCsqwJ540437VB
	 bsDsoNDutriXMX7ul8s9AEbuyR08WsbTAYSs7XZU3947b8lqrpaNi/++ZqLtSqNUuzhas
	 wh+zbEu/ldu/Cmyy6amLononeK6aMMzzKo8MUHzx76kgxHMp8GTYX/pRMkq7Dgr/X2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v7IWcFa5bDcP/IkzkxLByxcvvcJCb0rVvXsvswLfU7s=;
	b=RpKYjBpZdT9G4IzqbYS70o/ZxA1pcWBhIAWmvfUAH2S4iBDV8gMcwQ404T17UgktvnUG
	 f7IqXDoyxBOD/jeqnpAmuZjwateSgxKQe8QymKFD9PxZA3ezhbzBrj6K4NK3wb1Xb5s4k
	 aRcj8DK+FrCSI4dgITCiH2HrHfFwFJHgUDUiQ9XO3grzfKDrLQKKa1XKG9aubc6c0Fe4k
	 qBw659x40i8N09l3ZbQhCjbMY7hR+jL35L1HOphjOBr9zZjY0IMbx41bF4f4rJjIKxv98
	 YTnL9r7ke6ngaf7pHroHXV4WdYfBQSZdPbKOnrDNFl1ljzhSx1MzA2/Hr7pGv11dTlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qWdeKnr;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCEC606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCEC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qWdeKnr
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6d290b10a35so962816eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336253; x=1794941053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7IWcFa5bDcP/IkzkxLByxcvvcJCb0rVvXsvswLfU7s=;
        b=0qWdeKnroeIiQimwigDbxW6bnE3U8B7hRD6cLYGTqkKcCKTMsM+kta8mdjp7CsWONE
         kt6mLn3D9s/ZmZJNgmBKzIIqdTn7I2I5mCUZzgzw+3Z7fCVEHj5El3yFckAATc4bhlz7
         ppmaLXTMX2eTCX3gy/91noAsWoFALFLJpzgjR4ZvPccXmPAf90HcvHMP5xnhtj2Gwyfm
         hwMelOeEdszKv+89BQxo7muyZhsNAHczVJtlcHlS2IFEJKo5fDR2ZA/jN7P5VuuUb5fq
         LFb3hgY2JvbsEA87oF69RsDxiWH5mnzqyxCR9Wa3uGEByv1KaYOTsdQQR1k4r8E4Drez
         ju1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336253; x=1794941053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7IWcFa5bDcP/IkzkxLByxcvvcJCb0rVvXsvswLfU7s=;
        b=Gwa5yLvum1wq7+hEo8CIXt6uF9KisY9Ake8NWy/SGf+E+7iRh6g3N8X3K9tpkp4WjJ
         fTJ5LaH8Lo0SJkzkq5yOXI5fwXPDOFZ8UuntFsmYdiEHT2Svvc/xnfu/J/o7doisGxJ3
         /A1BdJ2BeyQRmY97njlfYUg86+pCPMeCXOHBa8no7ItjbNUlc7nQmVKELo2AMq8nRhtg
         Ub4iK5QTEG4SptbW3q3iuLSyKN0sbLwyK3/7NmCRNUvGfypcBPVkKlqTlnNJphwY/is3
         1r08sCA+qNslHN6hgJIQcIpsg5pOa/Jz8nEiMRVfzWOaHTjvTyqkc5sLhdwMFdmCt9As
         TQLg==
X-Forwarded-Encrypted: i=1; AL+hErGWoMx9UNLNUgwZijUIYlRx6+RRVKJJodSvJn7gWf+Ns1OTtSM7KNAB0XLLhY8jiXDjO6pokwHMMBw2iK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aqaVTW3r2s8dL+Zswz8OWjuAzR4nMNTgcUNR5AWXD1I6edBUp
	3oOD6Trb75X5+dLfcF8DH5xNL4hXHF2QwrE/Y40UMnR+rhPAVYHBoleG
X-Gm-Gg: AYBFou3ApenuZw9SW/2NPhaVHH8lEaEznDhPCtjBiZjpgwwcEsTnpu0EBdAJKTryLl8
	kGExmr9l1Xw+wYMOThIOPT9Cc7UmgyQACo52GP77NAK1JTb67ze8qDsJnJzZnEmWwMkItW7VfQM
	Ce1tl7Lc4ZX8H3OIcCwxDnucu1UdY6hfWfNhCHBm1EoR5Bt33xzo3oSj+Dlr0H+hnS9VRSdHRCj
	PIcKQuccelrK7t9KoV9R+TOhDBzZUoGbMe4wdTJdCB/XRkMK4FcAuzf830gFTwbgaX2/vtp+yiG
	hFw/1/RdniNst9zEsEUqLyu5ShTMGH31guJSfg7cfArB4R0VnTFTx/XeV8OTHEA0m0IpRlCpWY+
	Bwy5k1YVIwUtFBKBJx3pdckSbnRinzd5M3N5hwlozz5F1q6B54eb2xRcuvfutXo09EVK+AnxOlD
	TLMq49ZoCbRpk1mH+DxEVyC4TtyTX2oQcSal6/Su0jkWbmZbF6MPEYEyX4sM5w5aO6P8cIlwAbw
	eLAQkx+ekxY/U497Y0rwPA9cU5xI8RGpCdCr/A/XS378I/6rdkaNZNEYE9KDbwTfKKk07/13+1Q
	uJwFf4mRngphb5KzCLLNuROVAbDNudWTWA==
X-Received: by 2002:a05:6820:1356:b0:703:27e0:356 with SMTP id 006d021491bc7-718a5c5b594mr1498882eaf.73.1794336252916;
        Tue, 10 Nov 2026 10:44:12 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:11 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 1/6] wifi: rtlwifi: use struct ieee80211_pspoll for the PS Poll reserved page
Date: Tue, 10 Nov 2026 12:44:04 -0600
Message-ID: <20261110184409.42205-2-rishik.yechuri.code@gmail.com>
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

The reserved page builders fill in the PS Poll template with the
SET_80211_PS_POLL_* macros from base.h, which write at fixed byte
offsets into a u8 buffer. The AID macro stores a host order u16, so
the frame is only correct on a little endian machine.

Point at the template with struct ieee80211_pspoll from
<linux/ieee80211.h> instead. Its aid member is __le16, so the AID goes
through cpu_to_le16() and sparse can check it. The two addresses are
copied with ether_addr_copy() on the struct members. Remove the three
macros.

On little endian systems the bytes written are the same as before.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/base.h   |  7 -------
 .../wireless/realtek/rtlwifi/rtl8188ee/fw.c   | 10 +++++-----
 .../realtek/rtlwifi/rtl8192c/fw_common.c      | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8192de/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8192ee/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8723ae/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8723be/fw.c   | 10 +++++-----
 .../wireless/realtek/rtlwifi/rtl8821ae/fw.c   | 20 +++++++++----------
 8 files changed, 40 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/base.h b/drivers/net/wireless/realtek/rtlwifi/base.h
index f3a6a43a42ec..870ca1dff3ee 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.h
+++ b/drivers/net/wireless/realtek/rtlwifi/base.h
@@ -46,13 +46,6 @@ enum ap_peer {
 #define MAX_LISTEN_INTERVAL		10
 #define MAX_RATE_TRIES			4
 
-#define SET_80211_PS_POLL_AID(_hdr, _val)		\
-	(*(u16 *)((u8 *)(_hdr) + 2) = _val)
-#define SET_80211_PS_POLL_BSSID(_hdr, _val)		\
-	ether_addr_copy(((u8 *)(_hdr)) + 4, (u8 *)(_val))
-#define SET_80211_PS_POLL_TA(_hdr, _val)		\
-	ether_addr_copy(((u8 *)(_hdr))+10, (u8 *)(_val))
-
 #define SET_80211_HDR_ADDRESS1(_hdr, _val)	\
 	CP_MACADDR((u8 *)(_hdr)+FRAME_OFFSET_ADDRESS1, (u8 *)(_val))
 #define SET_80211_HDR_ADDRESS2(_hdr, _val)	\
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
index 9a9f9e14f472..cda9388388ab 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
@@ -545,7 +545,7 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	u8 u1rsvdpageloc[5] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 
@@ -561,10 +561,10 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
index b618f07f29b0..3e8befbcf865 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
@@ -573,7 +573,7 @@ void rtl92c_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	bool b_dlok = false;
 
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	/*---------------------------------------------------------
@@ -586,10 +586,10 @@ void rtl92c_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	/*-------------------------------------------------------
 				(2) ps-poll
 	--------------------------------------------------------*/
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
index c8444a72ff69..23c7b088e8cd 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
@@ -260,7 +260,7 @@ void rtl92d_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
 	u8 u1rsvdpageloc[3] = { PROBERSP_PG, PSPOLL_PG, NULL_PG };
 	bool dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	/*---------------------------------------------------------
@@ -272,10 +272,10 @@ void rtl92d_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
 	/*-------------------------------------------------------
 						(2) ps-poll
 	--------------------------------------------------------*/
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 	/*--------------------------------------------------------
 						(3) null data
 	---------------------------------------------------------*/
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
index 3728e3ec2c25..e50db134682f 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
@@ -663,7 +663,7 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	bool b_dlok = false;
 
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	u8 *qosnull;
@@ -680,10 +680,10 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
index d1b50a80c191..63c55dae2aab 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
@@ -393,7 +393,7 @@ void rtl8723e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	u8 u1rsvdpageloc[3] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 
@@ -409,10 +409,10 @@ void rtl8723e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
index b3e6c91e26c0..33c8fb0c49ed 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
@@ -484,7 +484,7 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	bool b_dlok = false;
 
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *p_probersp;
 	u8 *qosnull;
@@ -501,10 +501,10 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(2) ps-poll
 	 *-------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet[PSPOLL_PG * 128];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet[PSPOLL_PG * 128];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
index 4facbc0bff4e..ddae3a14f79e 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
@@ -1525,7 +1525,7 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc2[7] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *qosnull;
 	u8 *btqosnull;
@@ -1547,10 +1547,10 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet_8812[PSPOLL_PG * 512];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet_8812[PSPOLL_PG * 512];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
@@ -1662,7 +1662,7 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc2[7] = { 0 };
 	bool b_dlok = false;
 	u8 *beacon;
-	u8 *p_pspoll;
+	struct ieee80211_pspoll *p_pspoll;
 	u8 *nullfunc;
 	u8 *qosnull;
 	u8 *btqosnull;
@@ -1684,10 +1684,10 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(2) ps-poll
 	 *--------------------------------------------------------
 	 */
-	p_pspoll = &reserved_page_packet_8821[PSPOLL_PG * 256];
-	SET_80211_PS_POLL_AID(p_pspoll, (mac->assoc_id | 0xc000));
-	SET_80211_PS_POLL_BSSID(p_pspoll, mac->bssid);
-	SET_80211_PS_POLL_TA(p_pspoll, mac->mac_addr);
+	p_pspoll = (struct ieee80211_pspoll *)&reserved_page_packet_8821[PSPOLL_PG * 256];
+	p_pspoll->aid = cpu_to_le16(mac->assoc_id | 0xc000);
+	ether_addr_copy(p_pspoll->bssid, mac->bssid);
+	ether_addr_copy(p_pspoll->ta, mac->mac_addr);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PSPOLL(u1rsvdpageloc, PSPOLL_PG);
 
-- 
2.43.0

