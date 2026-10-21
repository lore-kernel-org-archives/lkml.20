Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601551;
	b=bUwC4GhRMaMO6qu1xAeAYX8Z4JqbDqezrop/BtUv+AxSc0UCrcwwg/eXhH08TgLTU16l
	 YmFp0ylwNK66v6ScvOcQ5xo5oyYCLwcDoanIqxXXgcdUbUhrfXA/dy7w/SZAgrCY9GQv2
	 fp/T2Fj8/5vsPkr29NWc6u4R/zRRuJ79fjjvBsEHf6WamisUtnIYMIhc/Hab3jUNFSV6f
	 0RxmxAtGenlPdkHZWA8341DXZo3JoMKrioFaNmeUZnmFbCfaWgRYHsqNlGkuoSMJC6U5w
	 f/dR+JliydDDpPO6syDZA008mKo8htuq4/yBsxTKUzziysixw1A8QFcybQ1/epdW4OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601551;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Vik1txR8yivD6KvNH2HN+sPNUeut5oqfpgd+51Xfx8M=;
	b=4E+T+MwNhj5N/9M37DXrLW5VDFhfBgtN9Aoox58NVL8NWYEItSNpO5ZlcMaLKr8mgKr7
	 SilF3oKVFDn4jx1MmF+VQCh/svdBiSQMz68JCiQbhXj01KJrUEwQRl1ol+KpiURd6g+EA
	 ElpUJKhXQ8mWuUmtoFvDKsyjLZRnSFdKkuOShG4rudZfCD+9TXBHfkyWL000i9uBF4k5n
	 ico7RFeM/X21Q1YKrl5L0RxoUQTUxHAbcUPV2n3dit1i7RxE6EgAdVWjwtQNq/sYUHzHD
	 sMfuMbTj6IpIAW5l0DqOHegUDqwHo+DVcClDfFfNU01vNjFwVGlIxmjp48EDPG/cUOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FNrpXLza;
	arc=none smtp.remote-ip=91.218.175.205
Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB98606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB98606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FNrpXLza
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9/ZZeZVK9bE+Sv6yU7J5zHSa0wnK7nI+V6j0mEaWDBI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792601547; v=1; x=1793206347;
 b=FNrpXLzadtKrr8wZTKchM40gevYsnDNNLz+hr239D2xSKmiqbBf4Hjewl0fKbwPSO2g5aTxD
 xle4vVHrVU74lz/KNlGFQhAflMmMuqhIN9jtbj7jMoqwfyteSieBmi0bugVErt2O8ohYyfjidvS
 furS0pd+1E9/r1WZdSpPlm1A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fc4f0bb13bd8d6bd;
	Wed, 21 Oct 2026 16:52:27 +0000
X-Mizu-Trace-ID: fc4f0bb13bd8d6bd
X-Migadu-Flow: FLOW_OUT
Date: Thu, 22 Oct 2026 00:53:12 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Chen Yu <yu.c.chen@intel.com>, mingo@redhat.com, peterz@infradead.org,
	tim.c.chen@linux.intel.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched/cache: Remove the old cache group footprint on
 exec
Message-ID: <atjt-Hp-AMBIQpGe@three-body>
References: <20261015053604.29927-1-jemmywong512@gmail.com>
 <atiP8TwaDDtbImRn@chenyu-dev>
 <A81AB6C4-6821-454D-9C2D-716A3D0DFE6B@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A81AB6C4-6821-454D-9C2D-716A3D0DFE6B@gmail.com>

On Wed, Oct 21, 2026 at 08:50:52PM +0800, Jemmy Wong wrote:
> > On Oct 21, 2026, at 6:12 PM, Chen Yu <yu.c.chen@intel.com> wrote:
> > 
> > On Thu, Oct 15, 2026 at 01:36:04PM +0800, Jemmy Wong wrote:
> > 
> > [ ... ]
> > 
> >> @@ -3965,36 +3974,6 @@ static void task_numa_placement(struct task_struct *p)
> >> ng->total_faults += diff;
> >> group_faults += ng->faults[mem_idx];
> >> }
> >> -#ifdef CONFIG_SCHED_CACHE
> >> - /*
> >> - * Per task p->numa_faults[mem_idx] converges,
> >> - * so the accumulation of each task's faults
> >> - * converges too - Given the number of threads,
> >> - * it cannot overflow an unsigned long.
> > 
> > Above comments can be kept for future reference, with minor adjustment:
> > 
> > s/it cannot overflow an unsigned long/it cannot overflow an atomic_long_t
> > 
> > I launched a full hackbench test on a Xeon with multiple LLCs per node. There
> > is no obvious difference except for some false-positive regress with large
> > run-to-run variance. This patch looks good to me in terms of turning the
> > footprint into an accurate counter. Feel free to add:
> > 
> > Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Chen Yu <yu.c.chen@intel.com>
> > 
> > thanks,
> > Chenyu
> 
> Hi Chenyu,
> 
> Thanks for the review and testing.
> 
> For v4, I've restored the convergence comment next to the batched
> footprint update, changed the type to atomic_long_t as suggested, and
> rewrapped the text:
> 
> 
> + /*
> + * Per task p->numa_faults[mem_idx] converges, so the accumulation of each
> + * task's faults converges too. Given the number of threads, it cannot
> + * overflow an atomic_long_t.
> + *
> + * Apply the net change once per placement pass to limit cache-line traffic.
> + */
> + sched_cache_footprint_update(p, p->total_numa_faults - old_faults);
> +
> 
> Does this wording and placement look fine to you?
>

Yes,  it looks good to me.

thanks,
Chenyu 

> I'll also include your Reviewed-by and Tested-by tags in v4.
> 
> Thanks,
> Jemmy
