Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992020;
	b=3DC6fiwU2Z+Ecu+XDqtgJTclmT9afOYSiAOacKhmdPQkYLmKMhyUfHwGtjdsgswJZwqE
	 egDEFm6eAdbSPBCGL5mdpeh0ODlIC8FhWk/vESN208eTTMZp/bmbo1N4MWbpe3x+gZYrB
	 fs6uPd9XcVZgnScAPDWQdnUfyUT3c72nAK5VnOl9vklnYl/a8mFeSSss18y51JCguD1Qo
	 csv14wZ8iG8CdyYOAJ1GsvJuZ2YiMGZ7KB4PZbApeT9oqz4aVVAPAybUQpQ45JJjqIqfl
	 Z3ufD4DIbo71lnS2FAYd7WpUJBaMjkGVEVYBhsZjx1meOFVkTmFEpHDGMoef0ohaDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992020;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iZ2LBKf2o/a6NuQvYXs34F5ZooH4kEfB31uOLqQEQ6g=;
	b=OzZRrSS3i4tbLYeOLUjpTI73b+srVjzg16wxbAbPIxPWZIOOQnJN1JDfQCzUuM6YlG17
	 hZBB2gdW2xz9oF6E06M3kP/Qk0hau7K9xp+4Jd9r0AQsZ0i8YzA2NsfW2owghqO4tftnY
	 UAHaJCw/weWC2bpnoO8nZ2MuTIwvoR5HiIL/fBoYC0zy2nFeys1Af2v0gDxWPhBwoIcj4
	 CF7zH5w0yaAYfWefLlxaAU2EmNC8OY4fPE4U3DG1k7oznl4zGymka/01VzMLvnst9nEcd
	 nsen3VZ3MQElGN8vK2GeiH9rjr69aJMOisP3xLpQh0FXyJVL7Zs+i48RoHFIUxvRAaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=NqIjTpZ5;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289C5606A326;
	Fri,  6 Nov 2026 19:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=NqIjTpZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793991986;
	bh=iZ2LBKf2o/a6NuQvYXs34F5ZooH4kEfB31uOLqQEQ6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NqIjTpZ5NoDlROcd2MKaHLgNafgOSjtxF39ejQn0wKqesVlCTyNO6uynAxybIGIN9
	 XJXomOfpV6Twr6nug0BatN9zUvqARt4A+vZvQutcIZf5YiYZwdTyCig8Meyr0qI+5z
	 NlDXSdlPpwyM8PVSW8m8eRSzYv4HX4pJPcGr6Hz3lQuSY6iMu831NNxTgjhwFxJUgu
	 76P4DcgQPqnnsuosGqBxHdd3w6GnXcHBW/MYzylzLVGM/778mpefQuzoN0v4P13toM
	 j7gmSZZfnloXdh1ofiQmTkbfxPrVsszk+Nw3y6PsCiSTTBOtaRjU9OjJmEgXT5DJFP
	 mCVI5FgQgf1sA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 53C0EB22073F;
	Fri,  6 Nov 2026 20:06:24 +0100 (CET)
Message-ID: <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
Date: Fri, 6 Nov 2026 11:06:22 -0800
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
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Owen O'Hehir <oo.hehir@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Conor,

On 11/6/26 10:54, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
>> The firmware turns the status power LED on, but the node has no
>> default-state, so the LED switches off when leds-gpio probes and the
>> board looks powered down.
>>
>> Default the LED to on.
>>
>> Tested on a VisionFive 2 v1.3B.
>>
>> [...]
> 
> Applied to riscv-dt-fixes, thanks!
> 
> [1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
>       https://git.kernel.org/conor/c/68dbe2550bd4
> 
> Thanks,
> Conor.

I replied this a moment earlier:
https://lore.kernel.org/lkml/179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de/

This disagrees with VisionFive 2 Lite schematic; if when this node is
consumed by a bootloader it will be evident we are not describing the
hardware correctly, no?

If you want the light on and it wasn't on at reset or due to boot ROM,
then that is userland stuff and not hardware description... but that is
your decision to make as maintainer.

-E
