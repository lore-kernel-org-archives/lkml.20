Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2DE37D124
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976264; cv=none; b=jf1w/hY4+DY66rfg2GR0kO2QYm5VT4FbDBmTn9HTN7So8+CwREfCWqrBWM+0JeJ/Mi5XnbXXDzdrwFtKefKC1iw2EnI5kdh1NWZtvpTvQKSpV+GZ8nUxk07dem5lmyQ3qDAjXCv5+rjbNd3pzFC2xD6Eehiidc/SOqn6gu6GwBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976264; c=relaxed/simple;
	bh=7Vhuf1iZFkwe6WdcpSNqvT1waKG31SWv7t0DuAd1j/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWc/LcoUqtfLZpDomfqREbqsVLcYMt/7COOexT52+z/rV1HTRtyu/0dCR9oEcda0TeMl2/U5VOLXHCHlYG/xp4XgEB5dyLxGZwDITqlcBjH1EUQbS+lxC6OMNU9R2yOV8M9DaZrutkdgCTcd0HsqMGfTOb0pAFbMAbwpewpVA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lCkvkSUj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lCkvkSUj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CF9F1576;
	Wed,  9 Sep 2026 10:50:57 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6382C3F528;
	Wed,  9 Sep 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788976260; bh=7Vhuf1iZFkwe6WdcpSNqvT1waKG31SWv7t0DuAd1j/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCkvkSUjVmgC63A8DcgNLu8rYIyPcrokQcrsyLqXVqan9fYv+ENwYTis7kB0+VFpP
	 K5e2UMBtgg3NkTJMAUjPp06SQ3F9foXYseWr+p6ou2e8ah+dq+xO5SbENz1WLdv2Zc
	 4VQet3EFP0My6FkdBUlclD/4xU/7JzYladQ+KI9Y=
Date: Wed, 9 Sep 2026 18:50:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Bouron, Justinien" <jbouron@amazon.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
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
Message-ID: <20260909175058.GE200420@e132581.arm.com>
References: <20260520045524.75670-1-jbouron@amazon.com>
 <20260520073606.GA101133@e132581.arm.com>
 <FFEB5A47-7651-4607-A127-8CC07D241F4C@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FFEB5A47-7651-4607-A127-8CC07D241F4C@amazon.com>

Hi Justinien,

On Wed, Sep 09, 2026 at 01:13:42PM +0000, Bouron, Justinien wrote:
> Leo,
> 
> Thank you for the feedback. I've posted a second revision at
> https://lore.kernel.org/lkml/20260902115216.49158-1-jbouron@amazon.com/, though
> it doesn't seem to be getting much traction.

This should be in the arm64 maintainers' scope (v1 caught my attention
due to it mentioned perf related things).

I think the main question is these tracepoints overlap with perf sw
events. Could you elaborate on why ftrace tracepoints are necessary?
('perf record' and 'perf script' can provide similar info and we can
avoid extra latency).

If the maintainers think this patch is reasonable, I'd be happy to help
test it.

Thanks,
Leo
