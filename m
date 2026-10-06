Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132581A3AB0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791250640; cv=none; b=TOkaPUbHhPXJJEmJvGV964cysBtav9S237KJTwdZo/aSMUNnWxU7O5+KS+eivdVTSZseS99A6EAoFEomC6+kC7y/eRU5cYIWor79wnfpaZtcAeggg66MwuqLET1+xq9MGGqTG/1hj3gjO0Bz44GHUxj9B0736rYDYj62NGA30gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791250640; c=relaxed/simple;
	bh=MwhIUu8284tsPXQflMPNAg1Eksl24JjpDL1h+L6/E6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSPzOWM1nI4yb7Ay8vsx0Xtn19p2mf4rHDc62Bgu/NG9mPbZWV2Kc+0nb2FzghuL2g4zJrJfJe9hlGHfF0NAgxb7edXh5LFSLNr9RAFprVY1ZMPxBlSuEJnRpeUWZrfFquCEDjvKEUKMs/+sIo5tD+IVk7A7gv9kBmzh8tvQcOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pzla47UY; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pzla47UY"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so2250690a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 18:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791250638; x=1791855438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZvrpE+UCMWuW/cWov2L5qNAmDeOn4P8WPzJ2s8dPcc=;
        b=Pzla47UYTFp+ISe1/LXeoK4CMO8yMX26zRKkKxaOVsBzJGYEbvk/r5sV9AUtm60Qfc
         qcRfzBiTk4x5XlIV1kqchITQSLvv7F9OTncEzz+SXQ6GJPTbTCfCjNi97R7kob5YPJ6v
         Nb8t+u7e1S4VQDGVyV7ZScMHk6jOQgkfiLXPc4Q0Hsw1RvoKRMGoIkE2P/ivH/tW7Fjh
         n7SJ1tEvW6LtMEBeDEGgt2lP6ejKjq8jCgWF0QTrsuFNgMlTcY8H91EhfqgufoqiOu6h
         88sRidQDMdherE7U2D7GUUPN9xcL2gjf2SJBYbOr6QOilNCzw95RU3sEp384MnXeB/dA
         a9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791250638; x=1791855438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZvrpE+UCMWuW/cWov2L5qNAmDeOn4P8WPzJ2s8dPcc=;
        b=A+wNykj2/vKxFuHhqWZJqzJ7GI5W+hgCKC62U1dKx0Ff7EWMMdpoossmcwN8mTx+uo
         vLwRM9Pq9ERQIXs4B1UytVKB7AfKQ4I6q2IgtLYQmPn8HSzyD1+bZ4mEQmnqVTr8IBP4
         8tNrSfRPY5fHIIkvPBm9/CR6YO/l9YZ/7d5H2OdGEyM4Nm7Qv/ove6tCTpMK/vUbehHb
         tIp47Mi0JtoTe5eK78QkI/yTBBA6TJDriepn1DkoS7sx85B2Kaa/w3Whv8LUqfGfuVAK
         z0ZYhWY/0XtfJLAZ7RvC+nEjIIjoGj3YWQ9QMh6ke3ZACfiL1muEcLyUgMu7q2jYdNjA
         O3rQ==
X-Forwarded-Encrypted: i=1; AKwUvBww04B7qSThQlrKRymvvUCMK2iKJ+fRvQF8tvpUzQVEG314ZtLN0Y6KikVtRVg3yLjFByWY4A3079OlWEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpRRTWACVDreQ/kGX3eCVZdY60pkGLswwve0FEwU+ZBAkFWmX1
	EA2lO199ZtxpiGs/Ev8m1yVMzKRYs+1hDDUjwaPqn2P5gC+s/LXnVDrX
X-Gm-Gg: AYBFou399XvQZcYPxBK8FH79hwRDhshBERF06pPAafuLsFiesWUYW/zU86eHn0GJo3o
	exmBSWeJErlRj902xKVAV8bymn26/vpYlktGyPzCQBuOcRpwUkH+4pLWqqvDR1CskHj5QrQ/W2f
	t1uZ6K3NdL2Ph+kxmWAQPLZJ9afl0OIPkev+v+ZVhTyqlqaHsXWyV+lUuij7RjtNPK0bsOMyHJ/
	bCSNzoSw/7Hl9gLVOrVxtcDRAi59s6KVhSlL+XX1SCtFYMf1ogMzDpQCY12boolHbOK/dnd6ozX
	q1ltqVXkd5/uSNDtUAEuS0khfpbU5yjstKo765rgi3SomKT5OVg8Zp47rTTMg12ce4G3nyO5Gf+
	KIaxPyxK5MX/nxu8YOj7qY0A6msemOgVk8/avKWFdGy3rbbo+0Yor26DO2dcsSr2ey5dFnGOU8L
	HCUpDWVtHoprLHNkTbJZP0JlRhFVQEypMIrM02RuZGWKnxFKv+FTf+0kHYdbPbgwrFiqV0w91VV
	2f6kbGH2yr5LoRm6bs8P28IyEuSAI5KBMVfVzUDJVbLOCpGIQASliM=
X-Received: by 2002:a17:90b:4d0d:b0:3a7:ecab:c4d3 with SMTP id 98e67ed59e1d1-3a7ecabcdc5mr4934553a91.23.1791250638290;
        Mon, 05 Oct 2026 18:37:18 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm2081598a91.13.2026.10.05.18.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 18:37:17 -0700 (PDT)
Message-ID: <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
Date: Tue, 6 Oct 2026 09:37:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asN29Gi71MIA-2fq@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Vinod Koul 於 2026/10/5 下午 06:07 寫道:
> On 29-09-26, 10:08, Joey Lu wrote:
>> PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
>> PHY1 control bits shifted 16 positions relative to PHY0.  A separate
>> driver for PHY1 would duplicate this logic, so the existing driver is
>> extended to manage both ports.
>>
>> The original driver polled only DEVCKSTB after releasing PHY0 from
>> reset.  When USB0 operates in host mode (USB ID pin floating or tied
>> high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
>> exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
>> phy_init() call from the EHCI driver.  The init callback is changed to
>> accept either host-mode or device-mode clock stability, whichever
>> asserts first.
>>
>> The power_on and power_off callbacks are replaced by a single init
>> callback that handles PHY reset and clock-stable polling, because
>> there is no PHY-specific clock gate on MA35D1; the PHY analog block
>> derives its reference from the HXT crystal.
>>
>> A read-only USB role switch is registered for PHY0 to expose the USB0
>> role to userspace via the standard role-switch sysfs interface.  The
>> .set callback returns -EOPNOTSUPP because the hardware mux is fully
>> automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
>> is not enabled, the registration returns -ENODEV and the driver skips
>> the role switch gracefully without failing probe.
>>
>> Two new optional device-tree properties are implemented:
>>    - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
>>      codes to the RCALCODE field in USBPMISCR.
>>    - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
>>      the over-current detect input as active-high.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/phy/nuvoton/phy-ma35d1-usb2.c | 286 +++++++++++++++++++-------
>>   1 file changed, 211 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> index 9a459b700ed4..547c7d55d8ff 100644
>> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> @@ -1,11 +1,16 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * Copyright (C) 2024 Nuvoton Technology Corp.
>> + * Nuvoton MA35D1 USB 2.0 PHY driver
>> + *
>> + * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
>> + * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
>> + * PHY0 switches automatically via the USB ID pin.
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
> Not correct, this should be updated to 2024-2026, you dont drop the
> copyright notices, you update them!
Agreed, will fix in v7 to preserve the original 2024 date and reflect 
this series' changes.
>>    */
>>   #include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>> -#include <linux/io.h>
> why is this dropped?
This driver never did direct MMIO access (no readl()/writel()/ioremap()/
__iomem), even before this series - all register access goes through
regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
unused include already, and it's dropped here as part of the broader
rewrite touching this include block. Happy to keep it if you'd prefer
not to bundle unrelated include cleanup into this series.

Thanks for the review.

BR,
Joey
