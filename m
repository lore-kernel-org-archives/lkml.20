Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F181392C3C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790934; cv=none; b=csEyVv8Aryp6r/bvsFti+rrdGZcq8udkv5oYqMIUe9dNwc0JTyGOz7sBJKC3hKEToQk3HQ827pSJVjuSdyExDF9Q+5bKzXUh21K6bXaYuQufuzdxMXEUamWPdGlkKyDO3ZeHVTyEeWSBeg3u5V+L5Ebpr/b4eUAk9UyIsb7J0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790934; c=relaxed/simple;
	bh=lJ1McwXrJPdrDQLppEzrxBFD2h+aJw/Iefl3+EvTTm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bt19P0jodGc0A8XNRHeViYCtkRrj8Kpx/kzQ05PDg0gJ996xeyvDE+IT8kR2xAOi4Vdc8R30E675MdyJ5FtnyYHKrSfeqwhLWY5Lw2x1hCGAXZFQNtPeXp4wc5AshrWVVb+UlVt4CD4/mTkpjZzlij3isl9AiH2TFeuzScOZ9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNBv21A2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNBv21A2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31ADF1F00A3A;
	Mon,  7 Sep 2026 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788790932;
	bh=+eQ0JhHAR9Nb2YbgKhttHNHzVi/fsVIUMYsBPzyXZz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNBv21A2/h9UcBAITs2+2sVkQ/kZGOOOpvVGtKQ3kv9x9FhcjhFByRFWCLH9Kkpvy
	 glqUEWt/Ryh7QRu6NUg6OyzmMcBCkdqL2SgyJwdMPdG9VhCvbD2w7uIa4o4izjzQou
	 cBKg3anJH7vAA/ppSpikYAmMYIRBAMw4Tc3QLfaLTkLPEjwpjuKTUHCVNShj3xY7eN
	 /5upgrGKvXrqIEBYeacsKeCeADRQnqWavABJI5Ht2fJ3cCPTf5Yzdp+iQaA1oTZI3X
	 BAZT+TJxtphEq7+f7drtP09YVP4rM6EpUKIDut9oVElOqNRwdYbiukZfW0ld9XsBnZ
	 ZqAjcBbMpOlxg==
Date: Mon, 7 Sep 2026 15:22:10 +0100
From: Harry Yoo <harry@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/slub: unify slub stat definitions to simplify metric
 additions
Message-ID: <ap7HQXiSl-fL6Pn-@nixos>
References: <20260814071848.46922-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814071848.46922-1-hao.li@linux.dev>

On Fri, Aug 14, 2026 at 03:17:02PM +0800, Hao Li wrote:
> Currently, adding a new slub stat requires modifying three separate
> locations: stat_item, STAT_ATTR, and slab_attrs. This is inconvenient,
> especially when temporarily adding metrics for debugging during
> development.
> 
> This patch borrows the approach from SCHED_FEAT by introducing an ITEM_EXP
> X-macro, which is then temporarily defined as different operations at the
> three locations (stat_item, STAT_ATTR, and slab_attrs) to perform distinct
> macro expansions.
> 
> Going forward, adding a new metric only requires adding a single line:
> ITEM_EXP(XXX, xxx)
> 
> Signed-off-by: Hao Li <hao.li@linux.dev>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
