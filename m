Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.182.176.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483506;
	b=UboDCQdZc169PaXzWSPNoeqKkk1Zd0htEWxiLjHf1irAjrx/gWE+R5X/isVzFn0Rcqwr
	 pqmEDSL4QZX0qsdPZn1DWIO9r2stOghHQ1nktri6/g9vE14CfISiPgmq3L63CBFn4UXfL
	 +j/ZGw2fdQIBJKSi5LwNwvksuzKkAivEOz7QIyklYMM0NDw8/LKKrhHxrlGeQpoHQERAR
	 5E7GoyooCzWj1dRRBPCi+DA39DYcXoed8NDHIFVjf95SxcwmVMMA+LjR4ChYmnagcvk3n
	 ucdFOMHu/szePkrm0HQPMa1Dw1AjzbG25ETQ/zUmiO+MZszCABSfefOInB/hLukD94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483506;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-F-Verdict:
	 X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=4f15JG7lRt7YL2EsZ2B3kDKhMQsYdR1PjuVVZQ0eQFM=;
	b=v7yDwiXnQkWdwnlEY5be5bF1iR/P+KoOezRakBi7qpnACuzU5Ti+akJKZ+p1cBL0u0L4
	 p3JZs5Lx1upAO/VEqjuItk5DUdwXfyN52IWP42929LmvY9/tX35QMyesyubo1N5arPEkc
	 Q1R/NdfC4jFWfFxMzLWcJSkR3AZujn7U66ZQ0GqovzuGWftYNqEdKTmrbvltWB2JG1Oks
	 DPNT9F74MePoMRqGatpSAeIS+mEioiev0p2s5o/iRqiNB6BTiLhDx3/0TKZNJozAR51pF
	 EGVKf79HYGSei0By5MXO30S8Oqk7/2BAAy29Ly9+bqUAJVLd9Ih9kJXdCrXEZjeHoEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=NKsOjsj9;
	arc=none smtp.remote-ip=63.182.176.48
Received: from mail299.out.titan.email (mail299.out.titan.email [63.182.176.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3A606A88D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB3A606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=NKsOjsj9
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jQJL119Mtz3wYL;
	Thu, 12 Nov 2026 11:38:17 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..8zLTcvXyWQ9ffr59.rvKopKsdUTdYZf7oyiJfDJmrYMpEmHQRFjhOAZmqK-lEVya6-sa6ptZNjhfuifUMcrYM0L2VMvkF9dxi50cxSqP-_ZClHR6QMEw7DhSto4ZJN3Kni4_1UaQPRQ.im2UQU-xPsA6vEJF0CXOPw
DKIM-Signature: a=rsa-sha256; bh=4f15JG7lRt7YL2EsZ2B3kDKhMQsYdR1PjuVVZQ0eQFM=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=mime-version:date:from:subject:references:cc:to:message-id:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1794483497; v=1;
	b=NKsOjsj9lFnXhiTYfGgDbDfXW6Qv8o52unFDo7AnzBNKer3W7rjrPBM0FMkjJWLj+0CVifu8
	4Mxc953/iN4VmMNSTej+emz3hzs9LEkuzrC9qRvIhj4yIsWW/AUXmo8V0C9vpncyuISekz/A+fy
	EDLPmOOZQx9pjrDm+0fiiFGo=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.169.71])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jQJL02mwwz3wYC;
	Thu, 12 Nov 2026 11:38:16 +0000 (UTC)
Date: Thu, 12 Nov 2026 11:38:10 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Seiji Nishikawa <snishika@redhat.com>, 
	Mian Yousaf Kaukab <ykaukab@suse.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <avWg-7PFyaHmcyRL@techsingularity.net>
References: <20261110232057.4144723-1-mgorman@techsingularity.net>
 <20261110232057.4144723-2-mgorman@techsingularity.net>
 <20261112044642.0f28f038@fedora>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20261112044642.0f28f038@fedora>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794483496943454063.2081352.8488075434471278454@prod-euc1-smtp-out1004.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=Kuj0MWWN c=1 sm=1 tr=0 ts=6af5a529
 a=z2qhHIlv8qvig73Ub5HWqw==:117 a=z2qhHIlv8qvig73Ub5HWqw==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=R_Myd5XaAAAA:8
 a=UNZw_viCDrSrOlaRfgkA:9 a=PUjeQqilurYA:10 a=zgiPjhLxNE0A:10
 a=L2g4Dz8VuBQ37YGmWQah:22

On Thu, Nov 12, 2026 at 04:46:42AM -0500, Steven Rostedt wrote:
> On Tue, 10 Nov 2026 23:20:55 +0000
> Mel Gorman <mgorman@techsingularity.net> wrote:
> 
> > -stable warning: This patch is part of a series and applying just this
> > 	patch on its own breaks the !RT_PUSH_IPI case.
> 
> I don't see why this is 3 patches. It looks like patch 2 and 3 could be
> folded into this one.
> 

Accident of history mostly and preserving the fact I wasn't the code author
of the first patch and I played it safe. 2 was initially "reduce risk of
drift if only 1 caller is updated in the future" and by co-incidence made
patch 3 fractionally easier. 3 was written later while checking for any
side-effects of the fix -- namely the !RT_PUSH_IPI is degraded by some
unquantifed and unnecessary factor. That's ok justification but 2-3 are
not complex enough to justify the risk and Yousaf has no objection to
collapsing them.

I'll collapse them into 1.

-- 
Mel Gorman
SUSE Labs
