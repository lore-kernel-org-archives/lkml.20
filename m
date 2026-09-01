Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A7481FBE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284542; cv=pass; b=ZY6EG+Gn5C7mv1DgW2XTtYQCL5crDP+x0mEBtBI9dA4ymEXBEhTxnRPJBZJ55QR92zcpN6J/gJhj1eo5K9hFJa+RO2u/iKmD0UBRcxhh8IZIaTLwzxkk+pkcYsArcv9+YiPZUEJhsZbX6Vpd3xZkyXEvBXrg4q+gjliveEGGWpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284542; c=relaxed/simple;
	bh=p1uQsN9T7xX3H3/reDzJNofZ+Td1vmF68o1s3Y6e9RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLTRl5mGz+2E+C84Appu8srXCS7/FJBxIJ1VfKco1cRaDOtX2/9tdX6aBubt5F0WwsX9AGqytMhOECewCgmZiKCB/377l+lXxr6NrCHkGqqrQ8rnrf9SJn1vApQamhmFbCu1fQ2fRR1KBKV9Igi9IuMGO7NP9JgUebzdDRCQUlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl+S9szz; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl+S9szz"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7dbcb505578so2936147b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788284540; cv=none;
        d=google.com; s=arc-20260327;
        b=UxhgKzDxUjcRmc2gV4ImKubFh52t7EUPglD/kwkf2zoum0bcmsW4RDPcZihQVNvl8u
         RjW+QJ1EgPL0rPjSimOZWcBt+4ORjdMXIXAMlWcHma6ZV7izy/+RS1cal9jblkh7vMbg
         rBugD5/dZojcX4T2P6djLmJv4u1W4im0VzMTt+yzgx0xUKumChTKN968dw6pP5J2JvnJ
         n4BOk1bm75ahCwZsr2CsAVk+aeDm2oZOvi7yjG5576TUgDjmJxE6NQe1Z7RajYR5UIEP
         maGqPZTJT+KQNpJmPQUujjm42WnZ4CkLfiXaSXwIbi10Q00e51m/D1ibZfv7RXCvFscZ
         A/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p1uQsN9T7xX3H3/reDzJNofZ+Td1vmF68o1s3Y6e9RU=;
        fh=jg/8MBz7aZb9XtivY4rvpe39EYeQdUAhDJvoY1QRMTY=;
        b=eoAQ+qa82Bd7RJeAbUeKEJGmjqYwj539hJkAvzhR1IwYWcWEwcVbvL/ODiFrqiIQ2K
         wsB7+RSPvvz1OWX5gUUU3/vkvHSuxNsxr72KV/Gn5nPLBsFBkYekDMqjp0mSYrRwvCel
         6aDuByM0lHfjkHM+z7E0u4FhnPkdGxyd1stUck/ZcTaEJ3FIr7KDwAq/YTDUPdHsLjhq
         RP8Te9C+jP4CXTx7Bm0XtJGk38zWduEG1T5jtxXwUgcDG2xl1RmsoOpFKhWY5qhyExmn
         V/BoV7yLMILvVa+e+W8hEJC1fqpyo335i6eDUZ5xicwo0pqrc0T2lXmLS/FjbJadMwZU
         TQmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788284540; x=1788889340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1uQsN9T7xX3H3/reDzJNofZ+Td1vmF68o1s3Y6e9RU=;
        b=Nl+S9szzBfeQyOuqeKeWpMguE4V6e3VtkK2YJgpzhLMZY+eVfAJLKmOeLLIHYUgJdA
         DYL3ePtveP99SnZTgrMdrE6W2FtxFGiQBvVXCPaK4BexzlqWmIT0hvr14ERjzklCFyEB
         fe/UNUq+5k3tWo2jWEB9hvn5Rc+qc1I2sDlkQm4aKWCzgXSLyZ3Tau54o8c3VwZCOiMd
         H/V/s9eG7WAi3/5JmBE+dk/9gRI45ODoMKkGpVaoHz3kb7AXGPfL+iWEfKuniChRjnEQ
         Uw5joEosc4RikECE0xj0fcCldI/klQvyCTTgdSZ2nfMshuJae6oIsySKxYk9n8A2jIEJ
         1xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284540; x=1788889340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1uQsN9T7xX3H3/reDzJNofZ+Td1vmF68o1s3Y6e9RU=;
        b=iXYXkkpI2ShGLkCnFC/4+iiHY9YD3aWYiZtQv7lO5T5mX9YFcGE+o/mwP/LpD/P1Oj
         Pi7TrLdejOktn0cmEvJjdFNx4cqE8CQumF/vTQY2vknlfVMvy6Af0bLN72vrrAnd9/X6
         Zq4gajKqIfWoddskLyj4Ux3l6YqiInhGGZCrpnTMpQkbYzYON2ME6FbCEL64MktBZrKE
         RJbHP1bBoFFP3npOZMf2PPqpcR8cZVRgPH2MvZCaHNgU2XRXDllGw0Yjc++EqWPati/Y
         IjYM+Rpi4+6b3Jy8r2ksRZob2auLXyIrIeFXX5UasO/KMOGgKB15oRE+23nTnZHxbedm
         /MBA==
X-Forwarded-Encrypted: i=1; AKwUvBzhjOwdi1pjE5KDwPR8heNjqSkS4UDpeAfW7d2EI1fV8vecQf1WHJWfYeNC/TYzCV+tci9bYin5l2TFNhU=@vger.kernel.org
X-Gm-Message-State: AFuF++my1Pqt9bIeSh47598uMmfkjwJhtrqgTIOJbEvJSMGfaYPVTdf8
	4diGYsGgebBmAKYh7vKVSKtGmy2vvkX8YuG1IXt7vBNqEJvxL/AcfL9R+HZPuLLqCE4RYYCj0g+
	o8bPVbnmK7LZx/stfEwoYYFAhKKPhDjo=
X-Gm-Gg: AYBFou2MBhzkP5+QNlRogjKGS8VspW9T9ZUlXoxAfgl/xw5DaKcpNoj0tMIovhA+rlX
	Ihe653JjoF2EK8iF07w/30yr91C41L3kdcwT7k8fO24sXse6XUiYWIY1RvZ8oJ09YP2OkQyE+y4
	o03X5mxbpx+7NzwPj90nqZ8c4fZBMtXJQl4qR6iEnMjjp8aqJIkx6AhXubeJAyeHNaYx8XMoin3
	aiVjbspWnbdqcri7jodHkxgZyxK1r3ZZ7VRQQcX1ndKCNP/vHJZOMf4n4JDA8P0xGIfIL/B9gP9
	iPMwXGEqTjO7xQYmxa8P4Hd0KguXyQn10drngBsM7xz8a9pYU9mIb6Jp/QKJCqYqa8jFXQBnAQ0
	KgBV6TeUyYRQ618cF6GlPKdzsj89f2CJy3AQlqGya1xzFoVAbc/XQZr2txy5DffcW3FF7FKEvYG
	0ScONhKySrDNfi
X-Received: by 2002:a05:690c:e159:20b0:855:37f6:a73f with SMTP id
 00721157ae682-85d69f00d89mr107947447b3.13.1788284540080; Tue, 01 Sep 2026
 10:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <DKYH3KM93BDY.1MR4WLZSWGEU8@gmail.com> <CAE5sdEiGA+chRkkNGOWL89AFDNXor1RKHMEmouCNoCXVd4fc-g@mail.gmail.com>
 <d4e2ae332a9505cc2cee5a236ff86efb@oss.cyber.gouv.fr>
In-Reply-To: <d4e2ae332a9505cc2cee5a236ff86efb@oss.cyber.gouv.fr>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Tue, 1 Sep 2026 10:42:08 -0700
X-Gm-Features: AcwNN1Uea0qvxpbJnC7W6Ed8TeX-njpcgs2h1B6X2fQu1FbWfEcGHVsgCajGxzs
Message-ID: <CAE5sdEg1eMs1Rip2mbCV570p0==2gj7ZtH8CttPfsqcM2CrB0Q@mail.gmail.com>
Subject: Re: [BUG] bpf: x86 timed may_goto corrupts private-stack JIT state
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, 
	rlmenge@gmail.com, hargar@microsoft.com, apais@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 00:11, J=C3=A9r=C3=A9my Jean <jeremy.jean@oss.cyber.=
gouv.fr> wrote:
>
> On 2026-09-01 00:57, Siddharth Chintamaneni wrote:
> > On Tue, 25 Aug 2026 at 18:10, Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> >>
> >> On Mon Aug 24, 2026 at 2:31 PM PDT, J=C3=A9r=C3=A9my Jean wrote:
> >> > Hello,
> >> >
> >> > With the help of AI models, I found a bug in the x86 timed may_goto =
path that
> >> > leads to a verifier/JIT state mismatch on private-stack programs.
> >> >
> >> > The root cause is that timed may_goto fixups pass a stack offset in =
BPF_REG_AX
> >> > and the x86 trampoline reconstructs the counter pointer from native =
%rbp. That
> >> > is incorrect once private-stack JIT mode is enabled: ordinary BPF fr=
ame pointer
> >> > accesses are remapped from %rbp to %r9, but arch_bpf_timed_may_goto(=
) still
> >> > uses %rbp and ends up reading and writing the native JIT frame inste=
ad of the
> >> > private BPF stack.
> >> >
> >> > The bug was introduced by 2fb761823ead ("bpf, x86: Add x86 JIT suppo=
rt for timed
> >> > may_goto"). I reproduced it on a KASAN-enabled x86_64 kernel based o=
n v7.2,
> >> > however KASAN does not trigger because the bad write stays inside th=
e native
> >> > JIT frame. Yet, the saved-register corruption is observable.
> >> >
> >> > I have not included a patch here because the fix seems subtle to me =
and would
> >> > likely touch many files for different arch.
> >> >
> >> > I can share the minimal reproducer and other details privately with =
maintainers
> >> > if useful.
> >>
> >> Just send a fix and a selftest to the list.
> >>
> >
> > Jeremy,
> >
> > I just wanted to check whether you're working on a patch for this. if
> > not, I'd be happy to take a look.
>
> Hello,
>
> No, not at the moment.
> Feel free to ask if I can be of some help
>

Let me playaorund with it. I'll let you know if I have more questions. Than=
ks!

> Regards,
> J=C3=A9r=C3=A9my
