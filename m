Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BA6371887
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209313; cv=none; b=ME0MILtkZfihNmVicmQZKRB8NB5T4tqZ1+lJsHPCQfwTobE3Mrs8oNlYHUqB3Rkp0t5s7Xp6YozcCuPaQi8jmlGPQAjpTHgMZreK8G4xYSbhbJAE/Qmc7wQSPFK2/9xDiXVh8W0fP/AqgNcikbr3DJKP1FASDerZlRD7P+0ZPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209313; c=relaxed/simple;
	bh=oxOOXvXAOWeu+5M5xhwFj9GPUxJrD4NtD21BFf4uuaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itEgoLN9B8hFJls9Cx0c75AIpt+ITbYYYDDy6FEoH03o5LSZHmsjM3q0t3TZCz4MDwDMVA+3QZF0ZnRUSsqLc6nt9seJeHtEF7WoFUdXgZB/oRjSrni3GfmpESxhEw2MuXpy6u8ISYba2OTpXnbsbBixzB7ySjMdt9d/6lNoY80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Yn/qX6Bs; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Yn/qX6Bs"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0aso10115536d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789209310; x=1789814110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpM6eT1qzg3MP+tpnO3cMXPs7X9oqBa+IzWYgCHuf2Q=;
        b=Yn/qX6BsgiidJ/SO0H/eFwZjt409W9MW3f7qwF4woXjVB07nYO29ov176KW3p/exox
         SZp3ScskkE8eJ3tIcjPaVq+4lJBjhnfr5s4/iFLVcMB8NWLkRrFfy8wE2QeRcN+plD2w
         Zr/sjrvChV4tgzzoUUX2/xnTrNzUYcQRxQ3KHwyRtUSqVnR+xU4K2j4dHhAiI+iNQz9A
         p9iebLDrzlK8x3GrfBpfjbOJtqOJjORTCyTmZqjR7Q+cnvpshmLJoUrmEpS/7jCQwcdH
         JD7SytQeQNEFrmboJAalUHZmZ1MyWW+hHrMcKQke1Q8g586RVp0pfFj2TnGJdm2QUq8i
         mERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209310; x=1789814110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpM6eT1qzg3MP+tpnO3cMXPs7X9oqBa+IzWYgCHuf2Q=;
        b=WvhUhmUtzmyqN386fRh583AWVAgKOGwwqwljceO/j7HwM7wyL4SO7Dly49MleVlzPN
         ZGaLAA/1b7MaUTYqWZgdKinqxbO4h6NAZz8CJ5LFNlZWA14IoUiacBDWS7fhFJHg4IGY
         VSPhtLbGPDa5eQe9XZGy1P8kiq3JVVV2uxuTtzhi6mhaV1whIhR8I4tdmj6QaUAvb6yd
         dz+mj27C+42DoOCaHL0Rrxuileh0S/1sUhBj/dPI7lqkPOSfiw/fiAJJgLXl9fWXFK0f
         c+NyjpUY0Lsybkq9QiTzqsVyntvAU1bC35GfL2NGGKrA75U8Fdqu0kCmrcStRbX4RWH0
         7t0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxySv0putN2+SNEyCvxm0CEGackFopxt8fo+n051fI/EYUSCJ9kvRBninAoXzYmSeUi7ISf8enUMI7zq1c=@vger.kernel.org
X-Gm-Message-State: AFuF++nzM8ubIR98DDoUljWF9BLd9re1VW/zS0KltgfAnjOmGXoTC4UT
	voZP7DbF0FU9dADbDHWDBhyAutrK9AKZud4n4T8ZwFQrhwVzyt3y4nmFINuGZ1CSMIo=
X-Gm-Gg: AYBFou1WJ5Q0T+IuHpflKH+p/AVrqnPC8/j4t9mNZgEJz+KSRxNS6SQoCeK8sBGukSW
	8jtDG1HmBhBXDODKJSNIBQ9NUtGUlun7hoW5RguVcKfLMvEzJ2Tf7Y1LjXnxx8geaQQtUvjKIN8
	m2/1BK3JHnb7NR5Z51XvFSrBAZQLvJHkeh3aDDJMxM2nNRFzxhJGDqoNLjqExdCPJ4KfPwfdYUk
	nakn9i7X1hcFv6rfbi1m+XXRn6T84uAMc2uQYVoe3KWFhf0VxTbMJ/wieAafYIuGDPc6ecv3qyh
	L1wrb3InU7Is0CHLz6+fNHP4WPXGhJ8IK7IQyfmeSBrHEBpYzzC1OXGgrZQ+06iSs4hofgaNmYF
	YRi/KiQNGyZ3LrfrnyGhgbAAv6tb+3Y3hdp+Upz6j6t1i5pPxuuSSL90sbv6dA68osOLuHj1VcY
	ktYVbd6luVBB7CHyDZO9yJN70VKMjngS2xQjwZ1f4cwMkJ2zHYS/750Go8mS11bVeKTY/V2GnVn
	311F+c2stXY4RymsgzT94bOxFJfecxk8lP490kNEZp+SSoTFUUDuLmX4j9OqT92Rg==
X-Received: by 2002:a05:6214:6283:b0:912:12cc:33d with SMTP id 6a1803df08f44-91212cc038emr101201246d6.23.1789209310586;
        Sat, 12 Sep 2026 03:35:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f203320sm43584706d6.1.2026.09.12.03.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:35:10 -0700 (PDT)
Date: Sat, 12 Sep 2026 06:35:08 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	liam@infradead.org, ljs@kernel.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, peterx@redhat.com, jgg@ziepe.ca, 
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 0/2] mm: stop calling pmd_folio() on special PMDs
Message-ID: <aqUqefve3AEiJiPq@gourry-fedora-PF4VCD3F>
References: <20260912034833.2952750-1-gourry@gourry.net>
 <20260911212503.bcf8461db17ebbf51233826a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911212503.bcf8461db17ebbf51233826a@linux-foundation.org>

On Fri, Sep 11, 2026 at 09:25:03PM -0700, Andrew Morton wrote:
> On Fri, 11 Sep 2026 23:48:31 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > Reproducer
> > ==========
> > 
> > No hardware needed.  An out of tree module stands in for the drivers above:
> > three misc devices, each with a ->huge_fault calling vmf_insert_pfn_pmd(),
> > plus VM_HUGEPAGE so the fault path takes the PMD branch.
> 
> I take it there's no known way of triggering this in current mainline?

As far as I can tell there are no in-tree modules that reach this state,
at least not obviously.  

~Gregory
