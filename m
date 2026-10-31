Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446956;
	b=cPN1jTiQE5LfDfzcxXbvUXvdXnnuTVtM4ndChD5IX0ipWwAtSarImK5/EEgL/tFECf14
	 qyc35eu6Y2hlbnQyP86OZHu3ZEZMAti1h1Dth/CpjAQRw20mO5KIVtI/lowjG/r18vEg9
	 RJ4Fq4Aisfkd+fjr0AMPPGgKDs/c6WaeKy/JrfPR/dBbRErk8ozygbTwFc+/UdJ9MrmDk
	 gVs8GyarUeqVZIOKjvzfk90zeuP0by65iKDfWeOFX9LI8K3ZwG1DBKZJfN+aiUBKSiwmc
	 8BJuC6oWtSYdVpaHHVcdfmPAn9A1wnCF4jQPUBRM0oUrbFSWqz2XrKoP7s5j5EAR9zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
	b=laPDCCle1pPWkztsF1p8bljWVs5SokAups8mFbEznKi3CBH2xanyNFgxXGLf06h4aS/+
	 y23JvRpwB0/fJD/4fOaCpAaz3lPyl7OhVChngW8tqLZjp8u3OOJCKT+GvKfkTFwjwIPUZ
	 +1nUiCJa6tcjAkGZImmAN57H+rCy4p7se0NnnDyyOmZ9G8m2fV7xwKtfWN0Ygy6UZFAyQ
	 zzFuesiCa3yPbWYj2fE0FgMlDfuAOfsBOWmg8QkwhxKZn7xK+oCZp8YHNrEvSMJt3YTvt
	 zcJ6yBdP3r8TGLv2fgATxorlkvjFN0VqFXNkxQma8jxqP3UnXnMszT6kKVSWX0QRvug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F5606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkoH1ROu
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4716d76fso226295e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793446954; x=1794051754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=NkoH1ROubAkIWDPJ1im0+DFkTYQ+QDsHYpHJ1b8JVv+AUR9kcj+duOMIfsmFLCq1qK
         enT3w2pAHrpQwp47W6dI27rwi8EKz3Iym3s5uKJMLdj2KZj0A/NjGOeM3+lHpRb/LdSq
         08bXx9xCxLgeuqrMci2rD+XbGl1mFl62Uez72WHtSsnnX+HEyTmEV4tDW+n0x6alneih
         VqRZSvP6mnGJy7CI3mEWU3+ity1xemK5Rfjr946pzrYEcW6GZtcUOqgZKRBRD7MmnrHW
         OZxvZpWCHTlwzTqocCke0IoUBhtBN5m9ZqSbDbFUxPTzysYHxj9nCiT1lcBDF5ZuKL0d
         W9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446954; x=1794051754;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upwfxi0DBGFEpM8kAk0eqTBac2ACweYPhkRwvSbMeZg=;
        b=nVYLw+rXHsBOPbrAf1vodseDRRBUJSA5zoRjvEwm/KMaM0+5D5gXD/D3hSiI2QXnk8
         XhLr0apluTWuoVVmvqXA7jHpAC3UARwqdiwXY3aIBwsNrk0CIbkRW9RQ2BAYHrg/BQBE
         0sAFprFbxTFtPCPbVxthDHqHBMED38cfTM6cPReZK4hP4+niutxNdYCwoUSf5Rh1gAlO
         Ttw1J/SS00bePMdk4ypOYk5tB44nFeerUnzCqhvWXkvEF3mNJL/ZzLYL2trrVeaIp9zi
         f3h0v+/M/8nbNdy2Ol75y0M2jDgFnoaVvlox/k7aVxaOTcC/mUIP3nfiIbGI8OxgXY3/
         My0w==
X-Forwarded-Encrypted: i=1; AKwUvBwlOwh+HlmIyrr2/7MGy++KQy2E5WPBs4z2bIF8pgjpJXfy8aeBO/6c/Nx8l8P0C+stiaQwAXgd47BHBqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL6uehMCSQHgtFu66fXKtmVX2ZZHCp3jqG8TcVavqDofa5A2Co
	klavOxPxjuZu6KaHheOxiJdMGWklSscSHlRP4LkviEu4q/AIgpppeWZ72DMtpRT7Ec8=
X-Gm-Gg: AYBFou1wxuDnwUEe/dls7eYqZ30gfxS55nLQtJlGTwgAPC7CkOqhlOIo4TsbNFkACPK
	VTdvza1YVgAL68qyir02BI8gmar3DXc2eHuvNFAQwyuztyXLJ0teyAtjBTy/nFk/IKIyWnFEOGK
	yn48Ro0o3oh589UrZZfaBHqrF8Am88GGM8YXX0Oy12SfBjbKONqs8/F4TkPZrVa+Hq9HavMtJg5
	10lzwL4fDw9Kxc14VSKH8i210qUugfVLaN7nz37ConbTt+QUNiSrTV04lv5kfx7GvacgXEQXBIf
	K7lrHH7YXIfvIzAIjjwrrl7U1mMCh8c2KDwsZBJrYB3nNIZ6V+EQSSA1y8EHF58VOQolzlOWSLY
	cfHFvz9UEFxkisK6/mvHrFcCdHuWNTL68rX1pqd96wK9TqZOgK1D4kn1p8BxMSTAtQ0b+hlMn2j
	fad87rm6Q5cyJZsgxfY27tTD57EnMYgHePqQBevqTH7PHVkUYepKvsJm7Xqsl5dNS3zG0srZp/t
	b7eQGHsNNEk8n+7MHBUo7eoRF361BezSq6LQWNt6DN8X7X6Yy6uzs+fpzQQJ3b3SCUpiBhYmRCp
	93nTjzMDtNio/KisByqHihFu5jYcimo4VnjS6QHoPVsHRi8S6QlS/9PS0YA+FI9ALurcaxAiBVU
	apYT9/UQ=
X-Received: by 2002:a05:6512:220d:b0:5bf:b8f1:80ce with SMTP id 2adb3069b0e04-5bfd9578721mr1660720e87.5.1793446954460;
        Sat, 31 Oct 2026 04:42:34 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740446sm536809e87.61.2026.10.31.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 04:42:33 -0700 (PDT)
Message-ID: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Date: Sat, 31 Oct 2026 13:42:32 +0200
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
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 17:20, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Wrong, it is NOT compatible.

Due to the functional difference in the register offset, which is
described in the patch 0002, it is NOT possible to fallback to
"qcom,x1e80100-csi2-phy" compatible device driver, and there shall
be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2..6e9eb8e265df 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -17,7 +17,9 @@ description:
>   properties:
>     compatible:
>       oneOf:
> -      - const: qcom,x1e80100-csi2-phy
> +      - enum:
> +          - qcom,kaanapali-csi2-phy
> +          - qcom,x1e80100-csi2-phy
>         - items:
>             - const: qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> 

-- 
Best wishes,
Vladimir
