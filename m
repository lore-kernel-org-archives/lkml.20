Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964021;
	b=iSLqXf3+U1AMLsBIpn9M81JgGBLxxiVeDLa9P8aJsec8qqVBi0FNLC1QMeAUeI0uPfJy
	 sVcwx967scgIucQEB07r+AcRe71KALepRFtvn6lUVLBKc790TtXDC7bl4iHgFplnLTQzs
	 4c7z3gkOuD+cW0SGT5XjFzLalMEsplroqb6DZtzcnMmM7od3edxrsrbaY/AaF56OD0T8o
	 ZGe+NyAVk7JgD5Dm8sq4TSHAd+wEuzgqUXfA0hIm8a9U/Q+vJLdo1K9imkMz5x/sXds96
	 0GrR6gQavCkGoJsvQDVAuJUrAIsNzha5QlzxlhbXoJEEMqqlbHg02lUXiETVFln1q+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
	b=dZ0rPiUNn4HDiSkxdLeTn8C53svbhtvSinMMzsftwZEgF0k4ad51jzkt10FU5Nt+BRhF
	 cGfIAbFErk5YW5uHWq2YR3HBvtLk+j8atw4iz+9aXgXiduBpSZWNKgaoNvbSLK3gFzi+p
	 z3qmYP8MJ2P8bOO1Fd8O+WEUbDplRWZc9nd/wRPcUbAfPsovedh+DlrodP1258b+8iCaq
	 BCD4/gTeJNnVXdrNbgHtO7Y2kC54LMbDtVGYmPatuZ0dQ5/LcYtEEptREyK7tRJ5bWQfH
	 4WgiS6Y3TQZf09C+ASgcscLXyNIyvqgIh+juBG5Sy7r5wAlYNI4sppse2D2VwKUvHIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C1606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0C1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUFumtMK
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acde6b7b29so592961fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964019; x=1794568819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=DUFumtMK1phvIfSGAyjvBixjvVUbWj1LhChEW4qMThx2dH1KWLjydGDlGxwzpHi34F
         ydA4JtviInKqlL9MBEr4abhaPmqh35/Uak9OQijt/vKOoxpyIl7pLa4orHyfSO4vuI8h
         SglDNnGd8ZUztb4n0NY4SsyAZ9xEeS9rvIb8Uji0t3mFVucpO92chNyBayYeqhSZXz7f
         pju8gY1T4R95xWyHa0+c6Mq3d7+y2EYrsAokrF5RWngcDjic2+Aau7B9OAqIXzMIdHn4
         4rVW8y1o56QVlQPc1f89iBiWKmHxDUxq16YvDKR0r+xTHHx+sXdDVn4V3wvaoTs7a4WC
         gHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964019; x=1794568819;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QF85CmmgfQB0K98VDXkXqbQirpwlNX5Roqb9EMySWGw=;
        b=k95X7IJnaZHVg3EGEwD2bvaTs3g67oVKj4bTwvREo6S9elnfyz/z9XC1qPTNEd7G3j
         6sKsQwtCCjl2MKJmhPS6RlPdJU1wUnuhzmGpXB+2dI03lNpaQp7koB4/GXw6FAjgHwlW
         Q4vtR4BULxc+pMMwZv9+MNfsaiGcm45hznKYsjsaMw1XqoQg5sXvngQtfMDpJw7mpGfX
         HqgPpHJA6iJirEHJaZ2kdL9RVOWyj2AThZCOQ8CvB1O0u3d/xo7UZUImAIeZcTwKA7hZ
         0tbF+W4ci55DqE0VYtdn0/YO28pCQCfTQEMwqEtardXvBMP8ssLVu9dEIIb3dXwZIi+R
         pO1A==
X-Forwarded-Encrypted: i=1; AKwUvBzdnbb8limTrrjbmdBrEvmPUrdRea4Zqkzag77Y3f6u1bEXcEkQkOJMqhuRl7iYQg0kpSgGaqgA0yzGPC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wNQEc25FhP7CXZjAIgn1X5NB5Gyggi27HfpOp7tkFVxLo/k2A
	MA9GEO4gMm5q9UZOP6Wq2ma8AULsyCNfi12y8aCBQid9zXGpJmdjeS9Uey1nQJzADkU=
X-Gm-Gg: AYBFou0lUYGmf0I0q+xezrx8Lf7PfGEdLKo3j1r3dlh0DoGng4M9eoAxMSiu3Hh43yl
	wndyMvyDMRkfukeoQHVI1b8KifepV96I4iuNtnqo8/5GPZG2QtmMdyAybASKfkc0z8W6IzY5JaK
	w2KK+PzZqf40HCIicHKjHvtzDA1h84A6hiZR5nxfO9hnreiBJxukz20wi9VtHWW7bu5EzItlYWO
	QC5c17u5WGomjU6JFnoV5B61j16MB4OZwRcqR+jqLsqjewd3PwYlsvu88p/1tPPQw5eywRdAJtD
	mCGcmC8jZgHFPWaKP+ebVHm5WDzTaxE0DHvIcPnFUw7rsoX6gumMDBpwoH1dpTE3P1p7TW/3d12
	g33ddSkhSrZpRGTIC+h3wNgg4DNgkEleCpFKHx2VTG6O0B0erHODfYIJkJZHoakIrsaNp7EP+qA
	gJIfh/6GWHQ29QtwRYiJjkkhxAT0HRmk2wBmZZHH62WhRJlh3yvFMk/vMG1gq9lQ9ScrBP1ySzA
	5ZLz+ReYxAUFlmtB+IaG9k+B+1tgITMdsbSC33G6fAdAg+emZzVLlW7ESK90hXi7ZtQz37AYDLY
	GNEbGC9vHcoE1XanA3pX2KY0dk2MumQgghWc5Xn3EuIocPosa8hVJnIT/FEfoxxpMPnR8evQvVh
	YQubbGg==
X-Received: by 2002:a05:651c:a201:20b0:3ab:1864:5004 with SMTP id 38308e7fff4ca-3acf36dacb5mr4022961fa.0.1793964018157;
        Fri, 06 Nov 2026 03:20:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5facfe9sm2950231fa.21.2026.11.06.03.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:20:17 -0800 (PST)
Message-ID: <540014fb-d271-4e20-9a3c-3f2fb66723ce@linaro.org>
Date: Fri, 6 Nov 2026 13:20:16 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-2-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/6/26 05:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 27 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 412 +++++++++++++++++++++
>   1 file changed, 412 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..26f8939001df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,412 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 27
> +    maxItems: 27
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer

I ask you to switch to the new CSI2 PHY driver, please exclude these I/O
spaces from the CAMSS container device.

It makes no sense to deal with all-phy-combined supplies and the multitude
of other solved problems.

The cost of changing the device to exploit the new CSIPHY driver is
close to zero.

-- 
Best wishes,
Vladimir
