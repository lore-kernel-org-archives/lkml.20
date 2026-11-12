Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470259;
	b=R+w3wWAYVqtZ9AeMr8GULWEUXlfQsX8+ACGYb2ukJnClPuKp7K+yySWskqqvBknjT5hv
	 0SON3VsAuhH4DD6yYpQwRikLDNnyBygknyofsrCuUMpMpCCN56iMe4OdiQJs9TsTUUDrr
	 XXZABkTVG7oziwHlPNioamMEY0P97vWm+AEyP495Zbbz/i9BqNEh1iLoWgjGTa+xTu5OS
	 cHsyhRkbueAKEkmTsc0MabW0g64wp9bza820BCc7IK6tzUFEFqxUP3vNkf+aULaXgZ7zF
	 fjRCPNTxFwg5X4r1WoyVTN2S0e9DKnXzw5G2hNd1DoCAtQmL6bgE+Extb/cbsWB09Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470259;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HAXiNOcrGlTDifka8zYV26XhLrMTpt8vrdZKcBxEAck=;
	b=0OfNp9iv2JNYqd6KNu0muq/QStZ5g9ffVWWuYTsw5OwUzo+iD0T5NIArlULLbgNbrQPY
	 +emrCJth/RBNqUEVHDhxItF9fIvdJgYQa/+C4vTWhn28zdhEDhr7d+2kshn31vc37szC+
	 SKkmE6QSbM8uUGXcxFnyj/ReJM9AwcW3ECwAliy37MMYNcRkxNxmi7icFvq6JRRd6JGjE
	 udy/SC1Euto724hMe9DKii2g4gGwnFgqGLZQM/m8Cts6CiyW/sZk8uHQ/uN/Rjle+r6Zb
	 YAu9OncudGtvowMWwVgz3+I9t/n3xljn9oSr4vdOwmNk0AubDGcFlhYjZW9SB8Bx9Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=O6j9OfLi;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E9606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=O6j9OfLi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HAXiNOcrGlTDifka8zYV26XhLrMTpt8vrdZKcBxEAck=; b=O6j9OfLiD48qpRMwXY8DjIlIrM
	6ncIA817AmcW4O2IR7lTv1xTCnvCE6o2rfWHnK9GI27ojn4beoSn42yTQfo4WL0zjwpg5+p4YHiCG
	m8pDeQWs3BUrCkJydgKNE2Keax9LZZjm3cxhvtoqF3ivHKhl9Zaf1tz2cOWP8WAGCVIwt/LRb7ky6
	eSc7c1/ldeNC79XUZHKk+zYlde8E5BysERTocGRDct6oFVhF6DwswhxB8Q2T10dmelhvIblJPO1QL
	cv+nZi2nRnWEInstwXYciKO34COy0uNpRNP2anlfTi1QfYWSB5Yn9jWHU8jrWYXqYUzGgkut8e1Ds
	dJLE+WqQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPgd-0000000A1jw-179x;
	Thu, 12 Nov 2026 07:57:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E1C2530066A; Thu, 12 Nov 2026 08:57:33 +0100 (CET)
Date: Thu, 12 Nov 2026 08:57:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: x86/mm add myself as reviewer
Message-ID: <20261112075733.GQ2668200@noisy.programming.kicks-ass.net>
References: <20261110205444.39dc9c43@fangorn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110205444.39dc9c43@fangorn>

On Tue, Nov 10, 2026 at 08:54:44PM -0500, Rik van Riel wrote:
> arch/x86/mm is an area where the maintainers are spread
> pretty thin, which I care about, and know something
> about after various TLB flushing adventures.
> 
> I should probably help review things there.
> 
> Signed-off-by: Rik van Riel <riel@surriel.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..ef9d082cf1f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -30413,6 +30413,7 @@ X86 MM
>  M:	Dave Hansen <dave.hansen@linux.intel.com>
>  M:	Andy Lutomirski <luto@kernel.org>
>  M:	Peter Zijlstra <peterz@infradead.org>
> +R:	Rik van Riel <riel@surriel.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
> -- 
> 2.56.0
> 
