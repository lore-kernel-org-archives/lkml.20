Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FEC41D23B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024441; cv=none; b=NgKBPgobBOPJdp04/XI2lcvrlstwkYDiLU6X6ItPuix+/APinSsbR3+gqRGHK6RvEJW8KzY8veQb5OMOtGNjBmQelwPsQNB9t6PgM7JkQpMA0CYiDJ0GGs7UWLS49w3MTnqPfgT3VQwNpb48ppxZQPEvvcrEg/7bXsKSPwQhifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024441; c=relaxed/simple;
	bh=SLO5/XaIlH6CA2T4GrS4gKSOc9qhE1boxvxyGK4iP+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/HfkPS/ZXQYBCftGV5vRV5fwHD455Zbdc/3C3RPgKR4/9KWLcQnfBBHMP8eXxtfvOyTUfu8BCEn4tyIrKG9dw3bCZEbA3viNjYzSJBVo5LfZcfGkesx6TZbm2zIFeeIwn4FadZkjMk6FmjR68ylJuw+5UXDVQWKEso+bH3KV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NtG8h7hI; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NtG8h7hI"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6fa788e6so303710a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024436; x=1791629236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p88yqRzBtcIHaHKazkQdIPEyby4tpYcGRuIGuiev+70=;
        b=NtG8h7hI10dPv7YXOE11OLzqNZBHQgXtTCMZgtx6KzK6jWs4gUg6jGMlOTWGIr43KG
         OzCaEZtj9H88ZyW2PuiQfQmZqyo4gSNu4SWv2K3orJjgAkkZl0QfjEEHz+MG5Vg+QE7E
         Ybb+JZS6hSAY3T3/8jq8mx2pLP2KiCsX/j/IbnnwW9ZOBv4H6o/t6+49+cL7dtZHjt6a
         cmdZO1Q5+4+UzClvp0rEiS6zKdfzmAItGhSxZZYZt6uZh0b20VkA34nTsv5ewT+nZp/V
         8w90amB0Xs2wpPysiaaxCvDjKVH+WZ6F5dVy3qwwkVrYW6qNW3h3arULZQi0wR9wSjLT
         tBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024436; x=1791629236;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p88yqRzBtcIHaHKazkQdIPEyby4tpYcGRuIGuiev+70=;
        b=biyqPzUCvdEW6PSf675qLyOzhfX5JpUn25SK9i3cPFBTthddbEbR7PgpGPcaKkUs8O
         uzc5SclBMh/YWpjnPZb8l4GhCobtDJfz50j7boWz2cI90OdnC5+lIAIxI8j8JoaNu0nE
         lCc5RjOkuXGCxDZNwJ8tlCE6jqd8jkp6hSgxAwjBaL+3evF4TBuOe5k0A9yWk8xwhZka
         4Epg/KEfRxLmooHavTXnUuMK+QBfua1+rF7NMVaVuy1GqmX5RPipxkLsWCsE7iF+Jbju
         q+ZrH+wYas52Y39xiVrOmCtmzDkyaZP/3s4LToqhZeC6hf3dE9TBCJpgn42/jmTydUAj
         /e5g==
X-Forwarded-Encrypted: i=1; AKwUvBxGbWPHNxwDRi6y4OMNCQCLoVvYKj0SrmvYRbYQpP5UVG+VU9Mt8dF+i2tgnhR9gjCar/0cRuDR9bGTU3A=@vger.kernel.org
X-Gm-Message-State: AFuF++nZiSRf1z2D2EfqBURJsMvVHAw+rE6iiS5izkjjCUBIPN5/zJI6
	V9If2CJkE+hMm+zbC4W18elS4UXP4bHCGmHxvoB/PC4OxP4q544RmmsqWdl+sR8cGNw=
X-Gm-Gg: AYBFou38uhpmc2ZexmrD58klAp6kXTHXjVITgCGYQQxyZBXiyENNcsOZ54BHNyuKmpV
	/Z+dqN7OsHyn5Rs+XcVdkmL0w3D6MwqkCFTuhlXjVHym9SCQhiMnkcDjSPStQXbaQS2+Vu5kVTi
	gTX0I5XchT0O9MWmswwCxqHVti/IJbzdEQP5Sc6SnJrKPOViFF7jqNzSn6jt6gFxyELHgzzKbBK
	a2Pqm81/Xv7Pa1AvE1trTeArVPSJXpYbmDLiV7b42EY4N9BisRagqybJhfxZJtTLM90cns6PbYl
	NNVgGh/vUnEcZtvR9oGBl33aixx3SzxSp7do0kjOSgDo2puBghN1tY+NKBUjmYZbo7IQmaBRL6s
	J2pMq1VxhljeQA/qj84pb5zRqugjYpXZJqcG0OcLwQGBGQBV1IqmfbS8qnWzq03MgleyHnoZNAy
	9zERynKmVBjt0idZPH9gyAlzBtpwK08DylJijuxIi5urkt46Bzi+hzJ/SoGWu3yvF3mUfU70DqZ
	nvThmFjNzF2
X-Received: by 2002:a17:907:7292:b0:c29:f0a4:a4f8 with SMTP id a640c23a62f3a-c2e4a6a1e60mr460884166b.0.1791024436000;
        Sat, 03 Oct 2026 03:47:16 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm192867866b.42.2026.10.03.03.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:47:15 -0700 (PDT)
Message-ID: <27eea513-dbab-46c6-a1bb-8d9817f39ae9@linaro.org>
Date: Sat, 3 Oct 2026 11:47:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3576 variant
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <6HuMsILf2j8sOpHhyUAGmHbTeavDsa4sI8LzGK1bRrT-XdkhCbQBfa3ytLaMUPaXjfPyHA_3DGWmAaaAbS1tsw==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-3-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-3-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 11:42, Amin Gattout wrote:
> The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
> phy-rockchip-inno-csidphy driver, but they need their own driver data:
> as on RK3588 the GRF control bits live in a dedicated CSI-DPHY GRF at
> offset 0x0, while each PHY instance only has an APB reset line, as on
> RK3568.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
