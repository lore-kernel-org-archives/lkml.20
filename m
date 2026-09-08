Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D55A0AA9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892494; cv=none; b=TwIWvF2HMjgI7ULkjSu1hHcI1G/Wtm2tJJL99x8Rtqbgg8y3DIAI9Vn2X7jCgDh6LHMYovzMpoDnOijVHDBF05ApT5r+nQZXqfvdxo/eiolApgWDglxsKikYnZI54CuMpRnSw6wXH3wE8Dmy0SxN0EL1p8yinmfO4SrETzIPr5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892494; c=relaxed/simple;
	bh=Oyo8WBTTLUQjhitP/90OaOv6Ze1PA6bO+/LqGeo1RkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fW2qtLU27elOx1ne7pSbQODkt4SKgLXHXou9sbiQfdrUqyejUbH0EnqLuRzW3gzZunFzZcwLpyYwEWp7qPUlrmhjYtANQaHktec1UXd+8Pmcx1HG+EN624P2bav/w4vQS4SrB3/D5xVZD5E1uY5lxduumAKP7lAqM6DZgTtvs2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBZTe202; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBZTe202"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso48219895e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892487; x=1789497287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOUFsO+FTCcGNgsiYlTr5Qmkr30pPd5dfE9ht+CoW2U=;
        b=hBZTe20287Y7SamzGQGhLLJfnzWipHDHN0s5vfWKGSxcqVZj4uaWlC6DGm17UMS7FF
         19/JtMk6AE6ei+lodxYm3wCk/CP7qcYzFEY9Ey4NAqSrf3bNn6Yyfmg2nVfWOMhP7Wp2
         VkKy2i1a2vwH+Oq53Jsqf4A9/u4m4o0HASSjeBnUM4pdWblp0dRCYxq5VolqtsmKyOUd
         50qkdLAFPcddLq5itH2n42V2NdmReZS/EuqDY5oD8OP36aUreORN0fPpeMKpGRFxAhYx
         HqbpL/GcRpsLbDRgv+P/lrq+5KYJBo9C4djqKJR+3EcGvdIQSzn5UMWtpeKUg9A0dKav
         +5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892487; x=1789497287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOUFsO+FTCcGNgsiYlTr5Qmkr30pPd5dfE9ht+CoW2U=;
        b=nsAbJ4F+HPW+wniOoMpAPaR9xcqAixL7nmDf5SI9Epjcq+4GxSUoo2Ud8bwmbfQgRS
         0YN5uZiZusrvbGszD2OCejMzmenGeMn5rGM2M/fppi5j0Izj4t9vEpN55YCxQohaB5zA
         O9Uql4n1Excq8R3Q0IaHjNSeihdWi/HqMHQIHFGr21dtFTzKxFgqnOqKyeaC6XaUibek
         ZEd82cuG9ty6afngD8DuBCB2pZ7aYB8n9xjn8J1BQo2aE1ffkvJDpSfCmycy/uKUed+m
         VFKdw1GQcK6AeHnb/ZAVXAAHRtNCTXJXr6ePANJ/+jJKDbUMoeQ/ivDW25zHMPB1wlWc
         2BXg==
X-Gm-Message-State: AFuF++nYm9Bj64vJJPO+eV7d2+Dy4ZEWu8Ng43jA96oh0sk8LQcNHpkb
	8xjevXcL7vXtSZchMmx96dgBdleLeV8Y0evKAnaiznUWGatEofQetSC9
X-Gm-Gg: AYBFou2hz8f8E6Dze3rGPwnTEYiPATbepp3lFVtL0ftmTPI53KSqKwYGTJmxPwXxevh
	VGY9J0Z2Tg0yrH/XheXhmEhmvV/iPgchu9Uy7QXz7xCPV0I1fWOmaSqj2iNG/N/+3elPFHWELDe
	IB5aSOFd+Xsh0U/16JdjvVy/9TXS0tfabu5UYjOU3cVX2aKtBDaEK6syFYndMfg9f7yDdpTWvgR
	ZiGMNYBKZJpqMAtUIQbmll8YDGdusCOlB73cb8HrlO9q0P8PYdXM2/FwV9Uu2V4D2kWKeWOKwRE
	ZaTvtrC8kGQI9S+u6q5ZPFQU5q2Ow8O2d74QPA0hCg3n/evCHAE6FFu4ZMhHRnkewGV5dvyvail
	TQ1LgBHeuncAp4KdeD33fA60WbLq4iJXt/gXYJRTCzrTdE6mYLMTAuVbFhjmOA7bALIYmoxayBb
	Px4m6yRxDP5Z8XB9YjInBLZVU9/Pf5lC5hmjRylGpHehYtri1lJgWARVThp9HK9GNpZWJ1iqbqt
	Y0kUQ==
X-Received: by 2002:a05:600c:64c6:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49cfa20ccaemr274371025e9.25.1788892486822;
        Tue, 08 Sep 2026 11:34:46 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:46 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: core: clean up rtw_wlan_util.c style issues
Date: Tue,  8 Sep 2026 21:34:29 +0300
Message-ID: <20260908183430.3256-3-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183430.3256-1-predescuciprian99@gmail.com>
References: <20260908183430.3256-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 8c1f46706..c6d39a74a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -8,20 +8,20 @@
 #include <drv_types.h>
 #include <hal_com_h2c.h>
 
-static unsigned char ARTHEROS_OUI1[] = {0x00, 0x03, 0x7f};
-static unsigned char ARTHEROS_OUI2[] = {0x00, 0x13, 0x74};
+static u8 ARTHEROS_OUI1[] = {0x00, 0x03, 0x7f};
+static u8 ARTHEROS_OUI2[] = {0x00, 0x13, 0x74};
 
-static unsigned char BROADCOM_OUI1[] = {0x00, 0x10, 0x18};
-static unsigned char BROADCOM_OUI2[] = {0x00, 0x0a, 0xf7};
-static unsigned char BROADCOM_OUI3[] = {0x00, 0x05, 0xb5};
+static u8 BROADCOM_OUI1[] = {0x00, 0x10, 0x18};
+static u8 BROADCOM_OUI2[] = {0x00, 0x0a, 0xf7};
+static u8 BROADCOM_OUI3[] = {0x00, 0x05, 0xb5};
 
-static unsigned char CISCO_OUI[] = {0x00, 0x40, 0x96};
-static unsigned char MARVELL_OUI[] = {0x00, 0x50, 0x43};
-static unsigned char RALINK_OUI[] = {0x00, 0x0c, 0x43};
-static unsigned char REALTEK_OUI[] = {0x00, 0xe0, 0x4c};
-static unsigned char AIRGOCAP_OUI[] = {0x00, 0x0a, 0xf5};
-static unsigned char RSN_TKIP_CIPHER[4] = {0x00, 0x0f, 0xac, 0x02};
-static unsigned char WPA_TKIP_CIPHER[4] = {0x00, 0x50, 0xf2, 0x02};
+static u8 CISCO_OUI[] = {0x00, 0x40, 0x96};
+static u8 MARVELL_OUI[] = {0x00, 0x50, 0x43};
+static u8 RALINK_OUI[] = {0x00, 0x0c, 0x43};
+static u8 REALTEK_OUI[] = {0x00, 0xe0, 0x4c};
+static u8 AIRGOCAP_OUI[] = {0x00, 0x0a, 0xf5};
+static u8 RSN_TKIP_CIPHER[4] = {0x00, 0x0f, 0xac, 0x02};
+static u8 WPA_TKIP_CIPHER[4] = {0x00, 0x50, 0xf2, 0x02};
 
 /* define WAIT_FOR_BCN_TO_MIN	(3000) */
 #define WAIT_FOR_BCN_TO_MIN	(6000)
@@ -75,8 +75,8 @@ u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta)
 	return raid;
 }
 
-unsigned char ratetbl_val_2wifirate(unsigned char rate);
-unsigned char ratetbl_val_2wifirate(unsigned char rate)
+u8 ratetbl_val_2wifirate(u8 rate);
+u8 ratetbl_val_2wifirate(u8 rate)
 {
 	switch (rate & 0x7f) {
 	case 0:
@@ -108,11 +108,11 @@ unsigned char ratetbl_val_2wifirate(unsigned char rate)
 	}
 }
 
-int is_basicrate(struct adapter *padapter, unsigned char rate);
-int is_basicrate(struct adapter *padapter, unsigned char rate)
+int is_basicrate(struct adapter *padapter, u8 rate);
+int is_basicrate(struct adapter *padapter, u8 rate)
 {
 	int i;
-	unsigned char val;
+	u8 val;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	for (i = 0; i < NumRates; i++) {
@@ -126,12 +126,12 @@ int is_basicrate(struct adapter *padapter, unsigned char rate)
 	return false;
 }
 
-unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset);
-unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
+u32 ratetbl2rateset(struct adapter *padapter, u8 *rateset);
+u32 ratetbl2rateset(struct adapter *padapter, u8 *rateset)
 {
 	int i;
-	unsigned char rate;
-	unsigned int	len = 0;
+	u8 rate;
+	u32 len = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	for (i = 0; i < NumRates; i++) {
@@ -158,9 +158,9 @@ unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
 	return len;
 }
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len)
+void get_rate_set(struct adapter *padapter, u8 *pbssrate, int *bssrate_len)
 {
-	unsigned char supportedrates[NumRates];
+	u8 supportedrates[NumRates];
 
 	memset(supportedrates, 0, NumRates);
 	*bssrate_len = ratetbl2rateset(padapter, supportedrates);
@@ -294,7 +294,7 @@ inline unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter)
 		return 0;
 }
 
-void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
+void r8723bs_select_channel(struct adapter *padapter, u8 channel)
 {
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
@@ -307,7 +307,7 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, u8 channel, u8 channel_offset, u16 bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
@@ -1360,10 +1360,10 @@ int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps,
 		return _FAIL;
 }
 
-unsigned char get_highest_rate_idx(u32 mask)
+u8 get_highest_rate_idx(u32 mask)
 {
 	int i;
-	unsigned char rate_idx = 0;
+	u8 rate_idx = 0;
 
 	for (i = 31; i >= 0; i--) {
 		if (mask & BIT(i)) {
-- 
2.55.0

