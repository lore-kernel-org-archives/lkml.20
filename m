Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038C2D837C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080117; cv=none; b=awNOVUSiVBM88LvpR5sQNl+koJ4+tOW6v9PfryMPxu0C6bq8TTavoFv4VVHsiUU5i3rQ3stOPlraQAkWI/4o+/OHDg5B1Q0UBoFrCHhwBkRMP8OWWzHIAgPaALqtsYi4FvrzMtIQ0bt75byCPsw/wfNE3v++u5oWjk8X0zsDEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080117; c=relaxed/simple;
	bh=JE8rTmi+yV9lC8I8Q8izF99dyKvC7oYaJcG+z1U7BXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgRpQDKaRIdEkgwbqzhkH9v7prVDRp4k3vZr3cHENjnT9Nu0FmvyGDQHJ7fzWyg87jP+/W6V1sXdTqBKwFuMgZrc2W2AUBxXT7/Jo3bbJ8ekURXmYa/QNLOB2iJEpm/3Agva+7USDMVLDkXSxawywwmrd6u5u7FW5W8Njmfvw8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CrxBlAkl; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CrxBlAkl"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b89c6caffso14773406d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792080106; x=1792684906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NALvi08ArpEQSQ23rf9GeRnMp+xRrLbipmmnb3o1ZPA=;
        b=CrxBlAklAz/i+mewrnF88ATKZ1qirKsY0mt/ROgawZjbqQZrGAOw0yY6dRMgYEzBOB
         WGkTXUY8wHzHE4EHlbIhqoLGBLjGwJx5ouYtr77AT0965ZP5vcOXG0kA2bk4V4a1Ll5g
         kt5XHTAKFgmWHGVvl4m66+SqfX/3aoicIZdUimYWmI7WQaUHx+Hbl0AQkVGDTCymCq0H
         RXGh9LmV5sfmUAl1G5e1te/WLgsaYTDF3fOx6/e+HCqgNh5oU0duep2XpOXaIYSHUjR+
         FmcOMBGjBGk31iRGRL6U3/WIH/K1y+w4oTcNVAtFqnuMk+Eb/hEIPDvBmb/rlchqvBMx
         2nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080106; x=1792684906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NALvi08ArpEQSQ23rf9GeRnMp+xRrLbipmmnb3o1ZPA=;
        b=sQIJ44J2d7ug14OD4T+EqulNDyGSnOs91B26Oe9hoUYXfPYivWEv4ojx3635pG57sJ
         Hf3YloPWze5xkOY7CxdtVEumouLDWe595aiOBtJavLVN1QRj98kX3EMfxKCr0gsTmT14
         kLymuNNoa0m1dVv27vyAl66eo/cYAbLbEwBmXDaG5KZLPS4DtOYogBUFya7T9HgcQvLP
         lP74yWeXfQBrn/xUG9+PppGdgMWH1pPq3+4rEVHuFRVkLyKpGp4n58x6eTxtRsVFklGA
         jXD7Q5W8dDcBgi5fXyoHNttYYw63NA02LBZnAyc/m3i+jBvMuHnF1mXffwqhjKN6VZVi
         h+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxoAyUsrgCzXDJZZuoxfi0SerDn2oC4URZ9PGVC5vBDeoQt9DnkECQO+TI6pLSoPfFBSgB8Ut/pEZHl+fQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiLlC4zmNLGRLv2mW0Nn4L1dYvruz6OWkvZIxP5iHgI8rAWfVk
	ROXlb/xbPEwBv9TvP3zQbppF6hU+RRO8iv/CnVAsKWOtsrrr5IcvZ2f2aeIw0tPTaI19z1arApM
	M001w4ZM=
X-Gm-Gg: AYBFou03oOLPybrB/K2UFjo+lAYHX+Ve2DnM5Qa9QI8BnruC3em1ERTBBxgeVAUIf5S
	3wTVXjn+EY9iYWNB+RWBT3Cwry/FCHfxoWsSTQXlTXnLbXUceQKM+PRaC+NTN9HnUUpCpBG50ze
	E/0a2GzQUhhgXv2QyHmEgzSDB2gvM9EA57cdPh6nm0gkm8GzHaL3kcTGDeNcUJwx3uHQvVx4L3/
	cizOuhpedT59JziK1xUAe9HgkSlOlEOy5PG/YsDvAhQReXt1TLM4UsSMh8pLK6RUiUk1z0f7CRS
	V1h9i6SN+9+wP4Hzmy9XhTW1C4ilDGbolYwNvPbtCIxaRcCkwaS62fYHeea5I0/E/NXW8Uda54X
	Af5s6S/yOQsT6sZjCxEjfCNi+ZxtZiiJZgPTabPIeTC/HCXVOMwmpyFxk+Xw6uBo6RK2DC2ByqG
	jhMQJNrJzdxWS2s79X63ZP0E1WJ7WmfYn1vJfiwP90H070+tJ8AJ+6FLVmHf7sAyhYheeha90=
X-Received: by 2002:a05:6214:4586:b0:917:aa89:4168 with SMTP id 6a1803df08f44-91b5579949bmr310643976d6.40.1792080105628;
        Thu, 15 Oct 2026 09:01:45 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm85388086d6.8.2026.10.15.09.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 09:01:45 -0700 (PDT)
Message-ID: <4fc165eb-b57d-41f8-b7b9-c9fe433d866c@riscstar.com>
Date: Thu, 15 Oct 2026 11:01:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator
 management
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 Daniel Thompson <daniel@riscstar.com>, ansuelsmth@gmail.com,
 donggeunyoo.kernel@gmail.com, mohd.anwar@oss.qualcomm.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015143849.483339-1-elder@riscstar.com>
 <20261015143849.483339-3-elder@riscstar.com> <atDz2hJ6xpA3p5y7@lore-desk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <atDz2hJ6xpA3p5y7@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 10:40 AM, Lorenzo Bianconi wrote:
>> +	if (count)
>> +		fsleep(phydev->mdio.reset_assert_delay);
> nit: should we check reset_assert_delay field is actually set?

Are you saying there should be an alternative delay used
if it is not set?  Do you have a suggestion for what to
use in that case?

					-Alex
