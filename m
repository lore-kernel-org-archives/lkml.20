Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73E43713C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494444; cv=none; b=sU5smdWhZ0f320tPAOmTdh0+01gdEu2eDXmOw+/1v3EPiDydc1axSwFe3XreYmHL6WqIeAOxq8wTSf8S55XVnrKhTnQzU/BhXqOARIkOE2Yjfi9Nmf5xJ13fuiugUM4wPGP1gTFtaw82FyUUYPcAIi7vVjIjbS+RaaGgedkudHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494444; c=relaxed/simple;
	bh=rrgzg3Z4H6zmzdxcdmQICirRI63HfC0lPR5DEEV8sIw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkcbUKP3sbaU9K1QfpKOANuLXBjtP3sGCb7MSdKHtKyAj6paFnJ1Ae01rq7yWXVG/MFHYtLS7+xxKPQquMA1FaPWYOL0/wNfro7k7Owd/hz3SP4PtNOrkcVe05d3aGTGWCp6Aa63FemULSGCXf95fk3c4wX31ZRRN4HwAmlneig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc0H2ADL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc0H2ADL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so773315e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494441; x=1790099241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MApJS5fwXMI23Y0SGQfeGFFSSuOjp+Cb0YRS092Lc8g=;
        b=Cc0H2ADLf0rflEk48g0vLLhVyDJyWAqDZh9OIRV8pL3pfJ6WpqRd1RN1aDCh+pBqyn
         TFpRNYJRzFo8iju9DVol7TSlc1Kb72xcszYuahtZK+Jp5H/JXo5TYyYKZYiGh5Ti0qt2
         oZXb4jRSugMNxkSCdlautCDVnwGYqxavYGK4sntR1egJYsaUBIYPv9UzUNhS/2eU0D3W
         hTj8LxVEtHNuHAlryoIZXSgJLzDlt6SXR3GcM4ZqKwzlOnFv/YslXDVqm51D7vtdpEam
         iRPsNpgqWZX+xVAuwTxt8T+v3XL47Dz77P113UNK/POw7lc7oevpKnuPhB0QdGGfX341
         Pn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494441; x=1790099241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MApJS5fwXMI23Y0SGQfeGFFSSuOjp+Cb0YRS092Lc8g=;
        b=ssfBWS4RlFsoitTW+jH83H0ZuCOvqhZuF3hPJhbaLZdYyphXOHFhqpbdk0ZNr8sVGc
         1IAyx+p0xPWstWJ+SSVkpaB8Pu94tGxQUZGOlNeDOv8HX9MbIxyLH8dAeYRiEWxqw5Yh
         3FUaiF1wM2wbag//jCN66z/C0hjLbMETD1a6d6kiZXn1fPn1g4lJyjktzmn5nc95nuzB
         ScHzjqlApBCTck/Mc+k8RwAmdVZL//MBs+TBLPYpR6YkXxhxcENBZrLVE/ADJfKTBZS3
         EZsqBv91brNcEZ4lct2NqtQhT/8t4aAw8PBIg/bq7EmVAgwR7b1ootJqvVxwSDh8RuK5
         eVog==
X-Forwarded-Encrypted: i=1; AKwUvBy3o2Hyg6kXi9U2DZjpK9NrpM4/zSzTQIYBfrrwalz06qE6pTKks6BrMIa7VRbsneowWXg6gB0X5pHuuPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mNJfbIakv1BDL7+efQGk6ZDVEHpqDrmBNaYxHB4QrdBNd6HKkd
	kuKlvPmllxZUJThX8BAvEJq2i3IQ226yErfT9x2oc8jiT019CJxA275Y
X-Gm-Gg: AYBFou2byzgzKx0EAvUsX0xZlsGR9hcoaMVDwaEU9tqVyLNkMGZJO+7HYv7CD176mpq
	70I01240aR6i5t+q5pMWzOV1+H4KrZHqjYyMMm82MuCkHfcNEO2YrHxWAHBQC148EoWLJ1/vPhD
	FCapWeP+X3YY/aART4MHWygSPgh8CASdCskjyrSvhmK9gnpeaar8e3ZTE81t64kEloWo5Fx5+EL
	Ji5yqr3IE/j6v3fih1S27Z3HtQexJKF2HZRlb8HNXU4fsxGF0uF3chIlCdy+Thpy6rmu6KftaK7
	ub19slNSQuGPV4pyTc8izLhBNk3JHWtYHJxdqSs8v/Zmp9e89XToCywwxIhgOZ89BGYnn0x57Vp
	WIaxUupfynpILG2+g39+gSjR2zwxPyo2uWu/iX87qZtJtafQY322ssXyOZRWv3pvDbDVLefsvEW
	mWEE9djA/Kkw2gpw4M5IMwniC/3uRV4tT/3GvmRgr9NiIM3IDER5Lr67DKGY58Ammbg9T6HZQTc
	nf+kQmAWKg2/n65VsXLkxGWdtw29DhznAVF
X-Received: by 2002:a05:600c:3115:b0:49c:fc6e:a3d6 with SMTP id 5b1f17b1804b1-49e8228f7c5mr29727755e9.21.1789494438295;
        Tue, 15 Sep 2026 10:47:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b11691sm11682145e9.12.2026.09.15.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:47:18 -0700 (PDT)
Date: Tue, 15 Sep 2026 18:47:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260915184717.4735afbb@pumpkin>
In-Reply-To: <20260915140152.GC4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-4-david.laight.linux@gmail.com>
	<20260915131314.GB2009045@noisy.programming.kicks-ass.net>
	<20260915131510.GD4121620@noisy.programming.kicks-ass.net>
	<20260915145513.111c4a23@pumpkin>
	<20260915140152.GC4121339@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 16:01:52 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Sep 15, 2026 at 02:55:13PM +0100, David Laight wrote:
> 
> > > That comment *should* obviously have been here. Also, I would *much*
> > > rather have this store at the top, next to node->next = NULL; That is
> > > much saner.  
> > 
> > 
> > Part of the original reason I started these patches was to remove
> > the writes to the current cpu's 'node' in the fast path acquire.
> > That completely saves reading the cache line.
> > It also means the initial xchg need only have acquire semantics.  
> 
> That makes no sense... you *have* to write node->prev_cpu, and since you
> get to have the line dirty for that, a few more stores to the same line
> are 'free', no?

But you don't always have to do that write.
If the lock isn't held then you only have to update osq_lock->tail
to contain the current cpu number.
The per-cpu data remains zero - the same as when unlocked (and initialised).

David

> 
> Trying to make the code keep invariants like that also makes it
> needlessly convoluted.
> 
> If you need a store -- and you do, then you might as well write the
> whole thing.
> 
> And if you think it makes a difference, your changelogs completely lack
> any factual data to that effect. That is, there are no numbers. And
> without numbers, we're just not doing this.

