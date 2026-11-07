Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060376;
	b=Uty6q8QpFYBtifcxjPmVW99kwizCum4rMVojQI3EJlABOPshtv6l1x8xd8kqNosA7ri1
	 2oj6RgQkHiKtW18T9o4aPDGYba6uTQzOV5SwDYrKLnvhAWIRjKqMk8usSbrMMsEnIfDin
	 L+mP4ILRjKP8dyRnHcO2tztrAw4QW+l7IABdmCMbCk+QgSNVmvRwC5eCW9oCQ7gbsd1kD
	 yG3I+By6OKdVRp680M9PXRaOga8Z6bbx3xTS37bnOTn4dH0bWq0vLv/jsrHbBgbl9JioW
	 x8RyrcKkzcDBDvKEAM+il6y0XAUernW1ZwZlQyjuv45v3MU7fprParWWsFudMMCxEqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060376;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=37JzzP5fNzIUh/YU3t2M86Gp4vaqjCgfVRMIoUNIwJI=;
	b=BmGc/EDU4vmKLmXQCMy9nK8AJ+GMwATQKFkQJoA9r/6xYamahRO1UsFKjIaMMxsRxNGL
	 pwuCLs0R9xw+oDiukgqMT1mSJjKQUiljxXzYk/khQcPHsCr1p+VEXOHmD0Zuxl2K71YuJ
	 6Jrl2RLWyNIWqkXOSHAUTlyaGzEDG22BoaUqUC7Qn+Bj1cckiVnlnTx35Rm84NI0Ng/ID
	 mcOabb83euy5CIJOkwlfEF4fctDXeRIczFcACdD5tc3WVserh58q/qBxEW8h3GigBdEoz
	 4yOX0QMEVvOeophyVSzRo7iF5G4b1J98vJ9Ye3YUZ4jiMVbMEi1VNJGVLI97b7fmCyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=eoFXYN0Y;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781FD606A326;
	Sat,  7 Nov 2026 14:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=eoFXYN0Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794060344;
	bh=37JzzP5fNzIUh/YU3t2M86Gp4vaqjCgfVRMIoUNIwJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eoFXYN0Y++/qdFYJkfB53JqRJcdyYNIw4017Vx3FuuYGYC7geVZtZq/wPNdLRLPde
	 RBcZVgGBgHoX/bDTEpCciovjbWadXCMQo1SusxvKDO4BM2FuRABIxBpxX6cs6UnZSb
	 GDVLS7XbxBqssjB61mKay3bFcixK7YB8HM2XFMI6mWVw/rhqxEIMsxe0H2Gsb6KYsn
	 zBhA6L8O8uvZ+wQ6Ijss/DqhqXObGwRjL5NMxYSR3w8LSKXY1vknfui0QdGVfS5d+0
	 V0ukUev+0HTyy/I+9u7G7xQku0cmnkoeqTRHzeJphzrQS2dCVatKNWT3GO9rBDBWJV
	 kiLHNge1jD5nw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 922C3B2218C0;
	Sat,  7 Nov 2026 15:05:41 +0100 (CET)
Message-ID: <7f285558-2301-46aa-a4bc-c6ddb25cf20c@freeshell.de>
Date: Sat, 7 Nov 2026 06:05:40 -0800
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
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Owen O'Hehir
 <oo.hehir@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
 <20261106-tumble-hurt-d1a0be3fddae@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261106-tumble-hurt-d1a0be3fddae@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Conor,

On 11/6/26 13:15, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 11:06:22AM -0800, E Shattow wrote:
>> Hi Conor,
>>
>> On 11/6/26 10:54, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
>>>> The firmware turns the status power LED on, but the node has no
>>>> default-state, so the LED switches off when leds-gpio probes and the
>>>> board looks powered down.
>>>>
>>>> Default the LED to on.
>>>>
>>>> Tested on a VisionFive 2 v1.3B.
>>>>
>>>> [...]
>>>
>>> Applied to riscv-dt-fixes, thanks!
>>>
>>> [1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
>>>       https://git.kernel.org/conor/c/68dbe2550bd4
>>>
>>> Thanks,
>>> Conor.
>>
>> I replied this a moment earlier:
>> https://lore.kernel.org/lkml/179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de/
>>
>> This disagrees with VisionFive 2 Lite schematic; if when this node is
>> consumed by a bootloader it will be evident we are not describing the
>> hardware correctly, no?
> 
> I am not sure if that's actually relevant though? If the visionfive2lite
> needs this gpio then it shouldn't be listed in a leds node. Changing the
> default status of it doesn't affect the fact that it is wrong to begin
> with, wrong before the patch and wrong afterwards. If there are some
> boards that include this common.dtsi but don't have these leds, they're
> not common and should be moved to the relevant dts files. If you know
> what those are, please send a patch doing the move.

All JH-7110 boards with published schematics have this configurable LED.
Some board(s) have this same RGPIO also connected to an input jumper for
fastboot selection. Some board(s) have an additional power LED that is
not configurable and so not represented in device tree.

> 
>> If you want the light on and it wasn't on at reset or due to boot ROM,
>> then that is userland stuff and not hardware description... but that is
>> your decision to make as maintainer.
> 
> It's a power status led, I think it's pretty reasonable for it to
> actually represent power status without intervention in userspace, the
> alternative I guess could be something like setting the function
> property to "power" - but I'm not sure if that does anything for
> gpio-leds.

Sure, if this is updated as a per-board user-LED function property by
reference to published hardware description (silkscreen or published
schematics) then that's at least verifiable; Vendor firmware that
showcases as heartbeat or whatever less convincingly-so.

Debian users should be reminded that these LED functions are compiled as
modules for Debian kernel config and so the setting of property to
"power" or "heartbeat" e.g. is further dependent on whether the initrd
was generated with including those modules. The LED function mode (or
lack thereof) from passed fdt structure can be set with an override on
the corresponding kernel command line argument.

> 
> Cheers,
> Conor.

-E
