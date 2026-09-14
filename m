Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDC490BE9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404860; cv=none; b=pBIA5VxyhyLZSxIvGW8dWX0Y9+UykqNW7lpIN12bKgkh0BNde0SRWIfrwpjk3qYJ+i+hx4HJfyJMDFX6fz2+k0O+bUrAouW7nM1JczWdkeyLTWYgzzJiqNGgqoOD49UT0O4Ww3v5hynptkOp5iXKF9/i6ow0Iu/AHQ9b/9AbfkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404860; c=relaxed/simple;
	bh=9oVHup/LtWIG/tiD77wGnSuUj1Uri6rv+Cj8qgcS4u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vh7bDLQ8rNPoSMSuSMIAaLhggNXnihlrAH3u4LP/czWZnj1OA6SfbR7itEwKadFsQLHI14AzHmND8aLGU1aiV8sOeo98m1xWewy7NM2Vznir0s03ElgP3grR6GHjZJTkUyiirwHhby+2dvevJQFPgho/g7/Z+vwLOKh0bTmGhF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ehhjikSy; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ehhjikSy"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530301ff353so23442111cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789404857; x=1790009657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bhb2DGDZ1N4QDHqrTPKWFsV9rSY6+F9JQNAhuggDmIE=;
        b=ehhjikSyb8AcYXEA2SJihWwDqB6C1tnCGNSW9w9mye9wwW3AGCcVIOJ7ZuAEWjQ0Z/
         8dYY9ak6wLTUFF2RggZqhysX4Gslrse4rOd3yyDFvvQeigPBM1jMIEdx0wf1+Z0hD9vL
         WGOIjS2YkSfKF495bmjJNjxCdSUevQ45fES2nSDHu5l+AjgFYoWBGsGklwAaWWFgr8Zy
         xZTPh2Ds/8XItrmpu7U4rG99vfQE75iJyPHB82YhRxH2o1b+I8I4fI8ej5NkHc1cI9e3
         U37hjwWAVpbMDHZQOfiyPDIjtjCjIrYxkAxYkqZonLBazJ3X2k2lz7vcCzLrTPKvvkVl
         P8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404857; x=1790009657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bhb2DGDZ1N4QDHqrTPKWFsV9rSY6+F9JQNAhuggDmIE=;
        b=GXfQahL9VeiJdHOzWA/KxiqtUdHoOUbLO2VPQ0Pzx+xk6ZIqyz7Z5mickkH0uFBudc
         jRGZEzjmGrdlAMJAUjoGe5k68Zkvunecp4PkPD8PKdvWPheYh4nRIg1I/Ehw/bj3fZWX
         4GM+D4/SkQ6fk7/bfwFV+qqK5jnQc9khN0zP7ril+ftCdChxoStfalj/n3LWkiLo+snI
         ZqOOsomhml4l0HWcg8lGcBN0BwgZoOuTcZ5wCdqPPD65/biVhm4GQZ4I1KcpcHuluke8
         x3WzaFZc/2FDT989yPoy8c8w8p53H5RMEUNtTbunGp9pwAYIvqIGUE1qfDpayf2YcVO3
         FBJA==
X-Gm-Message-State: AFuF++lGk2oNPBTAvdsw/CDZuQQM6vdEUQ6xIYTzhaq3cRixz9GewlUc
	UHfi0optkzATSWqLNRVwm7AXO4Mk1k4VGJzkTKRQr2M0Ev5dsuhOeXF7jbKNUWfIM4c=
X-Gm-Gg: AYBFou2xZh+fxtos2CEWbC9fYXnr+kGhnFxqhb0YnZtwPnP+Nm1lyITcjlvpGGvwCJp
	ONCG+xYkvT7knkUsIq6mU0e7VK67ws2fGPgKuQcLZVD2tBrCMRY1XfU/TXWUZUPxRkSRK9DEw5A
	fBBtUoYSnBdhlr/BizokU6RW0EaCsfTmtitZxe0sv6x+7Dbid6nCu17VeHiGsgYvAKIxkD05d1e
	Td7DWb0E8t/aREjvVz7PuS6Rqw3bIKUeTHScMA8dTxXHHDyNwNdsboiq+5RqLSXY+411A8hxPWe
	nqmpW15qwWpynUTwTdarpD63faBW69mJ3ApJIX9p4aTPm4oeJ1m30Dn2aUPNk6F4wNPeEElKycH
	5+DfxhbNqrsoxcR4una9QHTuc2P4cojDuqf4sD9LXkegKN/l9lmJWTkR93c8O5ngHAygWA26IKU
	Rli3gmkzj2BRpYOnPfHFHPANTRp3pgnqW6ihbU+8qoZ3ZKeEMSi3mbfsstgd79kLDKKF6xyk4AB
	NFI8tDo700yM+sbEmep1v1M960RU4V53Z5s12lbKVVDfdR/cMW8W6w=
X-Received: by 2002:a05:622a:111:b0:52d:844c:b0c2 with SMTP id d75a77b69052e-5310cf0aec3mr49651841cf.12.1789404857027;
        Mon, 14 Sep 2026 09:54:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4899dasm102065431cf.12.2026.09.14.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:54:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:54:14 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org, brendan.jackman@linux.dev
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, rppt@kernel.org, baolin.wang@linux.alibaba.com, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com
Subject: Re: [PATCH] mm/page_alloc: let the bulk and folio allocators carry
 alloc_flags
Message-ID: <aqgjUJWVUS_nx20i@gourry-fedora-PF4VCD3F>
References: <20260914155115.439742-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914155115.439742-1-gourry@gourry.net>

On Mon, Sep 14, 2026 at 11:51:14AM -0400, Gregory Price wrote:
> __alloc_pages_noprof() takes an explicit alloc_flags, but the bulk and
> folio entry points do not, so callers cannot select allocator behaviour
> (e.g. an alternate zonelist) through them.
> 
> Thread alloc_flags through both, matching __alloc_pages_noprof(), and
> keep the flag-carrying primitives mm-internal (page_alloc.h) so the
> public gfp.h wrappers stay flag-free:
> 
>  - add __alloc_pages_bulk_noprof(gfp, ..., alloc_flags) in page_alloc.h
>    alloc_pages_bulk_noprof() becomes a wrapper passing ALLOC_DEFAULT
> 
>  - give __folio_alloc_noprof() an alloc_flags parameter and moves
>    __folio_alloc_node_noprof() moves into page_alloc.h
>    __folio_alloc_noprof() is no longer exported
> 
> No functional change: every caller passes ALLOC_DEFAULT.
> 
> Cc: Brendan Jackman <brendan.jackman@linux.dev>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
> 
> Brendan this will conflict mildly with your ALLOC_UNMAPPED work,
> because you add an init_alloc_flags call in alloc_pages_bulk_noprof :
> https://lore.kernel.org/linux-mm/20260726-page_alloc-unmapped-v3-20-6f5729aa9832@google.com/
> 
> I wanted to pull this out ahead to try to deal with the conflict.
> 

Sashiko pointed out some issues that arise from rebasing on the recent
ALLOC_NOLOCK work, and in a quick review I found a similar slow-path
fallback issue with the NOBLOCK patch separate of this patch.

Brendan, if you're alright with it, can I pull the NOBLOCK patch out
ahead into a 2-commit series and I'll add the small fixups?

~Gregory
