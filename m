Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102464;
	b=d+bdJ+ev2L+vqRQ0BDuxbMe9aYg2Pfa+4ssdHobmP0zOJmd7SqliTqecDEmYMgyXqC8V
	 xDRV9rnhGyyjQn9/8aMvqUmi+E1zWGCxHwg2RDWuSnV7J+6EDWb+zibwYZg89n3hy1ag4
	 pQBKTDHRrpdlDW7HvC6jZ4MCAjprzYRw9Kk7Y/fa+38LcHSDPWDzaQ5BbKH+mAk2olYc/
	 tkG/a6UbBSYbIJxjLdEgcEg/z9r7+saZWBw7QvmJC2zYDxosY9GrjIxCw8X8yDvqyKXCn
	 CdXys2YU9Vg2bpwqOEir1qeTTazEECrf+ABoZ8Tg3HBsN9yfdjJwwoqXj3ZnInL7r7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
	b=RHiCkab4Q53S3zbfGr9ogdfVOql3ogfQ8ie8/jvg6TW/kNee/DuKfKrDfCwABT2Wu8mR
	 Z6ZwqY1qONX5etNOHUetXpk8bl0tLXrQe8o9/A+gtTpcro1dhs8S7w06vxfh0zhuXGQvz
	 A0mN/Q/C2xeUHQCp7Qs1PknygnPg7/oOOvOc4jOUOQVN6JqckJguF9VGFDwgLAGmflYbL
	 CxgWouBcv5xyiErcbefX2OMtReP/10svTu/B2Q8UdnsOdbaSiGtkemhPbhLYIQ+njzw+A
	 hsrWUkvTbhiJBtbnWtNbB3rfxA+7XJCXISRPyWaXOkPBQGOEtRrhWvf5Fk00bYx/rYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8965D60A3807
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8965D60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso376211a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102463; x=1793707263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=TxnE6HkSm/cAlbvKMme5D5UwKuEoIsGqzBXQWe5BAeNxcrBBNg3gamuWAv0zjMcLp1
         C25hq3LrHYFU7tBgWoYYbL1/P0S9KUNsVtF0hg1a0OOU2jZIn8saECLD7IkiUXMlJN82
         WvNgK1t3oR86E1EYtHaxka1TEwGZ4httlFXNNltQuZsezGrafGFnBSQyiDodQO6bUdfj
         b1vp2wkO5/9lJD3sscinQljbsYNe6ungHs08+hEjEJKthJWfYFGe3o+46U1GT2iWmDpL
         hlfj2KgoT3xH6dEYYLtlRyIZ+Byip2Os+8Za5NAkoBFigQDL0lGDkAxCGySfcD2ZF3O9
         YgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102463; x=1793707263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=j1puojZx8joyhRqtTTXQQTB+oT792Ac3K2GRQ8aixdq0RA7ZAN6TwOEkQZ3P1U9Nh5
         dsUzs0RHS9uWS4Y0O5hBlmLHfSmcuRZzUtlWYoH+HX8Lmrdj7yMdyVhe6kU9qgweclVj
         sAEUuaFz+JTFKgfKWS8pUCICjBdAiLZXkU/v82PZEcPUqPnUGtyIyP3hjJUIt3MaLUAh
         G0QUXL7Pl1umBvk9dcpBB8nz4FX1/yuYNiGIU8XTF4PUT1g23nPQbxWW99spjr8dKg4b
         nmjYOBi3uEttY+8IKmKA+s6x4tuG0Wn0fCnGua5lCprUSYnHaJ96zCgEI4YNv9PXTBC9
         jClQ==
X-Forwarded-Encrypted: i=1; AKwUvBynmbpzcJA7vSOdtJTDc3DABNhFsr0NbsE0qoCXZBaQGktOyN38SS5kXlDQKdeyBhJn/OXmw2/+IZFol38=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJjIpr9/zBr05SevprymvuZkV5CqmsZhCCMcHGmRxxIp4dCgyo
	xe25faOCME8Kmcl9mh/f1GdotYh888thVKjcNaZQuwvA/EsiDsTlsTKx
X-Gm-Gg: AYBFou3DqjP3SmMAQef7/hk4ERRAm41/wXvsCHcURnbCzXncKdaLSZTdIlGHA6O3B4b
	ZVUJMuy1z9ik0greZOAzf2fLsrZj9J8pRu4VHj/WiqihoQoiRTwzN7J1KZKRUAC4hcjBD9ZiT8f
	lVbRYil8a1T1/7V2jlwTirM1HyZVYcQAU9AY1pNWtq7bSFmlLBmW8UXDl9Hw+rhH1giO0Srujh+
	ZNsQPCFYzefL3rMHjAcZxZG2PoqjMSvppHROMkn7EQARwcLeSMFklv0SD5dLbkHddNQNhT6ihqu
	oUvCS8NT9/ErVTBdgPppy1xWgVIzT/S4UKr6zxAuMhaXxu0wRCcj7avuMw39gKLjfw4MdwnrZ6w
	tx1jIwx/qi+VvV9T+tXseSl0kOvdfSfyaynQAQ4yhXeDI5S3BmgrJpIK9YIFbaRJ/8/jegReaJN
	b2YfPDW142DH0/oRM+RmsMq7OaxkAAb0DhqksWZF5e6+iMkJkCl1k8R7DiIernePuJZKt3/7osR
	6xiN6MS5lrcf46k+/U3XoHoFSM88KyT6wQCaJ2wjHF7CfEvU3ZZeu0ewKkc1A==
X-Received: by 2002:a05:6402:b04:b0:6b4:1037:2b6b with SMTP id 4fb4d7f45d1cf-6b44311e24bmr7137730a12.45.1793102462588;
        Tue, 27 Oct 2026 05:01:02 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:00 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:17 +0200
Message-ID: <20261027120019.93611-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..39bf1af7c3ab8 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    const: 1
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0

