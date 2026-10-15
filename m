Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BC8446BE0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073226; cv=none; b=TQQaoOtaTTvlna8AohY9zCAl8ujP3BprOICMIdnOFQKLdtjVYLf2pitRutg/uLuLN16e5f0uvChamiluc1h8+fWYjqwSFJQ8AewfNv6PsS1KjDLXZiryWD9D5ECyzzhe7kUmVTCMKw2nabkkVEFo27YR0lERMBc9kGzcCV6VZns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073226; c=relaxed/simple;
	bh=G0H4oMfrqAtcIYgnag5JUtjm5ndYR/YiS93lKI2Ksy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEhl38r+6nEZfH/CuT7LtBfapdYqUpISa4RJDlpq49e4/r9sequ3kFbajPweqv5s6CGZootPjLtyYn/LLJoJMhhlALwSKdr2WaV8jqmTd9SHfMZFhtQkgB3AJmAVD6KebJg2cJQFdISIOck9GFtQH5WjWO/Vh2Di1A4rZPvWWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VUbFA0QN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VUbFA0QN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c20ce3c118aso265466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792073223; x=1792678023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x66qBww20CHtwfM8AwYvYnWu/nKW/hm6sMO9/8Mj+38=;
        b=VUbFA0QN4Bk3OSQ/P3h3VbgSi3T/8wD7WIxP12A4UJ7JZ34Kzc7xq2OQmdOb1UYbmE
         VPe9OIzvC7rMo/BGY7jvCod3rKMItPRNgflzOl/81YKM2HBCl0QYYbvagdrUa0pzhokG
         KUn+01Sd3CfMlyA/vCg53jqbnssP11eEHYAJ8I7UCP7KeML7yPw9RLJv/TcNHfs/FwLM
         xqEPhZQIcZ0vBLHDLBhWEEFzH2MNhMV6thIHIt4EhPMwKrRRZ+SMAZzyhP4MKqVX/3YF
         kxMQAjXlxGCz+5/1Vmelce0Rz8hc0CzSEnW+1ct216Dc5CK9n4DwHxHV2udp6DSysqek
         HMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073223; x=1792678023;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x66qBww20CHtwfM8AwYvYnWu/nKW/hm6sMO9/8Mj+38=;
        b=JXT75vNGz4NiQc8H2T910qQkVVTcByRM1gQUKRkd2eg6w50WFyvjc7NIMw/0YmoMjk
         FrigZoxKS/JAT0Rw769RKVmFlBnq5E/tL5KM7kFl4EX20xLK0fJ32o9398LY9w/VYRmY
         VP7d7hdRywa6q2bEZA17D8VIgeKR0DdVhkGWVGfmozeeTfqGikRKy4zwfnn2gwbUIgIF
         o3IvcMGDl4ex7sw8GpAm9jjuCaSjhZ1vpXO27UEAuU3IkHJgHqHMR1gx0EbuDPS5A898
         a7sa45Xac9z2nzm9LDhJIM632B8rV7ym/L74E3aTZTU6bdMG7YCN3i+lTwnOmGHvWgpX
         sZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLLi8wUlr70q3PJ9YY9ok4ESnvBx4RyFnjnfHgeBgRiMjrP5RJkBKoBIBCWhO5dxsSJ5VSBvIQ3ARXu8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5gX2fSAqdtE1vL3IYoNXcNL4GZUI56qTKFfCerPX96ghAXnr5
	PINmEybx+tjOx558oPD3It00s/WcmNRz73jRNYfif6ve4/6A5CaWxfoy7mwwBUsD1KsrevY4O8T
	M/mLK
X-Gm-Gg: AYBFou0Abakp7Um8kMAO//cSn0TUGuEZ+9Gcnr6Wp7hW4ItVcDs9oA4pEDLmVCA2m62
	8aZqgdjNsHEDQnBV5P5ELntKQ8qIb+AmyXZEBJYPBqlIzpSQ/QEc6iNYHsRbsUjVPqiTOQ2A1BN
	G66vwdNYV6/89FjKvvJ7HNtE6E6fCm0w+91GtAAbE7oN74a9PsDe7nWmPh6uel6cbOb1QYiTKyZ
	kCr5L04OefZT4ifKjLS3/N7JMqP3VWSTV7hu5WweMDri0Ghg+UkULyUlZ78FLVxxJUeDW0TwzXp
	/J1wQGQ9l3TiPPm6AXcMDAbhLa2e9vX/FCrvtyFjlitU0CrHSdzvEkeDKlDZpLcMqoV6BXeIi2X
	hFDGOHj9ECLMSTgpYxKVfE7v0Tz/y3qhN09TeUZpMEVNvtcBlNXjUb/yix9HWTtIPZtRupQeRwm
	VnXqvf1jZAE9Z2U9dOryT1GodaLI5w5ELR27jzsT+cqbQS83Nrihi2tTC3enhcTFvqKjpnMA8m9
	A3Wkf25MQ==
X-Received: by 2002:a17:907:9495:b0:c25:f7db:4be9 with SMTP id a640c23a62f3a-c40201117d7mr13564866b.15.1792073223392;
        Thu, 15 Oct 2026 07:07:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.7.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6bea942sm129303566b.11.2026.10.15.07.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:07:02 -0700 (PDT)
Message-ID: <1e1c3706-adff-4049-a14d-28bbeb3a6a01@linaro.org>
Date: Thu, 15 Oct 2026 15:07:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
 <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 09:11, Wenmeng Liu wrote:
> Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.
> 
> The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
> CAMSS. Compared to X1E80100 it has:
> - 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
> - 1 x IFE instead of 2
> - only the ahb and hf_mnoc interconnect paths
> 
> The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
> X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
> TPG and CSID wrapper resources.
> 
> The CSIPHYs are handled through the PHY API, so no CSIPHY
> resources other than the lane format are needed.
> 
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
