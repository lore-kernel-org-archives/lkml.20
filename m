Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336256;
	b=SBwyn6ROEW2CuQ/w3HQ4THPkYKySQRTTmjZLzVECVgmL+9/U6GY1KAlG8VfDP1kTRbI6
	 OI5mrasVKXbwiAyWZexRYMmViy4kc7IBLUA40X0zx0DRcvQCzlOwEKRlbz3r4OkT+7zG5
	 2OkV6BCM6xFx2iwSwTaGtkPkYH1ykjodoZutAFF4cKP4hCzUC/7/YWdktjANdE+Ei8r26
	 JjId17ykdSNKwfq4s96twkVICayhFkZf4wOtiONr3fBDT2pintdIQ35Oh3+nxXSIt36EH
	 k7cM29NQwypqI/JsOlqLZDGIEArgTBAub0U+KMPQ+utd+gglh6UTcH+lO0H3wApXrhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=c7iQPNEuFokge8g/4lPCQ9+aiu7f01rkcFqUuPZEyWA=;
	b=nXLHcnXLlmqRf8LTo+43yy0/mhz0vLpH+Gp/fHZir+8p5usg8RRioB3gmTFkYXrmzDYe
	 Tw//jGbr64M9JuyN3AEUAmd4i7CHYZReyxpjeqjJHfXe73ieJWjx0gZASdqqac9MOIfHP
	 SfUgDHLtcKC9XH6wai4hhV/8B8mlcpq+mqRjBEh1Nm1ndR/lSIp+oORmwOxlddqvV66pn
	 /dWsEm/9zUZQuw1+OXU6T7mZT55pVHWif0TyE4Tb8nkrlh4x/214qJ8hQI+HIsHIKr5Sv
	 /6fZ2kN0EokQ23ybGve1rsjNB7G6xU4u876T0T+KysNNRBofLQz9yiGY1Ctfav/0y1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZGd3Lml;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8D3606B580
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8D3606B580
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZGd3Lml
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716b58a4365so1240821eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336254; x=1794941054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7iQPNEuFokge8g/4lPCQ9+aiu7f01rkcFqUuPZEyWA=;
        b=UZGd3Lmlxn3E+8+ZEm40YQmUNrqrDl4QjBHsn60c4BDcs81s3Sn/QukqpU884C9D7Q
         w7ofgcCOG8v0dM/6p9ZJrafq5FYAn99LSuqgNxk8qhr1FJzbXh7n86kZeAT+s+YtrL3Y
         xhITxjSs9EAjMvC+OVn7qTBQvYo8cGHRG+2yM+WVEJTn0D+hzxcI8a9KCwf4IMrB5I1x
         2SZnA5sp8IEwQnCkE/9vW1aU2g7wWsuW3o3mvavivwbdhCyqvK1c4wynfB0Ke3AMAE3s
         gXcbZpmbniTyWa+F1T2GovLlUiXFFiy86WYYuO7SsAKKI/lbyNoCplAduCZuOM12CKhN
         IFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336254; x=1794941054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7iQPNEuFokge8g/4lPCQ9+aiu7f01rkcFqUuPZEyWA=;
        b=E9bXcSSoHhFmFfjsKKW9Q4rwNVJrVggDGE/EMCnbAGbOuuCOjMgowI1WA61zWkIIog
         +YSIYgmKy0D96EYBETJto0pDq3SwL/1stUp/+MdLWPQM+HEurPy737b3Pnr3PEzNF4AQ
         OfWYxYLcGEbEnso8V667JPgAbwhDGmiXTFpHbBIPgsBVHyeRG9BoHIftWpWnCEKvuJFc
         ZJJJ3Diplo4ygcYG8S1ujkNz7mWPQoWTAFL/dQKagfcsXYbiEaF0ooWYO7dLpHyjvEiO
         umPA8vNfglc4MF8Ldagb0mQgWFGNsbCMp9qenDWlOEpO5DSyor7P+HvSdVMB43LH0upX
         kwMg==
X-Forwarded-Encrypted: i=1; AL+hErHo5W8WP1fLxnJRMbGIdn7bLd4Pr0oGl5Drfi2I7GFbH7puH4D5ket4b4TfNGaDPgvN2s4dd6cH1kRqpbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z967hinbxPwo9YFDKOTGXDMSC+kzFuU8nQUGbnae38lQllX8J7r
	5SeQDCgyiITmjkNsTCVVPxhyvYDQoucLLolItvnTL7zBY6eXwPivRhMclGsRUUSN1QE=
X-Gm-Gg: AYBFou30sCDzccd+nxGmHwZJJGlInIn9rTl3WpKnu7NQW+iWs0f6pvDvt2cEbfTP5T1
	4dfIlKg7CxTRmI+GcvTgDekyUqYtyvV6YUoe54Bcz1hsmKYmHA4HDWwD2XmijjO7/LqrDTKECY9
	4M9T/dM52BShEp2cadx19A8+RtYoQbhwTVt08LaBs+FT8HbHOAjP3sAynFfGHpHJ2nKWUGXbq8V
	1ea6PmuJ65cKv2wcZHG35eIKKTTyD9QUmBYoXuXwcAE4Ca+P1VQ4EP4LL7pcqege5GIu9luuGVl
	EA3bbO0PzlMUEJj1AYuUg9mY5kJmfvETfYPGSLKciEnMrjx7trj7dz1USmjGVc84qSc21kEEykv
	dibddF6fyqud6I4GqTTEwguFp8B0X71ZjIhxKc15PceokjQmI9yoCHeiBbHN/e/EycfwxEC+LKY
	gRbJ+5+NOxEPSqCVtQpxElIRCnSbjuh9L2xRTVC0kROV8z77xQwdMOJ3w+V3KBJiD/wSja0tMEP
	cWIegYvrG8SfRgod+J2BlrYTA7XglSt5QmDDblL/BCDU/klgwgZbbdhRJ5D8Xrp+8C3nmMEyOmq
	613MwdIg77UqhAKat9/aNE1kvs/XOTgYLkxz+DiSOMWSWkX3d53Wnhum
X-Received: by 2002:a05:6820:c0d4:20b0:717:10a2:89a6 with SMTP id 006d021491bc7-718a721abdfmr1253559eaf.80.1794336254069;
        Tue, 10 Nov 2026 10:44:14 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:13 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 2/6] wifi: rtlwifi: use struct ieee80211_hdr for the reserved page headers
Date: Tue, 10 Nov 2026 12:44:05 -0600
Message-ID: <20261110184409.42205-3-rishik.yechuri.code@gmail.com>
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

The reserved page builders also patch the addresses of the beacon, null
data, probe response, QoS null data, BT QoS null data and ARP response
templates with SET_80211_HDR_ADDRESS1(), SET_80211_HDR_ADDRESS2() and
SET_80211_HDR_ADDRESS3() from base.h. These add a hard coded byte
offset to a u8 pointer and copy the six bytes one at a time through
the CP_MACADDR() macro in wifi.h.

struct ieee80211_hdr from <linux/ieee80211.h> has the addr1, addr2 and
addr3 members at the same offsets. Point at each template with that
struct and copy the addresses with ether_addr_copy() on the members.
Then remove the three macros, CP_MACADDR() and the FRAME_OFFSET_*
constants, which have no other users.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/base.h   | 14 ---
 .../wireless/realtek/rtlwifi/rtl8188ee/fw.c   | 28 +++---
 .../realtek/rtlwifi/rtl8192c/fw_common.c      | 28 +++---
 .../wireless/realtek/rtlwifi/rtl8192de/fw.c   | 28 +++---
 .../wireless/realtek/rtlwifi/rtl8192ee/fw.c   | 48 +++++-----
 .../wireless/realtek/rtlwifi/rtl8723ae/fw.c   | 28 +++---
 .../wireless/realtek/rtlwifi/rtl8723be/fw.c   | 48 +++++-----
 .../wireless/realtek/rtlwifi/rtl8821ae/fw.c   | 96 +++++++++----------
 drivers/net/wireless/realtek/rtlwifi/wifi.h   |  5 -
 9 files changed, 152 insertions(+), 171 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/base.h b/drivers/net/wireless/realtek/rtlwifi/base.h
index 870ca1dff3ee..e23e6934d1a3 100644
--- a/drivers/net/wireless/realtek/rtlwifi/base.h
+++ b/drivers/net/wireless/realtek/rtlwifi/base.h
@@ -36,23 +36,9 @@ enum ap_peer {
 #define MAX_BIT_RATE_LONG_GI_1NSS_80MHZ_MCS9	390	/* Mbps */
 #define MAX_BIT_RATE_LONG_GI_1NSS_80MHZ_MCS7	293	/* Mbps */
 
-#define FRAME_OFFSET_FRAME_CONTROL	0
-#define FRAME_OFFSET_DURATION		2
-#define FRAME_OFFSET_ADDRESS1		4
-#define FRAME_OFFSET_ADDRESS2		10
-#define FRAME_OFFSET_ADDRESS3		16
-#define FRAME_OFFSET_SEQUENCE		22
-#define FRAME_OFFSET_ADDRESS4		24
 #define MAX_LISTEN_INTERVAL		10
 #define MAX_RATE_TRIES			4
 
-#define SET_80211_HDR_ADDRESS1(_hdr, _val)	\
-	CP_MACADDR((u8 *)(_hdr)+FRAME_OFFSET_ADDRESS1, (u8 *)(_val))
-#define SET_80211_HDR_ADDRESS2(_hdr, _val)	\
-	CP_MACADDR((u8 *)(_hdr)+FRAME_OFFSET_ADDRESS2, (u8 *)(_val))
-#define SET_80211_HDR_ADDRESS3(_hdr, _val)	\
-	CP_MACADDR((u8 *)(_hdr)+FRAME_OFFSET_ADDRESS3, (u8 *)(_val))
-
 #define SET_TX_DESC_SPE_RPT(__pdesc, __val)			\
 	le32p_replace_bits((__le32 *)(__pdesc + 8), __val, BIT(19))
 #define SET_TX_DESC_SW_DEFINE(__pdesc, __val)	\
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
index cda9388388ab..da9ef7cab2fb 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
@@ -544,18 +544,18 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	bool rtstatus;
 	u8 u1rsvdpageloc[5] = { 0 };
 	bool b_dlok = false;
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *p_probersp;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *p_probersp;
 
 	/*---------------------------------------------------------
 	 *			(1) beacon
 	 *---------------------------------------------------------
 	 */
-	beacon = &reserved_page_packet[BEACON_PG * 128];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet[BEACON_PG * 128];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 
 	/*-------------------------------------------------------
 	 *			(2) ps-poll
@@ -572,10 +572,10 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(3) null data
 	 *---------------------------------------------------------
 	 */
-	nullfunc = &reserved_page_packet[NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet[NULL_PG * 128];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_NULL_DATA(u1rsvdpageloc, NULL_PG);
 
@@ -583,10 +583,10 @@ void rtl88e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(4) probe response
 	 *----------------------------------------------------------
 	 */
-	p_probersp = &reserved_page_packet[PROBERSP_PG * 128];
-	SET_80211_HDR_ADDRESS1(p_probersp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(p_probersp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(p_probersp, mac->bssid);
+	p_probersp = (struct ieee80211_hdr *)&reserved_page_packet[PROBERSP_PG * 128];
+	ether_addr_copy(p_probersp->addr1, mac->bssid);
+	ether_addr_copy(p_probersp->addr2, mac->mac_addr);
+	ether_addr_copy(p_probersp->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PROBE_RSP(u1rsvdpageloc, PROBERSP_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
index 3e8befbcf865..9570e8608d8c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/fw_common.c
@@ -572,16 +572,16 @@ void rtl92c_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc[3] = { 0 };
 	bool b_dlok = false;
 
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *p_probersp;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *p_probersp;
 	/*---------------------------------------------------------
 				(1) beacon
 	---------------------------------------------------------*/
-	beacon = &reserved_page_packet[BEACON_PG * 128];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet[BEACON_PG * 128];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 
 	/*-------------------------------------------------------
 				(2) ps-poll
@@ -596,20 +596,20 @@ void rtl92c_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	/*--------------------------------------------------------
 				(3) null data
 	---------------------------------------------------------*/
-	nullfunc = &reserved_page_packet[NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet[NULL_PG * 128];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_NULL_DATA(u1rsvdpageloc, NULL_PG);
 
 	/*---------------------------------------------------------
 				(4) probe response
 	----------------------------------------------------------*/
-	p_probersp = &reserved_page_packet[PROBERSP_PG * 128];
-	SET_80211_HDR_ADDRESS1(p_probersp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(p_probersp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(p_probersp, mac->bssid);
+	p_probersp = (struct ieee80211_hdr *)&reserved_page_packet[PROBERSP_PG * 128];
+	ether_addr_copy(p_probersp->addr1, mac->bssid);
+	ether_addr_copy(p_probersp->addr2, mac->mac_addr);
+	ether_addr_copy(p_probersp->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PROBE_RSP(u1rsvdpageloc, PROBERSP_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
index 23c7b088e8cd..019a64bf1a47 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192de/fw.c
@@ -259,16 +259,16 @@ void rtl92d_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
 	bool rtstatus;
 	u8 u1rsvdpageloc[3] = { PROBERSP_PG, PSPOLL_PG, NULL_PG };
 	bool dlok = false;
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *p_probersp;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *p_probersp;
 	/*---------------------------------------------------------
 						(1) beacon
 	---------------------------------------------------------*/
-	beacon = &reserved_page_packet[BEACON_PG * 128];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet[BEACON_PG * 128];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 	/*-------------------------------------------------------
 						(2) ps-poll
 	--------------------------------------------------------*/
@@ -279,17 +279,17 @@ void rtl92d_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
 	/*--------------------------------------------------------
 						(3) null data
 	---------------------------------------------------------*/
-	nullfunc = &reserved_page_packet[NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet[NULL_PG * 128];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 	/*---------------------------------------------------------
 						(4) probe response
 	----------------------------------------------------------*/
-	p_probersp = &reserved_page_packet[PROBERSP_PG * 128];
-	SET_80211_HDR_ADDRESS1(p_probersp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(p_probersp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(p_probersp, mac->bssid);
+	p_probersp = (struct ieee80211_hdr *)&reserved_page_packet[PROBERSP_PG * 128];
+	ether_addr_copy(p_probersp->addr1, mac->bssid);
+	ether_addr_copy(p_probersp->addr2, mac->mac_addr);
+	ether_addr_copy(p_probersp->addr3, mac->bssid);
 	totalpacketlen = TOTAL_RESERVED_PKT_LEN;
 	RT_PRINT_DATA(rtlpriv, COMP_CMD, DBG_LOUD,
 		      "rtl92d_set_fw_rsvdpagepkt(): HW_VAR_SET_TX_CMD: ALL",
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
index e50db134682f..cbbda64e7ce2 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.c
@@ -662,19 +662,19 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	u8 u1rsvdpageloc[5] = { 0 };
 	bool b_dlok = false;
 
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *p_probersp;
-	u8 *qosnull;
-	u8 *btqosnull;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *p_probersp;
+	struct ieee80211_hdr *qosnull;
+	struct ieee80211_hdr *btqosnull;
 	/*---------------------------------------------------------
 	 *			(1) beacon
 	 *---------------------------------------------------------
 	 */
-	beacon = &reserved_page_packet[BEACON_PG * 128];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet[BEACON_PG * 128];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 
 	/*-------------------------------------------------------
 	 *			(2) ps-poll
@@ -691,10 +691,10 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(3) null data
 	 *---------------------------------------------------------
 	 */
-	nullfunc = &reserved_page_packet[NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet[NULL_PG * 128];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_NULL_DATA(u1rsvdpageloc, NULL_PG);
 
@@ -702,10 +702,10 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(4) probe response
 	 *----------------------------------------------------------
 	 */
-	p_probersp = &reserved_page_packet[PROBERSP_PG * 128];
-	SET_80211_HDR_ADDRESS1(p_probersp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(p_probersp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(p_probersp, mac->bssid);
+	p_probersp = (struct ieee80211_hdr *)&reserved_page_packet[PROBERSP_PG * 128];
+	ether_addr_copy(p_probersp->addr1, mac->bssid);
+	ether_addr_copy(p_probersp->addr2, mac->mac_addr);
+	ether_addr_copy(p_probersp->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PROBE_RSP(u1rsvdpageloc, PROBERSP_PG);
 
@@ -713,10 +713,10 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(5) QoS null data
 	 *----------------------------------------------------------
 	 */
-	qosnull = &reserved_page_packet[QOS_NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(qosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(qosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(qosnull, mac->bssid);
+	qosnull = (struct ieee80211_hdr *)&reserved_page_packet[QOS_NULL_PG * 128];
+	ether_addr_copy(qosnull->addr1, mac->bssid);
+	ether_addr_copy(qosnull->addr2, mac->mac_addr);
+	ether_addr_copy(qosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_QOS_NULL_DATA(u1rsvdpageloc, QOS_NULL_PG);
 
@@ -724,10 +724,10 @@ void rtl92ee_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(6) BT QoS null data
 	 *----------------------------------------------------------
 	 */
-	btqosnull = &reserved_page_packet[BT_QOS_NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(btqosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(btqosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(btqosnull, mac->bssid);
+	btqosnull = (struct ieee80211_hdr *)&reserved_page_packet[BT_QOS_NULL_PG * 128];
+	ether_addr_copy(btqosnull->addr1, mac->bssid);
+	ether_addr_copy(btqosnull->addr2, mac->mac_addr);
+	ether_addr_copy(btqosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_BT_QOS_NULL_DATA(u1rsvdpageloc, BT_QOS_NULL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
index 63c55dae2aab..14f9402dba8a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/fw.c
@@ -392,18 +392,18 @@ void rtl8723e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	bool rtstatus;
 	u8 u1rsvdpageloc[3] = { 0 };
 	bool b_dlok = false;
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *p_probersp;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *p_probersp;
 
 	/*---------------------------------------------------------
 	 *			(1) beacon
 	 *---------------------------------------------------------
 	 */
-	beacon = &reserved_page_packet[BEACON_PG * 128];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet[BEACON_PG * 128];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 
 	/*-------------------------------------------------------
 	 *			(2) ps-poll
@@ -420,10 +420,10 @@ void rtl8723e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(3) null data
 	 *---------------------------------------------------------
 	 */
-	nullfunc = &reserved_page_packet[NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet[NULL_PG * 128];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_NULL_DATA(u1rsvdpageloc, NULL_PG);
 
@@ -431,10 +431,10 @@ void rtl8723e_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool b_dl_finished)
 	 *			(4) probe response
 	 *----------------------------------------------------------
 	 */
-	p_probersp = &reserved_page_packet[PROBERSP_PG * 128];
-	SET_80211_HDR_ADDRESS1(p_probersp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(p_probersp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(p_probersp, mac->bssid);
+	p_probersp = (struct ieee80211_hdr *)&reserved_page_packet[PROBERSP_PG * 128];
+	ether_addr_copy(p_probersp->addr1, mac->bssid);
+	ether_addr_copy(p_probersp->addr2, mac->mac_addr);
+	ether_addr_copy(p_probersp->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PROBE_RSP(u1rsvdpageloc, PROBERSP_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
index 33c8fb0c49ed..a9e8a58f4287 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/fw.c
@@ -483,19 +483,19 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc[5] = { 0 };
 	bool b_dlok = false;
 
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *p_probersp;
-	u8 *qosnull;
-	u8 *btqosnull;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *p_probersp;
+	struct ieee80211_hdr *qosnull;
+	struct ieee80211_hdr *btqosnull;
 	/*---------------------------------------------------------
 	 *			(1) beacon
 	 *---------------------------------------------------------
 	 */
-	beacon = &reserved_page_packet[BEACON_PG * 128];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet[BEACON_PG * 128];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 
 	/*-------------------------------------------------------
 	 *			(2) ps-poll
@@ -512,10 +512,10 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(3) null data
 	 *--------------------------------------------------------
 	 */
-	nullfunc = &reserved_page_packet[NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet[NULL_PG * 128];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_NULL_DATA(u1rsvdpageloc, NULL_PG);
 
@@ -523,10 +523,10 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(4) probe response
 	 *---------------------------------------------------------
 	 */
-	p_probersp = &reserved_page_packet[PROBERSP_PG * 128];
-	SET_80211_HDR_ADDRESS1(p_probersp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(p_probersp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(p_probersp, mac->bssid);
+	p_probersp = (struct ieee80211_hdr *)&reserved_page_packet[PROBERSP_PG * 128];
+	ether_addr_copy(p_probersp->addr1, mac->bssid);
+	ether_addr_copy(p_probersp->addr2, mac->mac_addr);
+	ether_addr_copy(p_probersp->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_PROBE_RSP(u1rsvdpageloc, PROBERSP_PG);
 
@@ -534,10 +534,10 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(5) QoS Null
 	 *---------------------------------------------------------
 	 */
-	qosnull = &reserved_page_packet[QOS_NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(qosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(qosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(qosnull, mac->bssid);
+	qosnull = (struct ieee80211_hdr *)&reserved_page_packet[QOS_NULL_PG * 128];
+	ether_addr_copy(qosnull->addr1, mac->bssid);
+	ether_addr_copy(qosnull->addr2, mac->mac_addr);
+	ether_addr_copy(qosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_QOS_NULL_DATA(u1rsvdpageloc, QOS_NULL_PG);
 
@@ -545,10 +545,10 @@ void rtl8723be_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(5) QoS Null
 	 *---------------------------------------------------------
 	 */
-	btqosnull = &reserved_page_packet[BT_QOS_NULL_PG * 128];
-	SET_80211_HDR_ADDRESS1(btqosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(btqosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(btqosnull, mac->bssid);
+	btqosnull = (struct ieee80211_hdr *)&reserved_page_packet[BT_QOS_NULL_PG * 128];
+	ether_addr_copy(btqosnull->addr1, mac->bssid);
+	ether_addr_copy(btqosnull->addr2, mac->mac_addr);
+	ether_addr_copy(btqosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_BT_QOS_NULL_DATA(u1rsvdpageloc, BT_QOS_NULL_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
index ddae3a14f79e..00176bd64e84 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.c
@@ -1524,20 +1524,20 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc[5] = { 0 };
 	u8 u1rsvdpageloc2[7] = { 0 };
 	bool b_dlok = false;
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *qosnull;
-	u8 *btqosnull;
-	u8 *arpresp;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *qosnull;
+	struct ieee80211_hdr *btqosnull;
+	struct ieee80211_hdr *arpresp;
 
 	/*---------------------------------------------------------
 	 *			(1) beacon
 	 *---------------------------------------------------------
 	 */
-	beacon = &reserved_page_packet_8812[BEACON_PG * 512];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet_8812[BEACON_PG * 512];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 
 	if (b_dl_finished) {
 		totalpacketlen = 512 - 40;
@@ -1558,10 +1558,10 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(3) null data
 	 *---------------------------------------------------------
 	 */
-	nullfunc = &reserved_page_packet_8812[NULL_PG * 512];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet_8812[NULL_PG * 512];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_NULL_DATA(u1rsvdpageloc, NULL_PG);
 
@@ -1569,10 +1569,10 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(4) Qos null data
 	 *----------------------------------------------------------
 	 */
-	qosnull = &reserved_page_packet_8812[QOSNULL_PG * 512];
-	SET_80211_HDR_ADDRESS1(qosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(qosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(qosnull, mac->bssid);
+	qosnull = (struct ieee80211_hdr *)&reserved_page_packet_8812[QOSNULL_PG * 512];
+	ether_addr_copy(qosnull->addr1, mac->bssid);
+	ether_addr_copy(qosnull->addr2, mac->mac_addr);
+	ether_addr_copy(qosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_QOS_NULL_DATA(u1rsvdpageloc, QOSNULL_PG);
 
@@ -1580,10 +1580,10 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(5) BT Qos null data
 	 *----------------------------------------------------------
 	 */
-	btqosnull = &reserved_page_packet_8812[BT_QOSNULL_PG * 512];
-	SET_80211_HDR_ADDRESS1(btqosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(btqosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(btqosnull, mac->bssid);
+	btqosnull = (struct ieee80211_hdr *)&reserved_page_packet_8812[BT_QOSNULL_PG * 512];
+	ether_addr_copy(btqosnull->addr1, mac->bssid);
+	ether_addr_copy(btqosnull->addr2, mac->mac_addr);
+	ether_addr_copy(btqosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_BT_QOS_NULL_DATA(u1rsvdpageloc, BT_QOSNULL_PG);
 
@@ -1595,10 +1595,10 @@ void rtl8812ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(6) ARP Resp
 	 *----------------------------------------------------------
 	 */
-	arpresp = &reserved_page_packet_8812[ARPRESP_PG * 512];
-	SET_80211_HDR_ADDRESS1(arpresp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(arpresp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(arpresp, mac->bssid);
+	arpresp = (struct ieee80211_hdr *)&reserved_page_packet_8812[ARPRESP_PG * 512];
+	ether_addr_copy(arpresp->addr1, mac->bssid);
+	ether_addr_copy(arpresp->addr2, mac->mac_addr);
+	ether_addr_copy(arpresp->addr3, mac->bssid);
 
 	SET_8821AE_H2CCMD_AOAC_RSVDPAGE_LOC_ARP_RSP(u1rsvdpageloc2, ARPRESP_PG);
 
@@ -1661,20 +1661,20 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	u8 u1rsvdpageloc[5] = { 0 };
 	u8 u1rsvdpageloc2[7] = { 0 };
 	bool b_dlok = false;
-	u8 *beacon;
+	struct ieee80211_hdr *beacon;
 	struct ieee80211_pspoll *p_pspoll;
-	u8 *nullfunc;
-	u8 *qosnull;
-	u8 *btqosnull;
-	u8 *arpresp;
+	struct ieee80211_hdr *nullfunc;
+	struct ieee80211_hdr *qosnull;
+	struct ieee80211_hdr *btqosnull;
+	struct ieee80211_hdr *arpresp;
 
 	/*---------------------------------------------------------
 	 *			(1) beacon
 	 *---------------------------------------------------------
 	 */
-	beacon = &reserved_page_packet_8821[BEACON_PG * 256];
-	SET_80211_HDR_ADDRESS2(beacon, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(beacon, mac->bssid);
+	beacon = (struct ieee80211_hdr *)&reserved_page_packet_8821[BEACON_PG * 256];
+	ether_addr_copy(beacon->addr2, mac->mac_addr);
+	ether_addr_copy(beacon->addr3, mac->bssid);
 
 	if (b_dl_finished) {
 		totalpacketlen = 256 - 40;
@@ -1695,10 +1695,10 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(3) null data
 	 *---------------------------------------------------------i
 	 */
-	nullfunc = &reserved_page_packet_8821[NULL_PG * 256];
-	SET_80211_HDR_ADDRESS1(nullfunc, mac->bssid);
-	SET_80211_HDR_ADDRESS2(nullfunc, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(nullfunc, mac->bssid);
+	nullfunc = (struct ieee80211_hdr *)&reserved_page_packet_8821[NULL_PG * 256];
+	ether_addr_copy(nullfunc->addr1, mac->bssid);
+	ether_addr_copy(nullfunc->addr2, mac->mac_addr);
+	ether_addr_copy(nullfunc->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_NULL_DATA(u1rsvdpageloc, NULL_PG);
 
@@ -1706,10 +1706,10 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(4) Qos null data
 	 *----------------------------------------------------------
 	 */
-	qosnull = &reserved_page_packet_8821[QOSNULL_PG * 256];
-	SET_80211_HDR_ADDRESS1(qosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(qosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(qosnull, mac->bssid);
+	qosnull = (struct ieee80211_hdr *)&reserved_page_packet_8821[QOSNULL_PG * 256];
+	ether_addr_copy(qosnull->addr1, mac->bssid);
+	ether_addr_copy(qosnull->addr2, mac->mac_addr);
+	ether_addr_copy(qosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_QOS_NULL_DATA(u1rsvdpageloc, QOSNULL_PG);
 
@@ -1717,10 +1717,10 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(5) Qos null data
 	 *----------------------------------------------------------
 	 */
-	btqosnull = &reserved_page_packet_8821[BT_QOSNULL_PG * 256];
-	SET_80211_HDR_ADDRESS1(btqosnull, mac->bssid);
-	SET_80211_HDR_ADDRESS2(btqosnull, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(btqosnull, mac->bssid);
+	btqosnull = (struct ieee80211_hdr *)&reserved_page_packet_8821[BT_QOSNULL_PG * 256];
+	ether_addr_copy(btqosnull->addr1, mac->bssid);
+	ether_addr_copy(btqosnull->addr2, mac->mac_addr);
+	ether_addr_copy(btqosnull->addr3, mac->bssid);
 
 	SET_H2CCMD_RSVDPAGE_LOC_BT_QOS_NULL_DATA(u1rsvdpageloc, BT_QOSNULL_PG);
 
@@ -1732,10 +1732,10 @@ void rtl8821ae_set_fw_rsvdpagepkt(struct ieee80211_hw *hw,
 	 *			(6) ARP Resp
 	 *----------------------------------------------------------
 	 */
-	arpresp = &reserved_page_packet_8821[ARPRESP_PG * 256];
-	SET_80211_HDR_ADDRESS1(arpresp, mac->bssid);
-	SET_80211_HDR_ADDRESS2(arpresp, mac->mac_addr);
-	SET_80211_HDR_ADDRESS3(arpresp, mac->bssid);
+	arpresp = (struct ieee80211_hdr *)&reserved_page_packet_8821[ARPRESP_PG * 256];
+	ether_addr_copy(arpresp->addr1, mac->bssid);
+	ether_addr_copy(arpresp->addr2, mac->mac_addr);
+	ether_addr_copy(arpresp->addr3, mac->bssid);
 
 	SET_8821AE_H2CCMD_AOAC_RSVDPAGE_LOC_ARP_RSP(u1rsvdpageloc2, ARPRESP_PG);
 
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index 23697704ffee..347255b798c9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2855,11 +2855,6 @@ enum bt_radio_shared {
 		(_os).octet = (u8 *)(_octet);		\
 		(_os).length = (_len);
 
-#define CP_MACADDR(des, src)	\
-	((des)[0] = (src)[0], (des)[1] = (src)[1],\
-	(des)[2] = (src)[2], (des)[3] = (src)[3],\
-	(des)[4] = (src)[4], (des)[5] = (src)[5])
-
 #define	LDPC_HT_ENABLE_RX			BIT(0)
 #define	LDPC_HT_ENABLE_TX			BIT(1)
 #define	LDPC_HT_TEST_TX_ENABLE			BIT(2)
-- 
2.43.0

