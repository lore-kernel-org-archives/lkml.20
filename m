Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714486;
	b=LvUeuo9ce9ct/E9mFBkI5H/8jZbimmpubakzZpzfmKjcj6ag4pCfPtd0jtD4IoeYSWEi
	 oHuGpzKQQ/bQ8EF/gBO9FeX0Bg8LHl2p6kH/8JBoaw9NqsG6ih5NQUQJLkcpuuC/hVwOd
	 xvsa40sJ5/4uERbf88K52Q/3cQvO1KyyYLxTR+ryWwAPTi48xxnv3tPt2DkKCaXBc0lQH
	 Wo7s6rAcgc9Vsq63Yo/iiHBfBfXXth3T8v/B2L9uwD8CjJSSTfFTBdh63AnR72zrrX6/n
	 t3GJVgMF06dcVSqNBMslDB0N7YN5Jzntm+HEuqg8e9pFq7YFrjxVmXEhW4kJ3a2wJtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FOJElCsJejkEPEZ90UqbExNeYAKPE4lqsiLwiXZew8Q=;
	b=mgxgFQOunhJBf8RAGV438Hul54lzB5lFMP997CNVZkqdCpL2LOEFdKwR6bp54Sruot7K
	 fO9bMuLH2nH/f0KG3AvV4ZPK058oYVauJ/uKjw/OO8JjdzjUR8qqu0iv9G9lxfY99d4cc
	 wl0md1dlMuQj7YCrp5rpyQKLKkh+k6zkBtCGFij3/jqPlO6h4K88AkSZsBR4+XH5zVLqa
	 o14IbZhJKISQzvUFTQ81UkZOCs839BZn4LIO1SNL11fzysnKLv2InyLoaR45NHXH+94MA
	 I1ZlbknsVNjx2/RK4q7rgD1elT/Hu+zStZQF/lRu6r8V42mPgwInUC27EdanGD1vjsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0r46OshC;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229C6082BC1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5229C6082BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0r46OshC
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2196905a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714485; x=1794319285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOJElCsJejkEPEZ90UqbExNeYAKPE4lqsiLwiXZew8Q=;
        b=0r46OshC9ZV5MWkCyNtQ7yWQaGZ4Rd+LNElvKtplF8X6C9dmmM2a9+NdTcha7Y9QK5
         3/cnsN+NThTqOHT0jcstI3gbyuX2XaqmlfytQuSmrfkjQl9RjUAEs2kge5LeBLy7JcUU
         UIlsgTCjd4QKtSnGZDoTX1cRagqjtuW/UgxcMIIESxeWa2Xw1HpLaMgixTWO2GEqbMs9
         Uoqo46zupn3coz3a8/XPS6phn4+zSKiYuuxwg8twEJXl8L2FRTYQcqjxzzp+W6ClOaEw
         zhsnmFEspIfMMBPpf3GjCNNR/oL+mOJCnxQS0mh0ikyG6Ei4DcYqz/lCuQCffrUvMhkr
         kxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714485; x=1794319285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOJElCsJejkEPEZ90UqbExNeYAKPE4lqsiLwiXZew8Q=;
        b=XW/GS64M5g71je3jK8mIg0hGVfDau7VVeLHmzDPOlpL9iS3iOuakoJedRXb/Q24I40
         /NeTtsYInwNuJ4mix4Q1mwP82GVe1hqk7KUZsQbjGTB6byY9c0bM4KZOGZegIPEJmHM9
         XQaJxGjwehL8KOMsjCrfUqTsn3ciaxJCtP2uS3Tl1X3dvwWTt1E6OMIYD60IvPSX5MUs
         g1oOV4p2LJCilFFkde3LEv/5x5q/OMLjpFM4os73jI9rFSEXeZc+WGR0TMNqTpB8JmxQ
         oEPG6lfUOoTHEEBSEBAXYSRuzyzkguZIT2r7KFHgf7o3j1Gb5cPbZHjzatgZzuxc2Qah
         1w5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxtj9q0w5n4CSn4ejmSzh5wEkxru2677Czf7/5xqAoJEfZhuqulXcyBIdf9YbH2AKX5420wLr/WCegUhXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z92NQIbP43cak+LYVLPB+peEZ7KvGHsSmtI+u1zlhLiUsiRMyzR
	chiobuMx5A7CjqHVXkPRos6vAoRLFUOHrwJrlx0/jUOUuNtgiMgW2sDx
X-Gm-Gg: AYBFou2QnN+IYM7OIutKb+tVasjJUbysLD+5tdhWoBNatOpDw6ZlT1M5bUzFqIxJjBy
	aTsSU18V2WLJk5oSSow1lrDPxQjlQbgQVZsB0FZGc8WQE8tM3fXforI5L0TsG5r381EA8RKcWS3
	hJsMPaCmO/XI7woETMLlUsZRj7EHA4G34vDFf18X7gkzxRYEEZDnaEXn9BvaMFRbuB7T/JXQuXr
	pLmbfDJLbSo1AeUncVN5+DexCxjnkGSl7OdebPC6YwYktamu98gP2njyg1L7NTOfIm/bNbm5Cop
	ETpmBYSRLO0guH7X/mlyMplIpPG0UjJADwJIG3dtW1UUroyPhwEoVZth4bLhCyrTEFBU0PlBcDi
	CFR4nhcZUCRqaDDXgjBEzXYBnFW5l5wE+XZfFjXmjhAiGs10LxqgHaZUgY8RccKuHH1tX52yNmf
	Cw/DcpFevaSypK9mSiz9zpR6vr/Kg65yRjRmXu1PdBO4Jao1uEIFMS13c793YSI80T9JRbxpFhV
	nIEROwf2keXwF4WCQE37IpWBWSsH0RJsRnflkfZmEVvRZ4XU+7um5/9dlQtoj2mUf5ZW1iHdrzo
	5NWWs+yi+7uzUO1WFz0IYrR1dr+I0i58djq6xiyEyeouCZKT6Iy/
X-Received: by 2002:a17:90a:5d17:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr8029410a91.14.1793714484068;
        Tue, 03 Nov 2026 06:01:24 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm4722104a91.7.2026.11.03.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:23 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/3] net: dsa: motorcomm: Isolate all ports during chip setup
Date: Tue,  3 Nov 2026 22:01:05 +0800
Message-ID: <20261103140109.874443-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103140109.874443-1-mmyangfl@gmail.com>
References: <20261103140109.874443-1-mmyangfl@gmail.com>
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

