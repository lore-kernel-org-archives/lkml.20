Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268634;
	b=H5JQcFP/hT8BT+OHlHL7FeyjtM89+v8ZK05GWbjcDoaHlDlC3B0fnbxm2oiS3VgYIj58
	 kQyaqVlcGmLBH6nkD3faptXzVpbhy02de5H8MBLm4hUk0SOI5vJCgtizJxPVrT7YUw7ql
	 aRjgYhR9oBPuZRh6M3Hgyu++IUJeLI68dIm/xQMPaVeM9fPQ4Rf83+smyqaJIgeAO2uoL
	 JDeLwDXrmIh+Hav63h7puP6jMH9Say71N9gnKMqniK+pHhxNyEGXVMXjGItIS+pgDDe/4
	 dKWzW6AlKQjjfSOOcTqPz6s4LoLMcXzErwwYRAjuwZHHVFL3c89rvRel792UFdlrOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bBigMNQ1sAPQNa/iJ6yjbs4IQOEwHsZtkAEwCXLbQKo=;
	b=dTKkpvWUtcGMRfh6Wh8//q7wx3RU9fXCJk5GmXcfYGRh7I/RmFN6TjMJmSDhSIP4ZEZg
	 hx0ga+HRWEbr6/H6rabI0MVnnkib1BvV7jUfy+wdYS6iSnwHMfobrAY2KNyMdzOI7EFIB
	 /ImV5/jcBSkyptJAsTazJn5YKKehvsHnn6KM/LqsTySHTk9U1VDYxN8aq9hCl4WfYhGtQ
	 o839A34022jmspHTMLO2uG3W1cErnLUc7pqEdc2ntDvvqR3/PgXKaLeJrv97IDPUtk2T0
	 s+mh2BZjrrAYvbPlQEE4i3BVE4r5sFLGEvKEjsZvcJfu9DhH4tJiUf7KeKUsfA/9UVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQHDpmx5;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B660A3807
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468B660A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQHDpmx5
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so213785666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268633; x=1794873433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBigMNQ1sAPQNa/iJ6yjbs4IQOEwHsZtkAEwCXLbQKo=;
        b=XQHDpmx5cLpIJIEoolw1g8b5MaO42/mb5O875lTDGREzclc199u8Vd7K3OMlcxbH6O
         CkWPY7V/pno5e0HuBsjQ4iYaY6OY8AeRCwDIaDHfb+3LGjSO2V9k7V1Oiw0O3j6j1/72
         bNFPeizmbAgL1Gp7o7FgwTz0v91ENZp06f0kYJ7TlQ1DoH7gsFlz0hDM/yEGbi2Onalt
         ocQ1SFo/RSL0WIIlSLmESk3Su/dBmk7l9TfDXFWd/QybQ3i6m5T1X8/X4a/xWSoxlhqb
         ILiu0RkdXNmED6vu80+vxnQ/uYwh5pADLupTn9bo2VeGh4TcyH4L6BrLqeNNqfZuNQ8q
         7ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268633; x=1794873433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBigMNQ1sAPQNa/iJ6yjbs4IQOEwHsZtkAEwCXLbQKo=;
        b=aH5NcNZJ9HoC/U/CkC91pmcGU1c9QC+Ziu9HjN7qKK4XbEYXkvrLymKa1F4miPjomk
         +F2spjEQaNxEWZn8s57qSEvpJ8hJRmUhgQ+23JC6DcECdzb5iFYBwTwgepPCS0tC3kaM
         FyxcFIoADj/wDNH1F7qS1pwF2TGUeb7jw2IBlQDwz8VXU+l4BYlOQw3vtyjUoufUUaTX
         1f1CoLrF9sGZ5UjPb7Adve9XUeU2OT73ibJBfDvW/KghZHOZSJTlED6RPb+UM26M2hwS
         Ugstybd7v3XkXzTEMtpg93RTarAHNK+Nrx4y3624S+f11fleX0bBHbZyHxwtmGRz5D4o
         bxmg==
X-Forwarded-Encrypted: i=1; AL+hErEPQ4v9Am69dvvzlQBChCybp+YlFuFN04jNA9AJAOrjAg2nqAbRNsTj3LxJsL71zG+17kMVwOtiAmEOM50=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/i+EwD8CbRfF20/UXx/3fEMdYA9zP4SVB90jRGackZ3OmVotO
	oiVCFy1TT8HREOmbwFSJVYxIF5+fJA3Z0/0zgWnbV0xYEcZCYSENAoMI
X-Gm-Gg: AYBFou1BL+8WgSXok2VjouNa6gSKX6QGnNKQD2ABEvd86RuxSeFsnIGQgheTcOnHqZv
	M6INlvoXKexizJHDY4B0VyqV5lsxkty6RpuHee0jn/Er9uM99IUMMrZF+U/Tkqp71P/6ATY8KGR
	3ywo7mIyQETHnHd8ezaHgGPL3Lj4vl4zLsDZWGjdK61WHAP5Eau1Vnq2rbFPZlLAvN0Q13Hxasr
	HOWPjT9TG0sGQriBagDM+IWNZzlhvY0uDcmAbu22fZwPQv+bxUpTmJvaFSrabHZ4AapByL2YiKP
	4whxn0SRZOpbNkUYDsNhUMUyRqcy+dDgAtUhm25+6NRYQLafZny8dO9YakTY3rbC2yA7XP45Gje
	nwUjIQLm4SAPnbSnZKuLgX3LIv+T07/fQ8Ap3MsJna2s7juZ9t7zoGnIls9W8ppQR1N3zc8jjM0
	RuNCdZJYPlFGdCnvF/UKrZdKJ99NJVfmTnVvtV29UO8N0a+6gYSKedXbpXNh+i+CWUvbSCrjDH/
	12S70RAjEHdToABeyi0uV0yztWHIjQh0tKb8rgVHtoVeZjZP97bEWLGpXC8AIbRJ1mKrm6WP6/8
	GJ3VIUZt8rSPFYDP5njX7SAV3jRHHkDkKcNW49Raxc+zSY7NWbKRDRI=
X-Received: by 2002:a17:907:944d:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c504963ce05mr79060966b.44.1794268632629;
        Mon, 09 Nov 2026 15:57:12 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:12 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 5/7] net: bcm4908_enet: unmap RX buffers on stop with their mapped size
Date: Tue, 10 Nov 2026 00:56:58 +0100
Message-ID: <20261109235700.2586821-6-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109235700.2586821-1-kudzo51@gmail.com>
References: <20261109235700.2586821-1-kudzo51@gmail.com>
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

Fixes: 3a1cc23a75ab ("net: broadcom: bcm4908_enet: use build_skb()")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 778920e37..c0aca6801 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -331,7 +331,7 @@ static void bcm4908_enet_dma_uninit(struct bcm4908_enet *enet)
 		slot = &rx_ring->slots[i];
 		if (!slot->buf)
 			continue;
-		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_FROM_DEVICE);
+		dma_unmap_single(dev, slot->dma_addr, ENET_RX_BUF_DMA_SIZE, DMA_FROM_DEVICE);
 		skb_free_frag(slot->buf);
 		slot->buf = NULL;
 	}
-- 
2.56.0

