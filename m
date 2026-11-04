Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793752129;
	b=Mb9f3YL26BTGPr66o6MbdO4IpZ6HS/q0zpFb+aZbf3eEHM9hxFRDcAMrgz67xkXORSxt
	 7oSueK9neqqOuq8lOdsFI33Na1kjoqOCz2UG8oizSsTDCbDG47QugOFQLGIjPTMV9kmG4
	 GpI6bNuKrYevOUw7VBJ3/sFR/Q9w3dvbS0+/ikGVLLDP2DDXEccMdgqwMiAbuYRl/hqI/
	 Pvf7BpsyHYTJueq9mWaSBkklPLyrWPaGppFzYXFXrS5HeTtKrSLBH+IvrGBanLQoztD5F
	 4/fobNpF6VWKabYsSq3iKU0i1AyS92quJ3zkGiOzeZPb9mJTtUQmmhHl7sPGH5ljfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
	b=IXPzNFvrgIU159MBrAOxxfaQnXDd15NAbg26MFzBRfQez+d/mUG746+y80HqUxiCDx0l
	 7y8urQd+VUxAo8tM1HeqziIZchot4JFZbHIKNxD/JSKC3xvR9/+M4Y61yzl0XSjp3yQFh
	 YBOgBRlQqa4W7mUeCjdlFMIupag1wB/aKGKsJppbTYDOvisL0Zmb3Sh05ENDvaQV2vHaj
	 47XovTLjIp1ov52Xdn+DzkgHpbT+5227O/ujPcQXa7mSvnYz5Tc+37X1BRRlwl9Nn7EhU
	 eo09FKNv4+QboSMXLuZ0Rng9ua7a/YHF71Kb9hpGa/He/6PP5UbwdNFuPNiq4QgmBhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TGsmBkKL;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D60606A324
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D60606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TGsmBkKL
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3acde6b7b29so175501fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793752127; x=1794356927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
        b=TGsmBkKLz1TDbJ3HJ/Y+7unQZOZXwF6ZCda4Iz+qLp+2tMQzBg5Zu9A3hs4Phqsr30
         E6BE1XqfjyioV0JC9dsqwTYQPD9UvuiLKiJVUQmfWORbP3nyv5W+7DcI1aUbl8L8RU0V
         SZybREBo7gKJXMceRZRrrkDIemqSjb+6pH4pMrMngl6oOeiAS96qG6IRT9LoHb2Vd5y1
         GjE9A8+OVpBTCQVff5YIYms+ehQaZ9uXtUUm+INf3unP5YPr4ZwbEQTVrnd2cUhTC+Q4
         S+jZFPWmds8hCqNOsBSSi3UQ/x1nJrdDw0m4cl42pSxZDQKj3jlscyuOewDEjo9q8W9t
         aLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752127; x=1794356927;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+pZpw28pRWWLva2b/PbSoVbdDZfr3/Ztz0YUdBIjWs=;
        b=vcBHj5C9BAtNg9NwSVb6GybhDFK6L5Uvjtbgj71CBTzzSzXXz+Au1Tqf/4xu7qbh6Q
         y/oaoq6Tk/ASga81gGU2GKux1PhmuGB7H0Fjdr9sOulFndPRO6cWMIemGxJnZ8bOiTkZ
         I4N+2rX8MMGY2NxOGJI8APUasT3KHvolZ1umupdeTmBjuULP0nLd70y78qK7jAVqedVk
         kd1cuh8P0u21CA1UYBzzD6FaYgH50hXYn2QhLi29P455WV9Wg6Q4slS7V3LlOv3/K5t7
         bwCODgpXpjXbwSZrJqDAjvh7BbmpmiRY4H1SLuxCWyS6IJGt25dDG6/hVAODm4ObvY70
         DnHg==
X-Forwarded-Encrypted: i=1; AKwUvBy3Xd0XWYyNKf6ayHz3W6fe1+9c4utrzA23AiRhJuFoHmiAbx7Dh7B+/iuumhidfENWg8Lee4qLgV/uDrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eZqi4kGLUwi9irfa2KWdfZoAMT52KG20X8hHuTRrcagTuD+9i
	fTvCE6RErHCCDxWqiy06VRRsE4UxgbJzSiR2eqxbA8h5Zv0I5AG/NXjUVn8ktVOOdiI=
X-Gm-Gg: AYBFou09XcPoTtNVZP4vWjv1Thhj1sJPGtIXgeA+lF64hbu8MCeNYoQMDyun48Vx7Il
	9u9TnqZViE3/PBFBULAm7kiOV0RrQzMCWREnU8SkkexJrheFdXsG7UHfqSGgMjs4C1hhpWQnXgW
	g5QZkAScMkq/YYStQETPApasqh5eMi0TGzgqy2FDy8OftKIuYiPBqcHl7kh3RIpLjO9w2/scy+0
	bfKuZfEbunIj/krcp21eWMIyRiAnOl/bGangMXFPkF3Ml9CA4bcvXuJKQdb3V+IYzFlIDWFxKHB
	6hDjUCWG85DSvSIeeBZDdb38h6ZiJMaY4H9H/TZET8UlFjY06mB+cE3pg5JDhK/sRTZoYzpGGYC
	Qe+j46F92J8V1xq9lD48W3+dEwBWYFfvX0CaPeJx8D7mqkdXjmME8jlMfJdjQaLAtZCeYwOlk2h
	5q0wx1VPFb4MFB4ixb/ldqsc16rhjNeWy0dbSWoKUiZdQza7KQB6KVGpAu0+OigWq68+50qVNN6
	R+1iB8BupN+QIa+NkAV4D5+CXOA7lWxAWphIAXwW2MYOae3lz4gsbDSvjiKnts3iDMvUJOVQzhp
	mooDnWqZRMeTVnxTaIR/sm3ctDh4WJoA9NYiRhwIncbqe0cK+iHmciNrbRx/YSIzInPWh/QXNai
	NxV9SwA==
X-Received: by 2002:a05:6512:4041:b0:5bf:ce24:38c8 with SMTP id 2adb3069b0e04-5bfd95add38mr4540761e87.4.1793752126952;
        Tue, 03 Nov 2026 16:28:46 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38d11dasm142334e87.74.2026.11.03.16.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:28:46 -0800 (PST)
Message-ID: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
Date: Wed, 4 Nov 2026 02:28:23 +0200
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
Subject: Re: [PATCH v2] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org,
 manivannan.sadhasivam@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
 <tencent_964D3CB9DF49E7B244CADB34F5E05A8BE10A@qq.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <tencent_964D3CB9DF49E7B244CADB34F5E05A8BE10A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 11:20, Shuai Liu wrote:
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
> 
> With CONFIG_VIDEO_QCOM_CAMSS=y and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
> 
>    camss-csiphy.c:(.text+0x51d): undefined reference to
>    `phy_mipi_dphy_get_default_config_for_hsclk'
> 
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
> 
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
> Signed-off-by: Shuai Liu <847807867@qq.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
