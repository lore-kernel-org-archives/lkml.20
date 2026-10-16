Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32C3988E3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138738; cv=pass; b=Ybv41ZDcAsDafcwXERwGK3vwtwWnu5D48Hmez6LZxi4bM1nprc4cH8iFOvViQEJtZ27nBgP6BeigtDhQ3kF5X2VIGZnC0Ps2FeFiscQdjMWoInanGQouwAYMRroTq3W83goFHQPlvlPgA5T4oe8M2V0aHiY5X6P3akrUNNRDxEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138738; c=relaxed/simple;
	bh=TJpRkoynlry2geAXK8OkwmCvIsCu/qH7mlFTnmgK4Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfZPx+PofNr0thmbWw/UXkc+Nt9JexQAJ8MEZkjVWQ8ARQ+8wNAKBy6yFztwy0+iZ5CxB9Qyil4Z44sgGpnhWbeBr59iKXRuGeUFSSj8pe5PiZwjh8cPTpBFGkBAHhsnJWjGL2aaxpLNHlPt3tnERxIfN6Y282MotZ8nN1g5iLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDctdG3P; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDctdG3P"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66c9995ca60so802208d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792138736; cv=none;
        d=google.com; s=arc-20260327;
        b=J1+FjLsCCwNYtqh5U3DChiIJo+qhoqn2r04KNMy93YJ8cUsQqDwmhC9+zO6v3r4pDN
         7lUpWQIOrc9PCI5MGxxCtGnmazcVIKOEs8Km6SZ//l8Nnp+3BEYFdGFo8f0ZpBEpuyhf
         wfC2inNSF9EbWOoi2BZZB1JnmxoBNs+3hBRwfydUSAHdwFgeR/txGVB2B7cXgZP8iQWp
         lbnADINM9Pg+qufpxuXQxbJfYVbrd7rdbfAb7OOQ7ZDmMRClTY+eSCFrS7cJrzrQPn9h
         pobHsPxayseVROK5spUE1CYt/jo9l8gPERRT3s1cwov1VqhqC1FxLX0a5rwGRng/7cZl
         0Ekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jP1ajt49g9ePjtG83cMVBJePTr3Nno+FbpJNYv5nwM=;
        fh=bwsUm/9/WGCPBI1MJMSP+EiqfCAzNGuwKO+IzA2fe0g=;
        b=K8459M6smuj0BtMVaZFvUpEU3jIjx+GW7DbNSgtwqEUA06voNL3DApvGhGSSBFqvzg
         RFAZT1LauReDSBkliy/lqwwPuBT7s767buzTrV/KZ2acF7ErA+460IfBNP5Vmdfn2sjO
         DGd0130f6U/+fKteaNv5va2QXYbvaaYSX9r2RdwxCc9x9pJ08yyItl5Mwsuz5ihBaI/z
         yw5Bx8X4Hcsr5tR59ITQrOP9Lhrb342HAyOQ61QNxru2GeEb+++jjZR9zeN5ErgEgQ87
         LY+w3C+VypjiIMTUK3X3u6n5N6BMbphFOxWNl/bDot0yaSWJfKJwBXSB+q8v3JkE5QY5
         3rZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792138736; x=1792743536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jP1ajt49g9ePjtG83cMVBJePTr3Nno+FbpJNYv5nwM=;
        b=TDctdG3P3hqBv7Kmp9O69TG/m8pZWfGK3WkV8CEODNgKQ4ETVbdNSk6ewwgHGYwaRe
         O8U2S4+OqkYRsjloampfShtwy4XKMrVtbQw3Bk1nlCT/uB8UyKFl9/Ozm+3UZm7F68ZS
         lcaH0omgr4sMqtAXnmzZbF40fWYU2J6/JGISbJTo1MlrLItg/f9eVjGcmGc/TbM1xPmG
         nVU23PzrABXRfa+WHOQJjPZDqcjmVNRHD9zxDs2V451VykC1BiHMn/woKRYcsSoyryIV
         slCadhfuKr0QSoyFzna/MrQ0eHMR/ZgjJWOWAq/l3I47zBkVdb9NFmiku2rGoa39pO0/
         iwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138736; x=1792743536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jP1ajt49g9ePjtG83cMVBJePTr3Nno+FbpJNYv5nwM=;
        b=HzOQbdoBqZCitLtPchpBAiw/f4Jr+cXk8SLoQNGTL9O09b2LV8bZ2FPdtJEwf5zGCw
         a5YjdTcSAkQQ2A1dGVNy9ZEmJGo5KTsq2zFNmScnltAeLMq0EYumYi9IzHFkyjLz/GlV
         NTTWblGIHAOi5V3xCL2FxR3SZXFa1Rs5mTAu/VROAqGxceIXys6iYBMjo7lwBHVVvA5i
         QzQa4aurQLTs8kJgC96aHNh5XkW4lXgx6gXHuQUY/Ha/65GK2y/XUtFM8GnHaVcGbpL1
         NRIIHbFq6URi8bOJbF6NfkYKHMIcQx6pxlY3L7sa8oTl+ZRWSCib9ZX8t5ITn+KGTW22
         3X7Q==
X-Forwarded-Encrypted: i=1; AKwUvByXvd/QlcaHvGm5mHq579iiifI/l1ZNJcFMwD514GKIrlnpUKdpYe8aLmBOjFdVTrAQgb4gFvqh97Hg520=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLBvgxfpRejGj8g2VhOpEmsCUYaNeIHOr93kriuJ+PiYJiQmEj
	TjdCZyKfOIIiUjX48M5PQuFMW7lMJAVF5Xftgw+8RXvXiAhaT/W5NPHth4AqrDJeT6NVeeXXWMv
	c06leMlqzFAdVkB0xL2PDM9d19xY09bA=
X-Gm-Gg: AYBFou1cbd/JLHR/64D+B+PXEAx0sQiQ/htb7ba7JTCEFLlUNCFY2Gr/VUy5D032VvN
	Dg7ummOvTZFVWA6PhL9by4zCuhaA4rE0i/SQYQb+vzho0++3f7YUDyYJU6y8IWDhLWsfz91Q8MN
	EmBX46fXgsTj8szH1SdkOx70My2nF9xUAIhmJq9vSHjlZeuAmtp8+b7hsxo/4D8G0eGnWlmkAGJ
	fOOba4vncV1p8LQNEAgOMzNTMmpKLWX1cDaVpdzy8mcfvyxGQMeg0MpkxZxxgfKwNvYM93qg9YE
	lH88C3X1RV2nijd2Q9pbUXK8LWTkm5HhEPsKgbTfPUsgUuRuA4bIfNbvAdAIFFSHQ/Nq+xLUbHc
	Y95DT9Dom13Y05AEmjLuA
X-Received: by 2002:a53:ac8d:0:b0:679:97d1:439e with SMTP id
 956f58d0204a3-679b0e651ddmr785846d50.2.1792138735738; Fri, 16 Oct 2026
 01:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908122446.56708-1-lizhe.67@bytedance.com>
 <as3gQ8jfa_6eBf15@chenyu-dev> <CALOAHbBssx9ZHGwebGZCvzT4d_soyjNfZRj4L6gnxHRXtc7eMA@mail.gmail.com>
 <807eb0e80c76c3ccb85024b360bd47ace201931b.camel@linux.intel.com>
 <CALOAHbCt+iGGWMxzjrcRamdSqD48_v+V685-qi7_Qy7UL8bxxQ@mail.gmail.com>
 <atG4VXk4t-m8VubY@chenyu-dev> <CALOAHbDY6zLcEc4kGhC9GSFsOsREadkWN7Q4CmZuR_m_BMHAyg@mail.gmail.com>
 <bcabbe25-5b2c-464a-a22d-5375a342f938@intel.com>
In-Reply-To: <bcabbe25-5b2c-464a-a22d-5375a342f938@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 16 Oct 2026 16:18:18 +0800
X-Gm-Features: AclHuK9l0UDwRtdZnr0wuccDYOekKzVCW2ycclDkqHbzyqX2JXnysUW2dhrKAo8
Message-ID: <CALOAHbALpHebACLUmvet_tFH_w-iK3TWpY52OhYTUVoLzoGKkg@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/numa: Add per-process automatic NUMA balancing control
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, ljs@kernel.org, Li Zhe <lizhe.67@bytedance.com>, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	tim.c.chen@intel.com, mkoutny@suse.com, tj@kernel.org, chen.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:01=E2=80=AFPM Chen, Yu C <yu.c.chen@intel.com> wr=
ote:
>
> On 10/16/2026 3:38 PM, Yafang Shao wrote:
> > On Fri, Oct 16, 2026 at 1:51=E2=80=AFPM Chen Yu <yu.c.chen@intel.com> w=
rote:
> >> A more complex scenario is when cgroup A and cgroup B become threaded =
domains:
> >>
> >>                           root
> >>                          /    \
> >>                         X      Y
> >>                         |      |
> >>                         A      B          A, B: threaded domains (thre=
ad roots)
> >>                        / \    / \         separate memory.max / io.max
> >>                      A1   A2 B1  B2       threaded cgroups
> >>                      ^        ^
> >>                      |        |
> >>                      +--------+
> >>                    want to share one cache group
> >>
> >> In the above case, we might need to change the deployed cgroup hierarc=
hy.
> >
> > I think we can enable LLC-aware scheduling for both A1 and A2 =E2=80=94=
 does
> > that sound right?
> >
>
> Here A1 wants to share data with B1, but A2 does not want to share data
> with B2 nor B1 nor A1. Enabling cache-aware for A1 and A2 might not help
> in this case.

I'm not sure whether this is a real use case or merely a theoretical
one. I'd suggest we not focus too much on purely theoretical scenarios
unless someone can demonstrate a practical need.

>
> >>
> >> Suppose threads in A1 and threads in A2 belong to the same process Pa,
> >> this reminds me of the cgroup bpf NUMA balancing case: after enabling
> >> NUMA balancing for A1 but not setting it for A2, what would be the fin=
al
> >> NUMA balancing decision for process Pa, is it enabled or disabled?
> >> The NUMA balancing scan/invalid seems to be per process, so if we chan=
ge
> >> the setting of its threads, the whole process will be impacted. Or may=
be
> >> we should not enable NUMA balancing for threaded cgroups? Anyway I hav=
en't
> >> digged into your cgroup bpf patch set yet, let me try to look at it.
> >
> > cgroup NUMAB works the same way: the setting is per cgroup and opt-in.
> > For Pa in your example, since its threads spread across A1 and A2, you
> > would enable it on both =E2=80=94 enabling it on only one of them is no=
t
> > meaningful.
> >
>
> I see. I haven't yet digged into your code, is there a per cgroup flag
> cgroup.numab.enabled?

Right. I will introduce a cgroup::numab_mode field, but without a
cgroupfs interface file; it will be written through a BPF program.

> Would there be a logic in the kernel, when
> A1.numab.enabled
> is written to true, the kernel detects all the other cgroups {X} that
> contains threads
> share the same mm_struct as A1's threads/tasks, and then update {X}'s
> numab.enabled
> to the same value as A1, to keep consistency?

We have no plan to support threaded cgroups for now. If a real need
arises, the BPF program can be extended to handle it, which would just
require more kfuncs.

> In summary, if threads are
> spread
> cross different cgroups, when you set the enable flag for 1 cgroup, will =
the
> kernel iterates all the other cgroups to update their flags as well? Or
> leverage userspace to do that?

I believe this should be implemented in userspace, not automatically
in the kernel. Use cases are always complex, and flexibility is
important here.

--=20
Regards
Yafang
