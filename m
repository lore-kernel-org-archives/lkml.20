Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41802531615
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906548; cv=none; b=s2HH67Gv9+JLVLqAJIIrLWJSqK6AGlk1v+b0oH08pICs22fgt5IYXZbnDktuJLaljPDpUAHf7+AExyA4R6re693cTNEasbs7MJcT2ZNksLKz+g8pMfC0QKKhPJ4BCWek6pqj/+btV/FmoMiMmlJN8I0wkGFcdXTOEA9z5kmTI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906548; c=relaxed/simple;
	bh=0/gK4FqxfcDlbN7lhebjIr1Ae4I7vY5k6nQfjRjNcSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucKpQjas/4BXqudP1mfYfxDjj7QSkSVd9I62U2NR5HjR7OBxqft6Qb/0DZIvQKChF4XK9we0b96g0n3iZZFGljske/A94UivBk+CJ2dFABS3+WEw1ffFK812cnHEjjj3eXABf7ECKI0H5zatQkkD/E39ZLCsv0hGuVVewJ/tf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=juZcFB3g; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="juZcFB3g"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-930c0f9c1b1so322051385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791906546; x=1792511346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrNB/7UTIGYGYTZ/Zj3hAKbDyQ2eLb57xFz/cmZ4YH0=;
        b=juZcFB3g7mEg+xL4+l9CbR0sOrb+DWeplslXUisf+3Dq7fZc2mh5YuAg1/HRX3WY1N
         UEzPYtY0E96UKbZ8CXdb9BqvZnbCdTumCPseNQBRYGmyTZQJEXTfXvFTH6XQFtxzxyjT
         k0+h6gVCBbvAVUkCyGM12HcH5hqEpJOci4HvGCOeyZTujvUad1i6UtXy5Kq1SSARccwd
         rAz7x28dVGC7rRol5gDKjCrSipH5+GUBZx8HBeefY79bflEvrazh+jLE4J9jDX8opZ7E
         pIDspHADGqlzyJjVdC/ZW2Sy4mNAS87uDGWvMWxk9KFNFRNyxEEWseN1LZaKqG+OtXxr
         ccmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906546; x=1792511346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrNB/7UTIGYGYTZ/Zj3hAKbDyQ2eLb57xFz/cmZ4YH0=;
        b=qPECaQPXy4Ic8+OSwyG2XGd8pfeE60kRoZsSYOgjiB+v9GG74BdmswFecTKCJV2UxT
         0J7qREVdzhsltzUqOlf0feJsZ8uop97nMOmiuQunzYV53K2tuVrOtd8vPDqgKgdk5y7F
         0hNF51j2LTRdxBF/0DPfFSHtKRxfcLFmunPZO6hPW84+XbCMclwSjHE5B/FgzedR7TMG
         IlQKgDKfZxYEgo/3vk7dGORzzh9vY6aMTlR7v0lZI3SODduR7QKYactRhGePZy0hPMUv
         wrCuFdGI/OERc3Gr6VSGK4WHFIAzzpoQb9/pjCT8opMnRhVIJXapaXmtJKzBeYQmomqr
         BhYw==
X-Forwarded-Encrypted: i=1; AKwUvBwnF1Vji3ZXLcPXhqUrvPRK0hRFdtMfRde4N5/7g65q75Mqf9GLMrpPcc+E0QyqgAMCrY+JtVeTEtFD3mE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG7icTrIVncYOXxxT3en505CeOCWUUMtqGzU8ZkVqAXdpSX5aF
	vyQmZxjo7urabMHba9tDtKGCw6t9mbaaR/EiUiLW0HObSUF1ZMnuX+RaCYmkWXjaXV4=
X-Gm-Gg: AYBFou1XZ4gAOdkTP3mZL5ts7Jgyu/fRCLYvecoNjsswkhoAT7OJz1O5Wa9lOHZdlRZ
	HKaXsMJ8YpBaZPLUn0CxyUrbGA7szowz25m9u0qrusEk5BwBazj9l8h0fXNyKW3yP/wgJNMlgN1
	jBvuC3UQt94QZvEe2s8rZZlIYCCBe4ta7Ag2IZkZU9JsuVH4lndL9qmHgd5LYZThoiorIoWSbzk
	H0ebVno1zgBrMxUWQkHA/9fkbzzINYzQzi0jRVnY0F2nYtbHwcKBKK9sC91I6oyuXB/wLTbrL++
	BecVtQnlSJxMWr5DxS1NGjNjOlKuW9X1OJv1T6uYQEemg+X7tNMUgq/WGdXGPXdJPKUjdxrGWnb
	BCRhBpbOSVJ3tEkqPU7Yx68f7su5FIs9FSq23L3iHouxdTe5VjxatE3ISy302GXacuuXL9CwHNK
	IuB5tR4rXG+mxTYDrfCZLWvmDnmVfa3DZy0z8iNmdfTPeW4r64fEaNF2Ek1ZGGX/Pp/baHlzmSS
	erKHOfdQRxZm+14z/j1YvDfuqxgrs9QS31bBHLEZRguPr1P+2MpT3I=
X-Received: by 2002:a05:620a:6081:b0:93e:5b69:fa8 with SMTP id af79cd13be357-93ebd2811a4mr1919769485a.66.1791906546018;
        Tue, 13 Oct 2026 08:49:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50287a2sm265747485a.20.2026.10.13.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:49:05 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:49:03 -0400
From: Gregory Price <gourry@gourry.net>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] BPF-based per-cgroup NUMA balancing mode
 selection
Message-ID: <as5RFhW1Ch8ta5nZ@gourry-fedora-PF4VCD3F>
References: <20261012120438.52849-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012120438.52849-1-laoar.shao@gmail.com>

On Mon, Oct 12, 2026 at 08:04:35PM +0800, Yafang Shao wrote:
> The Problem
> ===========
> 
> In our large fleet of Kubernetes-managed servers, NUMA balancing has
> been historically disabled globally on each server. With the increasing
> deployment of multi-socket AMD EPYC servers, cross-NUMA access has
> become a critical performance issue, which made us reconsider.
>
> Enabling NUMA balancing globally is still not acceptable: it increases
> the overall system overhead and can introduce latency spikes for
> latency-sensitive workloads. What we need is to choose per workload
> whether NUMA balancing runs at all, and which mode it runs in. A
> latency-sensitive service may want the scheduler's NUMA statistics
> without tiering's promotion machinery, while a batch service wants its
> PMEM-resident memory promoted when hot without paying for
> scheduler-driven migration. No single global switch serves both.

Have you tested with recent fixes?  NUMA balancing has been broken for a
few years now (starvation issues causing VMAs to never be scanned,
east-west filters causing south->north promotions to be skipped, shmem
being entirely exempt, others).

https://lore.kernel.org/linux-mm/20260629163337.1264881-1-hannes@cmpxchg.org/
https://lore.kernel.org/linux-mm/20260930112206.205083-1-gourry@gourry.net/

I also concur with Tejun that ops seems like overkill for this feature,
this seems like something that can already be managed.

For example, why not add a new numa balancing mode bit that says
"enabled but only for explicitly opted in tasks" and then ignore the
global default mempolicy, e.g.:

  if (numab_mode & NUMA_BALANCING_OPT_IN &&
      mpol != default &&
      mpol.flags & MPOL_F_NUMA_BALANCING)
      /* do balancing */

~Gregory
