Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBAC377550
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812630; cv=none; b=J4BEclvGpIctV02BXyCqx7hLvJJ4tBvOxo6rMkcjVbIeke9Y/HyMEToQXdj7+r5ewfOoZ9E+d7LLUmhuB9HQYOD4hUBXNDKEV5V8+aNA7v/SUUmHC9qZ4w5zvraazX3NVmDAP6cCmJDQ+NbwhsPzgY1RML/1ljcKosmSAq0PNuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812630; c=relaxed/simple;
	bh=klYpvtSOAIez44kpWs1v0eOeO3eNpRfwfPOMbeNagbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPO/cyu7IcHWZ+eGjxM5y6YYQjJsRWmEYGWX5WjoByNt9Kgv+GgN85PVtcL7tvWJjZJLzMJ7aKHthEuOcA0Ypo3by4ugMna72gPq+HNQPdTLu+pc/41Uq5GvK2yuvoSOQrDZ1k4QDoDGOE0hSqHXgA9nbHWz0CkinIXzB7inpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svmyrrrU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svmyrrrU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso193971266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812627; x=1792417427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=svmyrrrUo3IBwVUrHUz5XOIRL6IR4SKFPpuJiXCQocCfRp2ykDDOQxpdLn/6csAZs8
         3snMICySepg7Usag21gkcq/lEWG8CPCQlQKbk5r/PrfRCCsMSTSsiSGolqAVdL5fw94b
         eG3p8KkwqSZ8eEVJ6epsxq/tKief/HN6hotKiG7uZxZTnNtzDC6VVK3NCl0VOe5CqwnC
         ZdQlUDrkS4T2A9sCLQzuQ4qWKGEBMUER16VTe5AzukvKY1579jmyIzZCzbHKWCof+6gF
         xodnr6RguTZtOfamTlgIjp/Aiy641NmtRcW5rm+TKnXFYGQ74sVJBVFPXfSrCwz3zjIq
         T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812627; x=1792417427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGwPh++pWh8JXmtP/Z4yTF2OlJIVwWazwmaj6HsGs3U=;
        b=br3srxp6fVriktNl5B/9qOKScSY7/B2w10Ack1nA+mqtMvEw3WNMHqS5QwwWtJXUNm
         Eu9d84+JcLtEIV1GiS3S0R816G2bHqfB5CmOeQL3EJIMse9yk7SpJ3kBAHUInE/5UEmn
         EbR58mQd2G1OWYdVvZ8XiPs8iYoi5Ib17kfEXOg2YYJ69fTvpN3ewsaKHueyN7zQUfcb
         7+gfu6jQbU5MnqKxf4a3/xLT0pIdUE8lygKK//xeyLJrBWe0t9yOLmOI0/bmQVRgD8e3
         EseRz/hiS7a2tgHKwCp/aKKZekevwWP9ib2gr2Okd5dAF/Fqkjngj2jt5psp839vG4CI
         ADVA==
X-Forwarded-Encrypted: i=1; AKwUvBwKYTROUut7FB436KAwfWxloSf6KXE0gpu04O8cI4ZHiQtU2QO/G5B6j8jpn5y8dmzTN/W7uqGaXp9/dwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAofxJUyA2D2Z9Ul7M2gY0fQF7Vj+yseQwMiIsP5MNXGvNf6ov
	hDllPO9DJU5fwGeNY3sW++/TOYCJfXmNk0LZLN1cTfIzIb/dnK3zcBWCWeAbym5F7X4=
X-Gm-Gg: AYBFou1c0QofxY3pNCarlsD4CW5FA5VdNPgk/DfWJaZwZmEIVtO8tQTkbskjr8FXLU7
	hPFFTOv0qSNEhc2KMMsONiziGhTCdlXmKGGXQrdI9iNCpWkrhHjHcMiJD2pGbXIBwQbvklghY/J
	C/FkBch6nFz9gfCuz96cN2x0Int0X5gnGpr4eSHsQ65RVaqStkIrEu9+FDO3+zkls7PtI4jX6ZI
	+xPzcsAkI1dbYIcBxlF+wXocYm5yNmqeek9sdkZ/OuvrtkcYENliEQlKBxMs5lh2p/KaKalv1rH
	wPmq2FnWbejaKocj9yjrsA8tm/zDRQ1CMaa8oDugO31rD95Nj3GX0NPJ7Y6vvkHHrZkliNlBwmI
	BYklPQuWWD5AitDEPSW7aBfOegUjCeHiRKO/I2sP6euNR9K3g/yG8IN6W8y3G7y3LEQF1nxqI5i
	Pi5aeDiuHLKjPjXNMoRmQHpU0mFxCcfp4OttBPFYDteFjhHMR7E6qtaJ5sqPZ34boasSqr9B4EU
	Dtq64YEfuuaZJyZamM+VSo=
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr897992966b.21.1791812627292;
        Mon, 12 Oct 2026 06:43:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3456933dd1sm168189366b.50.2026.10.12.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:43:45 -0700 (PDT)
Message-ID: <4ba1f9b2-c300-4942-b686-4bd690c57418@linaro.org>
Date: Mon, 12 Oct 2026 14:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs.
> Allow their register regions as optional trailing entries.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> index 4b9ab1352e91..05101dc97711 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> @@ -17,7 +17,8 @@ properties:
>       const: qcom,sm8550-camss
>   
>     reg:
> -    maxItems: 19
> +    minItems: 19
> +    maxItems: 22
>   
>     reg-names:
>       items:
> @@ -40,6 +41,10 @@ properties:
>         - const: vfe2
>         - const: vfe_lite0
>         - const: vfe_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +    minItems: 19
>   
>     clocks:
>       maxItems: 36
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
