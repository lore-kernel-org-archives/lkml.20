Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509727;
	b=dxzcI0toRVFHCUrMvT7KQXcOx0hTw4FdE//XDSs12/OdqijToQCX2ng/pGO5JU5zFngu
	 t+vtEbY+mwaCLJ8241LtZoVbyopEp3bndRgA67bW/RmBgyDZJL60N1jZIc80GadRYYegf
	 6Dv0DJxUVttVG3hNGP5zzp5iHnPl4O2OUWiHTvQP/S/ZLxOBNKnC3nnS8iF9E7GH8EQiP
	 WH3gkLJRG6s+6wRrPvXXYlh/QTjIyxmjKWi9CELXQ7KVeBoYKgtzkNcVn3gMzyZmGpGYa
	 N2A7cf9iUcPQvuNOCFGtijJ75SrLLBjxCVXly+3lM/DDS+ejTaRSwhfTJWM3Jt1qfDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=T97M8E+1OS922A7v1/zJrg/XyMcn9TaXRosAfSHf8V4=;
	b=ML8EMHNYp1DBSxntnAJJ1/ur9BN8Te37NQPs83wWNEELQHheI+bL9OfZZOP1cxE/1ooG
	 vSJm2KYWUZPflTFbUv27vR8PnqXH6ZrX2xQwlxKmxZgc1JFbq1fDSqgFnSCvkrR5NAYBX
	 /6oRfntbpXAFX9yl6QCYA2AOg1F4Sgka0GF+EsKB1VzZ+XytptglblygCzdDob2oDO0CB
	 W7J/v2n8ivF5E9wr1fYYpsxTSP/04Djyamvc8VmlYAztw+YLC5lOQrBxLw7drU4GPeqet
	 hr0SvBHyhMBDAFQkqdb/amyEz0H5Vdaw/j9V0oRyb8A8nfFFazCZ85d4+Ceza+R0jCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHu+NpDI;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD6560A3803
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD6560A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHu+NpDI
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso43974a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509726; x=1795114526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T97M8E+1OS922A7v1/zJrg/XyMcn9TaXRosAfSHf8V4=;
        b=LHu+NpDI16jcjf0qVYJd5SEQguMAnZHKvWVIxXJlTA77p2KAfDtnXVy7AfTTmVj79c
         c8JI2iN6DJX+dz+sML7pMeIv2EENJLry/JEkQeSS8edeWiwrFswE28A5jPv1rlUtpo/C
         wm9MgfqSPtxsQLp5zuwW8ivvNWgeBHHv6TogXXU5QeNAcNzMOMLOjLXOW5uhq7nUtb81
         GOCL82aDJOqL8vNbxNF0GEg6gFOKT2Gn4PiE1G9XbY5k1xCOdtkJDRQ65Th1SuxKIUdl
         5311csriCm+rWv3zl+HDSAgI4UpDyQVihaByHAChJ1cAXMNwcoeTDSgzRVoxYopwSg78
         q8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509726; x=1795114526;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T97M8E+1OS922A7v1/zJrg/XyMcn9TaXRosAfSHf8V4=;
        b=rlJflaCAY/7qGeBl7CfcMT4xcMgbRuhmZt5ug2NCDt71Jgtl1miQ/26szn+6X2ph0h
         3fPX60LR3emWat0Fv7wHYBWyT8MPcj32X7ccUf2dCscYzh6oHaftTDHFXcrKKqDfwA3Y
         +DnNJXRSylUN6a1PLZkxFgA0WhYTxUBhKxq0Pn6j2C43KMQYsfr4GZHmk3kYDz3Nu7ic
         tO4bro2oRimbC47PdE4zaAFwWORIy2Oqa4TJbo/FdduDy9Afcr12gIcnJC4anwcu3Ylv
         rZAGIuVsW448ObiczzvimeEF+FO/cazrxq59R1jr1x3+5eJblcopDEsufulM1cT3uKlM
         loVQ==
X-Forwarded-Encrypted: i=1; AL+hErEbiINcgt0n9+UMQFU67Y61Ya4ikVkrxr7bf7wqMMFLmmGcJSFWPl+QNXv0AWeEE1adZLH8iGticujH5NE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n7AbX++1c0z0+H4gowmlLm7hL0K6qyfhry62CzJGklHKh56nF
	i/pRWk0jlNkilCx1fD7ICgrihSjpvWbepNGhkcx/aArq6qVjT+FxIv5z
X-Gm-Gg: AYBFou2eKHV1kjb7iO3ggXTri4VBy5nqqVa7a5oCJA2GAFw66zjI5kypObm7b18Eivg
	IYvGCLwVSSEs5tlyysVtozm7kky/TcbdrckvD3ix7nx3Gj1+Send5YD5V2orZvIp9Ashlr/aVsI
	LZFIAuTWUGBeG7MvCLgb66B9L06yYoA/88hUGXdtFeYq4SfgvvTHHFOnJpWeVrEwLiiGym+zUJI
	64benbmdHLpGelGoCvxTMkpqCA3TVN1FjoOI5D2sJJ8VBDJN/4LUTPbOdCTIyAjtYNNs/Pk4sm9
	hiAhSqc3lzVgai2yQN2QCnqzm1OItGY33HlgJL8qyEgMEWaeP7Qf3aO6KrGu3WKQzZ4uz+eJxHH
	FmADMEVwHaoQVETHVbfY4P97ZzeiDgaqjQZCSsuyrurilcJoMH80aYl7uqy1+n+czFNVXfZsRo2
	1fVbVX2cs9RY+V6JuCL2HSgt4p4OuLuWJn6aWbCF+wAGzGaSu8v/5w+8Tz6hxUzSLR1GfSYwE7J
	lw6dtLRtv0XqEcVInhUQV0a1fyDJRqGDor96haUgfeg4jkBUDc0dHZGr2xbf1XTECXe58+r9a1l
	qD8vOi2Qe6ez+ygfb0MmZlry7soOeYVNhtvmGQIIS3YmG4u0UnPSp5NH1Q==
X-Received: by 2002:a17:90b:554e:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b1b07ef11bmr29915a91.3.1794509726107;
        Thu, 12 Nov 2026 10:55:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm669758a91.0.2026.11.12.10.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:55:25 -0800 (PST)
Message-ID: <5836cf85-78e8-417e-9142-666afbe1d056@gmail.com>
Date: Thu, 12 Nov 2026 10:55:24 -0800
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
Subject: Re: [PATCH v3 3/3] serial: sb1250-duart: Convert to use a platform
 device
From: Florian Fainelli <f.fainelli@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060322360.55540@angie.orcam.me.uk>
 <alpine.DEB.2.21.2608060406470.55540@angie.orcam.me.uk>
 <e211bf3f-d696-4bc5-baff-e27b933a89ae@gmail.com>
Content-Language: en-US, fr-FR
In-Reply-To: <e211bf3f-d696-4bc5-baff-e27b933a89ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 13:42, Florian Fainelli wrote:
> On 8/6/26 03:54, Maciej W. Rozycki wrote:
>> Prevent a crash from happening as the first serial port is initialised:
>>
>>    pata-swarm: PATA interface at GenBus slot 4
>>    workingset: timestamp_bits=62 max_order=18 bucket_order=0
>>    Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
>>    CPU 1 Unable to handle kernel paging request at virtual address 
>> 0000000000000208, epc == ffffffff8067f8f8, ra == ffffffff80666330
>>    Oops[#1]:
>>    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-dirty #27 NONE
>>    $ 0   : 0000000000000000 0000000014001fe0 0000000000000020 
>> ffffffff80666130
>>    $ 4   : 0000000000000000 a800000100e6f118 ffffffff8112cbc0 
>> 0000000000000000
>>    $ 8   : 0000000000000002 0000000000000000 0000000000000000 
>> 0000000001a80000
>>    $12   : 0000000000000000 ffffffff809fd488 000000004ddf14dd 
>> ffffffff00000000
>>    $16   : a800000100e6f000 0000000000000000 ffffffff8112c1d0 
>> a800000100e6f000
>>    $20   : 0000000000000000 00000000000004d0 0000000000000004 
>> ffffffff8112c1d0
>>    $24   : 0000000000000001 0000000000000003
>>    $28   : a80000010007c000 a80000010007fcb0 00000000000000ef 
>> ffffffff80666330
>>    Hi    : fffffffffffffdb9
>>    Lo    : 0000000000000035
>>    epc   : ffffffff8067f8f8 __dev_fwnode+0x0/0x8
>>    ra    : ffffffff80666330 serial_base_ctrl_add+0xb8/0x180
>>    Status: 14001fe3    KX SX UX KERNEL EXL IE
>>    Cause : 80800008 (ExcCode 02)
>>    BadVA : 0000000000000208
>>    PrId  : 03040102 (SiByte SB1)
>>    Process swapper/0 (pid: 1, threadinfo=(____ptrval____), 
>> task=(____ptrval____), tls=0000000000000000)
>>    Stack : 0000000000000000 ffffffff80cd5178 ffffffff80cd0000 
>> ffffffff8112c1c8
>>            0000000000000260 ffffffff806655c4 a800000100275bc0 
>> ffffffff8064ac88
>>            004000408112c000 0000000000000002 0000000000000000 
>> ffffffff801965d0
>>            a800000100786ba0 ffffffff80cd5178 a800000100786ba0 
>> 0000000000000004
>>            a800000100275bc0 0000000000000000 0000000000000000 
>> ffffffff80cd5178
>>            0000000000000000 ffffffff8112c1c8 0000000000000260 
>> 00000000000004d0
>>            0000000000000004 ffffffff80bf0000 00000000000000ef 
>> ffffffff80d171dc
>>            ffffffff80d17120 ffffffff80d25658 0000000000000000 
>> ffffffff80d50000
>>            ffffffff80d2f928 ffffffff80d50000 ffffffff80d25698 
>> ffffffff80cfcecc
>>            00ffffff80b84428 0000000000000000 0000000000000006 
>> 0000000000000006
>>            ...
>>    Call Trace:
>>    [<ffffffff8067f8f8>] __dev_fwnode+0x0/0x8
>>    [<ffffffff80666330>] serial_base_ctrl_add+0xb8/0x180
>>    [<ffffffff806655c4>] serial_core_register_port+0x174/0x8e0
>>    [<ffffffff80d171dc>] sbd_init+0xbc/0xf4
>>    [<ffffffff80cfcecc>] do_one_initcall+0x64/0x150
>>    [<ffffffff80cfd284>] kernel_init_freeable+0x25c/0x30c
>>    [<ffffffff809ff6e4>] kernel_init+0x24/0x118
>>    [<ffffffff80112d20>] ret_from_kernel_thread+0x14/0x1c
>>    Code: 67bd0010  03e00008  2402ffea <03e00008> dc820208  67bdffa0  
>> ffbe0050  ffb70048  ffb60040
>>    ---[ end trace 0000000000000000 ]---
>>
>> -- where a pointer is dereferenced that has been derived from a null
>> pointer to the port's parent device.
>>
>> Since no device is available with legacy probing and it's not anymore a
>> preferable way to discover devices anyway, switch the driver to using a
>> platform device and use it as the port's parent device.
>>
>> Use platform_driver_probe() because SB1250 DUART devices are embedded
>> onchip the SoC and therefore not that straightforward to remove.
>>
>> An unfortunate consequence of the switch to a platform device is we now
>> hand the console over from the bootconsole much later in the bootstrap.
>> The CFE console handler appears good enough though to work so late and
>> in particular with interrupts enabled.
>>
>> Conversely, only starting the console device so late lets the port
>> initialisation code always use fsleep() for transmitter draining, so
>> drop the other variant since it is now dead code.
>>
>> Since there is one way only remaining to reach sbd_init_port() now, drop
>> the port initialisation marker as no longer needed and go through the
>> channel resets unconditionally.
>>
>> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers 
>> to enable runtime PM")
>> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
>> Cc: stable@vger.kernel.org # needs to use .remove_new for <= 6.10
> 
> On BCM91250E (Sentosa):
> 
> Tested-by: Florian Fainelli <f.fainelli@gmail.com>

Could we apply Maciej's sb1250-duart patches because this is preventing 
the use of those systems while everything else works just fine.

Thanks!
-- 
Florian
