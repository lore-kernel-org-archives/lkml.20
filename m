Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460351;
	b=CKbk9gi+Uy1FyhjqobfjDMZ4uQn/pYBOCnQHMu1ssHXuVhs1B40T/+1wNyias8u2U1Nr
	 iBfXc3xXi0wcdFeolpBDW09v1Py54Idfg3hutyFURCoxhSbi9YuRJtS/sweoqEHCP4qMR
	 GNwFlm/w5mc9ba7j7rs9JquZ/LQOP3Du8ED8y/4pCnoezyBrB+yQhXHD4eAyDfLRTsfdC
	 t3M4sp0SR3APgLbxHODwn25CzA/aJrwucq+zZjBEoq5DlkA/hzTETsue6wbs/Pbj9CtFw
	 HYCjTkOytuT30Olb9Ya4K4wQMlhYJNlXUU7zk8gP9XFLfUFV20YB1Gi0oNnrQvo4Fbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
	b=1d4j9kbhbDWBeV/ez6DS3IW9Mo17PqkgWN8MU6hdNnb6i2o8Gr9e11ZcjaefurfC18zR
	 tEy9Q81sWCXOasL+XWQvFlAq7yGgmTeDyhc2fbfGHIM2xldXIbyAjyjTqoJ/CdJQqcpO2
	 sHUoCigw3Ags8ibT0AR3SLvCvQKjspHqUAYq8xmLjpDlEUlPo6qK7VVLneXCTQWXrUZP+
	 apRX0zHHUI3X0ib2cFu0NZnwSiuj1FVDsia32llCRblmaVP0F24I/+kg5s5matbkud7U/
	 wdW3JRrfK1Z+1V6xNlgjG9QbQLyXs3wTHjY1FU0Pmzj3iKvZUm/+FP7JCf6re8wAV7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVETmuV3;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A409C606A8A6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A409C606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVETmuV3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so4440627eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460349; x=1795065149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
        b=EVETmuV3n1UsEeIevPE4FGZMVEWc4t3KsSRphy2DraU6EF3J7Z0FuK6QyjnULmATVK
         NRWxuT+rHCPYY5G8dUPXkUqgdZB/9YSwLezD85gjgqcTkapo5bhU20L6p6geZKOm5+O6
         /r4GeJNPTnT4YWJ70C8cr6w+e5HQrHgV9O/VE+Xy3XexdOGQ9uPlbyHsO1lPZuSN6gb1
         Ietv06nB+HoRvDE+xXYIDVNMK5O7hx1NgWq1XCbkQnFQ+O8rNnCFMtbHe9hfiv7fxxVl
         /ixu4ACONMWmC4QZjRyAQRy3F6gaZgE2Dm7DMgM/xDfKSDhkFCLQOw+fXFsc6fBnSPlT
         Cvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460349; x=1795065149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
        b=mtD3UaV//U2kjJmQj7vbyhAUk2nob75wf2P+if5Y3kpMW27bp3IgnJL1KXMtunec98
         Y/G5eCzK7kSDmRYfdA4ND8i9OVSUSt8m8oQfyPzGECra9b6EcdFYJn/o4p7qCYSICQcL
         klMgWUS6wxpFlo8icfa1fOcr/5rDhDQMh5hH9hMEjlB8uNKCqdo9rRY0dBD2en253Rp4
         H7UTKgENW356f/2ZSQ7BMsZHcI67perhIT93k56HkIPQdl9qZgKkORMd9TZUqOZy+vXU
         FF/uVGa64BSPvQxhbrBLDFbigXg26BJElqMLC9Th5NTNxay1KkPd1+X355SI18HNahD0
         X/eg==
X-Forwarded-Encrypted: i=1; AL+hErFhsfrq8y2NM8LaNf4uPiP65mUdk22pNiqdtXR+lkuHtw14+nYFWNtyGOcUtVgWVWu9SZEpJrVGNeo3ViI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1IXRA6gS2yCrcaSO37S8FNxauUFHXU9ns+wc6juuA6ix9Wv50
	s471gB4//OXBmAkm6Sl+DbtC6Ac2Nmh6cCVZf8U5bdZTexgtq8qN8DSx
X-Gm-Gg: AYBFou2pciigeIbVfCO2x/bY/KYGoJAShQEbHCJepa20ScYno9ZmWqVWVkfoyVZ1d6Z
	RQlau0z5/KKI0Tr1KkTCaJIGoogNPw3QKMwg3F8MJ4QeI/895Bjcd74ceumUl5CQjv+ICzbhDBZ
	oONTSQxBrKzWKaK9Xfm5N90L7ow77zDqKkWO659IS1e59Oc6afdd/k+T8x3Z5MV+OgGDmpoVJhr
	Gnf6IeXl7apLj/uYrfMTqrAxGYxGyOySO78GpYLyefMeyaZguME9jg76h6pgnTzAG7kfKBGdx0n
	JpcnWMJfL9BkJx57r3EVAFUI4VbZGIDn9GSfs9IRVNFLXfUovoQDJBfMYYH22INlsz0/rNrCUM0
	pkyhTQIIZqSgAhnnh24Lqz9qjLEIElNlsBOFf0KqsAoQRbaFb78X/UGTOJgOO1zMXM0fwWnAsRt
	KiiQCiPiHdDrAneJUaoVQ7PRawldu94rTxwXJ5nfAjw9SSOu5x7sl26cfQaAtZmIpmzL3KMwtRx
	+z9UKKJ1Dm0MQcO4t52OSY2g7SdKMUrNTrLllkvYV6SPTVwppOpyNGlgzW9UWf9IXylipHD+TQq
	2slV55MKqWaDAvr3odfW8Bpxtk42OEJYjd5huNxhWWPd4gs+1UdfOiOJLXKbYnWMVIZaU2cKH3W
	l
X-Received: by 2002:a05:693c:4150:10b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-376851ce278mr5605100eec.13.1794460349192;
        Wed, 11 Nov 2026 21:12:29 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:28 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH 10/10] wifi: brcm80211: move the channel and rate tables of brcmsmac to brcmutil
Date: Thu, 12 Nov 2026 13:11:37 +0800
Message-ID: <20261112051142.2797529-11-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

Move the 2.4 and 5 GHz channel tables and the legacy rate table to
brcmutil as constant tables, so that other drivers of the d11 core can
register the same channels and rates.

Also fixes a bug where multiple instances of brcmsmac share the same
channel tables.

Put a copy of the channel tables in struct brcms_info so that changes
to one do not affect the rest of the instances.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c | 151 ++----------------
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h |   9 +-
 .../broadcom/brcm80211/brcmutil/Makefile      |   2 +-
 .../broadcom/brcm80211/brcmutil/band.c        | 140 ++++++++++++++++
 .../broadcom/brcm80211/include/brcmu_band.h   |  26 +++
 5 files changed, 185 insertions(+), 143 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index eeae85cae0..0db6868389 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -49,30 +49,6 @@
 	FIF_BCN_PRBRESP_PROMISC | \
 	FIF_PSPOLL)
 
-#define CHAN2GHZ(channel, frequency, chflags)  { \
-	.band = NL80211_BAND_2GHZ, \
-	.center_freq = (frequency), \
-	.hw_value = (channel), \
-	.flags = chflags, \
-	.max_antenna_gain = 0, \
-	.max_power = 19, \
-}
-
-#define CHAN5GHZ(channel, chflags)  { \
-	.band = NL80211_BAND_5GHZ, \
-	.center_freq = 5000 + 5*(channel), \
-	.hw_value = (channel), \
-	.flags = chflags, \
-	.max_antenna_gain = 0, \
-	.max_power = 21, \
-}
-
-#define RATE(rate100m, _flags) { \
-	.bitrate = (rate100m), \
-	.flags = (_flags), \
-	.hw_value = (rate100m / 5), \
-}
-
 struct firmware_hdr {
 	__le32 offset;
 	__le32 len;
@@ -111,117 +87,10 @@ MODULE_DEVICE_TABLE(bcma, brcms_coreid_table);
 module_param_named(debug, brcm_msg_level, uint, 0644);
 #endif
 
-static struct ieee80211_channel brcms_2ghz_chantable[] = {
-	CHAN2GHZ(1, 2412, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(2, 2417, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(3, 2422, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(4, 2427, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(5, 2432, 0),
-	CHAN2GHZ(6, 2437, 0),
-	CHAN2GHZ(7, 2442, 0),
-	CHAN2GHZ(8, 2447, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(9, 2452, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(10, 2457, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(11, 2462, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(12, 2467,
-		 IEEE80211_CHAN_NO_IR |
-		 IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(13, 2472,
-		 IEEE80211_CHAN_NO_IR |
-		 IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(14, 2484,
-		 IEEE80211_CHAN_NO_IR |
-		 IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS |
-		 IEEE80211_CHAN_NO_OFDM)
-};
-
-static struct ieee80211_channel brcms_5ghz_nphy_chantable[] = {
-	/* UNII-1 */
-	CHAN5GHZ(36, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(40, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(44, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(48, IEEE80211_CHAN_NO_HT40PLUS),
-	/* UNII-2 */
-	CHAN5GHZ(52,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(56,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(60,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(64,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	/* MID */
-	CHAN5GHZ(100,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(104,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(108,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(112,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(116,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(120,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(124,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(128,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(132,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(136,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(140,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS |
-		 IEEE80211_CHAN_NO_HT40MINUS),
-	/* UNII-3 */
-	CHAN5GHZ(149, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(153, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(157, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(161, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(165, IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS)
-};
-
-/*
- * The rate table is used for both 2.4G and 5G rates. The
- * latter being a subset as it does not support CCK rates.
- */
-static struct ieee80211_rate legacy_ratetable[] = {
-	RATE(10, 0),
-	RATE(20, IEEE80211_RATE_SHORT_PREAMBLE),
-	RATE(55, IEEE80211_RATE_SHORT_PREAMBLE),
-	RATE(110, IEEE80211_RATE_SHORT_PREAMBLE),
-	RATE(60, 0),
-	RATE(90, 0),
-	RATE(120, 0),
-	RATE(180, 0),
-	RATE(240, 0),
-	RATE(360, 0),
-	RATE(480, 0),
-	RATE(540, 0),
-};
-
 static const struct ieee80211_supported_band brcms_band_2GHz_nphy_template = {
 	.band = NL80211_BAND_2GHZ,
-	.channels = brcms_2ghz_chantable,
-	.n_channels = ARRAY_SIZE(brcms_2ghz_chantable),
-	.bitrates = legacy_ratetable,
-	.n_bitrates = ARRAY_SIZE(legacy_ratetable),
+	.n_channels = ARRAY_SIZE(brcmu_2ghz_chantable),
+	.n_bitrates = ARRAY_SIZE(brcmu_legacy_ratetable),
 	.ht_cap = {
 		   /* from include/linux/ieee80211.h */
 		   .cap = IEEE80211_HT_CAP_GRN_FLD |
@@ -239,10 +108,8 @@ static const struct ieee80211_supported_band brcms_band_2GHz_nphy_template = {
 
 static const struct ieee80211_supported_band brcms_band_5GHz_nphy_template = {
 	.band = NL80211_BAND_5GHZ,
-	.channels = brcms_5ghz_nphy_chantable,
-	.n_channels = ARRAY_SIZE(brcms_5ghz_nphy_chantable),
-	.bitrates = legacy_ratetable + BRCMS_LEGACY_5G_RATE_OFFSET,
-	.n_bitrates = ARRAY_SIZE(legacy_ratetable) -
+	.n_channels = ARRAY_SIZE(brcmu_5ghz_nphy_chantable),
+	.n_bitrates = ARRAY_SIZE(brcmu_legacy_ratetable) -
 			BRCMS_LEGACY_5G_RATE_OFFSET,
 	.ht_cap = {
 		   .cap = IEEE80211_HT_CAP_GRN_FLD | IEEE80211_HT_CAP_SGI_20 |
@@ -1056,11 +923,16 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 
 	hw->wiphy->bands[NL80211_BAND_2GHZ] = NULL;
 	hw->wiphy->bands[NL80211_BAND_5GHZ] = NULL;
+	memcpy(wl->ratetable, brcmu_legacy_ratetable, sizeof(wl->ratetable));
 
 	phy_type = brcms_c_get_phy_type(wl->wlc, 0);
 	if (phy_type == PHY_TYPE_N || phy_type == PHY_TYPE_LCN) {
 		band = &wlc->bandstate[BAND_2G_INDEX]->band;
 		*band = brcms_band_2GHz_nphy_template;
+		memcpy(wl->chantable_2ghz, brcmu_2ghz_chantable,
+		       sizeof(wl->chantable_2ghz));
+		band->channels = wl->chantable_2ghz;
+		band->bitrates = wl->ratetable;
 		if (phy_type == PHY_TYPE_LCN) {
 			/* Single stream */
 			band->ht_cap.mcs.rx_mask[1] = 0;
@@ -1076,6 +948,11 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 		if (phy_type == PHY_TYPE_N || phy_type == PHY_TYPE_LCN) {
 			band = &wlc->bandstate[BAND_5G_INDEX]->band;
 			*band = brcms_band_5GHz_nphy_template;
+			memcpy(wl->chantable_5ghz, brcmu_5ghz_nphy_chantable,
+			       sizeof(wl->chantable_5ghz));
+			band->channels = wl->chantable_5ghz;
+			band->bitrates = wl->ratetable +
+					 BRCMS_LEGACY_5G_RATE_OFFSET;
 			hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
 		} else {
 			return -EPERM;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
index eaf926a96a..c9b47cb2ad 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
@@ -21,14 +21,10 @@
 #include <linux/interrupt.h>
 #include <linux/workqueue.h>
 #include <linux/leds.h>
+#include <brcmu_band.h>
 
 #include "ucode_loader.h"
 #include "led.h"
-/*
- * Starting index for 5G rates in the
- * legacy rate table.
- */
-#define BRCMS_LEGACY_5G_RATE_OFFSET	4
 
 /* softmac ioctl definitions */
 #define BRCMS_SET_SHORTSLOT_OVERRIDE		146
@@ -85,6 +81,9 @@ struct brcms_info {
 	bool mute_tx;
 	struct brcms_led radio_led;
 	struct led_classdev led_dev;
+	struct ieee80211_channel chantable_2ghz[BRCMU_NUM_2GHZ_CHANNELS];
+	struct ieee80211_channel chantable_5ghz[BRCMU_NUM_5GHZ_CHANNELS];
+	struct ieee80211_rate ratetable[BRCMU_NUM_LEGACY_RATES];
 };
 
 /* misc callbacks */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
index 5d8b7c26ad..46cee2cf13 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
@@ -7,4 +7,4 @@
 ccflags-y := -I $(src)/../include
 
 obj-$(CONFIG_BRCMUTIL)	+= brcmutil.o
-brcmutil-objs	= utils.o d11.o rate.o
+brcmutil-objs	= utils.o d11.o rate.o band.o
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c b/drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
new file mode 100644
index 0000000000..df0ad02334
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (c) 2010 Broadcom Corporation
+ */
+
+#include <linux/export.h>
+
+#include <brcmu_band.h>
+
+#define CHAN2GHZ(channel, frequency, chflags)  { \
+	.band = NL80211_BAND_2GHZ, \
+	.center_freq = (frequency), \
+	.hw_value = (channel), \
+	.flags = chflags, \
+	.max_antenna_gain = 0, \
+	.max_power = 19, \
+}
+
+#define CHAN5GHZ(channel, chflags)  { \
+	.band = NL80211_BAND_5GHZ, \
+	.center_freq = 5000 + 5*(channel), \
+	.hw_value = (channel), \
+	.flags = chflags, \
+	.max_antenna_gain = 0, \
+	.max_power = 21, \
+}
+
+#define RATE(rate100m, _flags) { \
+	.bitrate = (rate100m), \
+	.flags = (_flags), \
+	.hw_value = (rate100m / 5), \
+}
+
+const struct ieee80211_channel brcmu_2ghz_chantable[BRCMU_NUM_2GHZ_CHANNELS] = {
+	CHAN2GHZ(1, 2412, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(2, 2417, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(3, 2422, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(4, 2427, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(5, 2432, 0),
+	CHAN2GHZ(6, 2437, 0),
+	CHAN2GHZ(7, 2442, 0),
+	CHAN2GHZ(8, 2447, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(9, 2452, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(10, 2457, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(11, 2462, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(12, 2467,
+		 IEEE80211_CHAN_NO_IR |
+		 IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(13, 2472,
+		 IEEE80211_CHAN_NO_IR |
+		 IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(14, 2484,
+		 IEEE80211_CHAN_NO_IR |
+		 IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS |
+		 IEEE80211_CHAN_NO_OFDM)
+};
+EXPORT_SYMBOL(brcmu_2ghz_chantable);
+
+const struct ieee80211_channel brcmu_5ghz_nphy_chantable[BRCMU_NUM_5GHZ_CHANNELS] = {
+	/* UNII-1 */
+	CHAN5GHZ(36, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(40, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(44, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(48, IEEE80211_CHAN_NO_HT40PLUS),
+	/* UNII-2 */
+	CHAN5GHZ(52,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(56,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(60,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(64,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	/* MID */
+	CHAN5GHZ(100,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(104,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(108,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(112,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(116,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(120,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(124,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(128,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(132,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(136,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(140,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS |
+		 IEEE80211_CHAN_NO_HT40MINUS),
+	/* UNII-3 */
+	CHAN5GHZ(149, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(153, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(157, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(161, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(165, IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS)
+};
+EXPORT_SYMBOL(brcmu_5ghz_nphy_chantable);
+
+/*
+ * The rate table is used for both 2.4G and 5G rates. The
+ * latter being a subset as it does not support CCK rates.
+ */
+const struct ieee80211_rate brcmu_legacy_ratetable[BRCMU_NUM_LEGACY_RATES] = {
+	RATE(10, 0),
+	RATE(20, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(55, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(110, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(60, 0),
+	RATE(90, 0),
+	RATE(120, 0),
+	RATE(180, 0),
+	RATE(240, 0),
+	RATE(360, 0),
+	RATE(480, 0),
+	RATE(540, 0),
+};
+EXPORT_SYMBOL(brcmu_legacy_ratetable);
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h
new file mode 100644
index 0000000000..ee62eda869
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2010 Broadcom Corporation
+ */
+
+#ifndef _BRCMU_BAND_H_
+#define _BRCMU_BAND_H_
+
+#include <net/cfg80211.h>
+
+#define BRCMU_NUM_2GHZ_CHANNELS		14
+#define BRCMU_NUM_5GHZ_CHANNELS		24
+#define BRCMU_NUM_LEGACY_RATES		12
+
+/*
+ * Starting index for 5G rates in the
+ * legacy rate table.
+ */
+#define BRCMS_LEGACY_5G_RATE_OFFSET	4
+
+/* Drivers register copies of these, as cfg80211 updates their flags. */
+extern const struct ieee80211_channel brcmu_2ghz_chantable[BRCMU_NUM_2GHZ_CHANNELS];
+extern const struct ieee80211_channel brcmu_5ghz_nphy_chantable[BRCMU_NUM_5GHZ_CHANNELS];
+extern const struct ieee80211_rate brcmu_legacy_ratetable[BRCMU_NUM_LEGACY_RATES];
+
+#endif /* _BRCMU_BAND_H_ */
-- 
2.53.0

