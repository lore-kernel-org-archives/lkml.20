Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CCF3C7691
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174442; cv=none; b=E7FF+BaF2PhYA6NtAgyYsRuRDiTLOcE2o1jVkHaoZdFyd0/E9hxc6I/iU/6lccaGTm/6qPkGkGOIw6D/vUNqOuZ8A3KionBCXdD+2BZTmyHMzcaPRKGUnd0oQetlGQEphLzQn8KrB4nlXADJRAJvSIRNJLzFezJx14RwLgHf5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174442; c=relaxed/simple;
	bh=Fnyh6hqs6x+wESv2dZcvtS4pSeABTF2o86CklC/OzYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAgyIJFhDpUUUdfs7jED+5YZzUxezqEKNBvhV9XlKcEjOM3YccAMrRknJBIXjuw8aprYjWnbBN9EKGf10NADYvVo9+Y1SnxPBqnPSOf8ZYALvuBgodKeUT2ZbyHXWNgfG2Ak/dcBOPU4ajYVs0Z+VVgANuXLBOz/rcIFmVAZVAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HVbhSAW3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HVbhSAW3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F40A1476;
	Wed, 23 Sep 2026 07:40:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47E8D3F86C;
	Wed, 23 Sep 2026 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790174440; bh=Fnyh6hqs6x+wESv2dZcvtS4pSeABTF2o86CklC/OzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVbhSAW305B/u/SyYJIr24fqH0aWICUSiZpJKBmRw1t8e09RJjp16mh1cREvJ/otd
	 x7hdyl+qNd1EbYKzKse8MB828tPnm1bPGAUkDWlG/NqZ6tK9WOS8jI79Ybvk1t/3/8
	 qspizVU38Fm/Qfp4kGdIqPiWQMhJFDVnSLW9vuwo=
Date: Wed, 23 Sep 2026 15:40:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: "Bouron, Justinien" <jbouron@amazon.com>, Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Quentin Perret <qperret@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Kudrjavets, Gunnar" <gunnarku@amazon.com>
Subject: Re: [PATCH] arm64: Add user and kernel page-fault tracepoints
Message-ID: <arPk4TgOZAT-kax9@arm.com>
References: <20260520045524.75670-1-jbouron@amazon.com>
 <20260520073606.GA101133@e132581.arm.com>
 <FFEB5A47-7651-4607-A127-8CC07D241F4C@amazon.com>
 <20260909175058.GE200420@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909175058.GE200420@e132581.arm.com>

On Wed, Sep 09, 2026 at 06:50:58PM +0100, Leo Yan wrote:
> On Wed, Sep 09, 2026 at 01:13:42PM +0000, Bouron, Justinien wrote:
> > Thank you for the feedback. I've posted a second revision at
> > https://lore.kernel.org/lkml/20260902115216.49158-1-jbouron@amazon.com/, though
> > it doesn't seem to be getting much traction.
> 
> This should be in the arm64 maintainers' scope (v1 caught my attention
> due to it mentioned perf related things).
> 
> I think the main question is these tracepoints overlap with perf sw
> events. Could you elaborate on why ftrace tracepoints are necessary?
> ('perf record' and 'perf script' can provide similar info and we can
> avoid extra latency).
> 
> If the maintainers think this patch is reasonable, I'd be happy to help
> test it.

I'm replying here rather than on v2.

Back in 2025, Steve and Will suggested a generic helper that emits both
the trace event and the perf event, so we don't have to call both
independently from the arch code. AFAICT, this patch (nor v2) doesn't
change this.

-- 
Catalin
