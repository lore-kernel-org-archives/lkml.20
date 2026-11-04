Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793095;
	b=N/WPmhtapMwEEyAOFNAXIggaVo9DgvHbTS4H1QbE6EEgD85tFNvOcAnFjAO2Lf02vSv/
	 azImUjaKZ9cVqYc5HyXOGjfFfJ7GOnhARdGBMKMGn3OaWWSjYzHiqu4+4VUZUM4Td3JBo
	 AiLpu8rw001qNU4M43BYCpKghivUSlej04z9fRT5pIKTjba92lHOSQlmIXFtwkgPduXfh
	 N4/oq3qDIR5u19aAUH9fj8+yykstW+AOSSE1AFmA4csrXHWIAkD2HHji5u2WkYO2KuA51
	 N3darhTdSCWzzxCLrZbg16NJI/+kbpY8rLKnHH27fx4lwczu1T48aHCMlvRUoB4uXTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793095;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M9toJ53ydYCoiArg5B/a0UyMg/GqRdIfCxC9+xsL628=;
	b=a9b7l8idmAOtbZTHvB3E+dQSzsMx0+24Ebf81/bqIjNtkCFBC3AnJwsTrJ7Vj8KugxM5
	 xc+fTwS8Q8acFzz2SfwwdF2oz5a+05CKM8E3+oEHhQlZM28SPS7WJyESnvaPLttrexjDo
	 FgRVGiBkihNOaCNxRAluxAkl3ZcvmXCGRsscBzGj8FJ2ykY6udeAYyFs8lybo5hcPttsN
	 sgdsdl5SfaLZx7FEr1NrZpc0jQZ0JNZDoz6J47y5gm+pfGpa0Kcp7+z2MAWIwCl950KGy
	 zlGqrMo3kpsldy59meyBkexjW6HnHl8CUedJk76uHOQLnAwE4ulhw0nZkVuBJAPNwfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJn7WrYk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76560606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJn7WrYk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4A71F00A16
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793793094;
	bh=M9toJ53ydYCoiArg5B/a0UyMg/GqRdIfCxC9+xsL628=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RJn7WrYkJSDmB655Qqo7xt1psrIl4bZ6uv3p2mJ+zBmb14Es6WJLZgc2WyQVAYfJ4
	 IuRe8t4NxfWymuzqMYjzLsbUaytGneBe0daFNKPO23MNuLIKsWt1XryhrurAIaiaHo
	 2+ZzgBIbPq/IGQWTeECMpmSvIM4/uMmYqTUckbHCDBJMwOigyf4u8W6kBys2n2W1qJ
	 7vQaOzgeRBIOZm20w9G8TrDxUtE46CKIjY6CpGh7YoGTUf3eTaasRhfvt8mWFlkBj7
	 4X9tJ7cDUZqDzvf0N9ci8+ybt7LulILzFOy0BG71fggqw4D3ZMxqd3ix4JpGzWD7WB
	 v6F/byT6P3e0g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so5058881fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:51:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwIrc7mcYuD4A3OIg1yiLKbepVn5Vsrk88/MHXj2PIS4gSakN+6UZ9VWy7JLvNlebg9cvpZfxUqeiqABGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kXOYRWfJ1Ca5yUrCMUUvWi02k+j7vJlnvqiaNgbLVjGIOyUSr
	5fFFFhAm8h+cgL6iooy66v4OW5gzaFtuZP4O+208ZQlJsl5heOb3cT6st7rZ5+c5UgoQUelGqc5
	k4VE9e2KVXZWcIKPyCl55VeePvjCiSNo=
X-Received: by 2002:a05:6512:3088:b0:5b8:bc5e:b572 with SMTP id
 2adb3069b0e04-5bfd9592c6bmr6089229e87.42.1793793092790; Wed, 04 Nov 2026
 03:51:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-compile-v1-1-9e93e2260a9f@kernel.org> <CA+=Fv5T0NE3LiTEHtwORHzz=0qv4xkRxY7iReU9KQ8MQmcRPmQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5T0NE3LiTEHtwORHzz=0qv4xkRxY7iReU9KQ8MQmcRPmQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 12:51:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLkkFxddXs9fSfaza4Z=jxX4eeeoUVJFhfTz3JKgk+U-5w@mail.gmail.com>
X-Gm-Features: AclHuK-UKV95mm-pjvOhPR0QGfehJoBB4EfXR5WPXjohO9cZ6tYRl7EhcSPrWmQ
Message-ID: <CAD++jLkkFxddXs9fSfaza4Z=jxX4eeeoUVJFhfTz3JKgk+U-5w@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use symbol assignment in SYM_END
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Magnus,

On Tue, Nov 3, 2026 at 12:06=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:

> Thanks for fixing this. I reproduced the failure with the unchanged
> BCM6846 Runner wrapper using Alpha GNU as 2.43. With your patch it
> assembled without warnings.

Do you have *another* BCM6846 runner implementation, or did
you just check out my development branch(*)?

My implementation is a bit crazy and in-progress, basically trying
to evolve the way the kernel deals with random crazy fringe
small firmware blobs.

Yours,
Linus Walleij

(*) https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator=
.git/log/?h=3Db4/genexis-xg6846b-ethernet
