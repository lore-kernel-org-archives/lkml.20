Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585903;
	b=LvWF6IcJzB73n2fY3XGI9auR4uMeKRkr3AsRGgH2oVVnmlPYUPRb9d9yrGxlEA8+sa2S
	 DNDSNJwhLNBGiOTqLWu9XPe6uY6HngJ3CtaJyVw6Krbrt2joJmfH8wQrqhHFd4jNQAwrR
	 Q3fBITuxpOi51UEmvBOwYoTZjiQBcNt+g1KO22WWfJy9M1K9GGDDlCFGZyx508hrscMSp
	 /la8qqb8IVw3bNZRIy8IU6Bkod+rlKILHn461YhmpaCvKAsGZkQupTIXknDV/fu0M395y
	 lgmKzoJwhu8UP+xddwkSuuRP+w4/1ManI3/TUYVP5SokRuC4kUSkuPZIq9yKc5ViACg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=0PfywWQ7fLSOUTtz53u/UWrm0zXhe7mOgTJk/QO1ko/gsJ0bgdv3qhFAJTQd9lToxy6v
	 K9XPXCOvz1YiRyfh7XBRuA7ahd4XjOc6ZM8wmesNW/MC4IBQ/9FRq1aZmYk62MJF3MdAX
	 qOqduQENt6Bn526gLC7hVcVijcJ8U9mpJq4GOBaibz9/7xQKqJi7hD7DnVkpy2Z5mVi3Q
	 6qf75+NVrBez2TY2GsulBLzSGZMyHtc65PGkPc4GdjtdXI534YRV2BMgPyagX66NrO97y
	 1B/s5CRIJ/w/RTGkuyJmtxWHpeKIf5HNoKEWle4uL105ILD8kzdhO0VLISULbl+2zZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D8607094C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6D8607094C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so194621a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585902; x=1795190702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=NXWuRo4onYFiw2I9QVxX5OPcgg0tUYOXHsV+WLZ1UsLq8W44JTs5HZvfoNvfPYwfqZ
         aVOf4cZpXSmdau56AKXJsV6WLFeanx3/L6Gy6RdjXG+kl/zXHoy4cJaHlVW/zPs9kBuO
         oemMwQSPJYV6h+bJqG1F2EHGrXxt0dOlLnWgwF5Ulcpq9oM3p2swIXKrikcx1BuL3LKA
         qkXPq+g8+NN0qbt24tDmj702nIBntuPk1JB/r2+AInsFcJ5NXND1Shy8zA+xJm/itwf7
         6pWUpFjQRQUasOfYu6ayS094qOl1VpxnYcWG7zeE1bwzTUM3WF9GOAAo4Y/Fbxs7+9Rr
         ydCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585902; x=1795190702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=udVbyFK2Z8Nn7RsMyUPPGjnPz7eoPMbvG5K10U5kq7SZUz/KOXTgyHh4quCg89Nzs7
         C4gZntyw2e0QtmiXwzOXX1wejjRzCfo/adtu43xYomu6wj814JcUodt4juTTjuKPOZx0
         nMb2xkK6ms3+918Xk7CJmTDUuKmy2DzRpB6cuk09Whf46TW0iBymkgzgh7U8+DHmiWxw
         l5Krgcmeb97zYqHKSKYNLjgiR3hDjTr08xdOT0xLxpTWn4eryKOlHt42WvHXavupjo+N
         Di0g8Q/CtIKGmG1mT3pF9R/EGjCT1EuzZMF9QXrHILc2NEQuVpoc7At1upt137laKNv2
         3JZw==
X-Forwarded-Encrypted: i=1; AL+hErEWyBsRbH0YbsW5KAVdrmdAXymzQkCVQM6cYztCr4pS8kDPT9ewcECGwFEZYOyk+UchfuO3av9SpK8Qx9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rUFVdy7LSnpmNXeb2M4AuurAAzf5ZrEWdqhwY1SSwy0ANowHk
	Wrn3N4eDxK7EGARkEMRQNOB8vpbI2A/dnDReJ6X3xaaSMRxIBlEEmExTcjUZ3PINjsY=
X-Gm-Gg: AYBFou2YMsSe5K7mkXCyDei3MZqLuzl/pyWLKEPegwSh08a/N6qn1/3HfFJh6g113OL
	80Zr2KlrCfxUonBf903p0jxruKDAAtjvXg8ZA9D7tEtl6JS0vz3K44jHY18enhYkYk5TMdSO+On
	XWmOkIJiKqE9W6/toPgPQJIIaqFPimi7wZk/4H4pqi/1dC/6iM2JivRj0ESMQR/EC5FmKqnsl9o
	OaJPYCEonW0vnstaLWH6hUriwDc1I5Ek2NS9wGtkoZydpACGyGPFTunL+8uK9QHGsNtjHMbTMLq
	Emzw+tfYehqnALYNHHdv3fD6H3TRZQJ5s5/PujLFw7OWoIIUN8u3QIAHndUX+FyY7B1evQfyDA6
	/nrIr9Ch1e6acRd6+1YSKICknFZZUmcO4pJ18EJ4PWeqAcwnnRB24fWYbVDjyBcyg+rVEdPHFIW
	eBl/vLHrjzRkOTkDsd24fgskndKsP/HVpuDw2su8oq+o1SYh1RpbwZkmRtZ/0d2jT2O1iJdcLxa
	EPnpoVG7e93pSBoe0nbB4Qgp7i3vkId6xsWsVpJeMH76sy0413vk2+d3wR3KeCzUSScbMdhEos2
	3SOanSSp0fHt+3FuBRwuBYVBAhH92OPFuOgOQdAkWUj6sZdwJsmMuAw6+m0uLUW9U797GuQZJOc
	Bv8iCM5E=
X-Received: by 2002:a05:6402:c6d3:10b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6b7c0c1661amr2023087a12.32.1794585900329;
        Fri, 13 Nov 2026 08:05:00 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:04:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:43 +0100
Subject: [PATCH v3 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
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
Message-Id: <20261113-bat-temp-adc-v3-2-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Ht22iLsedKZL83BN0JDY5PWcB8ObVo0t6BTxz26Nw19xpDmgxebf+ud/QHUeqUQWi425ecQ3+
 SxCjc8QTNEyDHbneK6kZJZLlWO3P5cfHB1Ugyxv5BwyqSTZWKUV7rxS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

This means that the output of generic-adc-thermal can be used as an
input into a different node.

As a specific example, generic-adc-thermal takes in an ADC io-channel in
Volt, outputs temperature in degC, which can then be consumed by a fuel
gauge driver to provide the battery temperature readings to user space.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index 12e6418dc24d..317fc39ed46a 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -24,6 +24,9 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 0
+
   io-channels:
     maxItems: 1
 
@@ -58,6 +61,7 @@ examples:
     thermal-sensor {
         compatible = "generic-adc-thermal";
         #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
         io-channels = <&ads1015 1>;
         io-channel-names = "sensor-channel";
         temperature-lookup-table = <

-- 
2.56.1

