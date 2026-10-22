Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673848;
	b=iLAyF/Eir0UCn+LO3A7T3UCaOB9dVoF+EMAuRXE7b3FS6vSUVkoii1AGp9pBsGj63/su
	 xdfJzkuMtKWgl0dQ1kdCeAxLey/+vX1wsP5lGcWMHM3mbAVgu2Vl2FWWn/pbuFjPEfGnP
	 5TmD0yPJ5K/5PIrpPo8HTzPBBFWbX6oxeskaFs+3YQLY7hQL2MoETIGk9JWtDvxDx5Ij2
	 3kR3t/SGfvAKSx0zGvKAc3v+j9+n3Nef6schqCgJ8u4nwWumlCKDCAtYLQaTwKj6kHZ5m
	 i8390eDit0UOOaubgvqjwf1CuVB0RbSO69/3Ax8etDKM08gy9XFma61hIhwRbZ8IuBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673848;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=FRwt2WcZeWxHKJ9m7NiyRoa0EfXEk/BEIxFglE8bS0M=;
	b=pfwRnxmCsuw2yKK/a2czCfsaMBM9DT/2jy86IsyJbL47yQ1j2/+kqLFfHmSxajWkd9VA
	 BeuQ3SQSJePnaEL5s8vDN086IGjAcN+sl/9NKIRpCmAqUKZEoBg/QYfniyjQJlDH/8JeT
	 tz5tJJQwbOHKOszYsQz+7ZrohRveUjtkIVqRtcw+OSDIqOa8Z0KUWx9oQJnWU5LImBcPN
	 ld+S16bl1vgXU7yvxKXhxHH52h1z1nWllQEfimM9Aqr2KOMZv5Y1wUdasQOp+VxiWLtVA
	 Pao7E90TD9JWKJU9AFfiWLz04jzqwEqQAEzeLgE00zF3VOPnSSa2Yxw018UJ0bUjlDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Snk5EOio;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823BC606A319;
	Thu, 22 Oct 2026 12:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 823BC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Snk5EOio
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9123110A9DC;
	Thu, 22 Oct 2026 14:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792673841;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FRwt2WcZeWxHKJ9m7NiyRoa0EfXEk/BEIxFglE8bS0M=;
	b=Snk5EOioAY/Qi7BuC7hNBky54JtiDqOgfCYOXbVGP4DZQJLIddBItXZl74BVWr7N9Bmx22
	8cWY2LwOzEcQmGs8RzGf1kObRUJVFlNzRGi/5jtaC5oI681+N6ALxeHOlSfBinAK1AKc1h
	yGPb6RxUkhCF3bcHuGJPnKPZHgsWGQeUIPf1gVyF31HBC660eyHsyzPhq+MwNMpgtZfx2/
	XdvVXbOXkjL26AJNjKqgzPFvf45+4EDHjgbJA/gn0q01xVSjqiFLGYYQVZeEWeVupel8cg
	SaXIjFqat3m5/2usJ7tUSscrqUf06paW9YJoo9Ov2Zfzvu9RfFWYtd7XckQufQ==
Message-ID: <3e8b2a76-3372-4bec-abd5-df2b5b03d40b@nabladev.com>
Date: Thu, 22 Oct 2026 14:57:20 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
 <20261013132625.GA159927@killaraus.ideasonboard.com>
 <acdfefce-a7cd-4918-bcca-52357bcf182d@amd.com>
 <20261013175438.GL4214@killaraus.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261013175438.GL4214@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/13/26 7:54 PM, Laurent Pinchart wrote:
> CC'ing missing ARM64 SoC maintainers.

Has there been any input from the maintainers ?

Thank you for your help !

> On Tue, Oct 13, 2026 at 03:47:12PM +0200, Michal Simek wrote:
>> On 10/13/26 15:26, Laurent Pinchart wrote:
>>> On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
>>>> On 9/16/26 22:44, Marek Vasut wrote:
>>>>> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
>>>>> The board is populated with four ethernet ports, QSPI NOR,
>>>>> eMMC, UART and USB host interfaces.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>>>> ---
>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>> Cc: Michal Simek <michal.simek@amd.com>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-kernel@vger.kernel.org
>>>>> ---
>>>>> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
>>>>>          undocumented, but the TI DP83822I is generic C45 PHY that
>>>>>          is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>>>> ---
>>>>> V2: - Rename lm75 node to sensor@
>>>>>        - Use GPIO_ACTIVE_LOW macro
>>>>> V3: - Drop bogus clk_ignore_unused bootargs
>>>>>        - Drop gpio line names
>>>>> ---
>>>>>     arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>>>>>     .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
>>>>>     2 files changed, 301 insertions(+)
>>>>>     create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
>>>>
>>>> I am not able to review or take this board support further without publicly
>>>> available hardware documentation for the platform (board-level and relevant
>>>> interface details). Please share public documentation links once available, and
>>>> I’ll be happy to revisit the patches.
>>>
>>> There are plenty of boards that have no public documentation. Pretty
>>> much all phones and laptops are like that. We even have a whole
>>> architecture that only runs on a few machines in a single person's
>>> basement [*] :-) The kernel has never required public schematics for
>>> boards, SoCs or IP cores.
>>>
>>> [*] A slight exageration possibly, but that's how I heard arch/alpha/
>>>       being described at the maintainers summit.
>>
>> Pretty much every SOC with programmable logic or FPGA boards have unlimited
>> amount of configurations and make no sense to describe all of them.
> 
> As far as I understand, the dts describes the board only, there's no PL
> devices in there. The fact that the SoC has programmable logic doesn't
> seem relevant, unless I'm missing something. The situation is the same
> as with any other SoC. We have lots of device tree sources in upstream
> for all kind of boards, with or without schematics available, for
> development boards or for boards integrated in products, for easily
> available mass-market products or for specialized devices more costly to
> source.
> 
> Maybe I'm wrong about all this, so I've CC'ed all ARM64 SoC maintainers
> on this e-mail to get feedback on the overall mainline policy for
> upstreaming device tree sources.
> 
>> It means what make sense to describe are boards which people can look, check and
>> compare that configuration against their custom design.
>> But if there is no public documentation what you want to use to compare against?
>>
>> Can anybody even buy this board? (I expect you can buy that phones and laptops).
> 


-- 
Best regards,
Marek Vasut
