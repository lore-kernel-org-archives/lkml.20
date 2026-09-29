Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1BB50B8CE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678386; cv=none; b=pMiefcaaPsREGLPV5O3cPw7MW9dCtPjkT7tlpCvFNVz8KWPrv+CluyHnLR9vi7Kh6psy+qZzsN6+TK7RjHlF+IkwFLlP7pExR7V01otAoER0DtS9SpqGd0O0SxyItEx2Emfxl7WI5X8O9ZDkeKvDaPWCd/UcS7JpkGg7k6yEZXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678386; c=relaxed/simple;
	bh=Tx2eneziBlRsOioQABFzsl3/17KPc9PBgbL3eWDryv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDJFpDl5m3F0g5Np136ROG0ewe2XhcGowiruwpczPDG4WYMCMyt42UT3vsIyx0l76fSYCyPRVfXQT4Tt2s8hBhqGYBojOBEqKr7J/tgUkOkvmZxYi0/EwbJQMj7zjGH+vQH2Y6cjwOY94RUTVF6mBseUYWfaYv6ke7afBkdwCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ikTYAN5N; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ikTYAN5N"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so423117566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1790678371; x=1791283171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGSUCO2UQgWCXkEUCNYzi3LamPNV9IRan0Jxir3/waY=;
        b=ikTYAN5N9jrl6D5EjPKZIDkeOftxlzPRp87nKO4bTDOAFtSZCaIScspliNvDii1Ys4
         lHcboVWpcDfYUbBqGKqP6uARrkd5sKiovAWW+4xCF7xdgRiVEK0MkHrdJt3ANS2DyxTT
         MlbUxKLScoodXOJUBxuc2rZIaWGlkyfZd9m0TlhlzkDko1taU25WpUXBS17j+75JUmie
         yOh3P8ooin1SwULLeyYzccVAPLxu9/wN4rO+EdSEzEbESQGAbBfDO46O7sMDGpeQHzDI
         FuShlPAJ0tGG9ijXuqO6r6Kp1tZFSCGjPW17hAavBW42SxzLCSW6ZhgR6OaQYEOS2WQZ
         m8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678371; x=1791283171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGSUCO2UQgWCXkEUCNYzi3LamPNV9IRan0Jxir3/waY=;
        b=0xJaQMq5cOxdJCQW599ULHeDLgSzdueJgwvkD9QwkCVAmlMPnQTaYX2tkPXHJFgVO7
         lEPFreYGDo0unZcHjLVUCoBM7RxratL3SnQqcXm0If6kXcVvVtyEhJrglA+7QfXfvMxL
         mJMzy45/BELaeSwEG6KUJv9vt0r8d9CuMiRLEgfwf0e9mPKOEl1otnmkK/iiL2esdg3j
         OpRpzlTh/eWRkUstZM3LrCdNo5N9HvoW+6vFbBajnX67TUzLpszMAb3mesnZiFSu1r4N
         wc9Pw7qaHsQ62aIM4lhRqPZ3dLALf3ZPRGOQG92CcHqfOqfZDWwktzuqm3Lc0xxpLkW/
         q68A==
X-Forwarded-Encrypted: i=1; AKwUvByrKmlFWt2jt+QsMIfbwWZe/kebaqEtjgb9/oez0MJt8j5egDYM0CFELi6BTMYJO2JOYXbYEFZoQqxTW+0=@vger.kernel.org
X-Gm-Message-State: AFuF++kzugHIzigZ1hp4f5KsNLg0hC+kezPnLIirn1a/Z8hnKjVKGIlS
	Kcc1OQJi8tRxjvk7bjBcduF+RlGSAr23XgGE/wO3uoEIkynIuBNStmz/4nbWnWtTDoU=
X-Gm-Gg: AYBFou2giatmpLPIM5LvdtDQuToxxJ5e37ZaFioM4yanzb/33EGZ7nsMkju+LMfd4vC
	vO0bCf5oBGyK5i6/mzKeJbdDMv92j47t9d1VuDLeHvVNNBQ/H9qb852Rs2brfn2quMPSyzZLLnp
	ysWfGaIvnpKr+nf4/DZRSiCryf6OTCqb6oIO9e3hDst8epR+HsGp2G7tcPQuaeqom8A495XB9Jc
	Yw1DOeTRLOdoZsaeCkqB360oggmXaz3lW8y7prG5Q0smjlFrCpb4z5PW/6qzasy7lLj91U4vOXB
	zTUnO37aC5kP8KBq8gLiutQ8eXakgVz5N9cnvZ2q0Zvn8kw3f/bi77njXxvRkSe44E4eAFKeYGT
	d7EVwnN8AB0HT5tjGwv+cfUcuLbiorxDEAFj6tNbHQpVa/klvbzhLr6/dqeue3RWnmkwuTKvsvM
	Y+bC6DP9WKTRgZuzbps1PdcCXiVSSeylr7NnFwH7hg4g8r0qs+VVg9HZnbOMRg6xicg+Fd5xqs8
	yPSiQ==
X-Received: by 2002:a17:907:94cc:b0:c2a:f518:1890 with SMTP id a640c23a62f3a-c2af51835cbmr962042366b.41.1790678370068;
        Tue, 29 Sep 2026 03:39:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae780d2ecsm622387966b.56.2026.09.29.03.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:39:28 -0700 (PDT)
Message-ID: <279864b5-9910-4dcb-894e-298d7ebb0fab@tuxon.dev>
Date: Tue, 29 Sep 2026 13:39:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] thermal: rzg3e: Propagate reset assertion failure
 from suspend
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 John Madieu <john.madieu.xa@bp.renesas.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260828092123.9707-1-pengpeng@iscas.ac.cn>
 <e2c60ddc-b28f-4e49-9d52-590f14f374b5@oss.qualcomm.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e2c60ddc-b28f-4e49-9d52-590f14f374b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/28/26 19:36, Daniel Lezcano wrote:
> On 8/28/26 11:21, Pengpeng Hou wrote:
>> rzg3e_thermal_suspend() powers off an active sensor and then ignores
>> failure to assert its reset.  System sleep can therefore continue
>> without the clean reset state expected by resume.
>>
>> Return the reset error and, when the sensor had been active, try to
>> restore power before failing suspend.  This remains an RFC because a
>> reset assertion failure can represent partial hardware state and the
>> preferred recovery policy needs platform confirmation.
>>
>> The issue was identified via static analysis and manually reviewed.
>>
>> Assisted-by: LLM
>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>> ---
>>   drivers/thermal/renesas/rzg3e_thermal.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/ 
>> renesas/rzg3e_thermal.c
>> index c44f5b8858d0..7686a45341b3 100644
>> --- a/drivers/thermal/renesas/rzg3e_thermal.c
>> +++ b/drivers/thermal/renesas/rzg3e_thermal.c
>> @@ -499,15 +499,19 @@ static int rzg3e_thermal_runtime_resume(struct device *dev)
>>   static int rzg3e_thermal_suspend(struct device *dev)
>>   {
>>       struct rzg3e_thermal_priv *priv = dev_get_drvdata(dev);
>> +    bool active = pm_runtime_active(dev);
>> +    int ret;
>>       /* If device is active, power it off */
>> -    if (pm_runtime_active(dev))
>> +    if (active)
>>           rzg3e_thermal_power_off(priv);
>>       /* Assert reset to ensure clean state after resume */
>> -    reset_control_assert(priv->rstc);
>> +    ret = reset_control_assert(priv->rstc);
>> +    if (ret && active)
>> +        rzg3e_thermal_power_on(priv);
>> -    return 0;
>> +    return ret;
>>   }
>>   static int rzg3e_thermal_resume(struct device *dev)
> 
> Sounds reasonable
> 
> John ?

John is not with Renesas anymore. I'll reply myself to this.

The patch looks OK, I consider it is the best we can do to recover from that state.

The reset driver implementation try to do its best as well to recover the reset 
line in case the assert fails [1]. However, there is no guarantee the reset 
recover will succeed. Still, this looks like the best we can do to recover from 
the reset assert failure state.

You can add:
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu

[1] 
https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/clk/renesas/rzv2h-cpg.c#L1347
