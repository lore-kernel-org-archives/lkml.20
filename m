Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871509;
	b=CPmSYIn/OKaEGZMOjqygEILrWXIoCbUt1zg+CMSarFNc/7kg/NrMybnIiyabDV1Exasx
	 xP1a/la7w7vJBI5GLDJ+Coce0jzjF3mNGRtnYGTARjF4evqpGtcmx420NPzbKleSUX6dK
	 4gCTJpRxkBW5tOtYH3XMhnxz8H/DzglyWHFhYi+OaTVh8/slnqZNFYYLkHTfBSc1HbSK7
	 ITBFKH0uLneWywjiyIYHDx3uzEm3hLPUu6d0ixwtuGzNwoISpXxFWEQVE9dcZLcDzWTgK
	 xvbt+/QONZkXlP3Clf/S7pFHCu5Hd44Gt3v4Bs+B0wEjRMDREwUg7/eiHIs4PWz9yEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871509;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nMhxd5sX2bBZthIUhvKObHc2HEyCH8o/K6wybrIpziE=;
	b=b5VLFiN40nTYGASghGZbNfUSuBDpRwc9RhPjw+TZ3+NF5UfEBbukCuBliTZA/gwKKAml
	 H2BANMt/xr/3leaA0s71SjrlLgwVchYXXJ0hy2LzvEs1hOLFdtqQQnHYbucqSAyDzzuTB
	 MGwsfjvDN9si1rIyK1byiLCWSoKapv17EPrjDUND//qSda/DpHVRwofA4OyIs6v3golfm
	 uc8xeZSwxtej+f4wxTd03HVXSEQPk4Cb8nj5jlXkyCFlZRQx2k3Qj1fR+zaZYQT+mIe8A
	 fus0voKuERTwfmMhB9fwTYDZnKscUpMqnX33/h8rcoJ2SV9saopaN8Rflzrn+iV6r5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXFK+zVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD410606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXFK+zVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99FF1F00A17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871508;
	bh=nMhxd5sX2bBZthIUhvKObHc2HEyCH8o/K6wybrIpziE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kXFK+zVX0EsK1vdvshuHnv+dAW+NeX2n/SI/6ZgpuTiJ8A1HoPcAGd6OuUgLM5IgC
	 6JVMmopN1nDQcpJYTEYSvht1g8v6z9z3lsvkbs1IT/+91QFgGW+VHfczHmnv2uMff0
	 HVAMq8Baf9wJx3i0ZIT6k3X+ZKgtX8+LehISe2S6/1TJsAII6ImtuqP1+fwJrMXi+q
	 MtiXE+hHZBC1lyCOrTzlghYW+uhH23VAMO6NoZhrkO4sebGJfSNQYdRAH4o7UGACud
	 CcyPu9ptrqzdWQFwLR/uziFgUHydr3zVdqv8mmloRFEh9neoEqXk2e8YngMMJ1XsDy
	 FY9yoS1QNdcOw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso1193755e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzTn9htpBjnPhPSnai9py+sZ9n5Iw3hL0S7oKfcTrEU5wlMjJfvLJu8YGVTbc7j+o39nDU+VI20/QzYEAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tHpn+ufSDmILjt/jEAAZyvk2kycTnmE+BZDVbvzVgiBi+o66m
	gV/n9RNZQ2Vu0yvwggX55X/PIj/GpqrzeHPvx4WBn30R+79b2+N0+gwNlcDITdwxkMOcELSyhl5
	Upwr9fI5kLgrmE+h7VaP2wVdGfMQnZz8=
X-Received: by 2002:a05:6512:10cc:b0:5bc:c228:1d75 with SMTP id
 2adb3069b0e04-5bfd957698bmr6814971e87.55.1793871507492; Thu, 05 Nov 2026
 01:38:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
 <20261104-multi-timers-cpufreq-cpuidle-v1-2-c7fd14706715@kernel.org> <96fdaca6-5918-41b2-9ec3-c69ba6da24ba@kernel.org>
In-Reply-To: <96fdaca6-5918-41b2-9ec3-c69ba6da24ba@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:38:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLk=uWQ4QQcd+kcm1jx4bqGpAAa8LtgeKFZHRfv6mr7x3A@mail.gmail.com>
X-Gm-Features: AclHuK8I9fAKU9f7FrsFizavhu-R5ehiVY76LKNeDnoalMyplV6N55_ihKEM6Rk
Message-ID: <CAD++jLk=uWQ4QQcd+kcm1jx4bqGpAAa8LtgeKFZHRfv6mr7x3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: configs: multi_v7: Enable the TEO cpuidle governor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> On 04/11/2026 13:15, Linus Walleij wrote:

> > The multi_v7 defconfig already enables cpuidle and idle dynticks.
> > Select TEO to use it as the default cpuidle governor instead of menu.
>
> But why? Commit msg misses the main point here.

It's in the cover letter, you're right. I'll just copy the same info into e=
ach
commit.

Yours,
Linus Walleij
