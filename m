Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664142;
	b=UkxTnjJQnO90G6+1qn6NOQXQifI2SGz84huz5VqpP1RSy1UF5QSmD0NhStnGATkNsQIf
	 ZrYq0YDJHSoec0TvjLwsoK+IgMZAnsI7EXjO7vOzz46l9eznKfDnft7dhPd/PoNtnrcD5
	 CCTH7RI/3gXVMt9onBrtMEuB1Lq5bZsRySIxjT2DjAzvfeAn8adcytcYvcn320FDBMQNr
	 M0l9PIJzrnnrPaaI64HIEY4iKG36yKoN+4+gVS9n7vRE75mxOYTZJGDx8rAPifjzscqk9
	 WxQS6Kr7dmT3s2PqGWaA4DbWnuCwdI3KG4BvzjyQk7rFru6d0RzEVObIk3kwISwOXew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PEieUWRDCjwpppauDb9b292JwszGMt/MN7eT0Sz8qIQ=;
	b=hrRntIdq83Qk/qqiMjWcqrNXA8nO5ggZhz8mLHSZJ7T0Zu4g4hzRHNfSHlh9Q3T/Cgtw
	 36zD94wUQ+gldLBDYI3egaXrh0A5xe7gGFz00r96PJJlIKJZS8+TNa8kWWpm2xM2YNTVK
	 AJJSoe3pM/QLyFwW8ioRKORo8BJHtFkxmtUwstt3Rb1oyWi9ymHE8amnGPfOB9ZIENUoK
	 wtqUO9hN8KLSuNA7wHW/gBldQun+NUHk1LjbUSWrYg2385UKVFYqZUQMyqrY3He+8SxTf
	 jNqM41XcrmpU8wSTG232i4LKoHqeYJzq6CMGvsb9bks0yhkoTiyb3HmFmaMJlG54R0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvm1kYBC;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96979606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96979606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvm1kYBC
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e04773687so1077523f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664140; x=1794268940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEieUWRDCjwpppauDb9b292JwszGMt/MN7eT0Sz8qIQ=;
        b=fvm1kYBCFYC8l8TpyLAOcQonr3P9RMSEvlpT0Ujx8I9zHwBvKywFJjBhogg/abbWQX
         4Fq3/b4zdRecEQSY16lb346VjeOCF6QuNTHfY5AsmwEO5fD5g3jFAVOyps2qmmGrQs6C
         TmPAdv3tPWJ2uF7C0246omTvHU/6lk9rqHGMHKtp/KjFFJqxRveFQWCjysNCwVdo5H5k
         Y7Xl6FJDHuX96ocOE6bDkr6sKe5lVgL6v4VNZyqi5yL6wOYSvRpsKaje2pruZHM6hYi0
         TDIhF4GS1fs7LkQFU0YhLyg5jOHfokhtpaB2GV+iLRZdGHtv8F2izElIpERJ1f2gxoz2
         2jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664140; x=1794268940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEieUWRDCjwpppauDb9b292JwszGMt/MN7eT0Sz8qIQ=;
        b=fyAkTIKO+XepDeQUJrzbzqJwztmYXYio7kBVolUIz5Ptl/fcH0/miSph6WvzuRmOVj
         mDtoINOUEy99F0p2gUH36uygF8z///UQPngusSqelavPVtrc3v9JPPoNhbr87oyuw5of
         sVKHjjNm5ciXcA3+TTPdgH2tH/PDWGbjOby4SZa+GYJrwjyv6dISaIIYitESW0YzroR6
         zgGvx3xQ2vtNUd7MMsEvPkfJ1/FDKx/ZOLXZgds/pBHpgDl9O/+A1pRECADHQzOngyIB
         ug641MD6DFOo1Z3uFM7KcABICZ9TVDW0dqGCxVCFxFGDRqnaPb2VJUFJA2C8CjYa8szu
         /WgA==
X-Forwarded-Encrypted: i=1; AKwUvBxwgUQ0kLbJfTERNkDBiSa9gLafWojAl0xQ/TvSmkA/82MA0X/jXgZn9oeNTR09V5NtE7UwAZ48bGR+TlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nk5zmMBwjGmIT+uH2qekHzecjwUvkT4X1AcdtFAapQn36QTJ0
	yHUTXBsKav02OZqYyoFp6/PaU1GxrgsXsr4KseiL48Ity+GHNoHKf06BTQWuJNb1
X-Gm-Gg: AYBFou0yy1X3HvNw5lPOe38J9m2mc/RDgfW84iob1qgRR6nAIfMU9OBsWdGsRtTV5fz
	1AkJh8WkHnoQAAFjRUG5XOU0m9hJ4jHrGoLP7mskJuMJdWzYXrNiZFKElBfTM76qbwNWg/QokFr
	istHbhEI2laM8C8P/FAcRZZm3nWypc/UubPvSgAB7Thv8v3mWYNMBqVUMHIn+aPZWxKfTIhUZQI
	aqDhyrJjjnIRW1hPpp9tqhGG7qpNomgEFGNE8qNFXWbv84EHtl8Klf9KTe1c1uNaihIKYFZz5Bl
	RQRrcBXudN4p2HIrhhlQdEUkLNM58YcpOaZ8SvSZbdkhl334pzrUTRJrBpEuj5jFOlh3MCFpk4h
	RGqQlHsBO8rYOW4ZOpgDm+LKv8Dr8DuKFV7fCN3MXKasUqgrOwnkB6omSEmD3zhbgpYO45IZNW0
	7d5XftLRf1fH0n5gpi1OzgfrZxDPlj5HKYklEiLmQpV/Ltt4+B3i67o1bmgjntpwdMkIS/ppjv9
	J1N/Tmhm+jYzP8pPYk0uUP71NMYkb1mE8MjkJzBgeNuSD2FSpYxkIUe+/58LamjXP7DxAuksjqI
	iTRQg5KCwzSPTn8wzbyZGj8Unx4OIGf1TbwK9tuXh4sdSMMqnnfX4igc6eajcbBjb9zQQdg0DXi
	Ma/onUbrL0jWAz7O5l/pssj8bhyJLljsIni05RXMhcYXp0Epoi0ScDHLgrKlQbQ==
X-Received: by 2002:a05:6000:4a19:b0:48c:4442:54e with SMTP id ffacd0b85a97d-48e6e4f4405mr24090280f8f.30.1793664139625;
        Mon, 02 Nov 2026 16:02:19 -0800 (PST)
Received: from DESKTOP-D7IGS5L.localdomain (123.20.61.94.rev.vodafone.pt. [94.61.20.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm21748687f8f.25.2026.11.02.16.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:02:18 -0800 (PST)
From: Marco Martins <marcomartins86@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	=?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>,
	b43-dev@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next] wifi: b43: fix missing beacons by starting at the next TBTT
Date: Mon,  2 Nov 2026 23:59:39 +0000
Message-ID: <20261102235939.156522-1-marcomartins86@gmail.com>
X-Mailer: git-send-email 2.53.0
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

b43_set_beacon_int() programs the first TBTT one beacon interval after
zero, as if the TSF started there. The hardware compares it with the
low 32 bits of the TSF. Up to 2^31 us past it, it moves it on by whole
intervals and beacons. Further past, it leaves it and sends no beacons:
on a BCM5352 (core rev 9, firmware 666) the TBTT stayed at 0x19000 for
over six minutes while the low 32 bits of the TSF ran from 0xd1d508fa
to 0xe7f71356.

Without beacons there are no DTIMs, so the frames held in the multicast
ring for stations in power save are never sent. The ring fills and b43
stops the queue of the frame that filled it, best effort for most
broadcasts: stations still associate, but get no DHCP lease.

The TSF is not reset when beaconing starts, so an AP that starts with
the low 32 bits of the TSF in the upper half of their range does not
beacon. With one interface, starting the radio resets the TSF, so this
needs beaconing to start again while the radio stays up, or a TSF taken
from other stations in IBSS or mesh mode. The first was tested: hostapd
stopped and started again on an interface it had found up, which it
leaves up, with the TSF set to 50 minutes in between by b43_tsf_write().
The TBTT stayed at 0x19000 and no TBTT interrupt came for over 20
seconds; with this patch the TBTT was just ahead of the TSF and the
interrupts went on. IBSS and mesh were not tested.

This was found with an out-of-tree patch that runs a station and an AP
on one b43 radio, as a repeater: the station interface keeps the radio
up and synchronises the TSF to its AP, and an AP restarted beside it did
not beacon whenever it started in that half. With this patch it did, in
the same half.

Where the hardware does move the TBTT on, the beacons go out at
multiples of the interval in the low 32 bits only, which are not the
TBTTs once the TSF has passed 2^32 us: 2^32 us is 4 TU more than a
multiple of 100 TU, so they are 4 TU off for every 2^32 us the TSF had
run when beaconing started.

Program the next TBTT from the TSF instead, as ath5k does.

The bug was found, and this patch and its description written, with an
AI coding assistant (Claude Code, model Claude Opus 5.5), asked to find
why phones got no DHCP lease from the repeater after its AP restarted.
It read b43 and mac80211, added debug hooks to b43 that dump the TSF,
the TBTT registers and the DMA rings, and ran the tests on the device.

Fixes: a82d992261f7 ("b43: Beaconing fixes")
Signed-off-by: Marco Martins <marcomartins86@gmail.com>
---
Tested on an ASUS WL-320gE (BCM5352) running OpenWrt 25.12 (backports
6.18, built for MIPS without warnings) with the out-of-tree station and
AP patch: as a repeater, and as a plain AP with one interface.

Not done: no build or run of wireless-next or mainline itself, only of
the same function in backports 6.18; IBSS and mesh not tested; the
single-interface test set the TSF with a debug hook instead of waiting
50 minutes; beaconing resuming when the low 32 bits of the TSF wrap
around was not observed.

 drivers/net/wireless/broadcom/b43/main.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 3825b6a..5fa3cd9 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -1852,10 +1852,22 @@ static void b43_update_templates(struct b43_wl *wl)
 
 static void b43_set_beacon_int(struct b43_wldev *dev, u16 beacon_int)
 {
+	u64 tsf;
+	u32 rem;
+
 	b43_time_lock(dev);
 	if (dev->dev->core_rev >= 3) {
+		/* Start at the next TBTT, the next multiple of the beacon
+		 * interval on the TSF. The TSF need not be near zero, and the
+		 * hardware sends no beacons for a start more than 2^31 us
+		 * behind it.
+		 */
+		b43_tsf_read(dev, &tsf);
+		tsf >>= 10;
+		div_u64_rem(tsf, beacon_int, &rem);
+		tsf += beacon_int - rem;
 		b43_write32(dev, B43_MMIO_TSF_CFP_REP, (beacon_int << 16));
-		b43_write32(dev, B43_MMIO_TSF_CFP_START, (beacon_int << 10));
+		b43_write32(dev, B43_MMIO_TSF_CFP_START, lower_32_bits(tsf << 10));
 	} else {
 		b43_write16(dev, 0x606, (beacon_int >> 6));
 		b43_write16(dev, 0x610, beacon_int);

base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.53.0

