Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF55AEC61
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161660; cv=none; b=lyq3zO1NLj8CpcZYfud3c2tL3x8ziYXIEJHizhlIiT8XFD50Fn+nw9Q51PN6zkbnee9velBsiwDN0fk6mN+XoC6LD5lHX8B/pd1YYnMrj7tnTCnAhqveXvdBeKh2gEPE/lHa9x4KCOeYGOkSOTPcrHsiBtRc1P3RtLqLx9dR2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161660; c=relaxed/simple;
	bh=1XT7Ndf17FSIWj8aS7sC43q1scDyv8QK36IlTruSUEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4k9er7+qBwZ8rxNNoIwP6LkYiNyjlJT5rUG3nxNeq5M2w3Cjx7yIJHN8VAlIs8haEV4pRr08zqJhqZWn7J4kPKO47Xb0ydNQGy9WVS98leGkVZj6ZXqiW7T1hry3DBWpQdVVGGFCe2XkCTgDNKBO7eO7nKSTNon7SL9uoTSq5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtNc2rHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtNc2rHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924B51F0089D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789161657;
	bh=bYi+BLcDxpGEvH8TRFhgsxjlizIH3+JRxRD7LLGvT8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dtNc2rHQtWIObd/DI/ApVeqzSQNXUd5s6VPhj4i/TV6agec3+bbNqYhrNOPh4K8fg
	 BIrklNUVaLk+sAVnauNPFcw6npJGzDGiJ76UfZKi4DyEBNOIowrc0b92AcJaMiAPlc
	 gQwo9UXhkKIasdqcLaN0toFekM0+KsTDfKc2ReccbxNBUYkyEBbmcsfGmvH5NgzSn9
	 n09EToGNkcYL6LN0XwQbFi1UzKAvcos3XzAmjlfom6VQJmLz3bMyhT4+ftDXM3AQ9t
	 b297P9sNrDqqJDHY14KoInNCQxoGn3vRu8i/YJ/FzI+ODxI737ZWMsixwY7+acirZW
	 5GiB2PhdWFaVg==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910c3d02aso12986085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQmABC3YyyeEv+vmo20N0QuprMIu8e/Dx/Uhsk7w0XI+9BB4O12RMsBXM71bhPWULAvGKy51KLYZv7HyY=@vger.kernel.org
X-Gm-Message-State: AFuF++l14Czf/hM0dNPcwQeCqc9W72Ae6nVkwOwvOWPcsbGx1vIM8kVT
	6GqP24jwU1A3tzbQ2nqw2QuiApFSr7olGLQ7G/TMZcJaPAs5hVC7WqF4sORUBnSpr5A0Xo6bVWW
	Th+T3MkW2EGVRobMXuEdTZFCS69tD0f4=
X-Received: by 2002:a05:620a:880c:b0:939:83c1:d8c6 with SMTP id
 af79cd13be357-939e8b079e4mr730453685a.8.1789161656904; Fri, 11 Sep 2026
 14:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818225904.55236-1-baohua@kernel.org> <08f63301a58f0e0c38480553295ad9af95928da6.camel@amd.com>
In-Reply-To: <08f63301a58f0e0c38480553295ad9af95928da6.camel@amd.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 12 Sep 2026 05:20:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yjHqSFtmHrRKgE1JrJpQKw5oBs1cuX1_mQ_r0wKdMdYw@mail.gmail.com>
X-Gm-Features: AcwNN1Wj6o7DDMeN04SnJ_ORbzq-MZuYZLrVkODVnbcFIGbkDcBF9Yh9yxqPI28
Message-ID: <CAGsJ_4yjHqSFtmHrRKgE1JrJpQKw5oBs1cuX1_mQ_r0wKdMdYw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/4] mm: enable lru cache for smaller large folios
To: "Garg, Shivank" <shivankg@amd.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hughd@google.com" <hughd@google.com>, 
	"npache@redhat.com" <npache@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "david@kernel.org" <david@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dev.jain@arm.com" <dev.jain@arm.com>, 
	"surenb@google.com" <surenb@google.com>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"usama.arif@linux.dev" <usama.arif@linux.dev>, "ziy@nvidia.com" <ziy@nvidia.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, "liam@infradead.org" <liam@infradead.org>, 
	"joannelkoong@gmail.com" <joannelkoong@gmail.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ljs@kernel.org" <ljs@kernel.org>, "lance.yang@linux.dev" <lance.yang@linux.dev>, 
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:39=E2=80=AFPM Garg, Shivank <shivankg@amd.com> w=
rote:
[...]
>
> Thanks for this series.
> I tested this against a Graph500 regression with 16K mTHP.
> The series removes the regression and reduces folio_lruvec_lock_irqsave c=
ontention to approximately the 4K rate.
>
>
> Tested-by: Shivank Garg <shivankg@amd.com>
>

Thanks very much, Shivank. I=E2=80=99m very happy to see that
mTHP LRUCACHE not only resolves your regression but also
improves the performance of your case.

As discussed with David, this series will be respun after Hugh=E2=80=99s
work[1] is merged.

In the meantime, I=E2=80=99d really appreciate it if you could test an
updated version that I haven=E2=80=99t sent out before:

https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/log/?h=3Dm=
thp_lrucache

It includes some modifications based on Sashiko=E2=80=99s review comments
on the version you tested. I=E2=80=99d like to know whether it still provid=
es
the same performance gains you saw with that version.

[1] https://lore.kernel.org/linux-mm/e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@g=
oogle.com/

>
> System and Workload
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> AMD EPYC Zen 5 System, 2 sockets, 160 cores/socket,
> SMT on -> 320 cores / 640 threads
> 2 NUMA nodes, ~512 GB/node
> node 0 CPUs: 0-159,320-479
>
> Base: v7.3-rc2+ (50d05c7c76c9)
> Runtime: performance governor, preempt=3Dfull (lazy)
>
> Workload: Graph500, Scale 27, edgefactor 16
> Metric: median_time in ms (lower is better)
>
> Bind to node 0 with numactl -C 0-159,320-479 -m 0
>
>
> Performance
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>                   Base       Patched    delta
> 4K                109.60     109.11     -0.4%
> mTHP-16K          144.10      99.00    -31.3%
> mTHP-64K          104.75     104.25     -0.5%
>
> mTHP-16K was ~31% slower than THP-never, due to lock contentions.
> With your series, mTHP-16 performs ~9% faster than THP-never.
>
>
> The dominant folio_lruvec_lock_irqsave entries were:
>
>                    Base                  Patched
>                contended  wait         contended  wait
> 4K               834603   2.41 m         844193   2.61 m
> mTHP-16K        7008834   28.88 m        840695   4.87 m
> mTHP-64K         188144   752 ms         40874    93.46 ms
>
>

Best Regards
Barry
