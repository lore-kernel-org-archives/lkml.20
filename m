Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980574315F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774352; cv=none; b=ErdVlB69a9XK86k/wDAO0JBF9EoJofY7L6Tne/p22PY+P7FwDOd7LGmmAujW/EpQ0gGd9skL05dxTQdVk7yjesnFbIlNP/cY8rQACCbzpS4+RTrXHOCkfth2fwzN+HuhSKDX4GJvX4wY3Tq8ZCNpxO1hgtARrUxSOUAnW/QJpxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774352; c=relaxed/simple;
	bh=HFJ3bTcdbmrMb1MjB0qjlxO4NeEn7LJaB/BqUK+sTCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLJJqTktFl/lv9o3nLF2ToNZbi9dKS75AW5tOiJes31KxYaJlJkbifCwQkp8CZ5A/+9yw+5MkLEsoE1iGAA/88rRUX7mUUd5CwX7pD/1BbQtRsdoovmBpiHaipK64GJcmHl96/DxVtmPiTlm6XGXGCv46GfVegAryAdNmFOI2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldwNn/VM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldwNn/VM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321AB1F0089E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791774351;
	bh=HFJ3bTcdbmrMb1MjB0qjlxO4NeEn7LJaB/BqUK+sTCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ldwNn/VMPx8v7Kcn29kRtGMTtOySNQaJkhZOoeM8FkNQ0HB0NQIDV/2XGpccMxNOB
	 Slnqj5nsDcXbwLqHPZlc2iBrAlbPLB5cfDCZcly1suPUvW/+B4W/vXfpGvPJ5JCFcy
	 uYnJ94giE02k/viObsYlNcXL2Zfqpb/kHem9m96UH7lwZo+fyZns09rEr/8nzrlGH4
	 MZWIyPtYEQrrITmMDNzZhjqEc4enlcEAtupiX/6gi3v3MBphwn8+Sglp5tfWuE+mZ0
	 UF0aK0snXDzMoAX4qVR2/8hjz0399ufadXAjcFj3/ehw5ZytknzfwSdQIQ+L8TbymA
	 NkXEE8Tk8/B1A==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92f0b5ed131so205350685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:05:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy55iD+Z6rA4XtdAQf4Hun5lOIoKNd3oEaAhXUq8w9TFQjf2Z4pxZ+OLAnLZYK5jw5RKgn+bMWu18LsrLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUNVwVEAm/gGOnYUi7G7lBiSDIFcVFy9UPk5jdJrcs5M2wbXD3
	A5izygpCDAmPPCc3nGlVsIylZ8Av/iIzkBKk0SdLDz69Vxj7vj21USqRguW6nMAGC/689JUZ1CT
	fotIRUo7dA7L4EE60MB6thIleSmRDxWI=
X-Received: by 2002:a05:620a:4487:b0:93c:2c15:e51d with SMTP id
 af79cd13be357-93ebd273655mr1425306985a.46.1791774350592; Sun, 11 Oct 2026
 20:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012022917.1102467-1-vernon2gm@gmail.com>
In-Reply-To: <20261012022917.1102467-1-vernon2gm@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 12 Oct 2026 11:05:38 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yW-58kLX7PCep=HVfc-CxE6rF7QKZhYjdeLGve7HX6pg@mail.gmail.com>
X-Gm-Features: AclHuK8IPcilkK8uwSMSyfgjCCtsjbWzPblwAMuBWNreMXAjVfMoXdJFAnSD8mc
Message-ID: <CAGsJ_4yW-58kLX7PCep=HVfc-CxE6rF7QKZhYjdeLGve7HX6pg@mail.gmail.com>
Subject: Re: [PATCH v2] mm: vmscan: don't count per-node proactive reclaim as
 memory pressure
To: Vernon Yang <vernon2gm@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, 
	hannes@cmpxchg.org, mhocko@kernel.org, ljs@kernel.org, 
	roman.gushchin@linux.dev, dave@stgolabs.net, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:29=E2=80=AFAM Vernon Yang <vernon2gm@gmail.com> =
wrote:
>
> From: Vernon Yang <yanglincheng@kylinos.cn>
>
> When the cgroup has no memory pressure at all, writing to
> /sys/devices/system/nodeX/reclaim triggers proactive reclaim on
> NUMA node, causing increase in the writer cgroup's memory PSI.
>
> Due to this reclaim is performed in the context of the write(),
> accounted as memory pressure on the writer, like
> commit e22c6ed90aa9 ("mm: memcontrol: don't count limit-setting reclaim
> as memory pressure"). This is unexpected, the similar scenarios (e.g.
> senpai) will continue to occur, only this time it is for the
> /sys/devices/system/nodeX/reclaim knob.
>
> The Documentation/ABI/stable/sysfs-devices-node documentation also
> notes that "This interface is equivalent to the memcg variant."
>
> This patch unifies the semantics of the memcg and node interfaces:
> per-node proactive reclaim is no longer counted as memory pressure,
> and the per-node proactive reclaim interface no longer produces
> phantom pressure.
>
> I ran demo[1] that performs per-node proactive reclaim 10000 times
> in qemu, writer cgroup memory.pressure as follows:
>
> without patch:
>
> some avg10=3D31.53 avg60=3D13.42 avg300=3D3.31 total=3D10602985
> full avg10=3D31.53 avg60=3D13.42 avg300=3D3.31 total=3D10602985
>
> with patch:
>
> some avg10=3D9.59 avg60=3D3.41 avg300=3D0.81 total=3D2686221
> full avg10=3D9.59 avg60=3D3.41 avg300=3D0.81 total=3D2686221
>
> [1] https://github.com/vernon2gh/app_and_module/tree/main/reclaim_node_ps=
i
>
> Fixes: b980077899ea ("mm: introduce per-node proactive reclaim interface"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
