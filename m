Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506192;
	b=SAhv+9xizKbcdyKlztzjq0Rxh3AyJmmtsojAUO72ghEga4Az3n+8cBD3en9lRX9YbIxg
	 BEqjCREaeAWwE2GlxRD/jKg3nvcqewGJy1RMAk3HQ1XXFh2Yp7sz66S1xgpfIdFMXnAFV
	 N58ENqoMCfXS0+3scC6pZRdbAAK5t6KEz0P2s+h+hUUvaDpCd/Ecmur42u38RiA9uTQpY
	 KXLU5R2kr/VbexNIDSQhubdvDo2NV60IR5dNZZICFnqBLSJrryISS97OBQFsYiurCuKX+
	 4TQcPo+tYehMimPkTUKZQkxEX7Ae34wyoy6hSrtHVCV84jD8MGnNFa2OfTyaVrASZlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNHuPwr/5ZmuTbGsKeXNQRFSuudppjRTFk2DZCwSS8E=;
	b=qr6piHfO+BxPq0RuC4T1izh/aEfPUFGN2hOs9F+wI3/wz1Jtm0xi/1w3p0ZqblUhHdsq
	 IQxJOI6wnJzTjA4ZjlgSvbm7r4/5ApBzYt+YsuzD9E37dI8tju4/Nwm3v7ydWvNh6yssL
	 Vp2Ny7mFPpuTLvNFEPlNKn5608/hTzSgwXHS5xtqnT408tDZeeefG61RMya/itnCNQe9L
	 vgekuNA4iQKFj9VrUoQH13uYxzkTBOpjEkv5gSlLcsiohqhDB/GWHbTBupzyxJzwi1MlK
	 fZGFMCTr2UsnX7ttnldtBf+QiEPWST23L0RNVLp9dlX0danHoAmWFplu7I1gB/mTFpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTk2VNEx;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F6606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8F6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTk2VNEx
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4919a880834so34557f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506190; x=1795110990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNHuPwr/5ZmuTbGsKeXNQRFSuudppjRTFk2DZCwSS8E=;
        b=sTk2VNExPdPLjM1Jt1LMjLgaJvCiG200AAJQpAqySEkY7hSC/T9NX/ql0K3cYCOiu4
         4prkJzi3bEUUIbsYX+4Qx5NCQeps71Xyx5IhT/QmcIH4XoxmPxXyrQah+x8JHUzXGB8T
         FBZl93M5JocjhpSNDsv/C0DQaUsLCvYVUwIChjEbP9AKmATjmywVhay2Fd5Kfb/e4FTP
         Ca4jFAXghDV4xwQthPnTx8OZgt0DN/To3uhcSt6Snga52wBlxYyV+d5yQcbFpvjfwL3v
         0wlGzrhix8Bpro8gSRq6nOWdncHNqsrGUHwBx2fpXtaQv0zOUe5Xc3AzZDxZj6OjED2s
         c07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506190; x=1795110990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNHuPwr/5ZmuTbGsKeXNQRFSuudppjRTFk2DZCwSS8E=;
        b=EwdWYuD6sAljyiKJPdHo96nm/LWBn1Rp/jMWAPdPlEWk5p0Rd2EMoQSfeKu7+T0Tke
         cV7WnbFAwAMOHtqJmSprrb5rLvRISRpXey/AnqIGDGPhppbtJ19gyOQBq79qnlStNAIx
         UbqOMqLACFZRGw+vIOddmGkWTrHPjdYqo59Sk1uLVHcjHBfR0t/ZV3SqNvGntyFdKSPS
         dEz2LbM82bN1FRntXLx27JCRjAYAQeHjA5Ok5g/g/45LVcL7jqUIv4UiJi1PqdlaxnWh
         T9c2QbsDgJEZiOoiD4fanLBu/+99wRS05yDu3I72pstLmfgVtMo6B4fiTwJwddrRogZ5
         VPVQ==
X-Forwarded-Encrypted: i=1; AL+hErHcX1jgpENnLXAjHV4Q91vFyRPs2EYcYjltcuxOVlUBu+rJOK7CtJ3QJT9LyM+L+2/xi7XYgG1zwuWy09c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9scT4lUdypnfLFtgrwYfeZpf2uokqzkNg2bKh7NAIrZFdodXb9
	fT41PfApBAaoqp/ekJvw1MUWR/bB/eoNsxzlSFFW3xIN+slK2NVu+a8Gy+8fZDCaHvA=
X-Gm-Gg: AYBFou3PK6H1CciWw0rv1PJd1y+ZwhL1umbiXz6wfrxVygSqEGCc9KE4fCEofSgf/Oq
	BXKj7Vh3bL7sR829z9/asOz8W4EJ6FHonOy2EryE9z4SNHPB7g9WTLgQZWh+EIImTgbFoSCjJfQ
	UpECd5fh1k6oSms1oZX9wsjqAoSonRdL3b1pT6eAmCj76VMVL4uyvw4qqQgn40Agihgrw0AkJkG
	zFbu+9i5Lc5GBkXbv55eEM6nD+NPEYU80PvKeGha4MCI1/O4o1YJ5jquK7yrSqrBOS/BXucTJA1
	LG9H6UBPVBaQ4LnHiqd4qSme6hUFsADgRPNoTuLMNqzTWf70zX6iAScxNB8EUD1Pjut6kbomfL9
	yD5dgaMXEUqOUOCG78OxTD3ADu8WK8oU+bEkstHzjPGgbsWjih2voRsvFYfH7PbpQR3s1Ta8lTl
	sjJA+fuiUkw56R9RAH5eMJcrDCWaXTZaN3cNninSyf+QthM88EJrC40bQ45E7Q6Br1Pgmb6emS8
	fDmnnG+9WWxchofQ8C++BbPecVnAgKeDJkR9WmsrJALBoX5C5Nl9kiNHDpcJBItmIQOQ+YCSsF3
	4BWiv4TnRvtCdvIy8DkNksTK4mgIwUHdnsBIDVUlEDPKQlua0kgXF6+JEdfqRk2kX+k8Ctdudcg
	T6EiZbGL02hlsLuq5eX7pcotTDaLTkBnb9W3a+GJKGVyju+UTQp5YrqEkqkhLX2q18UBG1sfLRC
	d5W3TiCDk1xiurwMIzwPx0acCGLyyWb5V1QgDqESwndg==
X-Received: by 2002:a5d:5f91:0:b0:48e:6357:c76d with SMTP id ffacd0b85a97d-49c714a2dbfmr280426f8f.21.1794506190259;
        Thu, 12 Nov 2026 09:56:30 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm438408f8f.57.2026.11.12.09.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:29 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 3/3] wifi: b43: address match table, templates and beacons for the AC microcode
Date: Thu, 12 Nov 2026 18:56:24 +0100
Message-ID: <20261112175624.40547-4-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175624.40547-1-gonsolo@gmail.com>
References: <20261112175624.40547-1-gonsolo@gmail.com>
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

The microcode of revisions 784 and above lays out several things
differently:

 - the address match table is in the RCMTA object memory, 8 bytes per
   entry (MAC[0..3], then MAC[4..5] and the attributes); the vendor driver
   uses entry 63 for its own address and 62 for the BSSID,
 - the templates in template RAM: 0x30 holds BSSID, MAC, BSSID, 0x48 the
   MAC, plus the default null frame at 0x2c and a header at 0,
 - the ACK/CTS PHY control word and the antenna selection use the AC
   PhyTxControlWord_0 format,
 - the two beacon template slots are at 0x200 and 0x480, and the beacon's
   PHY TX control words are at SHM 0xcc, 0xce and 0xd0 instead of the
   legacy BEACPHYCTL word.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/main.c | 141 ++++++++++++++++++++---
 1 file changed, 126 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 205d429..da7e420 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -662,6 +662,26 @@ void b43_macfilter_set(struct b43_wldev *dev, u16 offset, const u8 *mac)
 	if (!mac)
 		mac = zero_addr;
 
+	if (b43_ucode_is_ac(dev)) {
+		/*
+		 * rev 40+ ucode: address match table (AMT) in RCMTA object
+		 * memory, 8 bytes per entry: MAC[0..3], MAC[4..5] | attr << 16.
+		 * the vendor driver uses entry 63 for its own MAC and 62 for
+		 * the BSSID.
+		 */
+		bool self = offset == B43_MACFILTER_SELF;
+		u16 idx = self ? 0x3f : 0x3e;
+		u16 attr = is_zero_ether_addr(mac) ? 0 :
+						     (self ? 0x8008 : 0x8006);
+
+		b43_shm_write32(dev, B43_SHM_RCMTA, idx * 2,
+				mac[0] | (mac[1] << 8) | (mac[2] << 16) |
+				((u32)mac[3] << 24));
+		b43_shm_write32(dev, B43_SHM_RCMTA, idx * 2 + 1,
+				mac[4] | (mac[5] << 8) | ((u32)attr << 16));
+		return;
+	}
+
 	offset |= 0x0020;
 	b43_write16(dev, B43_MMIO_MACFILTER_CONTROL, offset);
 
@@ -689,6 +709,39 @@ static void b43_write_mac_bssid_templates(struct b43_wldev *dev)
 
 	b43_macfilter_set(dev, B43_MACFILTER_BSSID, bssid);
 
+	if (b43_ucode_is_ac(dev)) {
+		/*
+		 * rev 40+ ucode (as wl): template RAM 0x30 = BSSID, MAC, BSSID;
+		 * 0x48 = MAC. Also the vendor driver's default null-frame
+		 * template at 0x2c and the header at 0x0.
+		 */
+		static const u32 hdr0[] = {
+			0x00000094, 0x75749000, 0x00007776,
+			0x00000000, 0xffff0005, 0x0000ffff
+		};
+		static const u32 null2c[] = {
+			0x00e0040a, 0x0048beef, 0xff000005, 0xff02ff01,
+			0x01181000, 0x10000302, 0xf3f2f118, 0x0000ccbb
+		};
+		u8 blk[20] = { 0 };
+		u8 m[8] = { 0 };
+
+		for (i = 0; i < ARRAY_SIZE(hdr0); i++)
+			b43_ram_write(dev, 0x00 + i * 4, hdr0[i]);
+		for (i = 0; i < ARRAY_SIZE(null2c); i++)
+			b43_ram_write(dev, 0x2c + i * 4, null2c[i]);
+		memcpy(blk, bssid, ETH_ALEN);
+		memcpy(blk + 6, mac, ETH_ALEN);
+		memcpy(blk + 12, bssid, ETH_ALEN);
+		for (i = 0; i < sizeof(blk); i += 4)
+			b43_ram_write(dev, 0x30 + i,
+				      get_unaligned_le32(blk + i));
+		memcpy(m, mac, ETH_ALEN);
+		b43_ram_write(dev, 0x48, get_unaligned_le32(m));
+		b43_ram_write(dev, 0x4c, get_unaligned_le32(m + 4));
+		return;
+	}
+
 	memcpy(mac_bssid, mac, ETH_ALEN);
 	memcpy(mac_bssid + ETH_ALEN, bssid, ETH_ALEN);
 
@@ -1657,19 +1710,56 @@ static void b43_write_beacon_template(struct b43_wldev *dev,
 				  len, ram_offset, shm_size_offset, rate);
 
 	/* Write the PHY TX control parameters. */
-	antenna = B43_ANTENNA_DEFAULT;
-	antenna = b43_antenna_to_phyctl(antenna);
-	ctl = b43_shm_read16(dev, B43_SHM_SHARED, B43_SHM_SH_BEACPHYCTL);
-	/* We can't send beacons with short preamble. Would get PHY errors. */
-	ctl &= ~B43_TXH_PHY_SHORTPRMBL;
-	ctl &= ~B43_TXH_PHY_ANT;
-	ctl &= ~B43_TXH_PHY_ENC;
-	ctl |= antenna;
-	if (b43_is_cck_rate(rate))
-		ctl |= B43_TXH_PHY_ENC_CCK;
-	else
-		ctl |= B43_TXH_PHY_ENC_OFDM;
-	b43_shm_write16(dev, B43_SHM_SHARED, B43_SHM_SH_BEACPHYCTL, ctl);
+	if (b43_ucode_is_ac(dev)) {
+		/*
+		 * rev 40+ ucode (wlc_beacon_phytxctl, core_rev > 0x27): the
+		 * beacon slot's PhyTxControlWord_0/1/2 live at SHM 0xcc/ce/d0,
+		 * not the legacy BEACPHYCTL word (0x54, unused here). Compute
+		 * them the same way as a normal AC TX descriptor rate entry
+		 * (b43_generate_txhdr_ac): CCK/OFDM bit, core mask, PLCP rate
+		 * index; no sub-band (this is 20 MHz single-channel only).
+		 */
+		static const u8 cck[] = { B43_CCK_RATE_1MB, B43_CCK_RATE_2MB,
+					  B43_CCK_RATE_5MB, B43_CCK_RATE_11MB };
+		static const u8 ofdm[] = {
+			B43_OFDM_RATE_6MB,  B43_OFDM_RATE_9MB,
+			B43_OFDM_RATE_12MB, B43_OFDM_RATE_18MB,
+			B43_OFDM_RATE_24MB, B43_OFDM_RATE_36MB,
+			B43_OFDM_RATE_48MB, B43_OFDM_RATE_54MB
+		};
+		bool is_ofdm = b43_is_ofdm_rate(rate);
+		const u8 *tbl = is_ofdm ? ofdm : cck;
+		unsigned int n = is_ofdm ? ARRAY_SIZE(ofdm) : ARRAY_SIZE(cck);
+		unsigned int idx = 0;
+		u16 phy0 = (is_ofdm ? 1 : 0) | 0x0004 | (1 << 6);
+
+		while (idx < n && tbl[idx] != rate)
+			idx++;
+		if (idx == n)
+			idx = 0;
+		b43_shm_write16(dev, B43_SHM_SHARED, 0xcc, phy0);
+		b43_shm_write16(dev, B43_SHM_SHARED, 0xce, 0);
+		b43_shm_write16(dev, B43_SHM_SHARED, 0xd0, idx);
+	} else {
+		antenna = B43_ANTENNA_DEFAULT;
+		antenna = b43_antenna_to_phyctl(antenna);
+		ctl = b43_shm_read16(dev, B43_SHM_SHARED,
+				     B43_SHM_SH_BEACPHYCTL);
+		/*
+		 * We can't send beacons with short preamble. Would get PHY
+		 * errors.
+		 */
+		ctl &= ~B43_TXH_PHY_SHORTPRMBL;
+		ctl &= ~B43_TXH_PHY_ANT;
+		ctl &= ~B43_TXH_PHY_ENC;
+		ctl |= antenna;
+		if (b43_is_cck_rate(rate))
+			ctl |= B43_TXH_PHY_ENC_CCK;
+		else
+			ctl |= B43_TXH_PHY_ENC_OFDM;
+		b43_shm_write16(dev, B43_SHM_SHARED, B43_SHM_SH_BEACPHYCTL,
+				ctl);
+	}
 
 	/* Find the position of the TIM and the DTIM_period value
 	 * and write them to SHM. */
@@ -1726,20 +1816,28 @@ static void b43_write_beacon_template(struct b43_wldev *dev,
 static void b43_upload_beacon0(struct b43_wldev *dev)
 {
 	struct b43_wl *wl = dev->wl;
+	/*
+	 * rev 40+ ucode keeps the two beacon template slots at RAM 0x200 and
+	 * 0x480 (wlc_bmac_write_hw_bcntemplates, core_rev > 0x27), not the
+	 * legacy 0x68/0x468. Length (SHM 0x18/0x1a) and the valid bits (MMIO
+	 * MACCMD, unchanged) are the same on both.
+	 */
+	u16 base = b43_ucode_is_ac(dev) ? 0x200 : B43_SHM_SH_BT_BASE0;
 
 	if (wl->beacon0_uploaded)
 		return;
-	b43_write_beacon_template(dev, B43_SHM_SH_BT_BASE0, B43_SHM_SH_BTL0);
+	b43_write_beacon_template(dev, base, B43_SHM_SH_BTL0);
 	wl->beacon0_uploaded = true;
 }
 
 static void b43_upload_beacon1(struct b43_wldev *dev)
 {
 	struct b43_wl *wl = dev->wl;
+	u16 base = b43_ucode_is_ac(dev) ? 0x480 : B43_SHM_SH_BT_BASE1;
 
 	if (wl->beacon1_uploaded)
 		return;
-	b43_write_beacon_template(dev, B43_SHM_SH_BT_BASE1, B43_SHM_SH_BTL1);
+	b43_write_beacon_template(dev, base, B43_SHM_SH_BTL1);
 	wl->beacon1_uploaded = true;
 }
 
@@ -3237,6 +3335,17 @@ static void b43_set_phytxctl_defaults(struct b43_wldev *dev)
 {
 	u16 ctl = 0;
 
+	if (b43_ucode_is_ac(dev)) {
+		/*
+		 * rev 40+ ucode: AC PhyTxControlWord_0 format (CCK, core 0), as
+		 * the vendor driver sets it. 0x54/0x188 mean something else
+		 * here.
+		 */
+		b43_shm_write16(dev, B43_SHM_SHARED, B43_SHM_SH_ACKCTSPHYCTL,
+				0x0040);
+		return;
+	}
+
 	ctl |= B43_TXH_PHY_ENC_CCK;
 	ctl |= B43_TXH_PHY_ANT01AUTO;
 	ctl |= B43_TXH_PHY_TXPWR;
@@ -3252,6 +3361,8 @@ static void b43_mgmtframe_txantenna(struct b43_wldev *dev, int antenna)
 	u16 ant;
 	u16 tmp;
 
+	if (b43_ucode_is_ac(dev))
+		return;
 	ant = b43_antenna_to_phyctl(antenna);
 
 	/* For ACK/CTS */
