Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553AB2D12EE;
	Sun, 20 Sep 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910776; cv=none; b=eJPOpycmRAQt3scvoWVAyFxK3JFZgjIbhLcDWI+A7NevwwEoImxnospsnPo6vROGTdrrmOdmEQPaNYPm12jnXiKbaF4/RmjDxzc0gR9vML+gj2o33pYR+HKyXMpftcYAfOFQ8n0jecxN8MiEJ17GHWOykjuGDmamkHx05h1axB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910776; c=relaxed/simple;
	bh=/ZEc6dTc47pxn07NHPuUR6laqLgMTCP3lmnxbL8jDjs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oyN+YYJG3/F5uyi3LQAj8E+MEU8sLTWYTmXgsM4Cw9gtdZ1VvT2ukSmP4RYSvpFNzlOBUefaP+47YqEm+iRF2cqYYSzOEhyBTrOFfmKLBlACvtQSXdsk4OSomviA24gwwq54LwNPSX8NioIcc6uLRMrHn6PjTiCEyleZf9pgVL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UX76iND6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UX76iND6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7AF1F000FF;
	Sun, 20 Sep 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789910773;
	bh=KRrkQIdjrWIlIYhi9X9np1NOOxNT7Z30QZ4mP4MCkvI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=UX76iND6TxiIbbh+QmR+fJ6WG0yMc1o7yybcCVUa2BySZA0EFrWR92NL2TibVjV9k
	 sjvBk0/jD0QB1BOnhGzwN4qn5Gc9KvLaos7JH6Y6RlJJ25mptX3znLUCVytaUzCaOg
	 LgT1TH+3iwOyp+xQkfq8iucnU/yx18EATcgmueRYQmEjikoXlUZTNBlAg8U2FB46UX
	 286ONK3JH7GlBZ6iWbT9IH5zsX5s7osErVfnULyw+CR7MqO68i2YehiqssiUsgI8RI
	 bx1grVLyMmaIY9AZOMA2TqVH5njQLqxp3Ohw4CnQcpJnUaf4d19aoWGqgoWMLdZ1c/
	 eD+MeVT87mP0Q==
Message-ID: <b33efa2e-75e3-4163-ba1f-712227b438f8@kernel.org>
Date: Sun, 20 Sep 2026 15:26:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Omer PALA <palaomer100@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Bryan O'Donoghue <pure.logic@nexus-software.ie>, David Lin
 <dtwlin@gmail.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20260920094058.9664-1-palaomer100@gmail.com>
 <2026092039-greedily-jailer-80e5@gregkh>
 <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com>
 <ea6cf31e-0acd-4248-9359-5864bf8f6f94@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ea6cf31e-0acd-4248-9359-5864bf8f6f94@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2026 15:22, Krzysztof Kozlowski wrote:
> On 20/09/2026 12:37, Omer PALA wrote:
>> Hi Greg,
>>
>> I thought someone (not you) can allow this.
> 
> So you received feedback from Greg, but tried on different part, hoping
> this time it will get accepted?
> 
> This looks similar to you previous approaches, e.g. for DT bindings,
> where you received comments and repeated the same thing immediately.
> Three or four time.
> 
>>
>> I want to contribute kernel but i dont know what should i do.
> 
> I suggest spend some time to actually read the archives when people
> point it.
> 
> 
>>
>> I wrote 3 devicetree schemas, 2 performance fixes, 2 mutex/spinlock
>> fixes and 1 syntax fix.
>>
>> All of my work got NAK.
> 
> One was pure AI slop, so what did you expect exactly? In all channels,
> fediverse, some technological news, open source projects complain about
> sent slop, they reject it and treat it as one of biggest time wasting
> thing contributor could do. It is not like we hide it, right? Actually
> opposite, everywhere we scream - don't send vibe coded stuff. And for
> learning or beginning this is even unacceptable waste of your time,
> because you will learn nothing. I was raising it for GSoC for example
> more than once and it is documented in their rules.
> 
>>
>> Can you explain me what should i do?
> 
> One idea would be to read more before you actually contribute.

... and if you even asked your AI like I did now:
"how linux kernel developers look at LLM contributions from beginners?"
I got:

"Linux kernel developers view unverified AI-generated code from
beginners with heavy skepticism and frustration due to a massive influx
of low-quality submissions that overwhelm maintainers."


"Rejection of AI "slop": "

"Staging area bans: Certain high-traffic areas prone to beginner
contributions, such as the kernel's staging drivers (drivers/staging/),
have implemented strict policies forbidding LLM-generated patches ...."

Yet you did exactly what should not be done - were using LLM.

Best regards,
Krzysztof
