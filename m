Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F678330D29
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921272; cv=none; b=ba1fqT8koG25S5u8oL0P8oN9BM9i6/gkI4VTM85EiQIGTdLPx5UdR/N2kAVY9Dor3g83cdTV/INnZ3brD+9mOik2VeliLJC1ymBXRdI8FSuzks+142Dg/gkuE3tKyio6uyEnVY1+zMR6BhR0hPIkL2XlHo1u8HRUnfcrzAJqRN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921272; c=relaxed/simple;
	bh=Ffu9HsAC9gN1lKHKzFpAVAFlkcNT09m9lIp0nyaL9UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOg9V3UX1zcWyKh5HJzHdaCtthORL34pcFhR/xugV7E9MX65JiwcuhBhOnvssg+m5LX0fwHEInclFeX5022jz9+wWESEUNUaQUDaB+THCQDtTbUWHlJplWCmAKnfTONaE9lD58vNV2jYyXlUc+ImaS35hR5E/5uMg9nYHKioa04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCZ+K7pS; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCZ+K7pS"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84f216add2eso681322b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788921268; x=1789526068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MyttsXrfdZF2G3Mk++3/aJEiJV9PdONAIdnM18uhjg=;
        b=cCZ+K7pSwz24BcAoyyJvmTwVzuyhzXZyKLXIyzWIFlo8v+FPR54lDje7sjZDpmr8cF
         WB0FRUqDOW9vSCFmL2UKLM2SSyVss6VpKL+NruI8y4/2YlTXJxovt5pMJi6jhVY9tnt2
         61rF4SbixmWOwT130Lb0QI78T9Wv91GW2Mr4SqIAslw77vu5ftEeoaCCHJQApGK4mMSj
         q4qEzo5spKI7yLbvUIxHQ4EY6G0KGXyIOYPt6gg50YkzMeJzY8n0SGUhBMHNeFjIelOA
         5oBE3GeHdcK2wxodNbgSROuRRCF/PmASAzMIp+Kkr7emw5UfRxrVEawUczhgsYuNfJL0
         s/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788921268; x=1789526068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MyttsXrfdZF2G3Mk++3/aJEiJV9PdONAIdnM18uhjg=;
        b=W49rDoDiCA104+KJ5Kl9i82PVzcJ03UursznTKOm1IHyvBLvCFtySw6j7brk8BZSDu
         74+HJ3oX7nXajzFKxt+G3QzBhvbFnF0V8+V2mN+pvx28yVLQNEwalkhkHDAg959IX5RI
         IPI/GQFcTeBAzgEpyUrBAf8Qu0NqNt2XadaHv60mzsxsk/H5Qm/ZDirn2DDXveT01AIK
         VdyCjb2ewW8/DPRYPWNSF3o1fSD0liYTGAxO22251YJSxtck7lWKuXk9YXgTtfmyGsBp
         /xwU4Zn7b/eEpxPJBFkkQIWRIyVB2KeMWRdnfJcQGgvBDsg3xY3vFghWjYre4S4ChqL8
         NYYg==
X-Forwarded-Encrypted: i=1; AKwUvBzGZXcyZV20e9gNfZElm0pzxiXSx4Zv/p2gTM7X0aACIR/aP4dvHlHnzWqc9pWjvtcOHqKk95mXD74jgWA=@vger.kernel.org
X-Gm-Message-State: AFuF++mId4Vk16+eCZthE5rhFhJO8UK1pp17mf5sxlilofAbFyyHQWrC
	etCCCZRuIMK5H6W3WAUpdz6eby6ruayl5YPRvRf+X5ydURgz1YQW4PtP
X-Gm-Gg: AYBFou1FGskQHmPBlUw7eHJPwqt7zZW7CAuLIbs5aUeB7caStYxEuVZB2SRwVXT0l8H
	2bR1qgvckRffwWwII99btqe69+KihLJygAFjCiLCr11m0pkR6jutbwetCBGqJ907W36oxnwUKaO
	8wWxKLPd/GSegg/qfIRE6WQzoleawTMlC0eeyH1DKm00l6tSKQf07UQ3qjT2E2Dl/AVAtw2VVkU
	sYEg+ew78XFByvuA2456Wfk7a48WAfTcASkAmlUr8frwkzN1dYwRCpUSqrLRL4YXONnKG15lWon
	KStJZKvQjTG6/VR8b4n+KwvvQjssP2qd5Sr58XmYHdhTKNwjVxCLySVuNWt4lxuxN9vXJNLf9UC
	pVXgJcXvsT28kVskAq2sVaNUWjczv2gPhSbgcSF3v4MwLBKcyewMNTBR89WWpRJbc5lRqrfdYxT
	QXlBjp7bFpT0OrVW7ly3Ckhhny8dDaHnd3D8hbFiipM+Y5Z1lEQSfcRGBUJkz+GAwzkgrcaM16n
	SU6Rop4
X-Received: by 2002:a05:6a00:27a0:b0:868:b157:3b45 with SMTP id d2e1a72fcca58-868b1573f60mr1193360b3a.5.1788921267073;
        Tue, 08 Sep 2026 19:34:27 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c31726sm6188276b3a.32.2026.09.08.19.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:34:25 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/13] srcutree: Make init_srcu_struct_atomic() prevent transition to big
Date: Wed,  9 Sep 2026 10:34:16 +0800
Message-ID: <20260909023417.2427143-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <343676e0-8ab2-4bb1-94c0-57c7da9a1f2d@paulmck-laptop>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 8 Sep 2026 16:36:11 -0700 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Mon, Sep 07, 2026 at 03:58:22PM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> > 
> > The is_atomic parameter of init_srcu_struct_fields() exists so that
> > atomic SRCU never transitions to big, but neither
> > init_srcu_struct_atomic() nor its lockdep counterpart
> > __init_srcu_struct_atomic() sets it.
> > 
> > On systems where srcutree.convert_to_big selects SRCU_SIZING_INIT,
> > this needlessly allocates a full srcu_node combining tree for any
> > dynamically initialized atomic srcu_struct, despite atomic SRCU
> > having neither callbacks nor srcu_barrier() operations.
> > 
> > Pass true from both atomic entry points, adding an is_atomic parameter
> > to __init_srcu_struct_common().
> > 
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> 
> Given that we have this commit, is this patch needed?
> 
> 4e01d5320a2f ("srcutree: Suppress to-big transition for atomic SRCU")
> 
> If so, please tell me what I am missing.

Yes, this patch is still needed. The is_atomic mechanism is there, but 
the atomic initialization paths still pass false.

In particular, init_srcu_struct_atomic() passes false directly, while the 
lockdep path goes through __init_srcu_struct_common(), which also passes false.

This patch makes both atomic entry points propagate true.

Thanks,
KunWu

> 
> 						Thanx, Paul
> 
> > ---
> >  kernel/rcu/srcutree.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index 2af36db37fa9..01f224a56b41 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -305,26 +305,27 @@ static int init_srcu_struct_fields(struct srcu_struct *ssp, bool is_static, bool
> >  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >  
> >  static int
> > -__init_srcu_struct_common(struct srcu_struct *ssp, const char *name, struct lock_class_key *key)
> > +__init_srcu_struct_common(struct srcu_struct *ssp, const char *name,
> > +			  struct lock_class_key *key, bool is_atomic)
> >  {
> >  	/* Don't re-initialize a lock while it is held. */
> >  	debug_check_no_locks_freed((void *)ssp, sizeof(*ssp));
> >  	lockdep_init_map(&ssp->dep_map, name, key, 0);
> > -	return init_srcu_struct_fields(ssp, false, false);
> > +	return init_srcu_struct_fields(ssp, false, is_atomic);
> >  }
> >  
> >  int init_srcu_struct_lockdep(struct srcu_struct *ssp, const char *name,
> >  			     struct lock_class_key *key)
> >  {
> >  	ssp->srcu_reader_flavor = 0;
> > -	return __init_srcu_struct_common(ssp, name, key);
> > +	return __init_srcu_struct_common(ssp, name, key, false);
> >  }
> >  EXPORT_SYMBOL_GPL(init_srcu_struct_lockdep);
> >  
> >  int __init_srcu_struct_fast(struct srcu_struct *ssp, const char *name, struct lock_class_key *key)
> >  {
> >  	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_FAST;
> > -	return __init_srcu_struct_common(ssp, name, key);
> > +	return __init_srcu_struct_common(ssp, name, key, false);
> >  }
> >  EXPORT_SYMBOL_GPL(__init_srcu_struct_fast);
> >  
> > @@ -332,14 +333,14 @@ int __init_srcu_struct_fast_updown(struct srcu_struct *ssp, const char *name,
> >  				   struct lock_class_key *key)
> >  {
> >  	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_FAST_UPDOWN;
> > -	return __init_srcu_struct_common(ssp, name, key);
> > +	return __init_srcu_struct_common(ssp, name, key, false);
> >  }
> >  EXPORT_SYMBOL_GPL(__init_srcu_struct_fast_updown);
> >  
> >  int __init_srcu_struct_atomic(struct srcu_struct *ssp, const char *name, struct lock_class_key *key)
> >  {
> >  	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_ATOMIC;
> > -	return __init_srcu_struct_common(ssp, name, key);
> > +	return __init_srcu_struct_common(ssp, name, key, true);
> >  }
> >  EXPORT_SYMBOL_GPL(__init_srcu_struct_atomic);
> >  
> > @@ -414,7 +415,7 @@ EXPORT_SYMBOL_GPL(init_srcu_struct_fast_updown);
> >  int init_srcu_struct_atomic(struct srcu_struct *ssp)
> >  {
> >  	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_ATOMIC;
> > -	return init_srcu_struct_fields(ssp, false, false);
> > +	return init_srcu_struct_fields(ssp, false, true);
> >  }
> >  EXPORT_SYMBOL_GPL(init_srcu_struct_atomic);
> >  
> > -- 
> > 2.43.0
> > 
> 

