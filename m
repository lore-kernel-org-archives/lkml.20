Received: from mail-qv2-f20.google.com (mail-qv2-f20.google.com [74.125.230.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312E913D53C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945445; cv=none; b=IHUcwWyn2xkw4GeEkKlUpw1zbKePgKtajWvd3PT/kNnUT69UfuKMRAvLDgQvrtz76LFTkhLoIpC0TZIuQmp/FMrT93HPmG29LbiPS+9JUmhz3vPR9A99ckUHXdbzhYcCRnfbBN6LsrOtRZAwpmhvWHLqtBhHau34IdYpfLKF4Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945445; c=relaxed/simple;
	bh=RDvqCPY+eatYq4skVwjSxusdJJ+xgHjTcR0ZIPpSpJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tikuy+W/kXRhqVT/D7y/hxeAtHmSlfDlBrLTtnKIRDRFYVbSf3JlAqrwRb7caiBiEKtaC0PNkjvHEKknRF246ERzRhcqupCmmAUUTqfI03mNfHs93rW/5+BDV5BH5WXWW0nMQxJxJLpGOHmH+6Mvboi1kXTdN8N6BKxxK3tqAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=rgtykMFF; arc=none smtp.client-ip=74.125.230.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="rgtykMFF"
Received: by mail-qv2-f20.google.com with SMTP id 6a1803df08f44-9178b9b7ecfso141806d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790945443; x=1791550243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8C6IY6hrwUCYkJY1q4zGewFhDR7iQnEfGNN+lv5xIQ=;
        b=rgtykMFFN0/9F98E3meDUCdLID5wUdC+s9qT1JdFsbyqBcEZtF4UqSsvPItOo+Fc1E
         ovti4NC4LXQjxMioJXyw3f1IBaz1WGf9hDr7C35x6hX9jobxYz3OSJGQ9g5Za4/khJHb
         j+AAxfPvB6XNey3n88ph9aFutMRNjoyApX4oDlF5mKBvYIlxtWuUHrMEI5tAH3lnYZap
         6EsgfQ8s+d4AHa32ppa0hpsiIRG+pvcyYpeJBtATDOk6ygDxz4e2qvsql84VCSJBRhdJ
         9WNDC6EuEPaf3SzGzpRpVhGj6aOSS3h230N9O1HzQg/HjQY61KPpSptl5LBQR/INC9a4
         ylLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945443; x=1791550243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L8C6IY6hrwUCYkJY1q4zGewFhDR7iQnEfGNN+lv5xIQ=;
        b=FCkY7/PeKkIVmV/BnVtyVx1SLt3r+es5uGPr0iEK0bG7lmsIBdJclPmucQQzNs5xiV
         dZaFnyLIXUt3QEfdFKIGrUqt/gPO1Q+SCHiNgZBB6d4DMiHojEgQ2jNIhr1tOVzyyrum
         tCXF7tamCIj2dV3lNjCfPancD1w2X0eKxMUmrQNTmSoJm8utTVCMBAuHx+vfvq/8TK6V
         KNGWlb47HsM4oYMKgLS5JtWiuFDBftuNrIdKMcMrU1pFpG3nOhbPKSZe+UjJnZ/ftsq7
         ZB+1gePEdlmCCIfN7PaGvjbrfBVMvCdLtUL16Cof8pP+zYZYfx0wcAEJRxcohBeQLrBb
         2vQA==
X-Forwarded-Encrypted: i=1; AKwUvBwMSPz9EyX9rnskBZA/B6YTXJlnz2SbjFLKp9WQuVyDqCzmgtaJz+78ugfTcPkXksqwRuPPpiNOx80ZE6o=@vger.kernel.org
X-Gm-Message-State: AFuF++kstfUemt6W6Sw091UYcjC758WIFlmvXqMWIoLDajNupGlBMGz3
	4DAkDeSE29dcqxukcJmTEPKMAh5yUElOBqOwSm3VQED3PBOas1you14dm4loT3TukflPSaU8Jbb
	5xwTGUiQ=
X-Gm-Gg: AYBFou09XKX1KazV7HkW3tUPKqh9zxpinvhCkukZknjR5SCKPiDiuAkH++XDUitMOX5
	cRleAIpbMoZRREtt6eapHpyP6p8hhiX7OZnihVn2QNP0Qp5h/KHDeV5bTkMp9JG8c46uyGDA/C/
	NRNNJpVbpUYawBYAV3Y926ydrPaK7MCQ/FfIkkPqyvr/oiNH+HSzFhMK1MYn34UifELVYJ8JFno
	YBT/NvS5orWUxXdg0Rpv8aq4h4tZmjlHNC1QbRRU/YCAyvXirZxdUN52sS/jbEywYwiPTyYHXCI
	tjF3EKmlvi1g1/EuOezi/wrhGgzgqKCad71WBjs10uTJclr3vVfzVePggcRfM9Bg0op4D8SN34s
	VwmAJmlAcNRqyZZaTYaU0CeAUQtzTz0ch1RE02jWnHi8jYTFHvitFu3zRKEd6UmY87s/01RSlI+
	6xrq5sBM2JSlUesnFufKw35eG4uUmPRIS2PPDi2aU2DB6Fx35abVGd+4LHwW9Gxp97UYiu6po=
X-Received: by 2002:ad4:5966:0:b0:90c:b843:d679 with SMTP id 6a1803df08f44-917c00e9806mr53402956d6.29.1790945442817;
        Fri, 02 Oct 2026 05:50:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917d5939b0dsm19297236d6.7.2026.10.02.05.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 05:50:42 -0700 (PDT)
Message-ID: <bb42c2f1-eb0b-4ff4-a4a5-7f847baed1e8@riscstar.com>
Date: Fri, 2 Oct 2026 07:50:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: Kconfig: tc9564: fix a circular dependency
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: daniel@riscstar.com, bhelgaas@google.com, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20261002013306.373689-1-elder@riscstar.com>
 <d8890acd-d854-4f66-8ea9-3b30bde41605@app.fastmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <d8890acd-d854-4f66-8ea9-3b30bde41605@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 1:02 AM, Arnd Bergmann wrote:
> On Fri, Oct 2, 2026, at 03:33, Alex Elder wrote:
>> The TC9564_PCI config option selects PCI_DYNAMIC_OF_NODES.  But that
>> depends on OF_IRQ, and TC9564_PCI does not satisfy that dependency.
>>
>> Simply adding "depends on OF_IRQ" results in a recursive Kconfig
>> dependency.
>>
>> A little experimentation shows that the recursion can be avoided
>> when "depends on OF_IRQ" is added by *depending on* rather than
>> *selecting* PCI_QUIRKS.
> 
> Hi Alex,
> 
> This change looks technically correct, but I find the description
> misleading as you are not actually fixing a circular dependency
> but instead a missing one.

That's true.  It's adding a missing dependency in a way
that avoids the circular dependency.  I will update this
and send version 2 shortly.

>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 9c5b1e9d672e8..87ea92af81dca 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -571,9 +571,10 @@ config MCHP_LAN966X_PCI
>>   config TC9564_PCI
>>   	tristate "Toshiba TC9564 PCI function support"
>>   	depends on OF
>> +	depends on OF_IRQ
>>   	depends on PCI
>> +	depends on PCI_QUIRKS
>>   	select PCI_DYNAMIC_OF_NODES
>> -	select PCI_QUIRKS
>>   	default m
> 
> I would go further here and simplify this to
> 
> config TC9564_PCI
>   	tristate "Toshiba TC9564 PCI function support"
>          depends on PCI && PCI_DYNAMIC_OF_NODES && PCI_QUIRKS
> 
> (in either one or three lines)

If I do one, I'll combine OF and OF_IRQ similarly into one.

> CONFIG_PCI_DYNAMIC_OF_NODES is a user-visible option, so you
> should not select it from a driver.

OK, I didn't realize this.  Another thing to look for.

Thank you Arnd.

					-Alex

>    Arnd

