Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268114;
	b=HfyS9bgV4msVOMFhGenORh2Sn15iTML21A2Unq/waMC2P6M1bfB0eH79mqth465d16Kk
	 HarxaMiDEHBYgV2bmwd5OSyAAtlKiintsgePxR3UD2u9BxSHFSFqx3nocvmFZoIGa6yGS
	 clv/OM8c6TXmfs+rwtxFVYRYzHOW/qZpgAgQGTLuusLLJ6MXR5uFleXBQ49M0niRYjk8n
	 57VaNKWMq+LfBdwso9y115Z/rA+CcvktaoQDzeGeeOB97rqkEMWnh45R22ed987aejqNh
	 4Tudi2E7gGYP/2Amkzbc7hFpy1hjMnfukVOn88iFCnYjhAVXK0oc22+uCVDcdOI/Ihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=6QvI65ANWFLjHGTYP+BpY9IO0Q+Q4tp1M4hrdUa1hfU=;
	b=VebaU6skYEGDFHwEtuaQ/mtjoNvisXcHovMak6oOPSP/rEm3fkaIV9GQy8o5nhoAHOOv
	 ITDUIbv9po06g9/koMGhKPHOx9/0QWescBFCOyVx5uwoEwqZXikbrthG6RDVBwaHei9+h
	 ADx+qLwPSQGBAbJeSnkVMnLF41Yhuarz2EmiMW13ipA+2BBBTUR74QodQbDkqUCNZxia0
	 LiKGJcod8jnqnzg6sz9hrkB08HkK4j4lCRTA7OcjL5jMXsAZ4HPCBSuldE0waHp2bipaR
	 AFip08wvGXYSrYrVhtu0VvLnTA589hnvO2rz9WRRd1UpgyU7fTzacyuQmqtVLYOUwHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IaJnxcRe;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F560A2626
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788F560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IaJnxcRe
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so853206a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268108; x=1794872908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QvI65ANWFLjHGTYP+BpY9IO0Q+Q4tp1M4hrdUa1hfU=;
        b=IaJnxcReFcjgbLmRyjeMXGhrxzGN74eb4PUsd7TeEF4qhGuPX54MQ1RvR3Y2zlSAcR
         Bqs3BrDRIVjRzaL7NOmAoXjdP+97pne+H6IRbI8gRC1uXqOynbhDXoZoDYRcorIcMklz
         07VcOB6zx7//NaAfc0sCO8UE53sSnRa/AJjxLQhEE6sTwMW2PZzJ6YsOVB2NuybiA6i1
         BPUdWXlnFMNFL3sDgXArYIDsPMBu5YK2QmPKRKnkGR1YN3YjmSlF7PoQSzZK7bNj6Vd1
         XDPczPdNIBJ2vjhNM7o5eI/8zwNvid8O8caSdNg8BLRvW0I81Od0l0iCYPd4Zzxbx5+6
         5uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268108; x=1794872908;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QvI65ANWFLjHGTYP+BpY9IO0Q+Q4tp1M4hrdUa1hfU=;
        b=JRczguijUbcG6OfgPT9JpnhyMe6Nf1LOc2X5ss93J7jIIff4H0LsKpmUdYI6JXAUIr
         /gwPFB+2hGwrbf/beX6wlvR/XaLtf5IdpU/k//SBu1rHFgWPMT90/RFgnv0f/NeX6/p2
         EwCO9XjlmbeHnPNHt/6kSpp02pFurlVBnHnKB6gNxbo4xpg6DDmxas/BzNFXrKDZBU2X
         7VHYlnbZY/68h8vOkl5hK4/QCFvonG3Y9d3Gm7f+FkhGRgfrWqunbnfOpwWlRdDi+ohv
         IrUAtO+hPHCAIM/BXBHTKmneItLEbbcazpIwdNnCp6QjAfx/7x0BtLVfNVS0k1UeL+xS
         4fEw==
X-Forwarded-Encrypted: i=1; AL+hErF6Fr1fwaYaHLHM0SHL65tfcPFchNIxcwPnrTbOYpoRznmkW85DISffXygx1ruTjyKLSClC9PyFcsxjQDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MgkiKASk8hGAdgK73EQvJIYnDMx/NhEmVxmptF2Ynx703G9Db
	HP7mZamndZVZ/LydzYbGIwP9YpdXOhy8G0/G8XFeNYWaTUJFuaTDRJSEYRLbMZ/U8IUHHdCUgaq
	GYgnYqC4=
X-Gm-Gg: AYBFou2WSBzB4e01orhStfeJ3Pi2dgoKK9ZnVMWMobI09OPBBDqTq7eY3H6sBuOmiAz
	STjCjlotdXWddAq9/jkbID5oNIMjyYsA3YVzPD6bSvov90Ttm1EsHn6bTI7atYecyI4ySaqUqHU
	71pJVqdINBJAt0iMSJWGUxjwpmdFP7X5s4sTfsaW0wA6F8mC4OCfQjvnt7t4d/YBN/vPtl5Gu50
	xpAbu03JkIWwQT98lgQYRor+V5jrDYupdnYL3+24xyXg3OJse6dD1GAdwJgLk8lg8YfgaoI/xye
	c1yKkVbn+tGEU2h9Xu8PXGIhccU5ScrKDjDDku7M2KyPBJmIOjp/QWoZ94ALbeO5U+zOzsQjNNs
	MA99wy9WV35vBAVMweQn5i3KMffG3jgWxX/+kigBlpsyI13m8QHCD8hZXN11gb8zw2EIJitpa+D
	sZqVzQG4e2/dyOY10tdZ78bk6lmY23g+iGpLbkDQ4D2/2Zu4snfsKr8RvGxt0QUyYte5sJb04AC
	n+2tBklJ4I1qllOoK2bvJLVFr72SLlVXeT3HaYDcum3cwQVP/1lMFxvxW1bPLLMeKEwSQAZNtF8
	+DtLIZXHO0PgYkl7pJ/XfdjF
X-Received: by 2002:a17:90b:1fc8:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3b166ca430cmr1173151a91.29.1794268107865;
        Mon, 09 Nov 2026 15:48:27 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b1676e2974sm1411179a91.9.2026.11.09.15.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:27 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mithil Bavishi <bavishimithil@gmail.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20261106073219.59785-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106073219.59785-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: espresso-common: Fix magnetometer
 interrupts
Message-Id: <179426810659.2265990.750430446710445234.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:26 -0800
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
X-Mailer: b4 0.16.0


On Fri, 06 Nov 2026 08:32:20 +0100, Krzysztof Kozlowski wrote:
> Interrupts property takes a number, not a phandle.  Passing the gpio
> controller phandle made most likely the interrupt as broken, which could
> affect magnetometer driver operation.

Applied, thanks!

[1/1] ARM: dts: ti: omap: espresso-common: Fix magnetometer interrupts
      commit: b76bf201e56a9c7df1a64bb9388b654cb6a168f8

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

