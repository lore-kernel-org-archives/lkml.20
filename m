Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A7130EF8F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006082; cv=none; b=UblTuvmpgNCRLSryLY0X8aR6c5eT4wnPwhrxHAWkkAl9z3V9NDntnyHs1mFFffP+W0EADif2SPiCxui4FIv6axc8y9+zAzAqSVQvldTDYmWmoy+2xhbUDCX+ZNXkfldlZpY/l8scdmEJYhQ9Ex5xju11tapgKizWBQSbUGLyaWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006082; c=relaxed/simple;
	bh=U+T8zcNui896RuKy/9PmUhVVMHFkbK+hoFwjEBuIhlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b86qZhUrfq56aeTc+pfNlZxbrPE3FtlFK0STpKIa145M5AluHNOBWZbbbu67qNNFOcRpdy408mZ6kWxIphS8C2hmuCxkIUIoG39aqreC6jrWFOD99XsZlHw8vO4IAAO1CI6XtZnw9LbeX+HcCSTyKIRsOTJkAVqfFGNRYne7uYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e5mc20eq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e5mc20eq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso32791965e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792006079; x=1792610879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79ZQLVF6/awVfagux6X340wRycgEHKIlZJR5+alEZXw=;
        b=e5mc20eqsiJhW1Nig3xUs4wAUeT20jkdeEW8NQn/lP5yHP8v+zBP9WX9cHjaztYOjZ
         xN8xODAVg8a5MAs/anBJ/zbrwMc1jkJilScp5nsCPD/mKpvL9+qJGZrxTfz7bfd3g7NK
         GbqyVH0bomc+ZgmKOMkH8RSxpP6BC88e9XdghXDGU8sJZbq7hjaqnoN6IWwCtSw3QkD6
         cOQ8EqzjN+zZJPwngyGfUBhoX5PV9qLQ7fkLRA9/k9AAXlYQ8sXx6ddkyZBrV9yZASnl
         BRFc+pxMDjftdi5AJX7rhjb67fDplfbGhBI/ux9FOg4ZVzIeehEVIorQwk3DFao0qAuE
         +/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006079; x=1792610879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79ZQLVF6/awVfagux6X340wRycgEHKIlZJR5+alEZXw=;
        b=Y2h9A4GrIH3xlpZKInYQKEZcvKR0AaVvHMVuAJd6fIbajA2OqUmMPQqSw/bGgFYlFw
         cv0I1B1leEZ9QvLb1ldoU5pT065hz9vi/3OSaDFSzztvD/gny/jO4kLrPyQPQqgLfiCH
         LYgZnA1M1z+SOPy4oBOfmicGKyXls0+YFnZRVu8anYGzNvK5B7Bif5eqAlaqCTEQghX0
         IFj9PAVdPdDXQu5y1yWi7yD3lMZAKkcO1VKrRFaLLmd/KssIgQR3vz7ruwlFg8hkM10r
         Se+RWI0euPxTPmBz/E5lTXvPG98Y9i+v++F7A5/YLpFHaUH4hmQItj9yIhTo/vMheK8h
         zAaw==
X-Forwarded-Encrypted: i=1; AKwUvByh9IrnKuyR9otl6ZgLXSSolEZD1+prf3HZtFS7wVP7L5C5wSX4r3qjdl9TALjFvFv2fO8YWxIaGBwr+Nc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHyc0S1yaYvch5Ds2sVWf8WIVDo9/WxKY3A95MCDt+cO1feoyA
	3/vCbuTqDlJ+eNA1ofYGZIa2gAcX4u2GPMomowm12Q6UvzAdfwFBRFyfgrgIdgz0f0M=
X-Gm-Gg: AYBFou3ETpht3D9NjHGS18l7yPSuaKHbswZ4fzTF4bZCk7A1uEtmlsED1kW61Pk8Bme
	dYFiXdWPOR3GYOryIg0RJ4bup11IQN06jiR3FAsbX5iH/dmbsMYuByQsW0JdT56G60FVxfD6oK2
	B6TApmBv+jjJN7JNLg47Z4nRIFYRmvICgpB6hNOpq9MdmUgjA/owuMU6XfWmKPx9v0Xc520Oxu8
	/HaUGOhanf0b3vyeqjLPhOUzUxWDaL9TU0fzaVWwcMjrNGjhMTuKoCWXhM5vLEK/AuSoGy6TCZx
	/ooJFjCL4E/73aJhkC0jegWzMHI6mzDjAeykbXggjJhiz3Titq3dUQ5BJwlJsfsS/htyFlJ4UiE
	QYWvWVuYUENQlkgQfEcHxmB/JuCE1PlFC8Qeu2ZxK4ZYvKyxHwCSq+j3dzbUb4R/qFnFGOsQHJM
	38Bh6NumrBEViYy5odeZsvO7KlVdcqTIrZT7ZcPdtE6HQJDSdll4bEQHCXSzJWdi+6WUvryDEB1
	odt3Ce//x1g
X-Received: by 2002:a05:600c:8b78:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a18e47acf5mr381505505e9.11.1792006079203;
        Wed, 14 Oct 2026 12:27:59 -0700 (PDT)
Received: from localhost (109-81-25-183.rct.o2.cz. [109.81.25.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972affsm12468825e9.2.2026.10.14.12.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:27:58 -0700 (PDT)
Date: Wed, 14 Oct 2026 21:27:57 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-7.5 4/5] memcg: avoid queuing high_work from reclaim
Message-ID: <as_XvRZzV6vR9dCo@tiehlicka>
References: <20261010210957.1350874-1-shakeel.butt@linux.dev>
 <20261010210957.1350874-5-shakeel.butt@linux.dev>
 <as9p2uFqCQprwdnI@tiehlicka>
 <as97Nzob4XuzO9Ss@linux.dev>
 <as-08j9_1C2F_N8s@tiehlicka>
 <as_AxtUlV8K2fkNu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as_AxtUlV8K2fkNu@linux.dev>

On Wed 14-10-26 10:55:21, Shakeel Butt wrote:
> On Wed, Oct 14, 2026 at 06:59:30PM +0200, Michal Hocko wrote:
> > On Wed 14-10-26 09:06:00, Shakeel Butt wrote:
> > > On Wed, Oct 14, 2026 at 01:39:06PM +0200, Michal Hocko wrote:
> > > > On Sat 10-10-26 14:09:56, Shakeel Butt wrote:
> > > > > Kernel threads and remote chargers use high_work when memory.high is
> > > > > exceeded. Their allocations during reclaim can also charge memory,
> > > > > for example when zswap stores a page.
> > > > > 
> > > > > Without a check, the high_work worker can queue itself from its own
> > > > > reclaim. The pending bit is cleared before high_work runs, so each run
> > > > > can queue another run.
> > > > 
> > > > What does that mean really? Does this delays the actual run?
> > > 
> > > It will not delay the actual charge request. This mainly means that we keep
> > > enqueing the high reclaim work even from high reclaim context and can
> > > potentially keep wasting CPU if high reclaim is not very successful.
> > 
> > Hmm, so is there any practical problem if we do that? What exactly do you
> > mean by "keep wasting CPU"?
> 
> More specifically if high_work kworker keeps enqueing high_work, most probably
> the memcg does not have reclaimable memory and keep retrying it wastes CPU.

Yes but this is not specific to PF_MEMALLOC context, or do I miss
something?
 
> > > > > Skip memory.high enforcement for charges from task context with
> > > > > PF_MEMALLOC set when they would use high_work. This covers kernel
> > > > > threads and remote charges. The memory is still charged. Interrupt
> > > > > charges keep their current path.
> > > > > 
> > > > > In a VM with incompressible zswap data, the worker queued itself 163 times
> > > > > without this check.
> > > > > 
> > > > > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > > > 
> > > > The patch itself looks OK. I am wondering whether we can unify the check
> > > > with the existing one which forces the allocation through in main
> > > > charging path.
> > > 
> > > The force charge (and ENOMEM) paths bypass the memory.high enforcement
> > > altogether.
> > 
> > Exactly. Isn't that exactl what we want to achieve here as well?
> > 
> > > Only successful charges (done_restock label) goes through
> > > memory.high enforcement. So, even if we move this check in try_charge_memcg, it
> > > will still be a separate check before calling high enforcement function. I think
> > > this check is very high_work specific and better to be in the high enforcement
> > > function.
> > 
> > I meant something like the following
> 
> Oh ok this makes sense. Do you want to send a patch or should I add this in this
> series replacing the 4th patch?

Feel free to take it. I haven't even tried to compile this. Just wanted
to show what I have in mind.

-- 
Michal Hocko
SUSE Labs
