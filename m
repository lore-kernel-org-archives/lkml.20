Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816482;
	b=U3Ej5VmSnowG4GKFlx5DhYsajtAq2TdfB9Gscc3xz5OmOeSWGFTf9ojAGzNeas0jft+m
	 a90UlCo0VoZtzJf7qSN/PnS9p6Bd/E6jXxns1TjJDTFb+ijM31oK3xu5+FmTVH42M141o
	 SnYpFBtKLSC4JnvNSGTrFt9wDet4uHew6Pi7MZE00j7Jl91kKuLO0jjYeZQ+/0jsKB00L
	 uddaZM1alczhH28HwZRJxjP30QpLeOCx3i6TyS5ud2DYYiZmUziwvdfztoXv0rNNLmXL9
	 VwwDHC0BfExyOHBlVE/pYX8TZN6/g8fCiAYUHWDQXemomGz5ldpIxNWz+W1sHYwDbRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
	b=rrRwchaAn60EeU1lZlUv3KlIeO97xnhdvG3/FfBspJR7GWQBjLvWOdvVCdbOL3XGCm/8
	 grIfp1+ZD8EX9dKpKPo738kkCfdAM/peErkjsdcuBna4PlbPU3GuWv2lfrUJ7yjWaGHZ/
	 mYbakGngSyzQ88/Re9APJpWw3EId1Q7Ahm+1vi/LrGuSTsO2uLh1BywN0lQJEGDPgNBhI
	 StVR7T9hKSIlcK5DMYUCvdRvOKwD4p+tx+Kf/6kKRV3fzeUhcHa8lZ4NqY2a8h8eSFBp2
	 ZOwUB54QcUEiHY4jIVwqmTCcB3VIbrz3xaBNSAIu1alHPXPoISCCatwDuRcq3achlag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5corqjg;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7183D608362B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7183D608362B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5corqjg
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8121675e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816481; x=1794421281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
        b=B5corqjge8lxXP8hH2NNrMFHeSd6tqG7U2fOuevHtZCjzKMBlC7wko1wz1Zc+QvhOW
         GguDbv+6DYxVrQ2PS/Jm7KIIO3enikMFBRIGGeQGI+VXDYF/+22Et2ITlZVCVop7/Nxi
         6AbajOlVqPIfVFAQKhBq9aQ5oTCoRFpSN/tJmAvj7/jbDsjVZlt8h/xdSpCHTYI/xjEl
         +tLpuLQC6Ww2S/IoslY7P53atZ7Ddl5Wn3gpNf2ERsj3Bm3+7TTCvvI5gfYqMCWp4yQr
         LVWmEdX15TNTKJtr9WGw4n7yrWCe7jEDT2r68j7+9XKc2GoRD0NpHfddYBrUBfRig+9k
         wjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816481; x=1794421281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
        b=aELcctVDc1QvdIO0NXPNR1MxTnFd6ve2HR0zPOxEdL5ao4B7UWTIEWXUMAzvlidFz1
         HLxCdcY6kgtpV4XsqebW75nvU40/koB3zFWLVqOonrBY3W0NiUeEHWHQ9ar5z5FsbcsK
         IJLWaHjSXvCUt3GEpEV7ank471533dSTfScxmrwE9viCAbqvvwXiWjJ8Q90KakYb7mNy
         OcYp1MXYnv8rulr/yOLpmUOJsIrLB5z/GIDtxxr1bpCzCalqY4XrWreWeUUcYC8K3EMg
         NOkGchV0Y+dlIO20NW9K9dFYDKRKXwiZ5NCYIwLSHbr0N6C+8OtNI1wqjy1ZFgfTOdMs
         nNTQ==
X-Forwarded-Encrypted: i=1; AKwUvByWi6SLwkRqRo9qUIkwkWbBiMDSwCqrsanaM7rRfGNqSpnU6B4I0DISvqgRXBoCy7ALVCBAc2x2WbSebUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RUTq66xAsgV6INKItINtt25AXlIIY2K074BiRV/vnPD5/53kU
	YdzCCQ/dD/UuNEY2S788eKTnIaH2jdPa6kamQnu3vajslVadgmsYOaHK
X-Gm-Gg: AYBFou2KR01Z43FKJaw8SxRyZFBXAzytV9SCHmDzuPA6bBZ0bOQ1wyWymydLAvBkqnH
	qi+NNfZlUsM9oiFyvsZzJLczjHa+J5Y4pA13gtRZNrFeOnmzzhExtIK5bnY4odJQo41d2VdQvKC
	h/eErwTFPnQ9Q7SE2OqvG+jefBCUxgCJKM19vmIc7UKALUgxqfUvSZtpXkKtH7We+eHN+PwENMm
	lT1DImUcQVTW9VLH94qX4Kw4H6o0zr+S4a4fVg8d27d43g3Qqk3W1bZvUanzUbzUCzAE5jIyl8z
	GASzCRt6x03vGXF6wP0stIcPL6AJvi+vfDjB4vhohnUWkC4llnVU/cOuUp5rkKr4kujxKXEzaMI
	rs0PRnKGnWk+/E3sWelET0MTYD+T50DAeiiqUxs9qN8sztX75e/5Q/m5HmW/37fjG+Pc+hokwxT
	HQvg6Rv+orD2YezdMfBxgorNdWj6BUNi7WHQm6K9q/zrxzsd15Qyaeu9yWGZ9nDqfBh/t6NRHgb
	rW4TB9vzhLz+vlUyyv/3kf7up0jlqwLEMorOs2D9UQqbDVQLA/mW8IWhMuyWmRypGWDbTC8OpMM
	Vs1tymLoRa77ZW5nga+DPA5Yrp7zcq95qdyCPRln200ElBN4q1ObEr9pnXW5tfWPCar/FpcGPeQ
	zvomdPVzS0uYiBz5YlaJMRUhDE2lxtv5m3CyXlhK2ouXg9218LgPX1+ROLo/x
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4ac1932a23fmr387484835e9.32.1793816480738;
        Wed, 04 Nov 2026 10:21:20 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 09/14] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Wed,  4 Nov 2026 18:20:57 +0000
Message-ID: <20261104182105.1102555-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace dev_err() with dev_err_probe() when reporting failures from
devm_clk_get_enabled(). Clock retrieval may legitimately return
-EPROBE_DEFER, and the current use of dev_err() incorrectly reports
such cases as hard errors.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 846216f22bc3..bdfa84745eda 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1234,15 +1234,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
-		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
+		dev_err_probe(dev, ret, "failed get hclk clock\n");
 		goto free_pcs;
 	}
 
 	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
-		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
+		dev_err_probe(dev, ret, "failed get clk_switch clock\n");
 		goto free_pcs;
 	}
 
-- 
2.56.0

