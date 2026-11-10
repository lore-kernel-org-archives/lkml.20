Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297727;
	b=CSsMCcgasymjF+lccUAsX1Mb9BX6NHj/KdFtrnTQbXyUXr/0Vn+Kr8uWGAnxUtVI1UZg
	 AsO85R90PFi20H2soCbxAz58Rgzng8XU0IEsRUsdsC7aK2rqz/MhQQ6hrWvo4VMd8Z7sN
	 lqTTiL5rqpU4mdJZsLtQyQ0PyIIvVgMDy32QT2Mu7DzGoABA8cOrng1HBGfmFkWlbG5vN
	 OyZTcGRRVZdo1xQFN13nunaZQLD8K4NWU93+AxdhsbxEiBgVnek8pO/ryfiyPmPD/tCqC
	 t/mRGequWPbV4YobtWIKYV4cPZyPhiYk0lK3WkkiI3Nf8co27M7ThKdoU+YrNlEvpZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQs+HNSQFFVFy2bmuw37lif8a3ns+w4oxEupotElbYQ=;
	b=uy+6AwiY3Lx56qTzYFr+zt9j9e8prARXdAebjPJdfxQfuPxV5a+ntMWNpmCe/CX3WeSq
	 9X+o2qTBztM7yNvamdg1HONKcrJpFNVxCAUPBLM8Pq3Mm0hmX09s+WSDvHEmwtPjol248
	 HFf+tJ0bcK9FPpXtYkYsodsWcSkg/Fd7Wa8YN9I1BGT7CyZkO2FqU5Bgu90QN8iM4/dQh
	 9QRH/eruIi7AXs9HkSjmJBaf80ZfJK0lv17raqKx2b9pDr08ySVmn+JGf26VqmoFxCdWf
	 Ck28vszNlPPLlbRD0r2IAwDHISUZspOsnpjqu94vaA/KkZNKRoslpsfIZNINKAxOZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAJ5NYtY;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AD46077D7B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49AD46077D7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAJ5NYtY
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1139969a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297727; x=1794902527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQs+HNSQFFVFy2bmuw37lif8a3ns+w4oxEupotElbYQ=;
        b=wAJ5NYtYv34P7kk8zSV77PXr0jZ+VkCCQjnj6+OgVYDzR4Amzp/PzJ7K8agRGir9rR
         ZQxC669wIApFZek5Cv0Nt/4JWxbuhG/ouE+pv6ytXwatg4yBnKH5YCLXxsEklPAYWHg9
         f37+FetNKxDiCSKff0U9L3uAJvkV4tDRqDE9nMQFTLFh7Y89XeSEDQKnFx5/HwpLrk4i
         pGb3T19OG6iQzPv0EBqRvUPBdSftfkPfiKEHOZTXfU992xjuWODLYMQdMcYXas7CeaJ9
         VxvHIUxTN16hcv900VtorhcXhY+zKp1tBHKs3JK764UTB3uneZ7OPdeYL0vAr1YDSkZ3
         aCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297727; x=1794902527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQs+HNSQFFVFy2bmuw37lif8a3ns+w4oxEupotElbYQ=;
        b=vpJvsXzLdI/qTwNflJnbrLjqL73mkh9V5E0nfb4Umq5u7DFrjarAzXchDllw+Czh47
         z9sWlglFrJa1eWwBJMUAoPJqLqwu6CFs+nERwEowZ5oKc2LBmcNZXqaw9sVM1hDbrSov
         cT0DZ37r0OcPlhP+srgXFYJ6BcG/mVwCfFGcHdgVCtTYGESYZvX8Aygj3lP/kngcMhoZ
         2ObLeVA/4qSQnFkvinTMTVIs1wGHf1Lc/PwzpNF2ERN7Z+6naLMCrS1aD3YeFIHwt1xw
         7XLvOSUUBMuv+mVYIFuojs05zm6kXLtfVUjcavWsDzPEHZkuGdmY7kfUAuVhXhs0cbDz
         v7sg==
X-Forwarded-Encrypted: i=1; AL+hErFlNj6z9wyakY/91dJC/Q0H8hsBrYVrQwOo3iFVzUBeX/yMZIkK7kWTjFsfivJ+2+PMZuHNKRAoIYuCJbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uTfPrT6rgE5KRG0j875fWvUHytnSdQpFYzHkv8dRJtHqzmBeS
	juJBZ703CnfUjZHcHo+XPOqdRT57FNnR8V3jc15p/Xke0Znd0DmlnH9A
X-Gm-Gg: AYBFou34q655gnazMlTnTDUIemqZIcIqfJr2tk2oqdBtdhrUH+18nB2QEAdMvbkezIP
	f5MTK0E9WkNeLptBrobqmCi/bRUqo0YNqafoaNwkT/aoKXyV47TpyCzHmW4m33UG/IkU2RiawPi
	RxImry27gDW1hYCv5tyaeY1KcRMKms0U6EeRW+rb6Ea+eIrM1gMaI8AYJqqMwCwQZvuIfrodgA8
	u39j+9dbL/SyHrKupB/8M9ldiDHNh+0MwHPltZfmD3OiqZMH3mBaTmZNMKK+DGlkr2gF0IK6zF0
	p08rXnD3wtN1N4998kndIWqHAw6LBIwfdcNSA81CO5Vyt/hTIbLtUq9ByLz/8Bm2RuOtkXQaonM
	RxJ37W6O7R4rO3vHfMfNXGLMSa2TIf6LkIxwaWvID6FGE6KOGpP3qEb65mLdnYch9qPjSe0hFCs
	e7WrF/obpuPwJEcxCN1ZnES9x/r93uktAjIwE1cSqf0BxyB/xTOVyAO+ihgF/ubPDGrl7QcXpLu
	G8imVoWzYDotjHSWwYqurNLFdM1AnwZ8m8CZrQIPIEvmwrFr/7New4lIBiwR3DNMWXDAyzwh2qS
	XmyHZ9e70jHWgwigXpWcku6Oi00kyfcCnOUe+f2rlrUiSCmGyDwNgRTgdfLSxwI0CzEebAh+vy3
	lrLRCatiHKfj5UIhW8yeWKpjeh7Gfvg==
X-Received: by 2002:a17:90b:55c6:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b166ae70f5mr2060519a91.8.1794297726471;
        Tue, 10 Nov 2026 00:02:06 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:06 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 4/5] wifi: rtlwifi: usb: move the radiotap headroom size to usb.h
Date: Tue, 10 Nov 2026 16:01:40 +0800
Message-ID: <20261110080143.1362021-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110080143.1362021-1-hjf3108@gmail.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
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

Let drivers use the same define to add headroom for the frames
split out of aggregated transfers.

Move __RADIO_TAP_SIZE_RSV to usb.h as RTL_RADIO_TAP_SIZE_RSV
so chip specific code can use it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 8 ++------
 drivers/net/wireless/realtek/rtlwifi/usb.h | 1 +
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d7b3192262..5aca1a49ca 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -488,8 +488,6 @@ static unsigned int _rtl_rx_get_padding(struct ieee80211_hdr *hdr,
 #endif
 }
 
-#define __RADIO_TAP_SIZE_RSV	32
-
 static void _rtl_rx_completed(struct urb *_urb)
 {
 	struct rtl_usb *rtlusb = (struct rtl_usb *)_urb->context;
@@ -521,7 +519,7 @@ static void _rtl_rx_completed(struct urb *_urb)
 		hdr = (void *)(_urb->transfer_buffer + RTL_RX_DESC_SIZE);
 		padding = _rtl_rx_get_padding(hdr, size - RTL_RX_DESC_SIZE);
 
-		skb = dev_alloc_skb(size + __RADIO_TAP_SIZE_RSV + padding);
+		skb = dev_alloc_skb(size + RTL_RADIO_TAP_SIZE_RSV + padding);
 		if (!skb) {
 			pr_err("Can't allocate skb for bulk IN!\n");
 			goto resubmit;
@@ -533,7 +531,7 @@ static void _rtl_rx_completed(struct urb *_urb)
 		skb_reserve(skb, padding);
 
 		/* reserve some space for mac80211's radiotap */
-		skb_reserve(skb, __RADIO_TAP_SIZE_RSV);
+		skb_reserve(skb, RTL_RADIO_TAP_SIZE_RSV);
 
 		skb_put_data(skb, _urb->transfer_buffer, size);
 
@@ -570,8 +568,6 @@ static void _rtl_rx_completed(struct urb *_urb)
 	usb_anchor_urb(_urb, &rtlusb->rx_cleanup_urbs);
 }
 
-#undef __RADIO_TAP_SIZE_RSV
-
 static void _rtl_usb_cleanup_rx(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.h b/drivers/net/wireless/realtek/rtlwifi/usb.h
index b873bbc9c4..329b734ca1 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.h
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.h
@@ -7,6 +7,7 @@
 #include <linux/skbuff.h>
 
 #define RTL_RX_DESC_SIZE		24
+#define RTL_RADIO_TAP_SIZE_RSV	32
 
 #define RTL_USB_DEVICE(vend, prod, cfg) \
 	.match_flags = USB_DEVICE_ID_MATCH_DEVICE, \
-- 
2.53.0

