Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523005;
	b=KUFFSvNUzxlkN6dHS+RPPYSSkXk8NeQdk0uJXnX8kC3qYjfVrmU5LL+qakiFyTQL3USP
	 aSRobxIw3QceBo8v1J0LN5+pGEonJatIqZ/MAxf04Cqw2UTnTrlpnteIBl1qrLtn98dzz
	 1Vrr803gJjNtBV9VJ3WBWdwxIJe8wY/GW4qlHr3+Jcb3/YhCU8Jpr3bZk4MTsyyGpELvx
	 pnnCkRPiqMlWLNwDdVVACY9I2IJnY1k4PI3DQdgUQwI79tO8cHGNbtXIgSJ8qrGZmesJY
	 jhzJ83JMipKCeEK5AuWmEXRoZgVT8uTXG/oDSy1Bsa2g8HQt4hEj193ynP1Lr/85Bgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523005;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XW2XawDSDFkTSk897IfBcZxxEG8qyMFEO8Acjxpagfo=;
	b=uxFQn/tptcVq/IpZTPyzOXuMQUvsd8bXL5WmNOv53KuFBwIRLb43IOJO/vW6Gm15dg3I
	 Agq8/nTy+bJFeqaklE0iwETQsg34XLreR0fzoLgIk0QHgyl3jOGZYveC48CuWhxS5JW9x
	 JBeGjFI8mOhsNCg7rbc39WDxuACBss0q5tfEr9H7/hT5NUIy9WA9zxskV480eEKCGkiNW
	 XOmw+pvrh/hqR5k0TRwOl4MNatW2BHNIdnNuriHZWItGOlQKgerJUohfHhhzGAfNjvuix
	 ejqk2jfEvb/iVdzJDXWXV1bHTxtG96iFxW8ALpEvemcpqPwe+IrECCAerzgmk6+Zp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244C606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B244C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2312547f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523003; x=1793127803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XW2XawDSDFkTSk897IfBcZxxEG8qyMFEO8Acjxpagfo=;
        b=fXzOmSR43kg9CHglcBMGQvRP6U6ybs7ktS08XHMcPo/bt/nez0Rf/hTrwvYm+njwkf
         bS3kc/H4auvJCM8GEVYWTd6jnavUt7u50I0hjHV8adh6SHX3W3WpxReA15CpG1C+Wmab
         ryLaUHrfA1xYiaQUOqrz4BwtGjcZvn1nTue6nCw4fsW0NNYYICPGLpGKEGy4YV/XViiW
         YGLUYOyJP3Pdi8PZBs7Bax8dj413v3rcH3UkMPZoAbdoIatScBD3PwvPpAXD0hmckCYR
         OH5dftH1u0tgZTTwvYdzGIpmPvG4mqx923IuJvZv/Egd6CiGvCGtgNPBQH8XT9Scfn4+
         DuXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlMxfAkXGH46MFrkCwBIQ/o0XpoXH2BcikVXUJ5R8LCBKiVV7pJM+ntHxgvCG4pWt3YrbRsYhYyI+VBRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKi1za2YSTz9d8iyT7mNoVDqnD9C0RFl8ghSSg7wqWpRSIm4mf
	kz//OsFhkDf//Usb0wQpLUVNj/0dNrxvniE88ANoq8eNK8eYD4ErXs4tkbvbfWEVmfA=
X-Gm-Gg: AYBFou2oJFU9wzrG8tZl0NuxapTTCKaLQKSe7JWh5j5tpPL1D48NjNwCLWplQj6mgTf
	KIvHOI4imdYamn8z+OIR1mrGe4wCvZhXPstZzgN9FLf6zOAcO8f3CJ0vmlroe9/rCjTdhUrDOMD
	fRP9jJo5/voFhgSAk9dOF+qONn8R5jo683rfGoin+1nqrWHOO6HvhyF1nHwugnp34vxbekb0Odo
	fkq2mE8SVimtIiDLiWgNBqBElISAWJdjL020JIugbbRABgtFU6PkTCNxUxuswhWwGW1hwsYZj6n
	m3UXcI40prL9O2ME/RrU41DW9j3aS7IpWXg9MgKf1mmHApc5AdpQf5p48gTWYCg74u5G8Gpt8xq
	5SCI2TQzzPbRnA2JbUhRFRYyIf5K77Lp55pK9USkW2ylnN7rkVBKsj5trFvHRW3FHGKJROUjpHI
	F8yk+08V977xSQr1C9pFJBZT4QO6TSeOGDg0ZYhp8sueGQBi7oZ0neGz92g6yiL3CVnEyp
X-Received: by 2002:a05:6000:1ac9:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48e07f99197mr25786391f8f.39.1792523003036;
        Tue, 20 Oct 2026 12:03:23 -0700 (PDT)
Received: from lake ([2a02:810d:d09:1b65:a3ee:29e0:454d:c31e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm279157f8f.23.2026.10.20.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:03:22 -0700 (PDT)
From: Grische <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Grische <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net 1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
Date: Tue, 20 Oct 2026 21:03:16 +0200
Message-ID: <20261020190319.884375-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020190319.884375-1-opensource@grische.xyz>
References: <20261020190319.884375-1-opensource@grische.xyz>
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

Commit ee0aace5f844 ("net: stmmac: Correctly handle Rx checksum offload
errors") taught stmmac_rx() to honour the csum_none status, but
stmmac_dispatch_skb_zc() still ignores it and sets CHECKSUM_UNNECESSARY
for every IP frame whenever the checksum offload engine (CoE) is
enabled.

Since commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") dwmac4 delivers such frames instead of
dropping them, so this path receives them.

Mark the skb CHECKSUM_NONE when csum_none is set, as stmmac_rx() does.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: <stable@vger.kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Grische <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9741f97fa37a..32810f949245 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5463,7 +5463,7 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 
 static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct dma_desc *p, struct dma_desc *np,
-				   struct xdp_buff *xdp)
+				   struct xdp_buff *xdp, int status)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
@@ -5488,7 +5488,8 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 		stmmac_rx_vlan(priv->dev, skb);
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -5698,7 +5699,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 		switch (res) {
 		case STMMAC_XDP_PASS:
-			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp);
+			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp,
+					       status);
 			xsk_buff_free(buf->xdp);
 			break;
 		case STMMAC_XDP_CONSUMED:
-- 
2.54.0

