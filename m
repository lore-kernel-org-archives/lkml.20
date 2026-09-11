Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9556E043
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158282; cv=none; b=UwHGcVwrVZWhI06vexFmlK+A2tIbufItf7ktbZ/DH8E7Bi6MIQMW55NRS8qHxs/B5s22Id4v1JDg09zn+LUpkcBIgA9ZCmFn80WTLAqdDXQBxZdkUY3QSW/NTrwhFehY+mhR2rECES1n9gCrVpZW9S59rgUEUR8dC2jpXbmSFmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158282; c=relaxed/simple;
	bh=opXDhzhWx3YuSpYKdsgNd3wA8vkj4Z2GqyoqGFGWi1Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iXhR2ne/3oXFweD8bXxuQvQj9eODIMaVzCgcGjbwXA5SS5emP2hC5YGQfMbZ9AxjPV8iA3PauNjjrvzJN+vt0wCy2pcogPohYFD+YpiRL+8b6RoTRlmYt27N0M4cXpX7YxOGk9cQ87KnDXwN9cSPhE8gJRTYZs1YOeOGdWCi8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq/FB693; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq/FB693"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1053842b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158273; x=1789763073; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gyg4bhi0HgrKIi3/MhUwMNUrXcSsaRWq3czyD7XoEJ0=;
        b=Aq/FB693XIjPIhBFes51/Q7azMW4l6RGugBM39OYr5dpNoLxBXzRniN8pcjC+SHPfv
         9V9H1+LZFr3fYoz6qGZodLcSxkCQFxLx7m3GDnopXSmiSuiG9w1Bb5n7tkqLceoogTTv
         z6V2C/5eFdujE/S9oKEmQxDy6FT88CU2k6AiqsL9FVyB1vXs3OluwdixIP+3i62P7zY/
         6z2sfZ+yXDs51Lb6GYFmcIacaUmRoAmVxuZit6UyiMSgAKIPP7sctZGIp7KL9QHL5NV5
         JL5QHAAKhCqYGZNpZrda6+jK0c3fXkSMGyuSeAzvi8BRH/j6M+p43yKsXgdglY5jTQuB
         2cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158273; x=1789763073;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyg4bhi0HgrKIi3/MhUwMNUrXcSsaRWq3czyD7XoEJ0=;
        b=D1RBMP7hAmO8rtRSsJT7HBpVabXk7TfLwC6gn1FZU3WYrlOvS48WQRsj8WNdXwRv9L
         JB9oHfWFpI3gRXfBiXn4nbrCQ0IQ37EIZp11ngOvRWQ/ZZ7w+ZnpDBLubhYuBE0tq0jT
         zkHMm7MqnWfmBZrUAaUarZ5ph1D+dk0aZdQbZ0zSnu0H84m2KeNgX7bwYBK5HYZzcK3J
         23BI3P9PZnkeNwUySrXRZ8QbPjbzIy0ILongEdvyMJRAECLs6QEF5QP71wAaKuGwrWcx
         tM5QJWUja9S18S6Gsu8FO8/63axTxFldhV45OOSjO6GOg10ZeonjJb6wvi/aio0CFgpH
         lcdA==
X-Forwarded-Encrypted: i=1; AKwUvBwtEJqd/2jjR44OsQ7+Ne1klQ4cXwn8Fh8Nt354TTA4zuqlTNPSX95x/vKHG84aIfMl2vS0pN/mu/wr8/A=@vger.kernel.org
X-Gm-Message-State: AFuF++m7JOwaPSGwWWl2iYkGqnBVvFiRoLRgoTLeFdbQ3Jgq3YC6vYlj
	te4H51YfxMHKL2gf5WfUbHAZNr1qG+vVldV9YOjqgX3g6eJjS0bpr03ZGP/lfIKpV/U=
X-Gm-Gg: AYBFou0XEsuTgC/oKUMHNws4rIjo1QKsg0vx8J8v1wyChxpifCRk1MRYkS2uwUqTMnE
	Zfk20J0cAFNejTZ7R3gmFWGYz8jkLKb7l0uKL1mzLBffcAfDfc8RaEmYfJs9KqrP4+WrQxVxRMk
	Thre0NYnEG7CmoSAjdj6aATU2VYsUSAhwXTWidpQ1u2B+smUj4GRZWVgL0jMPGGkaa5fxEKByyn
	MH+xDUMX7v1hMu9gjZLwfUr3+gJrtbaKECatyYNuly58ncBrrdNTi5JlHlapeq4g19v4vN0P89X
	3w1FBJCXz3mDder0kf/mzWd71Ex61PXUV4St/q0Pw41clHlEX+ufrSOK4KiE2jvpLPw5mQIctHC
	epYzDb0SPjnvtow1RZUMOM7pHRBa5+iY63KSBM/RRlHnAiESNQZfzJKOo+K4iLhS6x3zpfRPY5j
	unbyc++bcak8WJ2S+o21LP2OTXY7cNEPIk/kcDcGwhaVwWfll4nWjV/+MbZZLF99yQT3K5OPO8H
	N79X66ogpWMzuV5Neq7iNIvOUcFdCbAbrHVX0/ozv8OJS0ZO6UNEU30Pg==
X-Received: by 2002:a05:6a21:113:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3daed31b875mr11656343637.17.1789158272624;
        Fri, 11 Sep 2026 13:24:32 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c52f:3686:673c:704a? ([2620:10d:c090:500::4:b9a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm8706794eec.22.2026.09.11.13.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:24:32 -0700 (PDT)
Message-ID: <c2235ade283e0258e7ab018bafcc99b32a63f586.camel@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Tolerate libarena skeleton
 failures under BPF_STRICT_BUILD=0
From: Eduard Zingerman <eddyz87@gmail.com>
To: HyeongJun An <sammiee5311@gmail.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, "Ricardo B ." =?ISO-8859-1?Q?Marli=E8re?=	
 <rbm@suse.com>, Emil Tsalapatis <emil@etsalapatis.com>, Mykola Lysenko	
 <nickolay.lysenko@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Sep 2026 13:24:30 -0700
In-Reply-To: <20260911141621.1944900-1-sammiee5311@gmail.com>
References: <20260911141621.1944900-1-sammiee5311@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 23:16 +0900, HyeongJun An wrote:
> The Makefile documents BPF_STRICT_BUILD=3D0 as tolerating any BPF object,
> skeleton, test object or benchmark failure so that the remaining tests
> still build.  Every skeleton rule honours that through
> $(if $(PERMISSIVE),...), except the three that build the libarena
> skeletons.  Those invoke a sub-make with no guard, so a libarena failure
> is fatal even in permissive mode.
>=20
> With a libarena source that fails to compile, BPF_STRICT_BUILD=3D0 stops =
at
>=20
>   make: *** [libarena/libarena.skel.h] Error 2
>=20
> while an ordinary program failing the same way prints SKIP-BPF and the
> build carries on.
>=20
> Guard the three sub-makes the way the other skeleton rules are guarded.
> The build then prints SKIP-SKEL and continues, and test_progs,
> test_progs-no_alu32, test_progs-cpuv4 and bench all link.  Nothing
> downstream needs a change, because the missing skeleton drops out through
> the existing permissive paths and libarena.test.o is reported as
> SKIP-TEST.  The default BPF_STRICT_BUILD=3D1 still fails on the same inpu=
t.
>=20
> Fixes: a6850fa388f6 ("selftests/bpf: Add BPF_STRICT_BUILD toggle")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---

Why is this change necessary?
The whole PERMISSIVE thing is quite ugly and I regret not being
involved in it's review.

...
