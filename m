Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EAC497B95
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817688; cv=none; b=OqHrLOMAGjEjPkdbbHK0Qtajy0pl9PEoif3OzkDK+wF7GoYF3uCpNVJyLJP8egjI8/I3wm/YD11pjbpXFsPqEcRQRQzeFcgLoP8OC9AvNInK8ROC0q+QqLhTQxQANkpNY4xB6mVJN3dTpwnu7w6L7n5Eg/yAqiOlJKsLh6giez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817688; c=relaxed/simple;
	bh=OsG9QFWVI7GlIGSTCxFfoFpAyRAObqzzGqmR5pOuPKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O//Ox2PHOP2VC+jdERGgN9H4sga9UAWFdbuycxec641HaGaZ0MLcDjvKSy1vQeiNTFbjiIUb6x2vsPfQD+DvnXAyYbsjYKM09snmbMtmtOPMHh5yBJ1UzDPhSBTp21allP2TaUT8VsWri1oODVE0z1J4R58zzRKAiweFp+ih/Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anZN/cUr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anZN/cUr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so15749235e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817685; x=1792422485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWiLDXPot0/+PbKR6u2nu/eRULx+LiAnb5d3+K32M2g=;
        b=anZN/cUr65LkXxTiqGKr0m2qcOVQReSICYH3a1YFonZ6RuwtdfQd4DeqeIGvJNU8lk
         arw9EI0zpIsMZBxy2GFjspH5c9J4PwWKwIZEbSkn+pluDxI4f7V2Lpqfibqnap+55asF
         AY8o3BhHY1iTXhViXwyBN3MlwoNJu6iGo0bMICZjeJghEBBWBn4KXpVnO6vx1YK9pXn9
         EwVaW7sSUx1JgJa4N6Z5N/9O5bP3zwaq/huBiT8AOEnHoH3IXWJET9BIaHInsa4NmqyR
         NeJBCeGHqi0j89Q8d49IoxMfL7CxBEggEqs2OL0Kwux7FH32/c0kzgXXrFyQmoHQICoR
         GnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817685; x=1792422485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWiLDXPot0/+PbKR6u2nu/eRULx+LiAnb5d3+K32M2g=;
        b=HVRHiIeZZwVzOSi0YomrakJfhHm1ShvqfMxDgdIs+lyUEW+3wb3rKzA4PJ/vL9yPZ7
         2zFgCcuOE7D6FCo/7n77jvW94tYrvlMDn9rnObeEForkGVlsvVqk6qlDrAGb13pmy0/z
         zX3s3jUQulbGnKEfkrN6VrPCesmfkAICp2E1MNNOrfLG3Nt3QiMjtFBxbOF33xSXkOX0
         CDZKenzcAx+24UlhsdA6Ut7PijeXNakoCaPucJmnz0iZk747sVMiLoDEvdf3iBr8Wkaf
         ptuvNnSCIuXp9ZUJxKIful7JCCBU/90HgFR+zCaE1ZtRFWhV0cPTPqpfmbN0+rmz6vWv
         /mpw==
X-Forwarded-Encrypted: i=1; AKwUvBwCmFxftrw1S2Ua5Vjwll+DZy+vlgnSD5tISr8vg+xsyHHmn5bSvm+NQ9aN+SHJOg3ftUZ8hAeWbAJjky0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGMX3t0RhNT24lMYR2VSrZWaC4eMEwCNHkyx+QIKHLLx3Pw0Wd
	zVV2p2vXBJo0zbOd0S2EBfZJXP8mYLI0LR8xMqGD9jJ8wp9PWLE/wwdD
X-Gm-Gg: AYBFou3Pbs4OxgbrBMJ1FU3vc4ocpd7dxa0WbDagMTGw/zLDrctSaKT8DOWlJYxIWfs
	tGPC9kh5B3O9a8LiOe/16RN4xgwmWr6IDTi2XuTYu23nC7BSw+a/4Yn/gPtwiLO2nNNyk7We/QW
	bNGiCVKC6gbPRpNVNIdxbf4QDrUeskgS9LHmHtHdR1wU/kMvGgZWwj3qA4ZvProdrz96gY17kAY
	qk375gnI/QM8J4+m6LfLCskn+NvWs/EO6FcDZZLXUbk9x5TDcIgf2skuR8O/HQPNBFrxJ++jvns
	mu0oCJwzbEmdrfJXvGwv7b/oALK770J0kibsK3qpDQ9HlXnbPQf/0dCVa1XMqdxwQX1HxY0gCoh
	xm+Jco1CgMY22fwBxG8wyoe5I5ygl1Ow2aVrNEYki/RG4NAWEMsFnN87uKLHx/txDnaOVUfl/xF
	FIhhHuMcrr3tSWVhqiGgbj1VdO8JxA6pZkKaKPI7iFQTSpp1O5h2xFQ9IsN2lBQ/5gonBnXr6+2
	hIdX7SukY6voDbjuDJEPCREMR3q9KwubJ9wjI0bKVAl
X-Received: by 2002:a05:600c:8b70:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a18e4a174amr181863895e9.7.1791817685033;
        Mon, 12 Oct 2026 08:08:05 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.59.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967affsm9916f8f.1.2026.10.12.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:08:04 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] livepatch: Fix races between stack check and module load/unload
Date: Mon, 12 Oct 2026 17:07:25 +0200
Message-ID: <20261012150758.207983-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012144933.GW2009045@noisy.programming.kicks-ass.net>
References: <20261012140546.154730-1-parri.andrea@gmail.com> <20261012144933.GW2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 12, 2026 at 04:49:33PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 12, 2026 at 04:05:45PM +0200, Andrea Parri wrote:
> > @@ -201,12 +202,16 @@ void klp_update_patch_state(struct task_struct *task)
> >  /*
> >   * Determine whether the given stack trace includes any references to a
> >   * to-be-patched or to-be-unpatched function.
> > + *
> > + * Must be called under rcu_read_lock(), see klp_check_stack().
> >   */
> >  static int klp_check_stack_func(struct klp_func *func, unsigned long *entries,
> >  				unsigned int nr_entries)
>
> As per always, I much prefer things like lockdep_assert_held() and
> __must_hold() over comments.

Makes sense.  For v2 I'll annotate klp_check_stack_func() with
__must_hold_shared(RCU) and add lockdep_assert_in_rcu_read_lock() there,
dropping the comment.  For klp_find_ops() the requirement is "klp_mutex
or RCU", which list_for_each_entry_rcu()'s lockdep condition already
checks under PROVE_RCU_LIST, so I'll just drop the comment there.

I'll wait a bit for comments from the livepatch folks before sending v2.

Thanks,
  Andrea
