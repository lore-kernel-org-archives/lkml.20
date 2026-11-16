Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846525;
	b=iHFhEIX6NSekLv6OekM6pUHbYWB5tSrfc+Y3t+SQPs2WfrD2waUw7kHZcAo7qByMqcv8
	 JM8Ogrw9gs2krW+pHo7+SWZJeMm/FUf71xXYuIbW3ZLpc7VbiiPpVeVeMf3NwbRxjI8SW
	 68Xj5ARCRu/P+E/OxI8jB6ODQ2GjhX3Zz0k3QTfT4vvuPlhvlhsKcareH+vSMC+OkUOss
	 BS4cQeyJu61RnkUELapp4xoEuHjGIt53F3xgIX0kk5Ww7MdArWmF4L06uMbnIl4Fc0lvW
	 i88BBU/zhOGdPSEzaxkyXfTFfHSJ3fk1djwejyK6vyI5YdKWdxkdl6xdz7JgEILaSew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m2qUVYEU4erka3R+8Mzo5flrWhCob2ySKiSLvFVhZag=;
	b=zEtHk5WWqkAUOfvpH4SBkP5talc8SYR8RJ7Eh6Vw2PZwg5ZO6WvCdE1BV83xuz2IlBGu
	 l0sQPuZIlWlI25TMvY2NcSmiEl5qO15TFJa/3J5cklohww9UT4tZ/JuDnuPhuc9+ilPqI
	 VmP/poObazEGSmVeMuOP9B9YcSFBRa+aOOOQI/EMsw6xVbcYFT9I9gEuHGW17O1UMsqUf
	 oCWzhF2ZLGG65D+DoQkJDgpD4dcRJgj54OpO02YOgunH5954IUocK62ZKuzx2tqxdJibJ
	 T91YN34CC7TAXXxKQJUs/Gz/q6sIT1gPw2QjsmMA4Q52cyFdk7+n+kkF7BBmSIVQajQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Tk8oxXj9;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA3D606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA3D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Tk8oxXj9
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4682977f9aso533921766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794846523; x=1795451323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2qUVYEU4erka3R+8Mzo5flrWhCob2ySKiSLvFVhZag=;
        b=Tk8oxXj9BHFLTph+V0GNfvgoPR3BlwfYIK1obg18W2MCzFUc3JxDaqjWB7jk5oUstL
         dDl5+3g3s+RxPQtpL0pPw0DQqqzKoUDAs3rpjYeKIC0ABSlts4k59XTTVVFxGlzzFZwV
         6ZU0T3LluGqKZxAoDf+rmF2DSK3R8SoDSF6p/y17YV7s+OijCfTHeI/6iCZl+Wq2HhWz
         N3Z0j/qfkvZxE7F+q5UzsaLeQep8aG+9294pYvSqSUWAUU3/nOijUuNpGT00mvk7PsXq
         rel+YUirI8TD4rYPdNmgZDGkpSbxvfzzT4qdpVMyRRYhp/iy0rfNX8AsSCkIhuQfKHQ7
         LMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846523; x=1795451323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2qUVYEU4erka3R+8Mzo5flrWhCob2ySKiSLvFVhZag=;
        b=udDbddU9R/TsH7WWvLkZEytu3NEdhTDyDbtRttdai4CjXQYaGxavrCDMmGVk1SArWr
         KrTwXE7AkpRnp4lkDURef1dDyzfhyOabvnHPT/Eqh7Rc82Ormz10UvUhcYQ0JYH9y/sf
         lVD/liE1JNErdjtu8ZPWnL1Jt9inv3Gofl67U9ylSRWkracrhl+Ghc12UJtJPeRVk9Nh
         EvF2Robeqjcv/xX4e1jtwDYN113io7nsOo4ARponojnOdlnqitQILWxGqFPQWongJy2S
         9WduTFw8nZbXOOWBjBjNltf+RHUqtA5SDAwG3CVMRfpP8NXeprBMdLsBh4P2gF+C+Fm9
         T2DQ==
X-Forwarded-Encrypted: i=1; AL+hErFAgfCU+yMvh8l4Y4dOt8BT/wpryQitDsJbZTrFr5NXbHfi1e0uxVbsKg7GWh23UHrBkCmLg2coO8u/F2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oz/IDvdlUzdtq338qeIIvDJkd95NR4tlO47qv8UgfwTb0Wk8u
	3w9cHN07d0+DfSMTmzl1Vh4IlEZHFPahPp12x/P0v3ncXBwK48qM5bb0wtCdSQezFe0=
X-Gm-Gg: AYBFou344J/ZdjWYK+sSqKrXkm8yCYf25FJVSFefzO/ORJ/aE/TqW8l9jI5+UzwU8Qy
	PS50o6OQ/nPb8pWYkO3k0KQCECL3Ent4DMyV5eRp5OAqnbDHMeTs0Id4Q4ltox3/xLNyfP9MVd4
	EeFnN0ODEaWb/g+/DUtHIQjxBgkGln3ZOSJG6p1dyyul0rSj1J11RhVVUkBvL5AhKfiqPFSd0nB
	2tMDWa087mZAXcPlScoWgv3OEszrxb+69t2fG0tkelxrOr7uKgaNvDqKwljAnc/XeMSWl2dwJCs
	0dCWc5VAC8Q6tWYFEBIsuhN7Mt/1YTT4X+hRbW0ycr1xxamSPCWuJ2YDRHIY4TiOI0vw1YjRlX9
	g6pGJY7+1iP4hGqpg5QBv7GoobmsPiXrtXuljhPQh82INCCYU6zPv3FxXP6YzlQier+WDrktBkA
	eNKxP8g2EKj6gv1r4lE1xC7SQ9+P7nrbSCfaR1mYcwZpkRwUQNzVSKWWHLz7OTq7NGYZxIhbhWG
	XeMhSPNZvjRVWm/qjEOZ0BcVAvAHXRMcZwdNVjBMTXitIRAOnywv4bFLObWFckiOszCuKl713+2
	u+ftb2sBfhNuBwuSNSRyFm6oJfBlHXuq2Xk9x6XA90araA0c
X-Received: by 2002:a17:906:d542:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c509642ad87mr785783066b.35.1794846523503;
        Mon, 16 Nov 2026 08:28:43 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50b13a2ae7sm299639966b.62.2026.11.16.08.28.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 08:28:42 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	yoong.siang.song@intel.com,
	kerneljasonxing@gmail.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] xsk: reject TX checksum requests that overflow skb->csum_start
Date: Mon, 16 Nov 2026 16:28:34 +0000
Message-ID: <20261116162834.30087-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
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

xsk_skb_metadata() sets the u16 skb->csum_start to hr + csum_start. With
64K pages, csum_start can be close to U16_MAX, so the sum can overflow.
The checksum offset then becomes negative. With XDP_UMEM_TX_SW_CSUM,
skb_checksum_help() triggers a warning. Without it, the device gets a
CHECKSUM_PARTIAL skb with a negative offset.

Reject this with -EINVAL. Use the limit of skb_partial_csum_set(), which
also rejects U16_MAX, the "not set" value of transport_header. That
helper cannot be used here, as the skb built for an IFF_TX_SKB_NO_LINEAR
device has no linear data.

Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-203545@kernel.org/
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
Sashiko reported this in [1], and earlier in [2][3].

Returning -EINVAL leaves the descriptor in the TX ring, as the current
check does [2]. That is a separate issue and out of scope here.

There is no selftest. The umem chunk size is at most PAGE_SIZE, so only
a 64K-page kernel can hit this.

[1] https://lore.kernel.org/all/sashiko-outbox-203545@kernel.org/
[2] https://lore.kernel.org/all/20260518063407.C3B99C2BCB7@smtp.kernel.org/
[3] https://lore.kernel.org/all/20260531042721.DBD4B1F00893@smtp.kernel.org/

 net/xdp/xsk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index f22f9a2cdbbe..ab2e4fa87a4f 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1006,7 +1006,8 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 		csum_offset = READ_ONCE(meta->request.csum_offset);
 
 		if (unlikely(csum_start + csum_offset +
-			     sizeof(__sum16) > desc->len))
+			     sizeof(__sum16) > desc->len ||
+			     hr + csum_start >= U16_MAX))
 			return -EINVAL;
 
 		skb->csum_start = hr + csum_start;

base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.56.0

