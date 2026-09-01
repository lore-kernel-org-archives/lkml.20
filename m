Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003932D12F3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304538; cv=none; b=cU1Q7AYprFdUVmu0A37O3V3qvOCB7RZc4uO4Tcas4b2fz/2c3MjhtanxGOZkysnIxMR5jYEYLTrQINNs/i4skTQ8KLPwFlP5bhDlaL8j/QSSBadHxMe1k8lXxKp9ud5QDVGvHJp0gUN5uVmeWziZLW+WHbIUBz73HzL6XVYdSk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304538; c=relaxed/simple;
	bh=KghWR8C2t0v8D4gvmunPq30/UgtV5CX3Pxo8mVnlTOI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eTcaUoaWCloyjki84IXgKKSbg9/nmh1ThZa5IP1zFhJvQ7GG+c+iYz67bRtluEv3Y8Mbd/+yyRNNYq/lQHqceVsnE/9rM3gvbV/7QbtwUCoIInRbq/fMokrpLZDoLcKWroqps4qIC/5vtTqH4Z4SgaUfiuV+FdWcBgwcHoyos1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qatFfxxL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qatFfxxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0097B1F000E9;
	Tue,  1 Sep 2026 23:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788304536;
	bh=641uvQa2RnfIvuFeR+FjSK3wz4QeS4TjUN3ipgvblAM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qatFfxxLwnXhAEEO40/24Fp7qE6ioZHuEqLjp7MOJFSl/gcDd2kfuO8RAXhYqYFsG
	 55p0LqfE+RRZfkxKqM3783D6v8MHv0FxHCTCbgnO0ggPocYkbIAroxRJ08xSs9qzKk
	 zHY2Ve36wVg4E9xhO9T0lB3pIQ48l5wyybk3tktQ=
Date: Tue, 1 Sep 2026 16:15:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Richard Chang <richardycc@google.com>
Cc: Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, Shakeel
 Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, Axel
 Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei
 Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, David
 Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Suren
 Baghdasaryan <surenb@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Martin Liu <liumartin@google.com>, Minchan Kim <minchan@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Michal Hocko
 <mhocko@suse.com>
Subject: Re: [PATCH v4] mm: vmscan: abort proactive reclaim early when
 freezing for suspend
Message-Id: <20260901161535.70d685be6a70fea1f6e05b18@linux-foundation.org>
In-Reply-To: <CALC_0q_cap88s5JBzU=bEkN+66VvMi=e+2M1b_JsiTYmV2t21A@mail.gmail.com>
References: <CALC_0q8rz7U-8x+syTFcWS6Nihxvzd00ruzOThb90P+cDqi=TA@mail.gmail.com>
	<20260720044103.905191-1-richardycc@google.com>
	<20260719222306.540829de219e12e21396d260@linux-foundation.org>
	<CALC_0q_cap88s5JBzU=bEkN+66VvMi=e+2M1b_JsiTYmV2t21A@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 20 Jul 2026 20:04:30 +0800 Richard Chang <richardycc@google.com> wrote:

> Hi Andrew,
> Thanks for pointing that out.
> 
> On Mon, Jul 20, 2026 at 1:23 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > So 287d5fedb377 led to suspend failures on MGLRU-using kernels.
> >
> > That's a regression which justifies a Fixes: and a cc:stable, don't
> > people agree?
> >
> > AI review asked a couple of serious-sounding questions:
> >         https://sashiko.dev/#/patchset/20260720044103.905191-1-richardycc@google.com
> >
> 
> Hi Michal and Oleg,
> 
> The -ERESTARTSYS concern raised during the AI review seems reasonable:
> 1. Over-Reclaim: If a task has already reclaimed 900MB of a 1GB
> request before being interrupted by a suspend, an -ERESTARTSYS would
> attempt to reclaim another 1GB when resuming, resulting in up to 1.9GB
> of over-reclaim.
> 2. Incompatibility Node-Reclaim: Since reclaim_store() unconditionally
> converts any non-zero return value from user_proactive_reclaim() into
> -EAGAIN, it will not restart the syscall for node reclaim.
> Given these constraints, do you think we should keep -EINTR in
> user_proactive_reclaim()?

It's been a long time.  Did the above two issues receive consideration?

Thanks.
