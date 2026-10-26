Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048234;
	b=oAebz29kt+J22PNEcK5ikutFrqv+Pv5aMIC4MH4twhn+TCb6GhLCHkphHJFrnh+n+iVi
	 R/6LKzKUqS6osd9QHdqaByNXGGDrpKA83XwkgkzpqrxXVO0O+7wX1WPi8qevaDII3iCzD
	 FBqTo+p1DjG2OaVzj3RUqx2mXzWBUTWPZithUXa/Km4tcJH10OOY7PTG4/aKQgY1GlWHl
	 hk8w98JPGyCncu9QCQQQsVYDKMDLZF3nEp7nKx42djQapHx9EzONDb/L0I5WLk7bgQKfq
	 NzC7Yn+2gBIDpgC/imWPNfm6linFXmUEDkNmqtnQpPf8tZadtcY4tUM7EPqmxCqxEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6zx1IAqmKNRN7Fxw3sfUqWx5HaiwX1Bvs6i7QcBjxaQ=;
	b=gJgHXdya2PDsSCfw4B49QaNIqwHCLBNg/ae32LpYocigK9rUTEcbW+hbdLdp2k5fnErt
	 KkjNB1529DMBmp4shhg/7xFw0+jMf30M3odoR3H/qBTH3vw0H9U28KbxlN4Q0+KPK0fvW
	 k7A/S9zPH7So/WT7MJfaX1mN9NY8FaI5g1xR5wwQ0a+SB7XmfkXegZJ0biklGw0vdzUAi
	 H7MaJL6uqF97titRq+zDaSJxRZucaL2MLgW4l80nvnNgY1eGR3U1G+F5YaZwLSeVGL58b
	 Zbh/M82qh18gncJ/yHbRaW6REBJUzY+TH/CLzF7yzQcKXNTitd+xhCDsSYv9X/qcfKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncTOawbF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB5606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFB5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncTOawbF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so18134595e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048232; x=1793653032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zx1IAqmKNRN7Fxw3sfUqWx5HaiwX1Bvs6i7QcBjxaQ=;
        b=ncTOawbFTT+2MAPNMle5tj2UdnB0JYpMVTZ9roVYhBAiXm+9LP8Rt3biv9q8/E3+x6
         diu0xvjrT/0aPNUn8+vW/vlaB1TUNOzg89nZB7mTruPXLTf3UiYrSRBoCwtMHsqJv4ha
         w6H+HTF7TWY267ONuqjnCJdeQeAEy45juGYqxQ+hQ0DiyJNnRS2f57dxrQ6GbX45M3e2
         x2pYuZGDlf0ryuZr9HllO8cfgBmWYKlg5sUu+kNP4wRmlvxDLahAC2ljdnE4h7l10zIM
         Tj2y2oPUquTHh+dfyKyjG3cHHFBiXxt6V9TYpISrv0e0/jic8Qa/0G54SEkjcz4xVivZ
         vNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048232; x=1793653032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zx1IAqmKNRN7Fxw3sfUqWx5HaiwX1Bvs6i7QcBjxaQ=;
        b=Aea0fXDGhlWJpGkr+XkWsdt4xtuemN2hjP3qEhOrPI5oX5RYVjj5+EQozWxeKykVVd
         n9EDqT3E0QRNjFgUKt7299ty0X6wGGllXdoL/7pan/yjTo4iUqpbgvCmZioJz+Au4Or8
         44pqRLEG18pOpAymb5l5MJa622bmPiCXK0eU1F8pCEmX4c7U6hLwHU0/nP+/XwsO7/TU
         bDF4p7gtSBfZKMFVFOVNyeZpycAXKEYb9TGjeMpTlenF82Ll8uF5FIbd5mM5jbc4R4h9
         BeItU8RjMM8Xk5ojfSDXvtxyoTS+BsFrx+KNV5VDQn3bWMBLn2qXJBVKjYyqfsgtp0zr
         hIIg==
X-Forwarded-Encrypted: i=1; AKwUvBwsFqyZZTApN2eNdF9Q47/oVX020MoeG9kA0JsjW2q7S3gaqnoelK65rB/butrrYkU2FjqSBcsGUf1GEnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDQW4i0FxFXBkjSLgldE6zXNGuBIY1KLNzIjrqMG1MNFdMbtJH
	vD6vic93YCKAixE5OFKy8MuQKDBws18+d6jTD6mnAp15jUeyLVkb3ZOa
X-Gm-Gg: AYBFou3NZ8BtIhca8tsEEDc5g91BkXOz7OndRllzec4yOZt6lbUFRRjQnCnjrtQy9CP
	6LJJDNF4u1eyoiL9NeFu+gYrXcWK2WlOE4xUW2n1ijYNVXdrQCdYO9s6ivg3KQbxCJRHnkvyxKJ
	bf2JoKfP4PdvPaqiSASUvzIBBOZ1eZ/ByMy0xnZA8RbHLkgQac6tq9rT4iplph6mESgBrvLO0Bi
	0T23XifV8n5iNRRKHzmm3CDBgV0jYEDNw76wE9OMaKtn19Nuec+OYoKNFdci/+jnHhXnd+oxDHe
	LJURVSKRusl+x/wp5eiAISENK/FXOoD+15KWGz5qzNC7dRkRoCHZ7qkBvaOZJP/pl1hD4QHqbbP
	gRO3Ds4twlbfrOsH0m5lsHCch2ibq/sZ21FpRRzX3buy/E5EadYwqElxjzpQbPfBiAZgpFoE0EZ
	iMmWErk3ZCPWUtPGR1FWGQjzMRWNCwrCGi4PkKM3JKzj+UmwNPEHKVXbrq/qqTnG2s5ZccIA3aa
	AMEG1qqjrYc7nCnR5tprdH3lY+arpHEp37rY3vmWbr0oDvJHotw+px2WcKXQnwe1OXcHRZM9hLJ
	8fU=
X-Received: by 2002:a05:600c:6095:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a35ac99412mr133099355e9.12.1793048232108;
        Mon, 26 Oct 2026 13:57:12 -0700 (PDT)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm193725085e9.4.2026.10.26.13.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:11 -0700 (PDT)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: use BIT() macro for bit definitions
Date: Mon, 26 Oct 2026 22:56:58 +0200
Message-ID: <20261026205659.181065-3-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026205659.181065-1-albu.victor.m@gmail.com>
References: <20261026205659.181065-1-albu.victor.m@gmail.com>
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

Replace the "(1 << n)" shifts with BIT(n).

No functional change intended.

Compile tested only.

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 78 +++++++++----------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9741daef3b87..fc0473ff8a56 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -297,19 +297,17 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_DATA_HDR3_LEN 24
 #define IEEE80211_DATA_HDR4_LEN 30
 
-
-#define IEEE80211_STATMASK_SIGNAL (1<<0)
-#define IEEE80211_STATMASK_RSSI (1<<1)
-#define IEEE80211_STATMASK_NOISE (1<<2)
-#define IEEE80211_STATMASK_RATE (1<<3)
+#define IEEE80211_STATMASK_SIGNAL BIT(0)
+#define IEEE80211_STATMASK_RSSI BIT(1)
+#define IEEE80211_STATMASK_NOISE BIT(2)
+#define IEEE80211_STATMASK_RATE BIT(3)
 #define IEEE80211_STATMASK_WEMASK 0x7
 
+#define IEEE80211_CCK_MODULATION    BIT(0)
+#define IEEE80211_OFDM_MODULATION   BIT(1)
 
-#define IEEE80211_CCK_MODULATION    (1<<0)
-#define IEEE80211_OFDM_MODULATION   (1<<1)
-
-#define IEEE80211_24GHZ_BAND     (1<<0)
-#define IEEE80211_52GHZ_BAND     (1<<1)
+#define IEEE80211_24GHZ_BAND     BIT(0)
+#define IEEE80211_52GHZ_BAND     BIT(1)
 
 #define IEEE80211_CCK_RATE_LEN			4
 #define IEEE80211_NUM_OFDM_RATESLEN	8
@@ -330,18 +328,18 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_OFDM_RATE_54MB		0x6C
 #define IEEE80211_BASIC_RATE_MASK		0x80
 
-#define IEEE80211_CCK_RATE_1MB_MASK		(1<<0)
-#define IEEE80211_CCK_RATE_2MB_MASK		(1<<1)
-#define IEEE80211_CCK_RATE_5MB_MASK		(1<<2)
-#define IEEE80211_CCK_RATE_11MB_MASK		(1<<3)
-#define IEEE80211_OFDM_RATE_6MB_MASK		(1<<4)
-#define IEEE80211_OFDM_RATE_9MB_MASK		(1<<5)
-#define IEEE80211_OFDM_RATE_12MB_MASK		(1<<6)
-#define IEEE80211_OFDM_RATE_18MB_MASK		(1<<7)
-#define IEEE80211_OFDM_RATE_24MB_MASK		(1<<8)
-#define IEEE80211_OFDM_RATE_36MB_MASK		(1<<9)
-#define IEEE80211_OFDM_RATE_48MB_MASK		(1<<10)
-#define IEEE80211_OFDM_RATE_54MB_MASK		(1<<11)
+#define IEEE80211_CCK_RATE_1MB_MASK		BIT(0)
+#define IEEE80211_CCK_RATE_2MB_MASK		BIT(1)
+#define IEEE80211_CCK_RATE_5MB_MASK		BIT(2)
+#define IEEE80211_CCK_RATE_11MB_MASK		BIT(3)
+#define IEEE80211_OFDM_RATE_6MB_MASK		BIT(4)
+#define IEEE80211_OFDM_RATE_9MB_MASK		BIT(5)
+#define IEEE80211_OFDM_RATE_12MB_MASK		BIT(6)
+#define IEEE80211_OFDM_RATE_18MB_MASK		BIT(7)
+#define IEEE80211_OFDM_RATE_24MB_MASK		BIT(8)
+#define IEEE80211_OFDM_RATE_36MB_MASK		BIT(9)
+#define IEEE80211_OFDM_RATE_48MB_MASK		BIT(10)
+#define IEEE80211_OFDM_RATE_54MB_MASK		BIT(11)
 
 #define IEEE80211_CCK_RATES_MASK		0x0000000F
 #define IEEE80211_CCK_BASIC_RATES_MASK	(IEEE80211_CCK_RATE_1MB_MASK | \
@@ -422,15 +420,15 @@ static inline bool IS_OFDM_RATE(uint rate)
  */
 #define IEEE80211_FRAG_CACHE_LEN 4
 
-#define SEC_KEY_1         (1<<0)
-#define SEC_KEY_2         (1<<1)
-#define SEC_KEY_3         (1<<2)
-#define SEC_KEY_4         (1<<3)
-#define SEC_ACTIVE_KEY    (1<<4)
-#define SEC_AUTH_MODE     (1<<5)
-#define SEC_UNICAST_GROUP (1<<6)
-#define SEC_LEVEL         (1<<7)
-#define SEC_ENABLED       (1<<8)
+#define SEC_KEY_1         BIT(0)
+#define SEC_KEY_2         BIT(1)
+#define SEC_KEY_3         BIT(2)
+#define SEC_KEY_4         BIT(3)
+#define SEC_ACTIVE_KEY    BIT(4)
+#define SEC_AUTH_MODE     BIT(5)
+#define SEC_UNICAST_GROUP BIT(6)
+#define SEC_LEVEL         BIT(7)
+#define SEC_ENABLED       BIT(8)
 
 #define SEC_LEVEL_0      0 /* None */
 #define SEC_LEVEL_1      1 /* WEP 40 and 104 bit */
@@ -496,9 +494,9 @@ static inline bool IS_OFDM_RATE(uint rate)
 #define MAX_P2P_IE_LEN (256)
 #define MAX_WFD_IE_LEN (128)
 
-#define NETWORK_EMPTY_ESSID (1<<0)
-#define NETWORK_HAS_OFDM    (1<<1)
-#define NETWORK_HAS_CCK     (1<<2)
+#define NETWORK_EMPTY_ESSID BIT(0)
+#define NETWORK_HAS_OFDM    BIT(1)
+#define NETWORK_HAS_CCK     BIT(2)
 
 #define IEEE80211_DTIM_MBCAST 4
 #define IEEE80211_DTIM_UCAST 2
@@ -520,15 +518,15 @@ static inline bool IS_OFDM_RATE(uint rate)
 #define DEFAULT_FTS 2346
 #define IP_ARG(x) (x)
 
-#define CFG_IEEE80211_RESERVE_FCS (1<<0)
-#define CFG_IEEE80211_COMPUTE_FCS (1<<1)
+#define CFG_IEEE80211_RESERVE_FCS BIT(0)
+#define CFG_IEEE80211_COMPUTE_FCS BIT(1)
 
 #define MAXTID	16
 
-#define IEEE_A            (1<<0)
-#define IEEE_B            (1<<1)
-#define IEEE_G            (1<<2)
-#define IEEE_MODE_MASK    (IEEE_A|IEEE_B|IEEE_G)
+#define IEEE_A            BIT(0)
+#define IEEE_B            BIT(1)
+#define IEEE_G            BIT(2)
+#define IEEE_MODE_MASK    (IEEE_A | IEEE_B | IEEE_G)
 
 /* Action category code */
 enum {
-- 
2.43.0

