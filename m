Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635112;
	b=bm2XgHF1y/4e2yOqJXxfZlzI8TT3KDKZ4/nzp3a09u2hrRMI04xcn8zi1rVYxqJw+Cmy
	 km5LHAjbqSZz6NlszJUYN6wgY32h3kIFT296GAlyc3hl4kfqN+l5Ygxalg/Bmy9HCAkeI
	 2TAtQQgtEQm2Y/raSulh1h9Q4vcpcJmiQHm863YfanuaH3hWAKUMcjSiG/UVHMhZg0xmc
	 1EfoD1TJbr2KFtghxaJyQGCQD7SKledCfSTvbiv2YEvKKIWSXqvq/6hD/lqCUK3CHpc12
	 d2oblsVdaOkgjc8RmrKJI74oMbIm3XnATIhh3utF9EKEeBg0Foeh4BUwOsWvbfuj41Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FOJElCsJejkEPEZ90UqbExNeYAKPE4lqsiLwiXZew8Q=;
	b=uaS1IgextFQdFZibkElkDgOpOk0aNpbT8KSqvtAhlh8c0lM+D4AljdkJk5kUtKNqPvnG
	 kVgwFqhiF0tz0NWrJ9ZFWcRHIgTZ4Sut6DDwZdLXiKNN5gfQImsCZSyDuP4Zzo98CARPu
	 io5Zrslfjl4+3FrMx+Ion+PxosFJkyBYGZ5CajGVlSWHeF/VX4ioGbEMq2BrYnMfTGB+r
	 4RN3cas+z3gIMHphNlORNEP9/RX58z7qdZlnN5ksWSMXP+ypfwXXFke79ExvrNgxMtN4F
	 HZ02+GvycSVdG+prO1kWKFGrvDohsxWTCNryaieT+wgXYZDCBkC3/29Kx5B2nIZvuyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dAAQBVrc;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD846075077
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD846075077
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dAAQBVrc
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1018191a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635111; x=1794239911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOJElCsJejkEPEZ90UqbExNeYAKPE4lqsiLwiXZew8Q=;
        b=dAAQBVrcwBdaWSb01wI53Zv/Qb9haryq3CcTw0Bie8nY74OUuqnjwfZ/U3E3adNzI5
         C4JTOlruzFVAjFxGehsiTpJQOVO3iSayoFwiVlMDx1e17fjguMliNn5+rpKom2sxO0ys
         OHcxG61ZW2aOVD51Hxbl5KuE/xKbZ3x/X/zmpwwrD/z0t9TaqWYKCKU26XTK4Cn54N87
         eoReodtp3hspi51eNbMWFL5bDZzy3h7tcy7YBTZG4OnIsnc8RuqZVtGOw/oVuO4EtkQZ
         UuVuotkK77UuzKgEn4FlCqUZpyEovnDw4xjep5Z/NmxXivaIWB/LwkO4Kvn7aPPcChoP
         gPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635111; x=1794239911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOJElCsJejkEPEZ90UqbExNeYAKPE4lqsiLwiXZew8Q=;
        b=dkqRC93T40PnMZqfKGc8trSdlSej3UzfUqY5e7duo9MNnD6HRUHmDPmwlZyhCVgBbd
         j1SsGo8zDWt6YQJOu0xHNOYr9lRQII9JtwqWJedXMBZXzQD6i7Erg+zNiMsod8lrsWgU
         VFvqQB8szlvM0Icik+DllFayXQ3vZmfO/Rddkfu//tmaWMoQ1peyoIEe55UV/o2Zew8d
         QmNhzE1LYXMjFUuYJYjSkbMX4qZrWOMzCbOmh2Qd8Dm37ZJUPQMjJMWj7VjD0ovUJved
         WouixCw7kSENkPJxgzF1mu3ub7twdsKCEP6bW6E8xvOyVzYmh0HdMuthefwbQJsDz9Vm
         a/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwGL7uQgoXyKgP78RySZmYV4Q/VonOOVuUSm7JG3wd4fwH9FJuUZNehgW6SKEdwwaVzwcvG2HZqL38yPzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P7ksKoMXWTkNZyitG3upxWqN78JCibsYKi3C1vmNgVfW+zGCa
	WXFbbDjHgcXQPT1tjDNYt1tiUWhby5i67wpwagqxnkzGbJCTzvDQAsRJ
X-Gm-Gg: AYBFou02bHXVVZSnJwjRgY4cY0HLB4H3onyGrzFVEsznjfn38B0ilSdtqpYS3ZIbDQu
	sJx/5iJG0qJHOGCUn9CaiKwrPleMSVGOPtIoBKJ/RcSIz4LiChJEcJmGswSoDU1eLfrI8nCmAW5
	wvMREltgmKOLasRuedgS+3YnKNc8+mVzPePigcy4ItlDFHF6KGQthsaquykEo7ab91w7/+xh2R5
	GFsYd54pBUziKTwhQC9GVe7ObzUg1slznlciayTr5ZBeHp3TB2C5+nAg0kgpfKNoapknNxW+L4g
	R+hZFMcaBWt7YNOLGzpLl6JQ4rGMB6LS9hFifWnQRs0SXjbL1XF79Unjpd8E/+XcGb/NeRKIilT
	6K/RXVDTQ7i0befmqWK1NawlpiuJfoKKFGqqUBFMFFnB/YxVHQjYDN54/+Pp0PD3mmFle7Cma8k
	+ZvReASBTtuRjkiNeFFdSCFXM6vTjw68AwjWfo7HuQ7mqUOSeyCOYsQgTltT8+HtSb2tzMc8DjC
	ffTy6GT+d+ohSKSalJhRXD3QgXQfG/YovAdGhQvRctX1YCEs/Hjjd+pB+N0rHr/YlTpuZ6vgBti
	FL89BD74GCCyP0iVGFej8jOAeWeOJpZNyBw7Nox/6Z6uXdSO7zqR
X-Received: by 2002:a17:90b:1e42:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3ae896f8250mr9163738a91.22.1793635111035;
        Mon, 02 Nov 2026 07:58:31 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d429fsm19183949a91.2.2026.11.02.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:58:30 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/6] net: dsa: motorcomm: Isolate all ports during chip setup
Date: Mon,  2 Nov 2026 23:56:33 +0800
Message-ID: <20261102155641.3682626-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102155641.3682626-1-mmyangfl@gmail.com>
References: <20261102155641.3682626-1-mmyangfl@gmail.com>
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

Chip setup only blocks unknown unicast and unknown multicast frames,
leaving known multicast and broadcast open, though known multicast
cannot appear while the FDB is still empty.

Isolate every port right after the hardware reset, in preparation for
the isolation refactoring. Note that this only minimizes the window: a
reset always brings the hardware back to a dumb switch, so traffic can
leak before and during it.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/chip.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..e1fa82c6db95 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2221,6 +2221,7 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	u16 eth_p_tag;
+	u32 ctrl;
 	u32 val;
 	int res;
 
@@ -2258,6 +2259,17 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 		return -EINVAL;
 	}
 
+	/* Block all traffic as soon as we reset the hardware since it now acts
+	 * as a dumb switch.
+	 */
+	for (int port = 0; port < YT921X_PORT_NUM; port++) {
+		ctrl = ~(u32)0;
+		res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port),
+				       ctrl);
+		if (res)
+			return res;
+	}
+
 	return 0;
 }
 
-- 
2.53.0

