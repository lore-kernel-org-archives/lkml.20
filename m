Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179374;
	b=gfuQiHKBA9wCF8gBvxbKab2rgYe8ZZ1yTsoZnAA74fTMRzAytWb1hDbmDM0vpEj7O0xE
	 r7Kk1xFkyqERPyZLxom4nlsYCb58X6GQ3vZXa2MQtpMyn3unP1vOaZw3T4jRvH0lfELDU
	 5TWytP0aB4ob7yYTd2gMaRVhptGKbnatYHWjP4xO+BvhvH2gbQ4b0m/jjmsa4QCwcq2Xe
	 okkIzaryYZNNxbPuKrlDNVpxdRXoIR6ziQkPd0gC7/+81A2PS0eSw5a+u1k/h33lx8ueF
	 1gVHRj15c7PUUZGwaPRU6QjrvYLzBg+vUwJgkXg7WXdYtDATGs6wTRAbH2YesKxRvXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179374;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Obd6DBT8X0xh3lgiYCV38ulNGq3OGCe1QiMxMC6hx3I=;
	b=u+W/b3WecohlqRbyCqrK2ic4ggqfqIG4EVEstNHXJCEdmTGpvdl/jrquEF3vIt2QIotP
	 c/LaBq7sMBfph/Pa6OjqbBbkjRPrr6ed/zigkYV/CqMQ+HMHL1ZhOxU6l0dERXY6sCld5
	 3+dTcEpKnEe6g3zwm55B4nKFgC9H14X1bJkKvqb/b23ddwCupOPkxV2iDLO6si/kJ+6/v
	 wKHM9wGOPzXCN7rN0LaCnOfDDdvFz5cWgDtC5Hr2WZ7+YtqWOXGkgI53a7jalKqoquwmc
	 ImNd9fODjsSKz+YhXUO1eVhd3OamatkiYzt99iX2KZqRX5RyxOhp9a0mhwm1+4hIjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aQIBYwy/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aQIBYwy/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45D31F01829
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793179373;
	bh=Obd6DBT8X0xh3lgiYCV38ulNGq3OGCe1QiMxMC6hx3I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aQIBYwy/m9UrJS4YAHUhYXzzc7JVpTAKhtcJ9R9jNbXz9LZRAm+3AlgXt9jfxd7Gd
	 L5aSNBr0EUWE3OavMSrTNK0kRIrwww4bUc/OD1VgUUceUz4Bfn/N/emb0uc1yMs1Pe
	 Cwr2WYrxCSHGoPdhFStgkvxsIuSfZcSCPUOtkgW4jZkCpIrCacIDNlOYBh1GoSHFUr
	 LGF3TJ69TjL2jxF+/OCpvmPBhcaDQxGQ5csUNSMUgMhzYCr+kg4l2HIJ93kb411UXT
	 Hdf/cuRKKnDtxoBJ+6m1GQKfVbjnqb/D4Y/RbQ6ci9E6fV8GUfaa8q8MiYIB57TpKQ
	 rno1OHKrDA6RA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a9e87ba696so5618711fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsizrn09UQk3v4Knq/eIBQ55sfW1u94Pean/3UoKqvykr77O4zbNA0vntsyfWVgJpTIJAKYmlla0Dvj5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbafliTbZhna0QypM0bgqrjnUYy5+Jo7OKUywsCEL0EyKMwExT
	9ze/Lbvy42Xt38/bQXRnPczFjQWk9jeTz1Xc3JLLsYjzZzqnx1p6XgzO+TiyRrb1jboLgZVfDRO
	yCnIA6RS7CsMmzGuTOFOwaZpbIbs9QyHs6Uh186KA8Q==
X-Received: by 2002:a05:651c:554:b0:3a6:6f81:1027 with SMTP id
 38308e7fff4ca-3ac9cf92016mr3387891fa.24.1793179372646; Wed, 28 Oct 2026
 02:22:52 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:22:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:22:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <auGdrYC_mZeJft0q@QCOM-aGQu4IUr3Y>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com> <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
 <auGdrYC_mZeJft0q@QCOM-aGQu4IUr3Y>
Date: Wed, 28 Oct 2026 02:22:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf1k4ZKi9L+UVshuQnbomJAPV+jPR1jgH8Q2QWnMbqOVw@mail.gmail.com>
X-Gm-Features: AclHuK_dZXUibCWs0t-BhTAf_ntpzeX3ptAFBulw6eXjtSP7RPvDwHaWd5jEueY
Message-ID: <CAMRc=Mf1k4ZKi9L+UVshuQnbomJAPV+jPR1jgH8Q2QWnMbqOVw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 08:01:01 +0100, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Tue, Oct 20, 2026 at 09:17:00AM -0400, Bartosz Golaszewski wrote:
>> On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
>> <shengchao.guo@oss.qualcomm.com> said:
>> > A consumer that requests a shared line with GPIOD_ASIS never calls
>> > direction_output(), so def_val keeps its initial value of 0. If the
>> > line was left high, for instance by the bootloader, a later
>> > gpiod_set_value(0) from that consumer matches def_val and the proxy
>> > treats it as withdrawing a vote it never cast. It returns success
>> > without writing the hardware, and the line stays high.
>> >
>> > The consumer has no way to tell. Its request to drive the line low is
>> > silently ignored until it first votes for high and then withdraws
>> > that vote.
>> >
>> > When the requested value is the default and no votes are
>> > outstanding, write it to the hardware instead of returning early.
>> > For lines configured via direction_output() this is a redundant
>> > write of the value the line already has. With votes outstanding the
>> > request remains a no-op, as the line must stay at the voted value.
>> >
>>
>> Wouldn't this only matter for a line requested as-is? We could avoid the
>> redundant write if we only did it for such lines instead of for all
>> unconditionally.
>
> It also matters for a line configured via direction_output(), after
> patch 2. When a proxy releases the line and restoring the default value
> fails, gpio_shared_proxy_free() still drops its vote. The line is then
> at the non-default value with votecnt == 0, so "no votes outstanding"
> no longer implies "line is at the default" either way. The unconditional
> write lets any remaining user that sets the default bring the line back.
> Gating it on as-is lines would leave it stuck there.
>
> The proxy also has no direct notion of as-is; it would need a flag in
> gpio_shared_desc tracking whether def_val has ever been written to the
> hardware, set and cleared in the init paths of direction_output() and
> direction_input().
>
> The write itself is cheap and rare: it only happens when a proxy that
> hasn't voted sets the default while no votes are outstanding.
>
> If you still prefer the gating, I can do that in v5 and keep the
> free-failure case recoverable some other way. Otherwise I'll add the
> reasoning above to the commit message.
>

No, that's alright, let's keep the write.

Bart
