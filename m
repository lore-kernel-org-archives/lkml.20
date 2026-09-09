Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583E3C1411
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982751; cv=none; b=Zt3UM021RsUXjmcexuubyUAIcLRZuUXFrldNnPGsBy5+IiSvLx7kep6RRuh3dTd3h+AMX5I9pvAmv9eA9gLEtm+nr4RPRCwg8zIa3VAAUse0lNtcax/lEyQvYN/49Tb59pAMjhj+fen/rRDwkkuY+Y+doAadKapzhzT6mqiB7hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982751; c=relaxed/simple;
	bh=9Rm+tBgNVRjYobl03pLy+QZc8ejHkh/KaIaKlECpzjE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tIVKQ/exiHaAnDPWlXwJxi2OG86n850XxQVsO9j1YuBGCFbsngUNKxyFdxsn82bbiCQC3c+4IpUNemHUjiwBoLzCy6HeJyzsf0RO/GlR92Ohy9WusZZvzbOhhOAchiCO8yHpOcoIYMnx/BCYK+QBRfVL9ljyqpdnIeTtIejorl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Wqc3o6sV; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Wqc3o6sV"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5306c3ed04eso15752791cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1788982747; x=1789587547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GUgXHgHoEl56pUUuNlJgXsrmqq8UKwhkWovOGCgHHU=;
        b=Wqc3o6sVJaV6tlhBxFS5tIYySDkREgBIDorYA/VwP01U90VqLHv1+lEtANetdwPO5c
         a9pV4HAZ3KmC8TEWW+Zws+XckX8fO4DAYaDcS5AWn3tc9XOHSblhEnDy5YcTngkSkJo0
         zdpgvSqG6xZ2wpdabS/GGzUIV375g5nXMkjYP4ocFjyZqKokqwKfA0WpETrkvm3dA6R6
         HC8J0fQfshR1DfbJYdR8pvmzAEiM+kiaw9XRiSYkg+6ZAmEf9izLZHTR6xaVOEw+iwSw
         xjcv3tVlEMuiejY2StHlmTACgHlnQCVhMJ1HDg3qtyU6PITPNYYH74oxGoXsMxx4l80T
         m0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982747; x=1789587547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GUgXHgHoEl56pUUuNlJgXsrmqq8UKwhkWovOGCgHHU=;
        b=qwiV0jTSGyEfxGMdT5EfpxtuBBZrL3a3bSa57TP5RXloCSTDhTG0jEwJkExissFUUA
         tgdiliMMxCA0QORvrkUGnlf1rn0KuKkOeNbx6C/6GxR2qXfX8ygYmTjVC6K9HZu3yHHU
         QnsWYX3Ck7sTqSvurDm80g31qzrgVjyedNM/jhMOFXNpVrIOqa4TKvBSzFRRdZhbRSCM
         G4dPMx+vA2ocSE987ESzgImbXlnZ9j5mEcvzRz7J3A3WqqIjg4arVi77mpZugOcXvlfl
         g1H3oAWdq96EA2IOyzjZwmt6UJe5CCO8oAosX/9/2WOGjjRDVDje4TUDafVFkAsVyp0n
         9f7w==
X-Forwarded-Encrypted: i=1; AKwUvBzZ7WQkEcuaJ03xXJOydRQmKkbbZWJ6xItjGwSwKzMP5Xmx0/PqF6tcpDvvcouyEK6raraiuWAnPyI0KjM=@vger.kernel.org
X-Gm-Message-State: AFuF++lrpxRrNorbz/loylNlGCYx2SbKnNAtxYEYreRqT7kImN32GfBD
	4LT2UijLzIBJboRDwW+NZZ6L7/aC6jb58agsvLuaHnNxqd0WBzuD6RrlKQlz4kS16DQ=
X-Gm-Gg: AYBFou279jLKE+3vcRfg0Rt9O4j5xEVcqP+Nxvjg57NxwMoe/xrZ14OMfEopBh3aZH7
	NW1ox1j4fBTdSHK5ogsMhewPzNc6ssMqwgCowucOaX7ZX6gtbHNJn9+zMuc2S5SF6UReBJF9WG5
	Joq3ClB0JDla9ytF0hgxQJcB7XsVMAdXBcJ/Mb2xMWdQqMw5k1ivpdrRkPe3lgj0+74+NlpKBYA
	KKRrXgs9FoiF6BRHTPHLovEmLZdqkobdKLsvnb/nA9SFVTNJnKNu6p6D/2/tYFVxPDWo8WLbAkK
	kXhpJGT7UKX4sTsUV40yc4ahrj3irLNCxTHM5iT6KM4YM0NRR0sFLYlPgulbxL39QTdBDlI1S/g
	1Wvrx/t2t3ULYKhaGYxRD5jpgjOKl49A2++piGPpLSxh1mdybFRVNfPNNbZU8l90qB5eoIVno73
	EV7AO5oP/QR6iKSM3e9xOthbP/NTi0cjq4NEam9KCV+gIMm+GgG/8ZX6DvQ+q2Av7N8Sxnam9ku
	/jjlrxt6AH0bRBjUpMWZWMTKgTvwHCJGeUtJ1qsm5GrdgHT8miOIack9fL3j+VcUxU=
X-Received: by 2002:a05:622a:1247:b0:52f:f472:bad1 with SMTP id d75a77b69052e-530549f9b59mr430060511cf.33.1788982747305;
        Wed, 09 Sep 2026 12:39:07 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541c94ddsm151964851cf.23.2026.09.09.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:39:06 -0700 (PDT)
Date: Wed, 09 Sep 2026 19:38:20 +0000
Message-ID: <20260909193820.9aac7888ba9d@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>, Dennis Zhou <dennis@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] writeback: report a Tasks-RCU quiescent state per cgwb drain pass
In-Reply-To: <aqGilhgcEd0qaHjI@slm.duckdns.org>
References: <20260909-cgwb-tasks-rcu-qs-v1-1-967a7754771f@toxicpanda.com> <aqGilhgcEd0qaHjI@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2026 at 08:16:54AM -1000, Tejun Heo wrote:
> On Wed, Sep 09, 2026 at 06:01:07PM +0000, Josef Bacik wrote:
> > +		do {
> > +			cond_resched_tasks_rcu_qs();
> > +		} while (cleanup_offline_cgwb(wb));
> 
> The patch looks fine but this overall seems fragile. cond_resched() was
> already marking "stuff that can take too long" but we need to use
> cond_resched_tasks_rcu_qs() if it can take *really* long. There gotta be a
> way to make this more maintainable. If always doing tasks_rcu_qs from
> cond_resched() is too expensive, can it be be gated behind something cheaper
> e.g. some tick based test?

Yeah I agree, it is fragile.  Every long running loop in the kernel that
only does cond_resched() is a potential multi-minute synchronize_rcu_tasks()
stall now that cond_resched() is a no-op on the preemption models most
people actually run, and playing whack-a-mole with
cond_resched_tasks_rcu_qs() at each site as we trip over them isn't a great
long term answer.

I'm working on something more general so we don't have to sprinkle
cond_resched_tasks_rcu_qs() everywhere, but I expect it to be controversial
and it's going to take a while to shake out.  In the meantime these are real
bugs that are taking machines down today, so I'd like to get the targeted
fixes in and to stable while the broader discussion happens separately.

Thanks,

Josef
