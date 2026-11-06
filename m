Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976344;
	b=XhNNJMbnKGA+bxF9ZnzdBvt6zq0Be6UtEZaZpark44e4S2sQ3wtYmpRqtyAGGzFGcjKA
	 gj0PdD/U2Ioqr6Zu5ed4MLjPInWtJS2Wca8A2O1KlsKDc1a2b4Dh+sE4TQl+Xwe+wHX8J
	 gwd3qQ57sVjqHMNePtWfiXoPsFma5Qte/sjuu6NxCPQg70/vtx6Hz/xzODD+oIzVuSq8A
	 2ldzzSyqEWY/ETi/HmJRbL2x0Q2t7vSz5ltbn+rgEcG06vKxA9OMtEhPg5AoAqe4SkUnX
	 dSfsdChvBp2hA1tPdOrRcknHpUCTnEvYIQEcvg2vCbgbyKZSsFt1xGX10pqSkc8pTYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976344;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D8oZmxNlOKsm/Rp//d88vLIxrb2bjb3rSm4pQQTcZQA=;
	b=zg0Q3ovPlCsrzvh8eQEmo9qEvomufb1HK9a8CUgdPU0HgZ6L4uuoqy2bYXFC6EexYiMu
	 FHRVldfLOQC64zwni2gWwPh+MPbXnAisq4REwDesRMNwu7kUedrycmaZMC/zJ424fxc60
	 2Zrw9iSsowUAPHpHoXJQo0r08AMgExtywfh3Y7H9SujwB7/0jM5kLnrQy4vD98KKotfC3
	 Ls89yMe+q7VYDXGO+BSABgjg3jjm0Tm7xl/e6lhOPWuKkR1g2NgJ15TeKvvCBefQ5AK8h
	 rawVStHjgHXwiMEXxHpM8FHJeVieYySu2rHF22XrUpi/gsBJ2hujrRcHB0+2LFhT82A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O694iKXS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B5F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O694iKXS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FA81F008BC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976344;
	bh=D8oZmxNlOKsm/Rp//d88vLIxrb2bjb3rSm4pQQTcZQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O694iKXSJRyqv5P7AKWdMgVg7eGV5VUqteLay04fKbnkp91vwNvnX16VRNjlaStw3
	 cYtFjfmZ90GRSfquVrpsyY1tr+Yv6Evr1KB2h1m6vRaKpmtfUSrJPyVWym4MxdqrWL
	 8q2sl2nGqfQDnO8FMEngOW/krdseih27x3q7S/qgWv8Ts7HxFQ48RXc6IT0arBV2og
	 FIzuqpHAOh/vi6Sf5lVzXlbRa/p1DdM6szpZxDSM5h8QToI/Im8Uo8TFS39fHaVYaF
	 O1FnA3169YX/JYR2T8P8EwJa677u0bM37kegN4iE9hwZmiNx/qntsGTAAh/IxUkJKE
	 /YjKJ14GC5Tuw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so983223a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:45:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHbu8yrAI1jiost60JWYGzddjbDzr1k6dMt9DBFpoVjUg+xnny/bdWueQL5QMa6GLMlcCxEaqHdex19lsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n8QjfVS4uvBKNxUJ5ttx2AHFxIhp1nn/kJkKWaM1dHjYGYDqV
	OykFseP0VtlrGnWSpYzu4FqUWjqWP/MH2dOYIGvB3aFY/Ig12cBtVnfDak5+HdYv9prIU2nbF5H
	nRtZakVIyLWqPw752lq6N14usZ5q7tAQ=
X-Received: by 2002:a05:6402:3207:b0:6b6:e808:96f7 with SMTP id
 4fb4d7f45d1cf-6b6e80899eemr1325905a12.3.1793976342883; Fri, 06 Nov 2026
 06:45:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102072808.23080-3-yangtiezhu@loongson.cn>
 <c3b8e6ae47164ab1a643a1730f0600993de03c8a30e35122a9812ac73d807697@mail.kernel.org>
 <1276eb14-b851-aee7-36ad-d61e2ddd9ba4@loongson.cn>
In-Reply-To: <1276eb14-b851-aee7-36ad-d61e2ddd9ba4@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 6 Nov 2026 22:45:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4GyC5=PvF5yvYnoBpUpU3VTuE8kdNUnApNqvN4vHZfhg@mail.gmail.com>
X-Gm-Features: AclHuK_E27SlHuF9Up4hvhe95PGG3OxpyR3ULOjCKnQ_VAfUevX4tHqFUb9HhkY
Message-ID: <CAAhV-H4GyC5=PvF5yvYnoBpUpU3VTuE8kdNUnApNqvN4vHZfhg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: BPF: Use beqz and bnez instructions for trampoline
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: bot+bpf-ci@kernel.org, hengqi.chen@gmail.com, loongarch@lists.linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org, 
	eddyz87@gmail.com, yonghong.song@linux.dev, mason@kernel.org, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:27=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/11/2 =E4=B8=8B=E5=8D=883:53, bot+bpf-ci@kernel.org wrote:
> >> LoongArch: BPF: Use beqz and bnez instructions for trampoline
> >
> > TL;DR: Commit message only: the claimed branch-overflow risk looks impo=
ssible,
> > since trampolines fit in one page and the old code behaved identically,=
 so the
> > Fixes: and Cc: stable tags may not be justified.
>
> ...
>
> > Could the changelog drop the overflow-risk wording, or describe the cha=
nge
> > as a cleanup, and could the Fixes: and Cc: stable tags be reconsidered =
given
> > that stable-kernel-rules requires a fix for a real bug?
>
> Will update the commit message and remove the 'Fixes' and 'Cc: stable'
> tags. If no more comments, I will send out v2 next week.
Fixes can be removed but I suggest keep Cc: stable, the overflow risk
actually exists.

Huacai

>
> Thanks,
> Tiezhu
>
