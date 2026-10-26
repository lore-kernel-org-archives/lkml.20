Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987333;
	b=J597xaLk+W2xN9WoLUmpoZ8Te1nI8CLH6Pngx00OfSCRqbYp48p7ombQ4G59TUGOV7uM
	 2pFlqy25wuH0S2s2K5Zr+VDa/5BBA0IWF6a/awiDAzx7a2dMtrggc0gexwarrvm8TduwL
	 S9w7vB6dXQNkB9APoeb+9NdXL/FVykwSLOWaoel3cUnIRPugkxsLZU9fXYKoOW38F494G
	 qL7OOb+zFKoGwN0baALit3EBusP5UUqZVvfaV5D0N2ZsoRHvlYvB66toQLfDcE2TnUgV4
	 NyqIgaPojr1hox5dtZDUotB7Ucy2CsvX3Pl6Fi15z9Za8bSBGl0uHFSMG8uKrk1PP+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7IsVQT+EBQo1oTvITpYf6+rXx0JZnsNppK5scdXnmz8=;
	b=vc3PMlU4En3uH52heikGTGaIHCjRYxfdSKoXargXsNZFoTEuwoGP08TTpfiRkNFARjkY
	 i829TrfPYMzLSKuRQ2KsYDUjq/+QKi4lLixEDOqatK4kE9Lw6V1vrayb9l4p4yrHxLSf0
	 bPDjKswAqx2AF38c8LQNQNctuiwVIYqio9vPOxhRQSP0fOdLNFfOZp+adwZvM+syXL6Q2
	 hEXjkhSVKedjZKG59Mavc3AZ4CU5Jninm9/E3lxJg9Lbc7U4CXf8GgW1BQwCAbC/qDtUZ
	 An6agIjua8DOE8lJ6ZKIRrP8Z8oHlz/FSReKHecERUyi6YtLER/hnOFe6io8Ybo5mmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C63TgyKq;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70558606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70558606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C63TgyKq
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3550c917fd3so3891307eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987332; x=1793592132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7IsVQT+EBQo1oTvITpYf6+rXx0JZnsNppK5scdXnmz8=;
        b=C63TgyKqhS79//aZjYn7A72ETrj3J4Jmx7z9adsGrZ6BdiMYniJUoU8X2MjGLEb5qF
         vcdWELlXuwNjY7ri1eQ+bOPMV1ERQBlhznsdnyXlkQEOtq7nOJ7fqb8zQLMMrRsFFtvq
         7mA+K2J02rpQArtdedYi3GTZYjZ9CnHGUkBj6Q2UnWbJpF0+24YTVn6xgCf9kyWS+5jg
         cpM+e6AZV7jNUE78AVfZtoN/VyT4gydY1fme8SjZfrrsZ8ecdaFWRy4oa+7GYjFAHe1q
         ZO2+zk1KtdnNtS5RPLVatVSjtCwMfgiz30COpxkzE/YMry6lVswa+4R4O7SCp4wGY3K/
         HRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987332; x=1793592132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7IsVQT+EBQo1oTvITpYf6+rXx0JZnsNppK5scdXnmz8=;
        b=1XyWkUdbCiGDcdNbz17B+psNrJCWclLJzYaKPTInCmJ5XTLoJFLXEDtAB0OC2zy8lz
         wrTd8JhWkd54gSuJT2O4sZ31OZgaFdlLPQJcs7gx77PjRwEEMANh++084UHguqQQgmK8
         K/wztx2D94w2YEDo6BzKjHXZrfaS3EdC9jTXqpKtrUhOlifVGjqJQ0Dhhn/fdLTnZfhf
         6u0uyrG6khBKsF1hDDdD/K+CMMqS3bOgAyvigJZsbr5SCQj+sqp043sZXQPWnXhhzd0e
         8AuZGIB9fU3Bzs+GWdWr57fEui+POTDBSc1SAKRnmFzGkxRQsVXvgBfXUqP5pgAt9T3d
         7BGQ==
X-Gm-Message-State: AFq9FYLWyq4FnHAcW5XXDKFfZQ/0GYzFI58ye5MxljvtukTdUo9TLj+E
	niOmBM1jEHY3sP3d3qNAuDgQwdpVtFX6+vM5CSTJ+7uZxl1ipEgQpi9l
X-Gm-Gg: AYBFou1vfX1fc9dIKsLl7lOmpUzcIG1+OloZZDsU5OxG/+zd5rcReQ7W5kxZNQ5TGY9
	Xi4bpXxVhWaiF4P/1wOz+iFq73J1iUylqwKRdgGU4NlOSPIJd9IkDAfa56JTu4YmaZRUL7KgUkz
	kix7nBEykb4bAjxVFKfU+EWjemZAhjr0S3hGvYQ72RhBPXCR2v/t5CeymhxDDWpDOY55/SWqJbw
	zPu4uW+DugIvuxh4/F8BR4p6vikUAAix/YbzrDLpuKIq8Vnt0/qS1Wb8d3o77YgtZlJm5sxYOrd
	q30BE+RLRSXDEqpcZbnKiyBbzvBFNpaO8BbGuH8RrE3BElSBcwIvRNhSTanpekZMIm3+lSgB3Qq
	AkaApmiHCx2Aa3PAS1Mk2ojkjTDgUIQpNNBYmkMom4XD9FJRQL9jFNSkkJBJ6RkS/tgDavUfM1T
	OprnFgMNYvzuOj0X2ShK84oz4JMovSllZ440wuewxyMHuBndOUxLaxGU2AUTkW8mqR5uCFNVw4E
	O3hGwvf6fEieVA4xK05tYV/m/0LQu2QLrBtxaoyPzEQa72lyyCG/uin4RBKQU7kNOoLM4dkR+JW
	hPvv2HJFfz0mJIueHHilfA==
X-Received: by 2002:a05:7301:5404:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-369e8471460mr8498716eec.19.1792987332331;
        Sun, 25 Oct 2026 21:02:12 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm6395094eec.14.2026.10.25.21.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:02:11 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: use HT CCFS2 when computing the AP's HE and lower bandwidth
Date: Sun, 25 Oct 2026 21:01:48 -0700
Message-ID: <20261026040148.2633920-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
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

If the driver advertises VHT extended NSS BW support, hostapd announces
a 160 MHz BSS the way IEEE 802.11-2020 allows for that case: the VHT
Operation element has channel width 1, CCFS0 is the 80 MHz segment and
CCFS1 is 0, and the 160 MHz centre is in the CCFS2 field of the HT
Operation element.

ieee80211_calc_ap_he_and_lower() only looks at the VHT CCFS1, so it
sets bss_bw.he_and_lower to 80 MHz and ieee80211_sta_usable_bw() then
limits every HE and VHT station to 80 MHz. Stations parse CCFS2 and use
160 MHz towards the AP, but the AP never transmits wider than 80 MHz.

Take CCFS2 from the HT Operation element when the VHT CCFS1 is 0, as
the station side already does in ieee80211_chandef_vht_oper().

Seen with ath11k on IPQ8074 (it advertises extended NSS BW when the
firmware reports an NSS ratio) with an HE160 BSS on channel 36: peers
were created as 11ax-he80 and no frames were sent at 160 MHz. With this
change the peers are 11ax-he160, nearly all downlink data goes out at
160 MHz and an MT7925 client's download went from 810 to 1645 Mb/s.

Fixes: c9b62ab79133 ("wifi: mac80211: fix per-station PHY capability bandwidth")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
 net/mac80211/cfg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index a1753335e..e6fd83cb7 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1366,6 +1366,13 @@ ieee80211_calc_ap_he_and_lower(struct cfg80211_beacon_data *params)
 			 */
 			ccfs0 = vht_oper->center_freq_seg0_idx;
 			ccfs1 = vht_oper->center_freq_seg1_idx;
+			/*
+			 * With extended NSS BW support the second segment
+			 * can be in the HT Operation CCFS2 field instead.
+			 */
+			if (!ccfs1 && params->ht_oper)
+				ccfs1 = le16_get_bits(params->ht_oper->operation_mode,
+						      IEEE80211_HT_OP_MODE_CCFS2_MASK);
 			if (!ccfs0)
 				return IEEE80211_STA_RX_BW_80;
 			if (ccfs1 && abs(ccfs1 - ccfs0) == 8)
-- 
2.47.3

