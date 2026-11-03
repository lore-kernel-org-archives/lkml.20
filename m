Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742156;
	b=WI1JDpTll+sCgEQAPq3XQpUOWWkmhBu/yMqSE46c0vYhcApZhum9S6hVvkWHug6jMTEU
	 m0ieV9raGSkAQAPy79d/8BIF1qXwe77L5za8XHDfrIPME5AEzY6N3zwgHzmdz3zEYU7T7
	 Lmns26sJsjXB2wZiNvNqy8JlLn1c2sjcImrLxASyEWEvUh7UZZLRUzJUD4G74IA14YrWy
	 sIsGfw60HNdavhq4HEXXO+jpCphRXeysHztVP2CYXCAfIWIeCVSxqi9sX1o/pi6fvw4ns
	 62amcsshbW6ssxXgpcOF76x3yMU+fkoHNFuZHKRz9W1zTXbP6ffQ0QCrvVkFSsceWGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=azPPo8H7+DKD17rL0rWwBjVEKBbc6amwqtN9WdKwMgc=;
	b=YSvJM2oqrLcSHkFvwd/7xJDJ0+dBNY/uRzYamQaEV5xLiVRlhSubbNeoahcJus0W0Lrm
	 NmzpKTHW8o7PV4MoijDbkFan8NvI+tSBhmAxhzm1M60+tf5eMxgBErNxbKz52hbSoMBKB
	 1FIjc91qt6PgyP3NQrcCR7EB0FR8pMgC2NeutZsHTBxy7dGEp0oN2uYmvKUZrEM2xGPJC
	 iokypjoh7eaiBQ3Ps31exBYJD4vqMn3joHyRSnBg8+9kYUHunaLgM00N7V5kbyyNAIRhp
	 6GSd5TmERUkOmCxB4/DhdH75EZpike8rckQjk8FltXPcv1CGaHMgf8bHile2uk+Zyzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG0kV9tr;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FA606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4FA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG0kV9tr
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1adbf62dd31so134664c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742155; x=1794346955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azPPo8H7+DKD17rL0rWwBjVEKBbc6amwqtN9WdKwMgc=;
        b=uG0kV9trF+tpH5NGG08X2nXLCYrNuuLYjRzsFhR+KujNcKwgdzFodzwzUBThLeO40q
         bFtlq26uYDUXkvc+hIE/0/HJE0PHd8x92/AmZQEDmueeUixdh1+ORtHEJtJym0HCvpbk
         O1FRmG1pWdQ+4Y8DQD9eF9sO1K4IZvEk2XebYJVfvCd2haUghPNIfioNcdJCeSztKlgH
         lx18/3kxQ6WxcLja3A8ZpVfnwCY0hBGaYu3BJhU7I4Pk/omDVcKwZ1WvjsK3dnLp6Jy/
         Rhpn4FhzTB865NMRltmKeeOwlgPwk3q+Xe0QazrIkT7TyVn53BjOE4Jd9dgRsE2Q0myk
         eESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742155; x=1794346955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azPPo8H7+DKD17rL0rWwBjVEKBbc6amwqtN9WdKwMgc=;
        b=ur6QlJx10o5MGZvNl7FKxbGy1qOdxREpiCf21SU3PGTqbNaxPPHhJG41IkgCUw5KpS
         A0om2I/L+T+S34N6X41kMjiEaS8Wp3W28r8EelFMbPgthTh/8mAqxMRCiGCFJYOROFaW
         f05pjNin9USLnFG6qke8eGEPvS518X7O0l8O78nB9WFR9iXo0M1y7xDB2cK3hz7t8Xdf
         ZYj8uTPWHPG7it8H42gFO/vRoKbJZwkQQlRz+bqkIYYjDPiN5wKvxkC2JZ+D6kSLaoEM
         SWPwAfPKGvZyN+0L+tUd5KiC2rBUcLldN4y5xblHAitXCQaaFFy5FMEtWZCyXj3OTpLG
         u2sQ==
X-Forwarded-Encrypted: i=1; AKwUvByQwTskTiLyy+YKLIuzkknTmlYRw4UPs/flplwe0B5x780jjucxWX9JHvKyzQ+cJN40L07ALuBZ0JY8Cu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ui4QA/110lqDjcnvOufRXpVIe333otOX/oQqSIOrRtYrbQ+kI
	47Vxem1rdknpMtNIGU9cM0YE+uxm3wmxa1UDJes3udLxPJI+Zxhdp4NXkVlMmg==
X-Gm-Gg: AYBFou1wJMNgVigtpXj2YJo0zRYoVOdfAjaaOFJuNybThQRGW8QCrTfjhw2WjBWHoIp
	+yuD2bNdm2X7sUimu066k2NEoZo+RxdlOuv/NyNJNRTBNTSlXg2FO0SFnidlKIPBat89tBlcYhv
	d4MkpzSZ+vQf9D0rpMoY8EGSk0ursW+ndBODnsUIUywbSXA3qpEjm/FsFn5dlD0ZjgKjQLbmgzt
	ldVXFpMsaDIiTtulsvCgxCp1HdQR3jJ1B52bHm/Y8zMdhlY9OwlLv2BrQXNy4GDdYNibBj6r1XL
	06EVsW1odCR1s5oVwia6/JPW7HgSFOWMjdys1FAnHJ/ZJ7LuWDqt0eUd4xwc3p4Ll9NQy+CwC9R
	8p5L4eG3IQPRQvLFEJYDAMHCoH1Dgc4Lf1aJb77+I3bRJggebuwGzH1xQHYnnlWtiw/E3iuSy6o
	4/a/D8Y4IxGog61vpI7tMq7VqoBctHjw+aARR5TN/AK486ndqtiTBMaKV4ro9MIDN0htAsO/Q9A
	54TM895FnNYpB9NaP3GhSm8Va3oJAWM0Lcx4PXN6jSPEZ6aTMp6KidImMkHLKS1ghc9M/VWjYKx
	A89GgwK/0B/+RI2/Fob0xHZJFj9IDyWDPJXQse3rnxKFlTOhGlKbLSo=
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr20007496c88.26.1793742155167;
        Tue, 03 Nov 2026 13:42:35 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c69c3fsm1460505c88.20.2026.11.03.13.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:42:34 -0800 (PST)
Message-ID: <e211bf3f-d696-4bc5-baff-e27b933a89ae@gmail.com>
Date: Tue, 3 Nov 2026 13:42:33 -0800
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
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060322360.55540@angie.orcam.me.uk>
 <alpine.DEB.2.21.2608060406470.55540@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2608060406470.55540@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 03:54, Maciej W. Rozycki wrote:
> Prevent a crash from happening as the first serial port is initialised:
> 
>    pata-swarm: PATA interface at GenBus slot 4
>    workingset: timestamp_bits=62 max_order=18 bucket_order=0
>    Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
>    CPU 1 Unable to handle kernel paging request at virtual address 0000000000000208, epc == ffffffff8067f8f8, ra == ffffffff80666330
>    Oops[#1]:
>    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-dirty #27 NONE
>    $ 0   : 0000000000000000 0000000014001fe0 0000000000000020 ffffffff80666130
>    $ 4   : 0000000000000000 a800000100e6f118 ffffffff8112cbc0 0000000000000000
>    $ 8   : 0000000000000002 0000000000000000 0000000000000000 0000000001a80000
>    $12   : 0000000000000000 ffffffff809fd488 000000004ddf14dd ffffffff00000000
>    $16   : a800000100e6f000 0000000000000000 ffffffff8112c1d0 a800000100e6f000
>    $20   : 0000000000000000 00000000000004d0 0000000000000004 ffffffff8112c1d0
>    $24   : 0000000000000001 0000000000000003
>    $28   : a80000010007c000 a80000010007fcb0 00000000000000ef ffffffff80666330
>    Hi    : fffffffffffffdb9
>    Lo    : 0000000000000035
>    epc   : ffffffff8067f8f8 __dev_fwnode+0x0/0x8
>    ra    : ffffffff80666330 serial_base_ctrl_add+0xb8/0x180
>    Status: 14001fe3	KX SX UX KERNEL EXL IE
>    Cause : 80800008 (ExcCode 02)
>    BadVA : 0000000000000208
>    PrId  : 03040102 (SiByte SB1)
>    Process swapper/0 (pid: 1, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
>    Stack : 0000000000000000 ffffffff80cd5178 ffffffff80cd0000 ffffffff8112c1c8
>            0000000000000260 ffffffff806655c4 a800000100275bc0 ffffffff8064ac88
>            004000408112c000 0000000000000002 0000000000000000 ffffffff801965d0
>            a800000100786ba0 ffffffff80cd5178 a800000100786ba0 0000000000000004
>            a800000100275bc0 0000000000000000 0000000000000000 ffffffff80cd5178
>            0000000000000000 ffffffff8112c1c8 0000000000000260 00000000000004d0
>            0000000000000004 ffffffff80bf0000 00000000000000ef ffffffff80d171dc
>            ffffffff80d17120 ffffffff80d25658 0000000000000000 ffffffff80d50000
>            ffffffff80d2f928 ffffffff80d50000 ffffffff80d25698 ffffffff80cfcecc
>            00ffffff80b84428 0000000000000000 0000000000000006 0000000000000006
>            ...
>    Call Trace:
>    [<ffffffff8067f8f8>] __dev_fwnode+0x0/0x8
>    [<ffffffff80666330>] serial_base_ctrl_add+0xb8/0x180
>    [<ffffffff806655c4>] serial_core_register_port+0x174/0x8e0
>    [<ffffffff80d171dc>] sbd_init+0xbc/0xf4
>    [<ffffffff80cfcecc>] do_one_initcall+0x64/0x150
>    [<ffffffff80cfd284>] kernel_init_freeable+0x25c/0x30c
>    [<ffffffff809ff6e4>] kernel_init+0x24/0x118
>    [<ffffffff80112d20>] ret_from_kernel_thread+0x14/0x1c
>    
>    Code: 67bd0010  03e00008  2402ffea <03e00008> dc820208  67bdffa0  ffbe0050  ffb70048  ffb60040
>    
>    ---[ end trace 0000000000000000 ]---
> 
> -- where a pointer is dereferenced that has been derived from a null
> pointer to the port's parent device.
> 
> Since no device is available with legacy probing and it's not anymore a
> preferable way to discover devices anyway, switch the driver to using a
> platform device and use it as the port's parent device.
> 
> Use platform_driver_probe() because SB1250 DUART devices are embedded
> onchip the SoC and therefore not that straightforward to remove.
> 
> An unfortunate consequence of the switch to a platform device is we now
> hand the console over from the bootconsole much later in the bootstrap.
> The CFE console handler appears good enough though to work so late and
> in particular with interrupts enabled.
> 
> Conversely, only starting the console device so late lets the port
> initialisation code always use fsleep() for transmitter draining, so
> drop the other variant since it is now dead code.
> 
> Since there is one way only remaining to reach sbd_init_port() now, drop
> the port initialisation marker as no longer needed and go through the
> channel resets unconditionally.
> 
> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # needs to use .remove_new for <= 6.10

On BCM91250E (Sentosa):

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

