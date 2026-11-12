Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501975;
	b=hN86uhHEHRN9KaJtzqjuGKLHYKFjigTSOsp19sOwJNkIMhwFa5a7RTB2L/ivgz1IUAKb
	 mBZ4fdJVoS7gRUdovQZbiKJzchsfsMP7KjjjpUhMrq4ZUikWW/8n/TmMNUzS+jZutKTcS
	 bQkvjC7KE641/7D6IeUti5UNqFAbn+i7IgvhHBVIzfulXV6IbJkEwJlpV2qSGjy9b4BH/
	 qbZveM0WO8t1uTqmIQQ6801hd6eiDhG546iXwWvUVbxGMlwqy4RugevvvISwFuLXeDic/
	 JJ58HJsrCFduDA5Kil7Y3uTH88EBubf6efQvS9/Q3kjgF0iuXKg8PoPhOcirKsnRifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvjFjzQy5pi0I95xeSxsh2Lc4QfBGMaxpE6Y6WVG9Sc=;
	b=Isgbz+ZdSJN3ulecbwKDYy4jBoxVtf7V5NToSKNxWEOxchlwh+QA9SfrfwUt7NQhe39I
	 c85tbjvMpUvc5DbND2YO7ShLbqUlb7pYjmYhU+ci92JdDLUaLWtCVQjm9fokhwKYOlTY7
	 HZkfkJAcus2Zl46llD/+ObuSkWvpMSYt9VVqE9J1R+6NOoYn0VuM5pcYyQOeYALP0KyHy
	 ZzvuXLjzpl+0IVqfbvT19cm34ND9+LTs4vqThmZ196mdCITwtSbK6PVwTc+CKzOg42etY
	 O/btVkDOAb4qchFTQ8tFHFJbrQHiDX64Qygsz8WrA/A97cTHkghwMF1nZDGxnT4SAMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MA4mM4eV;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F18606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F18606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MA4mM4eV
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3acec6677so6722351c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501974; x=1795106774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvjFjzQy5pi0I95xeSxsh2Lc4QfBGMaxpE6Y6WVG9Sc=;
        b=MA4mM4eVg23KN6RRkqeSgOPbeLQKGJ2hVcq6oXZnbKPatPVy1t+WUCfFHOYABGp7O9
         jM9I8hR7KxH9KNqA2Kng8aXHq+zBffgzoVX3TIllAPyxiibKIhsCPfxSNKrWW0Zh7unh
         QY6qUX7DYipCwPxdie9hj5yFlJgpiAwHYRYLM8BVO5kDsdsVnss/NJD7vY0BAIZrpxi8
         TM+ajbYRujc7RMzi8alJVwQrcLQ/12JnV8huYlbpOja1wtVeIgBV+MaKm/l1JktM4m/D
         wcP8z8iy9wgqnw5KhvpZmYNFlyOa1gH0DU+4W8stATmuufKvSeM3wAWRH3R8vkn1rLwi
         QUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501974; x=1795106774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvjFjzQy5pi0I95xeSxsh2Lc4QfBGMaxpE6Y6WVG9Sc=;
        b=PsFYTnhwK+g4d7Cabh/of14N1qfEc8FvbzbbSI+TS3KjBbzihD8QmYDI4zAgu59GW6
         rkt/7XIuL0/twtMJdEn6dZ7DWskEHXo287Zf/QYyxEC8Eaeo+SB1KjKzqwxgXt4NVbYg
         tXQsDy2fL99FoeopxH90wYv2NHDyzJco+k2WA8rejssBJFhTJvFZWQwsBO7l0AjLsXfs
         zevtgqzmJN7i6mKIwf2JuqUmIy4feC8mcZnIxml7wjIaSbCbJeR2hwPXwen+qCSVtWkY
         OGkJ62oz+tTq3nkgJ2T5dSseH7fx2Uf0LnmIQB34ZW0mLYFSl5zEE2U0DEORWnOmEfDg
         V6uQ==
X-Forwarded-Encrypted: i=1; AL+hErEinj6ykPeGpsOUna5E1iyQ70xe/+zseTZODfqSavTurSG3m6wLvOb+KMpRJfTdvNJNQUIVN7RoJrYsfsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z80AwrnAGoYqCrFLpHhRhZZHvk1SQFrQvA1AiXJljVmvbr1nRA4
	B+PtC+CKnwXJWw9TGiJXCy3ScQEsJ36T2lcGz5OL4oK1KN1ICtRRF4mk8K94d+dE
X-Gm-Gg: AYBFou1AbFhfVj3qdPzcwWleO8MiRyNirceKt8oH97ufhYJGwCc/6IUvr2NPo1qaRMi
	vANOWTskT6Pa0qc7MRQrPnG4kbrUEauAuskAXL2AprNHBWh4r+YZEAGulKUixnXx51qw0cOdbYC
	YSc25KTT6fU/hZjZ7cQVPQLMoxd6smy6IGYNWBRR2AcrqjtWaJD8bXvilhwN3iBUa0LSBmIelGR
	lCODYoXaNjP+1H7MgtmBkcZT6SdSTLRlNxQKcwSbKeVTF/2LPiTX7M+Ikj3NOJsZ47YvvOLH+xh
	Pht6DZCU1UnWZfU7um0dUKFv9S00P66agfBXizJXeT0Jg/hIDg2owmM69SuCR1tWjsfLOypHiWv
	TnLETlOIXnkDZtNGdkLNFZCvD/X46PfjHoRv0p/mZNpFRm5Xyb84niMDyno9fSR/juSgYLNwxSo
	6aiuRxN37lxSOzhb6H32fQopnSXRCG+jENjNuPcOsZuqgYrs3UD9eo9aC9FoYF0aVIVazV0ccJj
	oTA6AhGell95J30ModbGw2l842XbK72Q8bIUNGkxKYY0L7hHbsPDQYf+S1hPZKZLmazTAXq+IPG
	h8klWWHRf9hm2DA/QGgc5LiAFhD9J2jI8xlfSlaL1MAzFe3iQXbK41X+o1R0+V0YeDk34luRQC2
	rccottV+x82diAJgnyrbikQStzBrVmcRHHWaDi8hOh2wDoGuBTc9T
X-Received: by 2002:a05:7022:3704:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b5030d404cmr111454c88.16.1794501973136;
        Thu, 12 Nov 2026 08:46:13 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:12 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 2/7] wifi: rt2800: calibrate the crystal of RT3593 with the beacons
Date: Fri, 13 Nov 2026 00:45:36 +0800
Message-ID: <20261112164544.3176458-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

On a Netgear WNDA4100 (RT3593), as the adapter warms up, the
frequency offset drifts enough to affect the link quality.
In certain cases it can cause the link speed to drop
to 1Mbit/s or below.

Add a frequency calibration step function to RT3593 to use
the frequency offset obtained from the beacon frames of the AP
for tuning.

Test results:
   before after
TX 27.7   28.5
RX 31.6   69.7

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800.h   |  1 +
 .../net/wireless/ralink/rt2x00/rt2800lib.c    | 77 +++++++++++++++++++
 .../net/wireless/ralink/rt2x00/rt2800lib.h    |  1 +
 .../net/wireless/ralink/rt2x00/rt2800usb.c    |  1 +
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   | 13 ++++
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 24 ++++++
 .../net/wireless/ralink/rt2x00/rt2x00lib.h    |  2 +
 .../net/wireless/ralink/rt2x00/rt2x00link.c   | 10 +++
 .../net/wireless/ralink/rt2x00/rt2x00queue.h  |  5 ++
 9 files changed, 134 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800.h b/drivers/net/wireless/ralink/rt2x00/rt2800.h
index 8930589b49..b9f6de3a46 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800.h
@@ -3163,6 +3163,7 @@ enum rt2800_eeprom_word {
  */
 #define RXWI_W3_SNR0			FIELD32(0x000000ff)
 #define RXWI_W3_SNR1			FIELD32(0x0000ff00)
+#define RXWI_W3_FOFFSET			FIELD32(0xff000000)
 
 /*
  * Macros for converting txpower from EEPROM to mac80211 value
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 4f7beca668..371b293bac 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -935,6 +935,16 @@ void rt2800_process_rxwi(struct queue_entry *entry,
 	 * Convert descriptor AGC value to RSSI value.
 	 */
 	rxdesc->rssi = rt2800_agc_to_rssi(entry->queue->rt2x00dev, word);
+
+	/*
+	 * The frequency offset is used for the frequency calibration.
+	 */
+	if (rt2x00_rt(entry->queue->rt2x00dev, RT3593)) {
+		word = rt2x00_desc_read(rxwi, 3);
+		rxdesc->freq_offset = rt2x00_get_field32(word, RXWI_W3_FOFFSET);
+		rxdesc->dev_flags |= RXDONE_FREQ_OFFSET;
+	}
+
 	/*
 	 * Remove RXWI descriptor from start of the buffer.
 	 */
@@ -2441,6 +2451,7 @@ static inline bool rt2800_clk_is_20mhz(struct rt2x00_dev *rt2x00dev)
 }
 
 #define FREQ_OFFSET_BOUND	0x5f
+#define FREQ_OFFSET_INVALID	-128
 
 static void rt2800_freq_cal_mode1(struct rt2x00_dev *rt2x00dev)
 {
@@ -5631,6 +5642,72 @@ void rt2800_vco_calibration(struct rt2x00_dev *rt2x00dev)
 }
 EXPORT_SYMBOL_GPL(rt2800_vco_calibration);
 
+void rt2800_freq_calibration(struct rt2x00_dev *rt2x00dev)
+{
+	struct link *link = &rt2x00dev->link;
+	u8 activate_threshold, deactivate_threshold;
+	u8 freq_offset, rate_mode;
+	u16 eeprom;
+	s8 offset;
+
+	if (!rt2x00_rt(rt2x00dev, RT3593))
+		return;
+
+	if (!rt2x00dev->intf_associated) {
+		eeprom = rt2800_eeprom_read(rt2x00dev, EEPROM_FREQ);
+		rt2x00dev->freq_offset = rt2x00_get_field16(eeprom,
+							    EEPROM_FREQ_OFFSET);
+		link->freq_cal_adjusting = false;
+		return;
+	}
+
+	spin_lock_bh(&link->bcn_lock);
+	offset = link->bcn_freq_offset;
+	rate_mode = link->bcn_rate_mode;
+	link->bcn_freq_offset = FREQ_OFFSET_INVALID;
+	spin_unlock_bh(&link->bcn_lock);
+
+	/* No beacons received */
+	if (offset == FREQ_OFFSET_INVALID)
+		return;
+
+	if (rate_mode == RATE_MODE_CCK) {
+		activate_threshold = 4;
+		deactivate_threshold = 2;
+	} else {
+		activate_threshold = 20;
+		deactivate_threshold = 10;
+	}
+
+	/* Hysteresis */
+	if (abs(offset) >= activate_threshold)
+		link->freq_cal_adjusting = true;
+	else if (abs(offset) <= deactivate_threshold)
+		link->freq_cal_adjusting = false;
+
+	if (!link->freq_cal_adjusting)
+		return;
+
+	freq_offset = rt2x00_get_field8(rt2x00dev->freq_offset, RFCSR17_CODE);
+	freq_offset = min_t(u8, freq_offset, FREQ_OFFSET_BOUND);
+
+	if (offset > 0) {
+		if (freq_offset > 0)
+			freq_offset--;
+		else
+			link->freq_cal_adjusting = false;
+	} else {
+		if (freq_offset < FREQ_OFFSET_BOUND)
+			freq_offset++;
+		else
+			link->freq_cal_adjusting = false;
+	}
+
+	rt2x00dev->freq_offset = freq_offset;
+	rt2800_freq_cal_mode1(rt2x00dev);
+}
+EXPORT_SYMBOL_GPL(rt2800_freq_calibration);
+
 static void rt2800_config_retry_limit(struct rt2x00_dev *rt2x00dev,
 				      struct rt2x00lib_conf *libconf)
 {
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.h b/drivers/net/wireless/ralink/rt2x00/rt2800lib.h
index a3c3a751f5..1e31a61e95 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.h
@@ -241,6 +241,7 @@ void rt2800_link_tuner(struct rt2x00_dev *rt2x00dev, struct link_qual *qual,
 		       const u32 count);
 void rt2800_gain_calibration(struct rt2x00_dev *rt2x00dev);
 void rt2800_vco_calibration(struct rt2x00_dev *rt2x00dev);
+void rt2800_freq_calibration(struct rt2x00_dev *rt2x00dev);
 
 int rt2800_enable_radio(struct rt2x00_dev *rt2x00dev);
 void rt2800_disable_radio(struct rt2x00_dev *rt2x00dev);
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
index 15de3db124..387c07e225 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
@@ -693,6 +693,7 @@ static const struct rt2x00lib_ops rt2800usb_rt2x00_ops = {
 	.link_tuner		= rt2800_link_tuner,
 	.gain_calibration	= rt2800_gain_calibration,
 	.vco_calibration	= rt2800_vco_calibration,
+	.freq_calibration	= rt2800_freq_calibration,
 	.watchdog		= rt2800_watchdog,
 	.start_queue		= rt2800usb_start_queue,
 	.kick_queue		= rt2x00usb_kick_queue,
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00.h b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
index 7d313e86d3..415ff253cb 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
@@ -319,6 +319,18 @@ struct link {
 	 */
 	struct ewma_rssi avg_rssi;
 
+	/*
+	 * Controls interval of frequency calibration
+	 */
+	bool freq_cal_adjusting;
+
+	/*
+	 * Frequency offset and rate mode of the last beacon from the AP
+	 */
+	spinlock_t bcn_lock; /* protects bcn_freq_offset, bcn_rate_mode */
+	s8 bcn_freq_offset;
+	u8 bcn_rate_mode;
+
 	/*
 	 * Work structure for scheduling periodic link tuning.
 	 */
@@ -559,6 +571,7 @@ struct rt2x00lib_ops {
 			    struct link_qual *qual, const u32 count);
 	void (*gain_calibration) (struct rt2x00_dev *rt2x00dev);
 	void (*vco_calibration) (struct rt2x00_dev *rt2x00dev);
+	void (*freq_calibration) (struct rt2x00_dev *rt2x00dev);
 
 	/*
 	 * Data queue handlers.
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 4d94b7062f..7b23da0678 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -688,6 +688,25 @@ static void rt2x00lib_rxdone_check_ps(struct rt2x00_dev *rt2x00dev,
 		queue_work(rt2x00dev->workqueue, &rt2x00dev->sleep_work);
 }
 
+static void rt2x00lib_rxdone_freq_offset(struct rt2x00_dev *rt2x00dev,
+					 struct sk_buff *skb,
+					 struct rxdone_entry_desc *rxdesc)
+{
+	struct ieee80211_hdr *hdr = (void *)skb->data;
+	struct link *link = &rt2x00dev->link;
+
+	if (!(rxdesc->dev_flags & RXDONE_FREQ_OFFSET) ||
+	    !(rxdesc->dev_flags & RXDONE_MY_BSS) ||
+	    (rxdesc->flags & RX_FLAG_FAILED_FCS_CRC) ||
+	    !ieee80211_is_beacon(hdr->frame_control))
+		return;
+
+	spin_lock_bh(&link->bcn_lock);
+	link->bcn_freq_offset = rxdesc->freq_offset;
+	link->bcn_rate_mode = rxdesc->rate_mode;
+	spin_unlock_bh(&link->bcn_lock);
+}
+
 static int rt2x00lib_rxdone_read_signal(struct rt2x00_dev *rt2x00dev,
 					struct rxdone_entry_desc *rxdesc)
 {
@@ -825,6 +844,11 @@ void rt2x00lib_rxdone(struct queue_entry *entry, gfp_t gfp)
 	 */
 	rt2x00lib_rxdone_check_ba(rt2x00dev, entry->skb, &rxdesc);
 
+	/*
+	 * Store frequency offset of the beacons for frequency calibration.
+	 */
+	rt2x00lib_rxdone_freq_offset(rt2x00dev, entry->skb, &rxdesc);
+
 	/*
 	 * Update extra components
 	 */
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00lib.h b/drivers/net/wireless/ralink/rt2x00/rt2x00lib.h
index 2f1385baa7..a6f516ebdb 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00lib.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00lib.h
@@ -22,6 +22,8 @@
 #define LINK_TUNE_INTERVAL	round_jiffies_relative(LINK_TUNE_SECONDS * HZ)
 #define AGC_SECONDS		4
 #define VCO_SECONDS		10
+#define FREQ_SECONDS		10
+#define FREQ_ADJUST_SECONDS	1
 
 /*
  * rt2x00_rate: Per rate device information
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00link.c b/drivers/net/wireless/ralink/rt2x00/rt2x00link.c
index fb23d409fb..d44a55b14f 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00link.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00link.c
@@ -343,6 +343,7 @@ static void rt2x00link_tuner(struct work_struct *work)
 	struct rt2x00_dev *rt2x00dev =
 	    container_of(work, struct rt2x00_dev, link.work.work);
 	struct link *link = &rt2x00dev->link;
+	unsigned int freq_interval;
 
 	/*
 	 * When the radio is shutting down we should
@@ -362,6 +363,14 @@ static void rt2x00link_tuner(struct work_struct *work)
 	    (link->count % (AGC_SECONDS / LINK_TUNE_SECONDS)) == 0)
 		rt2x00dev->ops->lib->gain_calibration(rt2x00dev);
 
+	freq_interval = link->freq_cal_adjusting ?
+			FREQ_ADJUST_SECONDS : FREQ_SECONDS;
+
+	/* VCO calibration should be done after frequency calibration */
+	if (rt2x00dev->ops->lib->freq_calibration &&
+	    (link->count % (freq_interval / LINK_TUNE_SECONDS)) == 0)
+		rt2x00dev->ops->lib->freq_calibration(rt2x00dev);
+
 	if (rt2x00dev->ops->lib->vco_calibration &&
 	    rt2x00_has_cap_vco_recalibration(rt2x00dev) &&
 	    (link->count % (VCO_SECONDS / LINK_TUNE_SECONDS)) == 0)
@@ -422,6 +431,7 @@ void rt2x00link_register(struct rt2x00_dev *rt2x00dev)
 
 	INIT_DELAYED_WORK(&link->work, rt2x00link_tuner);
 	INIT_DELAYED_WORK(&link->watchdog_work, rt2x00link_watchdog);
+	spin_lock_init(&link->bcn_lock);
 
 	if (link->watchdog_interval == 0)
 		link->watchdog_interval = WATCHDOG_INTERVAL;
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h b/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h
index 23739dd0bc..4caf9261a5 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h
@@ -129,6 +129,7 @@ static inline struct skb_frame_desc* get_skb_frame_desc(struct sk_buff *skb)
  * @RXDONE_CRYPTO_IV: Driver provided IV/EIV data.
  * @RXDONE_CRYPTO_ICV: Driver provided ICV data.
  * @RXDONE_L2PAD: 802.11 payload has been padded to 4-byte boundary.
+ * @RXDONE_FREQ_OFFSET: Driver provided the frequency offset.
  */
 enum rxdone_entry_desc_flags {
 	RXDONE_SIGNAL_PLCP = BIT(0),
@@ -138,6 +139,7 @@ enum rxdone_entry_desc_flags {
 	RXDONE_CRYPTO_IV = BIT(4),
 	RXDONE_CRYPTO_ICV = BIT(5),
 	RXDONE_L2PAD = BIT(6),
+	RXDONE_FREQ_OFFSET = BIT(7),
 };
 
 /**
@@ -164,6 +166,7 @@ enum rxdone_entry_desc_flags {
  * @cipher_status: Decryption status.
  * @iv: IV/EIV data used during decryption.
  * @icv: ICV data used during decryption.
+ * @freq_offset: Frequency offset of the received frame.
  */
 struct rxdone_entry_desc {
 	u64 timestamp;
@@ -181,6 +184,8 @@ struct rxdone_entry_desc {
 
 	__le32 iv[2];
 	__le32 icv;
+
+	s8 freq_offset;
 };
 
 /**
-- 
2.53.0

