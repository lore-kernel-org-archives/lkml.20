Received: from one.firstfloor.org (one.firstfloor.org [65.21.254.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37296388386
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.254.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195153; cv=none; b=SulQ2XdQJisIVpz8PXPWvGfc1b5sdCYztQXLVEV4wI2lvT3NcV0uF6K/B3RuIoVohtoYEr858h100+CBfh2vFVBU/4WKVMAmV2rv+X2xNxwkvyxQPizdUt5Zolv0ahlPgogAsvUMYdwCxdXraVD3Dn00TsIx3xMjZDkft1Ho0Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195153; c=relaxed/simple;
	bh=PS9gcAYzeHfejVxPpV+vxCosTIOYM5e3fDncZAqqlB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNILSucFfb77a9Est+9pZ5fU1bI7VFgDUpkIlof+EZu4SNjzDxGg4vw4jRKu6pOvSGyGznfOuOH/jzjYby29HGTYylDKxOFW0SjKJIwcssYJEVvLHAoZhihhxY6C1AqdBgrrqc5EZEiryzPeQ5+cZUW0jb1cOB2HrMGJMzyOwtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firstfloor.org; spf=pass smtp.mailfrom=firstfloor.org; dkim=pass (1024-bit key) header.d=firstfloor.org header.i=@firstfloor.org header.b=uTRr6wo2; arc=none smtp.client-ip=65.21.254.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firstfloor.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firstfloor.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=firstfloor.org header.i=@firstfloor.org header.b="uTRr6wo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firstfloor.org;
	s=mail; t=1788195148;
	bh=PS9gcAYzeHfejVxPpV+vxCosTIOYM5e3fDncZAqqlB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTRr6wo2HhJ4ZiqcxLFjJa8QCaQct784UPFzGTwjJzoGfhM0DfrvYM7mNwIvKkbTr
	 3LKXT/vudsHTyl3wNQANK3jiXY1gQKCYl4aDCfvHedYPIukFzYfdgJ6iQYGw15yOeJ
	 bLuTMekOrq5Y5tbUjUqVWYtl9GDV2eDLSaUPqB/Q=
Received: by one.firstfloor.org (Postfix, from userid 503)
	id 9965D63F88; Mon, 31 Aug 2026 18:52:28 +0200 (CEST)
Date: Mon, 31 Aug 2026 09:52:28 -0700
From: Andi Kleen <andi@firstfloor.org>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: Andi Kleen <ak@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org,
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RCU safety for vma maple tree walks
Message-ID: <apWxTNwhaMU3XiZP@firstfloor.org>
References: <20260831143511.1133029-1-ak@kernel.org>
 <nq4g527ozizmp2iqmozau7xwgdq4cny43onciw2mw7vu4bwabg@uzkdpjchygkn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nq4g527ozizmp2iqmozau7xwgdq4cny43onciw2mw7vu4bwabg@uzkdpjchygkn>

> 
> Did you check this with lockdep?

Yes all tests were running with lockdep, and it didn't trigger.

> 
> Any access to the maple tree without holding the write lock or the rcu
> read lock will cause lockdep to complain.

Hmm, seems that's not working for some reason?

The VM callers of for_each_vma clearly don't take rcu read locks.

> 
> Likewise, any sleeping while holding the rcu read lock would produce
> warnings.

Right but the walkers don't use the read lock.
 
> Note that you do not need to hold the rcu read lock on the vma maple
> tree if you have the write lock.  This looks to be the case for most (or
> all?) of the cases you have below.

Yes the write lock is hold (like I discussed).  The problem isn't parallel
modification but that splitting during the walk invalidates the
iterator caching if you sleep too. That's all purely on the local
thread. The only contribution from others is to cause more sleeping
due to memory pressure or rescheduling.

-Andi
