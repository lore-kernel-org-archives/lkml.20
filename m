Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379B377A8B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565840; cv=pass; b=kb8p9IrsskYanDlbK56bb8jgpBirdEXhaD8X/kW0pAJ3hPb53kH0aGMCl+olDbQMYLA7UoLyn2LcEOtWkqor1aKfBjY52qwHWTLC6/fse/mDr55LJsA48AZJVaDsmOd71dOv+495e1DDcpypYTwHJ6GX/IMm7xuLoYsz9tQeUJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565840; c=relaxed/simple;
	bh=t1IQEqIjCBwZZIxvdliQr/avoVNu2GRtPs5ChSnYCfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=op6oaQSYQDCg8XjLxpk0Rsoag8FIzqZuyw3tVJOKXqN9jHeBbcOtxqxuf0PkfOKoEkHlLRTBjJUQzNiLie9504EDkdNHRz99g3j7vfJ+hkQwgGyD2FuX0p0hmmBQnegpid8BGjivscGVYgJbVMuiLbpoabWkU+AFkPq7+fSlqKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrxXDM8D; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrxXDM8D"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a87fe69060so15798037b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790565837; cv=none;
        d=google.com; s=arc-20260327;
        b=eznz0oVxwFgT745NreZvN3HEIdZqF/beeK7hPLn3d7ZHcGP6rXPFX2Ht+W9Zc3mF+f
         nkG6b/7armsfcNdFhpJ5nrhhLXrNimOqp90FnWw9XI9Uv5Cte0tNoMv+Yleo47RlCmSW
         xio4f9O+AwwOC9ecvPNCJxo1UqDMPvBohfh36pegZ5ATjNQlTv5Q2b6LlhES4wEClyW8
         okxS3j2bETUXz9m0rKLeyFCy+MGsJqRFRrxb8w4/hrFAsR3o9CCk9Q1bEzBd1vxXuRx3
         o2PWfII+KBc8oYVTtoeB3IWG7V7ijTxzTG8z0/d0qle6Qf6b0/GIrnaBXnsgqduOh02o
         ih3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1IQEqIjCBwZZIxvdliQr/avoVNu2GRtPs5ChSnYCfg=;
        fh=WUg81Bsn9VL1DHgsgQCsapJxJb7qp7QiIEXtVXW1sjk=;
        b=mY1tpSuMwV9ZzUF+qMGGjFL+6VeJtPUI+AsvSP1StSSpsTB6o8J9z5S5pyUfrB61LX
         Y10gB9gzdn0Dwrf81nfwtSbC8E1bITD3rNI3yr+yrWp6QPU+b3lwT8j/T3XIZm0vE3v/
         E5LUwRYBEz4GizKF9mZ/UPe8IeXwYkF6Y/KaRjDoNKN3VOqnOrH0E8nr/rj3fJ9/6LtQ
         Qrtg/a9fDOr2g2bvHjKDIMeAzKIWceTigeIaB90rRwc7PJrMALfuVdJldjzMAMsPQi8l
         rXVj/6foBITx/RHZfJF0yDswUxpwwkpsj0J3UlKUuBlSoizF62HH3j60GPwssLmoeiI1
         p3JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790565837; x=1791170637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1IQEqIjCBwZZIxvdliQr/avoVNu2GRtPs5ChSnYCfg=;
        b=qrxXDM8DVJbLM3aRXZ8qIGu8mwDVY6d45qU+d7J9x/Jn6S3Fli4QxLAc0VW0C6Olp7
         SM3oayTFpxisbV/PjdPpbifLlsQqNGb39LF9YfsZXGicPAlx4sZvzJ/4hvqfn+6USluK
         kkDtV706sLpAXCG8WMV460KaVjPSmL1sdl8qxRCZRigbxD0fiEvJ93q/WtdleAdi3rUy
         5qrl0nO3RW6nnof6qK/507/25yPbLtwO4tftv1L429vieHH+sg0SR47Po1nkdOoLxa+k
         RnCovbwgcnCa4/JO2fpdPh8BrIvXGl0L9QF2Ovx3Q+Ve7xwKwhWWNiWhME9aSafhlVcN
         An9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565837; x=1791170637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1IQEqIjCBwZZIxvdliQr/avoVNu2GRtPs5ChSnYCfg=;
        b=JSkROI90/J4d2dLhvzUxSvEwL9LwlvdIlUi8NShIS04NR7N8VDOKggr77U9lwlQRP0
         fyG8sudM8vRJtUIKERjENnWdfB2PPOSqhvJlY0njge8HHsmzc0O6FrV+lqLJ8aPVvJiW
         Vd3h7msPVrHLEvzszbPxZ1MtcWGxtadhCVGnZUEO4HEAkgLeat48kkZ0pkGJ1pTP/jXh
         37+/OiPNAbialzZKsiGfnNy1CwyZgXjo7KMhJ/azrI09mAfQ3qQvQJV6KTIDTyf3If+S
         NTd8QWFEB0e7qcQj+JoztbxY0ueM6Igxh3z5IynUJQq3p9C2rAGU88gbHgiYOz8D21BG
         NIRw==
X-Forwarded-Encrypted: i=1; AKwUvBy8isEQsH4+YzS6jMqVaeAd7I9txav/HUO27mAwv23y9lyOObT0PmxVP6vHhXMVI+SxXXE4Gqr88TuqQsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKNaJwXqnnmPaJovKZFgCqulNYuqzMv9rHmmvT5gM2EgMGcOPJ
	3Cl3b8IOQisN4umsdzv1nAsGcM7aL/SGliNGeomQS5BITojs3YSFXBJwR3/thVIYP0tOmSoCNba
	04UJ4XBqu+sraRIDeqVwToYamTZj/4jU=
X-Gm-Gg: AYBFou1d3wGuFTV+yhv22wBr04zoD+X6KXIQ3N6SbDDSyLe43uQky3EGhuS6UI70l6F
	sp9v8EDUMZeq33+ElEvKCEWjKS7mU1a3j4ACXyH3d5x7NMPvgGm9OhRAu0qEZa8onqLvC/yVA/3
	B8s08j2zCqxo/9FqcasbegGzsCnlCYpEjbFa5+eVI6LtrPmw1NKDH5kiZEA6cr6LPkN3rNpLGQy
	DLLn6FRsU1Pm1U49dHH1Ifv7U6q+TJ52smIS9LnioLKgZiyyAMoh7gWUjUVg/QItPN8t9GihaxS
	cr8oQ4fpgg4eneHmwdd3tJfadxhPp7YBgjoIkzWdNmRh0CWAlaE2fd+IuYRmZYsqabLTrVDVsR1
	UkTW2STqG2Joa/IMo1WCq5A==
X-Received: by 2002:a05:690c:c4e6:b0:8a8:4931:61b5 with SMTP id
 00721157ae682-8a84940aad1mr42888027b3.30.1790565837502; Sun, 27 Sep 2026
 20:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921192559.2619635-1-shakeel.butt@linux.dev>
 <CALOAHbA4EgGw_uWfbXD0Q87exP7ek=z9ENuU_ARgb+DgBgy1kQ@mail.gmail.com>
 <arPyspcEFNkqfNyr@linux.dev> <CALOAHbDKRw9cPN_GxOYbp9u50cvr7PzPyoGPsSwoPDPAwBCGbA@mail.gmail.com>
 <arWJBBOdvLsOSdCt@linux.dev>
In-Reply-To: <arWJBBOdvLsOSdCt@linux.dev>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 28 Sep 2026 11:23:19 +0800
X-Gm-Features: AclHuK_1E2YfKgYgZbd4tDw3yFNtrrBUY1yd8dRRWaf2ogOVKnaFSdEC5R5Nlks
Message-ID: <CALOAHbCAtEixXTvRaF0qtGMjNwMHtYBL1eQU6GMgduRaWPGOmg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] memcg_ext: memcg policy through cgroup-attached struct_ops
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, JP Kobryn <jp.kobryn@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, Michal Koutny <mkoutny@suse.com>, 
	Amery Hung <ameryhung@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Jiri Olsa <jolsa@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, hui.zhu@linux.dev, 
	Donet Tom <donettom@linux.ibm.com>, Greg Thelen <gthelen@google.com>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, bpf@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 4:42=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Thu, Sep 24, 2026 at 06:01:27PM +0800, Yafang Shao wrote:
> > On Wed, Sep 23, 2026 at 11:47=E2=80=AFPM Shakeel Butt <shakeel.butt@lin=
ux.dev> wrote:
> > >
> > > Hi Yafang,
> > >
> > > On Wed, Sep 23, 2026 at 09:07:40PM +0800, Yafang Shao wrote:
> > > > On Tue, Sep 22, 2026 at 3:30=E2=80=AFAM Shakeel Butt <shakeel.butt@=
linux.dev> wrote:
> > > > >
> > > > Hello Shakeel,
> > > >
> > > > On the open question of how deferred debt eventually gets paid: wou=
ld
> > > > it make sense for the policy to also notify userspace (e.g. via
> > > > ringbuf) when it defers,
> > >
> > > I think the notification through bpf programs is already possible and=
 a bpf
> > > program deciding to bypass memory.high can already do notification vi=
a ringbuf.
> > >
> > > > and have a userspace reclaimer do the reclaim
> > > > through memory.reclaim?
> > > >
> > > > I understand one of the concerns for the async worker is CPU
> > > > accounting. If the concern is that the kworker's CPU usage is not
> > > > charged to the target cgroup, the userspace reclaimer could instead=
 be
> > > > spawned with clone3(CLONE_INTO_CGROUP) so it runs inside the target
> > > > cgroup, and both its CPU and memory usage get charged there.
> > > >
> > > > One caveat: intermediate cgroups with the no-internal-process
> > > > constraint cannot take processes, so this would only work for leaf
> > > > cgroups.
> > > >
> > > > What do you think?
> > >
> > > I think all of this is possible without additional code and with this=
 series.
> > > With AI, should be very easy to prototype it. Please take a stab and =
I will look
> > > into it as well (time permitting).
> >
> > An LLM helped me quickly implement a userspace async memcg reclaimer
> > based on your series, and it seems to work quite well.
>
> That's awesome. Please do take a look at the code and provide feedback an=
d if
> you don't mind, a tested-by tag would be awesome.

For this series, feel free to add:

Tested-by: Yafang Shao <laoar.shao@gmail.com>

One nit:

Since we might extend the cgroup-ops to other subsystems, or even to
the cgroup itself, could we define a more generic CGROUP_OPS instead
of CGROUP_MEMCG_OPS, and also rename `struct bpf_memcg_ops` to `struct
bpf_cgroup_ops`? This way, we attach to the `struct cgroup` itself
rather than to a specific subsystem.

--=20
Regards
Yafang
