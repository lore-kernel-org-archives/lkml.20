Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596880;
	b=3badmsZtI/w9RbXJouQ3qu7oa/NFQfL1HvsoXx0tYhK0c9kmdxK+CrYSNXAAYV+Lvh6U
	 vDsD35vv3CxlJAxuVvDh6QaN1U/8nIiIvTLOQfn0L9GtZ8D9XUL58FzwsFScry7T/+xF+
	 fv6QYoD5yGgXi5Xe4dDSa526Znd0TtY6bdwRNZ8nUW4DktB0vWPzik6mQ8pxLoqqnduL8
	 wBWcf6i/IecSPSShIsOv23G2OWh/RciJnZkUS88sS2piYeHSZW9YHFMiwtrC6W2Of2q6I
	 rCAqDpWTjqXac8ZTazlCY/o5AJXi039aeK3fZOphlLGV+9SO30vfgwUPmn6xPHQWSSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
	b=F2jJnuOfoTeJI3xZHVL8RsfvER55QwZxXTE2xdWty2oSESPr2DtLD/75F1AvEsv1U9zl
	 YGCd4oqNkPc24ey/TEWP2h9wPv6Xsqg3McUNI3TYMmsUQHGpCoQi8+zfO5L4kEC2uza2l
	 4ObUbHktWSVUnTM+73rs9apWIWV1hE7g6BjlL2cDhq64yquqMf9dAS9FVbmoxC/RTmHkR
	 hJO4vAj91w6/k77WxS3lS93NHesKq8IbY4itKU8zXG/CfCSrj2i6MSLMH/clFjlrPdgT4
	 rCrPdkkWXm/FnSsZ2sWbSHoozQj5hJfTWZyJT9Q4kal03D1VMyItrvPjPwKpCvMEHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abdJekNZ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF05360A3818
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF05360A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abdJekNZ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40f29667e6so307827666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596878; x=1795201678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=abdJekNZ8HxFrzNGohRBeEoTf/523bitcDzqsMoXfu/U4MopGkOP+b8MXZ5tWxql83
         +H4idS6CeHAz29Ea3I8Yr8DkY2D1+ljIBctRuNZ1EQHnxCBrrSzbgBs4xgLyJVibQTIQ
         LYPvOHevrIg4Xv1JpSAMiLR37kb9Qq0S0VvubHWWazdzfJLS1TikFNzYi8HMMVqCOQbI
         eKti5JdPJe5aXqzgfLGy8UYM3/T2YWQ3JRtjF20hkIhmgBcvDm4bRhNg46dcYztv2oc6
         BEcFEfaaFNumUsm4LprF9aHBwJYDZeY8ItR+D6Dw/wamqL2ToslkaAQt7JXd/JPGbXXY
         Xx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596878; x=1795201678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=RhTMd2ol51qnX4fvFEGpY5tOgAai+WKlBwBWZm21RV3/PlZnwlYzLVixOT/z8rXKGr
         PmccKuRdyLoFsUX2dl/vg1ZUimiKOvkAXUGJlD7vYPyOUedYRr261IrzZ5E/QXZxeSPE
         5VEHxhpeehuinJoyDlPnRspsy6iKVrKM0pTg5IK7MwHgIcY9H84E2AuCSipe9cQyzwOY
         PaeoAuZuoiam0F/qdfN3GeJB4Wzy1Y529OVBU8pl432X/ZUQNI17OFqZvAJe0Md7YboN
         41GDw3mVZ4Lu3JzDRxFrjKzH6mB1f35D7YGRMqtip180Pg2jO+KCAW6ggmEZxDM6MK3q
         tOaA==
X-Forwarded-Encrypted: i=1; AL+hErEr5Et2JyJpncpIc/cTvaB/dyVZmVG4UOmcwPVKcUnhY8Sb4O40dPJCo5lnnJWGcp0Tkz7izpo8f9ZgjOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u5Dfu2jTllyobVbCOjIqE+as6+tR1H9KLYfRiSFl4Qe0PuPkw
	BgZDzM+/hqwh2hw0/SG2Fjcn6D0EyRTcrgeq8SSmhLjVhM/I2Rliazme
X-Gm-Gg: AYBFou2EJIcztfMLOS0Jz/47JH/BhIXd4eM9dzMB2xo+83e62vKz/tZruSfS3kwg7gX
	OEcJENAngzNZm6g+rHMe0HTA/t9u5cP6Y0UyH2bHBbQlW18Xvnnrc3Zeqkv9NJQrAORY2fOXR8u
	9/7XM8PeMhhdBo8mTwcoT523ORp9KOY3iYFLL9b+pDNz4+xKKoOHeOinsBnRvxGWurH7hqhXREw
	jWHWB9ySN28oz7JeGi4nw6bYcMTcNDmbIbpn6GNrobMQL3xtFoXICiMtztz8ZQrM+dMIw+11mAl
	sDkH8VqPxGJrZ29inTgn9Z0vluHEMYSpeY1JipEn9QbEDHLSw7SfeInf/Ryhutu9G9bvvuSOpXP
	oC3yQVZ2R8K+ypvet/27bBNO4PIHEKsenH+g59oLzkiad/HHuFREYnaOCGA9wMuI6uAPT0aH6L0
	cHJ7/HcZd0SvFOIwpMbrr/m2smoXlkjY/6d58agoemWsPkvSZNIzV6a7aYHKAkv/lT6HF34cQPc
	fsy7jSfue9W3oUtfFl51rYx9PBFZvIBVzbAGdAyiqRV/TlURjKDzo8drjiPj/lICRpeQ4Rk3iba
	1epENxOn+xMz/gVlhf0aiDjOefKAErkUn7UQNpp7J6QYPR73CpllavWiKDPqDmSv
X-Received: by 2002:a17:907:2d89:b0:c46:8063:220c with SMTP id a640c23a62f3a-c5096398047mr303416966b.11.1794596878270;
        Fri, 13 Nov 2026 11:07:58 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:02 +0300
Subject: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
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
Message-Id: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
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
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 9f0da1240187..9a1369c9ff4c 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt6572-keypad
               - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
+              - mediatek,mt6895-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

-- 
2.56.0

