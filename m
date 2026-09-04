Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D439CD0F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549030; cv=none; b=jqzLojIkNn3hjSJdx4vBJ8ohJP4NANr87SnodPW4sYV25w2sGX34Xr9EvvvYHxH08CiG/yhZimPsrmpmrVNt5tDYJg1p+nekKOr6lh/7Y3tnefgPeRdGJDW7C2f7/bOLthT/rI/mj5qH0y81V7OOLE+fAtxZABRRRjbUHNrXb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549030; c=relaxed/simple;
	bh=7I8z7VJCoLDLA6tf69xYM+voThKq7kqxrXiWFNfBBKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwCOY4LUGRAFfcIW56bx4tYm8AQ0G7oYcGfKlsacS1YzZaKBWKlbcaPJu07+lHgYu4jxMDfKRqamU0yvzdebGoBMwuGwk8Q1fUr2k/oUnyLoBHedoCnSKUiBQL5Ps6nkcaVgaIcypUcDGNJ+tdgk/qNCXF5BBzQ2eoIFdJNHZxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YbgxZm0n; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YbgxZm0n"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5301db51586so18710001cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788549023; x=1789153823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YUgKuuRo+YyeUtxEE4Sx6nW+KzLoxHx9mRXSjbuHEco=;
        b=YbgxZm0ndC+lW55PUZEwSSVPdl81R2qVOwhucpnPDDP3Ne6BrC2urJCmENx1iGORKw
         QOE77ORp6zcmgFWhb6IPyX2zt1E0dhhSnh2O2OYF+CCkj8ULlwL6Hw1SHvO2pkyuqIWk
         i5c1InJ/dMKkz3BnhIUDbXNf57+bLv2JU1KmeJg5ezInSxGptxakP8G4h1zc1sEAm1pK
         aYAoMtHfcmeLq/MD/Q5biRNuln8sz5hOZK2kLc0DQQdq9yFhGVRKxVPhoBXqeruHOTbT
         b7fJDIZcb+s8Nvs2hyzB9ALdUmGfKTsQOvh7dVnnI3HXws9byeP5fwX8/Bsqg3vZ4qSL
         PANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549023; x=1789153823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUgKuuRo+YyeUtxEE4Sx6nW+KzLoxHx9mRXSjbuHEco=;
        b=I4ub4mGfHA8KscnHf9pT6kzVgUgCZiYxxnLKdmYdYQHVBnCUDGI8nDKxKsqxGrOEd9
         TqcRo4PWfNE00oE77ptaHK2gctUISx1c+B/CnYb8i8QdAev7Gu7DSUXP+PunyplMehTQ
         bogCGRgz8y6h8XlpfqhBAaZsDUh9TsORO5E69OnkLD9GpgPI0/fs8psSfjakfgBamLHE
         wLRdCNu72Y7LmbD5mtBZUULwxJr4SZzsIn9LMH/vwUSwvR34Km2sDfTcMtnvGhjs4QKE
         wqZLyZCCLqPPUxx6HH+NYLqDHtumCQHBd2Awm5jGJLshwgUcBW5MzCscvGSpLJa48nqg
         bYJg==
X-Gm-Message-State: AFuF++l8E5LHP4zx5K7GVn8b9juRG/8szb7zFSq5B1OOZkfa5nO5R75Q
	Qx6zOMWOPEKPtZgXaW2Fil/3I+koaGVI0FCqDEwP1jED6jS71ToAIPmCG6gYXFb9AHo=
X-Gm-Gg: AYBFou2BQ8QqV3U5XKZUZio5ChgRzdksxuqnDnTUUnpe0cyfv49NCS6ebT5OB6aRs1Q
	jt9GVwpojmfL+J5bvE9+eH7QNoWd06o+b7Y47Hvdf++HytxIv6NJ97zRG7Couu9VqDE74IYHakf
	um+1vx/3trwUESyPAKkiqEnoEmAF6ic6Tcp0DfGUK1y+T3rnxCuRdKrKgJurIQ2qp9YIPIPfA2z
	Bn0wkQ/CDCBE6wWy8acEk+Ts9TfVdMcx/p258F1H7rEd2HyDj8q1rhImEDjIaR7BNFdnFl6iDdw
	zq/KwE75GYS/gv6lwZUxPkSLrhzeUjj+icZAO+q1nY/yIftIy3mkXCBiykepMAXr0uITNtnZcs+
	ZWhvBU6nYlXIQTaIVQah29ddm+899PFjqJpe2S+qk9Dh0Y8FwwXPRaaL5Nip/ZazcVqWH5onhD3
	nC6ZbhSRzH3UL2rZg6rGasOElzxw07BAGWhIOg0Xq/WI3zBl+zTovDKd2u6ZLdHbZrJCWV1mcK/
	bwIy5B6uDAr1qdF823qiA7ZFc3YoI59pXls+b5qE4BS
X-Received: by 2002:a05:622a:393:b0:530:2cc6:c8ad with SMTP id d75a77b69052e-5305488afe6mr81355591cf.19.1788549018616;
        Fri, 04 Sep 2026 12:10:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413d7f8sm26980241cf.14.2026.09.04.12.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:10:18 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:10:16 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, raghavendra.kt@amd.com, shy828301@gmail.com, 
	baolin.wang@linux.alibaba.com, osalvador@suse.de
Subject: Re: [PATCH 1/2] sched/numa: do not let the per-VMA PID filter gate
 promotion
Message-ID: <apsWE-y0nV5r1_5Z@gourry-fedora-PF4VCD3F>
References: <20260904182006.1562449-1-gourry@gourry.net>
 <20260904182006.1562449-2-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904182006.1562449-2-gourry@gourry.net>

>  		/*
>  		 * Do not scan the VMA if task has not accessed it, unless no other
>  		 * VMA candidate exists.
> +		 *
> +		 * Force-scan only slow-tier folios when in tiering mode, as a large
> +		 * VMA can cause others to become "permanently unaccessed" if a scan
> +		 * cycle is consumed entirely by the large VMA.
>  		 */
> +		vma->numab_state->slow_only = false;
>  		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
> -			vma_pids_skipped = true;
> -			trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
> -			continue;
> +			if (!(sysctl_numa_balancing_mode &
> +			      NUMA_BALANCING_MEMORY_TIERING)) {
> +				vma_pids_skipped = true;
> +				trace_sched_skip_vma_numa(mm, vma, NUMAB_SKIP_PID_INACTIVE);
> +				continue;
> +			}
> +			vma->numab_state->slow_only = true;
>  		}

sashiko (correctly) reported that slow_only=false set unconditionally
here causes a VMA that's scanned over two passes to be prematurely
re-admitted regardless of vma_is_accessed() activity.

Patch looks simple:

+               if (mm->numa_scan_offset <= vma->vm_start)
+                       vma->numab_state->slow_only = false;

and on patch two:

-                       vma->numab_state->slow_only = false;
+                       vma->numab_state->slow_only = ro_file;

I'll follow up with a v2 next week after I test it.

~Gregory
