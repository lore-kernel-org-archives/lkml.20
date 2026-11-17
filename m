Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893596;
	b=y/w12AuJHOcWRQxR2D8AFSS0trL9I8Ot9lSaQK3palBj4lyfOBErKoQ3m/mUs16k3si9
	 wNZTKSxcCA4dIyThtTzs85ND1ED1AFymbxJJdRH6cYaKMzw95igsSf9XBWW1o3fK+8z1Y
	 8kfV3lW/jkbXMaAx5mDjURhMJJjvAnRUMMf4trhz1bEBDPzsfN9AX8InigcJDNoxB2w0s
	 Sio82M2hdg1V90r+iMfDll5iE+1rffaueAMBWM49c99Tv3SBPbOPCfFQhHl3yldBOkWii
	 ycb4s/5DLw04u+X9ZoNXvEVRAHvjSXAE7FN1R2YjIebEsDMc/o1D/TFfrBJbzGMTc3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
	b=ro4S4VHfaOvBrx0pyVCJ0YbljNG5HE1aSwuqpwXZDqOVNDGwgqidlQsoqQsGBIb2+B1l
	 XGfHNjx4rkzl7yG4Weo7Z8n+d1y33C21C85GaqtcBdbYSd0oaLNk+Bf645WhIAjyDET+O
	 AcYrjuXu/os2lu/sfjR+N+UQZxcUo3xjd47Co8+Vt0MuNy7ORYbklakOLwoOQM36CEfOt
	 qlT3WM2mTarIM7IXunbbsF5rOx6Ostw4BitNnPbdNjIl3nNQiNpg5eN+1l/p6Jh3zBfy8
	 sN2KcrU423EnK/TNGb6Yp7yF+3M1POojbhd4MHahutzdjtlV221QYJmHa3vBhWdbHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AGL+KI8L;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F7606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AGL+KI8L
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so5151507c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893595; x=1795498395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
        b=AGL+KI8LRIwJ8cdflaNKNFX41d2JvLSAp7FK7DVGhFMM95xQ2g6hkZnMXfgy9Dk+tz
         jF/FOlGQCot53XTV7jjbVzexEd1ibyLLbiTnWYmzyGIob6wfhXry4Yrmn9Xjpx4n0mmx
         64xX9MjzM7kY4bo5/t/gzirbKWGfsp9tEyCAHOimcl08rU5Jl4uBa0Wx9mSgCrQuQqsP
         BuKV0XZjl8k+qcTtAmGxUGGvp7T/UmVu1wwVOJRLskCsA7D8hi57ogVTzIBQqTPazWwz
         2lnQjRhPrDRp+kLd+NWigdsX7LEWGmKltMB5scA64g+l8CZQH+UdN3I43rrZuJuzgNuT
         z4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893595; x=1795498395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz1YEfgAYIVyaKhtnxIgh6hL4aaxiRbKUnEOpQeT7xk=;
        b=jmaBhlrdT4brRaT9UxsZf43ddfPiOrHbApkTRcJqwwUog2hgNZrlqLrDVsut9zPnfL
         Igw90vA7Uzjy5GEvY+ilh3bfKiCQtDWAgyIGqhF6EVIyHbrL6KANf/n344CRtV4jsAVJ
         GhZKh0wGkYzcvK07DJSRJkJbThpvv8U0Xcm6fWhGu3xIUFcwfbmhVh1SflH8Re/tqNRA
         5U9npZYURVabiGjXCqboZ/hJ+0EVe7v4ibXrT57EblDJbb7uZnD5mohP7XYXc1hFrJot
         8xtHzwkaQMj9puhTFzzvaEhvp6A6W+OWYPgXK4W5PbixQUQtxVViAfBKNPs8tlq1rHZn
         rK9Q==
X-Forwarded-Encrypted: i=1; AL+hErG8X8W2LUQcwp8ii9M1nCGclU/8b933LXBNw2Pbf288+wEsI7YqA4vpkqeBDFXsEG1HX7K3RWqmZwds9dA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pgXJDluRIoooJHMCGa5HJcn8RpCwJdDTLi9lCcrjzf5HGjrSY
	PTEMFA9TQz1J86sC+HKMzf+4iJrJD0Pe1hZwwLhME42vfYZpjxy/lEqLvtzz6vIUb9E=
X-Gm-Gg: AZFdTZfs+uaIcJLwGm9VVoZsB6+Uf5y5j/IibNEM/O0vBEbV9mzX4egFkjPFWQ9ZQ26
	kW3tRq35lN8RKoq/uHYAG6ku83HRY/qpWtzpimQ59qmQYe0kXl4Kza8bF1tP8PpDgkbgKjl5fK8
	iSriEG3+YGgd7x9FhE7dx7f7d1De/glULfZg3sM9uZ7sbGydadzzMwWVKO605oAtggfcB1M1K/I
	dP4uAEr5PZSYwxpLjFlUuMm35LjG4bGMe8dJ4DPfc4p00wUxGABVA29o/hquQGuhskRpPflPhHu
	F9z4QMjl6bEaGgYRJXGRRFX9+xoidPRI9nykz+wnnH16p5WSL4gmYOjSC46pER5QLbHBwHOD0Mp
	m0887ihEOBlXuN/sJmtzi5gTFHvE5eXKVM7BUOjv7+jNJ2ONIFhZSeP30jM0TcS/UyE8SPdhUAp
	tT85rsu0CCepfLRb7q9P4mcI5Ws/2y2YpCtFI+IRTiMczX7Ox4fPVVObLd7pNm++QVHpLGyN7ej
	u5IcPReL0QeP9wOGWUJQUc/yP5BiZTqh0+TF/GFb5ktSaZpdTuzHstgTQZrhV6mlVreSH0e6lRn
	XqPph/sNapv1EvUV1pL8n/LcmkNiXQ==
X-Received: by 2002:a05:7301:b06:b0:376:13e5:e8fe with SMTP id 5a478bee46e88-37964b08f4cmr11532201eec.3.1794893595271;
        Mon, 16 Nov 2026 21:33:15 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm40174212eec.7.2026.11.16.21.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:33:14 -0800 (PST)
Date: Tue, 17 Nov 2026 11:03:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Majid Hajiheidari <majidhhdri@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abelvesa@kernel.org, mani@kernel.org, admin@mswin.me,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125
 compatible
Message-ID: <avvnF7zQfYhF11so@vireshk-B250M-D3H>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
 <20261115003158.391171-2-majidhhdri@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115003158.391171-2-majidhhdri@gmail.com>

On 15-11-26, 01:31, Majid Hajiheidari wrote:
> Document the cpufreq-hw (OSM) block on SM6125. Like SM6115 it has two
> frequency domains with one register region each, so add it to both the
> compatible list and the two-region constraint.
> 
> Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 98eb36bff..8dfe77d08 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -28,6 +28,7 @@ properties:
>                - qcom,sdm670-cpufreq-hw
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm6115-cpufreq-hw
> +              - qcom,sm6125-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw
> @@ -146,6 +147,7 @@ allOf:
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm4450-cpufreq-epss
>                - qcom,sm6115-cpufreq-hw
> +              - qcom,sm6125-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
>                - qcom,sm6375-cpufreq-epss
>      then:

I hope this can be applied independently.

Applied. Thanks.

-- 
viresh
