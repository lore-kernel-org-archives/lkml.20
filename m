Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98773E4115
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318352; cv=none; b=csrxDAARIR6WLybD38XvskisfpTaduIGqIIbF9VmXEj+1n5/2ofMhR2hs7Hnfn8ir4yatXq+hZvWwZbWOlCFq+IMImAMuof5HNF4yBsFmloA8RFMLZcmyibELUrHI9fOujS+9sc9e85rm2xG2wEFm8YsdjXQysz8LnJeZU6yCyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318352; c=relaxed/simple;
	bh=eCeuXuHqvmP/UFOQEKWmqU216/ZSkndN2WvM0HwWpA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnFjdcBjYGeZ7lgwgtcvnc+4Aa6FryumO6zJqv01SvGYuaTiImeAk7/BUbvLP7iELWV0p6i1qgoj8cqOTXhr/6UTScp8UGYsP7pJMTaZkyrN6RaAg6aVaUr1jQ1lp5P3gx1mizTc7SBl+y39NaSHZMtjZUNR927Zk8ZtX4H2OvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TADF3OG4; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TADF3OG4"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6cfed5dd071so719097eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318348; x=1791923148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7tY7hVtYcSGrMabWy9Irpy+9KqMZ8OzQ5ThjhxFTYM=;
        b=TADF3OG4ha+OP0mTziymv+DQ+mjQT9wzoF5Y9XxObdrA2qf3gTH8B6e7p4zRgTM74R
         duZ0wfycxMh6anpw5KkH7tEbnie9gkC2KTMEwnwn4vDGuOkWdRf6Hv/IY0H22h8LT5SC
         e1FlAoT1uY1vAt92SeyZM6qC4xEzOMI/s3d60TgsK7vozTlgApqz/CzRRfA96EhSJqgD
         bbpYt+9Yddx49DygONhcVMs6AyegjFAG8+YvfBGYfzOMLvUhu4BwrP5RvY7kQ6u/eNUl
         8iREXEpD8KngevGCiBWUB/9kPjC9kcUDkWBrpoFSHiNnu6hs6FK3KSFygXm+uUCkxU45
         SqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318348; x=1791923148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7tY7hVtYcSGrMabWy9Irpy+9KqMZ8OzQ5ThjhxFTYM=;
        b=j5LcMW+SAI6vTl/RmC3tz4SA6TRFiYgX5l78S2TC66WLG7tHS9l0LGnco/vdmTk6gU
         hYJMcmtJEicxSdVHwPfAe+CRTdpTRKUDv8hyReSLMxWgFtMak9GsA3IeIgZMnBnTFGRa
         Zn17g2pRVQhf9YYDZp9Z4lTEgVjELPxjKMo/sS7Gd4+1E+Vwjd0Va9LjRCyisdHosgMQ
         xps+AUMRdQzZSmj3JbbOQc15XnVDbBD0su1qrMqpxZ/1bbAhK9mw3bmfmisq3CPJKPuL
         ksZmzIa5fBoaHvRCjzfeXScP2IXtntIhbzLPBuPTE3y58JoyHVKeP8VmTWUgdLhMqsPh
         TQeA==
X-Forwarded-Encrypted: i=1; AKwUvByYROHZVfqYIlUpVlVbZrcmS5dH9e0iONekDqUzJmFNyhM1zju7jE+T/ntMqf5Ir8nqkUHxNu8+ZGqbimQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lASkgAaNwuOTnmHG1P6FItHxDiBucNZw9IxO1def3g3KdlB+HZ
	+rP4RIEdwmBRAuUMQxEBiz2iUdFbQPUPNmPe1NjLr/qJ/Hfgg6P/UmNDmArTTAquAnY=
X-Gm-Gg: AYBFou3APLh7O+jKZ06F23fXEato7duKqrNdCIezw7vFmVh6OCKpzRJYMkxoJ4hrm4q
	StJKQN6yvey7BUlU5W6Ir1bv1ULByx90FWtWjW2gbRFQGX1+sr0UxrWDsOWO1lOnXkXmjheXsC4
	EckLhgp0NGs7ER9wIHpC33U3Y7LfURrYGNHiEHMgxE6A6NF5twmppOeUh+TXTygfQQBMuGlagPa
	haCeWKgaHozbYixrTROUhikOKhEaIO+J26XIy5jNMTdhfhcj26ZUdDtx+Gm2uRqCss9AdEOkrHx
	rAxAO26j/r6XfvzEBJeetnIYyRPjOFDD0OaWHa00zCjej/KMDo7QRMnrmhNjwj5tYIf8Jn+qDaJ
	Nf/AMW52Q2BGpGhsNS9li43rynPEK0letRis3BgPJfb+h/+HPfYgCsxW2I0hyBECQaUjmwqy/eq
	ituZSucoPHGuBh5OSLHSEqzWX+5bR/M02GsnZzf5fpQPuvxY4Lum5jlxzlbxKeZWdejbOcSSjT2
	w==
X-Received: by 2002:a05:6820:a28f:20b0:6da:82a6:3a13 with SMTP id 006d021491bc7-6e7a7c16529mr202545eaf.28.1791318347829;
        Tue, 06 Oct 2026 13:25:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:03 -0500
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8390-genio-common: add the
 panel vddp-supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-3-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=eCeuXuHqvmP/UFOQEKWmqU216/ZSkndN2WvM0HwWpA4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVkzFqTYwMskBqktBAGaQIkw6mYPOB0k1bRHJ
 +8urKmt18yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZMwAKCRDCzCAB/wGP
 wI7sB/0QM+uNZLoX1Jp8NLb2nJn7ClzLVCDOZXUqzT1od9Q9IR+Mai0hZvJJPbZyLWuWg+QKTGS
 NYg/wSz3bQw/6axBFVzO78Kh1bFlH+KP3j23zjsC9zt961U7k9ASdv0XJvU5UxSFoRHafe288eh
 yn68IMEfzt9Vm2sisR7roDYZpx6Aky7yIseJ/bRXhrXBhTQK+GY0OsZJnJUYrkmA08FBm58ZpFn
 lEEDS9l/yFPMFVQbVyrf1uNSe7s5UopCm0G94dDiFSohYZCxVZaohT81NiK3hOyVB9/fldAJvue
 uJUY7G7Yg3bPSW5541+85rKJzL/TEonFNaAps1j54drOKSST
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add the vddp-supply of the Startek KD070FHFID078 panel, now required by
the himax,hx8279 binding.

On the Genio 510 and 700 EVKs, the panel's VDDP input is on the always-on
vsys_lcm1 rail, the regulator that vdd-supply already points at.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..449af8014769 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -324,6 +324,7 @@ panel@0 {
 		reset-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
 		iovcc-supply = <&lcm1_iovcc>;
 		vdd-supply = <&lcm1_vddp>;
+		vddp-supply = <&lcm1_vddp>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default_pins>;
 

-- 
2.53.0

