Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791144;
	b=SW+3dAKFT3BHcX6cj79rND6FZidLcGRJM5Iu2qnUYBPsk8daY3DYEsveYeKJpuhIMdda
	 fWe1Kf7XA4b9HINt5ZJRK5EmZ78WLoOR8j9mdDwtL76RV8NmMzZJppvpAO3wmHchxSLoK
	 sgQvxPeV8YjkFi6fIUOt4HA6W4UOTcjLpd7WIX8lXE0298Vs/Nnvwx2iW4g2Bwc+/ADhp
	 m1oKqsvdDDKYUSKAfhwzf0zuB27sjsVhBO5I/mPKETuGv7fiqq/HwtDtDZjdYMUCFrLuz
	 Wjw3F06wuWzFcovAFDtfOIo1senEGElzjXAl8TJqCt2EIm7KW4LFFP45SjG8o9y/lBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
	b=SSQ6hoFeWDl3G4+4UoQwPv3XBYOHSa1OfyqV+6NWlHdU6JRZtiRFZa22z3oo62UpZBv7
	 QPJrDQo1JiszqQBA5HAvYVTSH9dQxNzgvgidf8T2yLnsm+nDyCBWfVslCZ5e1da5SlMkX
	 BlKb5OZNcii6HaPs0dgg978JQ9/UARA5EDWjHfcD+MI9dQvYNMHtyuSbQB4zOWA7Jnt4Y
	 QKWu71VkHHpOrlCgQx84DjkLv8i93/AauR/AxcJATRdx6tKK+Wax0HHV7SpYd7QMVGcZs
	 iMZ60xGKDI3zH6RSp50I2CqBnMq9/Ltn/JINkSUxYkW/tMKagtmwgyTptOPq18UE7kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="gW/lVNEr";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA8F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gW/lVNEr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso850035e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792791142; x=1793395942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
        b=gW/lVNErkWubXa1IK5n1Pca6MEI56259qgdOLKwzMCmA0zMYTMRis6aNpLK216moqD
         gPVhyYHf70MniXrc1ts0otBaqIRS7oXxy6ab1m2qDUNct93aiU98mzTTyzrsRbCsvXZd
         W4aMyl9fw1PxNNM6zy1NmVPdWEN4nhQ33mrNH4N+fG4rOv1smC6MLPpH9EtsJDzCd2Rc
         Tq2Pyxrhi/fVsYre0eT0cgKZfCtcNZSwvB9e9p09Twh537oAJNc40e4ZO7f0QHmvyhsk
         c3RtQXjbIgerz+NOlIH3c7JSNpRlbRNjfQJcLC2oQPjJ9JhUEYMpFqlZ/xqC+mcyDKke
         huFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791142; x=1793395942;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
        b=ekWMM2SAJSSzipuc9TJPgACy/8M66+WVon9t8iAARXIKOEr2JWy2SCJ2OZ/tTY0dyJ
         IHTUfqgF7/rEunP5mkQ0ENcnOf4VnvlpWIBP6wdfE+wNrYI8QaIVDEy6Uw59EHyJVaw3
         Qne99KT7Ng03n5nj1nlRUH+R/mH4jEs++j3leIB3rVh6VPpnPqG1lJfVwBejyR+uezvj
         2pOnU47nhf/+O313eOJAt5tJWso7jErMdQ3+qV7jTCsx1CsEug/VmAcE40OxHsgZCR+z
         171nxSWAVMS8jHIRjDanHuq8T0h+3toaXftm4+mut2EvV/Eii3SGJpYBvqD6oc4aJYJl
         z8AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpG+9jRl3tvMfNE4xm0Y9d2j9UbC3odgZXDFpIiqK2IjoczQKQ95zAirvdeAg68bXYOPgfeaPQUj4XUPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZB4fPB0Frk8LO+KJjX7CiAWRcmYjqxZTMWmS7JOxqWiJoek9H
	17nCdeIBr7bt10NZVNCjLgEndUBUFW3y0OHT0aqCyhGP+mrbQ2SBcJ5eeyz5po+BzrU=
X-Gm-Gg: AYBFou0vsTOyaQCO4ZD7O7Z9klpZIkDTWMn158ZdvR7qJKy1HeKCPvCn3s3CXcMlb8X
	bHVPf1ZIo8jdIR7AlXglx15X8Qc2Y4fFvR1XT2Q+7G5Uz6bESE1p0B6rS2NCJKy7GYpmAUOdpGt
	cVyjVpkeLASO0plLdG2JVacAQ3O9sRu6DeFo8S3JER7+9TMnLa72qi8aTPEGsOFhKQyLXqgq3V8
	4/ta25El7lavStg+Xq0B9gRWNRkr+cFwdu9bEZaG+b/+rcSdJnplOEFlDIdyF6OPUtbuFVNIexK
	C+eud5C7ecyu0GzfQQQNnl5k8kx6684sgzT0VjNirSPR4kv8z4G+lwU1pv0tQQuJuAeba1K+uqS
	KDp7VYAz5H2CBpMJdcSBvMPEUKIA+kGVzHBUgupllRqP3zcIlQ26tGyRXgh3VquEahJDJaRmwwg
	vUpkrN+WNIKVei8zjrYBQpM9gZeMVOKWp5Ywggp7RD2PFW8Unpk2rJn/m3ffHCp/EvasErVusi1
	EArIRPIKOwF7e4CFRmu/R8bWiDFj3QaLyd7n3WuXFJgg2j65dri0ip4ZAouwvtlLlv9
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr2035185e9.26.1792791142061;
        Fri, 23 Oct 2026 14:32:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm10678435e9.13.2026.10.23.14.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:32:21 -0700 (PDT)
Message-ID: <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
Date: Fri, 23 Oct 2026 22:32:15 +0100
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
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock
 rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 16:28, Atanas Filipov wrote:
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
> 
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
> 
> Signed-off-by: Atanas Filipov<atanas.filipov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index c54185c93a8a..7fe12049b78a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
>   		.clock_rate = { { 400000000 },
>   				{ 400000000 },
> -				{ 350000000, 475000000, 576000000, 720000000 },
> +				{ 0 },
>   				{ 100000000, 200000000, 300000000, 400000000 },
>   				{ 0 } },

This sounds like it needs a Fixes: tag

---
bod
