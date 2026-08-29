Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938C731E844
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965420; cv=none; b=BGhh8gXtCdfnzLHBt068oc5Z1GVg+bBGwDzVN9USvmN0M/ZkGLb4NAiW/Supymtzxp3Ka7/t4D2LTfkVy+9LRmupudkMX2bWO0iPBPiHJgwH1RcNMbWMEYAA4qScbMm2Mlc/pxgT7x9c/vII21Cr7EUQ9Ty5AlCegnuopD/fqrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965420; c=relaxed/simple;
	bh=WrD+6JDQR3hiTGb8wBsGGQ4p/RwFwk/EytC3ah3Wum4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kzJeMAZubpmEjmQ3bS8hOj6pXj1lvKsK2zvFUT2GnP7YR+R+D5CQHzLWIBnTNptNKMRq4RFnVKEiyMAGQfzi7u/rckd/Ra+cnP+I34DWesrmykv3YRx7PETT4a7TpT07K6wEs9o2TTOWTmaq1gXDYrEsTu/MAs3IXu4849ignPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eQwi8PNY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eQwi8PNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E994D1F000E9;
	Sat, 29 Aug 2026 01:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787965419;
	bh=lFyln8QEmRs5uikiP3R7oCsripVvL4fOG8PYbkvVJso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eQwi8PNYwht4MHbQ1LuAdmHY+ZwV2eJWmjfwdMsNOuFIEYnKT/CABsi1AMO5LQsl4
	 wH87a3S9v/spu2LY+5iXkE8GuZLou2B7oj8Ih43AWNHKHSUU9luXorPmcYtAt681+C
	 1zYsnMkBG9SwtSqkQ1DvTIvEqSHmgpVL7PwpjPcE=
Date: Fri, 28 Aug 2026 18:03:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>, chrisl@kernel.org,
 kasong@tencent.com, nphamcs@gmail.com, baoquan.he@linux.dev,
 youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm, swap: Fix potential NULL dereference when
 trying a sleep table allocation
Message-Id: <20260828180338.0e62379137b832bd66d48b7d@linux-foundation.org>
In-Reply-To: <ao_ybL9yRO_pHphW@KASONG-MC4>
References: <20260820115505.20027-1-shikemeng@huaweicloud.com>
	<20260820115505.20027-2-shikemeng@huaweicloud.com>
	<ao_ybL9yRO_pHphW@KASONG-MC4>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 17:10:54 +0800 Kairui Song <ryncsn@gmail.com> wrote:

> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -466,8 +466,6 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
> >  	if (!table)
> >  		return -ENOMEM;
> >  
> > -	rcu_assign_pointer(ci->table, table);
> > -
> >  #ifdef CONFIG_MEMCG
> >  	if (!mem_cgroup_disabled()) {
> >  		VM_WARN_ON_ONCE(ci->memcg_table);
> > @@ -487,6 +485,12 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
> >  		return -ENOMEM;
> >  	}
> >  #endif
> > +
> > +	/*
> > +	 * Make tables visible to cluster_is_usable() after everything is
> > +	 * ready.
> > +	 */
> > +	rcu_assign_pointer(ci->table, table);
> 
> Hmm, but for the error paths above, they will leak the new allocated table?

Sashiko thinks so ;)

It also might have found a pre-existing data-race which seems
sufficiently on-topic for this patchset?

	https://sashiko.dev/#/patchset/20260820115505.20027-1-shikemeng@huaweicloud.com
