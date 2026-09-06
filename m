Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC237A857
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725805; cv=none; b=da3Es+hidlBZrHXvku9OnFWu2/gH1URl2KGnSzwUHU8q31boUbkc2zIHNZFQDqox4TXcLhsywHbb84bootXi8Xz/rQ/rZzWiwuSCgG4vwTCjMvJNRrgWv8AnNJMx/tKzmLO/O//WSwHpGzeMCvPmZKcYN5UJPp4ONMPC4/Urunw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725805; c=relaxed/simple;
	bh=gqUGNJDAb1yI8v9pL6RTCkYxnBV64avTbwEfdCG0eBM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=gF3CKLxHVShgspnkA2JiBZZ2+tYGorOKYpPKCHiaQsiUedyEpkRcDS4LQIWQMNt9h5hYQeeRfqzIWWNg7NxF05s0LRF6Ww3hhiv7qHw4nPhgba8XG8MGATpHfGfA5A/NAMpshU8dKuKzd9uxQXS6yXF7PhuyK299Xg4w1wQrBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky0/VdzK; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky0/VdzK"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c7d4c663e9so2250205e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725802; x=1789330602; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ad616E7Mfeiy4C3sRfgAcvBobdI1RZYsaLcBMh2jcP0=;
        b=ky0/VdzKFVPwwVm14Qx6hJZtE2km7es3Km8p8wGW2B3loEhpbryE5Wllf+Bo/QojBn
         8Rd4duZyzXS6s0mlJIc6eYCkxzh9b+xDM1zafMQ4xr22XHlx+7VPIOR0fM42mHKPhG6P
         X6BqcKWmzCufHTpb5rRCBor1g3ntoZPdQ/nD49Zb9d65GS6ClBFSgRksdr2+RLZvtx49
         bAlNuD1ZE/3Lgiam8WsI8Fe3krAUn1+P66eE6Sgk4aZAkI2U20HTE8hWsGDC/Y1+BCmj
         ftpFK+uXVDB5icXsP1eNPOu4OoijnG85vR5/63Z09Rjl9CAkaZWoi9MFyI89rBpqyRvx
         I2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725802; x=1789330602;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ad616E7Mfeiy4C3sRfgAcvBobdI1RZYsaLcBMh2jcP0=;
        b=i5V4XLtOc7GNMzVilnvoo9RH+L2MSaHHpaV0KAJ9fwvCP3hPFb0WHJcjo7wvIuffNA
         3tkcrjnU8HQiaaDCnJJsx0XNfcYghi/GWqIdDqlauJE4LCc2n07YMbP2MXGhGVhHR6rc
         /OEnxVHx7WRLBTy/UoNyUiFb5z/fPlweSXFXkbiVxw5vzIGcLKcjUzKwof8WFP8iR2We
         YH6qbcg75k0PILVfuIo8nxhMFO1SMb0vKAk+Bq0Qt5lu09U2DbpN+ALeVCqW8Pk2zIBH
         hvSzYbR1bT4Xwdc/J6GaQgtQpZ05cRg4uaxKOZb/APJAFkiD1+jzYeGd1dwRJVe8pu+e
         5m0w==
X-Forwarded-Encrypted: i=1; AKwUvBxJR9F00cl/OCYEWWZZtzm1my2xvk4dVxrTR7bS8O41qiOLRV3Kb2b7Qsz24WCLqlpsLyB8Po0TldwRxnk=@vger.kernel.org
X-Gm-Message-State: AFuF++mRKVQNg6E5ucbZ0OZehPOKq1ncg4Gz3b4kYbk9dQUhOqhLuvVQ
	WMI63Y5y7hgnP+5USMfnW7aRG4/FqSsa4TmHyMb9PN08p02dv5QWe/Jx
X-Gm-Gg: AYBFou1B5QIAVXL0Ayi6lf+faQ17AEp3hNYRX0C93atp0BKYYsNy40HCIFsdYeIn6Lz
	ehtj/NwO9vH9ulle0u2/wkxKGRTPxgX61dfcPfc1Y/Aeju/ikY+mVI91yAEq5BS8/TaahaUu0O3
	ujuch1mN1fhc+rBYcabH1Vay/CGrwSWMN7Mv2yfpX2AfXNHDrrIbx8kXm110+ri40xItxlA9Uew
	SONpL61q9EZpoTWhPmtNH5FuTb4kuocwNWNdy2YdhMlzyAemzGFqqu7xTOHvwVjagxXVTGDHgIo
	ynQeY0pnY5830NnCXYLh29S8z80my4esXdJmXVbG0JyTibmvfGPSS1NCs1kYrRzQjr6mXLB/Dna
	ChwPaeJelYA6YH0qc0B713BiUg6+3+LxxsN1jNIRUxLdbxiuuHvXy5YBnHzojRX2ZJjTjOo1jOk
	Lu5OK41rs9t1uj3seuwlb29CYPomoyP2V4YYbEZglmT0Y2QTHjUQ==
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a4femr9514678e0c.7.1788725802270;
        Sun, 06 Sep 2026 13:16:42 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm6363883e0c.10.2026.09.06.13.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:16:41 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:16:37 -0300
Message-Id: <DL8IDJ54V16N.QE5U3SI9J87Y@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Conor Dooley" <conor@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
 <20260828-cartel-willow-9592e4e8b912@spud>
In-Reply-To: <20260828-cartel-willow-9592e4e8b912@spud>

On Fri Aug 28, 2026 at 1:39 PM -03, Conor Dooley wrote:
> On Fri, Aug 28, 2026 at 01:38:17AM -0500, Kurt Borja wrote:
>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>> integrated PGA, internal reference, excitation and burn-out current
>> sources for sensor biasing and diagnostics. The ADS1263 is compatible
>> with ADS1262, but includes a second auxiliary ADC (ADC2) to perform main
>> channel (ADC1) cross-checking measurements, system background
>> measurements, or temperature compensation of the primary sensor.
>>=20
>> Both parts can configure per-channel voltage reference source,
>> excitation current sources (IDAC), plus input and IDAC chopping for
>> offset and IDAC mismatch cancellation. This lets the device drive and
>> ratiometrically measure RTDs and other resistive sensors.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  .../devicetree/bindings/iio/adc/ti,ads1262.yaml    | 376 ++++++++++++++=
+++++++
>>  MAINTAINERS                                        |   6 +
>>  2 files changed, 382 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b=
/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
>> new file mode 100644
>> index 000000000000..7e26572388e4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
>> @@ -0,0 +1,376 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/ti,ads1262.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI ADS1262/ADS1263 analog to digital converter
>> +
>> +maintainers:
>> +  - Kurt Borja <kuurtb@gmail.com>
>> +
>> +description: |
>> +  The ADS1262 and ADS1263 are 38.4-kSPS, delta-sigma (=CE=94=CE=A3) ADC=
s with an
>> +  integrated PGA, reference, and internal fault monitors. The ADS1263 i=
ntegrates
>> +  an auxiliary, 24-bit, =CE=94=CE=A3 ADC intended for background measur=
ements.
>> +
>> +  Datasheets:
>> +    - ADS126x: https://www.ti.com/lit/ds/symlink/ads1262.pdf
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: ti,ads1262
>> +      - items:
>> +          - const: ti,ads1263
>> +          - const: ti,ads1262
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  spi-max-frequency:
>> +    maximum: 8000000
>> +
>> +  spi-cpha: true
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    maxItems: 2
>> +    description: Data ready (DRDY) interrupt lines.
>> +
>> +  interrupt-names:
>> +    description:
>> +      The data ready (DRDY) signal has two independent interrupt lines.=
 A
>> +      dedicated DRDY pin and a pin shared with the serial interface MIS=
O pin,
>> +      which is called DOUT/DRDY.
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      enum: [drdy, doutdrdy]
>> +
>> +  start-gpios:
>> +    description: Start conversion control.
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  dvdd-supply:
>> +    description: Digital power supply.
>> +
>> +  avdd-supply:
>> +    description:
>> +      Analog power supply. In bipolar supply configurations, the report=
ed
>> +      voltage should be in reference to DGND.
>> +
>> +  avss-supply:
>> +    description:
>> +      Negative analog power supply for bipolar configurations. AVSS can=
 only be
>> +      at or below the ground reference (DGND). If not described, AVSS i=
s assumed
>> +      to be connected to ground (0V).
>> +
>> +  clocks:
>> +    maxItems: 1
>
> clock doesn't appear mandatory, what does it do?

Its not mandatory because the chip has an internal clock too. If an
external clock is wired, the chip also has an autodetection mechanism
so we just describe it here so we can enable it.

>
>> +
>> +  '#io-channel-cells':
>> +    minimum: 1
>> +    maximum: 2
>
> What's the use case for actually setting this as a single cell? Kinda
> confused by it.

As Jonathan said this is part dependent but we can also just make it
'const: 2' and validate the second cell's value.

>
> Otherwise, quite frankly, the binding is too complicated for me! I'll
> have to leave it up to the IIO folks to cover whether what's being done
> is sane.
>
> Cheers,
> Conor.

...

--=20
Thanks,
 ~ Kurt
