Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677959;
	b=lbRuskQYLGdLEiLfOYOUX47URxlElGG3fPp0oX2w/vkzr+2h1KaFw3uHvYGrV8gS7iD5
	 nqWpNCMTM5aI6Od0yDoKN7QV6ZmdsjkZWdSyvGsbqLpfikAe8wixthNyvJfFQ9mBprnkr
	 M5G90AFM0rNBRW55jVrZ9Bfqj1GVxjk78sdw98Z6h//vykRwXu/iHaKam1Kk/kHAyeKT9
	 WoELzAfxo/ANPdCIxhHYK/6+iaoFyNK2BsXEgH4MtEXhQR/j+CkfrZc2zS5GwwkFnTKG6
	 ENgnV5YMsCL874M+QaZnTIJTAqbn3aCXxzftEr5nk80UnD0FLMb7tLnQHzu6xpRUiBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677959;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=8P7Tu0XAT+J8wnnHHa0JJQWbLO74zxbECpHOR7WiaRg=;
	b=j+CYPQKjhDJ7dNaGkat1LbVInsrey6lK7MMiCbHRVqR9DdCHi6L25YirJnCwJAYrtiB5
	 N7xOXGnuzslz5iI+KX1QZyk+kgDatAdob1nYvEHrD/JHFxoD4o3oR0oBFui2xgPG4l2JG
	 i/wJobWGoPhTNPvHmmgr9arUH4d/QgsGGdElTLZsE/w+7tpu/tdQlRzPDwFK98SO2nSxC
	 YP62l0QZHvDJ5/ULA21TWgV0FKSZKDIHkggZ2m7rec6GCXszMVwJmkRThSS0XGRjaMcv/
	 eh3MyIBXP+kxDTlGQLjGrbRWchUEJEt2iEwn/Khh3su8d/rJRZur3nsl3DXjnIETPvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5ofscP5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C967606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5ofscP5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9421F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677957;
	bh=8P7Tu0XAT+J8wnnHHa0JJQWbLO74zxbECpHOR7WiaRg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=D5ofscP5XXx+2SDB9cBz9+0+d7YaxZRpSd/BAfwU/zcz1DfANMut7zYvBjbVrEWNj
	 LBSTiRxcaISYlK471Fqksrz7E5tBbg8KARV57ne4U0LtRTH8rItFYiIRG6y386uBXe
	 SnuoMzZmbL41FyGBg7UDRmVrtJ9ASEXnaTHDCqMVGjk9nmIIrgtmtnDvmGWm9rKsED
	 SdNgLzDJ1VCPLWE0Qv7UICOs1XmK3oF1SEeeXwOFbNJYxMrKuWfD5cOzd6PaLpXEP4
	 Z9lH0+borKwIV2nK2piYlK5tQirUfhosZw7kDzRLSRgao+FoxgnfkdFfXQXtWQEUoW
	 twwsUBiyy9UGw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so18557781fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynkiDvhXWROw4JYQBPAnUaurrse1/tRZhCqdl0TYDK5jXnBC5l6jYckWaJqnN7kcX0od6FUT6rw3eBRmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjN3ySMp9S9zIbUX8dsmVR4sf5jCUSDcVCfWZrW4GCsyAQhIZk
	+/4Xa4xP88WD312j4FUjqYicE7YTTQ5RlfyyZWKjmnEIcyrM+Ls3DkrrY/bKqD22F29pbd5ylPE
	6ngal4OHd+mF+/ci4Lj0R3vkE3EDV8RSoYSptEfGKqg==
X-Received: by 2002:a2e:bc07:0:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3ac441ccc48mr16311271fa.24.1792677956442; Thu, 22 Oct 2026
 07:05:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 07:05:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 07:05:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <atoQfGQZeJDU3eMF@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com> <atoQfGQZeJDU3eMF@ashevche-desk.local>
Date: Thu, 22 Oct 2026 07:05:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfALArmtGmv6h_sPrwxQrqyjOECN9m-GVb9DKQ4kyBE1A@mail.gmail.com>
X-Gm-Features: AclHuK91436dEv-tuysiXiREQ2obPxuGn-weCmtQmrWU-2JJ7wbnUogLc2aR58E
Message-ID: <CAMRc=MfALArmtGmv6h_sPrwxQrqyjOECN9m-GVb9DKQ4kyBE1A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 15:32:44 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Oct 22, 2026 at 02:11:38AM -0700, Bartosz Golaszewski wrote:
>> On Wed, 21 Oct 2026 22:44:42 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > I have noticed that a few drivers use almost the same code to dispose IRQ
>> > mappings. This series to deduplicate the efforts. I only converted a couple
>> > of the users (there are potentially more) in order to stay in the same
>> > subsystem.
>> The "few" being 2 testing drivers of which one (mockup) should ideally go away.
>> Do we really want to add more code to GPIO core that will only be used in
>> testing module(s)? I don't think this is useful, sorry.
>
> I meant a few. As I pointed these were chosen explicitly for the sake of not
> crossing the subsystem boundaries. I looked at Broadcom one, it is so big mess
> but I think I can get an advantage on it. Also there are other drivers that
> just need more work to check (and many of them are outside of drivers/gpio),
> but I'm pretty sure the new API has a good potential.
>

Would it be possible to provide at least one more user other than the testing
drivers?

Bart
