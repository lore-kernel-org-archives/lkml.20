Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432726;
	b=hDtD3zvSVxhrHeGnBdlcT9ms1XCv5nIMeaXHa0RP0IWimwtlI0kuVHiTNF0tzHgjmcjp
	 lD8v5Q1XxHg76OZAi6qOZDJUcnNN3uXkkdJmiRv9E/Otnh5mcc6ucitA8Kj5fb3I49jI0
	 79WJGC6EK9GZw5XqLHcl0+H5OH4gOaRjo/R4IFt0u325RLoD5z1HESKX0h4yUG+WMr4HE
	 CUIMP9BdZ/nAsVu8635yjMDbKVoFPNIA4V9dakE1SJJX+QNu6z8Xi1CkTJQocS4XTh0Qo
	 1Gz1Q6JIyWanBHtO9bUTCyow9LpsF2Hbwh/L8veKZSFS2SOYBd7utiCV+3Tkl/12wbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432726;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oPj1wdj1uiPohgNU0SXZo753xMGMB0lBhXuRs/TA32Q=;
	b=TwA1fVlsDLdutl1gFQFHkzzWi+6tfDJSontNe+8wuSY7s9uTXLSW2ytUIbx4S2IfnNyQ
	 1NLvWOxcYLCY4UOM81ujSVFEpgH6qvBNv1mqwEUeDMAJJoFJzJut35DoEFytK8+YesCaP
	 NyAGAZdPCgcofAfJAvLUEYNMxycQBdKVDfhi1puZmlO5FUvTt25vv7y/4g7FKfTjDpPho
	 FCkKugQXOKlNZjxZMWYKre47b9cHFuatbOu3He6+imZbba0aMM0fg4SGieENl1plVY5gy
	 orkokSUE+K6i1+q4Pcl4RyLVXPgV4ZwI6FdwCWPleMqhKJqxE57GbAbKdkAlsRxkuUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=L+lRb7tg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7683606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=L+lRb7tg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2901F000C4;
	Mon, 19 Oct 2026 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792432725;
	bh=oPj1wdj1uiPohgNU0SXZo753xMGMB0lBhXuRs/TA32Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=L+lRb7tgu/5dsyOmtNeQsYQUgYNKPqVooCkrHEGDMjkgJ0nIp1gZ53JowXggaCgK9
	 jbspgOy7SIiuWTL/0cUBRj1CMIeDHzxtEh7Z/QV+swxfnuxuv3SLoHennW0zErr4jG
	 P/U6x1Xu/oa4dK1kzkdhB9nySFbgXzUbjqYsqbn0=
Date: Mon, 19 Oct 2026 10:58:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, Sean Christopherson
 <seanjc@google.com>, Borislav Petkov <bp@alien8.de>, David Laight
 <david.laight.linux@gmail.com>, Rik van Riel <riel@surriel.com>,
 ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@kernel.org, Mike Rapoport <rppt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Pedro Falcato <pfalcato@suse.de>, Kiryl
 Shutsemau <kas@kernel.org>, luizcap@redhat.com, pbonzini@redhat.com, Tal
 Zussman <tz2294@columbia.edu>, Matt Fleming <matt@readmodwrite.com>,
 gregkh@linuxfoundation.org, sashal@kernel.org
Subject: Re: hunting memory corruption bug in 6.18.x
Message-Id: <20261019105844.02d4623b7063fec25ebd34ad@linux-foundation.org>
In-Reply-To: <CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com>
References: <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
	<20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
	<20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
	<20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
	<20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
	<20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
	<atI_yuCc4BiweBQP@google.com>
	<atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
	<20261018201538.d0957878f378a9821852836f@linux-foundation.org>
	<atXXma5NXxoSWJO0@pcnci.linuxbox.cz>
	<atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
	<20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
	<CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 10:39:30 -0700 Yosry Ahmed <yosry@kernel.org> wrote:

> I am glad the commit fixed your problem!
> 
> >
> > Great, thanks.
> >
> > oops, we haven't been cc'ing Yosry.
> >
> > > Definitely a -stable candidate. Andrew, will you send it to Greg, or shall I?
> >
> > I volunteer Yosry or Sean ;)
> >
> > I think 55780d8a1dcc should be repackaged before sending over to the
> > -stable people.  Its changelog is very wrong: "The bug is benign
> > though".  Update the changelog to explain that the bug is in fact evil.
> > Otherwise -stable and further downstream won't understand why we sent
> > it to them and won't understand the impact.
> 
> It was found through code inspection, there weren't any symptoms, and
> I think I know why my analysis was incomplete. It assumes that
> svm_recalc_instruction_intercepts() already ran at least once for L1
> (vmcb01) to configure its intercepts, which generally must be the case
> (L1 must start L2), except during migration :')
> 
> About repackaging, yeah we can add a note about the new finding and
> the necessity of the backport. One question tho, is there a way to
> send a patch to "all" stable branch (the same effect as adding Cc:
> stable retroactively), or do I need to send separate backports to all
> open stable branches?

As far as I understand, a cc:stable and a Fixes: will result in it
being backported into every tree which has the Fixes: target commit.  

> >
> > And that repackaging would be an opportunity to add
> > Reported-by:/Closes:/Tested-by: you, which is the least we can do to
> > thank you for all this diligent work!
> 
> Will do.

Thanks.
