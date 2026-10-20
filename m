Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500825;
	b=u6CIje26MXwwXld2iZXV2mszrKPhyWwW6ZoL04z36M941iiMwF8twz5Zj6qizhzxRWLp
	 +LAV7NmQjlGM+AczFkOxavHmSg7+qLJYV4PxYIgJOWtf+Qy8BCikN1xxgZqkmlPh5Zw3b
	 fO5Bog4lF39LJwsULKrtqo6dIqdufo1FcX0iinDWvyQoQSIgbK1rCiHR2lvBzOgwh2dZC
	 aO+6VjPiCzDlOp9CRhBBF4+65j9Z0rSeL6Ap55Qgx4QUNZgxfEh9k3Ov3qtDArqvWrD79
	 RiTrNEW8vSVImgrEwNiLbZUPfxnqcXnx43Accv82njw7/jLPQuavSnynyeH6KXLvmmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PHhSiGv7NsVrVBKhJQlP69zE0Ua2+MTZMk1VrAIO/GU=;
	b=ljSc32xZhlKXWXh2bXYzUJAxvnuxCZ8KeIA52AXzJdjXMK5ceMvGllzaPjRbEkQ2F0Un
	 BcaBA75393V2FvAjgB8KZAvLc98VKD7CnfBREd7PPk21c5m2QdVOZDP4c0Zygvc3crXn/
	 abEBGQr1yAXtqn198uR5PbBHITZvr0Qd0Mlh7DFtIs6frCWCcdI02l6SYj9hX8/6G/nTR
	 FBhm6Mremoqjle3uCR9AG+NFtrNCED5nW7lA8wYQZorovQ1ThPk9rZzEPF7QXZNIfFCdh
	 L43ERwIbUrH0oCoPVqUSFPaMAt5XKmtUWrLzIpH8Wdy8XGDKYzMDADNbUa44J/8n/xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l8pNXIPd;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D739606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D739606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l8pNXIPd
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so3153864a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500824; x=1793105624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHhSiGv7NsVrVBKhJQlP69zE0Ua2+MTZMk1VrAIO/GU=;
        b=l8pNXIPdPKgh6DgFmINJfHrqdYV6b/OPNuQDuY42FxvFthp5pNYGUeDZFIoYiWKOmG
         vFhQ3Fs8VPQuqk/5oA000CQ3bU+1qdcggTd6nDOLRaK/TgQthZsLvJ9BG+uWy2UrSKNM
         O5BvXzKyIZsddoFNqjkssqVLkNxrzCiWKsm69+PY1tjIYCgUQZmxYp4TSohTW3YCavzF
         0YwZgQbHw6ULGc18Kng4THpCsoMyDp1sne/c0hPJpsqqrKzMv9DFnyjrJOfa7HQPE9Ga
         G85Yz7hwnfBgAmF7xHyNitDWBeMyjK6ClyL9o89gctv8vFJ33LIJmd2OBDLbLen1YF+9
         6HXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500824; x=1793105624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHhSiGv7NsVrVBKhJQlP69zE0Ua2+MTZMk1VrAIO/GU=;
        b=WY4OacxdKu+zsRwa5dGgFKcGDXrFwtZht3M/K3eCT97Jy5kL4Bjw06Fpvv39YND9iY
         5BGLLsDHuR2XF7FQbkT78JAu0H51xUhHysd9yCcoeqLdvt518cVcm8n35jZFOivm31xA
         HdzsxTZl6Mkvu52bbq/90/yRR0p8X7eHjyL9LKRdTdmv/G6tq/Glmr3j0iywnZEkBOPe
         DxYe/OkXpK6Cbl/6cQkMc3ubpI5nOWpGwAU1TSglpwANMjdAzKg32jvsGa7nsrNdZQcz
         uTwvlt8/JOipZgprtfjdj/eZnpCeB5mbzu0RSJE+qbUsCCN8W8JtM1cPECfL66ZSzgou
         +L1g==
X-Forwarded-Encrypted: i=1; AKwUvBxAqyOr8iuQNz30m8LumqeamTvUBvUeYEhVgMsKu82CieGA6xEPQarOto0yxULI/Av1ndg0CG/sENn9pFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUG/4xdp8rx0V2WQmkPrBCgTrydILF2lnXnIzWyyIJv4rdwP5W
	JAd3NXBg6J8qBfEptYCToIKvP81mbric09f+a1uW6QXnWUSIpcFpz9r/
X-Gm-Gg: AYBFou1vXpsNELd8jH9xF29uQgQ+JdOfHNNE6InWaFjoPkyZwuTAEkHS+mm/pi0lisW
	aM5BUSRZIj0FxdM7kcrDF5AifxctiDEt3Ut/vLLjf1RVgiiR2TPzqvPW/nYBLE3mFCRDgbjeahX
	1jTQZCsrh9TDCZQXhC8XI5HAHXa/XSjSv0htcxabLGC0Cl+hSgpiLKFa3sgtvvWciDQwTZW4+vc
	hUYxBH61He0z4SP3VFdLexayUymUbUFCUtf1O+zHPrkrDJg7Yi1FxC3tzdfL3VLpsLk0gsABaZd
	7tny+ikSbvVR4xKbiXj3uGucb811qMRQR40ygSRLRMF3jEovHaOzWH30YyCZZ9Y0fmCti7DXaPg
	QJoaYwriOYNmm1bu/OiPO9xGocYPMjRiMzWYpv8xgZRCskMNf4lYvfvnXF6MLyzUjZaxHpZ1PEl
	LIBBNBQwyM0Rxu32o4FXtzg8/xtL6N8ImYNsaSVVqEHglYmFHHnf3oW5AkIDfCEBOO
X-Received: by 2002:a05:6402:a518:20b0:6b3:e575:f4ed with SMTP id 4fb4d7f45d1cf-6b3e575f74dmr1272971a12.21.1792500823260;
        Tue, 20 Oct 2026 05:53:43 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4a::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1335d3sm5347046a12.3.2026.10.20.05.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:53:42 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Boqun Feng <boqun@kernel.org>,
	netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Bart Van Assche <bvanassche@acm.org>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net/sched: don't wait for RCU when destroying qdisc lockdep keys
Date: Tue, 20 Oct 2026 05:53:35 -0700
Message-ID: <20261020125335.678200-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atZtYi_Xnz27O8Bp@tardis.local>
References: <atZtYi_Xnz27O8Bp@tardis.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 12:20:02PM -0700, Boqun Feng wrote:
> I think my concern is still valid: for lockdep PoV,
> lockdep_unregister_key_nosync() is an API that users have to use it
> carefully, because it leaves the unregistration process in a stage that
> you need to guarantee that the lockdep key reclamation is delayed by an
> RCU grace period. Or in other words, do you have a way to prevent a user
> from doing lockdep_unregister_key_nosync() but kfree(key), or some sort
> of debugging to find a mis-use?

Not in this version, but lockdep could catch it. Every slab, page and
vmalloc free already goes through debug_check_no_locks_freed(), so:

 - lockdep_unregister_key_nosync() records the key together with
   get_state_synchronize_rcu() in a small fixed-size table;
 - debug_check_no_locks_freed() warns if the freed range contains a
   recorded key whose grace period has not elapsed yet
   (poll_state_synchronize_rcu()), and retires entries whose grace
   period has;
 - lockdep_register_key() warns the same way if a recorded key is
   reused too early.

The table is empty nearly all the time, so frees only pay for it during
bursts of unregisters. A correct kfree_rcu() or call_rcu() free runs
after the grace period and never warns; lockdep_unregister_key_nosync()
followed by kfree() warns on that kfree().

Would that address your concern? If so I'll add it to v2.

The other way would be for lockdep to keep the dynamic-key hash nodes in
its own storage, freed via RCU like zapped classes, so is_dynamic_key()
never dereferences caller memory and lockdep_unregister_key() needs no
wait at all. That removes the nosync API, but it is a bigger change.

Separately, two corrections to the cover letter: please ignore the
stray "From: Vlad Poenaru <thevlad@meta.com>" line (Eric, sorry for the
confusion; the series is from and signed off by vlad.wing@gmail.com),
and [5] should be:

[5] https://lore.kernel.org/all/20261019170601.805087-1-vlad.wing@gmail.com/

Thanks,
Vlad
