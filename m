Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A62B30D3FA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113750; cv=none; b=pTEowUNO8Gjl2WEBTs4iAOkj0KHNtZMebVddayWJiQ2VKL6jmwEs7FfEHwEkzpN/EgzXBElD2Ga9fatLq8JLVdKHVVWLilbZnq9lXHcBQ4wicmzp+3JfjOaiXqkR67ykl+QYTvV4rSawD6t3pda9qMk69GhMNMM4j5uhzhGUwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113750; c=relaxed/simple;
	bh=rDb5goVKNdHW+xAPg1TqVSjOt7aW12nFHUOXrwpErSM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ox4Tm9YMx9vUgiifiD7cDU4n4/k+DYM0zRAGvnHy7ghlZLuPPj5JcbJoP1ZiMzXZr3i/tVkuHM2ltOVEvwn39ne07TqjdDcNtKFQ1SByeTxZAWEXAMIWpMBSd8tmwKexO8jdd+6+l6SmOJfm9mKQycIz/PEVsQP3gawSyeBD+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--shansinha.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eS7cxwY2; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shansinha.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eS7cxwY2"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3619575a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792113749; x=1792718549; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MS4gSCkqGtBHDPJdK563wHc/5/xO1UWE5Dvgu8PJM9A=;
        b=eS7cxwY2M9WqpisxlaY8ArBlgIshncZ9dF9CphjxtEG/zziqu/q1KgUyLrK+KkUkHo
         r9WYlDnRW4xk/gpwuB9rFWFZXckn7txqg5jToptIbHMg91+iT76t+hCGp7tBU+5c2fqU
         zqTaBrVluQpqq/VwAwe9tkh4NJ9CjKycIsP0TbIyURa0hnLWE7SXTM+CsROoWNCMKPiN
         YXCi/4rObv1AlxEWU+RWZdkDCieGmh6ujP6kidyMOXJc8Ag9J7OcOmOB3Gqq75I4cUQI
         fmPwqjycBPAzEo6XThvgRytABZyop56wFb0tSEItr5kY/Cr9rkq4XU2IBdYpa5YPohe6
         G8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113749; x=1792718549;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MS4gSCkqGtBHDPJdK563wHc/5/xO1UWE5Dvgu8PJM9A=;
        b=hUF2z4BFRkhoiQqHv1gMA+Gv2RwwtmNV2IGJn0lJ5SjuLJtjP43Wxs484Ay+WZJD5W
         y08BJQB5HOI1wwDEFpIAU2PkgzYsvlFmrTcazyAuaDkEwfArbFutBOeYeBULQyD9/Czz
         vJdL7lmys14DMjWRNYmg71JJ0nISIWisUfko0CEu9n9DiBy27UFJNq+V2LNgf+fcdEYP
         SlVeqrfyI0MYSekdTui5nAinA8BdxwT53g95pfcDwZ9sr4SLSOwzDzxkxV2sL3B9P8V2
         880LWnwmnz4KaA370gNkCNP1YhvG+y6dHJGqOkVzriJaOipU81RenBqC+zg9WG9BzDxg
         RIKA==
X-Forwarded-Encrypted: i=1; AKwUvBx59tz/tXWI0Z98P7Moj+vAI4H5uleKxBnD3BUd8O2IfUUDZS7nfrO1Qsvw6K4xTl+lIFgGkdy5ERYDUWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKe1z7ParaSHym/WZp5IdXjNkSY/qX96u1a/n6uTf/uB7JgW5e
	CB9MzqNCpFIXt1r5Xh2afRab22zm0RbX17T8UrEKzn/73Oa5fn9t3+j29AkasfUa28VJENK4bxp
	5lncVm3+gt5y6wVAoqQ==
X-Received: from pjbgp15.prod.google.com ([2002:a17:90a:df0f:b0:3ac:3bb4:e960])
 (user=shansinha job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:4ce3:b0:3ab:a188:b8b7 with SMTP id 98e67ed59e1d1-3aba188beb4mr9134720a91.22.1792113747146;
 Thu, 15 Oct 2026 18:22:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 01:22:08 +0000
In-Reply-To: <267f5e92-651a-4874-936e-70f3fbfe1e16@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1792014060.git.prsampat@amd.com> <55c189e9130a7d22c0b756440f10a056415404e5.1792014060.git.prsampat@amd.com>
 <atElnAcDQFTnmdVr@tycho.pizza> <267f5e92-651a-4874-936e-70f3fbfe1e16@amd.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016012208.3220126-1-shansinha@google.com>
Subject: Re: [Patch v4 7/7] crypto/ccp: Implement SNP Download Firmware EX
From: Shantanu Sinha <shansinha@google.com>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: Tycho Andersen <tycho@kernel.org>, mcgrof@kernel.org, russ.weight@linux.dev, 
	dakr@kernel.org, ashish.kalra@amd.com, thomas.lendacky@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, chao.gao@intel.com, 
	aik@amd.com, nikunj@amd.com, michael.roth@amd.com, shansinha@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2026 at 05:09:38PM -0400, Pratik R. Sampat wrote:
> On 10/15/26 3:38 PM, Tycho Andersen wrote:
> >> +	/*
> >> +	 * Firmware either just requested a rollback or a rollback attempt
> >> +	 * failed. Keep the PSP dead for all other commands, only another
> >> +	 * DLFW_EX attempt is allowed through.
> >> +	 */
> >> +	if (sev->fwl_rollback_required) {
> >> +		psp_dead = true;
> >> +		if (fwl_ret != FW_UPLOAD_ERR_HW_ERROR)
> >> +			fwl_ret = FW_UPLOAD_ERR_RW_ERROR;
> >
> > I think this error switcharoo could use a comment (or maybe just be
> > dropped?). e.g. if the user does something to set
> > ->fwl_rollback_required and then tries another firmware upload that is
> > the wrong size, ERR_INVALID_SIZE -> ERR_RW_ERROR, which seems
> > misleading to me.
> >
> > I saw some discussion about all this:
> > https://lore.kernel.org/lkml/20260924213737.3833625-1-shansinha@google.com/
> > but it's not clear to me why you need to reset the error code here.
> >
>
> My understanding from that discussion was that userspace errors should
> fall into clean buckets. read-write-error would mean "roll back",
> whether it came from the first failure or a later rollback attempt,
> since a failed rollback still leaves the PSP dead and needing a
> rollback. dmesg would still log the exact reason for the failure.
>
> That said, I see how it can be misleading, and I'm fine with dropping
> the override or putting a comment and re-spinning this.

I do see how it can be misleading.

I think dropping it makes sense. When I suggested the changes for v2,
psp_ret was only logged via dev_dbg(), so the sysfs error was the only
clean signal userspace had. Since the error code is reported in dmesg
now, I think it's fine to keep the original error and have the sysfs
error reflect what happened on the upload rather than the action
tooling should take.

Thanks,
Shantanu
