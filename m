Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871876;
	b=r12ICWWgHztGJZCCJSe6vbUurfl5WUhX2PRWnF8coKfx+1K0GzpyTcMOqGqLv8O26uPF
	 HBatk0DGVWbrSL/djbaLjrFeoR1um8wMe4jhIuca2HWfVad8zZ4quOFLT4OABoZYPQXfI
	 oemus+xHR4XjPkakunZSuALxmXx0TioK2seOBBJicbliUn+fDIRnN+rdzuiv+sHSqc+Eq
	 gni7u2fB5AgLx2TMGsQ6N3QJr6fDc9f2EYREd9QkU03hFrD/Qv/5r+ADxSGvcXFOep7Ky
	 VW4KbAazEKXNN5J7IbYomOAEk3l9sgu6SEABB0cBtqv6BnLlN9FR0jHrYQVhYdLofBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
	b=PFdxJWK1zMJ4xtpi1019KpDCHcy5dfUQtQafi+RtPevsqm4ymHb+wB93FYg0DiDLJlhW
	 RyCVFYqNNcDchK4pPAX2IpKBg4jtQjUProndIClAX0Jv1dn2wpBtEDCyVbfCtxtiIxx/M
	 W7xqqNypNN1FblLR7UrJJOX1Z5sP9rrTiROM2306jIWRqPWIgwh6CsBxJb2+SXcqKnc4Q
	 6aFpLRUfCU9z9IuYPknpTS6bUFbyQZWDarX3KRNvaQqeJRzahZCFxqh3wKb/uLI9AEUua
	 gV2ZqHmN3y2pHSXTBJ7yTlQ20ugd6jCwvUu/rQC6I//dHmgdggReA8MC2YZxA0rqt5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRkOqEU4;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC326606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC326606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRkOqEU4
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso782721f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793871874; x=1794476674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
        b=tRkOqEU4xOzE7XVrSahnzZw+u+Bg+xLCpTkl91fr/FbW0pcnhNr9FAx3T+l1yNJqNY
         wtu4o+HNeSsr3GQ9Y4PIY2gJ0iNQSyc3FVJoDgC1M37qnJzbxCySN/8cUiR9s2Va+DBk
         KosHb7H0Cxd5RsHmRdULYyyBcbwoEqsLCzSl0vH+p4RN3/7gmRXOBbwpaAHG0uHWyxcL
         +MqGCI7/uKRT1akFropCNXnuEd072gwImdusnSv2T2vu1tM8gCeH10HLraP/JALreFzu
         y1Dy1i3xxfUDA/QuIkMRBtbFdAOM4gqDbju3s3PkxsA4RoiBUjUP+k+eHki80E+TxhiH
         8KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871874; x=1794476674;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
        b=IcsaE6bQwZqVAyARZ6zen+sdzLi18nWB+ILwYRmWMYTUQUXavssQhFByuA64mCM2vY
         ZOneQygy43DTkRGwo6kE0N76JyVK6c+vUEY6eZStZjYTj1nSbGiT/iF1Ay/juk+lNgHy
         ZEMDjwOyTJwqXq4krcvX5O73RkfxCxkkoxxSZ9eJUMeAzY7KVG9I4pyIVEcRXKUXfOIz
         pcbn5RxWlMjyrlaWfp9HMvLZeDluiUPIVmf4aj99hJLNl4HrB2vJpKwxGZQFHzYprPYd
         pDj9pahFSVWRj70dDplWy7Gyf+uZWNfbSKXIqd9daoDDXdnMhNh82SPn4N8NgEe3/4Io
         EXHw==
X-Forwarded-Encrypted: i=1; AKwUvBykT6451juZaFimcmZZq8v4G1V7reDhsZd4tHGzxuxJ9iZ/Wq2cwzhFORCHNNyUdmhC7tdn3t8WQqX3nGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nue6z5Nz+kUeAtDXSsBXnAQJECKdBuxiFETBKX5wgwAX1fN6P
	f07iUPXWYtR+d2foTCGU/3anenZDvaAEStvREOOn8nEnpUsHdyNhybS8npHKv3uaWbA=
X-Gm-Gg: AYBFou2WishYl536oItVReRMOsTTbiiOtcyEPw0591NWMcZkQY8iezRtUtLXyiae0O5
	UT8bGJpMDwptXuc5QjiTavZlM4Ihkhl/YFpJPgXA1pyAgO8Zql/xXY8JvEMWAfx//Z9JR5ohhkv
	p6U5QEY/bsPMLx73p7B6kU8ecsnUXp+2o8mdbYsiwdKBUsg5d3RnQCJxOid0xf2lEifsi2fWiA4
	iMRgf3ogz1rlMxesf0ip2iUEQfJOnLOfflwrxrLPIlQuru9PsZaSVoogOmgevkj2OUG6H3WTJ9T
	lC1QKWHjg82/QQ5GNy374L5zrOA9iJKRUMXZwPjdiMygIcuXbfUXNk2Wc2ugF/5trnnFbj4gVFJ
	Z14RIOSa4WRal+I64POJm0kFqs8X7bS+Qx7Z5SYtzzfTpo6XpVtl5PcG91vaZope2bxEJuSu4RN
	B9vWzgkkPaKwszcSfnmx8tJfcysdfIEhOVctwYj+D4PSwNG6+Ok9S7QTDTv/IX0JYLWX7KSV5Wp
	Rwdi6uRjBRHSRJouRNoZXzdeW0+MHrcb6kvERzvKP/xfMaGIVTkKMUfDHxitYciH3qYJ6ofRBDE
	PYcrLlMMO58+p1xDPUzOaiSB3/cuFpa16KiMi2ms
X-Received: by 2002:a05:6000:2997:10b0:48e:5e63:bd23 with SMTP id ffacd0b85a97d-48e6e2ef96fmr29363335f8f.30.1793871874143;
        Thu, 05 Nov 2026 01:44:34 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm8628740f8f.10.2026.11.05.01.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:44:33 -0800 (PST)
Message-ID: <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
Date: Thu, 5 Nov 2026 09:44:32 +0000
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
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.

That's odd. sm8150 and sm8250 are proximate both seven nanometers 
sc8280xp is five nanometers.

PHYs are about converting the analog to the digital domain and so 
process geometery - ends up making a difference.

You can get the PHY init sequences here:

drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/
├── cam_csiphy_core.c
├── cam_csiphy_soc.c
├── cam_csiphy_dev.h
└── include/
     ├── cam_csiphy_1_0_hwreg.h    sdm845
     ├── cam_csiphy_1_1_hwreg.h    sm8150
     ├── cam_csiphy_1_2_hwreg.h    sm7150
     └── cam_csiphy_1_2_1_hwreg.h  kona/sm8250

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_1_hwreg.h?ref_type=tags

So yeah going by the name that's CSIPHY 1_1 same for sc8280xp and sm8150.

Hmm so much for my understanding of how dependant on process node these 
sequences really are.. perhaps the PHYs area fully synthesizable in RTL, 
probably.

Anyway.

The one thing to do here is to please _verify_ what's upstream now 
against the tag provided there.

If there is a divergence then we need to upstream a 8150 compliant version.

...

Actually its fine, did the verification for you, the 1.1 init sequence 
as is upstream is fine.

Just please tidy up the ordering of the 8150 switches.

---
bod
