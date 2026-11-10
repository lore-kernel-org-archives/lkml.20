Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301501;
	b=TmQ9yaUxy78fErnaatNphKWRj/35OW4D4XiRUSRfNh7NRjzYMFQ/1zA6TwwhaWs+qxvr
	 BMpEBl6e08a8nVCC57IcB39FkgBcJhDAEa4r5uyFMDnTbs9IoRwzMdICPTRtzvuE0uq3i
	 ihsJbPX4q72cAm/eX0LlRnARiWjrg/p4BflEdsjamK6J5W0gqymn0wLRJBxOxhUFXhBs1
	 zV2jWX9P3LhwifwRV+TAn/yTsvXNSUTAD0QQu0+Zzz8vRD0zySFZgmGpiTkNZaehwUfZa
	 84ONO6nVVyKxNBGr8Blo130yKCDfKeJkxmZeB5PYNm2zBVfdxPLKtgSwbwp3SFZ28lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301501;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YGGiuvSWORGiIhdTAIJNLDchxGhP9Tld+CKQwV29zHo=;
	b=UpyMJCnDfbJAZMqg/37LADJrpDueeG5aXCNKX0A59amP93WNwhwflBdBclesw2suvD/s
	 1U05AaRhEHY0H4KGsONpV1Poc3v9XWe6sCsdVW/nwftt9A8JrcsYVsjQ2iAcKKdYHseyl
	 Tgi4qQHTA78H66Jxmu7Fxa10KXEV57Fhh6jo5kpSTjn2BGD9HZBkJSlkv8EKqsWiCKNbs
	 qQIg9Tx/mp+Pc/SD4X0sFmm0yfyveZH2nFpocJ6PadRP0NCDsmcCbadoMfrNCuGVgOIM7
	 eiXU8qnxjEnJUZ51wQzPWWcwkSFPpSBvcb2q61iOxWrqgXkHrp7iBjCUGuw0+US+coQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4I7rMJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA960A382C;
	Tue, 10 Nov 2026 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i4I7rMJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3956A1F0089F;
	Tue, 10 Nov 2026 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301500;
	bh=YGGiuvSWORGiIhdTAIJNLDchxGhP9Tld+CKQwV29zHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i4I7rMJD8ZCsAZVZ1rPhhj8NxtPTZcrh9szvO8/WGUAo6SjJeU8o6ZNayuBKhRYvH
	 beTpajzLX8Uhun+nvJwDNQV3kfy5upQ57VhNwztRiEMdTv6obTrLK65V6VEFfsnIg8
	 4RlKs4q9LKrNOET5lQnPDMKpvUNUbXAAVv5C0TDeqbQ5enpAd8TlYmoaCNXQssCIpr
	 /+1JJsUAthC2BkE3Za3ZLRnb1gIf/1bx1+Xt0kdz1I1GYZRapkar1N9fnivQXsaIYZ
	 Ijg6dO/+menoaRPsBH+z9OlabfahIdwPgIIUMq3UJCVyM9wF7wuZZN+x5WrjtItwgq
	 2l/CDEu6lxsmw==
Date: Tue, 10 Nov 2026 09:04:56 +0000
From: Lee Jones <lee@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] soundwire: Fix Critical and High issues
 reported by Sashiko
Message-ID: <20261110090456.GB6323@joneslee-macbookpro.roam.internal>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261107094140.3951536-1-sammiee5311@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107094140.3951536-1-sammiee5311@gmail.com>

On Sat, 07 Nov 2026, HyeongJun An wrote:

> On a Dell Latitude 9420 (Tiger Lake, SOF IPC3, sof_sdw with rt711-sdca
> on link 0, two rt1316 on links 1 and 2 that are aggregated into one
> Speaker stream, and rt714 on link 3), I tested this series on top of
> soundwire next at commit afd88e7ad781. Only patches 1-4 run on this
> machine. The intel_ace2x and qcom patches are not exercised here.
> 
> With and without the series:
> - all four peripherals attach at boot
> - playback and capture work on every endpoint
> - 40 start/stop cycles of the multi-link Speaker stream (10 of them
>   after the links had runtime suspended), all links streaming at the
>   same time, and Jack Out start/stop while Speaker was playing all
>   passed
> - ALSA pcm-test: 24 pass, 0 fail
> - the dev-properties, dp0 and dpN sysfs attributes of all four
>   peripherals read back identical (the words arrays are empty on these
>   codecs, so only the trailing newline goes through the changed code)
> 
> With the series, s2idle with Speaker playback and Microphone capture
> running: all four peripherals were attached again after resume, both
> streams continued after aplay/arecord re-prepared them, and playback and
> capture on every endpoint still worked. There were no SoundWire or SOF
> kernel messages. I did not run the same s2idle test without the series.
> 
> These runs only take the normal paths, so the failure cases that
> patches 3 and 4 guard against were not hit.
> 
> I ran these with Claude Code (Claude Opus 5.5) on the laptop.
> 
> I am sending Tested-by on patches 1-4 only, in replies to those
> patches.

I really appreciate you taking the time to test these.  Thank you.

-- 
Lee Jones
