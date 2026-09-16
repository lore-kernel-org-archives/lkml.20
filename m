Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8284CEE7E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577496; cv=none; b=HljC25uL3OCQASDDg9elrHSZbRH9MF5TRNzdA/Xn42GbLRVf7DNHlbtSmXny9irI4bzIUXV4I37I0ERlBV0a1UNG+4rYF+SDVkbc1w3jdFVYtPpLMoB4zpSExRPiQVlIi+s4VE1AWK7+P8if2Ezo42u80g3cLSyXG9c7TlJIZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577496; c=relaxed/simple;
	bh=HPSRZ48AkvH9m1oxdbpI+LdacqMP3XE7EC4swgFjtSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEBwfQmE89hykc8PrI2XesRFINKMjbI5rkQmHEIgQkSLEtVsPVPm1ID/l5noxYFtaVMG6bVMF8DTysXzRWkW0I1/D57TyC90J+yBBOvVvCDN1lx24T8ZqJbZENWrPFAhQf9eg1DYKB46iG2TsvBCpK6IH5gZYceJ5psWRwscmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=aLGZyHlw; arc=none smtp.client-ip=62.149.155.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="aLGZyHlw"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 6sntxjd1TaHPp6snuxGqRI; Wed, 16 Sep 2026 18:48:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1789577294; bh=HPSRZ48AkvH9m1oxdbpI+LdacqMP3XE7EC4swgFjtSk=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=aLGZyHlwqUU2hJ2ZOTv/FufjmkT2f2BibPupnLZHUbxBW/75RCissje3iVWQt7wUp
	 JJf69/lXuchbx/OwjhV0LetRaJQ2osGYjP99wHx7mi5xrgUjGFWxBvRIXtxM1u1Lcf
	 O99wYy3j3vRNTf4TazLtyYBMHy66R7ZLKZZ6BAM0ECO+F0jWMpsleqq8PCbaQq0OAL
	 85YvFvBi5wvuIuCTmOz8SyZlh6Ri1lC1oUjySRC0+PDqxgTdk2DzpWwwK4T0jSH1rh
	 ajs2aebuTlDwizB8FIKGk3Eipr8k36f04e4uNJXR5fxJkxZzaa8YZIcNKQ62s4EDCs
	 dsC1ENzgj+e2g==
Message-ID: <f44a5cc5-d6f3-4871-b86a-1693cbfc1bec@enneenne.com>
Date: Wed, 16 Sep 2026 18:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pps-gpio: restore pin mux on unbind and shutdown
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916134744.46354-1-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260916134744.46354-1-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPqUUEGJXfnMs5VG4UpywwNVUD2VX3MQ8CjD5oEdTuzm1jKN+To7IcLQwZKe0fyTS0ar1tlsfuBc9o1VlycWq2nc3MGI5Vt1yOyCfeZXL/KWBVXj4Yst
 HAHVGQZwTnr7Ndk2SE5D3z5FrJZoiJatfgim5ZqwCc8IpGulW8tkhiWwYp9vjySaoUZOapJrQ6qMvKzSwkKpfoN5xHKN+o7/k2dBHiPwkaKgJBpg2UoFghS0
 YmBQMhrcDjYSHYa5lO4Ue+YYzEukQ+oi5ntvuJmcwSuvPSxHVaf7v37tF2WJfMRw4NK06EY6eU0/UpUh3BFOZHiT7QEVVxcHAgI/gXZ9EyUMK6piL5+iQgnx
 lgQBgDGvPbl9qdSTTQth5jXzkoytfyVTG4G0sCnMBoDqWGcvuRJYBDglofaAgKYn+CXZFFQJWrM/c1UdnPr16zSlhfMFAeduFqX718rZb2F277rLlIM=

On 16/09/2026 15:47, Eliav Farber wrote:
> This series lets pps-gpio select an optional "idle" pinctrl state in
> remove() and shutdown(), so a board can describe the alternate mux there
> and have it restored. It is a no-op for boards that do not describe an
> "idle" state, and depends on CONFIG_PM (which performs the idle-state
> lookup).

Thanks, the problem is real: the pinctrl core never reverts the mux on
unbind, so the pins stay stuck in the GPIO function for whatever comes
next, kexec included.

But "idle" does not mean "not bound", so are you sure this is the
right-thing(TM) to do? pinctrl-state.h documents it as the runtime PM
state and, AFAIK, that is how the rest of the tree uses it. If pps-gpio
ever grows a real runtime PM or a .suspend(), "idle" is already taken
with another meaning -- and 1/2 turns that choice into ABI.

Same question for the CONFIG_PM dependency: why should a CONFIG_PM=n
kernel not get this? A PPS box built without PM is not an odd
configuration, and there the board describes an "idle" state and
nothing happens, silently.

Wouldn't looking the state up in the driver (devm_pinctrl_get() +
pinctrl_lookup_state() + pinctrl_select_state()) avoid both, and leave
you free to pick a name that says what it means?

One thing that does not depend on any of the above: your shutdown()
changes the mux but shuts nothing down. The IRQ is still requested
(request_irq() here is not devm-managed) and the echo timer may still
be armed, so a timer callback can still poke a pin that by then belongs
to somebody else, and the PPS handler stays attached to a line that
other function is now driving. And device_shutdown() is not the end of
the road: the kernel keeps running to load and start the kexec image,
which is the case you are after. Shouldn't it tear down in the same
order remove() does, free_irq() and timer_delete_sync() first and the
mux change last?

Ciao,

Rodolfo
