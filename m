Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675E372B58
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437786; cv=none; b=CGNrOZzluxPpVN7lEmNxbGraO985W8XSnWTE89PzFYa0y1RDYtOsCYjT5MkGHjFHTyozyudUeUNGZyy/dQdysalAF/PKla3YJqs7vi14f5u9NK8qDSNHfkjo6Il4ShNNqdrTq1OWbUlYi2ymEyK/t1XGbDALfEvrgeTo3oLrrck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437786; c=relaxed/simple;
	bh=Fs1fLcJcakNPYti2xesmjolkKKjRCOnYepmgSWO4EZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukKywv1v+CNvSYFk7dpcLXfMTI4r7+J6bXLD4TEH9mKGHWpdc988row6Wd6orOSG2LOiDDyGxJVzC1KGVFiYqt1e2rgVKVUY1EtiMJxwiTI7SkKhxO/EyxMbJQsuhAaXm3z9+5Fqsq9fZy2wh1kLKq33IdyIkKAAE0xG3CRHTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezwJTl+8; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezwJTl+8"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d752864e37so339313eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437772; x=1791042572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgjZN8ALEfDluGPl+zvIInMEXTqsuH7e7EhuIKCn+Ic=;
        b=ezwJTl+8XDy6ICdAkHU/Oz1I3/PWGtlErLyaBdFVE6ig6/5vaU7gLAQTbh3nNBJcLc
         44BioCN6vLGK6fDOy7e/CG4DyWy4RI4x3jR3155XjdL/l3G2mepIzWYESh89HVpetz2r
         3LTlIvCU2SxTvegPUS0dnvgOCO1CqTPRRDnlbHN1N4gssRNirzP6wawTIwGMnPAFV4d3
         /TMKh3PHokjkvNssBQmdcLu9o4mRyHrdqJoZwtXggI5VoG4ZhHu5m8x1AQrRXr1aWRUU
         dbsEzjIVp1d3FNiJze0BsVs6MmtD6yRJQsc5vFM6tRLeChL/4gQ2E3Kv40CDvePaR8Y+
         TcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437772; x=1791042572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgjZN8ALEfDluGPl+zvIInMEXTqsuH7e7EhuIKCn+Ic=;
        b=hcnRAbDvlJN6UumBZRsxtpCWyAEyqY6pzYX1XeQExeO0257iEGYjyv6Vue9ZqMGE6B
         RxAX/IaDQEn42sf1gIxlt2EpXvZ1HIener9ljIJg5JjLFOqA/w1YQUO26bK3SlqElbp1
         7ljVfc3xsmLzXJ9/wNTjzU6UzjmuWy1DRfSvobIA3Nt8Ou9FV/xTL4b/4bSz1ToYd1Wv
         AB0rhaCB1vrxNX402WT2md/tm4tyGDkDpheaTCM8Okh8N5+5y1HW5U8RMCtYQOf2hDh5
         jNYKgUWnifXUq+3BR8pNpsGhALVxGL4mL9BdqpsE/YxZcXdPT1F1esMR/JLDSsQNbTrd
         FZmw==
X-Forwarded-Encrypted: i=1; AKwUvBzHSca/n8LUb7w0mugdu70ppW7tn32yAZk730VbQ9D2Vvmi6Db0ST/yGtiOBnveSF2hFOweU+lZWHQZ/pM=@vger.kernel.org
X-Gm-Message-State: AFuF++nSAiVsVJHOUi8AZfUm0GVgQbQQZHjIIBqE5lZnlN3Oc/tHnAZ7
	QN+Ug9fhtI+t5KfwEljgB4RP4FY+ilQ0amHqL/2fqULQW+lsfe/uRfqX
X-Gm-Gg: AYBFou2swlaTxHueqZ4NdIb3+gl2QarkOwy0+zx73eEMU36FfXSf/MijL06G2TgSMs7
	C+0aIl+lDAaUUQVX1XPNXxJ9Y7AZMAWktqt7PeUzILYNyu3aBRtoK4Gbilplx+ZB+nfbxC/WBRM
	TwBPNVbN+zCS0jmXjlCsjbUzWT97y3YPH8oCDy53sqE/97kYPZUCw4Keo1rTiZItl4MeAVcYwB5
	EmABxS0EmkKvgmBQaUXv45EDTfBPxxORGo3OMMVbjKWALLRH7bttntGq3FASgX9uipEOP3NVsgP
	udieZuu8azHfu+kyu1ILg8Cvs3+nCHlWxU5XxBfPeUIYk8FMXz6d7S/KV4DRzbTaG2K4DRFDFny
	bnUeWMk2HFijvcPf//kf7TLcE+Wr1RIhHZy9RuBydo/FRSCLtrjPoSsVb3qbij8Pi5zMgxZJRcr
	cVhxfXJwnXsI3JFcBlechSqIDA5kxNYeY4mqUJ6GYUcwxrmqeIunXcNsTawO7OCWmwDOb2Fx+21
	/4wH8DjSY8TshVWTlxg8jS9vZ36tVVxSKi3YCzHGBGJgPNo6vnZ2HahEhHFMO0ugGP/bXHItDYE
	29StBdVydCjL2xcg+b7BSnHwAOanJAn6BgdBPMF6k65cb4KXs1Op53RwfllyiLgtkQ9Q7aM3phU
	SglRD3PcarGtlqAK5auA9bamXRZQEqCc=
X-Received: by 2002:a05:6820:f02d:b0:6b4:117e:543 with SMTP id 006d021491bc7-6d43f7a6d39mr9544686eaf.21.1790437771939;
        Sat, 26 Sep 2026 08:49:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:49:01 -0600
Subject: [PATCH net v4 06/15] net: stmmac: leave the datapath running for
 normal-size MTU changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-6-ec1c0250b3c9@gmail.com>
References: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
In-Reply-To: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>, 
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

Changing an MTU at or below ETH_DATA_LEN does not change the receive
buffer size or the MAC receive limit when the previous MTU was also in
that range. Do not release and reopen the datapath for those changes.

Besides avoiding unnecessary hardware resets and their failure paths,
this keeps live AF_XDP pool bindings intact. Preparing replacement rings
before stopping the old rings otherwise binds the pool to a temporary
RXQ and consumes fill-ring entries while its current RXQ is still
active. XDP already rejects jumbo MTUs, so all supported live XDP MTU
changes can use this path without preparing replacement rings.

Keep jumbo transitions on the existing reinitialization path for now.
The later ownership and rollback changes address that path separately.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8b0bc7c46df9..bdebc5bfa2b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6166,7 +6166,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	if (netif_running(dev)) {
+	/* Normal-size frames use the same buffers and MAC receive limits.
+	 * In particular, do not disturb a live AF_XDP pool: XDP does not
+	 * support jumbo frames, so it never needs the ring replacement below.
+	 */
+	if (netif_running(dev) &&
+	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
 		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
 		/* Try to allocate the new DMA conf with the new mtu */
 		dma_conf = stmmac_setup_dma_desc(priv, mtu);

-- 
2.53.0

