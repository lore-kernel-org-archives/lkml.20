Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740069;
	b=L5dNGEwwFxdCjx/Ua4RWCXTiUxEuusO+nujrTFI7DUilunPWCgqc6aLLFrhz4vjN3SuS
	 r0BVH7vmLMl/v2tx9jDUDIvV7ADADTQk4PHhLRP7JE0owSv9iyUNh3KNfxLDmTh6GncxS
	 ug6UtS3ZASBWANKKZPVSKHF5j/F1DyjB5gsGqvuu/nfogvwCsNFHg0qVRRG3sFmbo1BBn
	 enb9dnxAFu88V0mufBrH3CAEqUg7479WQqGzxFXETLVUV54fIrPtirXvALEIkPGMd/wCf
	 0G8dmd9Z3EcyMH9Zr0A7tScQZzQXVv5K/C2i4zXm8OTX2+AnxI/t/kRylBCTp2ZVcXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740069;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=H8w0h/9WICBNxwhqnK4IERcixCu4aqASfFIML4yuBQc=;
	b=2qc+Fse/HqjYj8YbKR6UrpeBMNZxjwzE+d6H3IPGilKcqcm6IxhdI5Q/Y+8R/Aa88cje
	 JYnP+UBN708X6zcDc8HfUXuA+tFXKDE/ANI3z5IyCD9+DrP99Wv4TxigOb0ZijDha+5Uh
	 /P0db6yuL6jhW3Fxjc+Rj8ahc+eoFZHWO95QMbrXHNsq28kE3cIVMmSzLasKqOznNbd5m
	 JjfqdP3Rn6etTSuKCdEYkBNjkH+3gCw885kqrUma6g4tm38uuDKe+4BgIocqxPGMKMZge
	 RRo59GayjKhFHlOAuG+Y3Ryus8sAx6W0rHKo/uk0KD5V7Ms8JCqixWVtcBrWRwYN4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZIljVh98;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398FE606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398FE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZIljVh98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793740070; x=1825276070;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=XcCrsqi7rnQKU+K/XF9LOpOn0EJj+f8E7rSHoXopAx8=;
  b=ZIljVh98jmPgLmB+FgoRZ4RKGnKXAsaFMLcR6XvFNpOn+INgHp1KbJSY
   CUBCwvacx3qXPe4yNEFWd2bbq9AE7dqWCGYudNIbmwUy4rGSeMFXkWw63
   7PFoh2W3NdlJ5qT6+S3hkmAYJVI994nAfLcIPCUP6GfmKx5HpuW0QXyoZ
   NlBL+f3+H+AZ/MHxHVyCsHb5K8MyUL6iDqEKleHaN9Wran+Mw+BZOkJjB
   PEBXvQbLxh+omQ2MpDNH4X4WThYtF1hmGlDiTRAiXl+j39MJIi9nNG0ey
   9i1g5XTfcXUUxkDD5UDcWovdSZahS5hrXvFfjFzv+VYZRrc2GfhSbV5Qm
   g==;
X-CSE-ConnectionGUID: mxo29BGsSDGi+Gh7b0rtRg==
X-CSE-MsgGUID: OE6Q4dhjTpGLWlCbU64LJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2512731"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2512731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:07:49 -0800
X-CSE-ConnectionGUID: vx0+mBRCSNWG5oTD4c0EnA==
X-CSE-MsgGUID: gEjk8w6RS/2WQ4GSSDtcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6917791"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:07:48 -0800
Message-ID: <85945b5c0c6c418780c9f5833a5fe6418da4e21a.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Don't use fits_capacity() to compare
 thread and CPU counts
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Qais Yousef <qyousef@layalina.io>, Zhan Xusheng
 <zhanxusheng1024@gmail.com>, 	peterz@infradead.org, mingo@kernel.org
Cc: yu.c.chen@intel.com, vincent.guittot@linaro.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, 	vschneid@redhat.com, linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Date: Tue, 03 Nov 2026 13:07:47 -0800
In-Reply-To: <bc97743f-5ceb-4ecd-8f3d-1b217eb9020f@layalina.io>
References: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
	 <bc97743f-5ceb-4ecd-8f3d-1b217eb9020f@layalina.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-03 at 01:31 +0000, Qais Yousef wrote:
> On 11/2/26 02:15, Zhan Xusheng wrote:
> > From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> >=20
> > invalid_llc_nr() uses fits_capacity() to compare a thread count with a
> > CPU count, only for its 20% margin.  Qais's series changes
> > fits_capacity() to take a CPU number as its second argument, and this
> > call would then pass the CPU count as a CPU number without a warning.
> >=20
> > Give the check its own helper.  x * 5 < y * 4 is the same comparison as
> > x * 1280 < y * 1024, so there is no functional change.
> >=20
> > Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layali=
na.io/
> > Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
>=20
> Thanks for the patch. LGTM, although I hope we can do better.
>=20
> Reviewed-by: Qais Yousef <qyousef@layalina.io>
>=20
> > ---
> > This keeps the 20% margin.  Qais would rather not add hardcoded
> > margins, and llc_aggr_tolerance already scales the LLC size here, so
> > the margin could go, but that changes when a process stops being
> > aggregated.  Tim, Chen Yu, would you drop it?
>=20
> Tim, Chen,
>=20
> From capacity comparisons, we had issues that we move too slowly or too f=
ast in
> some cases, that's why I was trying to remove this magic number.
>=20
> I'd be surprised if this gives a global win.
>=20
> Is this the best we can do? What is the problem you're working around her=
e?

Qais,

The 20% margin is a deliberately conservative margin for the default
llc_aggr_tolerance. With no knowledge of whether a process's threads
share data, we only aggregate a process when its threads fit well within
the cores of one LLC, so workloads that don't benefit from aggregation
are not hurt by packing them into a single LLC.

Where aggregation is known to help, the user should raise
llc_aggr_tolerance (or, later, use hints like schedqos or the prctl
interface we proposed) rather than rely on a smaller margin. The
tolerance scales the limit (0.8x cores at the default, 1.6x at 2, and so
on), so the margin only sets how conservative the starting point is.

Thanks.

Tim=20

>=20
> I see we have other magic like llc_aggr_tolerance and llc_imb_pct etc.
>=20
> >=20
> >  kernel/sched/fair.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index cfc982205b98..dfd6528d18ee 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cac=
he_group *grp, int cpu)
> >  	return false;
> >  }
> > =20
> > +/* Are the running threads (in SMT siblings) below ~80% of the LLC's C=
PUs? */
> > +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> > +{
> > +	return nr_threads * 5 < (u64)nr_cpus * 4;
> > +}
> > +
> >  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_=
struct *p,
> >  			   int cpu)
> >  {
> > @@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_gro=
up *grp, struct task_struct *p,
> >  	if (scale =3D=3D INT_MAX)
> >  		return false;
> > =20
> > -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_t=
hreads),
> > -			(scale * per_cpu(sd_llc_size, cpu)));
> > +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_thre=
ads,
> > +			    scale * per_cpu(sd_llc_size, cpu));
> >  }
> > =20
> >  /*
> >=20
> > base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
>=20
