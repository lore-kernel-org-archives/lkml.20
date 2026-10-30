Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397594;
	b=L5tQ+GmpbJnXaZlvQ/iJa0rNo8UuvxyIjMi2gvx8yX4Iq866eps8xq377cLvKlltPa/U
	 axNTlPB+eJPXmG6fYFvCPJmMPjrIJ/0lcxTi1sOe95OCHxZP7Wa/RHVQqj8sKyACjWMse
	 XkXAdsvsiIkZxRzI7nyY94LQI91sLlSqXgyeEKssqfTPEajz99ywB79VvyxnPwX0mdneH
	 nidgNYfLSDA6n3z6zeZW8VAg8169FbO9GG/9gvO8oXXWRq58nlHNbaLj88JQNNIDLmQuD
	 3cSzG0JDfUmH339CujA7g3kpcQ20wCJdR82Cd/a5fnf2uFHCcsRDCo9rOBWWOKB4JCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QltZYn6auahTUDtzxOtywDg1k8+vm4MZICPJZD5dPW4=;
	b=BAmhShb6AU/3VJQoByhwphC2krFH/ayVy/PhCY6UgauK5fwaYfivVCPH67b9mLdmi4sY
	 lx9fwifKheIB/1PAR1ohjppUqGQ9qbJ0ADYWdvUSy+jDfA9AET9K6C7NOHOcUaXp7aOaF
	 d6/sh6p+mWI/SGs7fKd1nGk9AMkvGymFfvDrxsEZ2zMSzdRxmgIY1yHEh2/bPH0KToHDa
	 UtipVc+CXIw8lx3fMacS+/XC5KyQd8HhLTFnX5OvjZUkDKu2ya4Ez3vDiJLR4psSym2Gm
	 zIv/pULwTWnAPNEi7CBAAUvhwTPJ0N1Di6b05TZmzBjryUKy+a8xMfpsxQL4Q+gg+6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hizwtS13;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22180606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22180606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hizwtS13
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so12567435e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397592; x=1794002392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QltZYn6auahTUDtzxOtywDg1k8+vm4MZICPJZD5dPW4=;
        b=hizwtS136f4+TNn3viT1XFdGGrZdkOybQnQ4sX2m64ESiaQhjw+8x91QauVq+8veu+
         iOl2Km/NutN9rYMEYxl7CDwHk/U7G04++d4UIzZ7O3av0/HfNCqhsQDHKlQPXt3PLVRL
         rr0BkCPRUVxzMAnCNuxHU5uEbRaUfycAiIZRXHEyHj9JUaqqjPcGMHAR7uqzC5cL0hHl
         Qi8oQHNxTEl23acaSZHWw+ZGxYbYeN5BfaGYaM89Hzwi8zUU1KvxrtEBJjj+Fyjq5Mdr
         F7dHp0lKMlPu2BpGYC+AhcEUgMb11LucOxO3DgDYW3VuYL/0kPxzegbcm3xDfjZgXLaC
         DB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397592; x=1794002392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QltZYn6auahTUDtzxOtywDg1k8+vm4MZICPJZD5dPW4=;
        b=bQqo200SyI99sf1QwCcX1FlgJezyPp7RCIx/TxlRc2qipcxyeaxM6h1lrpJp9Qz3LO
         /n2fRz4F19qaJ0Gbfr27caNR+Bu+uTiY+JKmn4dy4V8Mqqn4yU08szCRGjlnzOLxw3tV
         OaixjYTFZocgr5pKyheuMkzkw7Y3no44krrHPTGwfAQB0e771htPNP3qKJhgC7FJjJ4s
         Q1p35oHH1kPlEuFSm+434arpZKrBs6+4Jnri/YEw8UjQy8QfaSOJDCNmWvVeAPCHNLNk
         KMcRX2nZyxp76hFSFU+ezJdNZj+QkeDq1RnQ3OfHwuo+3hlCbWm9NEbnNHJH+lq8rBF9
         WHTA==
X-Gm-Message-State: AFq9FYLYwSdqirFx8VJX/+qHk8+a45emjMXVVL7QuytiinEqcRwuG1jv
	Lv4NweMj9oIvPJ8+dgSzbC2+nydJd1n+IUdkvq4bPTWFjuB9jKnQUh1p
X-Gm-Gg: AYBFou1Hu84E3N0h8d1IWqNQBHy4QYjJ7wLT0yOx/e0uGNglJL9C9QR2jN2z9xjFZGD
	te8e03xm+HtxunIrIrKF6QmjzX00rbFp7vBjIeaxJTLwsQGDg5ahPQ+72b7rw39xiqERLvjqPRY
	dM6Xp5FYyx9hr97ytmiaOIxGmWej4gYXS756qP4r1a7JDZDZqFAWUk2kJzw+tqQaX0SlKac4kMO
	E9NAQrmjEy++qCISJ8RfSIUrE8Mr7oHwyAz7NPHmSlFOcZp1XNtHlfOoVtesoqhmhwUdm+Od4K8
	tZSpmpiIEj6iqFzyxZ95p58INaLjNlMD0liyXrXOUYE99eBnnXcQGUGvp02fykZB4njOS/7plUW
	IIl+sfyEgLDqGuLl4DOvTvdAyZOXLMr3GqL9ua78CP/I7J8CP4Ukx+G+i6zhKwVdhxf4XgvDtDU
	v4OQv4u/Q1DX2p1EY4F9hxoUPBrCu2EGOCOJZDpc5aL20FXGKBC3xR7wahV+XRMoS+rQJkm9gZu
	4/H07NFwUIfMzIBSMsoPGdEoFaQwlgxrI7QGHCuvlmJBcfOgCLKEq80WB0zFrSdRQfKe3SFjxSL
	JRtWXLOatBSPJT7ufZcsw1dlAlhPtjqGKJtIX1corEJy
X-Received: by 2002:a05:600c:a012:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ac17b2cdffmr76571995e9.8.1793397592474;
        Fri, 30 Oct 2026 14:59:52 -0700 (PDT)
Received: from linux-virtualbox ([176.123.27.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm87207155e9.14.2026.10.30.14.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:59:52 -0700 (PDT)
From: Salah Ahmed <haddad2inc@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] wifi: mac80211: count the tpt LED trigger from delivered data only
Date: Sat, 31 Oct 2026 00:59:36 +0300
Message-ID: <20261030215937.18103-2-haddad2inc@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030215937.18103-1-haddad2inc@gmail.com>
References: <20261030215937.18103-1-haddad2inc@gmail.com>
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

The phy tpt trigger adds every received frame with the data-present bit
set to its RX byte count in ieee80211_rx_list(), before the frame is
matched to a BSS or delivered to an interface. On a busy band an access
point with zero associated clients still hears data frames from
neighbouring networks, so the throughput LED blinks continuously and
gives no indication of actual transfer. Management frames such as
beacons are already excluded by the data-present check, and the TX side
only counts data submitted through the interface transmit paths, so
overheard data is the only remaining source of idle blinking.

Move the RX count to the two places where a frame is actually handed to
an interface, right next to the dev_sw_netstats_rx_add() calls in
ieee80211_deliver_skb() and ieee80211_rx_8023() (the latter also covers
the fast-RX and the 802.3-offload delivery paths). The trigger then
counts exactly the data delivered to the wiphy's interfaces, in every
mode - AP, client or mesh - which matches what the per-interface
counters report and what users read from a throughput LED.

This scopes the RX side only. The TX side is untouched, and an access
point still transmits the broadcast and multicast it bridges with zero
associated stations - measured at roughly 2 KiB/s on a quiet LAN - which
keeps the counter moving and the blink table stepping, so an idle radio is
not solid yet. Treating a rate below an idle floor as no traffic is a
separate change.

Monitor copies are deliberately not counted: they are clones of frames
whose original delivery is already counted once at its own interface,
and counting them would double the reported rate whenever a monitor
interface is up.

The deleted block was the only user of the local hdr pointer in
ieee80211_rx_list(), so drop its declaration too - mac80211 is built
with -Werror=unused-variable and the file would not compile otherwise.

Signed-off-by: Salah Ahmed <haddad2inc@gmail.com>
---
 net/mac80211/rx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 905fd7049..559cc2101 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -2756,6 +2756,7 @@ ieee80211_deliver_skb(struct ieee80211_rx_data *rx)
 	xmit_skb = NULL;
 
 	dev_sw_netstats_rx_add(dev, skb->len);
+	ieee80211_tpt_led_trig_rx(rx->local, skb->len);
 
 	if (rx->sta) {
 		/* The seqno index has the same property as needed
@@ -4970,6 +4971,7 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	skb->dev = fast_rx->dev;
 
 	dev_sw_netstats_rx_add(fast_rx->dev, skb->len);
+	ieee80211_tpt_led_trig_rx(rx->local, skb->len);
 
 	/* The seqno index has the same property as needed
 	 * for the rx_msdu field, i.e. it is IEEE80211_NUM_TIDS
@@ -5583,7 +5585,6 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 	struct ieee80211_rate *rate = NULL;
 	struct ieee80211_supported_band *sband;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 
 	WARN_ON_ONCE(softirq_count() == 0);
 
@@ -5727,10 +5728,6 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 	if (!(status->flag & RX_FLAG_8023))
 		skb = ieee80211_rx_monitor(local, skb, rate);
 	if (skb) {
-		if ((status->flag & RX_FLAG_8023) ||
-			ieee80211_is_data_present(hdr->frame_control))
-			ieee80211_tpt_led_trig_rx(local, skb->len);
-
 		if (status->flag & RX_FLAG_8023)
 			__ieee80211_rx_handle_8023(hw, link_pubsta, skb, list);
 		else
-- 
2.53.0

