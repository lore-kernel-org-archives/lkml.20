Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703928;
	b=1B5pnQQ2DaS93z7ABA5YmS7yfppCiH8klBEzlNAqovidUe01SZlX/NVVgTnxf/eStck2
	 FzQ2cV1WC8rtGLGPHLIHnY4y6XO/jpzkrNs7SZNqczZe38hl1IwqrcJEkOCRBnUEmO9S7
	 2GkGJID0g9rMH4B8+4EIyKnUHTKuyniQbJswQJpNQYcU3hnBKrsXymTK2sQsRepS0O/9K
	 h73bttRjaxxw93vgguClog/CmF/x4bjKj9Kjqjf/xyS++te+Oq98B2RGeAbAMgMv9Ifi6
	 UfwoRwtRgow3HJF2tOZMiF3k4VIX00zRCSIbBFF3qiM8S43/WfrQAN0d9DvO/AP3vpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
	b=HJE+/5r5M2GhY44hlNNYuhqqJn12ap12DBRcqOb8A0H8j1oAJ4JNfUjenoVWwDHCkjz0
	 +Kj/rNn5hgCCp1YI5xZbS0e7DyeHwMqBd/QOGASUvD/F3iInTiW6ZDjpr5bhiBu7oSgvM
	 3bZ4tVvxyPuIND+2RKSKCYi0Juh7Q5jAOGP9ZoGuIvApmtotjLGBhJtf6obnQpaUi9Y+l
	 luu8HBeNyeILiqhElSqWuZemhOQaMs4+9QFFFuFpg8Z9R8OQbE/UoBnA6KDX2yOXnUAop
	 zFScrvf60yaMVlfL4aA6w3Q9y+8GOG29LN/rEyiNVWYInlA/ap6m4bVl0ybpd4/tjfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AX82UnaH;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3315606D821
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3315606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AX82UnaH
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26791915e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703926; x=1794308726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
        b=AX82UnaHveKFu27kwlvcNVZuKPygPezKyBWWrEMVqVO5FG/Zo0PMTzltQpI9KqFKxV
         A1o+IIr5VeLE9Pj91JlS/ogow+QO3x1IFrYSFIV2jaz8DZQqGFgLmhegGNLQI4g8j+AS
         KS2v1FvI0x+REACEPa3W0dxoH0uDAiyDkFCZCfRD8VfuAKf7zssMc6S1BbiF6PyMps+A
         P+bPCbb120Si8hiwz0h57KzA/4s2vDnZ0LYzeUg5bqrxCriIbY0L45etqSwBqPUjmeXR
         Zd6yogR1911yCkFHxUaX4KfrM+ljgRaHKJA5WeN+CVkyk5Xw605Nst68l4h0aWkSXQA9
         1Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703926; x=1794308726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
        b=W6Ja/B4dC+zwA5ARS47dMhY0eiV3TnpUeKHtu2cQmf9F9D3rNG1VoHrL+86rayOEE+
         lO/UHeLnqY98lsBQRMBCpjBCnJLPgN8X5tLw+x9hsrcO2NKVJOOAi/IF3rgkxdGKvrQV
         6czgLsEbWKMOx/LWf0Ct+AvS63SKwTQmUM9x3QOBNfHDja8iMjIpVu9DWR6Ud2HKvSCn
         A3/HGxjlHP3l8NxaoLyRkfX8qt07F46diSSmGumSeaxiGEtuQ1N9toF8QY/7ETVuw920
         N2nme4P1dFUgmTkf9FUFiJ1XVefe5O/lWlAOvZmNUV45bG8sv2r3j7rfL6d4QMoYNKsh
         Zb9w==
X-Forwarded-Encrypted: i=1; AKwUvBwfaitoi8DR3Cdt7NtS6ktaBh796vFZ+xOPDsZgoyaQo33tRyxFCADw6HuM2tK6WDpRfh5/cY45UOkLnXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iIHAfYR4vg6vtbNZRX3jMKWnQODYI7i99xSQsyf0WZgogSDYA
	z7H3lStGS0w0GQATM8i/8of48oKR+pjApLP6+WB7yRCVg7w+KGXpN0R9
X-Gm-Gg: AYBFou3tIAdEx1v2e8l821U2puaBadf9ocTqBUA3382n9lYDhJO4qjH2JRL5Y8dID/O
	UXDdQ2xoCf7dI3bQeWPjYfgJHkoqaeCrrnsnEycwbJhjq+Am747yhvQLy7o9SzfAgX60V4RLtUl
	TI3gro9Dtb4zjZxFZjH1dpsqI1tU9AzgZUx4CcIQbGkjwLbOEplAI7PJU6oPMcpYvnNJbo1MhDG
	iNsCyJ1FEu9x5Fz/DqN30M6JyrXWIezjAdafML9339So3wyaGMLbUKOkgYXrceYLrUnMEMZVJKc
	IP991VFJbVO6H+ASq2VUF+3xl2XdcV9H7K52o63WTeGMqNXGux+eN+BB3FGz0i9e8Z6jDYDdXTR
	N+Crfxe0wHVWEF+DckaqXLTgXGiW9NkL2LSSdi+ll/PnsoR6VLyhJDcdeD9rZfF0iXO+5VbJWfM
	GnxuKXehMGFJnF53B4sBN1aj0AY9AhA055wR4aB5PdJ0Rgt+Q7OxK2HTsGmI7A/9A4L6aZuk9YX
	U16HuOQKDYlIwChhNLWpIZT7b2NhX14pwv1I5Z04Uqgyf/uRu5zL1Hr94k4NZXhLQmzGLMz646O
	8R8oeWFjPI4qUDh1DE6nIbb935I0U/dslJ+bryuqvABHDzz1xKXrtjpUtnm0APsKCYuGLCaW21g
	802TKV4m79ofZdZH3rSv5w6NAjdg6Aexf1BsS/Y8SWEQrVOiYLQf5uOaq5CDpCaKV37k=
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ac187a6960mr289278915e9.27.1793703926209;
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add PocketGo
Date: Tue,  3 Nov 2026 12:05:21 +0100
Message-ID: <20261103110524.2812831-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

PocketGo is the brand of handheld game consoles such as the PocketGo S30
(Allwinner A33).

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..f538e6a27ec0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1339,6 +1339,8 @@ patternProperties:
     description: PNI Sensor Corporation
   "^pocketbook,.*":
     description: PocketBook International SA
+  "^pocketgo,.*":
+    description: PocketGo
   "^polaroid,.*":
     description: Polaroid Corporation
   "^polyhex,.*":
-- 
2.43.0

