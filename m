Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190523C3F4F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483031; cv=pass; b=G3m7zWFQBlmpcAj7Lj2jnt+7FSPGRfzoNTTKPk/8D+G6id8GfNTd5SY4eiV5SN1em9EETV3FdiQfsD0OyU4oYxcmK6IH9EWzjCTaHqGrL5Nvw97RixpWU4F1x4neA+yD0xak2TIWDaD0AmTUJpzl+aVW871F06+g+trgreJbTlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483031; c=relaxed/simple;
	bh=s9zHSd0QhzvZUu3ozdcfCjxb9AQPmCffjwKW+F9l7K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+DzrRFBVKK9r3Eu18drfdlaG6tcCyQ0eQS6yZ2XCqZuWYIkr9RUx1TUomB6wjJEqPp07L4mNVVS4nufgVjZTMIeq1/QZ6wcoV/J5EPJ2MzgjW6J+OpoV+687i0Dm36wq8vMgsthvUwIyx3RzC1D3r1DIlOK9hvnY+nQiqHek6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfz715TX; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfz715TX"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9c0cd47bbso5282891a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483028; cv=none;
        d=google.com; s=arc-20260327;
        b=qnDBsCzqc48jygAwAy367vK/1HKsZ2j+0slsVD66a+NI5QLfWUoTNSwVfSjq+ZIlCW
         837hHkhKGvkTGC3PHkQED+Y1gzxil7BQkhoMA93GTI835PDxIBPpxJgj2AD52cen/Bsc
         baljvEAORrYdgIvoTkbaAQtHqQ6coIcg71W9yGKm6eAo+Bzt8mgLTUS9irSQr8tg8cbb
         w/KN7LSGmlw2y8Kq3LGJOw7WZU85AVxRjfdinGPmK7AYsKUzw2DjSOzZVwDQQrT3zTHX
         VI1GQOvw45wrNussEHCuAAA0Kk+Iwb8mXH7Kc3NHQfpdXlepAayygQp8itAY27fa1IEb
         BnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        fh=U82R/pwg+GKVyiMsr6blBjWnq3ZZkBU0QB2wnTjUKTQ=;
        b=NHpIJp0w41nhGFDwNEc2IFCDKqVbQCiaIsIB6gTElB7H4lec1kbfu10z2W2MuMjBut
         /5HjqXzRrCi/hIhMMY6UBm2nx+dywFMbmx05JwVfUR87gsz2KI6FHz7rdR7MppO4j6dL
         iukim+qGT/FPvArM34N1YSic8OqYf46Uf5LljMcLTDpV/MSrUX22meUvVp0DQgQT35yl
         4m7HYee0+dcA7sxVh7eYoNWzKW7EJVBZXE53ccect3/CtWpH0lNTyzeZ9Hot58VEXxDK
         hQFaxR4/Epg0CfOsP4bnqyo7RIK7+KT72rU7TToGxQHXo6xWvlJWHaVQ0pE9Fs0+9OXD
         eLCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483028; x=1790087828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=zfz715TXNoXEV9KaE3Aaj/3yTGBhUmh2AosnAcRP3TcD3JDi7lUcg3gQpW4mFVOjNB
         iYJyjdB7oPf08lCBQmz9tLR40AIGJP3cGrX93fbToI5O0rFxf1L0UZNVgy3mmMpHIwAT
         WvUYcil2fwHN+758ozC9LK4mg3W5vRTSVTNMdff5BSdwoQrpOvCtgPdCpqizJ9efC3Aq
         tRj4QczYOIMq/COov+mQ8au+EYGGxz5QC5oLz4vvxSGWUzmxrQPVsyzqLFGSg4/dSK/v
         PsrPZzmNvZ0UYYu3RKtT2YWTe8SzZ5FgsfxWm+HokKMCiO7mPXu+yoKa30Hhxqe0wqt9
         6P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483028; x=1790087828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=rsTZViH/EArE8QL6FO3I2ChQXzMLjfHXwAiJCqzYbabtwV4kf/PMFAJ5sY9tMBYW85
         XylMU7VHsBydumf9deUXOvcoa9mQCm0hSwkMmV1qw175RLEBSqrnKmhdGmE/hdtC+mwn
         YCmUAX/ayDF5wDL6vwPPJyueoL9E0yllTHg6HLGrQNFVCpvfS96C1rI61A2thmgI3Xct
         v1zfuae+xLn87FpEJETFdhfZ0yFBnzpLQJdVTpMMhpEfL6XQuTu+dSLDHfaRK1xFu4he
         2bjrH4ZQnX4HQPiVxBkCNxewLsw9v/wc0KNu7HKk8jmutaZwWXIsZGubgO3ihFLestPU
         evww==
X-Forwarded-Encrypted: i=1; AKwUvBxyc9a16wlJ/2nkIBgZD6v91lJRWhagQrb9OIbWLMOVWZ5TcxEPiBKwZ4dz8poRdZcKM/Y8X1pbFoU/+Lc=@vger.kernel.org
X-Gm-Message-State: AFuF++mTYoLrf5LJlGnjjnNqza3IfLXZ6RlQ3r56/a0NfEUtC9+lJMS9
	ChirkMJZGMdaHN7rYBBJ0A3YHe4F+DXoqsmyiTS/xntZp2TUrsVRBhWcitkm1Shgu4/NVFaBBCX
	+AcPL/YV1rtPNvdp/Aa4g527d0wNvm673HGfXeXnSQw==
X-Gm-Gg: AYBFou3mGH9suh/KaK+w91V4IlO1Vvfbqj7AOKeI+elAOvC+DBlogHeBJ2x2Zuf3PxD
	teW28GS4ThUN+l9ANBIudfnKID/E2rEkf5bXyBNC8FavoKjNhwbR4raAjpA9wt9dUNGrAjQPZl4
	ilnJq0JM5hm8T1Ae45tLBY8DNqnikS18BQxM8cqI0sTW3yf1SHWCu3Vu4n0SN/sBdyzMemmlDLy
	ZGtd8LnPabD3c3qoX2ol8znEv+yZ7TD+7/FcAne1NSxaUrcQCW/6Nxkb5QRg3MG27SyaOy6mG/N
	1uzUj7PBNWbi5tdBBGV+AZwWDBm07x0EOxTCgMkFaFwpTIA2ftnxiPETSOZEV538lNn1aO42h9A
	8ncm+JDLBQkVLMg==
X-Received: by 2002:a05:6402:321f:b0:6a6:32fa:54f4 with SMTP id
 4fb4d7f45d1cf-6a9f62147e2mr5365012a12.19.1789483028305; Tue, 15 Sep 2026
 07:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913123740.203698-1-tturner@lineageos.org> <20260913123740.203698-2-tturner@lineageos.org>
In-Reply-To: <20260913123740.203698-2-tturner@lineageos.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:36:56 +0100
X-Gm-Features: AcwNN1UA7ww0ycDC66g2CaA2kAQpsW144jRswzivDAFwsftYfjODQouGwyp4baQ
Message-ID: <CADrjBPoud7_Bn-BgMX4+MTOyk9Un8M1B-nR1RX3SO3avBqv4GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy A21s (SM-A217F)
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas_turner@talktalk.net, alexey.klimov@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 13:37, Thomas Turner <tturner@lineageos.org> wrote:
>
> Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
> based on the Samsung Exynos850 SoC.
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Changes in v2:
>  - Sort via alphabetical order
>
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..021250497da9 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -232,6 +232,7 @@ properties:
>        - description: Exynos850 based boards
>          items:
>            - enum:
> +              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>
> --
> 2.47.3
>
