Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF47377A95
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368937; cv=none; b=R/wkvnd7WcjkCW8iEfncRPF+R7Z8DgwiTTBXz0ryoc8j2zI38MvhoJckRNg0om83fE5JmWc38pq9/S+wh312g+Wd2ZAMGOx7zAf5tNyck6ZbFpVi1+adjFoVB5U6Lh5nBIvKH7SEEhf35fjCVJxYDFmKdS2F4/f/yALwVexIwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368937; c=relaxed/simple;
	bh=nivaL+5jSuidrHko+YScK0KiaZrhEQAPG0WgMXLAGWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoSzvum4LQXqxWy/eVopD3Fyfqy8uUA/oPE+dY/9EI71wJyjyk9EWgszGwXdyiI/eJ3Qz/dPEBvhreGmVAvfu7elxGW74D2o6SbAumBk4rYW7oBBVFu00RIOcVVT94PBdUxMhI0s474V9bpdWwQN7NGWf7/KrUBdODqoVaMVRV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYcYHzdQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYcYHzdQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1003851f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788368934; x=1788973734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PQTVimqqf+p1p2NtJSlLzOSP0qFj/dJU9F0ai9FYCBY=;
        b=aYcYHzdQQkijozNa4SK5VaeljyvJqWJw3Xd46fbs8p9wQlTLtOwWGUGcVMWNDl74K1
         mACsP0PJU3mtT4Xq31gyZpIr6MiAo+iFpd6Vu9KcXS7Fwn4XFTFsDgJ8UPQSoQnNS5Zz
         VMbwzYPcnAQQ+iJUSQHRFAbEtfnHq1pDhzGmIo+p6spIwsVD4TnGPRH7T99NryEMvmZA
         tdDn0izrTMOkdHEd+JXPbTFhpVGHdzP47nFrd6/4eb/bmiA59OprtJ+tUvY8tdCzd/+w
         K7WfAxTrZ4S+0j1Bx7RGROxlSW6P4kHiK3wJ7OiG4y/+Gf6K2f8D8huThaNuQvSG0e1b
         pZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368934; x=1788973734;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQTVimqqf+p1p2NtJSlLzOSP0qFj/dJU9F0ai9FYCBY=;
        b=bxIQyJwXSB2IZEY14ToMHl01Q8am6u8M9sxh8AvsepcPxX+b2qGNYF5+d4dmPQ7Ow3
         Kb+fCLS3WauCM+RkMeOqH8aZCkJWGhtj3Cf84l8hSDctBrXV4F4NgDIqY5y+9xYUW5fy
         MQys8idaBf7Vnprz214oQeDyDuqepIfu11ObXssgE8hy4le3rM3OJCYPRvzoCwR0KxdW
         C7VX9nKYvTwLiOoz5U2uBlX3JSojUNdjRoE/zqs/d5DskN0XkZYWVUBudkT0a/xeNRd2
         ZtGCyw1q1G9g1ll47xifOBTErs7WzFhJQFPva/gDgY3yf55CLeCREYtoj7IwL5jLVsBd
         JGQA==
X-Forwarded-Encrypted: i=1; AKwUvByUCEl8qdxag2ZVE11a3hfaRMyO9y2nWWqIylmhKHqAmFMneoFebLzP//DUugJZa+Gn7GhLmh2QmYdmPQs=@vger.kernel.org
X-Gm-Message-State: AFuF++mlKnB3d2p3/8sFZdP1TVJPeokvsP79p+zYv0edIMHTV7Guv5PZ
	l70mAdDSnbLk+6sg4sgCNf5wuMUyABHZ5AZA4nBWEsqq6aa1Nj9eWCjy
X-Gm-Gg: AYBFou2+ElcLM23/gi/y2l1pr3IyOGcoIZfrO8LOsUthOwNP6ZrMpoi5My9Jmc4s73Q
	f+gShA3b56dzRLJ4H5paggV5miKmSd8+RuQnnQA+aL3MmItWeTIMqq6K/849EKtXO/HBD+Kz/qo
	WrnvBSy3M2eXoShUFlEAw6BzA7zK6wmSh6BWJsGsJ0lyG8nI7Oirm64tdmNnKuJ9LcOpMaQdtlM
	ZgOqWIm1NIbvoiDdnXODTbu3Qdp9icN6wtPVTtSbAlFXfUqNIOC5rypA5Udfvbk97EP0jOxc6Oj
	UQiUNooYNz7XiA0nTMv9Mi0Mi7IAEJ3ojTRsZ9Z8ErmRRuHtCkm23ySPtxHxp6UmtdZlsxG0CAL
	EA3OgtnyI6gk4uNXFUCpHyJbMzleq8avTyNruHO2GQu7uir9Lr6ZhxhNC5yfazqUkma+GwwWzG2
	Vl4RsAyP/Wy/vE3w3FJi8TIy/fQysEd7gnKsh1RtrlW+QshtaU/AA29JE4GF24WuErt5qnZlCtp
	HPomObLNzL7LtlGsd4T1uxwsm+BLp0gocinU6JpWlZxv0tupYI83iH63pCvZ7PsQK6Rafd/6MtA
	m1VnAVtN/kpDOguaehJYvBwGD35mldokXs0=
X-Received: by 2002:a05:6000:460f:b0:482:fd9c:5d25 with SMTP id ffacd0b85a97d-484913ba763mr13387018f8f.16.1788368933900;
        Wed, 02 Sep 2026 10:08:53 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-017-232.77.7.pool.telefonica.de. [77.7.17.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cf550sm7547096f8f.37.2026.09.02.10.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:08:53 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:06:56 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <aphV0wtGqn_EJHjB@gmail.com>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>

On Wed, Sep 02, 2026 at 08:16:36PM +0100, Dev Jain wrote:
> Upon discussing with Ryan I got to know, he was implementing the
> contpte stuff for non-hugetlb user mappings and that basically
> drove a clarification on the semantics of contiguous bit and
> this rule was added.
> 
> If you see currently for non-hugetlb mprotect() we do not flush
> during contpte teardown.
> 
> So if the above reasoning makes sense, I can infact audit and
> remove the flushes in the hugetlb helpers.
> 

Well, that's quite a turn of events! I wasn't aware of R_JQQTC or the
architectural clarification behind contpte_wrprotect_ptes(). 

My QEMU checker was based on the older assumption in commit
410982303772 and the existing hugetlb comments, so it treated a
clear and remake without an intermediate TLBI as a violation. 

So... Please consider this patch withdrawn.

It's good that this may have uncovered an opportunity to remove
the flushes in the hugetlb helpers.

Thanks,
Karl
