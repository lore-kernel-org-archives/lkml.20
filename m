Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191522;
	b=hO3H4ptbXsNkfNrJuJcSS/xpfzPgDyaA4hHob72nUBAuPUwHKjPRqQ7yUuknDpEt7phH
	 yQXjJF6RSa5pSgyQsBJAJaPUO9JKool9MTMMPvygO6xZgP39UDYJltv/iOgoLi5Z4t6ZN
	 tKSxyXkkb1HpwangrMr5MPFN4kFD36lBUlkVkcSscyMAVycn3Na2w51C79L/Qi0OQQNIJ
	 VdlCY0ZbeZBO15ID6EwP+e4R76gsFzbJhVQ5hj+8+riWIZmASBesc0ndiXGExIeJWu2c+
	 YPb7E2Dn5PCvFNdrQdRH4NwRTIomgsbFNAYkb7Cei5/qjWXx95+GhxmT/QaVIc+SBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
	b=49OjKqkHCcrthS3KeyyzM2ymNh7HjhM1pXRnjtY3FBwXUwTAGBTliR6WIVfRLbrgOH05
	 3WicPcotaI8jVzU+/fR8ZQinyGVpinq5pG8fXr+qIk903e7Ig0Y+uRCCI3tAdn6k6kwhB
	 uzuVlmEfbSmBPvZ4y3eJvLT+4ONJ0xBgsNs+SyTh0KLnVikgsFxKk+uMiOETZ8UJMc8+3
	 azDKOB7PUJOTXv4eVOYpe/iMEi1Z8jFFOIQxloVSkwIGKGEJSq/KKWvNa/r6T7x2355e8
	 zQjNWIKwMGfEYt2P89F2GLQ2EyDPPJlQobeA5cRcFLDasQ7LZcN9t7kyjof9TgWKGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=kSmYo2IA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946F1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=kSmYo2IA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6130825e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793191520; x=1793796320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
        b=kSmYo2IApQsaZVeoI/lHS65DndOvyRY8lt50GRCZmz/jWWH8qe4s7wo/zr2/zMpq25
         +sjQr/YIemSHfu6uSz39sV8QOjFvoudUeuFCrPfNICLHczUoyPJM2MMP2ZzljZ7g4y9C
         e2zu+Bti1OHmJlatzf5eQK5sXxZ3i0qUYaH+sDqEm4IIQ4Nk+kHHbcDLgsKMAjNiyB+/
         XHCS25+GfCpZiPYLwRPoWKFHsIs3BMbU1i6dviNOqXSCye9VVbinYsSDEBX24Qp54NKy
         2ZE+Gf+jUmLFXKEj1XKHO4ETJGGRqh51DtS3Fk31LWhkvIQvA1aIATIPsXPkaoqVeUIU
         2+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191520; x=1793796320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
        b=E7zqZBc+Ah3xXad/Ap7oLclZhIKR9J/gRleCNt7tnbeG62518gWk1mJi/bes9l1oEw
         JgcliY0G0GBYQ9zrPFnpVOGKpKsuyeoTTYky0OTD9XXkgfft9uxtCqwQCkRh9Yy8YTwr
         rbRXbd03JU6AUCIKUkEsPPHs9C0fLaHRLwvjHLpzacSVdg4c2xlZlu1SSut8OCrenZ0j
         VfwoFb/jiEcTPP/7zG1s70MeJ/sAN0H7SdeZ0Y8bDYKM3U2k3r3F5TyMg7KlzTPSgoQv
         6O6kbk4YwtUTIbeV4wfRovT7Dcg4ExuVYRsLJgd77C8aUQy/FKSPD5cGz4Iq+tQjUVPd
         G5Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwu4DB9vdEHkxeHoGblw6kpNKoMcD/gvltdiZ7M5Y/pkdDqW/6UJuumPsZDrer5O0y6owrFdBwXnuZC5vQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyL+20ZukrBbZVcFWDNR+rMJyvJf/gLPmtke3TWyEefw5w4ZyP
	CnHoHFGpYoDEF9uT3rKfxLwjGC+FBGsr0pfnQIJ2CfvsdRsz/0hX2oIEfvipLWDPmoM=
X-Gm-Gg: AYBFou1Sulbg+a2Jkv1iuxkY4xkRUs3kLiY2ojZuC8CMAJaIcEK6EsAq/4XBd8uE3r1
	blemNmvZESqaM6qgEcTalGwgDVkVax6NfPZ9CctOrgEvW1y5I3ibW5KxB8mQseYst6bVlVbbQ0o
	W/1xkSo3tvB80ilELAPZUmIa7ly7oGj4w5TcfUC+J1/qZGkdmC6Zf7Eq0Uyixl+6q7AyngZmlWx
	d67+EtbFLSseus91UXfNuLnJFl3UmbH3eLlToNIFYipmJMVan62np4npGDzYDx3dCPN+r3GlibX
	9Tsl4TZEwPIhn7vH9kabs+4BIaRAI5HezTb0hnsu32t2Afi946Xx1UhlItlz8/WpeWi7RZ7CQSN
	9hcbqjp+KynKxsHAOKFuiZup6wIczvaQPPPkPpqZD1YE1m+aBrihcDdcw8Ewr3b3xX0geKkrqra
	O7t0LAVCYdvO35310tCFDRLIyDM+xwWwqRLO+qu7Rf0M2QMxo5NbifJNLmo9b5swPTpf6jwRIMv
	odqib0dn/f35P+1pIMkv1yt0JMVb3QTvBOhmmHSOwj2/untnksuvbNkG7ynpfj/QE52QjZQN0Ue
	LHVnoKDkIdF6IZxwSkgNE8KvpWtP4czP3ESkww==
X-Received: by 2002:a05:600c:3510:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4a96667dd75mr44218195e9.11.1793191519063;
        Wed, 28 Oct 2026 05:45:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm29772912f8f.28.2026.10.28.05.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:45:17 -0700 (PDT)
Message-ID: <0602847f-4fef-49b6-a1eb-3240d7c1ecbc@tuxon.dev>
Date: Wed, 28 Oct 2026 14:45:15 +0200
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
Subject: Re: [PATCH v4 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain
 in the restart handler
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
 <20241015164732.4085249-5-claudiu.beznea.uj@bp.renesas.com>
 <auC7FueGYTiLOpcX@black.igk.intel.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <auC7FueGYTiLOpcX@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/26 16:54, Andy Shevchenko wrote:
> On Tue, Oct 15, 2024 at 07:47:32PM +0300, Claudiu wrote:
>>
>> On RZ/G3S the watchdog can be part of a software-controlled PM domain. In
>> this case, the watchdog device need to be powered on in
>> struct watchdog_ops::restart API. This can be done though
>> pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog
>> device are marked as IRQ safe. We mark the watchdog PM domain as IRQ safe
>> with GENPD_FLAG_IRQ_SAFE when the watchdog PM domain is registered and the
>> watchdog device though pm_runtime_irq_safe().
>>
>> Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
>> context'") pm_runtime_get_sync() was used in watchdog restart handler
>> (which is similar to pm_runtime_resume_and_get() except the later one
>> handles the runtime resume errors).
>>
>> Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
>> context'") dropped the pm_runtime_get_sync() and replaced it with
>> clk_prepare_enable() to avoid invalid wait context due to genpd_lock()
>> in genpd_runtime_resume() being called from atomic context. But
>> clk_prepare_enable() doesn't fit for this either (as reported by
>> Ulf Hansson) as clk_prepare() can also sleep (it just not throw invalid
>> wait context warning as it is not written for this).
> 
>> Because the watchdog device is marked now as IRQ safe (though this patch)
> 
> ...which is complete hack and has to be avoided.
> 
> Can it be solved differently?

Can't tell ATM. This solution was suggested by Ulf.

> (Note, OMAP, for example, got patches in the past
> and become pm_runtime_irq_safe()-free.)

I'll look through it.

Thank you,
Claudiu

> 
>> the irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume() returns
>> 1 for devices not registering an IRQ safe PM domain for watchdog (as the
>> watchdog device is IRQ safe, PM domain is not and watchdog PM domain is
>> always-on), this being the case for RZ/G3S with old device trees and
>> the rest of the SoCs that use this driver, we can now drop also the
>> clk_prepare_enable() calls in restart handler and rely on
>> pm_runtime_resume_and_get().
> 
>> Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
>> watchdog restart handler.
> 

