Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A9418A23
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385248; cv=none; b=MkNgy/K6KbE24PGiGrWg/NYsyjwM+vvNHCqstgCpqx13otIcb5C/p+zj+hurMflhURHSc6T0VNm+NkSR3ew5dmy9yiLZ3UevwSCZ/5X9S2qvpHX4Y0PfA+gKWqj0fUYTz5XFc4qHW615pAcDjzUHAGXGMIQZmIiQtn5bE6towRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385248; c=relaxed/simple;
	bh=eJCSZpyRgHgeYEChFVCTr7xP2L5P+BARaf709n1VxXw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rp7bDQ+CAWrVzCqC+2Q3lB1v/gg91MeUBRzB8C9GWkLR6NQNWT2fRuOUvMtQaNLJ5nInXTH5t53rfY2rCJH4u7mF723iHpf/UsndgjveDtcAkNfR2ucPZYbOo5JcW2XTELRdaZeJZZQJbpanim22Y8R+SEglOtMEp5Aay1sgVlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=p7+3HApt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="p7+3HApt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88881F000E9;
	Wed,  2 Sep 2026 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788385240;
	bh=K+6wgjs25er8JUpTPTCJznKS9xjOBsRH1FzmXw7IFy0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=p7+3HAptQoBy2YYTOS9pHN7GZaH/ozxVGuy+2xZ9Bf+W/uxMohWNOwt+rSUg7vzWg
	 l6Vh9rdrWMaNbR55AbDN5U4LyJS4G/TP5iovSG1jMK2xBkTB7RTyiJ+5VxsXDt2jtL
	 n7+WqVSXBcOLErC26vRXJtRtzScRUmqM5tM9Aspk=
Date: Wed, 2 Sep 2026 14:40:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: Liu Jing <liujing@cmss.chinamobile.com>, david@kernel.org,
 ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mempolicy: fix div-by-zero in
 alloc_pages_bulk_weighted_interleave
Message-Id: <20260902144039.2824b7589e87dd185c92d67a@linux-foundation.org>
In-Reply-To: <apgqvt8iIt-a6j2Q@gourry-fedora-PF4VCD3F>
References: <20260902090412.16445-1-liujing@cmss.chinamobile.com>
	<apgqvt8iIt-a6j2Q@gourry-fedora-PF4VCD3F>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 09:57:35 -0400 Gregory Price <gourry@gourry.net> wrote:

> On Wed, Sep 02, 2026 at 05:04:12PM +0800, Liu Jing wrote:
> > In alloc_pages_bulk_weighted_interleave(), if the iw_table contains
> > all-zero weights for every node in the policy nodemask, weight_total
> > sums to zero. The subsequent "rem_pages / weight_total" and
> > "rem_pages % weight_total" trigger a divide-by-zero panic.
> > 
> 
> weights can't be zero and we just fixed the rebind race

So if the caller passes in me->weight==0 then we consider that caller
to be buggy.

In which case a div-by-zero is a perfectly acceptable way of reporting
this bug, no code changes needed,
