Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228BC4E1C94
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547263; cv=none; b=WauE7+w0BD7BTutqZ1dIj/Ntt7ymTZ6pVvWFcOJPZp6MXPxB+T0Lpg/2oquiWcehzh5P6yvsne6T8aFy2U5eOQGqYz+qrlLKsG8sF1aSxEmNr5ov35vU/99MUc9RQXSLinw4uuJTCnY2JD4wkf7sX7N2RlajA41nKf+ZBsvvwLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547263; c=relaxed/simple;
	bh=ylm/aSO3VReiBIYgx/3tzjQdftwLhZt+BlFfTVHiEG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUm+NoPDdEe4fUcl9YOaVSSQDkaVSeiD04BoYFYF5uK84IUSeQ+olpPjJ/rLdHz3P/xa+xnjknVT7xwl4N39kx9/ZlUCzWxsHKTaX3i0oNAG1XX7pf69gfma5vJsGMogBX5ZTLcIRLwgGfACTVkNem0l/EdUXbZ8jwMgj4JhGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WM8sWNy+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WM8sWNy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF821F000FF;
	Fri,  9 Oct 2026 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791547258;
	bh=PtDg7zGOUdMGLv/ZahPOgjjgj8LdOaLD/DRMIGrkAVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WM8sWNy+t/arfWSPsWRfTo7XmQhCgArwkS2Tc0vcFBAHtCEVSBQx05PqE8cKbCUB2
	 9KlAxBbJAMhG6YjFPas0TiXTYnEsCR/gplgrCn574V2HuRRIc7ZuJqDShLXNO+wfDh
	 c09VAoR7Ovm+PLntCBtUIDjzMy//IXKHrPw22nVVRi6q6UdJd+bzmBaU6KidkqZi2x
	 Lx6/6kFrhAJ2zDW874gAimMrfnAr3/D9d2zXDQKNbp5qLgCAJzk6qD/pgbZpl+WbyS
	 ctq9FUBYpbyfNrD7vY6DUeF2Fsb+kjFw5kaim5GSKtDm2c3s4EMQFoKqgfzVElbBbk
	 EHLHxVpsan3iQ==
Date: Fri, 9 Oct 2026 13:00:52 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	qi.zheng@linux.dev, jack@suse.cz, pfalcato@suse.de, ayushr@modal.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: memory: fix truncation removing mapped folios
Message-ID: <asjXJZap53yJWMYi@gremlin>
References: <0d2a1809fa1cfc22ad3df26ec28b2d30e5cdf3bd.1791540483.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d2a1809fa1cfc22ad3df26ec28b2d30e5cdf3bd.1791540483.git.baolin.wang@linux.alibaba.com>

On Fri, Oct 09, 2026 at 06:12:03PM +0800, Baolin Wang wrote:
> diff --git a/mm/memory.c b/mm/memory.c
> index 1f5d5f7d39cd..0272217ad7b0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c

> @@ -2044,16 +2053,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  	 * to ensure they are still none, thereby preventing the pte entries
>  	 * from being repopulated by another thread.
>  	 */
> -	if (can_reclaim_pt && direct_reclaim && addr == end)
> +	if (can_reclaim_pt && direct_reclaim && addr == end) {
> +		/* rmap changes need to be observed before e.g PTEs get zapped. */
> +		smp_wmb();

What does this pair with? You should always say what in the comment.

rmb/wmb are generally not needed vs. acquire/release. Are you sure a wmb is
right here?

--
Cheers, Lorenzo
