Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903868;
	b=dhxLH4oeoGUoz2WHiAmDqcAz5jkM8FlUTt9uZ1JHwNhZH6Kx8+0XSLZJwgn2ZWS8ABqY
	 tKQkMG40Q3H3XKPSr2lSvWgYKQ1ZjAVoI5LQ81Ob75H0elgVqdmOf4sutDXqi934GgRTK
	 VpANiZogDrHQQsP52AIVYKvU2IoWqMHjqW8NyLCKl5FZejtipCRy9ewiwgRZCd6GMsmh2
	 sNYdrbUqlfUtymQZiJagMexHxBrb2nft/PTRmGOjCPgWGkuae6UtZX10AzyfYiAXYrQHW
	 9syPIbcDa+/OuS5Qqrz3dJtx0GjFSvAIQXjNXLuugehCA7T9+nCRD437F3oAVc33hiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=2PDa5+/toAglNTFaL+UTmrEi2F9OOqw+BQ3wqoScXPJyhwqrffHRIdLOhKAy3VvboJMA
	 j7TLM1Q0EdzhxGJCNsdKPuDFjhQ37dqNTuEB/b1J09E9iPv0cXoaY4YSx4dQehjIapC7B
	 7Khj2jIgTOawmwQ2FVGKi1SGud/wBPmthBGBDTMmoIFZb6N3fgg9YdLCMnq2kzQGmGRWJ
	 PW39YuwNbNJh1GIaehKIhLdZfCGFUVX7+RCumZ8thinjw6guStSEm1PLF9EUqhmjzUSxM
	 y7HGpgVJvIeEkIozFizfDqfp/Wsyn4hMnDTEXo+SFqUEZJe0+YVoT2E4JFZZYBhLLDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11C606A891
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB11C606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50715c2757so562027566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903866; x=1795508666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=OOSmJG84RijGLublSYWVTMpImlN/WVaYVWH8oU+ddcnl85mJ/nXFQyXqkaCNhDH+47
         KhPkhKvIgNqhs/kM6bF4Bjnb8RAXPDNiq+6SRu1e4EJd5VM2sQCBSKFGSnfCqWk9sOeV
         MIVJpk5h3nFj9f/1YrTEHJMEXcWrwO99d/pZ5BtX58KFjfbONFw225vcTxt9ec8AUS/y
         2axT99gaXokVpb6sSCIlV0RXDZWOkSp2aDJuhAZhA3KYRVANLXZ0bHRnUjRTl+KsPlKC
         aKx7YZKcZ3YEuWgllL/cLAeG8Fp9dk+/dWZQ1/7ZMIicNIKl+4smwKMlxNp6B8uf2lWw
         hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903866; x=1795508666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=hFUA5WSit1fOIPMgmrXOxkp576YTbTMUXyMLkG4DSDF+px2Y3vbWHfRHyz50zx7QrK
         zgX+HCvqdZ/nUzFRBPgvqO+N7/16MM+wMBr+cgKK5flfXCgcKoXK5St/o0Omyd1ePAGO
         Gj8yLEEdHFnjldZIOI3Q21d8KENcsMnvPUzvPePHTHrooWUDTMKF4eiAXjjfi1lTyxs6
         lmYma2eulKPx4QytqFxg7i72ZoGafze08hSsJZ1Kk/k9pdw3rVEy0FPiqSG5t6qE4SIA
         YiIsWwjNugvCLjs84zvEDgvzT3qCARKsy3QNhmTw7TyiLtUXCm1VAtlG1qVa16Xe+dly
         lFow==
X-Forwarded-Encrypted: i=1; AL+hErETNBnbIHsXiBARnVMoffpXmRAlLZp4n5rUPRPFw2jfugP2KsSTpc/+577DT/wa5UJJpVBmAcnit7cGDCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n8QgJHL0Blnp0yKj9KNw1o7WGSoMSNlWHyXauOTTKgva9libV
	sv5kTct7ZWQTwE7on8pepch6NXG7mp7aEZwNX3HzixzW4ErSPEyEqxyxSNA3VhdcPj0=
X-Gm-Gg: AYBFou0pV1ygepUePGCJ3CQg91wMWuXI/ARiJKiHqBXlZaBA1TwVwDxQpMhdEigMyzB
	PzKQqgZERH+1AgbthYjSPmt4EbCs6MzHC9RiMZpsyPiz2DNU5dJA1+RDjEtkomm8X4xonk4rvzz
	0GOXd4bhaXdDJM06BYJOQJGXBFMfAlkwKrQ0RLczxjhzR+BQ9l9kGq7dh4F0uQcEO6jYs2EKmzJ
	6FP5wl2j0X0x2qkx5pWxb8RAvFvFrvVdzR9AZGS1fGW1GBzwNLddboGjH7qZ4+bFzx+/0Im7MAT
	2F80Dr9691l5SWgcR2CfXQJi5+DkvTpL8nTM7v633VifWEpOgBaa6nlDwAk1HME50ZoS2uRon3S
	MYVrousgpa0/1P0i7UvTTb1WPpPaAYrWFJzzuyv0vzSPQoJwoF6PWNoD6jcGa6qEBQ0qbrcOBc7
	oWndB9A+D0shPUijs8o9LoCZwIYkwFwtY0mSmGGO0dujm1nAtDks6q7LyzTLXyF3oxLKe4hw3xb
	9wAj1LO+oziWEnByGqYGnm0PbTaPaOWCdQJ10RFQeDkN1D+mV+mR/iUuqwbK2xjyYGsEYfr90+8
	W4LyEdSReFd0S5efxx3BGEOcd3CCA9bLXN5TUZRRHTH5Pl2IP3MFcy6C6547+EGvGgkgnx3T9KL
	ZTkDeXtxviBisJ7Cq1SR3MxdFp4EJtphLC/8kHDXIRR5b7ozR
X-Received: by 2002:a05:6402:210d:b0:6b7:9ced:824 with SMTP id 4fb4d7f45d1cf-6b7c0c6f70amr9699533a12.26.1794903866141;
        Tue, 17 Nov 2026 00:24:26 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:12 +0100
Subject: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
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
Message-Id: <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Va/ZiG9pLV9kgIqnenCHkblc6VfgP1Axc4rzf1uTf/VYu24H6meIDJzjF7cPq8pDHyZN9T6da
 Mb3xtpa7EcBDjzIwW6JQazspouxo37NOrWeZduY4MV8OdBzf5BelcoA
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

