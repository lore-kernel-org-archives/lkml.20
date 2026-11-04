Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805569;
	b=jGW5/YAI0sAIsobdXXby2VMjOuf85QHoadRcuYHv62GPu5rcRJqNoJxvNMKKTbtNNAXO
	 yOcAxJ8CNeGLuXYVTv432hNf7CtvDlbAV/msdsKAIuPmv0ifBC3hoN33xnU7olzDdmYvq
	 yGMq587kO+mqFPvcIlVIS4A5Tzr5BFXxAsNNrA6yoqBuyb17LHLNjbFrpcq6X6vKhOJgf
	 iOVoOt1sZ4nChYDfkWNSSU7hdySsY62PvV9+TojDo6zwjVJMepSjI9hFBRZ+WC5+ZlR6p
	 ZGmf3c45K1LlFWsNv69LJZN+bJ8n/Hvt7RmVUp3z2gJC19ahzrecE12+f2Gz+cLaWwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805569;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
	b=L88vaCsV8YgT4ZAeCB/PAcOieMra/s9kYPzr9U+1zV1itD+elJkJLY4jfn13Dk70lN85
	 alyRwlH/L5uQs+rQSXEuJ+7JvCaqbDNXhlevt0JV9AxczcrRlgldyjlvd0acxz06I7a19
	 shyKaW6pNxUT8v5hTcNDPqstm+B0CiS2nATQiKqX763UF2TW0XOGWCipjlMLtVVBdkM8g
	 D+cszGaL0L/stGy3xEDQxZTbVSMDPOhJXx8JFIbcBKnsDgYmX/S4BpCgVOlcPLpAjbJow
	 YHbCQYl2uZ+Ai1QmYAP7wjJsX3dfpjl+S78WuA0u+P/7VeqXv1udl2bn5TH/8OOeLEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE20606EE99
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE20606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490d59c3edaso163398f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805568; x=1794410368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=zmbU4eL9Oe8f4452TuEU0PB0aFJvI2v2FApK9Qg6mxM17tTKYiIUqGEPPXm/nztFnF
         DD3FOBbsjml47YlqGhTyiLsuPdN/rtevSmOLjzJLwQfyiTx+ntvdCbseVg9qGZH/BFZC
         cDRu4seLaZvvv5ZquPJYsfevt/OJoBB0+EKb7tynZEyDXcPLIbS4J/IlKxhLaf8YEmD/
         fQ70cTpqkg2/Kcnx6qnQ63gvPiMDa82J+gwcXLbuKEiT6SltKIirUdU6wbmoQZkb72xn
         azpxZcRgxMTH8GnzEBnVMsUfebBhQfS8xwIT5WCQtAet96k1VXq4lI8dOa1xlMfRq1Xl
         ueqA==
X-Forwarded-Encrypted: i=1; AKwUvBxk78y6stykVPwuDfm7C+RTc8LAAlRZY4JyIz02le6oRgcguzKr/e3SPiDvNJEWzv/7mrjaTQ6vUh+WUhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5ZbRF3+ch+C3GAy6QnwCI1Cqc0pYcYVSXRncBwgd73tWquz/T
	36FkPDFet2w5g0MFO//05le6smyNeHnwhNTS8i6LsZOlB4M36p0bLtnW3rFgtMCE24U=
X-Gm-Gg: AYBFou0feElH9VF6c46KPx7Mxq5Te8SiFRbYcJ02Y96BaJ8Wws/+Cjyg19lAFxC3J3r
	m0nqI5RkXlb9wuYpj2VXcjMJYpZbZXOnGP56kVPJgwEniOK/ELyRyayPygZAJdWjwqwSriW3N3i
	eVkdkvBO39mnC45d/xM/wu9EJDIC/7ua2QXLYg1h6xHAuCwMofIX1IaOFygJPOOWopvdc9Utd0U
	erLAJiLqV39v3DHXIIsjuiF8kVglKfo0SXAun3u/joD+/F7rrXGzlvVi2t6dzBkxvkGjrb4VWxr
	fkmUsLeQiNu/fJC0jUjUx2GCVJdnXxQXnnMiOuzBJ1tp0k1rjVQJ0obXirxwh2U2+oKMmVxCXTm
	Jkgruyp/7sM1LtwzJQeDDHuN6kIuISox4sWF2ITvOqDnVErhczf+HC4sCqtnzEyeSk2Z5mH4bwb
	6G8zVfvYTKBtDY2O280OS6lTB8wKIccfVWDGm+JYxjlEGlVnugQX6Tne0hkgRbea3TBYsbDoOBs
	HbzqMoB3VY4qcADFswUVw9zW1ZO5OxuELKNmIiIvKWZCsvJNn8b6/Jt2Tkykv6cRTK29YMpT9JV
	M4S3GXFBgRHbuJdsSu+fvfVj3g==
X-Received: by 2002:adf:e18c:0:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-48e6e2c1d83mr40340920f8f.8.1793805567922;
        Wed, 04 Nov 2026 07:19:27 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm4639812f8f.19.2026.11.04.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:19:26 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
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
Subject: [PATCH net v2 1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
Date: Wed,  4 Nov 2026 16:19:11 +0100
Message-ID: <20261104151914.2651241-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151914.2651241-1-opensource@grische.xyz>
References: <20261104151914.2651241-1-opensource@grische.xyz>
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
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7ffed295eb14..3e5803db19b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5547,7 +5547,7 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 
 static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct dma_desc *p, struct dma_desc *np,
-				   struct xdp_buff *xdp)
+				   struct xdp_buff *xdp, int status)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
@@ -5575,7 +5575,8 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -5789,7 +5790,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
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

