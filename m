Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972305;
	b=1AtyCh5ywPzPgY7iJE0AOJbla7GzdB+dp3znEwuEFvCq+aKzi2UkFmuqpOFLHeWYCbmx
	 aAn+Q+0MedV2k5ie46odGFJDBkueH20t8Am2bbKiOFIww19y1D8o/fUT+eaqmeddpYyp6
	 g0bfGa9c2enyG87ef+EZyHVsB2/gkEIpqyITEqjxN/lGLdOz4jjQB30FC4BD59/1RhjLO
	 XuNAQUjrUCGwm/l321bBIteSmg5UeAaHvk9d+l0lvrj+pDpT4hFyF5ssueFEJc8xFwnDs
	 r6/8kLt6iy8EmVZN7Lyme4Mrku6O2gILeahLwG3G31/Z3Zfl8uumUG/s8hS0XhP8HPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972305;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gQBS7v9tFl3fjkelQi9sJCplAiT3WJd75iogpE1L0R8=;
	b=FRT+VMB0+i7Y7hAFJCVr43MNypIJMDl0Y5YakfQxaQYIFGU+hceetWSP4cy6EAaGlCnx
	 5ePUji4S1lf1eNTEoDC1FIdixbih4O/C3RYb3PO+ozzRw56FCFia9sh3UWWy9A4aZyTZy
	 2PNNd8iv1IalUR5WavlsH0dIs7Zk4RXp1WCCw1cJDxS/a2Th8mEvIVOiG/KL/wxHD3BWk
	 lt357xPcDfFnggZNCltN5fwDip72pkLBHh9J2TS6kkyL738AZMq+FEz4eTjB+yP9HKL8d
	 lLZNfxA3N7UBJ4AWlod4/3qTPM92HqC2In7qKpW41WYeP3OPLgtejQzq/ZIfLxFOYTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdTJaBUh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F816606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdTJaBUh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4031F008A2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972304;
	bh=gQBS7v9tFl3fjkelQi9sJCplAiT3WJd75iogpE1L0R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CdTJaBUhRIDbG1lY/eBuinJ4AvxcV8862ho72UfnOVOkh4gjQ9J8I2l5glOEL4GRE
	 g9aT+KJ0K7CKt/1OXiqyeXKNcsk5Zurm7BbVGiNwFLHaIgw0T9B96IUOByszAm6JBE
	 BovY4hXsz1/ZKN+4OdViMwN9nwZpmuHSxhlSkxE/zcshe4zBTP2n+5B7N9rV8N44ZA
	 6LPlYcy3NChfvEUFyvcrurx5CgEvbBbyiNy7w039DFdPjF0tW0m+yhT2CV4S62BpQA
	 hSw4oee+AW49xzyfn8/D4RoY6mqppuUwfqPj4djCViqZp7CAl4YAzn85Rrile634sy
	 agtl2slta2Fig==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4d648aacso491216e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByR0YLag1eEevc1pPTsZtL8xlXmQ73RaRN9w4K812ivBZ2ZqXGrZeRUTMH6iPX5Pj9Bix+jddj4X8002II=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R4fnaXqcSjqGSWD3O0VzL9lJtV5Vpo8ocVfuneUcboq60leym
	CUOwI3IsmoFunPKyxPpPrJU/XvNc4YBlFTn/NUYfyiEVMAjQyI+mDI/vz3Rsj6mQ9P3uIfwvHMN
	Sh2joCyacQckLxPEOuNmoQlKB+Smf5d4=
X-Received: by 2002:a05:6512:23a8:b0:5bf:a6f0:99f5 with SMTP id
 2adb3069b0e04-5c003c3c415mr845462e87.53.1793972303645; Fri, 06 Nov 2026
 05:38:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:38:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8Eh89re2xxkKKOvsCMeLKMJHNsJfuP_KwYALYeQXvgA@mail.gmail.com>
X-Gm-Features: AclHuK_6Bx8k78KNBHAtmOxBfZAHVK4oXzuHSxzv8jywI57DTrJQRyqi2wnS5w4
Message-ID: <CAD++jLk8Eh89re2xxkKKOvsCMeLKMJHNsJfuP_KwYALYeQXvgA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:34=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd
> boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is
> included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch
> 2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For
> 32-bit boards, this cuts the remaining warnings in ~half.
>
> I verified the config-bus devices still probe after moving 'mcc' node
> with arm/vexpress-v2p-ca15-tc1.dts on QEMU.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
