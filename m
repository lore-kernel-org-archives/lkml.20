Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997080;
	b=qcZE/GXfiEZU+xia6fo2H9XkgQEPT+KAIA2tlnoBf2BHEEwoFjogsaNWixo2b/NgK7US
	 kWrkWykxOIULYLE32a/CtZgKiKTWvnhmmG1+zNvm3mZAPDIvRaP+OtlpzSWXLsf0jiMSP
	 gnte6lSLyLl1QP/28zQV6P47bASYX7yUdrUbQ3S9FRbTK5tXlL946mrSQJvZtIlrNn2lZ
	 2e3jVlHzZmS0nm+eAtk/X9wzwuSalS+XPGXk5kGuDNl+kl2p3UA+Jg8GtvsZ0k/hAUJXY
	 AuI5q6P+QpwHYYZTZyEcVG6+OLSRDW83QXyd5pGGRmZQ+98PHiG4Ni5s+UexUolz19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997080;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=47GIJtHDikSRTr3Iz0oAp99S7+cqqZ+QBH3BmiF/M7s=;
	b=bl0MTnSPM6jyxWg3x85WKyJgcuZlWts0QhwNDTt8ubAk105anflvOT63NhZXQu1zWq67
	 2KcKcnYxMR9Z0bLv5ta/TOx18xM6jTWibEKQu2q1YzeUG7FDesXgTjYd3/R0apahrhdTA
	 vAk70SrfGjlmmCMTUTPJvYMyuoeBourIhS9BLmKyfmbEQo6rGCx5SwWGOuQgoh1Q4NsU2
	 I2SiQ52Ytpdq3RyeuWOQ810yUa5O7EEKqLjw4YgzXG9JXb/GDHTSlAPbMpWycCz1KYgpC
	 UztA8VIMHshu7PhDG9kqCyDeoJGwymdZxplM4jV4p8zjy7yMprnyD5LFUxCLdQlZcaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=fEICjyzH;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BFC606A326;
	Fri,  6 Nov 2026 20:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BFC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=fEICjyzH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793997054;
	bh=47GIJtHDikSRTr3Iz0oAp99S7+cqqZ+QBH3BmiF/M7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fEICjyzHIUjZle/Wj4mBt/1Dnor0jMi3VucYkcqE9N6vfrY4I8e26Cmns3jMqK2Ad
	 mM4qBr41GoVx6WtGR2k9su/QzfHkK8n5R9QfHklkbn+9WhTRJ0w25f7HOkSYM6ZI61
	 vZLc2eltSvTOV9sY3Iey1juaDaaq7ZWF27eAupuQzSZrl+d7t2ze76rw1DDQMVeMnI
	 RNYi997oS6maEfaAeVqH6UmztDnflre9AXdNuh3hAFqQc+za4Tkjo+PZ8d9mcraXh0
	 fLJQ4FgqbXm2blN65qNBCBv5BJ83ccHJLeWVb0REGUbsXF4E6c5yhhN7BEeX+Yg1zy
	 s4MJ9aHn8WiMw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id CB1E1B22094E;
	Fri,  6 Nov 2026 21:30:51 +0100 (CET)
Message-ID: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
Date: Fri, 6 Nov 2026 12:30:44 -0800
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
To: Owen O'Hehir <oo.hehir@gmail.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
 <20261106195945.4157095-1-oo.hehir@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261106195945.4157095-1-oo.hehir@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Owen,

On 11/6/26 11:59, Owen O'Hehir wrote:
> Hi E,
> 
> Thanks for checking. You're right about the commit message: I saw the
> LED lit before Linux probes and assumed the firmware set it, without
> checking where it comes from.
> 
> On the Lite, the schematic (sheet 21) shows RGPIO3 driving the system
> LED and also used for fastboot detection, through jumper J20 that pulls
> it to 1.8 V via R257 (1k). Detection happens at reset, before Linux,

No, the software is not any concern for a hardware description.

> and R257 limits the current whichever level the pin is driven to
> afterwards, so I don't think driving it high conflicts there.
> 
> Owen

It may or may not conflict in software operation but that has nothing to
do with if it should be applied to device tree that describes hardware.
Conor since applied, which is trusting you researched this correctly
before sending to the list. I'm saying that all things being good in
intention this is obviously not well researched, and not allowing for
discussion to verify the fix before applying.

Anyways it is a user light not a power LED. Pine64 Star64 has a power
LED and this user LED. If a board does not have power LED then co-opting
the user LED is something that should be done in inittab not treating
upstream device tree as a preferences config file for userland.

-E
