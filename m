Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042793;
	b=j1LPS5YAzH2Aom0oOmssB3k1gyCulE5FA+m79qt1u5lFxApvtKsLI8oY9EPGfzh3y//G
	 Np1vmwJgZeIZk69a/hmh8Ns5a6sx2DAbrLKliQ7kTzAm4fzIffPc9PunbezH54SMiQLMM
	 Uf8PG+fvsXuJVH+eEuAZIb3Z8YUYuK3iuacIN3Ijsqh6kUJRlO8NWp/QqG9jG91ZXceoR
	 BYPU6Cy6o/4fUEb3F+bT6Qscc6jHgNvWuHzfKcP3BnLMJZcDJKEn+LN5QGsGXIMCBANDq
	 JG292BmOYd6L6W5MggAIO3AyzuTqoykU3Zs0s+0pic92p/uuAH9kRF8idjE3FDANZ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
	b=22rjlymVtKfchYdpn85e3wu8GONLfF2HpJDyXMN6yoW8khM13KtbZPhxln4EW5vrmMuV
	 6bxjBnQOy7LR6IgOdSqMem+vGarYP/3+IODuTPBXKAaiGdFKO9Jqc4u0j1DdnAT7TvpFR
	 m8yP81v7uk0HU2H4Slse+CwxD+yCPZCDf1GRafJ9VKpl6zVu/D7FJShjf1mJh/35PQQgq
	 OdgRe4iil9ZW3LRKXmYkU3ceJJXY/M7eLRROG9CEnDhg4ZLWgtV6rjVSBw2RPB31mtu6P
	 DQlwoo86ZPQKBTLVDJ6hS75QHdMq7wK8Ssc3hyCj9X3tFBlupiJS2pNlYM4KiEESv4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpC+99v8;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CCD606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CCD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpC+99v8
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso2050a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794042791; x=1794647591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=PpC+99v87SaXQw5ylR+lrr5/ZH1RuePq2a1OgNLIaS38ZMR3RYdF4hx18UtoJrK7Bz
         cDz8HorQo7nEY0LPSKTZJ0+VMfpgTFB/fmQTB2MnwtwzApPlWBQJZT9bel1Pjxup3zPG
         csiFs1kIsgXuQWrnGe1KAI6bR2n+MkMHxvtZILO3Al90D21moEeKF0Bnyu42F0dO+BZ7
         9yDp/t4S/08ii3TJkTRqrxZzM5ZnmckjZKZkiBk1R0G6GorJGM0xCSRXZRD+GJSkVB1B
         GHrcHStlZaKqCFZ5DEUdZrm2zaumoa+ZDclAgNgITqhw6brOZOEC/Wex6PDojgg3fgnD
         g3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794042791; x=1794647591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBdcxSgsOzWhMK/iioasbAbzzS822OCTsFGBZkPYLKU=;
        b=sTu6PQRrEpE/0XsWGPhIPiekEI4OyyaXyLMSKiNeQt7kcgdMCTFWyb+R9w/WSZmKVA
         s/u0rgsUeacBB+psh26JkgLx17yqCuwcvY+pvBnosPyIonuO49HZhoyHah23QfggbH+e
         eFKMQ6E2qD6FdWbXMFwLKLNC/ziIhCcCOMJiDAQDzB7MP7N01BeECgJP7yJTKk0V1gK8
         qLAzxALjUQ6OeLkyWTIksZzgygfA5hgwn0iuc7TBXieo8/ASXFS65moLnqPMXHfBG+hV
         yI6p/VAiLB5v1dk+Q/u9twgxMeNT92FKYMIsXy6kw7AjG+S41aMkqtB/4ub2PShMQmVI
         t8hQ==
X-Forwarded-Encrypted: i=1; AL+hErHgsN17WxksbbJQTenNHV/xAyChf/kvFzUJ5bTDM7HMs46oxe+jkCRZYZdJ3PrMxns/Pi0rIvWYDYfRzqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UnNnPAWMWFr+m0Zc/yi0JLC7P3z98c/I36+G8oel55iR7PIa9
	r0XsYW9+57IMRTCIflKoCMCK3WH3910Qxc8S3eDXICRfBWJ3yZ8EcpPj
X-Gm-Gg: AYBFou0W7SnaQsLdKkAfnkggxpHjlxhsSIs1RfZlw2unbfbpfRBi1vjP+sWTRRjD4Bc
	VwRXubgvqZceDVeS1Zhb1uL0vudwGWkuLAnSk4t7PXBefYPICg/+FpdIT7iHqRWEtgju/S/8beA
	/w3yQyAVw0H0XR56mEFziP+fvJA/BnSmVul28VRxpKUvGDWwGA4MVGSGtV64x0aVtXlif0PkuuV
	PiyoU49mYdUHivSgetAvTLCKBWd20GVHxzkjbF7mXp+7se4Bfbpl8kYydqcndnb8cHhlRJhLO9K
	cQBcSSZQcFw+6LRjc/tSihEoHtAQu2Xa4yolB411Anrs0xHyqmJ5uQdynEov4zrxpp7wn9rgnFl
	IcrKGKWa6fQlK9qOE+inbR5QzaIADKBWve2Ok4RQJGI0kPkeJPZysqpgMOTW8A6vEfVCaRD7y5W
	Umb4SdArQhvWuqqTMLqpH3rGOEwUHyPNEna7sucsBYI4KmoSv4SuEMJ+ehTOnZXstvOJGBxYwal
	Hr/vdbRR2Pmsk4JqLLz1+FFVUn+mf+PZGLspqe+BPEs98AE+CVs+nnvysnZoLdt4e+mjwExJUyU
	B81YdEqYN8FY78Y8nJyZyfolsQz8ZgPEMN9UJeKmHBqCCTX0+A==
X-Received: by 2002:aa7:c3cb:0:b0:6b3:c422:9257 with SMTP id 4fb4d7f45d1cf-6b597805d85mr2374834a12.25.1794042790711;
        Sat, 07 Nov 2026 01:13:10 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b6e82bc5d7sm1405043a12.13.2026.11.07.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:13:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	Roman Vivchar <rva333@protonmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Sat,  7 Nov 2026 12:13:02 +0300
Message-ID: <20261107091302.16545-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <au7UMdlP9O6oo41i@buffalo-ssd>
References: <au7UMdlP9O6oo41i@buffalo-ssd>
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

Hi Akari,
(Resending as plain text, the lists rejected my previous reply because
it had an HTML part. Sorry for the duplicate.)

On Sat, Nov 07, 2026 at 08:18 AM, Akari Tsuyukusa wrote:
> Please give MT6895 its own "mediatek,mt6895-wdt" compatible without
> "mediatek,mt6589-wdt" fallback. Its TOPRGU reset support can be added
> once the actual reset layout has been confirmed.

Thanks for the explanation, I missed that the mt6589 entry now
registers a reset controller. I'll make mediatek,mt6895-wdt a
standalone compatible in v2 and add a driver match entry for it without
reset data.

I'll wait for comments on the rest of the series before sending v2.

Best regards,
Alexander
