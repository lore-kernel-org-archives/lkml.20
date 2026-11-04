Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833963;
	b=aX5o1o4Agp+NWsBwR7FChttctrV9wve5gFG21uxShT/h+1aVeouF8ljCNqi/upDEAlXv
	 urV9drB1FdlyxvyVj1lKnjXoisTtP7plbF1bmUo/tbXu/Lac/NCC6doYTAeK9QFf/QuXy
	 ucHGdeB3xjbCo2x1Cb4tECUbWTa07gvQ2UF9xzOduDLEgm+JK9ud3fIQoHzs/LL+J1QNF
	 ADDSXo1+3/SwTPGGnj60eXdn3o1SF5q2q5Olbf/KXkEDXJKXe0XkyqoJZRWne1Y61DX+V
	 691vLyIhZJqyI3LOi4dBpbrqmSMEILgz1+wWD906ipVDSKxmycINPXQiXx+yGn+iw2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
	b=IiKa3dUaaP7ayt60yIiNSXJsQl+Htp6er08mBXchBHXmFffwX7pUcCAbV4frS9RrHaia
	 5oFTVTTxgcirVjl7NL0wyOxYsls5Fd3N8hFPFoNLOJ+BHzBsIjJSkDizShviewl5QFw1p
	 cU46NRbU09VwjtfHp6SyJz8gtjXt8lTbaTK6/f2Qq0tIzcZLcESuP2b6xocXH1QVfD4Ug
	 Sha42mtr0AT/Zz0DtUcBZ3KPh/KGIWmriE01EfzOhTEB8PgyP/onym8Og7xTFSvSIPxyv
	 yI2ZxpxWELlFiZUgIvK+8wkc6MUmGgtZ5MO2irOOXK5YgC4UnR3L661/JkYMHu10orQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979B5606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979B5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gs9pV5e5
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bb786c89c8so116226e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793833961; x=1794438761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=gs9pV5e5Um20Qgo2XDi0crgyXVOH8hndAHDdS9S8n+43dJaechcABgzMF3gj9EfEey
         KIuAT3G2FtKH/EJj1mtS1PFBWAxdRZmTdwvvqANPzSJZLEqsmxrOY60co79CiqVHLgpx
         I5T962ziyuGsNoMsE2hTh7U2V4DLW3/oe5rwcxjoSHX2o/K8U5u3Pu1/gKksHc1W0OKf
         j0ZwfHiBu3eoKoUKeSfBMPHKlJO2yCbPHSem0oghIS/EpeGTfPWJpe7jR/8Mqq43IY7T
         sNQkzUZWyy7FKByarHD1qsabOlRFUrBvwsAgNUPm7mHBowzx/reelAmpt3hqobysshdX
         V8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833961; x=1794438761;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lBfIR/LafX25Og3OCJQ1wVKuVTFo8wSNFYi96ni0r8=;
        b=q7DA8CtrvzQN4gPa+FGIM7S57Vs/O4VDhHr4/SXa91U7MEd2URxgPnGrc1CZb39xP9
         YH6cDRaVnyNv2xd6N4WIdBgakcdYp28qJ8pC6919oOHOOMNsh+KYjqxOOD276Bnw2UL3
         Om2j5oJOGOviBEYuufde0Dftmstu84e4GjTpirWJO4gGrSI/TFLg2b2ZiA5HXinYbRgg
         J7+fRUAmjQkYkZzSz0gqd+3eH2ZtzGxJLBUgeBhVpLHNLyfq2DHPGTJ75QoM8y0C2NyU
         eAyUYIKY+DnXGR+RGLXJZJmLDIXdVfipnhSJ+6PkrvzUMb0LnfVt6ObXBRO2ImRQMKR+
         ZxfQ==
X-Forwarded-Encrypted: i=1; AKwUvByynVH5yhfSaHKTGJtKUM7ODZA063/76lCZGpn+6VXLePNjOpc6EkqPv/JW26FO5l4dU32HESI3zr+Wbn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aaFQQ+EVGZgAimqvlWGA6+7jx+M0+4co8PtMRVhF3h4mzZFNX
	njv9ehyd/TA1juaO24QDMRhlpiS3YsbV915mrueaek9AZ9SiAcuNqJ6l8vv36UcZhpg=
X-Gm-Gg: AYBFou3KtEkGm4VRfcKSmh81Q4nhuLKtYBzfUhQkNErbNV4LYKXy+nkoUxShNgtoYls
	cXcpfecx5D84a1qwhuiPzWQ6Su0/tWB/aZeFhP414b6GOlRwELTPFx9QmnSDykEfOo0EXJgFTSu
	ogQPYPzAD1kANUOvjfpxrpVlePHF13+I8fH32XAvHXsSSoFU/r43v+zzUscMEt2UeViwzvpXXE0
	klPtZm2tpXBIgpuI8Q84SpqGmFKdxde6Bz5K5GV7ZkwA+RqBnlmld6YxdVIWJVAaTUvwOhT+INe
	SSx0mfAgeoaMbAAn0te7g0nT+pzFDKr4kaI+PST/1N1c2RhrtoXvTi+ypG2CeeAom3kB2NmR0Ue
	tYOZ9Sbafsvc8uEWnO2WmcZttdXznWg68D1FIRuNqM/UjahaGEZS6YoT+oLN0i4+UUhF+ctuwIJ
	CXYryt3e8+2KvF5gT5vVqXRHLM1a5nXP8Rm8T+Oq3owG++EAVub7uH8kw5hBtr0ZqlTC0YxnGW6
	7H2vQxzsy5ikwTfjZVXbENh6TK+W1bIxCFkJIGiNSMnexyc4LVq41CfGtglueCwJXRiHqBhSc4n
	q/fxR02RDLTmutLG2SjSPIruoif9rWJQTqiIx3Hmtdk5T2oog+3ukyCVQdlFTJDR4krP/iNA0xg
	ZvMHVVrs=
X-Received: by 2002:a05:6512:3a89:b0:5bf:f642:bb43 with SMTP id 2adb3069b0e04-5bff642bd0emr1119881e87.3.1793833960601;
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38cf7bcsm540327e87.71.2026.11.04.15.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:12:40 -0800 (PST)
Message-ID: <ec559f1d-0ecd-4de8-9baa-a0a6d5aac5b8@linaro.org>
Date: Thu, 5 Nov 2026 01:12:39 +0200
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
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
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
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 22:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..b545fd2378da 100644
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
> 

Apart of the update to the list of compatibles it's expected to document
the clocks.

-- 
Best wishes,
Vladimir
