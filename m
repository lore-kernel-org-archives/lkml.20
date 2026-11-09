Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240434;
	b=fxz7bO7NTcf25K0uBozv8z2bai6Hxr9qFFs5P8MJTcuGATpC+Qfo0LksT3Moe2rtgpr8
	 4lkylHckSbB60nlWdkHw4rnAwhPcVzvoIPjTXiOAz6apQUO/GkFSW/zStUDv3DoCJQ5lW
	 HjPBnlOs5j/0YjOaVntAPVD5tCG+AyVt294arXip70jlm6V1nksW/UikHeI1Gkn5TzLIg
	 0mROuA2Az3leaIh8zLc8t2zjUcYl6v1EE/52oDz2LkonS+m6gP4afXjxWMpnUay9e5cma
	 SERymnjuMjE+9Jv0hJtawgCZIx2yW6t8IMK7vLa4m9YcUcZHvZum4wjDCAeyH8PI63Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
	b=gHawz7nROW/2xsUJKi96rkDmsmdfNgPNAyst2ZExDIikzqj4Nbl3q/Zmpi4LuKfzynTB
	 huLoj0DnnjvB+bF5pA2N3+CVqMLIabgIJJLp4Zdm4uVFoCrPg0co+cB38hQYneOoWuFRw
	 HPSaGQLrYn8sW4TuyjhadRvLbuH4ZyxSJUzVAWv9ROnam/tN2VFcuGZq/f/DPH5ERqio3
	 xXkOTHYLtIBUBuSqswwJVNlDhgUrXd4DaPY4GeepHNi9iYqglvHmGwgPQhTN/Jt+Dxdaq
	 VlmrN8fbNzoFI2wNducXbSPysXReImND0yHM5dspgZIl9XaIGjos9WlVJ7mhMs10vSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsOJVKWO;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2DD606EE81
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2DD606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsOJVKWO
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12893385e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240432; x=1794845232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
        b=PsOJVKWOXFsmmhSSRVgz48PowWyv/erowuas4M5LelsS/z3b/xxveqOxWVmVXMQWBY
         bvtwywdu241mVSeNTHjVRm8/GHyMofq/TYEV92ZTorOuLCL53pRmVziEJZXzxF2GuYvc
         jx51DWLr93Zqfy4HkqwuYIWJvCCMrmHxBaw/b2rTbYtVcwmbG46gU3iK7utH2354Grds
         Qob3QmTOoolnw9lULm6sl4dVSfYoQ5mjj9W8qj9UzsxEfzDVa5xH//0IOTcm4KinARoB
         Zay4ZXjeJfKaF1LGqdszAdJ8CH1bJQB13Qqa5op3jBha9GvQr+fYfHTYE0oi4Hq/6v4a
         T5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240432; x=1794845232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
        b=SxbCb5ve5opFaFcjMm5isVf7kh4RTLJ9uDm6CNiGOEssxlkIYFv3PkCh3bhouhzCC2
         NvRNVlMTYA5Y9l5Q8oFpm5BQkF2uwE8yJVbNN20G9v8rV1Yk78jDaDsnUaoC40SLbp1k
         7U9WHp5BBBAWWnxgNCyD6s4bX6pqAGMnUz3hltO5ACzWbByZf12UrNYgHl1Kv1W7QHIi
         ifafyxsen5jJmxzUpRxDD1BCYlA7FD0CF6/i9Ok4PvBcz9XneKSzokDqUHS95THEB7yE
         IFI9HZHL0A7TfCJ1ayxzOSnAPhmwM9/AltmbF4UOgb5d/8MabTfHhzLU07pBadasN+wM
         hd5w==
X-Forwarded-Encrypted: i=1; AL+hErGRwLjKX0uvdJ/AnBrFNLOEyMZpouK0JDV1aAvm+8AWs0/IOohXNukysPlBjEM/L6sjEv4iYURqN2yEffc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tP8IbOZrrJ8Q2KgiuZSVtxGMgPLJcT10o+Dj49s9M+t8V3bTQ
	x4ct/hLkZqgNllItYJx8AreHFtehA8wuVNeJZAY7JvxMli4MLl7CW+wa
X-Gm-Gg: AYBFou1f6FGdSYXxb2fnw1I1RPpGKZk9G3rjwk/PtvYUKERnmkBCjIkIT50vgGFuWfP
	mQrfZEcRXplFu7JhrdgCikzRijcYZwHSbXpEuXpDFHvLttbndrYbxiRUZroFXabBnBj+oKtQPyC
	/jgjD8cKAlMp+hGB6nQX2f1Rn4vO3PGjYYo4fx4CnnIbxJiz2P1Q5x3OpOgVVvPnLX0sKwZZVXm
	wD8NPf8dT14ygxHMZiVVkY9flXzKTZfD01q1a8UCuvEUoH+O3w/dQ2UotXi14ay99CDzb9g2ann
	uI5iLkCAn6c0imnNODeYT1EoToPPc68bpBjpgWg4QBJTqhH3BeFqcwh2MQa53v0oY4S0QrOytvH
	1OsCJGk0arjgjsTdCE/QSXKyQnh/+MOZ3kj2Db1+GmEiaeyF0BQh2URP3l/C5+fyb4NZotIup1x
	4GKz2WH8SoXOki+D+1so4XtMX/u41FmqVxxe4dzQfLFSsyXplMiWFJ8livf9ZQSTngUd6phm6lS
	b7SWUTpZVsQbg+xCYVQNfcKZdsu3BdZlL05nejhNfI2QlS9Ji/eqb0EITPstSfYwkBmmU5RXKdU
	RbVEnCgb7PqoV3VScpEshOU3xEyK3Ua9Pxoxgh07u5DCRPNBzWbw+z4Jx0fOeM4BOUvzYOdvZAI
	+ekyAKdl7kgR5TkfWKjM5K5YcvTW6FCiKkQyXjwWSxg==
X-Received: by 2002:a05:600c:34cd:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b960d9c587mr81960605e9.3.1794240432064;
        Mon, 09 Nov 2026 08:07:12 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:11 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 2/3] dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:05 +0100
Message-ID: <20261109160706.2272332-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109160706.2272332-1-romain.tisserand@gmail.com>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
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

The Miyoo PocketGo S30 handheld has a 320x480 1-lane MIPI-DSI panel
built around an Ilitek ILI9488.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index 016a573893b7..2908808393aa 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - focuslcds,e35gh-i-mw800cb
+          - miyoo,pocketgo-s30-panel
       - const: ilitek,ili9488
 
   reg:
-- 
2.43.0

