Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB04756CB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010486; cv=none; b=dUw+dB/K182zfCEmxzo5fw8bdeQ9vdKAZxaWBNJZSfD2H8IGEnj8fWpvgGFABIgT/xkANfEFgW9YwR3Oza+d9keFLJxrwZowEOesDkpo5LYZe+eu1cOD/p0ZMjCqxOpHjbZbQXjrdYu918BkFx/GkSVipXzlRPDiEhx6VRAs2bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010486; c=relaxed/simple;
	bh=zFcnL1EzRK+Duttihfsteq8F8gFYjg8xrl905BDOzIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYMZSEy/aQ1Fl51DepNEIVOO+c7Fiw15SQ19tBasRSQlXcnCTJnLU5QAvLGkW4bscFrI5gLognK/eFsCLMuSGlCVF973XS6Y8CyQpz8GN2OMqlwoWZyLpAMGb0Np2TXFLz6aW6uLXD1B8IqFMU2BcPW/CZhRYFZfS37USbb7wMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OhQELcln; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OhQELcln"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e6f83f0bbso418383785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792010484; x=1792615284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5O8SfMWx+gaxiOolN8z++f+zcMy7D3lElBjnymAbOc=;
        b=OhQELclnr1s673ANjuoNI5uekmQ8J64nluxnyWQg/NYJepe+JF+qEHXBxlPDaSIHFm
         GODAhzPFmUnepFtE1qSsidqoP/5Xv5BDOGc20MylGAdlKsHxCOhciiDZVrx8a+nYMe7M
         W7TgtcFqMsqSpltlPfvFFVlJQmmbIkiZqGv2f7/Mn5cjP+HqGC/iuu499YvMf3tD2LBx
         Ol4IGtUHQIxKugCjqKnaOc5OpcU/D61ign7UM8/bK4TuuNcXWgeoPfnHJF9bDj0iw3ho
         nsOof5hdhECzAFlbX5sCUWgebyeo9z8XaFVtMn5kISvVyg7kokkFmTwaWWAs3mwoAYhm
         RIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010484; x=1792615284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5O8SfMWx+gaxiOolN8z++f+zcMy7D3lElBjnymAbOc=;
        b=c7iqWEIvfYsfzX3Hcu/JiBywEJAPtg4eBohZjZfdApkUo8EJUyecfdkFj9ik8wWVRa
         jdPpx5UwqTXEIM4VO3TtMyWDZ2Cij72HTrh5SMOm3ayzDDdxJDHaX8CVLU8mO8F+4Bor
         /duTajwsX9FP3fqgEwzDQFaScACy302grLNSeZPM0Qza2XbVJfPk05h9V6/eb5nfKpAG
         8flZThmzvh6nZ4+ab04TCTCxRIORTChKzvA8mVhsDR3KOiTFEVHcp/sNRHjLUu5eO72p
         C6+nudyE8vreysU2KM5aA6Y/W5QgUv4piygF7BLFssWFWnaZxeATb4n7uUAtiGwjqJpx
         HTRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFzxHTFl6G1Lyn6haiqYONvOSXeNHB/T3fQu9gIMrS85J+3VVc8JGBf6c7QTO7dYx1bCjl4RKuAgLbQN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiLAOSfaWfOMv2vumMGt69ob8C2o5eG7H5r9nFr2It++NZqFZr
	lu070h0NHTI1wah0E+uEtgD8v2mW8ZSBouCELFmkToA5K0zczSHtbpXhlx7nM3qkQwU=
X-Gm-Gg: AYBFou3gWojMrK8o76xoc+1Sc3mz2pQXKFxhpOLawi33L90O/BQq+rt74PrDQL7bcdn
	EbtUwn5xF480EFefyrNX8cOcKsmb60PNtj4sQNiEHnKfmzWyI2gQ3+xnJkgeeYj5NyQEwj1LkFz
	SCpIAAx5BiNb2Yd+fPPZvmHFMF9Y66Fr5EGHLyJL634JXbsN2GhFsIfA9ttz2HgpfjcHj6TEmf7
	Ky67LVYPUP5Pki9dZ07D9GRvikpWTCOSbT/EsDDjO3y4mtkqbirRppSJUZ4Zn68J6yl1sL2ycNd
	lBnhn8b5gBuYybINmBQW6M2spIyjPQqSXPrwh+V1m/mX/g4ASWHZQ3iifOH39PIngJAKMRern3H
	CdMGGdID027JV+uNW2J+9/QxPpDZGPYI+ZnWp8qccYiDkd4qk4tUOe2F58GwkZFV/mRtkv+HM3U
	CoMstOFknPjOF09msrBmfYRxXNZzyY6HJe7bZoYzscUpUgk7giVnCDqU/ufxCBhqTVz8d6bCo=
X-Received: by 2002:a05:620a:46a5:b0:93c:6534:d04d with SMTP id af79cd13be357-93ebd223d68mr2763397785a.35.1792010483847;
        Wed, 14 Oct 2026 13:41:23 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4f4986dsm587339885a.2.2026.10.14.13.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 13:41:22 -0700 (PDT)
Message-ID: <4c0d9a12-6236-4bc5-949c-62a092edb0bc@riscstar.com>
Date: Wed, 14 Oct 2026 15:41:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add regulator
 management
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Daniel Thompson <daniel@riscstar.com>, donggeunyoo.kernel@gmail.com,
 ansuelsmth@gmail.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261014172300.292324-1-elder@riscstar.com>
 <44a96544-5ed8-4bdc-8757-d7413e221f40@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <44a96544-5ed8-4bdc-8757-d7413e221f40@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 12:36 PM, Andrew Lunn wrote:
> On Wed, Oct 14, 2026 at 12:22:59PM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> QCA8081 appears in embedded board designs paired with GPIO controlled
>> regulators for its power rails. Add logic to allow these regulators to
>> be turned on during a probe.
>>
>> In order to avoid the complexity of tracking state for suspend with and
>> without WoL we take a tremendously simple "always-on" approach to
>> regulator management, essentially relying on BMCR_PDOWN to conserve
>> power when the phy device exists.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/net/phy/qcom/qca808x.c | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
>> index bab26e4c61408..6e2bd753257d9 100644
>> --- a/drivers/net/phy/qcom/qca808x.c
>> +++ b/drivers/net/phy/qcom/qca808x.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0+
>>   
>>   #include <linux/phy.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <linux/module.h>
>>   
>>   #include "qcom.h"
>> @@ -181,15 +182,44 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
>>   		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
>>   }
>>   
>> +static int qca808x_power_on(struct phy_device *phydev)
>> +{
>> +#ifdef CONFIG_OF
> 
> Does this need to be conditional? It seems like
> devm_regulator_get_enable_optional() should return ENODEV, which you
> already handle.
> 
> Making code this like conditional makes build testing less useful,
> more combinations which need testing.

This is a really good point.

> Another option is
> 
> 	if (IS_ENABLED(CONFIG_OF)) {
> 
> 
> 	}
> 
> That at least compiles the code, and then the optimizier throws it
> away when it sees  if (0) { }

Yes I like doing it this way better.  I'll modify it
to be similar to this for v2, which I'll plan to send
tomorrow.

Thanks a lot.

					-Alex

> 
>       Andrew

