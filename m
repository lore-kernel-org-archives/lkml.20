Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D4B346E5E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116990; cv=none; b=DrwWWDiN78H/pxRtlo3/Zbz+swNO4ibhSOXHz+06tWJiMW/C9RWH3ztKGrbYZNx/NSFQHXmhgd07EnrR/2U87eQ8MPMI1Hi5SrxdESZGR27MoqNOAx84gWnXKuNo15UoK8R9tIsKQ5VfHOGNZAyjHKLviCGB8J/dhrF8L64IavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116990; c=relaxed/simple;
	bh=FMseS7wkx0J1ab6e2OG2CzC/s2nVYDHwlTVR3mG0lAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPSPZBDTlF1R9i8wR4CmerSsdqBgruxIRFaTNYijGpDBomrbxXe85r9yNf0Qavekm8uUOCpH78Cp5gOg/fOX8fr5BlgxSDdrZBEilGcIgER49Ml1luamM3nA7/WF3Ud8Dg7XryQMX+H1ZKCRi46QYO75yOxeR7rG46iXHp7KMOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEaYaema; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEaYaema"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3400A1F000FF;
	Fri, 11 Sep 2026 08:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116989;
	bh=/WaDDKNNc6/toqft5LhU8Mh6zDSp04ZStewDOUu/aUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iEaYaemaVOQVIEiuIuyeU4o2CEj75uxtoast6xBeOX0e9UhqlRymB+QkPBrRZKO52
	 rDWK1PyOLr419iF3FIMslO5HYA+CrrF7zBiG65M6paD6WXUeGYCBkSpyokJnNSyzNs
	 TX1F+/uGrVFAu8eUAUlNw19+taa8ax9yo+luoJp0XN/BvxtlXR6Z0CgC+c5Y/JIijR
	 KlcciGKdRBXrgNziRLrPiayL3uYyBf286+OXCK6zgACnc0f86yLJVdmrWNXc3OLbDg
	 X7cjeohnbhBWw1L4kcpRFeb/Vl/BXEKz9l2yjXvX4UoNXZE/2DQ5dxYT6LF9mb1/UG
	 UBSr4FuQ13Rqw==
Date: Fri, 11 Sep 2026 09:56:24 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org, david@kernel.org, surenb@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mm/pagewalk: delete the unused member
Message-ID: <aqO_memM4BIbFAxf@gremlin>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
 <20260911160725440VlRXkblhz6f7GJgQfbVv3@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911160725440VlRXkblhz6f7GJgQfbVv3@zte.com.cn>

Please fix your cc'ing.

Cc- everybody on every mail.

You cc me only on this (1/4) and 3/4 but then don't on an mm/rmap.c change in
2/4 when I co-maintain rmap.

And 4/4 is about use of VMA locks which I also co-maintain :)

Just cc- everybody on everything...

On Fri, Sep 11, 2026 at 04:07:25PM +0800, xu.xin16@zte.com.cn wrote:
> From: Xu Xin (ZTE) <xu.xin@linux.dev>
>
> The member vma has never been used, we should delete it

This is very sparse. Can you back this by talking about commits and how the VMA
is actually used? Have you audited it to make sure?

>
> Fixes: aa39ca6940f1a ("mm/pagewalk: introduce folio_walk_start() + folio_walk_end()")

I don't see why a fixes tag is necessary here. The struct folio_walk value is
kept on the stack so what exactly is the point of treating it like a fix?

> Signed-off-by: Xu Xin (ZTE) <xu.xin@linux.dev>

AFAICT this isn't currently used but I think I need to hear a stronger argument
in the commit msg before I go looking myself...!

> ---
>  include/linux/pagewalk.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index b41d7265c01b..1c397be0d092 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -183,7 +183,6 @@ struct folio_walk {
>  		pmd_t pmd;
>  	};
>  	/* private */
> -	struct vm_area_struct *vma;
>  	spinlock_t *ptl;
>  };
>
> --
> 2.25.1

--
Cheers, Lorenzo
