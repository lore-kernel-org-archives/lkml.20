Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533815;
	b=0GC6hFPgqJ3jJhcXbYrhQOJSgQnfMIZdklpXuMAqOG0QtOPfrs/MPFL17ZoB0rm1Idr2
	 JrBUg+1mAyiAXPFgiYSyn9r07smPeVMdiu12/mkXAskQC79m0G/JJ9LP1YFS2bj1qdp1p
	 XFURJ3F3oPIud0pGry4Tpwa2ppZTSCq9XQ3MN/f2z3q01znzPOu+GquGHJRdsWT/BEO7N
	 THXfVwXm8Qo+w1HAJeP7WlcIX5YBCQNxSd5OsuuBrbahIrjjcJedxh8l29J/i3oxGsd0z
	 QYllZda8LneHd57FqJz/JVRuNyeHMEYWZ3Us7KlJE4vJ01kfKTZwPu+S6rjkDmKZIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+dby3oqMku+pe08nNb3SVcKfzQbLv8VO0Jweo3C76TU=;
	b=UAl0xva42jZYIO2UKaEaYiLlFBHXOCgdxKxPrhO8D0B3brTb6+5WXJcyn47CNtsfIrpT
	 SYQsoYyf0kBQQpt9y+wyS+mjCjn+p6TXdQgJS22NR9OAat1OX+5JfwjlZE/EpDVYFXAVl
	 Zon3UYIQnBQUldZomGSCikuu/I+3kCTzo5OgY6w5iWajJXa8llfwZYHkYTXUf9tEqdFdk
	 bYHppYntj25uaDR1/ytPkjtE12EDgwDFBEA6eSTvChMHIMH9ewCcf0mGnSPcWerGVNsSA
	 LAmd6bZh8F9Lwh5XOZoNTVaYYet+j0Na5/E7/HeLim821lSeaRCLRF06IcWo+c5e/6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwMeU46D;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425D2606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425D2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwMeU46D
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b125371596so8139627b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792533814; x=1793138614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dby3oqMku+pe08nNb3SVcKfzQbLv8VO0Jweo3C76TU=;
        b=bwMeU46DSpMaL+E6BqdBfQM1X+nhJNew/stYea3NTaaDZpNMxczs2ExuZDRUYrYu1L
         HFvyQt95rXzkohmpRrgBFYSLBrre7BytFYppMXmWYY4vJGalc3WO2HiadaAADOgdSsAs
         EG5L+pa+8QAnWju4iXY3gwEJtbHx7yXnZVnPXQGrTi9KYo2ROFmpTpkOZJgI3KW4RV2q
         pESuZbnNwrmRpPTY2hmlfDTQe2YT1BILU8EGiWFUmU6U2BeQBsFxBYa4aJsVMReXsABt
         f0SGVSVvSNezeI3/4byB2xiyFvVhuBQN1+aTxdGJWA3w5JCimYVbEoXkS0JdMJXpN6Uw
         mMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533814; x=1793138614;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dby3oqMku+pe08nNb3SVcKfzQbLv8VO0Jweo3C76TU=;
        b=BDQZs1guh9K67iYwTRO2/EimPR8NcJPxkdTcvjGjmwh+E/eRBwhG9PPphenvQuX4ub
         l1kE2vfMTNHfax1vBV++QU0f5qFGtawRh0w5v0REemp/gVxS2R/X41cvSmocjyX6g1gw
         3lEbw3q1nzza8SX+bzgvM1WypoeO9d9IK3Z5cb91fdu0c+ZkzvlYgnCrXVhzvGNBNprj
         92HqJIAvCxpcGK5ZquwsAtzbSO2sUxYH57zpwqbkvJIrt2IFJlt8Iust1435FydRBLiN
         TpPtIsldfEg8Ugsmr4T+WmppSWkXld66DRUBZw556QeFM5PP8DKaVVxgYh8xpD9qL9RL
         JbOw==
X-Forwarded-Encrypted: i=1; AKwUvBw5mvbNPIKhOSJhlP7nL7JLprkYTzMjeN8suyRU1hRGou5+zLvK9SfchYXV/HhzWUNCdK3XMDg1l7smuho=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRyuSnvMF2iua/6bMn/42WFCYwOt0hoayq0lJ00EyOvOxt17ho
	wGL+RU88ig/YPOA40Y58+CBdJEV1C414wlJCl/g/lGNRmFY8RQO8AfOt
X-Gm-Gg: AYBFou2hn3BjOsFz7Fkwuo4RLN8ohR84e9LolN1oKukA7YuU6uba1qyi/Mx2KI0x0gK
	EZ2zRWi4l9IoAOb0vG7COcqmjhqBX31aLS1vIoVG1d7CaCAU+xfyQZKsCI2/56uX+UTBVx/BpHf
	T4zLL9H/+1jlo5j9vmNgNpMAlasG+enUgN1o3y+IhC7xzwtJrDuvGsISPexpVw/wUnGMLuqd7Yr
	vCdpjMDg+siXOMPPeYvkszXsmPpMmXD/LJKomEsAtBRH5FUWiLyrb3v5ZPweqRNh2TACx5V4dwH
	mKKtWLJ86m+9K5b3RDtaXL4JITXj7eZchukzl3ZnfsSQCJC+HJ5zKpdAAZTIDkDj1rU7OYfIwn2
	c9bY/Qyp4hsGrjG3pF1S60aIIsRVsEBcr7O4snFmFPzn0oipBBWgO2cbEbcEblT6faaEGJv6sfn
	eXAPwRZFPoW1puPG0JMHTtb5RZ1Tp0jeaMQSrelr7CH2LvLxLcunkS/J7HQKxgmEYvirvJy9+8C
	VZSpgOj7lja35EEFu8jEC/Rec+PJg==
X-Received: by 2002:a05:690c:a:b0:8b0:a30a:7f31 with SMTP id 00721157ae682-8b133dae495mr1678197b3.29.1792533814287;
        Tue, 20 Oct 2026 15:03:34 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5d::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300eb0ecsm3660387b3.26.2026.10.20.15.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:03:33 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm/memcontrol: publish null pointer before dropping css reference
Date: Tue, 20 Oct 2026 15:03:27 -0700
Message-ID: <20261020220331.2641416-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atfMngq7nyZpt4u-@linux.dev>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 14:21:22 -0700 Shakeel Butt <shakeel.butt@linux.dev> wrote:

> On Tue, Oct 20, 2026 at 12:35:31PM -0700, Joshua Hahn wrote:
> > On Tue, 20 Oct 2026 12:03:38 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> > 
> 
> [...]
> 
> > > 
> > > So for drain_local_memcg_stock I agree, since FLUSHING_CACHED_CHARGE
> > > is set, so you can't have it concurrent with drain_all_stock since it
> > > will skip that stock. But refill_stock also calls drain_stock when
> > > it evicts the slot but the flag isn't set, so is_memcg_drain_needed
> > > can read it at the same time.
> > > 
> > > What do you think I should do? I think reordering makes the intent more
> > > obvious and maybe it's just me but I did find it a bit misleading at
> > > first that we were dropping the reference and then publishing. 
> > 
> > Oh and just for clarification, my page_counter_stock series actually
> > gets rid of this codepath and switches the order when moving it anyways.
> 
> Yes but this patch has fixes and might get backported, so we need to be use it
> is fixing an issue which is real.
> Let's try to reason how the race can happen between is_memcg_drain_needed and
> drain_stock:
> 
> CPU 1						CPU 2
> 
> drain_stock
>   WRITE_ONCE(stock->nr_pages[i], 0);		is_memcg_drain_needed
>   css_put(&old->css);
>   /* assume full grace period */
>   						  rcu_read_lock()
>   						  memcg = READ_ONCE(stock->cached[i]);
>   						  if(READ_ONCE(stock->nr_pages[i])
>   							mem_cgroup_is_descendant(memcg);
> 
>   WRITE_ONCE(stock->cached[i], NULL);
> 
> 
> Do you think there is possible race condition in above? I couldn't see.
> 
> However I ran this through AI and it has convinced me that on PREEMPT_RT, this
> is indeed racy access.

Wow, thank you for going through and doing an analysis!

> AI reasoning:
> -------------
> 
> How it breaks on PREEMPT_RT
> 
> On RT, local_trylock() takes a per-CPU spinlock_t (an rtmutex). That is
> rcu_read_lock() plus migrate_disable(), but the task can still be preempted
> inside it.
> 
> 1. CPU A, refill_stock(X): there is no free slot, so it calls drain_stock(i) on
>    old. It sets nr_pages[i] = 0, then css_put(old) drops the last reference and
>    queues the release work on CPU A.
> 2. The refill task is preempted (by a tick or a threaded IRQ) before it clears
>    cached[i]. CPU A's kworker runs css_release_work_fn(), which calls call_rcu(),
>    and grace period G starts. G will wait for the refill task, because that task is
>    inside an RCU reader.
> 3. CPU B, drain_all_stock() → is_memcg_drain_needed(): B has already passed a
>    quiescent state for G. It enters rcu_read_lock() and loads cached[i] == old. G
>    does not wait for this reader, because it started after G did.
> 4. B is preempted right after that load (RT readers can be preempted).
> 5. A resumes. It clears cached[i], puts X in slot i with a non-zero nr_pages[i],
>    and unlocks. G ends, and old is freed.
> 6. B resumes. It reads X's non-zero count and calls
>    mem_cgroup_is_descendant(old, root). That reads old->css.cgroup from freed
>    memory.

Thanks for taking a look. I think this is the race condition that Sashiko
brought up in the original series that I had.

I will go ahead and send a v2 with a new commit message that explains
this PREEMPT_RT race condition so that it is more obvious where it can
actually race in a kernel. Thanks!

Joshua
