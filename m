Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596869;
	b=GlEOBXdGMpIGBU1Cztq673v8jE+OwGo1PRpFqkUH/0gPPOqhTcJhS0rzC6CjqnVRn1b+
	 9q9MBZJntRusEB82q7mapXSMVyNykEsdiOVRN3xTMBcakR3d+JpdSQiKQ9NopUbTtV6F9
	 aMe+OSSH3MOlj75LbvHz9Tep2LGskvDGGNV1XGj8s9YJw+Vc6T1s8YZyyN3IgQJhkhEwk
	 VN0wGPVVPo1HHov9vYF64qJGguWBXjbE0HoM2frixy6k3rYrcOLI/9roHsVfHDTc4bU5h
	 TNCqNyr2uLUSlFWHwaN2SsLEYDMyF7t+QXZ/Q6L4dlIlp27hgU6Ua8fe/jwCFM5TiyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
	b=25YZB1twZ6FebFup2hgjie67kAatiwQZSrCy7NQd5vYBP2/ESmhRgFsz2k2mlD3s9eqA
	 pAvqDxKCPjyoO/pLF9t9VQ+NBQcBB0wEY0zo3cMu8EOthIXJRWNhPF22phLJEl1Gj5tof
	 YVh8+r27FkE8uVHkTl+h7V0ozQXoaF5cCl8Ou+MyfuTe0lVzlUCpwDNBZU4AVaLOVe8Bk
	 zUwswM99pXkfQQwrACExfT43J/7MF98U2piJZ/yeLDFjwpYpAui/f7sQn6uZmnY8ZuDG1
	 oEY4a/daloMVIvoCqVx4Ij7I+KwJEGw58twEStbJDpM0zEFtVYNoTVKryS7pXa3lx9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE2u3Ig9;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C8606A8B6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0C8606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE2u3Ig9
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c506a231b88so233039366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596868; x=1795201668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=rE2u3Ig9QQmvYdO4meupm38R07509KcJIbOAEE8bkGwjMEOVzVv0JJLzRE37Peidsb
         smpNCeOpTI7ROICLLY5L90EV6xSGREQ/ui4lN8ruSeUYnNG4G3X9tiX6tmBDjD4S+rmA
         EJ+gM48JWQjmSoetmjwKebkBu1/6kW1rn3mdQb8JgRGM1t922TkimGEZMcSERFZuIPXi
         452eL4fN1PQASGBc2YGLxX4d6X09AtHZIOSnl2GtlrSWA8UO0+oSOyfyLdzIXzzzqMTS
         vEBgWlzFFtez3312Bw35huiUspC7CzTPnn3dJJdqQugkUMAD1AMnk+Aob0x4KYw0XNBZ
         gFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596868; x=1795201668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=vc6QCaZnQTAv2Y2fNlQE7y3GptBhQkuqTVrz9IuBkq5zhEyjSoVuf+vh9heLMSJftV
         Z6dyvXIzhumDD5N8yb6w7bo3UVhZ26VrjlLO1BQ6EYKUeOPD9Cty+3/G+5wRRx/YQeCq
         dd5bXJuo8MxARovZAIYEDQH12fgg8zYcH0EbPjuGCMxQcSZrfBhflJ1aKLJ6csXuMzIq
         14UwJOsyKErZL1KVpt/x7r3pePlXGXlhGFSqTmw5zFl9gqKV/v+ZOl2pq2e42pnHp5mA
         AOjqhIwwT1J5OFSk2nnchpvd4XpFvkjFJBcTHJSmbPShVvhbV34h5ZIm7eHsOWqqwZTu
         Z0iw==
X-Forwarded-Encrypted: i=1; AL+hErH5WxxkBPrMRR6DdaNqOSTkCd4O8LIbUymU1sJ+wdMQj/9WELzQzWrfduLWvp8Ys4XzZCjcselYC0LWeJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OzzmMd/6tkWAUvKLOUcShECtsoltR2dHmPl6FY+Jw1IxC304r
	UopZJROo9ux15WG2PnIxxjsif09iGz6nrr0xVuEuEh0t3v6IsNHI8Ze2
X-Gm-Gg: AYBFou1dN3i39ea2nOQGHWQZhbOAiY0niLga0QbSiNfXGA8AdgU0mqDeYiocg6+BL+L
	dP+w0FGkFB4bCMTFcF1LM8aRR3MMFSZxM3SZHZbFXiaRoU15EAO2Ae5r9lbK5iEL6nyF2ItGnuT
	wiG6G89guFAlh8qgd/bk69OluI47KVOBk+hEF294PMCcbBTe4Pm9XJKvT/Im1DT5N8469x6NSSw
	uZ0D6prvuqgh4WXi0f8QhYRs2DZ/VgW/si7gpfQmiB9HZnbm2YHzQr8TSk0uAvzp1OD02u4W7Af
	UUgXgFiYFj/r9eHl7RFYXGRINXONSRMwo6A98W9NUECu6JokIfsh3Nw/i5WZWxk7ix/VcpVh9YR
	cip5xYDvGtFzr678UIvf7tqikeum3T7jero4Os88Bvn8Of0p94folPGvXXFHZi6sIrgYvDC5utl
	ADNF5CGL9Wk6//a7CUiO5Jpr+mzPwMcCXOw3Jvh5xhakgBS1rue0RT4EUuFqoOWFL3NgcH1AaYg
	S9nBpT9CqRFXSjCffI2LGgP4RI8aYOz+58qvercQPSJS2iws20hpI+aLBMqHXyX7ZwbbMiFaYX7
	452qP0G+cWsXXnHU9Szg8A9X/vY0WCI5rX+ZXREBnmzfHhttkX8i8oLXCNL0qNKh
X-Received: by 2002:a17:907:2d8a:b0:c40:cee7:3918 with SMTP id a640c23a62f3a-c509683f389mr411823466b.44.1794596867571;
        Fri, 13 Nov 2026 11:07:47 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:58 +0300
Subject: [PATCH v2 2/9] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
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
Message-Id: <20261113-initial-mt6895-v2-2-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8000/8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart

-- 
2.56.0

