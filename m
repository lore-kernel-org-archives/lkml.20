Received: from mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02213A3E9A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324487; cv=none; b=LM1KHLH23tWF8y+bpuDaeoA/ncfpht9YKRFUOoD63TTq737cTUlwzwXyNSUp6QoSTmwUYZoMPpyQ+46NAZQE0QaMSPlTe0sYhAIdUUiiwKG8dG99UJIALPqYyqB8Copc3B/xp366h9UZbiGCsfKD4SyAjI5dyYNAB32MsNFJYqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324487; c=relaxed/simple;
	bh=NT1mrRpjeI5CLus9sP+C2Ws9Ipik/nTvHwHnVBaCBXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfi6MeCpfiOU1p6bj9AvsrlMQnPb0zU2bVcKtqswoBb1I7y8pTz6QImnRqMDn3Jc8JeRdEyj3GpFSVEvn4lOCz/38G9eFqU/Ytxq/xAKR5QlQbCGnbqZl8Jc2/iapT3C8+HcgCO18nCifwR5+9ryyyygmIfGW87rC7ypa7U3xow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=O6WclA2G; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="O6WclA2G"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NT1mrRpjeI5CLus9sP+C2Ws9Ipik/nTvHwHnVBaCBXQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792324482; v=1; x=1792929282;
 b=O6WclA2GHYLeVxqIT+4bMR2nDAzNgNRJ+cSOekaRgoJj1sKfTZ+twQRdihrnOo69/SiU4+7v
 eT03qCQfQvR00u4ehUQ0NTEMOEJ0gSEtd7Nf58wP7LQuAiWNHdXRAT6P4RQGNnMZC5AHHzbGwX/
 S+Nw9iCl/8fEjcVg+j09s385+E+GIug6cWzrlLSwByAZjo/WZuNw4S1JYGXrznTGtskuQJCbixZ
 DhtwPN+2PLqeyJGFkJBE7pwduCvUWQO2GlDc62sUMDnkzq6fAP9QYGedPWC+e8UNoNs+mc4UTJg
 ddNvwVs6AJu3Aro6bFh4YGH0NYTZe9z/+gQOCTKy4LceA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ded01acd1c6b2469;
	Sun, 18 Oct 2026 11:54:42 +0000
X-Mizu-Trace-ID: ded01acd1c6b2469
X-Migadu-Flow: FLOW_OUT
Date: Sun, 18 Oct 2026 19:54:34 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: use git switch to create
 branches
Message-ID: <atSzetKWYkoeELXr@wyuan.org>
References: <ardqGdjnd7kC1B-E@wyuan.org>
 <20261018062200.29256-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018062200.29256-1-ducthinh100812@gmail.com>

Hi Nguyen,

On 2026-10-18 13:22:00 +0700, Nguyen Duc Thinh <ducthinh100812@gmail.com> wrote:

> On Sat, Sep 26, 2026 at 14:45:45 +0800, Weijie Yuan wrote:
> >     \$ git checkout -t -b my-topical-branch master
> > +    \$ git switch -t -c my-topical-branch master
> >      Branch 'my-topical-branch' set up to track local branch 'master'.
> >      Switched to a new branch 'my-topical-branch'
> > 
> > @@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
> >  bottom, which provides the reviewer and the CI tools enough information
> >  to properly perform ``git am`` without worrying about conflicts::
> > 
> > -    \$ git checkout -b patch-review [base-commit-id]
> > +    \$ git switch -c patch-review [base-commit-id]
> >      Switched to a new branch 'patch-review'
> >      \$ git am patches.mbox
> >      Applying: First Commit
> 
> Hi Weijie,
> 
> Thank you for putting this patch together and for the credit. The
> conversion to the modern command layout keeps the guide fully up to
> date with current Git usage practices.
> 
> Reviewed-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>

Thanks for your review!

So sorry for forgetting to have you cc'ed on this patch, I wasn't using
git-send-email so it didn't automatically add your addresses from the
trailers.

And yes, I dived for some time and noticed that you haven't split this
part yet and sent it out. To prevent forgetting later, I decided to do
so. ;-)

Thanks.
