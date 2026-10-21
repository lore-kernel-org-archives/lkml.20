Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579911;
	b=v2vJkID7yP5JQPwA3Uo7oK2hDbDZtb977veXLbIp9VTBnxSTzG/sxafInrzqW769boa9
	 SA1Be7dtLaKSas3vzo3D+qGL5tXv85tpLHSZ2cJqrdIaE7+bE8rqpVb9ddUoSSMwYansm
	 o7iZlfqy499RAyJLLrAMou0KzQdYHDkqY8HxsuV7O2PPRzbCQUZ2IwG1OAsTSOLyuMXYz
	 RGk19ij8Ofxwoov4+p77Khc+/focuqYmgYgbLQ6Zr6dgZW81z1TBxW2UNDM5Nbm01TcqR
	 xUVvvtLGrH8NOyMzhR1Vae7S3ghZGHO631CLDa80twGk71An0p/wqDxu7mJDYbrRAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
	b=DGpm5SUCVmdjFUBsvH0qvxKHZ4AXMtsWVsWn0/nyVJmaovD9asF/pH757m0huZYInpTH
	 HExOrXr7SSWr48E3x22IZ5f6SUMuGxRyhfTND0We5pBo+UbajgaEg618cI7ETwrPsK8fy
	 Fm5gITN9V11oZMc+7HjqWnmbv+5TeYgRNqo5U47DcTJmP5h9zxJmNB/p4yVFAmDBYnDGc
	 nnwPA0m2bv0o79KBa0mqlCoeO+4WyKYJBm4Tcl4vwnOX4V2LG+aq0a7dSc6csfTH2CFWN
	 gtPp9OEp6j7/EjCztpNwCNYmXB5XaWUB0UIW7XyACA0PgTuBKoKAgsCh1ounoShJrPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YogfN1+C;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A393606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A393606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YogfN1+C
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so4083805e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579910; x=1793184710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=YogfN1+CAf8JdXWXwZ7r6WzUlJC6+9QrZ2QzvQ7egcgdx4YlcjZmr8Wkq9xMSirwrX
         TQ3akbrh2/vSRJO7DX6s/eGHPkvD7n3zkOkFJMTFj4IvhQAEpMrUQBJEPwa4oP+CzXuY
         vowBguEv9A5WkWSVU6lpkVFR6GWylkbKA1AmGL1KfURAgMOX9BIgeG+lJ0Q3YnvsVK6+
         bvInFcxanHjXF9lDsdu/eX5D4W9tKVUUSpJ90nfpnp2+oBi+QIGjPSVvqP0feb/LGVTU
         Bzte3AyM/xczq1BDIOsPD3Qf15Ssq55++QBt+U6CAhg6W54uPhdf5R+7R81UiF0BbWku
         jB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579910; x=1793184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=EgwmhV7B5eZMGXFgYrl4jxBdREXIOm96rspjKWFYlGG68/jb4lH2Yat8tV034JfBti
         Jxc6D4ms1Ft+JVQ7gOCJKt0afI8ijcHpfVU70HnR5IXmCXixnluJvp8V9tx7wT5NXsQ4
         2UFcOAbCg/Ys7vF9Hrsx8TSR08u2BqUPKqgzbJrKBtNV2lZCzUckuoPo8eSVJ7dlN9+n
         wAcJ1jeGT7FlSqn8WJ1xbQv6uF2EEK/UKK/oZPcXCYTc2MhiVE7GR3XcuO+I1z0Fqf0v
         yrD/DrV6+Re2qK35saGFJvgUMIZkRHUl43ixNOMVugOziHGQmDgVAtRXF8aruyS3Vd6o
         /Ssw==
X-Forwarded-Encrypted: i=1; AKwUvBwmjHKhRIy2u4qpgGoT7IVo27yU+AkwBRGwJyZBO//RUhDHlKOCS/ZdIso6xR40XQkmlSAzFtgWXuAIKng=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPPfEJTLi8Nbw2DdBVjP1rACZHFk6OEJ3iWPkNMQ16OJVXbZY4
	DQmjDkNkcbDqaAfin18KNAuCyctZzTs/pWwgEDtTPxd/qkgiJGqkfaME
X-Gm-Gg: AYBFou2Uql6vd9Tp23WQo3aZoL7mfoq++yi2rkzkHN6gNzQg7HwLuLVvvO3eZ3edbIN
	wJpxJRK83/7CLxQN+WWJB7zRp07MF2e61sVH12HWtqGQtekP2KKj1AzLrJ2/8QlhcXCzUd9y+DL
	M+760rmKxeOSEM2FPYsnntS5Z0jEN5kJjCBvTW8SWmEImgCU9mMMJa5LkQEF2NPexX1ZZqphzkO
	pO3ClHs0to05BFk371TnCF666dlYCHq/1TeoDd6sS7ooTP/ofWmEfkBeA1et+0oMLFq7qLtj00B
	J5Rppc2Oqv8Nu2sTuBN3/PrB/2G0uNBmMi42ZFU2P5ciT/b52qQ9v+1BcGgjK8/dEvHsn8x+hYO
	eJLQQa6nEU84ppD39FwOhMYFZmAH3EXpBMkHuz/pQfWgOXINOLgNE6cStnxMNgl2Fe6E6EQ/Ee6
	YAPCDVF8PyBW2lAhgHDcApMJh4sHtVQj9EB/0bElKRAj/yVbaMKGHUYIVchJNzNjH5LSIDK93p8
	BVnG41MOXxSC6NAhnZLuCJnv6n2bJ66yEgxeMnhp1w0kNndzQM=
X-Received: by 2002:a05:600d:4447:10b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1fdd1e568mr25614785e9.17.1792579909764;
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:19 +0200
Message-ID: <20261021105109.199886-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..da534fa324a8 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0

