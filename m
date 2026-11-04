Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834180;
	b=SmQie7Yp4kA8Wwae5OWiDDZu3oc30iy/fjgaKVP16B44ul2ZZQRl0OolUeF3qcxCHSnL
	 Zj4/M3AkwnZawCNahhkPXKPbAeU8J95Z0Y1ioJAHBzzaLIbU5JO1E7tuO5ddaZ7GwO7k4
	 h0J7/ej83jhP7NraUeBwF3nmF3Z6MKh/u63g5fZ99y/cVGIikxHXKAqFAv6zNke7e+DWO
	 QmeJmsIX9T4zZ6k3jYhJGt5BdAxsgkNxXUikfHsrIcD1La5SeBlgzSk/Y6ndm1xNhfAPo
	 jqPp6QZa3FY7zK1eosNQnWVMm2x8zk4iQp0s+8ZvPvCWqtAuZnRfsLEWeoWc/3Azc6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
	b=sB9nye9YJKAyNzQ1VmwnHrlRVlfzrbExXh5pk3lc99WmthLiNRJX/AkappWWioAwQJBC
	 B7LWF6ucnrcLE+Wflxcp6M6jXC6hJowSXjADNVSMa4SQD9AE09pQmBBXAQY28n1zvAb2i
	 f5rKoFpD4bkjD4hZQhUlLsjOF/pWt8aIvlO1C9iaAYSqM+poR+kIyApDNZpqe9jGBRtY6
	 8HbYRlP1ci1zZCYm9r7XizYwVyjqrgZj17QiN9CwRkm/q+E0cT1c3rmf8f5a9xTQZII5r
	 4Cw/HupDHLNQ0WtteCCxeqCnVDy6A5Ja5MTos0mnLFK81CaVbNCzdLkGZbQ0aYRjs6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B523606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B523606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MaYfUrSx
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2712471fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793834178; x=1794438978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=MaYfUrSxNAlGHW/moCDpL5dx1KkBp8SvB1mgsR5RSl3YCfz5pCNFJbBf95jzougjqY
         3K4uhPqKWhwHat31Ew6snmPNkN226ndz+bHT3x4mViR/RCa0pNpli+Sfj6yN+SeiNjYK
         lpY2CwrLM3kleG8LY9Qehd92WyD0u4NVaFktuJaXrf9FWYkRkUAE9P2A/W5lM95uAEFi
         hrH8ohl5VS2MRP5wz7D6Jq2bWrtcU0u0+xfkSKTFALPKSsH0aZK2BwRVMt2XPQJw8vor
         9icmWQSGsHKjuzumqm+SnEE+qUUbtVXw96HJ+WRwpmlQahi+iSWSCXss5UQ0zNKRhFST
         +3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834178; x=1794438978;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EXsJAbPRUQUC+z3RwBzOtASBFf3dkWZxelHNp/K+zQ=;
        b=k2AykwwacIUcq1yBHcjzcWMZaK+q4xlVmtQyWi4giYaa635Erry0rve+fhOjX2vkH0
         4G1H6OgQnyrvaEzv3PhUWag5VExoslH01Zv4kefc3XQRB1lgkmLFP/muF0piB0ypJh2e
         mShwPlN6lUujkPnq+teabksKQtsSrM+GPOyRhj1+DGqaF6VNHBRX3cWCoTaC8Og9MYH9
         Hd14AA9N+w2Ei6ulijgfOAkpq64p07gaRCXOKACRBNxw1KM67ESU/HH8r/NACWuJdlTw
         DZHGeBkgbEw0ca4zX4JWoHRmWgtF+3EPWDvpUkYY4GVaHVsacdYG76Hih/r7wCKCrroM
         ZEmA==
X-Forwarded-Encrypted: i=1; AKwUvBxL6+0NuliaPHxZld6uE1XEFmKk1kgdSk0hNQ2XIT/oIwRCYv2vdPjD59j53BzV+/+UWKlDr3QiYLBnDbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GgxgbOGgIA69OCWWpxvhQNTVLkAA9fOJyDpvsik6L8473Za6S
	BvRNoIMHiYiGWWzilsskejNmaBRxRVqtwzRfePJBB2SKGlf4Ydb8uwGnwKnx31XcVAE=
X-Gm-Gg: AYBFou3IQXC0Ns7uFQSEdYX5ABnYU3ZwDohbWDVl4MUAC8RsezXC8PTpN9DRmh7UYRv
	HllcyTSiZIe9eNBHdvDsOkPY5ZQtc3SFbvt5P+pSJDGf9bP0NdxA6MUlippZAySwqSFJueSaHON
	WdYk5oI9J2yuaCikSC/KrcoyNeG5MLjDT6mxpdleO8SvJ1pLCMbWczpNpu4zJAv5aO/P6Qp85r0
	AwKlKxHLwcV5pR9zEjkSayNJUVT0zYKHHumMdf3bEgeMKWCT2pWf5dLb/T0cFAeF77ZWmC63PP8
	YPxdG3F1q4PfokXdkE8BpNtTp/+x7XgoZnCE8KwXRiMtu3MfYixgPoi75JHG1lyGDZ4+TPT7Eto
	aiI8zyBvU52dtlm/mZc3Dt5JJCPX2fTyFJuAR1X7cskwCCZcZ0D2OngsrIR3h3I86g53XCA99B9
	QOZoJd8rTimI7OAGpheCDSy+SHz56N2XLi/7TbVlvdwdW/v8sXcJpkPx3IoszhUuji+Oeti2+Ka
	ky9ceiw47hYrQmD/hOYutTeQEqjlTq6kL6WhoKQ+b2GLa69Mc+RM6WnT9BP/5CmEBFilFj+Z97E
	NrlccN5LYGpQqXZ/+78a0AnnenLRlGhTe6czSt2XbzLUrUSIaOil511CXHnyRsGranic1DbW8sN
	fey8Ucw==
X-Received: by 2002:a05:6512:39d1:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5bfd95510cdmr7238038e87.3.1793834177876;
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38de44bsm580359e87.84.2026.11.04.15.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:16:17 -0800 (PST)
Message-ID: <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
Date: Thu, 5 Nov 2026 01:16:16 +0200
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
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
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..a65067352b58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,477 @@
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
> +    minItems: 42
> +    maxItems: 42
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src

Please switch to the new model of describing and exploiting
the stand-alone CSI2 PHY devices.

Any CAMSS drivers based on the legacy description of CSIPHYs
should not be accepted into the upstream.

-- 
Best wishes,
Vladimir
