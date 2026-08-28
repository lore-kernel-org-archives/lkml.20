Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE235CB7B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936909; cv=none; b=iFqBAIJ3iRJmThPbsRCRysVS6d/fdi0lZ4EDZxC6KMW0MPGtvTF3A2fRxykTg3x1DXu/iGufDwrP4JooJU4mXTPiJCXmAG6rVwEJiIcz6f4wGzNecG4S2sOkby6RqzjzJM/v2fPBlGMePpWINbWKcgJ+v5dbXlAkCi2uJy1pIK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936909; c=relaxed/simple;
	bh=KIdTzkMqOqjz2aI390aX+CQMOq/2//j1AyfXAImj9wY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cVWg1gWwL96nNaKxHrmH68n71klq8mW0KAhklrYHik68KOKbXjvoyefvyFXQCCVtAEP13Ava9woCF202a+i8JVKOxAlt4OPvGXYYZv2+EFbnDzRT2KdwfBMixfsAEk16bHADn0b2wMtY6G5nsLlcFWX8OxPjjlnC3y/SpJylNCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKaRh2oX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKaRh2oX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787936908; x=1819472908;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KIdTzkMqOqjz2aI390aX+CQMOq/2//j1AyfXAImj9wY=;
  b=fKaRh2oXFMPrz1qlFvOr76VwaT58IUn4303kk8vF5JoQWhTvsPSy2QVR
   xdz2H+X5pw0oN6yKzFAnj29Vm+X9MuuKhBDA3StM4eIsvxj0ZlGbMATdz
   CCZZZbgUD4r2e5iuNjMvcSC8pb1QUWO1HxcWuAEyq44ogXhcTNa0mBVEw
   /i791xBp185Yvt+QisY6GNPhHMIGQkxJ+YekZxGVW7KSh+FEOtL7VYKBp
   usCCOlgSrb1hRLXFSCqcjz4IUnccYI5n+o8/FiZpFm+CbWE96CySxmkfP
   1+pA0vpqHD4KejVFDdZz5z1XfV/S6Zds9cd4eJ5Eaq+v/EiT+QB75ROU3
   A==;
X-CSE-ConnectionGUID: jBBoYZbqSm6oJSIAQOQBQQ==
X-CSE-MsgGUID: WAQTifNQR7ewHCBKWzT8XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92263362"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="92263362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 10:08:27 -0700
X-CSE-ConnectionGUID: gxlAv8yORnOJTn2zMCp8Ag==
X-CSE-MsgGUID: Sb/rf/OTRDuiJWfIVqfXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="268766709"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.109.196]) ([10.125.109.196])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 10:08:26 -0700
Message-ID: <a2b5c308fcb9487dc04d80f57b3e3ed606410ac8.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Keep nr_pref_llc_running in the runnable
 domain
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: yu.c.chen@intel.com, peterz@infradead.org, mingo@redhat.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Date: Fri, 28 Aug 2026 10:08:25 -0700
In-Reply-To: <20260828022012.936112-1-zhanxusheng1024@gmail.com>
References: <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
	 <20260828022012.936112-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-28 at 10:20 +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>=20
> The ordering the skip depends on is not visible in the diff, so for the
> record: dequeue_hierarchy() at fair.c:8148 reaches account_llc_dequeue()
> through dequeue_entity(), and clear_delayed() runs only afterwards at
> 8164, so se->sched_delayed is still set when account_llc_dequeue() tests
> it.
>=20
> The sequences balance:
>=20
>   enqueue, dequeue                   +1, -1
>   enqueue, sleep, wake, dequeue      +1, -1 set_delayed,
>                                      +1 clear_delayed, -1
>   enqueue, sleep, real dequeue       +1, -1, skip, no re-add
>   load balance moves a delayed task  source unchanged, destination +1
>                                      with sched_delayed already clear
>=20
> requeue_delayed_entity() does not reach account_entity_enqueue(), doing
> only __enqueue_entity() and clear_delayed(), so the wake path cannot
> double count.  account_mm_sched() cannot see a delayed task either, since
> task_running_on_cpu() at fair.c:12245 requires task_on_rq_queued() on the
> current cpu and the caller is update_curr().

Thanks for reviewing the patch proposed to fix the problem you pointed out,
and validating that the nr_pref_llc_running accounting under the
various scenarios are sane.

>=20
> sd->llc_counts is right to stay on queued semantics: both readers compare
> it against another llc_counts value, at fair.c:11895 and 13228, so delaye=
d
> tasks shift both sides alike.
>=20

Yes, sd->llc_counts do not need to change as you pointed out.

> Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
>=20

Tim
