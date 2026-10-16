Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF374519B5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147605; cv=none; b=CJI8PbBL6ifc8smGDNF2TJcB7LmHCF/3EbZTj+bjsVc6aNLXGwqX60TMkFfydnHcyRFXJ8fctIhO0+iP0T4+0ejQuG5gIQhGKtBlBqEr4B5/iBXxzF1sP+WIdd2D5W8BDRBMAMU5tueaCE/sOW91uqPQXgBMB3yBceaQYTq4RGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147605; c=relaxed/simple;
	bh=/KqwPLKqhjS5ksKQbg9EFLFGKtyMa1K2ayC0pzJv7bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1EAS1DDJ8zzdPc5cJKawto6fHoTg7b6YU0phvpmvFWm5QTYZtaj2Rr966MClZIsmQS3h4h0y6jHdRA8r+q2ThWILmYCwukNKAbeqWb2p9+t5q6ZTP4r3nmloOPavqn+UO8MoB5LG3kzxY4W/o3rBv8r/2CjSdJT2RSpuxGfWQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueDNb91o; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueDNb91o"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48de72fc832so1079607f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147601; x=1792752401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfgvK0qoJ/yilK5+D1Thedz4qLh3Dst8vs6/FyRnv2g=;
        b=ueDNb91oukjMIV3LklDFpiIwFVxo0Mfadrn2og0SSe9GFhbWARaTID/Af+DnXGA30d
         Y7NsMr+LwrMrIiSNRVixha9PmVpe49PxMkIwNmdj1aipazJw8DlQY2sUcdFpl1KoG4GP
         BD400B9UyLUTRDdl6soNv4PaE9IQuUNlwMR4znDHYEbCG1fBNNrnwWImNJBGk+wZEfqP
         suP8I2c15evuq4g9jfmVd/CSrjcLeYwUtg5myjDMxpQS7IDSxQM1A37FbC5QPaZy/cj/
         0B+8mDEDhUkRF3m6v7E75Um5lCiw/2vue3+MQrez9Qm01abyj68QBHjuUWL3hM1mo8rT
         IaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147601; x=1792752401;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfgvK0qoJ/yilK5+D1Thedz4qLh3Dst8vs6/FyRnv2g=;
        b=ApDO9m9SrSC/lFshFWYFsT1hYpBsUKvO2t8EaUdvIuI9N79G2h+tdhzsZtl4nsUYLc
         LGSV94mxhTX2W4rYoFUPC/sknk+zbMBBZeitIOPxVlZFojvSqdntWbDVcwScEkqTH1iC
         1Q66ePezwPtc9CpCSXFLWMQtpaUgeVREqzT0y32GXzIspzrXEhHUs9wWgn+7OLf4t11s
         NJoEmD+fJEoybitLKr7LNmpK7o8npJE86N//6BauTlLzNLnHtE00ccGyMr+gEppFOyXh
         UuZUYplB9fnLoFIOfvHCt4+oI8ddV0U93qpjDMsT5401FqlPMx9rqh1NG7R8UUH0ZGvf
         AKRA==
X-Forwarded-Encrypted: i=1; AKwUvByNHT8VUTpWDHHT5ZPztPhg44OFIbgEbvBsmEVeqRkR0YmP2wQPk6Ec6D571JtrEHO2u8M8apH1AcNUqbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsWiFxJaM0vJr5EA9gP+l1UHHjTkEQwBtyyRMIdDZcspwAfRpZ
	eq+I058/ojKCN9DDuxkE5HcuzIVwD9Yi/yrkOxgIR+SnVcweYgxLPukvGdmZW4ftQmE=
X-Gm-Gg: AYBFou2grnY1rhxO7Fo07SAXTy2qM0ky7dtVlaeGFvL71jcCgNdxItqAYSSh7+xqPZv
	196tfYUlqNlyt7OeMDRGOFYVDI1MrWgWCKj3a8dyh8B+30JrI/tzRC/nSHRtK0CJxBy8+k7KWYW
	PWdDkfc4cfiIEkr4Z9LgaYbJ2W2PWxnH8LkV8RCwgcUB1kpq3RtGqdDeGztQqBdQERFF8Btc1p9
	MsZXU8MqT3JNNqSoHPSfsUsWueU/wUdURJKH/rL2vs/DOOsSwhL+Ar9p/+LgFImCXHvTOFgj7/a
	XdD6DFn4L6C5agZLRQgtix/QaFfa0nxSzpKkVRUKPlpsqfqZVgWVsoDoP4Kdbdth4+dNC/93TqA
	O1Lwqd5YrAka5e74/NmI+RMX2wnE5FJk+NTDUGWOrL4r2VaI6byDNaKts8x4agot7+06iBAZpcv
	qCgHa5Wep5GaJKFRCv+4t5hGCG6gld3YlO9vNJELE8KSZhfBy1QKUpavWgzToVjyQFhGIPyzo/X
	2Teu/X9TqIXp5X7YSuXFA==
X-Received: by 2002:a05:6000:46da:b0:48b:68:594a with SMTP id ffacd0b85a97d-48dbaadc11amr31443485f8f.12.1792147601426;
        Fri, 16 Oct 2026 03:46:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm4285475f8f.44.2026.10.16.03.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:46:40 -0700 (PDT)
Message-ID: <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
Date: Fri, 16 Oct 2026 11:46:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 09:56, Jason Yang wrote:
> Program them from runtime resume instead, where whichever of the two
> comes up first brings the block up and a second one no longer resets it.
> This puts the BIAS writes ahead of the per-PHY reset assert, where the
> TRM's worked example has them after [1]. That is safe: neither M_RESETN
> nor S_RESETN covers the BIAS registers, and the values written are those
> registers' reset defaults.

Would you not be better off scheduling a work job when you know both 
blocks are out of suspend ?

That way you always have a known sequence out of reset ?

---
bod
