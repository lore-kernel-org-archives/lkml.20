Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D443EA979
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386790; cv=pass; b=Fw0Z4f/GHbdYPQLWr0jmKHnsO00FMntTc6oDnx4OCuSzufT0r8xMANbnaGif8RR234M7IpKfafsXCA+I94zgsJs5pljQN2UlLx2//lT4BiFQzO0EfJs3Dz3nQam9GI8zT7bvg2Sld4R8kzz4m9L5jBmrjN+J3+7dRhvfo8k8k4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386790; c=relaxed/simple;
	bh=+NgXSrxVyEIpCGdMguA9GDbqbBHK/Rdp7VKcczzfwCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPYag/Kat63bmEzesI2pODUQJuZ0BKwA3CjOxQI1TvcVnQYa+n6+prZrQfYiVHhx1kkUF7arpUHvkSfqY4Ek57PD3yys/1TnJ+xJcP+38kqEuiLK25Dc5tDtPvm1DFacBZpsR8t9PRVZ7we7wmHdBMk82e8d3v9TYH6ZSuLjAoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU+NjXwz; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU+NjXwz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso1315791a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788386782; cv=none;
        d=google.com; s=arc-20260327;
        b=Sb/IBRwLOhjVNpxfpxh8ZjkWcE2x/PAmgrI937k1vEHVAZQT1td+1xRUKAdNpgQ8j9
         EXywhP0FfSJAbOUJkofJ4OzqRc1oqcnHNfPxOy/7TnbacgsVa06V2BQz+VKPktmtSct4
         yofGUu4Gst7RX1eZHNMY4qlrwEvtdIsI2mUlrhrc4MnfzGKBi8ckQiYcGgdlSPJYzyvS
         /u2NsVW1n4ZQsxq0FcpIIhOSyjC1fX2bBKQiYZKvpDvE6yShJU0qxsV7Olt1I1yApb8N
         XQQScsUzUHPf5/0sR9LEtoqrgeU6VMQ97CAb51k6H2YiytlcvM7PcxZfiVjAylphAInY
         98ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+NgXSrxVyEIpCGdMguA9GDbqbBHK/Rdp7VKcczzfwCE=;
        fh=CA+gsKVZWRDKb/MbpiJqfpAVxI34WKnd1ihHc62kvt4=;
        b=gdy6P2+YqaHihaL5qOTL2c+gZKanI31zov8L3LQCBKQvfxb+rIjD0Et1SChfvFMHEY
         nqcO5r1HcQ24d2DthDdCRzGHXg0LR3D+5k6tpL03EfY8nrJtqJP1E77pMZY1JGjnKPo8
         EbnscEKDuPEJq6RUd2oeIYq0JANE6z1hYKAbh7RnOImD+/LF6GqyKuhzp8/9DbDzoypt
         pSibANK5Sqxhm5pCYRhqeSjB5pasZFo9QnL/ja+RmxcHhkDsB25PFid6gkrKXj8OKFFv
         o8H+VkvRYw9eG26jlglcba4yFwtYe01hEBxciMB8k01orW+b1KroxL5/M5X3UZCmQNF5
         x0Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788386782; x=1788991582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+NgXSrxVyEIpCGdMguA9GDbqbBHK/Rdp7VKcczzfwCE=;
        b=eU+NjXwzHVzv2hPklRXUlhVndF83Nfy632PLd3tJpzTznYg6T0lmmccxnLfQYaIz2N
         ooxVe7H/x8a9RKYPPOXmtKTa5NUFOcxfBRWwDC7bV/MJsoZKDqN1P/PU4jMwrJcnGKHn
         ZreqALpwqdx/8lzagP2jYWr+dnCpknfZ9CnefuS+ASl4wzvWhoN8mCUu56cXgks9LnAN
         gFnUYTvCGfWKIkr2mkCpN4Fd4ZSQOY84AvQvqofK+g1o2qRi7mz2JKEPeZSvreWPWLxU
         OSE+Byynmc+u7PzE7qFrzJaxEJX1gQ6sx1InXj4rSd6VGXR/TSr3jkvnw+2HFrs7VecY
         FkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386782; x=1788991582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NgXSrxVyEIpCGdMguA9GDbqbBHK/Rdp7VKcczzfwCE=;
        b=K9mq28kc2RbAUuJZyPTGSd5afQf0nic7TxYErxcgHVvWLz/cOGkNEBoM5Jn7cdl/JY
         7LKBM9Y/H4g+XJBaVp3fLwAVVZKOj0zz9n4jmPxY//IGqoeV3k6xUF3wjuUcLYepwuOF
         gUdUMAUqEc+3PKQqvvfdpb62ExeeXjlBf9WCzdKM4wvxdMu7n+XEZYsTAg+mAuBzNetD
         hRWO7WlPMvDVSdiSrveY9wDl80nnvPVES8QxnVbjCi2IQSp41mODym9L2Z/oXOIjJGW7
         fPoEhL+5C/mwkpPXkbuA2DgpXfzbwCKcQ4Lvk1zyHMMRtrvLRawFWn/NbbU/Ip0DcG7C
         F9MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXB1u7urEX5KtR6PYR93MtNvTTc424ggBTj5eV17giKxcvGs/EK5lSywN1BV7DxEjvP0Q+4FL9hvthkek=@vger.kernel.org
X-Gm-Message-State: AFuF++mwOx42wrw0MFKda5EG5SB5UqtVpAYS71ZpAjNQM9ubu0vjSvGQ
	lPQPetP9oCqG8nszCYOW7aK3A0tEvlt/XSkWzIyEbk0PjWGzN/03v/dr4RRG02BWE+kx+H3+y1Q
	FmwvvozNsFvSv4iqy7hAywqXdnf4v7dg=
X-Gm-Gg: AYBFou0bxA/Fkizf9yG/ZBcgUtXoXvVNsaFPNiwKguj/ELoGiNoRIeZj44sVguWqiPi
	8QI3QuNZQMaFOpUuqM5JBpdaqgKjvKoMpsqSxvfM4y6e9lHePU8ouLyodhUZqSiJq9RmHICWrYZ
	PsnhPbjOC3jd/D4R4no6jzmGdEJVlvdk14YGEFVs1LQ3+gNslaK3UBmbaniISbebosBE1gRz6mC
	bBMFSJ6CnWq5MFUZFe/dVqvjnDAZx8gbqy6vvtsJy6BHs5WPQ0L+H8NR7KK6RHoQYWB3rKlm413
	UpqtNpwdHgvTbeAJAMNVSVxtO1k+KF7n7C1GwevbhiRREae92QH9G49O291YbAmeYo5E9PNC2aZ
	erIaB6rT09EEjJnxh4nsoGwz4OuJf
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id
 98e67ed59e1d1-39aee10890cmr12235245a91.18.1788386777209; Wed, 02 Sep 2026
 15:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819122252.1782790-1-florent.revest@linux.dev>
 <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com> <CAADnVQLxi-R1KDUXJJjpq69SpV8UcNJVqBi7uicO=V0WhAvyQA@mail.gmail.com>
 <DL2S878KSOI5.1SZMLIAWMCNUJ@gmail.com> <DL3FIBQNP6AU.1HO08FMI292UX@linux.dev>
 <CAADnVQLMm43qJxuiHUuuh51wAL4kH0+fRoaM7YfbZEXT7LHn0A@mail.gmail.com> <DL4R2YXF9J8G.203VBANYFFSET@linux.dev>
In-Reply-To: <DL4R2YXF9J8G.203VBANYFFSET@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 2 Sep 2026 15:06:05 -0700
X-Gm-Features: AcwNN1WeWzPoWWLVPmmE7d-k8VTitECGoYp4jtQLUEttyXIwHXv3qEmj5Sw6KYU
Message-ID: <CAADnVQJ+OJKmgaDM9B58g30M_-pkZgGmbDuvEWmrg8U_ZkxbSg@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
To: Florent Revest <florent.revest@linux.dev>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	John Fastabend <john.fastabend@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jose Fernandez <jose.fernandez@linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 3:15=E2=80=AFAM Florent Revest <florent.revest@linux=
.dev> wrote:
>
> On Wed Sep 2, 2026 at 5:57 AM UTC, Alexei Starovoitov wrote:
> > On Mon, Aug 31, 2026 at 1:58=E2=80=AFPM Florent Revest <florent.revest@=
linux.dev> wrote:
> > >
> > > On Mon Aug 31, 2026 at 2:43 AM UTC, Kumar Kartikeya Dwivedi wrote:
> > > > On Sun Aug 30, 2026 at 3:21 PM CEST, Alexei Starovoitov wrote:
> > > > > On Sun, Aug 30, 2026 at 3:41=E2=80=AFAM Kumar Kartikeya Dwivedi
> > > > > <memxor@gmail.com> wrote:
> > > > >>
> > > > >> Overall, looks good to me. Thanks for the fix!
> > > > >>
> > > > >> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > > > >>
> > > > >> Note for whoever applies this: please add Reported-by: tag for S=
echang as well.
> > > > >> Optionally, wordsmith the commit log with the suggestion above.
> > > > >
> > > > > Hold on. I don't think we can proceed with this fix.
> > > > > It defeats the point of fexit jmp patching and keeps progs
> > > > > pinned until a sleepable kernel function that were attached to
> > > > > will return. Which means that the tracing prog attached to "unluc=
ky" kernel
> > > > > function that sleeps for an hour will stay pinned for an hour.
> > > > > Let's think of a different way of fixing the race.
> > > >
> > > > I don't have background on the original commit being fixed, but is =
that really
> > > > realistic? Or worrisome even if it happens in practice, since worst=
 case the
> > > > program refcounts remains raised for that duration?
> > > >
> > > > We have similar worst case for programs too (e.g. using bpf_copy_fr=
om_user on
> > > > user controlled buffer in, say, LSM progs). At least here we won't =
be extending
> > > > any RCU flavored GP.
> > > >
> > > > That said I will think about alternative fixes in the meantime, if =
we accept the
> > > > premise that we don't want to pin program references in the image a=
nd keep their
> > > > lifetimes decoupled.
> > >
> > > How about having old trampolines skip freed programs instead of keepi=
ng
> > > them alive ?
> >
> > Isn't it doing it now?
> > That was the whole point of patching nop to jmp in a trampoline.
>
> Just to be sure we're talking about the same thing, you're referring to t=
he
> "ip_after_call" patching done in bpf_tramp_image_put, right ?
>
> My understanding is that this only helps in the case where a task is in t=
he
> traced function while a prog is detached. It'd make it skip all fexit pro=
gs.

Right. That's the one I meant.

> But if a task is sleeping in a fexit.s prog for example, it is already pa=
st
> ip_after_call, so this patching would not prevent it from calling a secon=
d,
> freed, fexit prog lined up after it in the trampoline, no ? The same situ=
ation
> should happen with a sleeping fentry.s prog followed by a fentry prog.

Hmm. You mean like fexit prog A called a sleepable kfunc and
another prog B is attached to the same trampoline.

Then the trampoline needs to be freed. ip_after_call patches jmp in,
and trampoline proceeds to free progs A and B.
B is freed right away.
Eventually A's kfunc returns from sleep
and jmps back into a trampoline
which is not freed yet, since percpu_ref keeps it,
but prog B is gone, so it attempts to execute a freed prog B ?


> I have a reproducer for those scenarios that crashes bpf-next. I will mak=
e it a
> selftest in v2 like Jiri suggested.

Please narrow down the reproducer (sounds like it's a random stress test
at this point) to specific steps.

If my guess above is correct the reproducer will be short
and deterministic.
