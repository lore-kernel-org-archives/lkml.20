Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E61D2C027C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244131; cv=pass; b=UR3EPlClZ7HaHOdlXQnzqImBt8fFe6YDCALpoFUxuyY8owwJDSzoMppUCnbSLw2XaB1Zs1iV5Z6yj/W9wgXu0sMWPBgVLlkIe+z/qjFkZ9Ct96Frdjh8T69TkRT4UhETZdsofpuyxJ0x3NvY5Ni8OKphmL295h1aafXdADYRqNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244131; c=relaxed/simple;
	bh=aF/YUsfn15Am1lyN4UTB4NRsRKQjq3M/wl+L8J2wO2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPb9SWYexLlXtBRVGYR3iPQxeb/ya6N+uYgV2j2QwYqOVBSNesMmwFXO0gFwY9880tIQoDV+U382UFPpW2fGcwh4h2vwK1TMNWBK0dqBBtvgRf7TyPfPwvS++ArG3RCmEXq8HIR1KG87sgpJi19WoZQKi368IL6V5Ckupn4kmpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYsq+CSd; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYsq+CSd"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43f9b119so28944377b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790244125; cv=none;
        d=google.com; s=arc-20260327;
        b=W6u3b2snlUhxrk1HrVSojesCDJLK2dzIBuEgiWBNiWmoI3kp+jp3V1/P7vnx4cDr05
         FRKTrXI8GLBFXWMZpBd4GgH6vCqvxjLjm0/arz2BwdoOdrsYKbxErG9I/icW66YXu+yM
         rPDE+SiIonI4gB+hKr8iVp13j+j14+H0L7Svl5lXwLkOKV3fQ5mWH5EmshCNHYwA/iWJ
         YzI17xXafY2g5A1PFrmbSZJs1e0u88chrCNOjgX/jrwwb07jh74eoxSW+RjbtAM4Lp3h
         FMX5Ak1RMCUZ9D5JWdAMAKH64RFGAAHsjGtqYr9KcNB5/wrdx9k/TIgADXwFgELVkkGN
         rg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yf2eXBIzfUAyDI8YQcFwCnYg3j6ep9DZNkN0GsU9MPc=;
        fh=d4VZMYiMI6piY9iosurz3dYnJN3yV4m/HhY7AElVanY=;
        b=jebfHQ4ACwduBbkQGw1q1HLLFUBwfHhdNLPl18cjMZwNBaFnhhmq/+5or4sNTmnE+l
         POJOblZIu23dk3JGZkJb+ek3ZHTdeGrzrP3aAXM4T3H20MDEnZzIuSXiFmqBnTNfBu9g
         KNISgy0f+O0Jmc4q1pi1YmFh4YWs7si34p23CaUP7nUh5hwqHCmMEQ5H1w4KLciwsIN4
         K1VPiwlBdGhDEd3JhC6JmqZhZPR9ZscqZZcgBDKngiTkjnh95ELYL1KsUfwoP7CLF2yL
         MHOeYRbRiEt0MRwO5m/ul+24BwHVUU13wCvZ7GeD0FURZ6aZq09Rkh4dUEdrKzjUcZ0i
         AFXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790244125; x=1790848925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yf2eXBIzfUAyDI8YQcFwCnYg3j6ep9DZNkN0GsU9MPc=;
        b=nYsq+CSdFf6UwoKKyCvz6nEEOorVQdkseLHJvEJvXDWZu7/Cd6KiZ3SybDgb2JJNBW
         o2QWy5B3QwiaPEdZr8GVaw6fjPdEDk4f9S/oNn/COfRmpqT0Z8nQZniv7LJvfs/lzT5T
         Mwnt7HFz71IsOcsMbZP34yEkgs5WFwIVJVlIZeJC0lQzhA5vG9PJPHfM1Vr1RPxRJdSN
         /b9T5exi3QnNlLXD+Hx0A/hfNIgJzwnztvyigFStDJBI4Xl7/kajYOvW3F0J7iS1tt/5
         84osfU5tUFwgk7NzYaNv5fMeiZIkXRVCE4zPO9eXap3NLrTRUe8JiN1JiOAZ19yqSmC+
         iSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244125; x=1790848925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yf2eXBIzfUAyDI8YQcFwCnYg3j6ep9DZNkN0GsU9MPc=;
        b=0Okr9uOX7t2sGMzLrS8P1B29QenFS8o/XvnE/EKZ1tPvlaMmjtT2n3ttut4xVVcAME
         xpUUEJuFhW8mR95MNf2zKW6K5sMApNwfR7WjMuswTOoCbZQFcmypw0I2iNYk4c4cw7GS
         Pf4sbpkNqu8s64XGAzVy9g4rGhoFmWU36p/6tkwFVY9a+28QpJNN2QQzsTnFszfbbFI5
         VKc2xj/3Tm3fDKqDSJoaK3shFi/F0WjL90MOLXpMXk6uqry8muihB5Ifq1R5jcVDQ8V4
         CUDN14S1VqWtEm2zFwkFQl27UpN1aVvQ4JW6zzJHj2MC8S2Fp7HeuaLqXU2i8RfqENj+
         im4A==
X-Forwarded-Encrypted: i=1; AKwUvByQJWRWd8xu6uUZP0VZ+HFC6+iPG9qGyYsnD36Nqgj3KyCWROQYMZks5+OAr7Il5AqVqsqZ1U3oLOlVLHU=@vger.kernel.org
X-Gm-Message-State: AFuF++kxZrrDlPfXnjophkNuf/dj8E/3OVmyY5GCsPgSrlf5I6iFy0f6
	QeurOQI5VC5iaRBt63PSez6FOOBeoVwvwOfjhx6tmY7nF9fKYrmBtGgqj7X8aXROcURqcWD42WF
	N+Vn7tyAysB0zxzDqq7qRfqQRJd3QflQ=
X-Gm-Gg: AYBFou1Dp3F4OaqK2eLU8RQ8zKy1RHk/3X4ugs6ja5n3YQPfFGUKKk2gYofrcWqH/ur
	xGJ1my8BGtbqyDgCqcEvgEJLEmdxIeZPco/nDh20LCq44zKpYcq4dNfmsht0yXUe27pi1gB2pnB
	f6O29ODJMrXQK7UWxZgPS1N+kRtOJC5yTDkKx+D5mswEg02eiIPxD7oN4zNqBer3HJicquwv9OW
	+Urx5mobMUYL0YfW5RA5RvQRKchPXHmn4A3Y66CUF2WZl97W1z16uZFF8wLkNvVgtv/cfl5Qkv1
	brRoUhmyhbBaVMgFE8MQfjDES+YOOs2Gk7j5hZthow4ILrYu4l5ht0/HRiygU6N7EXcBIxBBAHA
	KuTqE3UbWAnzTQCQxY1Bq1W4=
X-Received: by 2002:a05:690c:e3c3:b0:869:1ab2:33aa with SMTP id
 00721157ae682-8a645aae281mr9464687b3.20.1790244124691; Thu, 24 Sep 2026
 03:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921192559.2619635-1-shakeel.butt@linux.dev>
 <CALOAHbA4EgGw_uWfbXD0Q87exP7ek=z9ENuU_ARgb+DgBgy1kQ@mail.gmail.com> <arPyspcEFNkqfNyr@linux.dev>
In-Reply-To: <arPyspcEFNkqfNyr@linux.dev>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 24 Sep 2026 18:01:27 +0800
X-Gm-Features: AclHuK-I9uw-yPD5uF_5nJaKC0fsPFwXnig4t8YGhNpVyr0Q5duPYTUrOw96ia4
Message-ID: <CALOAHbDKRw9cPN_GxOYbp9u50cvr7PzPyoGPsSwoPDPAwBCGbA@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 11:47=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.d=
ev> wrote:
>
> Hi Yafang,
>
> On Wed, Sep 23, 2026 at 09:07:40PM +0800, Yafang Shao wrote:
> > On Tue, Sep 22, 2026 at 3:30=E2=80=AFAM Shakeel Butt <shakeel.butt@linu=
x.dev> wrote:
> > >
> [...]
> > >
> > > Known open questions
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > The semantics of memory.high for remote chargers or kernel threads is=
 a
> > > grey area and this series does not aim to resolve that.
> > >
> > > Another open question is whether a bound on debt deferral is needed. =
At
> > > the moment, we think that rather than putting a limit on deferral for
> > > memory.high, it will be better to handle that through an async worker=
 like
> > > memcg->high_work.  We aim to introduce that later, along with the rig=
ht CPU
> > > accounting for that async work.
> >
> > Hello Shakeel,
> >
> > On the open question of how deferred debt eventually gets paid: would
> > it make sense for the policy to also notify userspace (e.g. via
> > ringbuf) when it defers,
>
> I think the notification through bpf programs is already possible and a b=
pf
> program deciding to bypass memory.high can already do notification via ri=
ngbuf.
>
> > and have a userspace reclaimer do the reclaim
> > through memory.reclaim?
> >
> > I understand one of the concerns for the async worker is CPU
> > accounting. If the concern is that the kworker's CPU usage is not
> > charged to the target cgroup, the userspace reclaimer could instead be
> > spawned with clone3(CLONE_INTO_CGROUP) so it runs inside the target
> > cgroup, and both its CPU and memory usage get charged there.
> >
> > One caveat: intermediate cgroups with the no-internal-process
> > constraint cannot take processes, so this would only work for leaf
> > cgroups.
> >
> > What do you think?
>
> I think all of this is possible without additional code and with this ser=
ies.
> With AI, should be very easy to prototype it. Please take a stab and I wi=
ll look
> into it as well (time permitting).

An LLM helped me quickly implement a userspace async memcg reclaimer
based on your series, and it seems to work quite well.

>
> Thanks for taking a look and also please let me know what other ways you =
think
> memcg can be customized through BPF in a beneficial way.

Sure. On our production servers we have been running a set of BPF
programs to tailor kernel behavior for different workloads =E2=80=94 all of
them global programs so far =E2=80=94 and I believe they are all good
candidates for per-cgroup BPF policies now that cgroup-attached
struct_ops is available. They have been really helpful in our
Kubernetes production environment. I have sent some of them upstream,
such as:

  - BPF-THP
    https://lwn.net/Articles/1039689/
  - BPF-auto-NUMA
    https://lwn.net/Articles/1054030/

Perhaps we can revisit both of them and turn them into per-cgroup
policies =E2=80=94 what do you think?

We are also running some custom BPF programs that have not been sent
upstream yet, such as:

  - BPF-async-reclaimer
    We don't care about the CPU accounting of the kworker, so we just
wake up a kworker to do the async reclaiming.
  - BPF-fault-around

Both are really beneficial to our workloads, and both are global programs t=
oday.

We are planning a few more customizations to resolve painful
production issues, such as:

  - The long-standing inode::lock contention caused by dentries [0].
    We have not started implementing it yet, but we might introduce a
memcg->dentry_limit or a memcg->vfs_cache_pressure as BPF policies..
  - cgroup-level readahead.

So, to answer your question directly: for memcg itself, the beneficial
customizations for us are the reclaim policy (the async reclaimer
above), the dentry/vfs cache pressure knobs, and fault-around; the
rest are per-cgroup MM policies that would need the
struct_ops-to-cgroup mechanism generalized beyond memcg =E2=80=94 which is =
why
I hope these use cases can help make the design more generic.

[0] https://lore.kernel.org/linux-fsdevel/20240511200240.6354-2-torvalds@li=
nux-foundation.org/

--=20
Regards
Yafang
