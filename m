Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC233101B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103550; cv=none; b=vGX85xK4SvoU2Atm6H6rsDWKDbwZmNt/aiIqq4atzOe5fDN/ZPqMYQruOhKh5NB1+KuyVBXFYFPAd5jAiMmEqUtZHBqYyl/4d188QTMr5PBbBmemyj86qQOz0V4eekc+XRoWJQ14OxF0xkr+AFEFmygUi6ck8h5Do5KpFWf8xFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103550; c=relaxed/simple;
	bh=BSG0N7yMoy7HrAAG3xGENZWLIbIabhZZQL77BhqQzYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ncee3UyPg9fDzDUACQor64BjwWagrepy8nIvJtf9ya/mIYXVsC3V05j+0qW29RRjlXHEOLETROvkU7oyqB4Fm6neMP75KBREeLyWlNd4+0jBYXlMjLVYlar5XWUWm4yN6UFv1Nn7KgImRrYjdRrfq8wFyl0mAI50PIQv+MnyK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXedu7Ye; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXedu7Ye"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so526701a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103548; x=1789708348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OlRZtYV+1fpP3ddBk9E8lebOfNeWpfbF1q0QVOt77gw=;
        b=JXedu7YewK4S9U/YzvPpSLSr3pP9AHatmsQTDwuE1g6j/BPQcC/meofLoQfw3bHNZC
         mykB8EBArI/xpFWiBVEmDjbIlgkeUKOV6/5IRJ7U9eLLa7KE9aGrJc6zDr9GUK5TXw6y
         7z7VC+wHfeAqhcSw3XtH73qGvWcPvyjZrO+4r7kpVrkWLxZc/3eyaGUAOYFeI1JyGlU5
         UcUWRP0oJz/CgeghHLLNCq8XIftl0jpIaBqy2WARVT++UXypipLZmLsiBO8MtYFWggUo
         30Mb/XTXk+LEM7Qgf7/Lk2WNExI0Zv/OQVXF1cA+ale2Fd5yORrhAuHeZSxhysnxdxQp
         nn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103548; x=1789708348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlRZtYV+1fpP3ddBk9E8lebOfNeWpfbF1q0QVOt77gw=;
        b=rGJizlSW1cVYLVdKX7lfMVf+L/1pFQ9mH4wZXfUcMUfZheE/T8JAuJLU/OO9/UrPHP
         HL3KXCrSN2OlT/exx75ds9cc98iM1PvzTr3weQ/zia8OJi5DdBFDWYgmXvacq+xRVqug
         l4RY4eX4vgFXtGf9ZH/dqWf/GfOru6LsJo91MJYoFLI2oM815i9Zk4hnsE2F3qWFOIie
         ad0SR6f6ZXxG0X4AsPLUu8u7qBA3EGtl2km5TOxgivd75QAIhrgnVX/az3BULQRv8bZQ
         XJGA3ORQyZrmye3A7oBbvvw8/OGjv+HE+F3ybG1IjGxu1ftXZ2dicjJigNXYH1fNdX55
         +MVw==
X-Forwarded-Encrypted: i=1; AKwUvBzpuZ62mHckfvqTF/pUd+gxu62MJZFNRMH6tgwYnjopionzAa3x+S3I9MjP5jBuehd8OGJsCs1tE4gexMY=@vger.kernel.org
X-Gm-Message-State: AFuF++l6MiXCSjVAfgZSQnfOhQs3kaGe+8yD/hjEmbVSCmed/qBDAd9Q
	I65v8HQxGBEUsrk+m/BAhftumdi6O2G1ewXDBRw1WjChNUD6ESnFxQ25
X-Gm-Gg: AYBFou1F1wWmCzXD3ZxQIUvEhfywTkUHmEmud4ggVVGmNLUVG/rGucbggG6luPt8IW9
	6xF+kKKFgN86uD6YYPN1g0CtLfdF3QUa8HSDk4gFp4a4aoNS6goInLX/RbzAZUbsMvfS+30tB/B
	BCVxPvDoc2YFTEPimr2qU4lPaZqv3mpLzIKJ8r+vjdF96XemUzCCs1XGJrR1WGctrtGy4zGSUnp
	MyfUmjGfZdoOHcMdP7jhhaCzr9iXkTUKFXBDiSt5N5UsgH7Mz9JtN+FyotMdd5y5150xhXj3P4P
	IzGm2j6T98qvubKyMplgaQi6+wk4dI8Hh5hFIAmtI8fFaQ2C98ElrRX6su8gLjnwmRTpAt83pCU
	qWBbXKprr09uVAq9sWw9GU8TuUc746t5ry6gpjNOkj4nRCfkOBJyCg3nEC7jkDPiftt2A8tIfEW
	oD5Iy1IJULX3mLzz1Fx3p5xI8FTVvOYkja3jAoN9Yljdsuape4qOVYSfFS2VKg5O6X0mX6Wd15J
	r5Xl8NDWEycvhsKs2Eqk6i4X0+R3teQJkDNKLarbp90NQ==
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr4738880a91.20.1789103548082;
        Thu, 10 Sep 2026 22:12:28 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bac1c716csm1324643eec.2.2026.09.10.22.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:12:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:42:13 +0530
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
Message-ID: <aqONPHH8B_z_GpT2@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260427122742.210074-1-mkchauras@gmail.com>
 <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
 <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com>
 <CAE4VaGCp7A7NuBC9Hwgzs5xg3bGBuRiDC8PRCu+yXnUZEXmt-g@mail.gmail.com>
 <CAE4VaGATCET9F4XXS2oj47aNEZx3HN__Zp1CH4+ASec6BjhjGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE4VaGATCET9F4XXS2oj47aNEZx3HN__Zp1CH4+ASec6BjhjGA@mail.gmail.com>

On Thu, Sep 10, 2026 at 09:58:59PM +0200, Jirka Hladky wrote:
> Oh, I forgot to add the actual results from the LPAR:
> 
> Model name:                  POWER10 (architected), altivec supported
> Model:                     2.0 (pvr 0080 0200)
> Type                                         : Dedicated
> Mode                                         : Capped
> Entitled Capacity                            : 1.00
> Memory Mode                                  : Dedicated
> 
> Results (median bogo-ops/sec, N=15 per cell):
>   Mode          7.1        7.2-rc4      Delta
>   Enforcing     68,275     70,154       +2.7%
>   Permissive    68,082     67,166       -1.3%
>   Disabled      99,654     100,510      +0.9%
> 
[...]
Hey Jirka,

Thanks for confirming. Also with the diff I shared, did you see any
difference in the performance.

Regards,
Mukesh
