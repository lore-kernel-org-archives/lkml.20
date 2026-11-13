Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614343;
	b=YD7/Trr2upeIBqmU0NYTv88INtjpOq3hW6VEVx/4XMM5/LFAU4f6qLMl1FUD1qh+zMrp
	 ln51YDV2KFm7cEOCbpxAJQxihr5/oBDd1eZXJ++wVilPiY9P9iXEFdkMsvDZEHzTe8S4R
	 BSF1aKCp9KwtxPvjkjAGymnEHjtxV5N6FyJ7hT1KXzmVsHBlTZulbXK8RMn8p+luZMNld
	 hDrmy+0KPzOw++1yvSur0iHv1JyPSxmfZd/zFiLXivWBF23LRgdQoLSnn4IzeO0GT/Cyp
	 WqqIGDMHDTw3tInZxoK9F3jTlc5CxwNpAtCcZyn/3Hx+rCxGsn56JrF+VdGZ0ID7tKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3Y34gjrCf1/M8nt0B/F1aUTr5s9mtv5S2XS9OA+DkLI=;
	b=l/1TApAk/7bAlV2Q+kIkfYRteHihWUCmuwG19ndnZuPIjTA7pK8uq2h4T3rtmFnd6WjW
	 6PEjRu+zzjMxDQ9EqY8A0+XOU09TrJ3en6Rqv3h69peX5SsL9m+aQ4LHv8j1NW8ISSZaF
	 rxmsQ8BFK7i1Og/cXizMURuAKQG0S81m28Z50C4MdztTEqkITfTBaLzftmWpmwpFEBdem
	 5MFx8ARKzbU1WrH1OwHwFB1GCFqedi4tKoVNxMloCvKSmXFArMZJ98jO/wHepA5SERIC3
	 u3wUeUMDxt0/Bxr8KqjC4z5VruT19SohrZxIJTxALagFtgPQTVxDe4awHg3MUDbHTZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j98LLVL7;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137260A260D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A137260A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j98LLVL7
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5067a2411bso285395266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614339; x=1795219139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Y34gjrCf1/M8nt0B/F1aUTr5s9mtv5S2XS9OA+DkLI=;
        b=j98LLVL7Bger13mwxy+RIduMv5CvRdYzEFv1VIx3U66oUFXRZWXDTshuxUo2ymJYC0
         c9mtAA1yhWm1trTEBiJcm//l7uq6Bhwjz0i/w/ZXtt5kg+MPsQU+S/3RVgNYh8MZbpED
         p7AALQrnD2xjkeHwWawtkYLo2DXJO2xm5n5Il9VMwn2ElfYSIRbg853fsVPFBSi3IcVK
         QVQW/LODLe6ZrXrYSCElLBNTAdAgpe8mOohE3gwiOJArbcTwFpM94901+CS37YPiG86X
         E8y/DApyidI2jBZLE2+TwSDUsp2eDgGLUJq/S1ur5AQbCH6VuE7rgw/8uC4bLnlxgZPP
         ALFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614339; x=1795219139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Y34gjrCf1/M8nt0B/F1aUTr5s9mtv5S2XS9OA+DkLI=;
        b=msdGD4XSa5eKQt/b+YbDGxa65Tjkc50/X1o9xwcyCvbmGqiWuUDApsWosuDqJ/LZhZ
         j/sIHhaRRt2k9016pmgH4JWTf2D18CiklL7JzzpW9dlQYJqGWQHI3uAZqMKFG4DfsLR+
         YyQ3lDve6NNtM/XcUmR8wPQuiXHDYkq0FSlZZpA5vedPxp4fwY+NLV5tLE1R6JKZGz/g
         Vs+AT/CK6P+JB2kuC9LquObqVG6gZvmUkVoOw5xDymxkYQqrGsZqUOxU9ach++dZGsDE
         jUCPWfkqnT3C2ZNtM7F2yWf9f7KlywPPFkx4mpYHZ6H7JOTowFVM9VXEAztb9ORs1vlq
         JYzQ==
X-Forwarded-Encrypted: i=1; AL+hErH2ifDTWF58VhjW6WBGaSkzT78HlXqVJDM0MuC3C3sQ3oAHeb7z6cMOpSLhPznMu/3V6h45WTokUt0myIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XjPmjgg7sGzgGnj2iXv4FIeLnjZzlKwO9g5Frf1FE17ZZp/EX
	kP6tDC4rTR7YE3pzk7Mt/HXkBRdkQFCY7zNa3lMax73OQNnt/jmwVjAh
X-Gm-Gg: AYBFou02O6ANPyJ2Ycey4rjrxfqw9Z4C+9xXJQqV1kvc3abh/3CRfpzQL9nhifd2Ox4
	gCDJPRzlEmSVMpcIAlEbnMJxJDYucWmQvJEESOwsJQvqaYgYlrn+d8zjJ7OTzi1+V5HnkLQrZe1
	ocw9+ES7T1fwfSL0PNBBR5jROsTlG7K6UrGqTd5YLq51FU388kozk9W7L9XgEp6QgtHfzarNQty
	dBd8xB9U8r/L6FihHvCG+iP0QFvi1Ui8K4XjJE62jeDa8wKi441Lc9b0lcPTnEAChGCqY2vjs1w
	K8Iulbl+084N1VzzeWc+b9x72bDPS/dVbkPy5jSeeDFLZH/ihDKGkU8/iI8aYY+c8vI+ZUFS+a1
	EcH1UdxPlrkoD1sC1xQzT5ZAPwDwY3CKaDNcNuoOJuszF/Zef1ZPAht1Oxk+VoEHlDb7DzgLI/d
	TixOU/jdqFhQBUcNDhatxXb5iyeqAYXTPABsfGcHr9BO3kHUTcrKsDJ2Ri3/JKyxaHF2AQGR9BG
	hd88RNuBY+WJN+G0wx60ByKbpw81mOn8Se/Yk5DgnXISBlHfn6hO7Mm9c8ppfzxsVVH45Xw+b7+
	+7Q0WfbtTdhaj7FPGf79WNsQ3iPqeB2sUYAGWEpy
X-Received: by 2002:a17:907:a08a:b0:c4c:b545:f29d with SMTP id a640c23a62f3a-c5096545652mr356912566b.36.1794614338993;
        Fri, 13 Nov 2026 15:58:58 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm153454266b.32.2026.11.13.15.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:58:58 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 5/7] net: bcm4908_enet: unmap RX buffers on stop with their mapped size
Date: Sat, 14 Nov 2026 00:58:45 +0100
Message-ID: <20261113235847.517308-6-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-1-kudzo51@gmail.com>
References: <20261113235847.517308-1-kudzo51@gmail.com>
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

Since the switch to build_skb() the RX buffers are mapped with
ENET_RX_BUF_DMA_SIZE and slot->len is no longer set for them, but
bcm4908_enet_dma_uninit() still unmaps them with slot->len. Use the
size they were mapped with.

Found by reading the code.

Fixes: 3a1cc23a75ab ("net: broadcom: bcm4908_enet: use build_skb()")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 03de65d9b..4065769da 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -334,7 +334,8 @@ static void bcm4908_enet_dma_uninit(struct bcm4908_enet *enet)
 		slot = &rx_ring->slots[i];
 		if (!slot->buf)
 			continue;
-		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_FROM_DEVICE);
+		dma_unmap_single(dev, slot->dma_addr, ENET_RX_BUF_DMA_SIZE,
+				 DMA_FROM_DEVICE);
 		skb_free_frag(slot->buf);
 		slot->buf = NULL;
 	}
-- 
2.56.1

