Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358674;
	b=F2PexzYcBCZNZZfmWa1azyY/dcs2xYIQH+RxHFz9wQwVrXIrbs/xZLALXe9zdiaqTmrl
	 RMFhsKOIVScjpv9UJXfq4A0EzaIwyoeqrJPL4Nsfdaesx9oA7PnmlWTTmOJQwqscRIVsg
	 ywa7qOpJ/6icpjr8D4OP/s13QKwmnpla/DE6b6pwBSbR7InUZ8sc/gMShXKEjAPRrpf14
	 ZVhVvAFMuiGC48GNsbk0CqN85CLte7F/jNsErRioemQ8kioMD2ueh2v7XTgABq+qRj/sm
	 pOJlWjIQ7d/B5Sdn7XjF4vvjlnoOnlknazP572mzyqww99MUGbHOGWZPy38RflpgJTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=KmOrBm1qC65xwrgbyzMtaj27QcC/iPJg0n2kc5knBkY=;
	b=apV7tzghDKi5GaRVI9o/xwFWWcclNimOa1k4t9FVTJRevi8hdWEwNNpzatoDiMbTaBUt
	 ZvEI88F5AblZ/Nw0JlVF5iGE4WWcZm17iSobC2UlFZOmc6WAWVX/HBAhERBiTrVqerES8
	 YGJqguq9dFh4LdXuuNHLcw3JfL3GCqBuxU2gnLMEbziz04O3XAYTXmADSDSdWpBrvwW9C
	 1trUgce3CvdUTvfCJp2gOgqhwYGE9EPZprutfRSwQqsEkRHJo0rHUYMvZbs2HSVj/w4YL
	 wG4LecRBqWNXTwEKo64N6jx2KfOIAu25L3WsMdobAfqiy7RNX3mv3nEw2JbZ8hnGuKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWuZnZ9o;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B726606A338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B726606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWuZnZ9o
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso390255137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358673; x=1793963473; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmOrBm1qC65xwrgbyzMtaj27QcC/iPJg0n2kc5knBkY=;
        b=zWuZnZ9oXZ5HmCIQULU2ysuHIxEAao+4ssIn5SxifJ4hATR4wMsIroOAme4Ha/exnz
         u88h30A443XorD04h9OibQs3AsxA6ZdamxupOrVxZmd3EGYNVgVGNaxpoWqBmHABT2xI
         WLGkfFKwu8xMSJKQ5KztKDRtkUQp36XNPrft9PZilrNktRx87afAV8xhQ+ZGCGTXO/rd
         V9cqMdNvHJX173W7Ibnw1ymxuMOGbV3fE6maXXbnkKvuHGwIuL2fWCxaIkda43uOG2yM
         nBQcbsHBTUj7XPCLwskOI4Y+i6RuXou02KmEArxLxiz+vwAGjSpiqLrIFGCjnlw7jO/3
         V20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358673; x=1793963473;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmOrBm1qC65xwrgbyzMtaj27QcC/iPJg0n2kc5knBkY=;
        b=DZFki32UciX3xk9twXyWYg33Ivy33+eL88HslBu4mPzlCwEDaQWh1jd8MLBX4TV9eZ
         1FmIyyi1hBR378yzZQyvM/vm9A9X7Er66S2mFFfBMQ6mRiKsJyJq4qc3FRDqlHOv+0gZ
         jwybPHQdN70zunIleoPZ89pGiR8nj2Rj9rTXL4V1OmLzY/rdESP/+lzdqg6HnqcKuEf1
         Mhv2kiRnWAqwFmRGO3KMH3qM0aDmhJeaQ0BJp5FY7PrS/UUsk77C5lCZNpG4uHLWa/w/
         XcqEk127+OW3lZWKEA20ixliVszGKK1pngZi348c/6PDDK9P6smt6VZOwXDxipLtP5B7
         KV8A==
X-Forwarded-Encrypted: i=1; AKwUvBxhD4orBvXWxqU2xMyvHz0LEAsFUslSYrBa0g70n6g8nRfobksxVSM3uZJlKJVZgERKv2VFdN5Ete6fHpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP9EuJsEFqJa/6fcsmyhEDljecCc7we9UlEEm5DNJTMMwnssr6
	kMNV2ydaj6eZpJfTZRby8QXq9Nja8zqp3SAKKDTUClyhtAeJQgvuBdhF
X-Gm-Gg: AYBFou0rog3GFJejPKrfH6VpUplarzyCAgVvJ5mpDiWWSqR+bqDicIkOF2mBeRnPCzp
	KGIb+QUXgkqzznE/VjOtb2Lcd9vMNR2tLSrseaogu/Pu5x/CG16bGzXW/iUuKXndfVCG1mB8xuB
	HfsC/RHlJEczq7o+XLPGLVbSLLI4e5bUkmtKf9517dUo44ZKR8z6wbnDANSH9Jh0FDKYc2lHD0P
	sWEQJs64W+g7pHkCvV+wNtDIJ4txl1yZD4iHYmcV/Dy8IIS9IgXz0ZCGrSK44DqGlZDy2pOf003
	Zmoe/15FTsA2fX6tGMJQDeyhj/wCCFJdZhdyYn2H/DTPHALxcR9IgP5GYxJR83y1BDfGm/pZgnF
	5AM2USlhW1oceIfmaDS6e3MUb6hDXtvmUg2p00QtXOtjSSnXlJl3GjR/ksIyhqnh6Fyr+x5rMuI
	GvFdPgbP4WOQej1LNQFzMKF8vq6LxD6Rr3JobQR5OKIPSj3GpXk2FiEnzsDTUKttAB23On9Nh+w
	NBCLbZqJ/ZpfZQI9e7FSFRZu2c1X4sNehB2yH13QSDlNFQFbkMxUow53WK+2D5akUHf+mf4Wj6v
	qJqO1u0OH99j7/AF+xFGV8WtJCyf2SvNqrLDIgObWrLCGc+KyRx+ziClqmviNJ/yByggBIDNcSW
	W3FAWNrChanN0OsQ1Zj4=
X-Received: by 2002:a05:6102:3588:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7d071f2ec61mr1143935137.0.1793358672919;
        Fri, 30 Oct 2026 04:11:12 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:11:12 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net 3/3] nfc: llcp: free the response skb when the data exchange fails
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864272.64596.2156668877648051796@gmail.com>
In-Reply-To: <179335864271.64596.805818095553030218@gmail.com>
References: <179335864271.64596.805818095553030218@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

nfc_llcp_recv() is the data exchange callback for LLCP PDUs sent in
initiator mode, and it returns without freeing the skb when err is set.
Like for raw sockets, the skb can carry the response even when err is
set: the HCI core passes it on with the error derived from the
controller's result code, and NCI does the same for a frame interface
data packet with a non-zero status byte.  So each failed exchange leaks
an skb.

This was found by LLM-assisted code review.

Free the skb on the error path; it is NULL when the error does not come
with a response, and kfree_skb() handles that.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/llcp_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..f0632a0b9 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1638,6 +1638,8 @@ void nfc_llcp_recv(void *data, struct sk_buff *skb, int err)
 
 	if (err < 0) {
 		pr_err("LLCP PDU receive err %d\n", err);
+		/* skb may carry the response even when the exchange failed */
+		kfree_skb(skb);
 		return;
 	}
 
-- 
2.43.0

