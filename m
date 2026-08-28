Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDEC3D3D00;
	Fri, 28 Aug 2026 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900151; cv=none; b=LhfHl2eyA6ydVVUFqGUtUAvX4XRK3IdY+Sb6p5BO8Xml7SL1c5OVN/6siietf0RJdlp95SYzBkRlQfyZt/I6ouvNPQc2WHRpzcQVyxkl9D/lzUyi346ClI8FD3QSnYdQPDVUeXqm0jF06oHmdXO3QPFLPgLmylyd98X3j45tGzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900151; c=relaxed/simple;
	bh=1wD3Uz8gAyZ7jOW4pqesE0IMW7BY5Uxa73JM5+/htw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gw14r8G+wL6+QiQg2VDrwgRUoXDn0GEXiXw8BnZOE0btRdhwIaIusdLA0dM7ZGYB/8gA611mEhIPtKTZz4SpfL2nuGmlNuQsgsfK7l+Us+/TgEZp+xoQ5tBrR6DdcrfqVUhtVKgGVd+hxWp/1Aq6AMQ9ZLpfbcTv/mI/PgIbaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wDleSVC9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wDleSVC9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VR8gL/Gjb+798P0BLcJJiJV8xjvD6wSEaM0L/3/wNxc=; b=wDleSVC9JuDz5uo6EJKA2QwsCH
	hnIM9iFL7RMJZ3BYhkfU0KKeUc69tZfW+7k/7XV+BMpy5Lp7AMbhrlWpYmTqw85rUzB3BfDCW+PY0
	zkZHdgM+Mgl99mY9GA+TmcMOFiHY0nCb53CBkDHAsAKO7lXgEcW7pAx/3sy8idFtpxIYXPDUGRd8Y
	THrRmyFRX1aWB/NeHOgr8KvF2Ait0AVDtjg79NLEOZcUOEb3OcmT6hGUEsZEr6/VDAB/pG3RcCJA7
	z0wzKk/Uj5bMfk92sa0k/8mpXghcKM2JP+fGTENviKeILKoJ/WgZM1Sn0rjbj5AB+2RF8imu+lC+l
	xEo6l2yg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqV8-0000000EC7k-2x6l;
	Fri, 28 Aug 2026 06:55:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 40F2B3006DD; Fri, 28 Aug 2026 08:55:46 +0200 (CEST)
Date: Fri, 28 Aug 2026 08:55:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <20260828065546.GG4121339@noisy.programming.kicks-ass.net>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <875x0vfgtl.ffs@fw13>
 <apCtEUnPzdCQVpIs@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apCtEUnPzdCQVpIs@tardis.local>

On Thu, Aug 27, 2026 at 02:33:05PM -0700, Boqun Feng wrote:

> Ok, so brainstorm on the oddballs:
> 
> # 1: double disable
> 
> 	local_irq_disable();
> 	local_irq_disable();
> 	local_irq_enable();
> 
> # 2: double enable
> 
> 	local_irq_disable();
> 	local_irq_enable();
> 	local_irq_enable();
> 
> I think these mean we should probably do count = 1 and count = 0 in
> irq_{enable,disable}() than count++ and count--?

Could yeah, but ideally we'd take this opportunity to finally get rid of
them. We've ran into them a number of times, and I'm sure get fixed up a
bunch at some point, but never made the push to clean them out.

As is, lockdep only counts the redundant ones. They're a stat nobody
ever looks at.

> # 3: only restore once
> 
> 	local_irq_save(flag1);
> 	local_irq_save(flag2);
> 	local_irq_restore(flag1);
> 
> # 4: keep restoring
> 
> 	local_irq_save(flag1);
> 	local_irq_restore(flag1);
> 	local_irq_restore(flag1);
> 
> these are a bit tricky, I guess we could only fix the users? But we
> should not postpone the infrastructure because of these?

Yeah, so I do have a solution for that, but it is too horrible to write
in this small margin and all that :-) Thomas will kick my ass.

Best we simply detect and clean up.
