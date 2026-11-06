Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000385;
	b=P8w4vyDmf8PwuTa3We2q2CCBYMg7/92/tVcW9cNz09Z/RdbwpftClvbQ2o0jyT/aY7tl
	 15c5ESdG6GCCWm6S6AW6yCVNq/1pNPmRmUzfZXncn0fljx3bFR9jpkkSAAzneeZEtNDnO
	 5IRhAjC7bBZDZpDp8ZPumTjDQZLXaFJT7S0DHEn0tClsXD/6DfuBBUFbo6D68igJ6dhVg
	 0ynIJXMsipaSAaLr5aSex5DGU6b2LlHR+1IGm+VdPbnPVCFuDqTT2+f2Ec7RT4ZuAwEOy
	 OC6YNXEw8+z4r3yLrjDXgEFDnNFAeS4gQQstAJS3vocwtW8cLM1rbqMGTfUgsr8s+Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
	b=fvCMOUsABvu0Za1ynSu3UENBuSsDQn76i494V5hvxGNp1RuC8xR29ovHAckaqCASrPrB
	 jlTg1cNx69BCpOhhJrSitNlPFRHSxGqTy+V2HTnp/IwqazkRiZHPm9s2wkDxlJFjaaS3r
	 nPY2WiqjQ/75hj21+Io4zIKYE9qSWDh8HVG1VMYRd0tJmBsL3yG4zDIXxqBeu7WX5BFr0
	 4eloB6s7zvBt9NgcSBD5nsVHQK/2R17R8qUDiZZRvHG522kYkKJzA4I4ouIsEaUxncjvp
	 cQ1oXuMVqmZQmJiiWE3vo3eXSiZxAUxopm5AXyn2Y5x3XNMsRjLFt/0mCc6fvgIQs+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3961D606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3961D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso49966e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794000382; x=1794605182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=fElw+eI5A1w3IHAlBMJDLXRdBdImdRRuG7tpGlwkAMmBHAk16RV4TH/P0ZmbfhQYpp
         US2j+t2uTpkkH6Tvzs7OH4p4mgNUfQ9kbl2ANOSRPJSY34f++LIT70jAr/dBguYOgU1+
         0pfQQhuSZa/m9R5bhgoimw63HMKZMgihXiH6MUVCIYnXubaiAJZMT4kjUqLQLQYamQV7
         ADuxWSh3ffVdPJN5Mf9g8EhiqF/11g4M0XzKm2TlnCPDha+NBvRjeJ4Q9UjaAIb8cAIN
         bEsbw5aJM7boNpVe9K+HcYqpeB60vwmXjr/2qzSbU+YM6FsexXa4G+xwUar6b+1OoWIe
         6KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000382; x=1794605182;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=ENXgCZFrur0HJRylbKETFiR20hr30lYfDCtJhiKaKO2tNsggeIoO9XG0ew79seAspv
         3NpweFLLu8NGQ12yiBD+GPDx9Wx6FXWF9GLijtuPMxP4OfFp2GcUyPzZm/731B2HsMzc
         uOLKKIygEnWtrqqLX+EmlVsduzqLwRgIABRpJiMxmf7Orcb74T+T7kQ5G1g12lfoBYGj
         fuXIacqXghH7/caxLpqgXnJtZorsv2n73r/qY+a2aOU7xp5cI3zV3jHSAuxdEb1A/Rio
         ysB6GvYtfLNTjhFNh6CWN+1GkzxI808ZxHVF4Cu4nLmZSZb0qzZpK/oaBcj60R8WhRD3
         rbeA==
X-Forwarded-Encrypted: i=1; AL+hErHkHHLJizr5IWwXTtpdnYpqvj0ML9kBhRNsbTDIHoysvdrBeB3s25oiIj1TsBVRiufsDyMpBTKHquTuFDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1mwXHDQGPk+bSOwOe3ePEAPycxgf4E2Lx6sTEMzzIsyTKwttO
	VEcNVKscVslWLaH4QqAv04TlLAmQluun5S8uSy8H9WmoJTYOT0m9zLR1viUdeEryApI=
X-Gm-Gg: AYBFou39gHKiceXa3cFPEr8FneQh9FKaSf7EKlBDETdzC9h4fd960IErf6osi4Fh0r4
	YG/UhhWfcuolH0xchqtoDHqal3WxUK8jICXzPHTjmH358+qREdm4OcRNQdk6DFj9q+jqXLW6cvG
	/clgc82YWkfRITBes+ttPzzIf6S7aKw+w7tQxFMzSXuA7Q5TBj+lJe+Kvl0BBH/ZKHPAI2EjMi7
	P8y59RuedlfILBTZBaV08PYxc6J6Hu7woGMl23HAu15n7Tx78wW+eFLvKvjazIHayDRZil1WKUR
	Y2HXm9eBCUptH33ydQWkTbtcOzulMwr9LkZVaMspm3BEMIP6fpoMvty2a7CwYI6VYA7OMqAqziB
	guchCWnUa3J4VBJkBPMPz0O3QguouAYdrMqWHaMQjQwJo02qsEnY5nXxR017h4xxuTzSBZtin6+
	EjC8SCFokkoXMT+5RlL22nqn1rmw+mhR3ab/yW3LJHmvSHtfxhEUdGYa2i8MH85+bPn1wJ6hwV0
	CBAnRi7ruoAePRf4/XXFPjSDR39dELm8faWzoXTAkqmT7Ozs6AjRHscwqEgH32DEizDvR9ABY6t
	dP4v2eg4tZkUU5fi8vfvfAFU/mQIg35kQDm9Jgx4JAx4juXeaZNY2RFNiFmUC0pnqdJrJbMU2E5
	/LstxypAk2S8yWSb4C3nfSXIZX7M=
X-Received: by 2002:ac2:5690:0:b0:5bf:ff57:b346 with SMTP id 2adb3069b0e04-5c003c44406mr1296500e87.5.1794000382152;
        Fri, 06 Nov 2026 13:26:22 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00ba6e7d0sm4667e87.64.2026.11.06.13.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:26:21 -0800 (PST)
Message-ID: <ba22b7a6-83a9-43d3-9eab-93503e23a76e@linaro.org>
Date: Fri, 6 Nov 2026 23:26:20 +0200
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
Subject: Re: [PATCH v3 1/7] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 20:35, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..1e7a8efaa398 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> @@ -218,6 +219,7 @@ allOf:
>             contains:
>               enum:
>                 - qcom,sc7280-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>       then:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
