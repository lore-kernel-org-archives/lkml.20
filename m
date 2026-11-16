Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830540;
	b=2THpTdU3aa9/yZ8aCa4mLnIiQN+VzbFmIHMqSde2yxbM0xZ5Q5ulZIveSbxKgOWJ8c0p
	 3Fc/vQYW89MIr3wiBstnzYWSeFqeiyFC5y4b2jd5iin4yQONNxgkN1phlnOagGF5O1+OP
	 huIQmJ4HzHoAxbZI/Jf6vqV8RlilEf3qkBhlCzvVqLT3vam3AxiuYy4IyuPK/VTUbNCkS
	 l3LSrtRMObrKFqXbQpM1xn1pD8kPlgOkinumnXx7qF3b0Soga89ZHZLtxDC0WptEE0hCc
	 vDyI6i6BJA58QHSdEpRKmSbqnoP6exfXq8/nJN8BS/GG42FbKYEZL0qFi0rwKtctZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nh6jfj3FGfAPsXqZYuyunwaADn/6sS4BjP6Ar7TjIck=;
	b=1AFqfjuusp0YyLVz84PPIaBdsp8/qLeWxSRw8BxCpW3PSmpE5FCpDeZpmX9YqiDHw0x+
	 K0rT9qbPbLsgNU3zfEdgd8mF/vbet7oRqfHAItPpLiXY6824beR4XKj5TklWFeyHXu+aO
	 QuYsaVwBBYmbjIJxdsIe4fTTUSkIultpzLgjj9kfGY+BTMgJbbWbWTisT0cCWXhx98gOx
	 yFKExVDsT7ibEj0E++qvQ0lLSa0bpuUD1amLeABla/zWWLZIYYP3/ivQEnHIg5ZLJM977
	 TiH6HhkDgzgU75YatoXQmYS991KbAPOlkQpKKKiaJhnUqZmaq7fDXib/pFOyDJRzUdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9EMNyZ9;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BA606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C49BA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9EMNyZ9
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso37915955e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830538; x=1795435338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nh6jfj3FGfAPsXqZYuyunwaADn/6sS4BjP6Ar7TjIck=;
        b=a9EMNyZ9zyoxMLEVaC+D8hdoEKr0x/Bp/ew18oUrnl+wmy70iLeyTKS+bnTHj8ItQq
         ttzIPbM6oxLcEcuuhswfwJx0SuLZRki/qmXEDgMnTLRCCFlXpUXApKvGDbH+LtOAgHJK
         FOR/f139RXVVJtCa23Oy9/sO+DyLehPyS8Caduh+lhF6qY+Sb6YKeCZ6JknUzkosm4TI
         uKlrouq5pg9u2j5htuo2XlhmhQiGFHSZsAWuaB0rJNNL9JWW5jon8okLd0FnXhSPdAJb
         dYDr94slFeS4mfHNBiL2ntcRP3VxQqsdNgfx4AtpeCxSfQ8eS52lc2++MNHpRDaRlYWt
         TfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830538; x=1795435338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nh6jfj3FGfAPsXqZYuyunwaADn/6sS4BjP6Ar7TjIck=;
        b=fvb/OYYk6Wv1UtSrEt+fODKecfWSaprBqJ4GA7kSCpo3l8syd+SyEAxOenqnT1EV+v
         woH/FfpnexVLHIzi8oj5R5Y1aXM0Y4elGPQzT8ai/KMCXRbnfUaDOVJ2zeN6FpKQTK4D
         w83thwWfQmOay9kiwt+of3chqonNM8+JgenSncQHox3bOHtL4omqnMGlqtDe4YvYUDkW
         BHHflo19li1Ngt0nl3STEKREbqLjoFbeazvXKghJrhJhkkYhjWE4vaJ+f1aiNnkCggJ0
         KEppxFlds3ufgtcfic/Ku1x+Ww+obLUv31DipAJnjoimpvC4i0lBaKzCR5WX6cnBGeYv
         Kcwg==
X-Forwarded-Encrypted: i=1; AL+hErGSSCark/btyBgeS5gZKvCbSPI5unP1pnlowaf/MBLAWbKQ40c6GcCiV08D9FwekxuKAKEcVJNf8660NQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kGUlv0Fwg0nzY/ZgbAqbmSS2Yh0+QOzKZRRAYxAzHpzfNTGUD
	QQowd1AoFGkaiIiKNvz6zWuq1M6pUb2WAt3oybEJbQxbHANkhaDFlwiAbWZUdA==
X-Gm-Gg: AYBFou3af7ez1ei3lNrNNVgFXeMjEbif+jynDNpMMkCS8JhnNtWxs237CAf4XmnyZVQ
	m/hM0YkCFX10hR0UVoJFlaF7AeTsiRaUazXhlhiHOiyFXOlWBuV5R91sr7M7TcLaXxzwqdMD2Le
	b80FvqVy7LtLxfmYbDLxm8UE1zRvRU8rVZP1Ta3gAhSZoT+XRbRSFHvT/HOgKorNKw8cA/HmUh0
	SlCySsnXwORa7IbANGJyzSS6VfpXRmtx6ksBlnJCdx5IZjUKAWCgHK8yaq3ZcAO8W5esHwl5nf3
	hi6RTkiLcZP34ib00vn6ef7uY1fyOq7uqTDlDi5/nu/I3Ccai8ZA1Zts93N1wQo2cpRtb1/Quqa
	2mq3fqrcN0QpORZEfKbq4C11RugMnbGDLr7NCu4JrREP63lLl5kFYjS46Rs3pnqKQhj6XOUg+OJ
	UCBG1JUL/8TQpz5cdwkYKaS/7ZYZ3u9sNXK6OhnM+jXbUUdDuT/6lqRxT/ytz8C1oHlGPbPrKEq
	oY7Udc/Q8rXG1HxizFphJJTbPyNMURSAXPq3BicNelQpjMjZ7pdS3qNsAmUkMOVSCbAoBtJ1P8m
	qdMkOD7J/YqKPotD4mRd4rOU2xfs2Zq0rZX7QK/5EsEYDwgIfKr8oNo2oDtETWbr6jM=
X-Received: by 2002:a05:600c:1daa:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb55a4ea8emr211649535e9.18.1794830537971;
        Mon, 16 Nov 2026 04:02:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm395562805e9.15.2026.11.16.04.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:02:17 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add RZ/G3L HS400 support
Date: Mon, 16 Nov 2026 12:02:14 +0000
Message-Id: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMbw+moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3eKUjMz4jGITAwNd0zQDi1RTI2NzI0tDJaCGgqLUtMwKsGHRsbW
 1AOrlteRcAAAA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830537; l=881;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NY1YQ/WkIlzl25YtvFcKwA/c51TX7pD2EXQVeDyJAt8=;
 b=zYP1Fw6njEwMwgmLH6MA5VIBOowST0gQVNGdraCi8m3mBze9FB1tYgRebNocFRiPvA3godzAf
 TPpeblDjaqiCzeNc/JEss5CpPYaEYHIxZ7bo/BoyiLyYHw/jI+JP6Ay
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

RZ/G3L SDHI IP support HS400 and HS400 ES mode. This patch
series aims to add support for HS400 mode. HS400 ES mode
support will be added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Biju Das (3):
      mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
      mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
      mmc: renesas_sdhi: Add RZ/G3L HS400 support

 drivers/mmc/host/renesas_sdhi.h               |  3 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 70 ++++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  5 +-
 include/linux/platform_data/tmio.h            |  4 ++
 4 files changed, 74 insertions(+), 8 deletions(-)
---
base-commit: cbd778b5609cd176ace3442a154bb22d736d3a76
change-id: 20261113-sdhi_hs400-5f08e5237291

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

