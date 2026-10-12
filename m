Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D93D5657
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799795; cv=none; b=EUkvkk2i84f/QyxYrEpHu/MZFyHY9KPQEyrRgsFTi8t/5OA37qBjcXoD5yuzkTwqmdwOr8luwLNT1zdsmz2AoaY2xRAGOi7ODZmrap7i5HTsX+wJEO5yO0d8bHLQB/sq9irMqbZTJug+kHHPL6wfiYhX3JmnrlZgWdw+ngmGfAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799795; c=relaxed/simple;
	bh=rF6rQofzYRml/5wBil+Xn0JDP3ogfFhOy5WOAz38e3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mo5wRcIOdAhpkZTe/o8PA2cMUb/gh8a1emS88f47psw40+nUPIOdEJN6cE2HjyrZ/Yx5ETuPZWRFPXEryxvuaLJ8GgqZgZg3NNWzKqDeR81u/XbByF9PSXXvB1bzlntQlFgYZmXv2twqqEFcK1JBq3896lZfqfrAE4BFXyHYfJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+nvihru; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+nvihru"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10595695e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799781; x=1792404581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=f+nvihruUVejM7Uhc3/2JbQjBD21Nf0Hcrw93+oX3Lmmg24yvmklDr7m4mVNusixel
         ui2oNSb4XQ6Ze6W0qDFk2xaIHdZBD8jwa861PcRN+KVryLmrvVg+hP9rX5aybX5WNLaG
         3LXz1oPxo1aaxbG//YilwZ/EneGRt22rGnPrL8Vd6JkX2Q/cDCgCx4+wzTvdizce1f3l
         t66wqeeTXefceKRRZwYZv+FpIjdTHxXlMLwlAnnP97gOW5JGzTVXHnI5sGJK3y1zejML
         saFHkUafDBUGjWEy0a7c41mK0AlUpIKOyTEH7a4srtiedGevmF/66PMFPjEhKDhPsnPa
         ATbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799781; x=1792404581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=Cekql+9r61yAxLC7NEsCfbcqzisX4di5DJ2a1unoT6xjXC8YV38fzPQKaTHxuLefRt
         MlWbHrTZvwKWyAZ0265Oper/qeWHaksMixjlnRmOBbC2lGeCPY6n1vGdj38HqEKoFHgi
         rps1tltIjdSN4/eP5Z/mVc2Tfu87Wlht7fYcakVYGJ4Ylq6vQuoFopR6VXIasMS1e2IT
         1VGOfog7kJ3po6xw2Marwb4N8mjhcn5RGf74ZCnQUl8ieZXCrCF4jd7OoTyue4um3q8B
         MT03xp+eDxdOZZQgT0LH74Ind9BTa3Vv+1x1o8CzQXoErhzeDaAZBEyjsc1OUCCep2sB
         kfpg==
X-Forwarded-Encrypted: i=1; AKwUvBwbGQLTlX5rzQDklpHt8/SrVfg54Ncs7I03Vm4/QBw5hlpGvA5zoJ5F2mtL+8vhs1FCuVqxyAR0yjBdsaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2BTzXnBJiVBCiA0Yhk3RJ799VH8gkD4QwDYKK0JHPe8AotEDf
	kel21QQtCYaZxAQQ86KhwLw3eXqh3ZkVEgRF5fkq3ScIcgAYTIhTGQVm
X-Gm-Gg: AYBFou2d1TqnhOHay5xyeLarzOiihbmhTj4StEwqt7lEXlKQ/+TnJ5vYUr1KRVs6+y9
	uzG9eBhK90FW3oMv/ikex/uuOxaOPTKJ3kGBcoX6PXyNB26Lazk0TTGsFcXX06ozvNIJn6yJh4N
	HmnPibLxVg+rj28d8bfVCOWyFxPf7ULwtrC1ESOtn8Kxu91BVwfF4v5KlD16ETd+bhJ0QNi9Nf6
	eyfFPk7lngJIxWeujvlYdwRNeNdqMLEWEHSyhr5R5A1lQmglsqdYSKCxn3J9fJme7CJFdWy9jrN
	LoXRvXoeSR+LxyA8RV99ecIthpTGNpMgQ76OpmeVVkl2esAszoLixjjgfXG8i7eNDzWTAW7mego
	9XvQEVSbJQXvOEgXyf1oLwwy6ybBhDz6zf3ofOLo7wPckpukdAL7ItMhFq8xW74Gs4XTc15tyq6
	FoSocfbWYNgid3YgySxGuoFD8JXzZiyU+5+vXLjYIfoWtW4fCWt3VKbDA2MEzPNDjB5i5eNk8nm
	bdpschaXbuIGASI+APvgzH8AOKk8aFh
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18e4a7844mr180897045e9.24.1791799780438;
        Mon, 12 Oct 2026 03:09:40 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:39 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/11] dt-bindings: i2c: mv64xxx: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:12 +0100
Message-ID: <20261012100816.331033-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 controller follows the existing Allwinner variant.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..d3b6f7668621 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-b288-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-- 
2.52.0

