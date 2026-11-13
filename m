Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614343;
	b=hgFy8SPgwmesi58POO+v/dSfFC0NYI6p1FKOgibdrg4nwC8VYgZbe476nfEvY+9DLlEe
	 ZyPVa1Dd7mXrHvwUwGfdlnTzaNntTOy0SWcdIxnUQ84A/2jFH0jgjbkICJVVuI6Ou3J0u
	 X62pWv01hTNABPryXcOyq3xdTIsE8dr0Nk9cy2XccLBK1LGNhoQTdV01FPraXRBdbsrwJ
	 3tBuw9oqIvUux6EddBTNl5w3sfadwvNkifrooydE0FwYpb7g3W24CDYDsBjdAJWbFpFiO
	 kkVXq8s68NM6ykZJ3WVbsLuVvFJgI5vi9iHJquwvRDfw9N6ubgfLC+Zac9fi9H6NInQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sMuQKEZDwnWs5urXuvvCzDhCsA56ApL3CGERxb7vyLk=;
	b=woO/v97oznGJEeHdcnrpeJUCdq9YLPFQjFZ2PyOwTqdHG1sAts961uIHmcw7WonoJxHb
	 AfgzQDUcTHalY/OVx/ctYdrJuX1Ptd2S/LTV3ijWJQKUTxMMmOrHW7XVBJDvSOTRG8JKs
	 xCUKGoqzD+60flPFw37u22J3IbbhTiBgjWiyxROsz3NIGKdk5w7BFlLl2BHjlGiUAR/Lf
	 Vm1L6E34vI5ASVs3NbMpfpVS7Bebiu3V4KguwmeiAKkcj/PrAAbcYeG2CAYJVTNuihQF7
	 xFcd+3t9u+8/PbcNcEJ65qrpiwtz5rB1LNKnUxsmw6IPBHioHRmws7c8mY1mSmbP8IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ybcl+s6v;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B26606A8BF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B26606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ybcl+s6v
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d581da0aaso237151266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614338; x=1795219138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMuQKEZDwnWs5urXuvvCzDhCsA56ApL3CGERxb7vyLk=;
        b=Ybcl+s6vBjYYMzHdLbpW3UKmPNe3oAXgoERAutIM16jTKQ01ZjwL7lHjaV7HTmIrNG
         Us7K6BJmJ6NtDLr+5GUHffgsOHQefRsiAAtAIcm0o6BIhwA8q4nVs/0nlvfaWG7im/dp
         0tLSeBf6/SPNac6bHWYSJ++mGjbkE+q6UvN5qPHg5KHJyDtT/OrUR+5g2KJmveaCopTW
         0AJ+Kt1l+WnhnaxZexe3HFwa/lFbd+nb54W6kvh1jky3w5KKs/PutDiqR7gdqRZp4CYL
         gf8BjqUyyrTKDsqD3305NT90edpu/5t6I+Hlkklx4IY3kZy+oGQnNi/kSUvnpaH9RRkr
         vlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614338; x=1795219138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMuQKEZDwnWs5urXuvvCzDhCsA56ApL3CGERxb7vyLk=;
        b=0KZbV2HtHHcroBwYkukh15vb57v7qnCnXZTZJ2Js5vJ5L2B2umaaqe1mV5iXTmXgZq
         RCyEc1k9WEvTKAoK/JBj6KvbxJATTY1drTgSZWJAU7aQU4/Iw1UgX15JqqEykXmaIGqW
         QviAUpzM0zB3g8jqJFF0pgMefeAaUOgF6AoXK2fAlIU6jOUpqlEn3VJ58i5ZbpA4xciR
         FFG+X/rf6fOmnscymYpAPmI7EN+eXuJhuAPktYI14ulTyEBxgULd/7fK9RDLMD31gNEk
         9p3HVqzxfBdTDnfh+ZxGkiW4qUG8fFK8p/m0y0nJvDlHLVfek5bErglUN4A2M9tcTSZW
         bToA==
X-Forwarded-Encrypted: i=1; AL+hErH0QgbwT8S6BQXpj6vipxVF04R7V4eeZ/IXWTdiYwmFb9AUjmrP2H7plilHYTnTxgYz6GXmiMmZQsv7f2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z97onNrm96PJkkadtsyx1tYzfLKxyg5vIGxMzDBp2ESEtfx+tTM
	JPoc8YrGlE9r9yNNIR62svKSQjdFxjpbXMfbaeFzdaTy0Dq5115QRppH
X-Gm-Gg: AYBFou1+NbXDtZ2fbS4dwIJVyd51oOT/T2FO0iXWdtmyyD67svTIgV9LIj+mBximMKI
	rpZkLOY35TbcrBfUUI/7/FMarRfEOJqSwD5XscOWekEql1Q5lLiPKVOssnxJapmSg3FJ6zO1hfa
	8QLRQHt7Frfl5h3unhHhAhndeUx3SpvXOUOEJ10edYA2TMqUw53+rSuMiNvtBe9s6irHAFaFWrP
	AP10yRsTvpvbTO6AljoK8rRqMAMgFBSyoJqBtj/S47YVf4XLVRTU/U8bLmEAJB5uU0KqkjkgvBe
	Ay8R6TLZ0fx7py2pK/liWqOOHoUtaMEsV49JJSvyaHllNOD8svwci72Jii5KxqeSolhXOhwax0r
	HFSfRKl2CSNJ+uw9Iw3ljbOZINlX52s4MGE4p2Pv7XtIGopImtOfBNrtEPoERg7Um+5alL1WjyB
	Tis9dhDVYVM/vPbLBeLMl5CPToiYO2ZYn2hXeitkAx6gzatF+O1X8TOnQDJ1IzuKzjFvbVOMzQt
	oQAXaWbapr2+E9npy+X3p+R8x4jYYNCYHQSNOFGpt6Ck5qXDJyQL4UDQ/Bg2p5ttu1s1+JXwXIr
	PvOcdOL+LLEbf0ND6knR4mt8akSfTtPSpCzgU5zYs1RqsooND3WIuvTCmh0AUPw=
X-Received: by 2002:a17:907:d40a:b0:c2b:f3d5:2090 with SMTP id a640c23a62f3a-c509637e0b2mr347738666b.27.1794614338294;
        Fri, 13 Nov 2026 15:58:58 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm153454266b.32.2026.11.13.15.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:58:57 -0800 (PST)
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
Subject: [PATCH net v3 4/7] net: bcm4908_enet: unmap the buffer of a dropped RX frame
Date: Sat, 14 Nov 2026 00:58:44 +0100
Message-ID: <20261113235847.517308-5-kudzo51@gmail.com>
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

When poll_rx() drops a frame (too short, or not in a single buffer),
it frees the buffer without unmapping it first, so the memory goes
back to the page allocator while still mapped for the device. Unmap it
as the path for good frames does.

Found by reading the code.

Fixes: 4dc7f09b8bec ("net: broadcom: bcm4908_enet: fix RX path possible mem leak")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index bb42b6ecd..03de65d9b 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -661,6 +661,8 @@ static int bcm4908_enet_poll_rx(struct napi_struct *napi, int weight)
 
 		if (len < ETH_ZLEN ||
 		    (ctl & (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) != (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) {
+			dma_unmap_single(dev, slot.dma_addr,
+					 ENET_RX_BUF_DMA_SIZE, DMA_FROM_DEVICE);
 			skb_free_frag(slot.buf);
 			enet->netdev->stats.rx_dropped++;
 			break;
-- 
2.56.1

