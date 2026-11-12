Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506207;
	b=AG8nVjF/scsB6cXi3Bb18PBKvUy0LCrh18HS0LghZYnrhPL3QGdkgIy8sVCjNXcP9LZ9
	 FQG1CtcCo6/mKpjauMsFuBNOFwQiCChc4ELSD47LMzXLOpt2eqFy5irv2oFFlYCc+GxZc
	 i5LVTty3fHJBN92uyFSSwLDyEHLeel8NyG8lfHi6JByqaISTt74sV+5KmH4b24HHCYljy
	 G1tu3OkIYZrL0eF3e8fpFlmOwjJB7qmJG1WWfqICvcQX19yAZ+Pa/hB9d5LMsjzgZMhXT
	 tc/LnKLoZoG4mmvlirYbQo5VND2DNw5jCY7x9B9HrIzM0qOmFVQ7Uoe/5A62WUyb+9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nNm8Cx2ZfHbw8ESTnrWh1uOe82GeZsKFiVEtoCEnJGE=;
	b=tB//arAJkH5CXFWPiU5QOvDUfWp7Kt6IJdTxSf7J/rxIC7k+RI6heuTEfW/EUQr7JCYk
	 HUznwFgqgVb2yZPGwtbU78v2w78C64Dm5sVSKpNVtnffNGDNZ8qGp4fxox+w99XgYbLGo
	 /PsvFzC/mFMVc8++3co/8kxWLJOoOx7Kf0xNuM78Hcw+a57rFao7YYs3u40u2nVzHBvTx
	 tPKfy2NMm7OehuUfYxZ8BmNJ2HoslHzxe2gXTAO2aouxp4qXKSz0Nkmqb6sSJexQizBXh
	 FxICELAjyX9w3uBuWSw+mjHjK1Ld9uaQ62qASmb9B80O8SfWVuvyURMdu4ppXbHdiHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQHo2KIP;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2182F60A263B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2182F60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQHo2KIP
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4919a880834so34685f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506205; x=1795111005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNm8Cx2ZfHbw8ESTnrWh1uOe82GeZsKFiVEtoCEnJGE=;
        b=CQHo2KIPRQenaqgEzE2NoSegb7WfWqir3iaN4h22UZ2lsokznkDCJ9BQ50/QIEr39X
         SEj0M8yyiAu5UfFhMzsPYNkJq0KJFEvqOb82y2irGjhYO0uKliAXFOcw6WBkOtlaDEev
         ge0nAxzVnn0RemgEhMj8Rx5ruBBYj9AHHPgsM454AZ5LCMss9GKhngC5xV/zlJp810mu
         ICiUmA5MkZz0UvkPFJRHsOR5pVCH4sNVgqOKRcQ3A02WAVEYLI9QxgjBn4oarpb5pQb7
         cTXbJIZwsiIOs59TAJOJ1u2gTY7mSQrAuyKp//cBinHMF/y0DOvxI7y8hqnx7qV7/bt3
         3A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506205; x=1795111005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNm8Cx2ZfHbw8ESTnrWh1uOe82GeZsKFiVEtoCEnJGE=;
        b=NhRaW47Uo4wZTLWG/77inHumI3w0Ynb03K4EAVjTawv6WzPCWeCCae+GzlGORd/jqn
         cnRyo2dsAHyBcKNOhaTo3d4FRv5E9RwRUWu7zBg11tUX4LiwMUzcE/Z6NifPpTjaa1ft
         MxjzTyGzU4haHZ+00rqqOy5IgPhn87T9k6ssPea1zAr4VHljeuKeEFW6hE1R8WMq/6dN
         wyXFRUzwTZWbEm1RVwO1C27xh5pNRplFnHGS4SzLukKM13GlT9NRWiBvpuP5MS6WVlRf
         ETypTc7tq4bLXuJu9iVmBbpeb1gfBtMX0y53EBPOAT17ghgVhe4KzbOKM1tbALyQjCW2
         Cphg==
X-Forwarded-Encrypted: i=1; AL+hErHavZN45oHfTCgwy/nebSZNgYCHq3FI+/j/154ncHt/+iEACKBDKRw4GA6ucHHGsmoVp+9c8zN0faWJKXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y10AgIr5jGYjHAW8bSq2MkSsOoCq7HCVTS8fRBfOEeYgtuz7L
	7ljS2bpAE7ekmWtXjTW76g2c5gigMDLOdKsHzSN90QTnZBD1AiGkdOUj
X-Gm-Gg: AYBFou2dShDCPLnB+1I/mkUDYh0VL63YE1CRCvUSUqAB2ZWMZBaQOQ9qiDHloMid/Ke
	yzCyttKNzeO5i6pK/97Rjp4z5NG/EZXJ2GxpR8rrl3pkx6kbzSTzElvwyK1qZHWtLjEUQU7jOeQ
	n4i379CS1pOwpqE+ow+ieK7V+tPuJhPrtaULLWGEEVqmF68RPsq79XEO0dyufh+TnwX8PlNYQ8z
	DKSn/zYytBWLk3xS54xElJ/SrbbSQV4i0Pl8aZdQc7FWNK/f6GBS64MtybUtszibPDCB0cqEUHQ
	fArJF4NvzrRjLNPAHRzZuAKzm1guIIGppL4Mllud/fC2+oDAoJ9xJkyMyifEtaLHfuQqsh+m/x2
	oqAH0BiJ8wR3wl2ggrK21NISR9alyiijxcUadHJrjq2WeUNmoDy0sWhtqtobMYeL/aD5MIfgBx5
	KuV4vfH8pqbreP0ougqcVMBoZO0sq0Z2EK/i6irk6DwNK5gF6UKDs4IqC/xnUoxs9IH0rwy0zRe
	a73WyZvfR0x9AQBxmU1QV6yJ9dDEpzX+ofyNyOSMuzKciiVXVbB3ctPXmnCsPvd8i8JphMQjVpW
	wV7R5wR+r8JDI0S3Bg2WDxIJxJ/r7FRORjHy3QX0UOqC+fCZ6w9fNKukfaTmDzVoV1oajo6jLmb
	vFHlT6BHKXuIiuXqjhl8rWHlAmRHe1wRBV9LZpXtBF4sIX0nQNB9KU7n70g2GzzNooh2B9JsUAl
	DSFTOmxf45olOmcKit5h7XHjJKRD+3arFIrk+Rx3efBrGqnbpeRxWvSh3shDj8jwY=
X-Received: by 2002:a05:6000:2288:b0:49c:6a45:ca33 with SMTP id ffacd0b85a97d-49c70ed923amr259032f8f.9.1794506205465;
        Thu, 12 Nov 2026 09:56:45 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c193fsm547430f8f.13.2026.11.12.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:44 -0800 (PST)
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
Subject: [PATCH RFC wireless-next 3/4] wifi: b43: RX header handling for the AC microcode
Date: Thu, 12 Nov 2026 18:56:39 +0100
Message-ID: <20261112175640.40603-4-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175640.40603-1-gonsolo@gmail.com>
References: <20261112175640.40603-1-gonsolo@gmail.com>
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

The RX header of the AC microcode keeps the MAC status at 0x10, the TSF at
0x14, an 11ac chanspec at 0x16 and the power of the two antennas at 0x09
and 0x0a. Decode the channel (including the 80 MHz block with the position
of the primary channel), the signal, and the HT-SIG and VHT-SIG-A bytes
that precede the frame for the rate, bandwidth, guard interval, coding
and stream count.

The microcode sets the decryption error bit on frames it never decrypted,
because no hardware key is programmed (the 4-way handshake message 3 and
DHCP replies carry it). Pass such frames up; mac80211's own decryption
still rejects anything corrupt.

Only microcode revision 832 has been tested.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/xmit.c | 91 ++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/xmit.c b/drivers/net/wireless/broadcom/b43/xmit.c
index cf9e7a5..dee6cc6 100644
--- a/drivers/net/wireless/broadcom/b43/xmit.c
+++ b/drivers/net/wireless/broadcom/b43/xmit.c
@@ -855,6 +855,7 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 	u32 macstat;
 	u16 chanid;
 	int padding, rate_idx;
+	s8 ac_signal = 0;
 
 	memset(&status, 0, sizeof(status));
 
@@ -874,6 +875,31 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 		chanstat = le16_to_cpu(rxhdr->format_351.channel);
 		break;
 	}
+	if (b43_ucode_is_ac(dev)) {
+		/* AC ucode (rev 40+) header: RxStatus1 @0x10, TSF @0x14,
+		 * 11ac-style chanspec @0x16, per-antenna power @0x09/0x0a.
+		 */
+		const u8 *h = _rxhdr;
+		u16 cs = get_unaligned_le16(h + 0x16);
+		s8 p0 = h[0x09], p1 = h[0x0a];
+
+		macstat = get_unaligned_le16(h + 0x10);
+		mactime = get_unaligned_le16(h + 0x14);
+		/* 80 MHz chanspec: centre channel and the primary's position */
+		if ((cs & 0x3800) == 0x2000)
+			cs = (cs & 0xff00) |
+			     ((cs & 0xff) - 6 + 4 * ((cs >> 8) & 0x7));
+		chanstat = ((cs & 0xff) << B43_RX_CHAN_ID_SHIFT) |
+			   B43_PHYTYPE_N;
+		if ((cs & 0xc000) == 0xc000)
+			chanstat |= B43_RX_CHAN_5GHZ;
+		if (p0 == -128)
+			ac_signal = p1;
+		else if (p1 == -128)
+			ac_signal = p0;
+		else
+			ac_signal = max(p0, p1);
+	}
 
 	if (unlikely(macstat & B43_RX_MAC_FCSERR)) {
 		dev->wl->ieee_stats.dot11FCSErrorCount++;
@@ -884,10 +910,19 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 	if (phystat0 & B43_RX_PHYST0_SHORTPRMBL)
 		status.enc_flags |= RX_ENC_FLAG_SHORTPRE;
 	if (macstat & B43_RX_MAC_DECERR) {
-		/* Decryption with the given key failed.
-		 * Drop the packet. We also won't be able to decrypt it with
-		 * the key in software. */
-		goto drop;
+		/* The AC ucode sets this bit on frames it never decrypted: this
+		 * port programs no hardware keys on AC, and it shows up even on
+		 * unprotected EAPOL frames. Dropping here killed
+		 * 4-way handshake message 3 and DHCP replies; mac80211's own
+		 * software decryption still rejects anything really corrupt.
+		 */
+		if (b43_ucode_is_ac(dev)) {
+			b43dbg(dev->wl,
+			       "RX: DECERR passed up (len %u, macstat %04x)\n",
+			       skb->len, macstat);
+		} else {
+			goto drop;
+		}
 	}
 
 	/* Skip PLCP and padding */
@@ -931,7 +966,11 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 	}
 
 	/* Link quality statistics */
-	switch (chanstat & B43_RX_CHAN_PHYTYPE) {
+	switch (b43_ucode_is_ac(dev) ? B43_PHYTYPE_AC :
+		(chanstat & B43_RX_CHAN_PHYTYPE)) {
+	case B43_PHYTYPE_AC:
+		status.signal = ac_signal;
+		break;
 	case B43_PHYTYPE_HT:
 		/* TODO: is max the right choice? */
 		status.signal = max_t(__s8,
@@ -955,7 +994,47 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 		break;
 	}
 
-	if (phystat0 & B43_RX_PHYST0_OFDM)
+	if (b43_ucode_is_ac(dev) &&
+	    (phystat0 & B43_RX_PHYST0_FTYPE) == B43_RX_PHYST0_PRE_N) {
+		/* HT frame: the six bytes before the frame are HT-SIG: MCS and
+		 * 40 MHz bit in byte 0, coding/STBC/short GI in byte 3.
+		 */
+		const u8 *sig = plcp->raw;
+
+		status.encoding = RX_ENC_HT;
+		if (sig[0] & 0x80)
+			status.bw = RATE_INFO_BW_40;
+		if (sig[3] & 0x80)
+			status.enc_flags |= RX_ENC_FLAG_SHORT_GI;
+		if (sig[3] & 0x40)
+			status.enc_flags |= RX_ENC_FLAG_LDPC;
+		status.enc_flags |= ((sig[3] >> 4) & 0x3)
+				    << RX_ENC_FLAG_STBC_SHIFT;
+		rate_idx = (sig[0] & 0x7f) <= 15 ? sig[0] & 0x7f : -1;
+	} else if (b43_ucode_is_ac(dev) &&
+		   (phystat0 & B43_RX_PHYST0_FTYPE) == B43_RX_PHYST0_STD_N) {
+		/* VHT: the six bytes are VHT-SIG-A1/A2 */
+		const u8 *p = plcp->raw;
+		u32 a1 = p[0] | (p[1] << 8) | (p[2] << 16);
+		u32 a2 = p[3] | (p[4] << 8) | (p[5] << 16);
+		u8 nsts = ((a1 >> 10) & 0x7) + 1;
+
+		status.encoding = RX_ENC_VHT;
+		if ((a1 & 0x3) == 1)
+			status.bw = RATE_INFO_BW_40;
+		else if ((a1 & 0x3) == 2)
+			status.bw = RATE_INFO_BW_80;
+		if (a1 & 0x8) {
+			status.enc_flags |= 1 << RX_ENC_FLAG_STBC_SHIFT;
+			nsts /= 2;
+		}
+		status.nss = max_t(u8, nsts, 1);
+		if (a2 & 0x1)
+			status.enc_flags |= RX_ENC_FLAG_SHORT_GI;
+		if (a2 & 0x4)
+			status.enc_flags |= RX_ENC_FLAG_LDPC;
+		rate_idx = ((a2 >> 4) & 0xf) <= 9 ? (a2 >> 4) & 0xf : -1;
+	} else if (phystat0 & B43_RX_PHYST0_OFDM)
 		rate_idx = b43_plcp_get_bitrate_idx_ofdm(plcp,
 					!!(chanstat & B43_RX_CHAN_5GHZ));
 	else
