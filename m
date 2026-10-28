Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149838;
	b=ipPQVrpADnhctaYN437X2Y6EKhjIx0A9PZlnx/3MVM/f5TsOWIy38A1EvrZrc/uQcWMb
	 /moiPAWBDpumEXUaeTAceb91Sz5Wo/GPmvQDN+TJ+lUSprR6h1+mM4RJQwmjSt3or+68n
	 6ITE3q9AOJlI11JDWRxvPvAhuhtSg6TRYzBVlQyHCv8l+KOEwxzcVamNmlsGEmRngc5Kt
	 W6K9FvAPIFZ7MU8z3GOrpitxrdRN76jlo5mlo8GQ7HgRRs41ceqj0Wnw1v0xsJ4ymLApl
	 VbzYo/GY02zj20n8hAW9X0rGY4T4yQIX/lGH0AwBvekEgxSyGQnE471TNqddGrXMMyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ouBqehUakR7SvhmTexou4smL/OlHYmPuilTGYVp8FO4=;
	b=ru3mGP4Y5Yx62NHadD8mpwfp/MW1BlAWPcn5re2tTya0w+fz9aYrSw+yPD9acQlh+6ou
	 BBfGTaVU6LE71JiavA8PLL4Dgooq2YO8YGt2B5wKElIsBnoZJ/H7GnYA2NkxayE3T8mmB
	 4iH7F/Vk1jxRMI5Ie/tAeDwgRbc+gMIYoIvCv0vwrFO7AsBeYpvgReISMjjjis2KlOokP
	 KY033nlWXij4SXMrHKWLq2yo1Yf3QsWqW3C7G96nl7d/w/a5eiZYVZ0mb/9VN5X+ebJPT
	 jDfYWTdq3IGlFacjXiVLjMBN4jbbaAFRdMYB9KX2aY+6k6c2FN7BavSmp9fNDk2/CLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSUIHUdv;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68717606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68717606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSUIHUdv
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso318893a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793149838; x=1793754638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouBqehUakR7SvhmTexou4smL/OlHYmPuilTGYVp8FO4=;
        b=MSUIHUdvkaTyCe+FSUelzUBf0PwwVP8DFOaD8OBK7+odPFTk/RrcmvoDFWLOwH4gO/
         jcYvJbEDd/S/l9YQf2YE+5YvMv2DB+jR6RsebbrRHL8WiUAXKrZ2q2/OClAZypFBlqlo
         7koHtHdFFlMDEjHuzVVZM+qU6T0ocUOGyJaCZzlGZNcSGRwwLnQHwiDYyHvzTq9BNJtk
         fP8OJL8wVetlmnrqIX9Hoem8/Zi7pSJIOSvJS1/BAe4UUFX+JGWxwd7CGopt7SKhyCuc
         6cdnzzaKJ57fTZWD6cmJeL5BgRIUykcKrYGdGP6l7sYqgKwVajhnypzKSGHsbj0kXhGM
         KZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149838; x=1793754638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouBqehUakR7SvhmTexou4smL/OlHYmPuilTGYVp8FO4=;
        b=syA4Iy4DRdrbohHzvelHZs/nq34Xw9SdYgYrL9179y5HnqP7iflJxDBSwFP030HrUY
         hZQxlcmsOoy41P5GjEzAtxxQhBDFVHbxk2nUMkHe87+zw5qZL471MjmkcL86z+S183P3
         yIZAULnERx0fbts4Y+HXJFj+ZM4x9LAr4hi/FAXY7vnpPfxvdPzQLeEa7UNGAujV7mfD
         TpUPk/ulnpeZ4f+ps5hWU3evCWz6IMb9DBdTfZlXisaGiFksjWQKD9TG0r72OvZwDmNa
         Txk8YxH28e/QBQ1s5FUJMh0amA9SXwEA/R1SCOFK495xOdRqkLnrewOoiKfXWq/vEKgP
         xH2w==
X-Forwarded-Encrypted: i=1; AKwUvBxt8/X8og6BhDL9U5ORG8SroFHLI7+nTPMXaSDmxQ0luEOaq13W34kin0Xf+c8d4v7l5b6gI7Jz2OsZbqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2WXeDD+4Dw9ohGluHz7eqrXTngEPahuqqBqEjULXgR3P85DJy
	Mi5MANy5KLRZ1ODARZsiK5PhJPX/DjtxTuny7XHDZpX32xXOP3yFa+MF
X-Gm-Gg: AYBFou0qnNpqZqq9/380TFdYu0gZqciOLz6HkvbvDhkSJUlXnjdinuVGzqsVjX2dAbO
	ZqMBGJxweznOfIDZXeFlKs2BjCCSJ0pCdvRPKDXn7eKxcw6SeFgJAhNiYaGAqXT7GGtaSJs4Kab
	KL1YeosNOOTFjQWvNNtHQeoFt4JY/sC3fh0Kw38GgmltCPfnSd6CrXV4TvxA2ab9sAn7gKiQ8Kb
	04dOWtP0WqM8ZU+viR6DzYt1+D+pT5/aZpLRV3bnzG5SwmRVSY5eI7XsSAnhcbHwbDVK1QBRFYl
	l2ZhJ4NVF+5HX0g1AJoMlBftBjKknzcxhLhkW/CasVmXT2FdYIjRZ6u6DeVk1WwELYIGnaG2xI3
	ER6snQPMk3jqMg48GMqeuLYdXHUw5imjxCgUMdJsYss2Gs2S7HK/JxXn3QWT+zbzQHulA84W7M4
	JLc886r3Dia5vHzkHu63btDxoN59J9xpjT4iADUp1aFV0QYQG1y54c27VFfHxjsDpk0CMWpZmII
	zowGMPXFJdj4qkozLDLuhakLX7gGeafDtckhnAEyaMYtxsk48c3stDPwp39oz+0OLSE4t/yVQHT
	IygmbYwJNMVs/CXfHVTAtjZPs+XA5mOCSzf1zr/k4mHUsa5AcdpUzzfPwqZNOAxs0uGdPAHpJIT
	A4DtoQHfVchL5X34ZpFE0IHetz0HvUVtPK8IM3nE/TyJ5cNNIskE5efl2hXxLauHvcuIgpdIfts
	FryQ==
X-Received: by 2002:a17:90b:54c5:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3ae58195369mr591267a91.66.1793149837700;
        Tue, 27 Oct 2026 18:10:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a58d1sm456471a91.9.2026.10.27.18.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:10:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] net: bgmac: fix oversized RX frame check
Date: Tue, 27 Oct 2026 18:10:35 -0700
Message-ID: <20261028011035.49201-1-rosenp@gmail.com>
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

While reviewing commit 77dac783f11
("net: bgmac: rate limit RX error messages") , Florian spotted that the RX
length sanity check compares the length reported in the RX header against
BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including the
space reserved for struct skb_shared_info. The data area handed to the
hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
BGMAC_RX_FRAME_OFFSET bytes into it, so a valid frame is at most
BGMAC_RX_MAX_FRAME_SIZE bytes long.

A corrupted length between those two limits passes the check, and the
following skb_put() runs past the skb tailroom and calls
skb_over_panic() instead of dropping the frame.

Compare against BGMAC_RX_MAX_FRAME_SIZE instead.

Only compile tested. Not tested on hardware.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: replace Suggested-by with description.
 drivers/net/ethernet/broadcom/bgmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index b3a92ae95de3..6873c7bb7a14 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -455,7 +455,7 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			if (len > BGMAC_RX_MAX_FRAME_SIZE) {
 				if (net_ratelimit())
 					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
 						   ring->start);
-- 
2.56.0

