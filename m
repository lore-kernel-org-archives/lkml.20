Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730896;
	b=LYroXrvEhQkJA8owDzRe0YWWmNZKCRcZ1glFE9fLp00QL93RaUeuFgxgCxqiyPuBloHZ
	 rGLTAeNPTDNYYqnVUTHS0qbud15vSMGITnzK6bPwQlV15X1fIoxFl04rI+7K84Vsyva6a
	 jq5yw1NrF85udWjuf6X9ItxQ2052DTMbOlMVo8c4CQtVt4tNNV6rCfNAB8Msdd6If+BXX
	 KsQbQS/AcQyUYIA15S2HrnfrLD4549PHG9DWnSNP753N+1mzFt87OwdC+ZagdRpf2IcKZ
	 EzhZKia3CLkD2+48zKarSVDzWR1QRKUnv6lmh15xzs/1pgFXiueNJpaGgjND0yV2ycA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730896;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=RILHhZHp4WhcU0NDI/N6yjwolA+vZvAfqglGBF4IMqs=;
	b=pie33cIrcW71EFjGr1iKbssPgvsHrlFShy9Jhfq5lGt/58TmO9OZYMD92Hh5YasUK/Qq
	 S4SBz6xxQz4hbOatpM+KtZ1MUJzqzTwg1GUAXM2tOIqc4gt5apmSKpHojxFLy6b5HtX1S
	 NS9QGNkCBvum73eOH0lfGTdbgvp4h+uAR2Fq4iuZdVO/wnqUUVJnU6A9aPjHiP/nFNS86
	 MukQ1/FXadQAXZOpcEU3LMcvMqFbxYAL2vYcWeWMW1OjZXtq29Wx6BgU6faX55Yml7goC
	 FHBTTUEPpN04/p3gLX3RUOGYGlNyiEmt4FS27bK7GIFFrg/c1iwNjgCLqEsIyXh30Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+AOrQwZ;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F617606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F617606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+AOrQwZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793730895; x=1825266895;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1ewpGu5WdDE+nftUjtbTDhRc5mg6TeQXUNIdmibEOzQ=;
  b=J+AOrQwZa2gTolN33iMDa+ZC5J5hHM+IsHwkHJmHNJWUuQZWZMP9sC5L
   8qBApdNFM6AKGTTTOU5U5fE8Cw9PQkOwBnFpJsA03taKCTPZ86pujhHxM
   qfSas5gL+qXPzzfPSQyPYpj2aGWJYMwnIh8bjJnUOOGY5U/c9cKXvIFOp
   2ggVpt44KdihzECThZTbi46gOwWQ+Khqdp/7f86Mo4IurvEp7pV31ksbq
   Z2PtTbDsm6L6nf8dfcoh/SkLayFG3WVuizHgkiw1QQuVVHBLAF0/DdCu1
   ePYLkRCU3s/AD6AflTkwL4NARposxoYrYXCHzx3qirKwSUHIvPYefywYO
   Q==;
X-CSE-ConnectionGUID: trpKzDjaSoSW/HRZvy74Ww==
X-CSE-MsgGUID: Ts6qCsS+Ra++v+eTOwbhMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2477121"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2477121"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:34:55 -0800
X-CSE-ConnectionGUID: +GdkX+DFRf2xadU6xfgXLA==
X-CSE-MsgGUID: fJ3Y1uucTEugMM2eDnmp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8282831"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:34:55 -0800
Message-ID: <434e83e5f689dea22c2cdcaaa841020470792abf.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Don't use fits_capacity() to compare
 thread and CPU counts
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, peterz@infradead.org, 
	mingo@kernel.org
Cc: qyousef@layalina.io, yu.c.chen@intel.com, vincent.guittot@linaro.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Date: Tue, 03 Nov 2026 10:34:54 -0800
In-Reply-To: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
References: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
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

On Mon, 2026-11-02 at 10:15 +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>=20
> invalid_llc_nr() uses fits_capacity() to compare a thread count with a
> CPU count, only for its 20% margin.  Qais's series changes
> fits_capacity() to take a CPU number as its second argument, and this
> call would then pass the CPU count as a CPU number without a warning.
>=20
> Give the check its own helper.  x * 5 < y * 4 is the same comparison as
> x * 1280 < y * 1024, so there is no functional change.
>=20
> Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina=
.io/
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> This keeps the 20% margin.  Qais would rather not add hardcoded
> margins, and llc_aggr_tolerance already scales the LLC size here, so
> the margin could go, but that changes when a process stops being
> aggregated.  Tim, Chen Yu, would you drop it?
>=20
>  kernel/sched/fair.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..dfd6528d18ee 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache=
_group *grp, int cpu)
>  	return false;
>  }
> =20
> +/* Are the running threads (in SMT siblings) below ~80% of the LLC's CPU=
s? */

BTW, it will be more accurate to say

/* Number of running threads below 80% of LLC's cores for default setting *=
/

Tim

> +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> +{
> +	return nr_threads * 5 < (u64)nr_cpus * 4;
> +}
> +
>  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_st=
ruct *p,
>  			   int cpu)
>  {
> @@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group=
 *grp, struct task_struct *p,
>  	if (scale =3D=3D INT_MAX)
>  		return false;
> =20
> -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_thr=
eads),
> -			(scale * per_cpu(sd_llc_size, cpu)));
> +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_thread=
s,
> +			    scale * per_cpu(sd_llc_size, cpu));
>  }
> =20
>  /*
>=20
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
