Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF85517BD8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550287; cv=none; b=f4LykY1Srn/rA8uGgatPNAqUSQzyyTP/s2gfemcATnP7WAD5jQjWXHSd/x0P5VxXIgHWGD9yOXfrajFt+Py+TBX9k+w8zYLavfLEKIrWLcgh9rAm8QfmORi3ydUSiaJJIcqTOwQNQfoRpAVEUwQgYeR7EkUS5bJvmWj6Gxj3c0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550287; c=relaxed/simple;
	bh=0rjOPelWm61DokBL1uA69H8WRJh/mxAh7DiqigmgPf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZKb/E/RTQ3pfHNmbgggWVYEMRiI7NeDh3htk2SV7God03Z4wl8lAnI7KWnhdMxzqr7a13Fjgdsh1aW9YkpDIPz9o9/vwGMhRxHSRKo+vCHz+tLc9468ewLQaZUGG5CQIXNaIcsOYVLZrJ7GSiziRSAaLvNemMfyeRilBQWD+fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Go8hnBIz; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Go8hnBIz"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9087fb771d3so13024656d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788550282; x=1789155082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IasE0lL7i4xilSrjoP984i9qLy9vPz5YGSTLXTZQjBs=;
        b=Go8hnBIz18AyvufYVpOXeeWvny1BTfbYNHsMIrHQsy941cNeN09Q7T10QFix7bZ/Mk
         /sElgDu5L05iQakfhxbi3fQsLNVZ5esKad1wa0tFC+MeBQuYm7dLxVPfK89lUKHirK8Z
         RepebIwvMoWSaRc11ZAL3T0I3QOissNgetrQR1iFn7FVMWxJ03LRexhgPyRUwAds9f2p
         /uHyXvYJhOpcrikHjc2Ci64ApmpupdffGp2Fy5RO/Jn45v2XOqXBukMuub0/XXTEkaw7
         ebuyZZOYOTAqzvIGlISLJlEYRlkVe9s5ztxtcvBp1eSpNZJgzoxbyb5V9nNhcVSD9JOy
         9FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788550282; x=1789155082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IasE0lL7i4xilSrjoP984i9qLy9vPz5YGSTLXTZQjBs=;
        b=RZflPxPkuvaakDmMPhSonZZNvVRjRK7/WZjRiDsmE6ZGE5sUeK/JIXkM3goaKNyUOq
         PeHU3YGwTDb8CjzfpYCQgZw3J/oH5t3Zsg5bIJyLL3aXuK5YTfDHtP4/kriS5YRkpnl1
         drIHn/kxnzMbI21+0T6do4Oop4GoC4aoNHIuoWeOB14Dp/vPnvWqOctDjkfv5lvBVCyk
         aLxshT4ggehWj8O+Cw7EBmmdLLVt9rCAyQkmUHmt9Fa2d3EexvaFeESjQTErq7gt7GM8
         ZfZKtxjXRzGEfMYhJl5pzJonMwNm7/1z3BylHmkyCt03FUFbdUgaqne+mrn6ZcG2e4xH
         nbiw==
X-Gm-Message-State: AFuF++kh220JEghWmZ83PPj1g62QI9UlClSHrxJClUsoy6jFg+OoSOf6
	w3jlbwiGtpnaviwCEaLoEgW1Vs9IlvDyAJcn0WuctnCJNRS8iTDxVD1YDqMW68ciYEE=
X-Gm-Gg: AYBFou1Kvv9ljqOcZOTToXbDzfOiaYrHr1S8NwcDjQc9M/WsWGcQMB4hz6G/Vwx+pqu
	A2nSz2UuEYk+vDizjkvqAo0eOausMVoscoe/ELHMevXui3FnyOv6bzBAdkAPRkkpa0I1xykRt8K
	uDUCyfQIr5S5Jq/rnrohgmh3fAdLd1DjVbGP0qCY+P6b97Rpzgj+TvICG1uElNZIM2y73MFVyMf
	DKNHKidoHe0YO9JFHKpUDp9810yTfftjEfbBqN6UZXH2eYeWTu7eqzB/vT5k0zM1gPB57pDZyKx
	kjbgMOE4XHkxuiORhX2Q6zHk0WC1lGWpQaMvx51xXGL/GSfBByi+7zPB18SQEV8US16mcDy2qtH
	TVftAOWl0xlByknJvpn68Y5JJZ2ZMWx9mCJMELmEcHktThRMl01PifYiRGY5LLnrm0wyfQg58Fv
	4w0ikOggEYU8ydFcvknUDnH/X7Teu8ansGWLHr7kYyLRwDiKvp0Y2CcBvZdqo9Dpue36L/iWUOH
	kHrG4twJtiUTb5KBqVJu/v1iPZqapspH2cvR3+ifqpO
X-Received: by 2002:a05:6214:600a:b0:8f3:cf36:15ca with SMTP id 6a1803df08f44-9103ef8d685mr86892886d6.9.1788550281921;
        Fri, 04 Sep 2026 12:31:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664474sm28898236d6.21.2026.09.04.12.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:31:21 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:31:19 -0400
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
Subject: Re: [PATCH 2/2] sched/numa: scan read-only file mappings in tiering
 mode
Message-ID: <apsX_E8GBzfp6lui@gourry-fedora-PF4VCD3F>
References: <20260904182006.1562449-1-gourry@gourry.net>
 <20260904182006.1562449-3-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904182006.1562449-3-gourry@gourry.net>

On Fri, Sep 04, 2026 at 02:20:06PM -0400, Gregory Price wrote:
> @@ -4302,7 +4316,7 @@ static void task_numa_work(struct callback_head *work)
>  		 * VMA can cause others to become "permanently unaccessed" if a scan
>  		 * cycle is consumed entirely by the large VMA.
>  		 */
> -		vma->numab_state->slow_only = false;
> +		vma->numab_state->slow_only = ro_file;
>  		if (!vma_pids_forced && !vma_is_accessed(mm, vma)) {
>  			if (!(sysctl_numa_balancing_mode &
>  			      NUMA_BALANCING_MEMORY_TIERING)) {

Sashiko thinks this causes unneeded rescanning, but I don't think it
does. The cursor prevents it from restarting, and when we loop back
around reset_ptenuma_scan() bumps the sequence.

It also had concerns about concurrent scanners and ptl lock contention,
but mm->numa_next_scan only admits one per scan period.

Either way on a rewalk the scan hits pte_protnone() and moves on.

~Gregory
