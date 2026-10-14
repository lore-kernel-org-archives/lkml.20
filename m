Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC63A492E26
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010201; cv=none; b=bTVvHWyTJhqbfRI+CgIZPAXekRomz2RYcKDeqhAjV4AmiYijSoj25zPiqL5qgwBem86oVNzuDHp/4FBwbiomLk2asZrfVCgFxCnoB5QoQLFH7Y2fKHQo7IsaYqzrXyYjTD75O75VKRTI7GUKzXxLfcQQhdAbviPlZwcOBR0Rf+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010201; c=relaxed/simple;
	bh=Yaq2y0T6gfAqVyOLIxfokcNGEF1k7Lgu9sj4v/I0hcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDn5tlmOjYAWdm1VrjuMMDUyos8P1VpiaQG1dMd5mf6g9VI7r6IlYbe018z8bndYZIJEgOeFrIvx2aA9YglVb67w0+i5BaQRjI3hCu4eWP8NVcdcCwmMdDXXGuTpGUg7aPmLsglAfGT8pcHMudPaU5+c4qJ6RHbVKaAv8lz9HGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3rmOTYS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3rmOTYS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso6265455e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792010198; x=1792614998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nw57+YtjU/AyH+r0DpwU8s3tfNF2n88Kf/VOxF9MUk=;
        b=k3rmOTYSNARzoQUGF8jaEHYXAGntZ127ck2ZslUnEubqTPoAkBdT6KqF6JHyXMdwpF
         9w5390dfB9gLVpO5kjn57peGQ2VQRi1975No6JGwfOI5MIuycif09mcVlwO80iyEQkR1
         1yb82555utp16R+gwVzfQmw8RyufMZHkXo2xgS1nUPR3UEfydUVrQaGO4rvcWX8jVMXZ
         s/yNz1R2+RI4ItkHagmnP8JhowbBivVWBRTGqTzxzBwikXQpWDuR45MD0HUKPPbSOLI/
         ufR5tv1PPM9T29/u/nLHGWy9jmmtpDw1ErSP3r1HLP5MtcGrHRHPAZKDMd8OEK2OI/lh
         WnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010198; x=1792614998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nw57+YtjU/AyH+r0DpwU8s3tfNF2n88Kf/VOxF9MUk=;
        b=1bOwonr2LNE+H8q4CjgtL8DYNK3V4cXQNksUW1kCWyrlLTj9FUjRgBojX2ulyGnDas
         y/ZahO8wllaz+o5djfcK2IPgyIRuIKj4fTwwpPBWrBcxeHOnv2uNRfcTifJBa7W1CraS
         trHh2R+JYD0ZBGGB1Natysvb315bRHrY5DyJCj5nNue0pskWomteY6wRHORHyYq1iBNc
         /aQP85ZJhVVBSk7LQCksu+dROTe/t/OySCmO2gkgB35IzSlQYIlCl2vj7Df3VnOrJBNB
         maJm1LlCrl2dTyWOPceZDi43/rHyY+z3yti/UirtMDg38ogzipRHqmEKJDISEbyCifZh
         Zi/A==
X-Forwarded-Encrypted: i=1; AKwUvBxNcurSX6G0PAoty//SQB8s2jU+r+/Exgi0r+V0tlgPY2J9UGHmihId8NBQhh/jdk/wmSUQGXAmKai7tjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKGCuCquByHQ4TBOl1+m2IAolFrsmEX32rYfkupuXa8z+1K9TB
	o+MAbvOnhq5aQLnHkmPGMdaHlfITDQqouXGhqiKQJF/dNZH3V3OdsH72
X-Gm-Gg: AYBFou0xrPQuFXG8IA71QcJmxzeUfEmIdkWpa7cXLwsITOQGE3fg3fLTaTxCj5QEaRq
	qwYwtJ7gy6y3fb0GHgRvLWRsjevcWj2nqdQtHChTuXzrPAvhd4Qj6l3yRDqv9wwUwv3bavB4gxd
	x10SALM9FmNZtV/2TWuX3i4nOeLYl2fluaKSXMNro7p+hRlB3HdVDmezKou4YYJ8R73fnCciCH2
	HKOEfUo1KkuvtDZUlC4dZmuneSeYtdtqGOqDl/2I3pLYWvQgbvU+BUzQynV7ekp43XHvo4B61KZ
	wv8aXo45DtHbWCjD8SOcD11KhybdVIi0TfOtmo3v8F/PvEitRYi+Lm+9Orjifa160e6gxSSzRq9
	se1sHnKsMQynldMbIHvQYpQDg4Zu5h+52VGmo32qaMOEbIuipVCKL+loBDe3vMmzbWDGgAIKsGA
	SKbHg5SboyvmoJSxNm8yPvj23VNaAAXqE8ODSeLl8IybsEBIlnLsYwWhjsLPvdS1YhiZnlSfpze
	Y33iQLUGmgErN6vllaQh0AEAwpoJUYkFoj0hKFEdkHCEg==
X-Received: by 2002:a05:600c:19c8:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a18e47ab20mr346657615e9.11.1792010197775;
        Wed, 14 Oct 2026 13:36:37 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72d2b13sm8940303f8f.55.2026.10.14.13.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:36:37 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	petr.pavlu@suse.com
Subject: Re: [PATCH] livepatch: Fix races between stack check and module load/unload
Date: Wed, 14 Oct 2026 22:36:25 +0200
Message-ID: <20261014203626.240985-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <as-R64i6eT-8FpJt@pathway.suse.cz>
References: <20261012140546.154730-1-parri.andrea@gmail.com> <alpine.LSU.2.21.2610141410370.16733@pobox.suse.cz> <as-R64i6eT-8FpJt@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Petr,

On Wed, Oct 14, 2026 at 04:30:03PM +0200, Petr Mladek wrote:
> I wonder if we could use some more strict locking for the two
> operations, e.g. (raw_)spin_lock. And then use
>
> 		if (!raw_spin_trylock(&klp_unpatch_object_lock))
> 			return -EBUSY;
>
> in klp_check_stack(). Plus take the lock in __klp_unpatch_object().

I like this.  With every change the stack check can see made under one
lock, it sees a consistent state, and the READ_ONCE()s and NULL checks
in v1 go away.

I don't think the lock can cover all of __klp_unpatch_object() though:
klp_unpatch_func() calls unregister_ftrace_function() and
ftrace_set_filter_ip(), which sleep.  So I'd take it in
klp_unpatch_func() only around the list_del()s, after the ftrace calls,
and free the ops after dropping it.  obj->patched would be cleared
under the lock as well, before the funcs are removed, so that the check
skips the object from then on.

> Hmm, we could not take the spin_lock around klp_patch_object()
> because it does allocations and might be running for a long time
> when there are many patches objects. But this might be avoided by the
> smp_store_release(&obj->patched, true) trick.

The store-release covers the objects of the transition patch, but
klp_find_ops() walks the global klp_ops list, and klp_patch_func() adds
to it when a module patched by any patch is loaded.  I'd take the lock
in klp_patch_func() just around the list_add()s, once the ops is
allocated and its func_stack set up, and around the list_del()s in the
error path.  That should be short enough.  obj->patched can then be set
under the lock too, after all the funcs are added, so the store-release
is not needed.

klp_find_ops() could then assert that klp_mutex or the new lock is held,
which also takes care of Peter's comment.

One more detail: klp_try_switch_task() reports -EBUSY as "is running",
so a failed trylock would want a different error code or message.

The trylock also fails when another CPU is checking a stack at the same
time, so concurrent checks are serialized and the loser retries the
task later.  The lock would only be held for the walk, not while saving
the stack trace, so I expect this to be fine, but it might slow down a
transition on a large machine.  Would that be acceptable?

If this matches what you had in mind, I'll send v2 along these lines.

Thanks,
  Andrea
