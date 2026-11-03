Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712171;
	b=TBmDSaXYa0uOB0fZAOfGmhG4cK2Nd5p+yTTqvxfu7vZzC/yks/rD0E5QqC1kA8FsHkhy
	 Rko3e9sNwdbfDBS6uFu2vG1AgRFuVuUdWbld1zT5irqBgiRWlfLZtYjbY6I9fO7w3AdlW
	 2/GAhEg7p+u0DMAU4/br1HWnK4eZnm3w2hZJg1kQJm9SSoOcu39qstoWYt6ozEqRMPp7L
	 ylLqXJ7Nv5NymRyOQfSwO7uqz7XOUqMrm0DDCMlp7raq+O8akZHc+AJoLnjquEXt4sOrO
	 kSW+XpqItdPCocU5hmCLyEtUSBXdbak/f0Mag/4NC235W0vSBBjASuInH9uRJInXNTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712171;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=VewCD5rQVPnDQ07iJbynJVb6h4a7OVM9KP3rsrwt/NU=;
	b=uKJA594OHi/jtF1KLVqhrkm3p+gWvlDn35s3HT32dS16eHlXSgJynV8SxfcwKumauqD/
	 arl+Bc+FmC1ld+8XM11NBtSlBi51ZrMjCaExl8AVbCnfQSIuT1WXysAuMQlMVre7bTagI
	 atgKYOJnTMcFWThbjI72ou3+hFiDezEfWiynAPI+WtTslWqVKUrc3/F/FXmx79NQJboWR
	 ff66S5tY1lkkqVo6puLkF1enXu7vuDkOjYp45/kUr4zY+5wUP8e4v2ABSxQLnS6ISilPk
	 16WrbeVBhS9wFp8ox0zq7wWTuCEjxbvD5m7bBQkThJdoYRK1dM5ugdFHPKrCVc78fbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=R0DmgznX;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DA606A326;
	Tue,  3 Nov 2026 13:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=R0DmgznX
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57D7810B73C;
	Tue, 03 Nov 2026 14:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793712158;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VewCD5rQVPnDQ07iJbynJVb6h4a7OVM9KP3rsrwt/NU=;
	b=R0DmgznX7Ax57K5GNw+5JTQ8I9uTNuFvVqgwVLIxe7t3+3pjZSxtrH5XcRsnK7biSPtEis
	M64+psSzsYBaGc/Dk7RmKByOAh41JkLuSobcxYTVcJoFn59S1ofEzNIY84qON2y7JNpvAx
	1Ek2nwp8vV65aikoJHxjcYJuMz6TR7w4icsvBRgXhODntO7PVhc4WsXf4qKtDCIZo8u219
	njC4o7NrwpbHi22ezAPHcGntHWbe8bUPby/ybs3TF7rDx6xgYQNNi4ejkpPtNanJuuA2KU
	IcEOwNucuR8rf2VaRbhrAYkZt54bBLVsRIHacWcgBLvslFJailgWSGp68I9wNQ==
Message-ID: <eee735b6-9447-4790-b51e-cac01ebcd7c8@nabladev.com>
Date: Tue, 3 Nov 2026 14:22:36 +0100
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
To: Arnd Bergmann <arnd@arndb.de>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
 <20261013132625.GA159927@killaraus.ideasonboard.com>
 <acdfefce-a7cd-4918-bcca-52357bcf182d@amd.com>
 <20261013175438.GL4214@killaraus.ideasonboard.com>
 <99b0511a-96d2-420b-bfbe-6e22fdaffbf9@app.fastmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <99b0511a-96d2-420b-bfbe-6e22fdaffbf9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/22/26 3:19 PM, Arnd Bergmann wrote:
> On Tue, Oct 13, 2026, at 19:54, Laurent Pinchart wrote:
>> On Tue, Oct 13, 2026 at 03:47:12PM +0200, Michal Simek wrote:
>>> On 10/13/26 15:26, Laurent Pinchart wrote:
>>>> On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
>>>>> On 9/16/26 22:44, Marek Vasut wrote:
>>>>>> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
>>>>>> The board is populated with four ethernet ports, QSPI NOR,
>>>>>> eMMC, UART and USB host interfaces.
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>>>>> ---
>>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>>> Cc: Michal Simek <michal.simek@amd.com>
>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>> Cc: devicetree@vger.kernel.org
>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>> ---
>>>>>> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
>>>>>>          undocumented, but the TI DP83822I is generic C45 PHY that
>>>>>>          is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>>>>> ---
>>>>>> V2: - Rename lm75 node to sensor@
>>>>>>        - Use GPIO_ACTIVE_LOW macro
>>>>>> V3: - Drop bogus clk_ignore_unused bootargs
>>>>>>        - Drop gpio line names
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>>>>>>     .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
>>>>>>     2 files changed, 301 insertions(+)
>>>>>>     create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
>>>>>
>>>>> I am not able to review or take this board support further without publicly
>>>>> available hardware documentation for the platform (board-level and relevant
>>>>> interface details). Please share public documentation links once available, and
>>>>> I’ll be happy to revisit the patches.
>>>>
>>>> There are plenty of boards that have no public documentation. Pretty
>>>> much all phones and laptops are like that. We even have a whole
>>>> architecture that only runs on a few machines in a single person's
>>>> basement [*] :-) The kernel has never required public schematics for
>>>> boards, SoCs or IP cores.
>>>>
>>>> [*] A slight exageration possibly, but that's how I heard arch/alpha/
>>>>       being described at the maintainers summit.
>>>
>>> Pretty much every SOC with programmable logic or FPGA boards have unlimited
>>> amount of configurations and make no sense to describe all of them.
>>
>> As far as I understand, the dts describes the board only, there's no PL
>> devices in there. The fact that the SoC has programmable logic doesn't
>> seem relevant, unless I'm missing something. The situation is the same
>> as with any other SoC. We have lots of device tree sources in upstream
>> for all kind of boards, with or without schematics available, for
>> development boards or for boards integrated in products, for easily
>> available mass-market products or for specialized devices more costly to
>> source.
>>
>> Maybe I'm wrong about all this, so I've CC'ed all ARM64 SoC maintainers
>> on this e-mail to get feedback on the overall mainline policy for
>> upstreaming device tree sources.
> 
> In general, we definitely want this type of board to have an upstream dts
> files, and there is no requirement for public documentation as in
> many cases the dts source is the only documentation that is
> available.
> 
> As platform maintainer, Michal should review the dts file to see if it
> follows the general coding style and maintainability standards. If any
> of the data in the dts turns out to be wrong in a way that one cannot
> tell without access to hardware or documentation, that is Marek's problem
> and he gets to fix it.
Thank you for the clarification.

Michal, is there anything left over to do with these patches ?
