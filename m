Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656691;
	b=X3a9UBCDB2g0KsgrxGDBFak6lBrc6JavEvhKeuvL8lM50ryO+BQCGucefMagBOT2Uhj2
	 8+laQYH5p5AdI1ssduch3zw9sdhQzNG3oKipQGH8gWzAhazQCTcAQtWymeQsPns965oyb
	 vbMYp+OIqji0PyPzhRpza7puPpnpHmWFb/hFrzb1y+D7bEfO2RTAuDP5b4+J/B+suZ68k
	 fOL1afxuz2Ejfj1vMn4nudLu4HWYY7n8F9A3nCLVYqHjWL/MC5s+8BpEvxUVsHykNGfN5
	 oI6AQFfiuHB+f6DK23bIiLZSgZDrTwJ8a/kHKrNOmSP9NoWqRl5DORp1OlMNaXkVg7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gebPnQ/HRugxL6nfFyrvMtYAqOFjmGnjd5psHTA3l8E=;
	b=OtKJIbQHDKlmGJaiYH90bQeNUSiufLoZGMrTVSWYMOQ5Xki6MBbgJkYbGxdFzqk2wiLA
	 tlgb6tAvdS7X6fj0/aGMnhyTMFFa1UWbd81fw7YQ9SJDnS3mLl9bHNYeGmzwoEmOYv9Hg
	 SXVnzZZWEP7y4/OelKGCrM97m2PwjftpBjvQqouZ+1aoW94qzNUG4z5K2cIGrXq+YnVuM
	 V3YIBx5rX43s2NffVO82rGEVYQFf0cvZ3zLvzFeK03w2AIHbrPn4UZ6kbEJTqPV5hMKUL
	 tqUqrE6608UpPcIfwyjPzxqZXDMlfBX11JZqz+CFH9BSWiaHAaT1hUN7W71gXVC94Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpBrACIn;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3B606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpBrACIn
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8b20a899fso24128265ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656691; x=1794261491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gebPnQ/HRugxL6nfFyrvMtYAqOFjmGnjd5psHTA3l8E=;
        b=XpBrACInLlTWuFMMdhFWtpx5vhfJhI1QN7JOShyE7KOeWmDf+zlM8nSXfqdtOAIYmW
         p2U5e2JgXjCxbcoSGl0NXCEaPwrR1uzsq/NA+2frTqpx0Bej+n8rFz/UzxoFVTSafcZT
         LDOSkEKrknltPLoqAVXEJshjq1OlvUmLH0wFOF2FFWNBRBTXce61jci2h5V8mTGBy8mb
         KV+fD451HeBs94vyBm4uJO0XUn9/HLhmyCfFU2zHzID1A1YY8tM/S/brJtcBZosUcZCI
         7gVEbgUonYzW7Gbqwdbawa5A0+yN0qbZeo5prhNTo3nufbs/9T/vYDtZbseU8Fz9+O2E
         gVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656691; x=1794261491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gebPnQ/HRugxL6nfFyrvMtYAqOFjmGnjd5psHTA3l8E=;
        b=dd7kFYp1c4vkcQssiwGGejcz7bx4pY5HB+CcYpA4v1CYaoy8kuvqrbICR8xWqtacA2
         TYtSmXOsHNaq9nmu4n4xTfOTsr8IUtn17reegKG3gW8RWTlguAd8eF3NDJpo8H8A+EOp
         YVR6jdZrIJ56xQMgamtfIJxIvr6fMW+D5tMwWzbuOZOfmT5fCeKe8izZEM7foDG3lhOp
         jxgaaYTG8O7AMiBvTFmFHIfeE2ZpGS80dTeOxOgszi78Pzqb1ZKTcbkzxi2FU8wXP/vJ
         lvfJ8sM1WQjITAsRU+daqihJxtWXmqNnQqzBIYeyOdSaJGFX4TlJLYhIyyCSd9sVERQp
         wC/w==
X-Forwarded-Encrypted: i=1; AKwUvBzrkAMeFD/2VvMxIvFrTJMYTnE477draD1S4wRWHbZN6HLjl6OI/yon3qPKR7yn95dLANP4264B0d1Br2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zVdJ8phsKWcC3bksjR5kTiBShLVRUAM8qDfMYG1c64jlfUj0i
	Xcmd7y7y/45kNskqcswSJbZerKx6e+9JE6lwfehJwi+U7qCfs5ywZXVd
X-Gm-Gg: AYBFou1+4nqSkm6tT9+An5ahKuU4H4tdyXpTzIIK6t5/1VcnqisUHJWLC0KkD8JzGt6
	icb52ZuxYqr+XCaLDjVfaRYFSVGQpZzWueQbE9WEggO9jcSMOEt/L/Dk4uqGog336ytbSsvZYb2
	db7oOX+uJ2Dxd9gMRPQUiepNlcbexX9OE0N1RetysGesMOxMzy3SV2+PiAUBz6uIZvzaitI6QfN
	PxZBjlptxjED4y/kjZFf+2Cwrub3HJ6Z0WNMZV8J57Ik8hzg7PjkFcNHcfVdlk83aYQLH69q6Ep
	DhJSVZC+LgYcrSLwLYrkOFK56NbTiWyt8o29iy5bF29U7JI7e7zhJpOMQfCzukDNjBO2mDXHIjC
	VeWu8udH0Y1JJLGlLPY5QzLS6QN7fAe+KtwUY4N8IL8juKwPXoUc2zlrdPD6YW09xq3WZFUNYTO
	JZH/oC6xfLKBmLfLI/+XDCInq+FWF9iRRurhchnGz3YKFR72dwnttmDclDLlaujWSEOH19htC3T
	5Ua598bof3pTtsNW9oe/LKWlckZrPpqtpRKI51oxIO1U4V0yBwSwI6Fw2epzvmjUs7JkbHB5INl
	QTD0jAmMFfEpmXHf3vXTMV+BJXvW9fW8JIreqqRJAfIiI1pyEXeHKC9LDDQLVvZtEQMBzv3QzxL
	/fFB6rnGkejXYb3kwredy6OzcjmlWPTpXwtVEbXfPdr2pa743fG7ykOl3IW1NS1sHHtmlBm6pNt
	C16A==
X-Received: by 2002:a17:903:3804:b0:2e6:1a6c:abcd with SMTP id d9443c01a7336-2eb364026bcmr108654215ad.3.1793656690833;
        Mon, 02 Nov 2026 13:58:10 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248621sm31840155ad.28.2026.11.02.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:58:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: bgmac: stop advertising TX checksum offload
Date: Mon,  2 Nov 2026 13:58:06 -0800
Message-ID: <20261102215806.13723-1-rosenp@gmail.com>
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

The driver advertises NETIF_F_IP_CSUM and NETIF_F_IPV6_CSUM, but
bgmac_dma_tx_add() calls skb_checksum_help() on every CHECKSUM_PARTIAL
skb, so the checksum is always computed in software anyway. The return
value is ignored too, so if skb_checksum_help() fails the frame is sent
with a bad checksum.

Remove the feature flags and the fallback. The stack then computes the
checksum before handing the skb to the driver.

Tested on an ASUS RT-N16.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 2dff43f540d3..822903a3ac6e 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -145,9 +145,6 @@ static netdev_tx_t bgmac_dma_tx_add(struct bgmac *bgmac,
 		goto err_drop;
 	}
 
-	if (skb->ip_summed == CHECKSUM_PARTIAL)
-		skb_checksum_help(skb);
-
 	nr_frags = skb_shinfo(skb)->nr_frags;
 
 	/* ring->end - ring->start will return the number of valid slots,
@@ -1574,7 +1571,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
 		goto err_dma_free;
 	}
 
-	net_dev->features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
+	net_dev->features = NETIF_F_SG;
 	net_dev->hw_features = net_dev->features;
 	net_dev->vlan_features = net_dev->features;
 
-- 
2.56.0

