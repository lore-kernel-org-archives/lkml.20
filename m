Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20748F848
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237357; cv=none; b=OPiWXk0bggYLG5v9zfItXc+88khSqH8o9cRVkZPmWfizAa9wzqrFVKbNuu+zoU3u1rCzz/zL32uMyo9y8n++WkCwrxLVIReGYorJ5V7Bd0vaoDJW1a27tekylMJaTJYGFEHprX9vzXb84sKA3/Y16JpRvOFBoy7rOhkLMP8HyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237357; c=relaxed/simple;
	bh=Dk5sO8sprqfKcj5v0A3UNo8voXa9iGbs8EHVHYJth8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWBaNcRMvjJ1h/1mZX1B2MZHuszLo/Z8btHpBAyJGmGyp77K0VSEAd+EJ3bdGc0R6mnAR0ZmG+xEadpRRPZwmk31JK867RZaRJE8zQC0KBbSNHjCOsLe19mIvRXNZGz1LbPMKlhtiIIuiiABMObjHtOpst2T4iqeoBz99+OWWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh4r7LYo; arc=none smtp.client-ip=74.125.231.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh4r7LYo"
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47cf5b09bf1so652105fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237355; x=1789842155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8//usBnau6Q5Lsbg3Mie+mt/Y8AKS+7lUlJS5zLltE=;
        b=Zh4r7LYo/mFmaDYVkdhfaSW2vxztzwn8JDqBBLse5mzOhqW8uiCRvqGdjISPwC2Fos
         nSaAM5iy4AWeIrV8hF8iBlkEYUIQ4/6DNI9+NODMAsEoDwjpqpighDqONwiW4mFUoN9N
         yIJQqIewIq4Z3revWGFaAXXV/BNnwFQzD0USQ1aXJK113/ZwO1XMd4PoqxDfb0sXwI2y
         wBFy3U3sMQ6ExPEd93VCfsbxXB/4LfON7tyTuhOuh7EVFQRaOMLt/qwH48YAO120kiXA
         WG1U0cE7wJlljyaCrpVC97Sg3kpo8cv2jZKNu41FoZqUHgpOgXISHBEbY0WF/FtAIymS
         A6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237355; x=1789842155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8//usBnau6Q5Lsbg3Mie+mt/Y8AKS+7lUlJS5zLltE=;
        b=TYQoZzrvhLH4OXM+htH6iXECcOnMjqAU42nuiprTXh8pgwhxuc/drquC0eL6qCVefN
         u0zH29dwRYPuFdKAXWB5E2I7+Wqw9ftu4pZttC+gimpmtoLFuieXE63vi34sJ8UUMJDL
         G+WKU560e5yzC3UWY8Fo3/gpFrLYgSRkoNYI5tx1op/zOQKWj1JKEsQnoc8F9C5yMS1P
         N/N4bjMwNddjoEiUXRBXUGiqu8adN4ypI0+tQuNTBx3w5hTs1HZabWEyLHZbFxYI/XpP
         b2M0LhYJA3US2VLBqsTrB+Lk99+uXw3/rVTRdNqGBrb+9/HhXKHYnR8qoQ70OBzHTeKT
         u15g==
X-Forwarded-Encrypted: i=1; AKwUvBwqwpIIrI7ASmTHzUHkgrUMGUuP+4ehhh2/gwJqGgF7iQI7CZDtWlR3mMHpmQLPm117ZXQwRsF+lYGnEjM=@vger.kernel.org
X-Gm-Message-State: AFuF++mJEHadzmW4IinoswGfagcHkChmaUgrvk8LqwtsRmoiIKGRO0Ev
	3GFXqJYBoWxDuiL87TKGrVbwFU2NC5O5Y6au7WJ/2DIBgqYv/UZyP1OX
X-Gm-Gg: AYBFou2kZOQ2NKXTtmJsGp8bmnJyTeswB1fqAsMT+RmMre50RGiYXpTke08/ePZruRh
	caDg7lcyIWH7cL4p9yBk7wlap+42fPYUZIxotO8MfQwm692hRXpfh57Bmz2kTBGpVpkjA/0e4Ff
	FiOfqCmuygvyJf3Rfuq8p7KAYNxlFXIbr3khn/AbTl6QUMZoclhL80wQ/SSHTKv5AGbm3Bmdeje
	vUCV1uQrD5BiorNc4KiSUWLpxuxTuOFPkRPFcZ4bkCygaeVd9xY7gE3ACwJjpsE/4BVQP8J/OTD
	IOfLnWiIjgZ9rFbZ0c9AQX8R65r8ygQQValG6E4J4S6WmL9l+v+rKKwkOFxrMbFuPhhI7dIb6jG
	DbvJv0IAyrHKH1bm8KRXIKxvQkc8b5U10sLRua8mXg/qobgVT1vz1kvzW0WtBGKTDu1G2ig4wNA
	iOOjzV9scsyilXRDhBcve/aozaPItM+pN3QgTKVpt+RHyhoAspxUPmcxmCF+EBAuLzZjE=
X-Received: by 2002:a05:6870:450e:b0:447:1ceb:7cc6 with SMTP id 586e51a60fabf-47de872a0e5mr7271993fac.15.1789237354689;
        Sat, 12 Sep 2026 11:22:34 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df64d89b9sm5413898fac.1.2026.09.12.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:22:33 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 13:22:22 -0500
Subject: [PATCH 1/2] dt-bindings: display: panel: add the BOE TV101WUM-NM0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-add-boe-tv101wum-nm0-v1-1-3057a08e8b80@gmail.com>
References: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
In-Reply-To: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
To: Nickolay Goppen <setotau@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789237347; l=2359;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Dk5sO8sprqfKcj5v0A3UNo8voXa9iGbs8EHVHYJth8A=;
 b=B8ZBDlitIgMNBtTa8hluOWFctV75BBpAS9/F9ERZR0Xsfyvo30XET1S+jTjJXlCf6SYkKRVAc
 uazXohGolAuBhr88BfOgJA8DimO7G/7HMjMOMH/Z5bpdoO34uROKAio
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Describe the BOE module fitted to the Amazon Fire HD 10 (2017), an
MT8173
tablet, as a third NT51021 panel.

The methodology for finding the part number for this glass is notable,
since it was done by process of elimination.

The vendor firmware chooses between a BOE and an Innolux module from two
board ID straps. This means whatever the two are, they are mechanically
and electrically interchangeable in the one chassis. An Innolux module
pulled directly from one of these tablets was pictured with the part
number "P101KDA-AB0" on the back, and that part is 216.576 x 135.36 mm
active, 227.926 x 143 x 4.4 mm outline, 51-pin MIPI with four data
lanes, a four-string WLED backlight and a 3.3 V supply. The BOE module
therefore has to match those specifications.

Searching through BOE's panel specifications, only two panels match
these constraints: TV101WUM-NM0 and TV101WUM-NM1. In particular the
number of pins and the dimensions were the greatest discriminators.

Measured on the available board (BOE), the tablet's LCM flex is
silkscreened 1 at one end and 51 at the other, and the area was measured
as 216 x 135 mm, and its backlight regulator is configured for four LED
strings, which matches the TV101WUM-NM0.

Finally, a replacement part listing for the Amazon Fire HD 10 (2017)
device also names the BOE TV101WUM-NM0. The NM1 was released later than
the NM0, but is the same mechanical design and would take the same
programming.

Even though the part number was not physically read from the test unit,
this module is absolutely not the boe,tv101wum-nx0, on the pin count
alone.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
index 550aefaead46..6045385ce1a7 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     items:
       - enum:
+          - boe,tv101wum-nm0
           - boe,tv101wum-nx0
           - boe,tv080wum-nx2
       - const: novatek,nt51021

-- 
2.55.0

