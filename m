Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ED251C052
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706104; cv=none; b=dWe4tzHkZpcT/+P/6qu8FsKbKjyUA9lk408kJhZ942rS9hOx4yXHSDrTIDSxeXPBvcljmdoLlG5WX3dsZQ5iu0vvjL+LdvEBlCAa08IjyBcyOuvFdH39JAcissPQ4oiW5PygQp8Fp4+BNS9IaE6LMEGp5+LBxLMsO+GpHbZhLcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706104; c=relaxed/simple;
	bh=CP4jlLryAjoI33ocElOZhqE2VCS2aVzTcIdup6lEKC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e74gQgzJkNoRdjNvFJZ3hnNfLVxuZ4Rn+rIYtShgrPgEWD/ybY7MtNAJTCPnfvqEK60HXF6h9DVgJvIbTwUiZPB0T5qeqoaudOJDOY5IroHhAqjitdoiZ4T+i/CLch7W9MvdYxJPPzuErZmU0JF7CNdKODE8ZSOdDmbE9UtLUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNBdoDCf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNBdoDCf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8beb8adso2090335e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790706101; x=1791310901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asWxT5bycUxVtD+OugmEsRzTNrfaIi0ZXtMhr+mg13Q=;
        b=eNBdoDCfMP1KCQaZFMeYBItfSdhIv51yu3/NOn0zg3oNx+Vj8hfvQL0mGHc2KFPzEt
         32vAo5+e7JjnjdJSD8pKo5UDNr3ZvJXrRgwYrSKXq2WdPACeueVHHuUSFYrAA1X2Jv3a
         zvgxy2sKxCcj9cBLWd0hAp2CNzVrzaebXqtdOxtRhDhMOLcxfiwStm7GXr8p1wZE/rM/
         Y1LKWiPC8StbYhlVoaBLHdNWXs1NFzsyF2xCgXuHzjZN2g00FwxR3nWp6wvztioi+LAf
         zB7EaroeOQJI3i5Ao4+84OYXi3wn3Id29sWJumFLtlm0XftTo1zrBKd5p2fUhf9eizZM
         2PIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706101; x=1791310901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=asWxT5bycUxVtD+OugmEsRzTNrfaIi0ZXtMhr+mg13Q=;
        b=LJuDAq65zvCYcUW1v0DZFgDzpuZL5w/iy3RIeSXGEsYc2BXZ/mpo2wnFBreuAmhb3V
         E5PKGGEsP13JASIulK5HpVaBKCR7lcSxjcOlaWNtak0EBQV1bVLBeFW5tZrXP7fDT2lT
         vuuhUVAG46/EAkB7VFY9Ea3cZhjVFuRNQ6zk7g2ImjAK1pn5VdCyvB7Tucapvt3pzVLU
         8xYQJm/Uyp7jK2mDi5ybR9DK7bbbIntgjNY9LmkhfwxO8Csa2vAyHIK6Q5X7hvsjMo13
         0aFurZNkBWJ7fI+DC+85IS0jo8xpSsXbIujWneqQG9cGKckv6afrDq3Q7yA0R1rRBAGI
         ducA==
X-Forwarded-Encrypted: i=1; AKwUvByQEJm4veAzoKwW9KYBVSqfkEsal2qGUMTZO3+3BIAZjaXNZOqVHZV4LAHGY5TtpMetyYJhXfPrZoJWhco=@vger.kernel.org
X-Gm-Message-State: AFuF++kiTYbESJWKXyQpBLZpVmdou5L2yTp9uKOIRWvEHdvzU44hdrJH
	qXN2d3kHXugzgq1c+UUzc+HvUFSKYeZrMvCckcktErnlXTCejysn2w9a
X-Gm-Gg: AYBFou0TDZIe7QfWnQjc0Mj6v3OuvPxmjxF942jev8qw1KoR8KNF/jhE3wPBxq5zqE4
	7Q76WNT5UUnUPTCHryu5WWyqs4FWOr3WPs5YnklrU1ZvQ++Tjj6N7JVslZUORgr4zLGfZEh6Gmn
	gY6nA50ekHADn/OO3okBGYGcoY8wTsNL4RKfFUQr7fJ1KHXDGWForNomCL3dn/JkZTqXaH5y6+v
	l4bb6vCiicBFjzYUv36CY7uxYfXyDr4kz8slWwjnYoGwHYFa1NUddDxRQUmI9JudbxHcprmnSwP
	ikOMEaLNfGNEg0i/5FV7n8bXJBtPiJGPkVWlYeD4IKegUIUNYZa+dZTwElXV+B9T0dVCaqCNEXQ
	CRCubqZgmM2xukOyNG7k8bsxQ/44Kn/wo/WmHU4IZuUseXCt1Nw/9y9YMGx9X2iPALtR8yTMmPM
	X9yyJb8pADCDd0PgmRJun+PI+e/xitsex7vX3RLxNIDKJSiqL90xSnSO0qocPhFmpnbvZbhcEFZ
	woAZ2fCo19f4jCC0LxOCB2mKYtUJug=
X-Received: by 2002:a05:600c:6986:b0:4a0:87d:81e4 with SMTP id 5b1f17b1804b1-4a0087d8302mr80719615e9.1.1790706100902;
        Tue, 29 Sep 2026 11:21:40 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f6c05bsm283385e9.4.2026.09.29.11.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:21:40 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: KPrateek.Nayak@amd.com,
	Vishal.Badole@amd.com,
	justinstitt@google.com,
	kayracizmeci@gmail.com,
	klaus.kusche@computerix.info,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ricardo.neri@intel.com,
	stable@vger.kernel.org,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: Re: [PATCH] sched/cache: Honor asym packing over cache aware scheduling on hybrid system
Date: Tue, 29 Sep 2026 21:21:37 +0300
Message-ID: <20260929182137.196669-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d7cd3f7d528dff79d2a702543e7d97a44c0c078b.camel@linux.intel.com>
References: <d7cd3f7d528dff79d2a702543e7d97a44c0c078b.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tim :>,

> > Let's say when entering can_migrate_llc_task(), dst_cpu is CPU0, while src_cpu is CPU1.
> > And CPU0 has a bigger asym_prio than CPU1. No SMT. When entering can_migrate_llc_task() and sched_asym()
> > from there sched_use_asym_prio() returns true without checking if the core is fully idle or not.

> sched_asym() does check whether the destination core is idle in sched_use_asym_prio() for non SMT domain.
> 
>                   (false for non-SMT sd)           (check idle core)
>        return sd->flags & SD_SHARE_CPUCAPACITY || is_core_idle(cpu);
> 
> That is also a pre-condition for setting group_asym_packing.

Sorry for not showing the code earlier, here it is: 

static inline bool is_core_idle(int cpu)
{
	int sibling;

	for_each_cpu(sibling, cpu_smt_mask(cpu)) {
		if (cpu == sibling)
			continue;

		if (!idle_cpu(sibling))
			return false;
	}

	return true;
}
static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
{
	if (!(sd->flags & SD_ASYM_PACKING))
		return false;

	if (!sched_smt_active())
		return true;

	return sd->flags & SD_SHARE_CPUCAPACITY || is_core_idle(cpu);
}

On sched_use_asym_prio(), before the idle check a CPU without SMT returns true.
But I'm actually wrong on that one because on that one we're laying
on the idle protection outside to the CPU. If there are not any
other brothers, and I'm idle then my brother-family
is idle... Ah I messed up describing this.

But is there are any idle protection outside? I couldn't
find any. I could be missing something tho.

> > And sched_asym_prefer() comes back true too, so sched_asym() returns true and, we just returned mig_unrestricted.
> >
> > I could be missing something, If I'm not tho is that on purpose? If it is, the last paragraph needs to change
> > since it says that "asym packing tries to migrate task to an empty core" and after that "higher performing idle core"

> I think I did try to point out the idle core aspect in my commit log:

> "When asym packing tries to migrate task to an empty
> core that has higher priority than source cpu, let asym packing win.
> Moving tasks to a higher performing idle core will buy more
> performance than cache co-location."

I know. I was trying to say that if we're not choosing an idle
core this needs to change.

Thanks,
Kayra

