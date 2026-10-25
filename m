Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792899398;
	b=SOiNASjn+GxHKpRU2O5DFYsQ4cbIvlsZ9n6hXAsqNMsijqalI/Kcdrlsasv/3xz63PPm
	 WQ/h5zVmytv9TIYBu/nYcgNci1uKlHLoSTS2+tQ0CdeJ6GniHYB0EsDSH1EBkobSmbNwK
	 rKRqp6dMclIiw+hLWkZ3Bsfa0XY4SSeleWYIpXVpJow6g4Vs0kzRzCpzSts2zLbsh5bn7
	 VDJwqBajSvPj3xAbWGKUrcypDn/JAcljarlDpY3ZosKxEX5EfilX6cQt4YYPJTuVYKpvO
	 X85pdQuTXV6YHS6SIpmUtmQRporp1m2saFRhuNu9RH+TN+F9MahR1AuEcPUfwHDDzhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DjKh57N4UF4L0vPTEmwKkugiAf2AMgqPZ3+VipYde0U=;
	b=4UmM3tjzDS3Ub2xa3ImrpQvF0Om+TdETeLTa8opu3WRVYFSiUHkClUE1qXprmkho7Wd1
	 NN4woo5EEY/n9C4YZ4WlU6fC5sGXN1cSrjqieVZ6C6ymx96xZB/InB4jOc6t8KJnouCXj
	 EWSpWdR4FhogabNpDIBE/S11aAs+ZIRtqUdE0DhHcU7z4yJOQhUSZHt/wnL//o2Nez08j
	 8ioCSwU2QvuxkOHW0yTzAOOHLnIXmWZCIi5yE78W+2SkhcAC7QpJx+JfWJ5pyEkdIWHa+
	 DK7MSmfOhIRA9dOSzmxhej5cAedM3bOK2DWJQAALT5J9affTTvuel4Tu/fhzJy1N9gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LeZq6DBI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3722606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3722606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LeZq6DBI
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-679334baa1fso2051712d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792899392; cv=none;
        d=google.com; s=arc-20260327;
        b=lRKqJm4dtePOILKq3W66P3uL07/hFPymdQWUxE7ja2Io7GY+SXtZ0dFMW/YMLWUaWG
         uGB/EDeQszxLSPB8EHo2MaBoDddSBAj957T7HI9JcQbrcnbg5/FUXGeRqrPoSvE3O0bx
         A5TF87UqpMUWMDbthSysLC6k9+w5LicWEvuzW3KhHVIYzbvwSYQZM/MNumAWKlu93Frp
         RkkpZOGsYVPWR10E2YWChK4RuX3uW203XwYcTIYgWwVaGSzNFnaj6diwae1gtusFVvgn
         v7e/biad5k2FrPDI3lT3wWpCddR8rENkB6ddKzKwL0s34yElSY4LUUP/qK1sGue23nKD
         giVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DjKh57N4UF4L0vPTEmwKkugiAf2AMgqPZ3+VipYde0U=;
        fh=Yvo0+kg3dxF0NqZja5uKyZkmqwgRMFXwGuuhaQlmRFI=;
        b=E/b8eB/v59AqeZUPKtLqs2DX5RRzCX07F350TFK44w4PrAP2dpuaRDOwTxRbwTou6U
         DrVzHkFdVQaKRYM4x/hzjk60ba3SwctGPvQxEwZfTZBy/f5kpbIr6ilf4wqCNaTrwctD
         jDXu+63JaOgUG6/Ryc/Oe3ORA8fqWSBmbxEuZYznbC3GD9ahGl3BIdnS5mt4++gbbMxY
         x09Lk4+hRX7EkOuXhz6XOjpeCt4DzXKE1TIzHOAixI21lF2rZv47kMLlbbLFbrhjImeM
         r3FIQh28tN4OJrgRz4HPTgmzq0K1YfHGjbivN3UbDVxVFfPvn1i760hkjkWdr8LxrpNF
         y+oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792899392; x=1793504192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DjKh57N4UF4L0vPTEmwKkugiAf2AMgqPZ3+VipYde0U=;
        b=LeZq6DBIc6AySagJ4h20GcT7Y5Ym0FgUVily4RFMHswaMVmTf3cY2VMsfzdZWu5zXX
         BMZ54TNQQDoRY1tcf1OiP+fqN3rVaR6wmL4DHf0MG8QKopQ9m7zCJeQ60e4w3mfIQI55
         0PtatJeBVWpbrPngvRuEXN8B1lUohAK6psht7aAVAtvTr6/IbAhko0bK7Y3Uz/dJV4oA
         iVx5HcZylhHvvqaEdAZkz2EJyvd08hcZbpvXzoZg+L5Bh7DXf/pCz7pCkYPdfnK1I78T
         2XBdvo6GSyaPrk3LL+iGGNpUEBtFYQhyZ0omidOMAQqD9p1i1Cs0SSrzPxFnIe9EY33S
         5SNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792899392; x=1793504192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DjKh57N4UF4L0vPTEmwKkugiAf2AMgqPZ3+VipYde0U=;
        b=1oRgAkaRJsCcffBbWNnyInalCPsPd5iS/hobMoehtV7au+ucJor6XYLk+wOKp2zlcC
         I/tW3SFV8wxvL3EBYxrXP+kabbhI+ADyDF2AWxYVGCIqDsuIkN5edeRkXTgWH3ENZJdR
         T+471MHMowsjaTWE4W2WHev26gEzlxkD8Jh1MFa+RSEOT1tjvX0Ye7CKP5S32KFWp5Gm
         43bwW7/ZkFoMGtqa0ycpVPzGSsWi6DIcMs2uyqwlOdh5CZnO0EreVcZ4wFxKXJkNwR++
         64WaDlKeUKOPTYpLWxRKvD04iCtmaSEYJUdH3xGL3PEq5NPVoFsBdWP4oxISyAYTSEvt
         ZFXw==
X-Forwarded-Encrypted: i=1; AKwUvBxNZ5lwvHBav4s/5IcmHvARyqVO9gWwgEIywXAfVoyRZD5VlVV262Txc7ri3+nxhdvTEncsFGcOLB/XrFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJumDUgdh+qF12QOBmsf+/LqjDplL1urKHjbMmomZMtO9fZ6VCR
	eY6ZzuN4Fo7ijFjvjYCQ0+qjF29ekKZg4hSLTxE68Ft8JETcJ1YOlbzrSzc3K6Kzg+UbaTzCSrD
	4r6N9oPbePKfwxp45vORxxkLST4vIu7g=
X-Gm-Gg: AYBFou1qcm/o6VZgzPztMEoFu6LTNNq+fh5ZOu85LEoc0IodyEtUJvNTGNhJZ42kWlM
	pO8SPawBj162nmFTrHvA784ssx3WUYxYuxo2XzSmY6HXK+w/FcSeVNhi2cFPTckkdzquADxOo1/
	3Da3useCTrZSIh3GkTFkfUyXybwxhIti94lfwjoRWxNwgRPCNvdWCs6J6mGIRu6iIp3eSvKq1Sc
	Te8Zrh4Vx0z9S4+AJK16WB44KczQ/K+FRXfSyxwQJ+LI8rU6tPGPm1qJwRArb3tSy8oBh/qQlhU
	VoxMQBqJwQP5+ZXAK3yg6MBqRsMkHOMHrPqNJwG4SPe6+K2ATtrWCCmiXZFLwLT/Bdqio20PN7Y
	/IdEDA4mifK+1WQao6zF7ZZ4rmesaBwnd+YvuQ2PNDrRwOCUFwvQnV6KLVWHIbfxv1nk=
X-Received: by 2002:a05:690e:1a27:b0:679:95cd:1aed with SMTP id
 956f58d0204a3-67a454bdfc5mr1270836d50.60.1792899391596; Sat, 24 Oct 2026
 20:36:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019064157.29885-1-laoar.shao@gmail.com> <f68e7f9e-6037-4087-b7cd-a17ea4dba279@bytedance.com>
In-Reply-To: <f68e7f9e-6037-4087-b7cd-a17ea4dba279@bytedance.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 25 Oct 2026 11:35:55 +0800
X-Gm-Features: AclHuK-Ie5-cJruVMuWsByPpF2E5memGw2rPj5uhPsydhaudr0vHLSJ1wQm8wZE
Message-ID: <CALOAHbBP3n1uyC6qE-678ZNvh+12HSQ-H24xg4RqGtaZXKbL1A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 bpf-next 0/5] BPF-based per-cgroup NUMA balancing
 mode selection
To: Li Zhe <lizhe.67@bytedance.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, gourry@gourry.net, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev, 
	yu.c.chen@intel.com, zhao1.liu@intel.com, tim.c.chen@linux.intel.com, 
	bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:32=E2=80=AFPM Li Zhe <lizhe.67@bytedance.com> wro=
te:
>
> On 10/19/26 2:41 PM, Yafang Shao wrote:
> > The Problem
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > In our large fleet of Kubernetes-managed servers, NUMA balancing has
> > been historically disabled globally on each server. With the increasing
> > deployment of multi-socket AMD EPYC servers, cross-NUMA access has
> > become a critical performance issue, which made us reconsider enabling =
NUMA
> > balancing to address it.
> >
> > Enabling NUMA balancing globally is still not acceptable since it can
> > introduce latency spikes for latency-sensitive workloads. What we need =
is
> > to choose per workload whether NUMA balancing runs at all, and which mo=
de
> > it runs in. A latency-sensitive service wants NUMA balancing disabled,
> > while a batch service wants its PMEM-resident memory promoted when hot
> > without paying for scheduler-driven migration. No single global setting
> > serves both.
> >
> > The Design
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This series introduces the fine-grained per-cgroup NUMA balancing
> > control. It grows out of Tejun's suggestion to store the existing
> > NUMA_BALANCING_* bitmask per cgroup and expose it through BPF kfuncs.
> > cgroup::numab_mode holds the request: NUMAB_FOLLOW_SYSTEM (-1) defers
> > to the global sysctl state, anything else is a bitmask.
> > bpf_numab_set_mode() writes a request, bpf_numab_get_mode() reads the
> > combined request of the cgroup and of every ancestor back. The hot
> > paths walk the same chain at read time behind a static key, so while no
> > cgroup makes a request the overhead is one patched-out branch.
> >
> > An opt-out wins and binds the subtree: a DISABLED request anywhere in
> > the chain opts the cgroup's tasks out entirely. Otherwise the requested
> > bits OR together and the kernel reads them independently, the way
> > kernel.numa_balancing reads them, so a combined NORMAL|TIERING engages
> > both modes. A DISABLED request only speaks for the cgroup's tasks,
> > never for its memory, which follows the remaining requests of its
> > ancestors.
> >
> > The cost of the additive combination is that an ancestor cannot cap
> > tiering short of a full opt-out: a descendant's TIERING request
> > re-engages promotion for its own memory, and promotion is the mode that
> > consumes the shared fast tier.
>
>
> I am not sure that this matches the usual cgroup hierarchy semantics.

I think the usual cgroup hierarchy semantics being invoked here is
the semantics of resource limits: an ancestor's limit binds every
descendant.  That is the right semantics for limits: a limit
partitions a shared, finite resource, and what a descendant
consumes comes out of its ancestors' pool, so an ancestor's limit
must bind every level below it.

A policy request is a different kind of knob: it is a preference
about how the kernel should treat the workload, not a quantity
drawn from a parent's pool.  Nothing is consumed by expressing it,
so the limit semantics does not carry over; the question is only
how the preferences of several levels should combine.

We chose the additive answer: a descendant may ask for more on top
of what its ancestors asked for, while an opt-out at any level
still wins - DISABLED anywhere in the tree caps the whole
subtree.

This also matches our operational experience with policy-type
knobs in our Kubernetes fleet: letting a child refine the result
has worked better than having the parent's choice bind the child.

So with
                      Pod     (NORMAL)
                  /              \
  cgroup-A (none)  cgroup-B (TIERING)

the effective modes are

                           Pod     (NORMAL)
                  /                      \
  cgroup-A (NORMAL)  cgroup-B (TIERING|NORMAL)

> If promotion consumes the shared fast tier, why is a descendant allowed
> to re-enable TIERING when an ancestor cannot cap it short of a full
> opt-out?

Promotion can't make a cgroup consume more memory than it may
already consume: it moves the cgroup's own folios, within its own
memory limit, from the slow tier into the fast tier.  The cost to
the rest of the system is placement contention on the fast tier,
which each contributor's own limit bounds.

What an ancestor can't do now is cap only tiering while leaving
normal balancing available below.  If that targeted cap is wanted,
the natural extension is a negative request: NO_TIERING would
propagate down the tree like the positive requests and mask
TIERING out of the effective mode.  With

                  Pod (NORMAL | NO_TIERING)
                     /            \
            cgroup-A (none)   cgroup-B (TIERING)

the effective modes would be

                      Pod (NORMAL)
                     /            \
            cgroup-A (NORMAL)  cgroup-B (NORMAL)

For the RFC I would keep the modes minimal and add NO_TIERING
as a follow-up once there is a real user for it.  If you think the
targeted cap should be there from the start, it is a small
addition.  What do you think?

--
Regards
Yafang
