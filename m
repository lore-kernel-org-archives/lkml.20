Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434495;
	b=mtj42BqH/SAtAZHxbKI1MfvSW/xHUvr6IwN6L49bgTH7SkZsvKrVRGqw8jqtLB+Wvh78
	 x9LVplesEXEUgipztaRKDFJdPs69Cc5kzHGlpR2dEpxWW9W/lQ2ON1nXSz6gE+bUW72J7
	 7esyJGmg+1Az0QV4zfnvMe/E1TpX5D2jOX5kXDuAnMuJiSY0YLgdEuBoj1N9PTbdkntmR
	 QWWApA7M3Re7M2iBKkHuLKbhcuYCDN9x8+QOjvt3MbMzwWKgKoCGnNP5QzVl30AdvY0m6
	 mop/WLCBUQg+sU/dROeCUGHeR7y/cx8fspCN5WNzatgq+THoofQYr2+gP5+jDol89hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PN800ywekWk9XeZU1A46yK2GvDU4OTLmLYi6Rpi1abk=;
	b=xTOSa3fwTBFg4bSxZB4rnrop9Y8j5vMKTKXecbuvmBmJABXSe3NqnGXhaFhX+4KA1uWF
	 5sfeq1CUcvPQ1hEgIHf7qbRLegGsYQpvvfK2cGkFwwQbxTYSSvENfWCFo44ZkCWGVrSCK
	 3Jh3JYxfRwHkhXOlb5nNaxUuHlBR9tMpc8qVZRyCAfDxnFyTSn7iFcuUjI40K/8tc/iK+
	 oe7rIc5X6+6o7ANVeRPkUa1CotS4j0MuvXxa/E3Tx0v+sfb/K9Q1xnzGGLHSd9v2+lS9m
	 wU2AFH9ZkBfYOZ5dlTh5rwRaBj87WC9wi6pYfqpbRl9ZibWqU3PB8TQ+sL9z6i+aNeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl+Mh9+m;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AAE60A380C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25AAE60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl+Mh9+m
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5edf97136aaso1957808e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434494; x=1795039294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PN800ywekWk9XeZU1A46yK2GvDU4OTLmLYi6Rpi1abk=;
        b=Rl+Mh9+mXU3EKkMv5CtlZZ8HRUvdg1jNFjsPEN0uJUJ+jMwCKivCIqN8sNEvuPhQRV
         QcbaJJCIk/ePxDM0LP01+iJrIoIFGQ/0VpI0ARDxHbkeIsibUyivY/4BmLjBymUIPLl8
         kT+euTSiEcyRLWMZ2uatL8/flVYaFUueTc36wi2nJXrRgss6tv5IhPSz5vQX5ZrYUfi/
         8kcXssqoySRzmGdjC5bp0nXKO8x2RDSy6CtqGM2/4ycP2NY5NkYa+5gjx6KrwVu2oyoM
         gWCet2LY9fdGUUNhSZdEo0saHVBLMzRDi3zV/1Y1w0d3DJHHhSBvXMlPp6X5CoAsGHxs
         f9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434494; x=1795039294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PN800ywekWk9XeZU1A46yK2GvDU4OTLmLYi6Rpi1abk=;
        b=fGy2e5E6daCkuYC/XVVS6mCdGaRDs1H7w813jjSFJQd976thbp7sjqw0QiBGHPP6UD
         kAsHZqizqZvW0bSpSGW2CEb00lYODIZsJsnW8O6Rrs0CIVe5YxgxWmoEwjK25szgRvet
         HlcxGM6322vSnpWiC4Eop7B0Hxoc1FaN7rkCpfUbLM0ObATkX2tv9z8DczmPp5KKpJOD
         1agXJ837uwILBRf6Oh7+Xg9FgEpTOk/zsb3hEjOWiz1qqDeztKMtmAS3BgVnQFGCPwWt
         CGUQjJxCWic/wheBMXnpm3axS/7C95eoc9Sm+Vh2YpnYTAoDAJcVLnT+d/fh9KiMTofa
         rZRQ==
X-Forwarded-Encrypted: i=1; AL+hErGl67cLmniwMqFdQsCcCKoGQQ01Y/wiDl49qhTws4Na86ilgkn32ArFEAvFcH6NVpyhqPEDmwPNXvm2YlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NJKMeXKQFyLaO13dG4ZJJaJ1JXLIU2mHtrTg1XccFbWuERjel
	aXzbmqw45xOn9PCCI8wFiFJzTzSWsr1Fh/z9ZGTKi9y50OmMURiZhnM=
X-Gm-Gg: AYBFou0N8S94+WXc2OoUwxYDy1jJNCl75eW7i5aq7hXlPURxgL/fsLpLqCZr3QUYO/L
	QcgwpKU75qLXX+kMIH5me2etJrEanOD76S6CGWUBcqXEEZxaHKvdtY1sxl/EZ0hVKHqFEk5xwaM
	Sp0lSQdpT+AUvoVDVEc/YGsocR78tGRywhnc4Xj5Y69TuPcjWvIecDmViMyQ7G+r0QTZuvq0P4i
	WqB1742zzieU5YQ1w8bzA8m1ZUvRIJcDuqHNI/curx+7/lOj6ulr7jbrzTollhtBFsOC0jl9FtE
	FzCcGdoVUu4xfmIjt8/Y3ILVzTgoKXMQyYZ+JqOcGuiL+v61698JGCVIQCvwg1VE0GsqfxF9VN5
	6mEmyTyr2AnaerTKmD33BRAeuJgnZfvbwx/XCXA03ElFznb5UvoA9FMCgdcWesk5s7wcGMMRPCD
	hUtVnBBzj/0PWegKhDp+6w4wpJzT4AHPGBDuMag9d8QyE9g9O1CYp7En767wWQagj0lTaXbHjLK
	V6zye+KnFrvDoZi/6owD1axzkiqWw9AN4zZakBG9IGxcNT2Vq33HEIB7ilVgFfrfFraXJLO74Sv
	S+DC+mz0aKnoMPIqW/A1fo60I4KX
X-Received: by 2002:a05:6122:d25:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ee1c3e566dmr1829463e0c.4.1794434494109;
        Wed, 11 Nov 2026 14:01:34 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm4557992241.4.2026.11.11.14.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:33 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 3/5] r8169: make the RSS hash types and descriptor type per chip
Date: Wed, 11 Nov 2026 17:01:12 -0500
Message-ID: <20261111220114.3863505-4-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111220114.3863505-1-montrealtango@gmail.com>
References: <20261111220114.3863505-1-montrealtango@gmail.com>
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

The RSS hash types and the RX descriptor type used with RSS are those of
the RTL8127A. Make both per chip, set in rtl_setup_rx_params().

No functional change.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 29 +++++++++++++----------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index a77bbedc8c02..cc253728109c 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -858,6 +858,7 @@ struct rtl8169_rss_data {
 	u8 rss_key[RTL_RSS_KEY_SIZE];
 	u8 rss_indir_tbl[RTL_MAX_INDIRECTION_TABLE_ENTRIES];
 	unsigned int hw_supp_indir_tbl_entries;
+	u32 hash_types;		/* RSS_CTRL_*_SUPP bits to hash on */
 };
 
 struct rtl8169_private {
@@ -884,6 +885,7 @@ struct rtl8169_private {
 	unsigned int irq_nvecs;
 	const struct rtl_vec_map *vec_map;	/* NULL: single vector only */
 	enum rx_desc_type init_rx_desc_type;
+	enum rx_desc_type rss_desc_type;	/* layout used with RSS on */
 	struct clk *clk;
 	int speed;
 
@@ -2906,6 +2908,15 @@ static void rtl_setup_rx_params(struct rtl8169_private *tp)
 	case RTL_GIGA_MAC_VER_80:
 		tp->hw_supp_num_rx_queues = R8169_MAX_RX_QUEUES;
 		tp->rss_data->hw_supp_indir_tbl_entries = RTL_MAX_INDIRECTION_TABLE_ENTRIES;
+		tp->rss_data->hash_types = RSS_CTRL_TCP_IPV4_SUPP |
+					   RSS_CTRL_IPV4_SUPP |
+					   RSS_CTRL_IPV6_SUPP |
+					   RSS_CTRL_IPV6_EXT_SUPP |
+					   RSS_CTRL_TCP_IPV6_SUPP |
+					   RSS_CTRL_TCP_IPV6_EXT_SUPP |
+					   RSS_CTRL_UDP_IPV4_SUPP |
+					   RSS_CTRL_UDP_IPV6_SUPP;
+		tp->rss_desc_type = RX_DESC_TYPE_RSS;
 		break;
 	default:
 		tp->hw_supp_num_rx_queues = R8169_DEFAULT_RX_QUEUES;
@@ -3066,14 +3077,7 @@ static void rtl8169_set_rss_hash_opt(struct rtl8169_private *tp)
 	rss_ctrl = FIELD_PREP(RSS_CPU_NUM_MASK, ilog2(tp->num_rx_rings));
 
 	/* Perform hash on these packet types */
-	rss_ctrl |= RSS_CTRL_TCP_IPV4_SUPP |
-		    RSS_CTRL_IPV4_SUPP |
-		    RSS_CTRL_IPV6_SUPP |
-		    RSS_CTRL_IPV6_EXT_SUPP |
-		    RSS_CTRL_TCP_IPV6_SUPP |
-		    RSS_CTRL_TCP_IPV6_EXT_SUPP |
-		    RSS_CTRL_UDP_IPV4_SUPP |
-		    RSS_CTRL_UDP_IPV6_SUPP;
+	rss_ctrl |= tp->rss_data->hash_types;
 
 	rss_ctrl |= FIELD_PREP(RSS_HASH_MASK,
 			       ilog2(tp->rss_data->hw_supp_indir_tbl_entries));
@@ -4272,11 +4276,12 @@ static void rtl_hw_start_8125_common(struct rtl8169_private *tp)
 	    tp->mac_version == RTL_GIGA_MAC_VER_80)
 		RTL_W8(tp, 0xD8, RTL_R8(tp, 0xD8) & ~0x02);
 
-	/* enable rx descriptor type v4 and set queue num for rss */
+	/* set queue num for rss and enable its rx descriptor type */
 	if (tp->num_rx_rings > 1) {
 		rtl8125_set_rx_q_num(tp);
-		RTL_W8(tp, RTL_DESC_TYPE_CTRL,
-		       RTL_R8(tp, RTL_DESC_TYPE_CTRL) | RTL_DESC_TYPE_RSS);
+		if (tp->init_rx_desc_type == RX_DESC_TYPE_RSS)
+			RTL_W8(tp, RTL_DESC_TYPE_CTRL,
+			       RTL_R8(tp, RTL_DESC_TYPE_CTRL) | RTL_DESC_TYPE_RSS);
 	}
 
 	if (tp->mac_version == RTL_GIGA_MAC_VER_80)
@@ -6142,7 +6147,7 @@ static void rtl8169_set_rx_ring_num(struct rtl8169_private *tp)
 		tp->num_rx_rings = rounddown_pow_of_two(min(rss_queue_num,
 							    tp->hw_supp_num_rx_queues));
 		if (tp->num_rx_rings >= 2)
-			tp->init_rx_desc_type = RX_DESC_TYPE_RSS;
+			tp->init_rx_desc_type = tp->rss_desc_type;
 	}
 }
 
-- 
2.53.0

