Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4B8408602
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219397; cv=none; b=CQMHqZtsYAoefr0a5wL8e/359EfkRVq55vSs7NEV6aYLbbbJVYsAant0KLgYuXw9w9mguGjM4NO0z4UYWocJDOMLuzpMi1XV+uTBfuzK6ms6wHSM8PHNYSq9Qtkyks/muVcE64p6MxzBNhDzvA21JC9jRfi5JkQwskGdqdJhcWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219397; c=relaxed/simple;
	bh=cbcSrNRNcAG7Z47vK6hvpf8rnFIdQaXe2pDj1yvCyfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okl74euvY1x1sBE9x5fRnRDK+hlq9YyobO1Hj2EEA5jfdatf6/0OkfxVeFQbgDJLuNolrXF4JglZ2AF2y+4eh08rzuxIoxzJRma3wa8ugTbantuPErIAfJ/5E8NTFls59CEfJ0KETDMxuDIh84joWZLeQmtrO3ov446wgL7M7iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhQ8WHaH; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhQ8WHaH"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3457636a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219395; x=1788824195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNKHzwsqTyr8mpiuYBxRoOjN0F9FM++pZVRwYu1wmMc=;
        b=jhQ8WHaH6cBEAZCJJH/iUhIYNYnOBXlfTYEKVQ8y+6t7nf8xL1Mpwj1vsYZ1JW9Utg
         jy7Br6Fom6pX41L36eCIZjYk++G+5n/psE8WqmP2rRbMxizn3Ig/Gt0lbZQfuAMaGE0s
         p7F/zMOq7QZ8o3fpS1QcdLNOI+i6yAE048y/aGoslU+omC+qv6N7anQYSfpXz77Tq+SF
         rje7JMDF4ebo1i1RFjumqUqoxz6G50INbsSuVuSNBpB4ltQJgdxuRgQviZomGttgKmQP
         ZKvwGhJUNetwT+09yJQYJoPPky4zwxFpSFOIslIAT7XEZAc7sV4QmRyxkHhqPkY4FbGV
         F2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219395; x=1788824195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNKHzwsqTyr8mpiuYBxRoOjN0F9FM++pZVRwYu1wmMc=;
        b=H8DtREQLZMIWDf4wZ3qU0p3hQwOXI6XMk94SyQxuwvXWRUbu4fTCcCcdVCJKaF+ab2
         lXCvv3BJS+tfpnKWK1h3ehDVYyw1LcB28njwInwGRWFzU2l1ExzUvyaVcI5JzFwZNlrK
         YSshX2BC+OmOjq7k9dWeOZv7hvfp6tk99/Or28+a1FgUvVBrFCY6/33id8+/Ae9Qphpt
         YvDYOAV2QZKwFM74+W8mZfGicgmhBLBbLwxlIhei6aAYjQC+1E1s83gDOTzjX9Kg9fqv
         +2nLUsJtZmUTBFudFnA64ZygY8jJ1LC5JWjDG+ut2fBRY21c95ztkr4dTC3QGrzRCoNT
         Uu0A==
X-Forwarded-Encrypted: i=1; AKwUvByZZl9Tx6kQTan4ds+sIsriV3DI8Qg/MoAe4yDZJdpeI5NOmqpTW80iQDYPLBcHxyuMECEUJ6F0e3I5iD4=@vger.kernel.org
X-Gm-Message-State: AFuF++m3W9HLJZcFoqbGRvk7Ceqyuw4eCyqo8A+uDJmWJ/7ocdk++/Ux
	EbnhWQn9JLVN/remCMAi8DKa835SfmgAAowjqN+io0pimAB7UGWvjIgGFY8IFfUau9U=
X-Gm-Gg: AYBFou2yjFnOBN7RU7NTxjDv7kMjCUlduz1eNXkZasBMzhw9lVU0a2TJzG3lI3Ny/FH
	fKCM7822IvzgDXY5Jb3d6E8sq/KyBal8DezVqfXZPZI+OcgT4EdyytfyhnYyI+H1113RzB6XWoU
	Hs6fCtlyQj52hoaGDQkP80kGT4nvsrfgXoB9BUP9m8oEjgNn0r5SV8IRCH9J38hFp8m0nQsYvAv
	DTKVoRo6nsRCGMe9kXsfWnakpWEx1b5sacGQrBqAdQ6+g0K7V6LVNxPociYKjSw+DoAoS767WmR
	ANa1jsU9GoRaJVvPpK/NvmnmJKuW/AGWcskNhXPAwsJU3ypjL2KXAcrUyGr7/BkdzzwxnhShsb7
	hWOD6tnKQ/aA+yJiVWQTSoI9Wce3WczPYTDmjdupTzgvU1QQGmNLz2ygPdptB4U6NdnunMJRgHk
	wYPaoHaJbTagYVZjngRyJ5snq6QOYAK6c15v8EjTRZ1jCKT001QbTyoWlgPPz5USQ5MSfZdPxfb
	yJ8sC7BRF4W6MavDIoovrUSeUlGR2vyGS/KtVACvUkkY84EewRvvh5QVpK2
X-Received: by 2002:a17:90b:3ec5:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39907d6563cmr5172164a91.15.1788219394890;
        Mon, 31 Aug 2026 16:36:34 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990baaeec3sm2140340a91.0.2026.08.31.16.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 16:36:34 -0700 (PDT)
Message-ID: <103c9bf7-fc07-46bf-af0c-0cf6bb2a0928@gmail.com>
Date: Mon, 31 Aug 2026 18:36:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guenter,

I checked the i2c bus and there is nothing at address 0x22:

# i2cdetect -y 12
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- 71 -- 73 -- -- --


Sorry for the double reply, I forgot to reply all.

Thanks,
Matthew


On 8/31/26 12:28 PM, Guenter Roeck wrote:
> On 8/31/26 08:12, Guenter Roeck wrote:
>> On 8/30/26 16:21, Matthew Bettencourt wrote:
>>> Hello,
>>>
>>> I believe I have identified a bug in the spd5118 driver's suspend/ 
>>> resume cycle where register MR11 (0x0B) becomes corrupted and set to 
>>> 0x08 during spd5118_suspend().
>>>
>>> Upon system wake, MR11 remains set to 0x08. This persists across warm 
>>> reboots, causing the motherboard BIOS and OS to incorrectly identify 
>>> a 32GB DIMM as only 2GB after a warm reboot. A complete cold power 
>>> cycle clears MR11 back to 0x00, after which the system correctly 
>>> detects the full 32GB capacity again. Blacklisting the spd5118 driver 
>>> prevents the issue entirely.
>>>
>>> To troubleshoot, I instrumented the spd5118 driver to log both the 
>>> cached and physical values of MR11 before and after key function 
>>> calls during suspend and resume. The corruption occurs during the 
>>> regmap_update_bits() call (~lines 505–506):
>>>
>>> regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
>>>                     SPD5118_TS_DISABLE, SPD5118_TS_DISABLE);
>>>
>>
>> That is a write to SPD5118_REG_TEMP_CONFIG, which is MR26, not MR11.
>> I would agree that a write to MR11 would be fatal, even mode so
>> writing 0x08 which changes the legacy mode bit and, yes, doing so
>> would be fatal.
>>
>> Can you also add a debug log to spd5118_nvmem_read() ? I wonder
>> if that could trigger writes to MR11 through regmap. That should
>> not touch bit 3 of MR11, but who knows.
>>
>> Thanks,
>> Guenter
>>
>>> --- System Information ---
>>> System info:Motherboard: ASRock X870 Pro-A WiFi (UEFI v4.43)
>>> CPU: AMD Ryzen 7 9800X3D
>>> RAM: 64GB (2x32GB) G.Skill DDR5 (Part: F5-6400J3239G32G)
>>> Kernel: 7.2.0-1-default (openSUSE Tumbleweed)
>>> SMBus Controller: AMD PIIX4 (i2c-piix4 / bus i2c-12)
>>>
> 
> Actually, we can see what is happening in the log below.
> 
> Context: Bit 0 of ADDR is the direction. Bit 0=1 -> read operation.
> Bit 1..7 of ADDR is the I2C address.
> 
>>> --- Testing and Logs ---
>>> Logging captured via dmesg shows:
>>> [  277.569950] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>> [  277.570507] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>> [  277.570594] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>> [  277.571150] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=1a, ADD=a3, DAT0=00, DAT1=18
> 
> Read MR26 for 0x51, 0x53 (0x00 -> enabled)
> 
>>> [  277.571226] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>> [  277.572067] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
> 
> Read MR11 of 0x53 (=0x00)
> 
>>> [  277.572082] [    T113] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  277.572142] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a3, DAT0=00, DAT1=18
>>> [  277.573073] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a3, DAT0=00, DAT1=18
> 
> Read MR11 of 0x51 (=0x00)
> 
>>> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  277.573140] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>> [  277.574063] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
> 
> Read MR11 of 0x53 (=0x00)
> 
>>> [  277.574130] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a3, DAT0=00, DAT1=18
>>> [  277.575552] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=01, ADD=45, DAT0=ff, DAT1=18
>                                                                           ^^      ^^       ^^
> This is unexpected. It was supposed to read MR11 from 0x51, but the 
> returned data is 0xff,
> and the CMD and ADD register values are changed. 0xff is returned to the 
> calling code as MR11.
> 
>>> [  277.575617] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=1a, ADD=a7, DAT0=ff, DAT1=18
>>> [  277.576169] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=1a, ADD=a7, DAT0=00, DAT1=18
> 
> Read MR26 of 0x53 (=0x00, enabled)
> 
>>> [  277.576237] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a2, DAT0=f8, DAT1=18
>>> [  277.577061] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a2, DAT0=f8, DAT1=18
> 
> Write 0xf8 into MR11 of 0x51. This is where things go wrong. The call 
> originates
> from regmap, which tries to configure page 0 (lower 3 bit) while leaving 
> the upper
> bits alone (which were 0xff from above corrupted read).
> 
>>> [  277.577121] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=f8, DAT1=18
>>> [  277.578063] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
> 
> Read MR11 of 0x53 (=0x00)
> 
>>> [  277.578127] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>> [  277.579062] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=1a, ADD=a3, DAT0=00, DAT1=18
> 
> Read MR26 of 0x51 (0x00 -> enabled)
> 
>>> [  277.579131] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=1a, ADD=a6, DAT0=01, DAT1=18
>>> [  277.579560] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=1a, ADD=a6, DAT0=01, DAT1=18
> 
> Disable temperature sensor support on 0x53 (MR26 := 0x01)
> 
>>> [  277.579620] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a3, DAT0=01, DAT1=18
>>> [  277.580170] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a3, DAT0=08, DAT1=18
> 
> Read MR11 of 0x51. Since 0xf8 was written above, 0x08 is "as expected".
> 
>>> [  277.580234] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=08, DAT1=18
>>> [  277.581061] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
> 
> Read MR11 of 0x53 (0x00 -> page 0)
> 
>>> [  277.581072] [    T113] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  277.581128] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=1a, ADD=a2, DAT0=01, DAT1=18
>>> [  277.581559] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=1a, ADD=a2, DAT0=01, DAT1=18
> 
> Disable temperature sensor support on 0x51 (MR26 := 0x01)
> 
>>> [  277.581626] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>> CMD=0b, ADD=a3, DAT0=01, DAT1=18
>>> [  277.582236] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>> CMD=0b, ADD=a3, DAT0=08, DAT1=18
> 
> Read MR11 from 0x51, wrong as before
> 
>>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>
>>>
>>> --- The logs that are of interest ---
>>> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> …
>>> …
>>> …
>>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>
>>> I enabled i2c debugging as well in case it helps. The lines I 
>>> focusing on are “PRE BIT UPDATE…” and “POST BIT UPDATE…”, immediately 
>>> after regmap_update_bits() the physical bus value for MR11 shifts to 
>>> 0x08 while the regmap cache remains 0x00.
>>>
>>> I looked through the history of spd5118 patches and bugs and noticed 
>>> there has been some issues around suspend and sleep cycles. This 
>>> might be a deeper issue than just the spd5118 driver.
>>>
> 
> Those problems are related to I2C controllers on some Intel boards, 
> which disable
> write operations. That does not affect AMD systems.
> 
> The problem is that one of the MR11 read operations fails or, rather, 
> returns
> bad data. This bad data then corrupts the register when written back.
> This by itself is odd. There should be at least a debug log message if 
> there is
> an error in piix4_transaction(). Is there anything on address 0x22 on 
> that I2C bus ?
> It almost appears as if there is a parallel access to the I2C controller 
> (for
> example from ACPI) which would corrupt the data for the spd5118 access.
> 
>>> Additional Notes:
>>> - Intermittent Nature: The issue is intermittent and typically 
>>> reproduces within ~10 sleep/resume cycles.
>>>
>>> - Single DIMM Testing: I was unable to reproduce the issue with only 
>>> 1 DIMM installed after running over 30 sleep/resume cycles, though 
>>> the intermittent nature makes it hard to rule out entirely.
>>>
> 
> Both is not surprising, given that we are dealing with corrupted data when
> reading from MR11. I have no idea how that corruption can happen. The above
> is a wild guess: If there is indeed ACPI access to the I2C controller, the
> only remedy I can think of would be to black-list the I2C controller driver
> itself.
> 
> Thanks,
> Guenter
> 
>>> - Hardware Health: Memory stability was verified with a varitey of 
>>> memory tests with zero errors. Issue occurs with JEDEC and XMP 
>>> profiles enabled
>>>
>>>
>>> --- Steps to Reproduce ---
>>> 1. Boot system from cold boot. Load the spd5118 driver.
>>> 2. Put system to sleep
>>> 3. Wake system
>>> 4. Check value of MR11, if corrupted warm reboot go to step 7
>>> 6. Go to step 2, repeat
>>> 7. System now shows corrupted DIMM with a size of 2GB
>>>
>>> --- My test spd5118_suspend function ---
>>> static int spd5118_suspend(struct device *dev)
>>> {
>>>   struct spd5118_data *data = dev_get_drvdata(dev);
>>>   struct regmap *regmap = data->regmap;
>>>   u32 cache_val = 0, bus_val = 0;
>>>   u32 regval;
>>>   int err;
>>>
>>>   err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
>>>   if (err < 0)
>>>   return err;
>>>
>>>
>>>   /* 1. Read cached MR11 value from RAM */
>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>>
>>>   /* 2. Read physical MR11 value directly from I2C bus */
>>>   regcache_cache_bypass(regmap, true);
>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>>   regcache_cache_bypass(regmap, false);
>>>
>>>   /* 3. Output both on the exact same log line */
>>>   dev_info(dev, "PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x 
>>> | Bus: 0x%02x\n", cache_val, bus_val);
>>>
>>>   regcache_cache_bypass(regmap, true);
>>>   regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, 
>>> SPD5118_TS_DISABLE,
>>>   SPD5118_TS_DISABLE);
>>>   regcache_cache_bypass(regmap, false);
>>>
>>>   /* 1. Read cached MR11 value from RAM */
>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>>
>>>      /* 2. Read physical MR11 value directly from I2C bus */
>>>      regcache_cache_bypass(regmap, true);
>>>      regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>>      regcache_cache_bypass(regmap, false);
>>>
>>>      /* 3. Output both on the exact same log line */
>>>      dev_info(dev, "POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 
>>> 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
>>>
>>>      regcache_cache_only(regmap, true);
>>>      regcache_mark_dirty(regmap);
>>>
>>>      return 0;
>>> }
>>
> 

