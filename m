Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D33264FB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921931; cv=none; b=tL5ifGS/4Fxaf+zZ19pGdbx4XbIHyhnS4pyH0K477E301aBiyQwqjv3yUkgywIb8m0phUX5ytr2QhZZepavw73zosMVjK1uGF28Cp888HW3JstC24fGrkR1Kot4xyt8yDy/IkP1velHR66vNWfDEf7wCCz2L3E+b+4VckqOgOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921931; c=relaxed/simple;
	bh=iKjBgcV6qBj4WNaEJl9v+SjMxRaoiiKyIb6rZ1jnymY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6Jnd9Ka5xLTdanFMp0WanzaJkIWrDiN7P5dbW9D/cWBhYgwt6cwOQh5tD8Mf3M0HL3P3vgaFyZ49JVBSb3NgWwfrb15MawRI+9ad0Oo/PVx9RO5CDrzi44i27rrnujNb+2Y9x+y2IonrN2TGZfEYYqXL9mON2dlUDKSeHNDkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k518lO3y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k518lO3y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso6561306a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788921930; x=1789526730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPM3JbLDyjCNGhFfICKTDWjoOreg2oE20rUS09/65ns=;
        b=k518lO3yhsSE7fHtBGmAChMOJfKc/5AhMLxPbpnr/92swcezWpFLVOCz1rQLbA3Q9s
         cCLnoJ+j8PmlwsUzELNfaYoI8ONlluBkD0lHy9iOtNOf/JIXVvlbd7Vye9tkAtX09Y5B
         Emg4Waf9AM4a7+Y2Xa5SQ56ZekujDUb4zpOuLCKzKhzVzBwf8e7ZyA5n8TJ+znjrBeOq
         1dz2lXIaZYci4X6JcLAnoKoV1rFYHYYR0vjAisEQWAVHUuC4DQ0ikLpdG5UaYtW4BqqC
         ntTlVMRTuC/vTwF25fnMjTVokAtGdP/h4Tah4L8p53jKKDbjo+Np8gYXVegw6oSnoCQ3
         sz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788921930; x=1789526730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPM3JbLDyjCNGhFfICKTDWjoOreg2oE20rUS09/65ns=;
        b=DJW/h23gcNuWdTN6WWUB6BSCY9XRV+me1B2WRFj+Np3i5dX+gOX5noJi+i9vPx/OMu
         oO2+cnasq7NNsxc1kxiVr9xYGerDCKofr+S/o/u62GjpWEaSlk2jOftyTJ6aotwOmCTD
         iyc9UeSKpDL18j9zOMn3tyrhFPqhxC0rbE9MltsDn0s83vc0OQHnGhCCoCCSTw1rGpdR
         kBRiGEXWee0NMjKCqKVnWEsu6AVLaZlywrr9VjYbu8BBCyyYvJ154kpcoLUXW3hEOenU
         kb5dN4OWg2Upy1RtcPSE/skw9PbthUhj0jfq6+dTM8WYYB4JnJjrlQQsrSimOLsXVXqT
         GD+A==
X-Forwarded-Encrypted: i=1; AKwUvBwfN7cIeZCC0bOd22LNIJMbgdFD1ZI5/SpgMKLBhhMa6RYSeQHJoVSR1Ufp0Ev4z5fHAJ6JQzLDkgth3ns=@vger.kernel.org
X-Gm-Message-State: AFuF++lKx3RF8xXAqh3nGm7hisjvpx0Jb8+8f4qpItlR5SIXyHmDu3j7
	q2+xEn0Ht9fy5okZL4pU6BGikGR8S//sCbvAfefUWgpiTFPqZyx9e5Tnm6gfpdZ7MHc=
X-Gm-Gg: AYBFou2Y3Cw2oOShJDSsh6wzoC+kS6MmeRUs79Hxir1YoYcgvmeZfFT6A/6Wg5OLlO/
	ABDqDPFim2hL0x+k9zFNsHaxnrM5jVp74p8Nu43Qdv/aySJLhL4Qw34iYYvGffZFnoobxO9LhxL
	2xEUy9S+i8aiHFuS5ruH6i0QdgKnvwPA/ShCYPGH9DFrYGFjb9AfmNtSf+S4pUvjfOZbSP2PrFt
	kpPA5yiUWJB72VlrPyj30b0pY7pe48kZCiC/9HnPoiuxnJDVjEQEogBCG44qyAqHwkeqw8QaVfG
	xKLZ4wD56qEwYH0uOeCrIsTy+Mxrlm4dpMZ7Ixjc1EDKgqBBDWgvHINEr+IAy1i7NgoMHKxrZQW
	6xcnSinlNzb1E5VbOFhAjsigwRLC44zEge4GzE9Jg3gvUJxhrnkOzrTeiGxotCbKMgeJwCV0EpG
	KrQkDKDW8thaUWbTy9nSvctm0RcZLx1MBjSO+9x4YZdvfTQa5C4yfarGOZcpBcPTlHVEX/PQ==
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32bmr13607234a91.21.1788921929295;
        Tue, 08 Sep 2026 19:45:29 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm28581754a91.3.2026.09.08.19.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:45:28 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/13] srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
Date: Wed,  9 Sep 2026 10:45:14 +0800
Message-ID: <20260909024515.2429893-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cb71412b-a688-4c70-9365-3f6bd40c9244@paulmck-laptop>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 8 Sep 2026 16:38:19 -0700 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Mon, Sep 07, 2026 at 03:58:23PM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> > 
> > The transition-to-big code path in srcu_gp_end() calls
> > init_srcu_struct_nodes() with GFP_KERNEL, which is illegal in the
> > atomic context reachable from synchronize_srcu_atomic().  Atomic SRCU
> > has no use for the srcu_node combining tree: it has neither callbacks
> > nor srcu_barrier() operations, and its grace periods are serialized
> > by ->srcu_atomic_gp_flag instead.
> > 
> > Skip this transition entirely for atomic SRCU, which is also defense
> > in depth against any path that might wrongly set ->srcu_size_state for
> > an atomic srcu_struct.
> > 
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> 
> Again, given that we have this commit, is this patch needed?
> 
> 4e01d5320a2f ("srcutree: Suppress to-big transition for atomic SRCU")
> 
> And again, if so, please tell me what I am missing.

Yes, this is a separate transition path. That commit suppresses the 
initialization-time transition, while this patch prevents the transition 
from srcu_gp_end(), which can otherwise call 
init_srcu_struct_nodes(..., GFP_KERNEL) for an atomic SRCU.

So this is defense in depth for the atomic path.

Thanks,
KunWu

> 
> 							Thanx, Paul
> 
> > ---
> >  kernel/rcu/srcutree.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index 01f224a56b41..74acd5645d4c 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -1074,8 +1074,9 @@ static void srcu_gp_end(struct srcu_struct *ssp, bool is_atomic)
> >  		raw_spin_unlock_irq_rcu_node(sup);
> >  	}
> >  
> > -	/* Transition to big if needed. */
> > -	if (ss_state != SRCU_SIZE_SMALL && ss_state != SRCU_SIZE_BIG) {
> > +	/* Transition to big if needed, but never for atomic SRCU. */
> > +	if (!is_atomic && ss_state != SRCU_SIZE_SMALL &&
> > +	    ss_state != SRCU_SIZE_BIG) {
> >  		if (ss_state == SRCU_SIZE_ALLOC)
> >  			init_srcu_struct_nodes(ssp, GFP_KERNEL);
> >  		else
> > -- 
> > 2.43.0
> > 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
