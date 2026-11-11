Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421202;
	b=n9Ek54kwIu/TM8ny8ZDFx7izL+MT7SC35u7EHUH89QY1g2Gd1IJf7JMDtIVkToJyEb5c
	 21xn7Ju+wZGZsSKG9MM7EWmEDSMqLqR7lKq64WsbRGY5mdzg/m9232rXXyr56eeBJIyvF
	 00CL1HHR8IVK6nbDuPe8KHcun8C3ub1sLcanS6i52vBPMuyzfQDsZCO6g67x7dXoDk3iu
	 xUMM5EAPqNi2wx8/8bJMfavZFCB3SuM7xh84J5DXbl6KXdRVrz0qjaliUjtb/+Lk0SaEq
	 yCqIx7AyumMoTgp97jkR/jlweG6HG8L7wYLv0STEu2EtXQ8ilPA+o8VeYXSLsh/wdRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
	b=jQpflI8jDK1KgmI/w1uBQT5Sb+r6exH5gpl9LjaAZNj7hMO230xifSi0+7qr+GX8C3hx
	 c4irDUtVRzuLGyH16ZCzijlkHOzCMqxmmeAJ4koT8x9HWcaTlVBC1Itdo84lPdsBCEg/J
	 VN0WqQgwYB3BQLKrBeG8bc6EcQGoDM4JPfGBv7KgahEg+XmaW0OXm0XN68nvgG5+0zdPd
	 S01GG6K3laLFDWLIPFSl9J4VwEFXayyOvWJ6mNUQE0e2E00BLnBb5e9PFG4EN4bxrPk12
	 EKnu1OY2xIJgFDeXCQxlExND8FNnUOpkJ0D0k0lTULOJxnNX9yB1IMLJtzs6eySR/KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S9Y/R1OA";
	arc=none smtp.remote-ip=74.125.231.139
Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE61606AE2A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE61606AE2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9Y/R1OA
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-853d57a81easo781612a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421201; x=1795026001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=S9Y/R1OAT0ch4j8eNGYCVwz6r8dPHXfv/xr8RVhkteJHwD83KHKJLXlEZa3bphDw1D
         NB8GdIcG4Qg5YrmfmkfSqGyegKDtIQlIhv37ydyVJmZvHPubsWSeFmPxMyq2GXlEsQz5
         o4yaFnNi1OmSgAMElzALcSp7sZtI3iakSca9mZwX2r+jElYK4j74VK50z1M5OI8+DChx
         1fgja9fmEVEmoUCRRv3xTl9bgNfAwF++DpXdIkgnTh62ROId8fno51w3xxzukIkXsCKY
         7LIos+SkcaDp6ELgabTFBYxK+g1OoP3lZH8d/RDHx7wCc7rVpZExVRNi8Am/C2VLhPaz
         /Tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421201; x=1795026001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=jnOoNHSLvkbd6+pBpZpQl+TM2MeELB1YcsesiJi7VBX5tRjdZ1bxouxILWizq1mYDd
         u/So2wJP24rhSWfOzbu1e2ohxfA42kvhmvmitvvAM+P7P36AoHlg1LBvVIvD+1hX45Jw
         lGH77wCSXiNtoSO1uAlWmFWRnqtq26Zt5pP8ThWfq8MEDb+kZ7dX1ruyzdkDM6+WTjtG
         l9b5/AKLI5y69ZX8WNoiCe+k4UsZsFjw0dy27L+od7O2fVFnXBzWuH0ESQ1H8CEbXqEg
         gozbe+Xa/xNXQvRvBjQPxIEhBo02bDIeyYNQyCu7l3W11b2Ts8axe5/jlaaIU/AczP+1
         j5tw==
X-Forwarded-Encrypted: i=1; AL+hErFW+8kZBYn4hq0iO/DyxjESOZyEhn6I7TArJs6Wld0eOCLgKLkEgN2hE/AOdS0RY4ClGVU7SNBzjsYJAP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IDlge/ucVd6hzDeGqmhEzfMCRZw4OEhXN7DUjdeYK87zjYD5M
	pEVSJ7Ky7bH3rKUHsE5vZvb0cZmrDwbnxB2JX7dkRu82NLJ3gVrz5KiN
X-Gm-Gg: AYBFou3nTxy1OEx/U7iIPcP7Mr7V1Qji9xY3izlvHMOgh6XUS+awCcd3xngyJO6kZPs
	sIhln6ggxCUd/IwRNc3CmxVVcVffhgW2VV8O6arfE2IWX94L/7EpvUDrqs3TxbLw8ZgF8Zk93hq
	jtOTpT0qsSgKLGfaZVxftPWB9XqngZoS5ZePxOGy9q8pjDoazlR6JnbOZ1CpDogPyYDGZFtOJX9
	Y5dzSglsDeOKpfNlBzkQTvY2yXMmkihTp+MyrAa6Dy+qL3dbu0mTC0ya0SK3GKyAE4t/RB1xss9
	2F0RZA2enefKb2slJQ/2O1WmeCrCcoD6DnOqPmqoo7tAHH1Ys7fi8aT2q9COKVP03HaIx1SS2GL
	86+kPPG2ZPyWAurNvtChYcSLjRghl0czt7IDb+tNOzUUReOn7ArFOZWQibeJ3SNzRS+vnCTqUMI
	s/Fri4nomSuQieLIKJc+eNLUhDJdZvck3+BY6TL1XLZda2GukflgQyUPv34FlauKkZMwNkFwIhG
	8ZcVC3tAyLjNYk6IwiFhFJ7R/YDauPFsp3zJRZU8GmKxrUOvhBJpAuufVLi/fmVGY8UZxnoFWNX
	zCze8KXzFk+EReHpvbqpNeyzjCe7+jOAAyykPFmz+avw0GYM8kVaH8FwgEfy3rkRngOQk4f1yUM
	JvM6E8l5Da/oDe5g+tfo=
X-Received: by 2002:a05:6830:82f5:b0:81f:138e:77a0 with SMTP id 46e09a7af769-860f29becb1mr2821997a34.24.1794421201164;
        Wed, 11 Nov 2026 10:20:01 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:00 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:50 -0600
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=812;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=q/RYeDFXlfWlE6oZcVVafzIBFTm9F3BkNBjT9jB33RE=;
 b=x1Et7idrLHXZV+S4OxZLI4XDrcm2EokNWm4td8JQSrDbabjEZZh8QQe1wekR71n/tjIyRyHZ5
 J5k1ccNSbhvDk86usV1plzGF6cGevU4Gd2qKFkZP1KKaNdYAsVILbN4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
codename suez.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..26f096587631 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,7 @@ properties:
           - const: mediatek,mt8173
       - items:
           - enum:
+              - amazon,suez
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)

-- 
2.56.0

