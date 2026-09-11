Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275D4ADD9D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149769; cv=none; b=rkWXEPjaPozdx8/FyUoc3vSc/n6lNWvWBJ9vLOw4i6HIgJ7oXkzPBDjha6agiLi0sS4VVQ59ZBF8Khp5EF9CXMIHu40ki5z1l3WiQpNsuhSiHxk9PujUxEeo10W++AxabUOfJal88k8TQX+EEsMe+BoLgDjqOvvUB0FMtvCDGiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149769; c=relaxed/simple;
	bh=LnpI6w5jmvI4nlcFgLimbu3wSqiTwIXgE77VCD9j9qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtYrtBkWwq8gcczdKeJisT38M2D3INkJ8L5WihFedHDa8k7wyov/JFAe7s/vnn6iWiN5d0pN4p/vczWgw+6nhkqVq3NmxQZ0R3bkTQE7WBswi4w6XSy+MHxuzIxxEV1TX1dmhBqZbNHhsC9945ifpY9yqmFKZ3A1UlehBVYwAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7pGIBaR; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7pGIBaR"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so82185a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789149765; x=1789754565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEg6c7bZ7wxXKsRmp0OjaJyQp7uwB9ezm8J/nXNrwM4=;
        b=E7pGIBaRY/IKV4sms5e0qKPo5d4Fan3yI63nfzXXwzp/aM6RUM3TntsmgZ8y7hqiQc
         oiLWWVjrDHHFmopikbypE8fw0orofJJa8NLJGh+PD0yxaliHBziJqGLrtgvWEloZ2yYD
         Jp18csP3KTlaCTni16JizGkdl3WD2rmiJzI/PHN9h1YN7YFu4+Fv+8hQ94YR9utiPAqY
         U/E6j8CWBUww/KqTNJ2bUIOiHUEOGB3RYWlqzVM2sFfQF/wdIoAh/a6QyFUFp3UYCJb9
         0SRpp31FA5n/lICakhbFXEc+SYwkqAx+BcA/TASVPR+us1Npd+kLTcFYrg7NWBX1kdG8
         lOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149765; x=1789754565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEg6c7bZ7wxXKsRmp0OjaJyQp7uwB9ezm8J/nXNrwM4=;
        b=IAy88ObXo9lTTBn0be8EFHzQvMXVFFpgEi/eD+IcO9+JO1l4Eryke0pGSiAOH7H530
         5Gx7unoU6H7F7mWBQIDZ5KB8KK2zoRBuhCnvb8SJNyumypSUheNfjuHQSn9wCjI17c7c
         eDsgvCog71gPbNOgHKx6V50SlIGC3b8Y1z/RcKnAz0yLJ/YVKu2qaTPAkunaDo7h6mll
         NiEN2lwR/2yfdCALELuCtTeV9JSQi6lcESXeRrCRWmOpqRfXiudIRHvn4Xn7IGamSqhW
         MJQTPtw1UKTItCtYh+GTvb8gTEoW+zqwnNX7NaIeq+S5+aNXqwxR3/xHIiG+k9T7RvWK
         8ZKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC5nHgQ/45f/YWQmFV4AtW2RXYQwvZ+FKRcOmhjxIK2+JAqoiKjuf8a7EaG8rKjuLCWKP5Ze5E6Uus1Xg=@vger.kernel.org
X-Gm-Message-State: AFuF++luB8s8HU9N5pQDwxpvNdW5GnE3Z9wlFwGXteVzEzmyqM2IrtdI
	4KnKHYSy5TTCGQErEr0TiOX8C9FCG8I/zbL4sw8MwuaxdV4hBtqJoipS
X-Gm-Gg: AYBFou1N4JxB7D9qP3QievcgJHfdxzzHTtxWJqA3v9UTjd+syBS0I6cog/eQN81VxkW
	f1kAgyfhSLKYnaeZVnWvbpm9l/IeN4s0yW5615WwX5n8TA267SFCliIIMKYHbkspvy+xVJRh1Tn
	e91Kzpws7YT8IlTnyhccUrSgQCm2sMNvOxLL3ScwSsMGYMpzCRNiSXqX0eIATT2qmGE9EzAdOVY
	b3seLvcA50Hl/mCuiJCJgzqM7PXclFmxhS8h+tUJouUBcw7PMXjntpjPVjb5u+tpOxMwXm/dS6/
	z86W+8jGVOgVFyMxP6I2DyOpElJV0Sy6phsJrwpVD2vUI890ORRAXYMZETO+UuRmZpY+zXaOmeb
	MkNBxkfQ0hYrc1F0fkMV3cSgvxEtUa0F7thlS53gJWBIKXWOZP7uldDABOXOGZk2nUaL5vkK0fP
	KSa6pMzddEHp+wBUkcvFpXbrS4Ubw1y5S1HNaAb9JHrYzKBSdw3RXl+BjNkmd26oV0xnETKKmZw
	p1LKpRMI1/htRhXTOnDd5Tpara0jA1V5TMbUvRDQGmBhA==
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr9487469a91.1.1789149764717;
        Fri, 11 Sep 2026 11:02:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm6962244a91.2.2026.09.11.11.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:02:44 -0700 (PDT)
Date: Fri, 11 Sep 2026 23:32:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, oleg@redhat.com, kees@kernel.org, 
	luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com, sshegde@linux.ibm.com, 
	thuth@redhat.com, ruanjinjie@huawei.com, akpm@linux-foundation.org, 
	macro@orcam.me.uk, ldv@strace.io, charlie@rivosinc.com, deller@gmx.de, 
	kevin.brodsky@arm.com, ritesh.list@gmail.com, yeoreum.yun@arm.com, 
	agordeev@linux.ibm.com, segher@kernel.crashing.org, mark.rutland@arm.com, 
	ryan.roberts@arm.com, pmladek@suse.com, feng.tang@linux.alibaba.com, 
	peterz@infradead.org, kan.liang@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v5 0/8] Generic IRQ entry/exit support for powerpc
Message-ID: <aqRB8aSzbeQ-UcYY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
 <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com>
 <CAE4VaGCp7A7NuBC9Hwgzs5xg3bGBuRiDC8PRCu+yXnUZEXmt-g@mail.gmail.com>
 <CAE4VaGATCET9F4XXS2oj47aNEZx3HN__Zp1CH4+ASec6BjhjGA@mail.gmail.com>
 <aqONPHH8B_z_GpT2@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGDJy-EzD_iHeb+AQOYi9LZN1dB9OXjf7FtVWM=LWrWVTg@mail.gmail.com>
 <CAE4VaGAq1PugOAomUnJ4vEtmHzKPt5m6VJ21wErdOf19G8UPWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE4VaGAq1PugOAomUnJ4vEtmHzKPt5m6VJ21wErdOf19G8UPWw@mail.gmail.com>

On Fri, Sep 11, 2026 at 02:24:44PM +0200, Jirka Hladky wrote:
> Hi Mukesh,
> 
> I built 7.2-rc4 from source with your proposed rcu_ct_kernel_exit_qs()
> patch and re-ran the same sweep - it shows minor improvements vs. stock
> 7.2-rc4
> 
> Full results, median bogo-ops/sec over 15 runs each:
> 
>   Mode          7.1        7.2-rc4     7.2-rc4+patch
>   Enforcing     68,275     70,154      71,585
>   Permissive    68,082     67,166      68,705
>   Disabled      99,654     100,510     101,016
> 
> The patch vs. stock 7.2-rc4 differences (+4.8%/+0.9%/+1.3%) are hard
> to distinquish
> from run-to-run noise we've been seeing on this hardware, but they are
> consistent.
> 
> I think it's a useful efficiency improvement on its own merits, as it
> does avoid the unconditional rcu_preempt_deferred_qs() call on the common
> fast path. Even with only small performance gains, the change looks correct
> and low-risk to me, and I'd like to see it land in mainline. Let me
> know if there's
> anything else you'd like me to test before you post it, or if it's
> already queued up
> separately from this thread.
> 
> Thank you!
> Jirka
> 
Hey Jirka,

Thanks for the verification. I think that's all i wanted. I would send
out a patch for this soon. Thanks for all the support.

Regards,
Mukesh
[...]
