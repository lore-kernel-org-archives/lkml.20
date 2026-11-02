Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636175;
	b=la01aSR1t7UYOPtMvkiAoMKTiiS5zDNvm4ehlhpJNcjWB3+xnsdrnNseOafRujpIf965
	 nf5ZFpkWMTKywXEZT8d8C2lKFZjX755W8tUtGdTdO/8OPEy7YZal5VQzBnJViBB9krvt7
	 g3xNnGerDDs8HjDKK/TqUZ3+hS3vN/To2dSdPGNYm/MYaAsPWGB45aI9UYRwz/1dGTTeh
	 H0ECE7qBEbRNXjr+p3EQe84iAHllwZXpuFmKNynu+BW+pseFwlinkAn7mKGbGyYTdt/1T
	 oFBE1l02hB+XeiyVdMyZ1tTafsTsheVDxny/gQKnkdreAxbUkOcZ/WnKbT2eDDFWWQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ypRec8Xh5wIqvkQ4ITkAuTU3Yz1Vsg+897P5Sxky53s=;
	b=e3xG5T6J5o2ADASUDJw+SM5OhBuRSetOuQ2MyqTip2qiRP+wljLwecxSDbBMdN+EurYf
	 ICTe3u3/ixBl4b5J7kA+0AaRTqqUVBUdEYBDSvYyGg3m61d00QfDO9h0yyj5B9Rd4hnuQ
	 1e+tWaTNTo5+Jt0MYI7jdIzZOx4xe03nM/c8Me/UruvkWqrLLz9PtuarNUG+lKICivee5
	 IoEj9BmC+QMnrLIfaBFNCV1WjKhz3NOR0qU5VHqJh+AV7+TVmSxeSA/sIk8SMZDZz/RXd
	 H+MGr+rg6WEWnRhihlLvo1MWRTBGZ/fRmz+mGHtg2BPDNIWt2J6m1rO4Kr+tIpU/Qdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="cgehWPX/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BEA6082BC4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BEA6082BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cgehWPX/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso25316125e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793636173; x=1794240973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypRec8Xh5wIqvkQ4ITkAuTU3Yz1Vsg+897P5Sxky53s=;
        b=cgehWPX/0I2I7Bd8Uywop/KMe4ySqOEdVFTorvOlE9dsNtUAVEkuVBSWfnaX+WzniO
         22m/zZIJ5brtbMJhGtjiIAD4lxpl30x2/39jAknuhIeakhp1PwIy+kPKY0MMeiriSSQn
         QZlGetED3fMBXhFAgc+RSB1fC2kwQxRLNGA+LE1WVnjRV/2r65wOC2G4QWi9VTiCJXfK
         cF1VZJpK3DZjikEVbmlZeO1UWMYS3cbO6LlT2N5pTBtr9EhCMQqqGB+fkhwm6tmTWgjV
         YbiQueSZMxAg690AyYQKc5oNjZPqI8k7hT9peh1aUZbp3JwcwoZ2eTnCRfXhyasTXVLS
         kwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636173; x=1794240973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypRec8Xh5wIqvkQ4ITkAuTU3Yz1Vsg+897P5Sxky53s=;
        b=HAO15JIbKDxRtGQDT8APPwLqlx79ib5HtadrP9Mdod7X2JfgmaqrSS0zoyG6lyfqS5
         up6iJ9NQqxe4y85ONiZ95NTZgUDLA0qPe8kUZUU4rxm4FXMhiw7RA0JPNrvX3JNiZHu/
         qepEdXFcQ1GMbw+cKV0kAJrIUZjP3lJtLEeY5CsdpHOeipCd5CgM0E2BtOTohZ46l337
         7u3UfYQSt/jEAbb66p5fmDSLXvzD0ub0KF9oGl/DLEW/0cScg620AMWrDoeVeMSvhKGt
         qm3MG5k5uYgkm7VtyNBXIbqXHBhay5EKbQ/Oo3F9Ih727JCByUlVXXc+8ULbGxEtqlEo
         Jj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzHzBqWobiqENWl6gA0T3M2wtZisNLm38i3IIsuFlLY9BxrZdkPrw41qLgS90nTJmWjfMvlJ1YpVGQzQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNc2scGM8lz2RSfG7mI56VxAp64SuXCEo9exWdmZ/0tHziSDtX
	3A8aBWIL/0JXt2gEkYzRrjQRfiM/pO95P7bVA9Z0hdnMfAkERu/9/4zXDSx+yZVCORQ=
X-Gm-Gg: AYBFou230hDwo/Wa8PBAWpmHy1dHapbeJ9aGfoM1LBTYdbJzvDYfOTIbeBNfEkWsFhl
	rGYeJFn0kABN436bEI0MDaDJNOgg1lvd0roLnQnhysMAoaxPHmxttRqRnsC9QGhpnqz9zFQaEMa
	AEtJmanj9FySvBysFCX9GzYInnJIGDVHWm61ktfO+srT+sNESWxKKzUDeb2z7b9oaVeWp2QHczd
	0+MyVqWDv/bMHiLHwciLCd9QxubpdUt/abyArBShyfaCRYU3d0KBNNFK9k21h9tidh11hwd15f3
	5Gtw7vhq9m6/rTLvCx9+lLgw3XAEpHgewPxrAL/8qbQhJFBy9C+AYmveEZSr/LuUT4JV5pHqTLh
	JOKCD4oXEIEMDKzMYq0Lk0q+Ajgsj/SdpiqEHrBXgVOQfoJmREGdY+sn9a2nBrqV1TaM+SAa9w7
	iNCK82PiB3x4sm3TIF4xkyFd9Bqp9RRKRoTbjaMkl6i/J3WnCgMLx2BpD1/mQ3tz30q2O3N0XeO
	LN/Cs2+xnoAS+cD/7JIWtgsU5d13yYY4a3yACNX8+t/rE1wX+FD6Kk/ep/luBgeoZEJd5OkOcNu
	tOzi4SxBggjVFxSTQlQmfNLzFwcgCUj5VRk7OlU=
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr234675195e9.23.1793636173515;
        Mon, 02 Nov 2026 08:16:13 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm22666963f8f.44.2026.11.02.08.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:16:13 -0800 (PST)
Date: Mon, 2 Nov 2026 17:16:12 +0100
From: Michal Hocko <mhocko@suse.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>, Tejun Heo <tj@kernel.org>,
	Michal Koutny <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v7 0/5] mm/page_counter: move stock from mem_cgroup to
 page_counter
Message-ID: <aui3TJqadHUv-4RW@tiehlicka>
References: <auiBOBfRIiup8Aob@tiehlicka>
 <20261102152018.2773572-1-joshua.hahnjy@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102152018.2773572-1-joshua.hahnjy@gmail.com>

On Mon 02-11-26 07:20:17, Joshua Hahn wrote:
> On Mon, 2 Nov 2026 13:25:28 +0100 Michal Hocko <mhocko@suse.com> wrote:
> 
> > On Mon 26-10-26 08:59:37, Joshua Hahn wrote:
> > I guess I still do not understand what you mean by opting-in to the
> > caching.
> 
> Reading my original cover letter again, yeah. It does feel a bit strange
> to call it "opt-in"... I guess I just meant that not all page_coutners
> will be getting it, it would only really be the memory page_counter
> (and memsw page_counter for cgroup v2). I'll change the wording in the
> next version.

OK, that makes it clear to me now.

[...]
> > > > > We get an added benefit of simplifying try_charge_memcg(), which now
> > > > > has all the stock management handled transparently within the
> > > > > page_counter layer.
> > > > 
> > > > This is quite a large change and I believe it will be really benefitial
> > > > to have some high level design overview in the cover rather than trying to
> > > > chase it in respective patches.
> > > 
> > > Sounds good with me. I can add the call traces above which should
> > > explain my thought process a bit more. Hopefully the problem I am
> > > trying to solve is evident there.
> > 
> > I believe I follow where you are heading. I am not sure this is the
> > right path but that is a separate discussion. I would focus on whether
> > moving cache to the counter makes sense on its own (without that future
> > work) at this stage.
> 
> If I'm being honest, most of the generic benefits that exist beyond that
> work were in the other part of this series that I got rid of to scale
> down the scope of this version. But to explicitly name the generic
> benefits, it would be unbounded memcg stock caching per-cpu, eliminating
> random evictions, (like you mentioned above as well) limiting stocks
> to leaf memcgs only, etc.

limiting cache to leaf memcgs makes a lot of sense and addresses a big
concern I had. How exactly does this work?
 
> I think there was a proposal to make the number of memcg stocks per cpu
> even lower than it already is, because the author wanted to include
> additional fields into the stock that would make 7 no longer fit into
> a single cacheline. I feel like we are reaching some limits with that
> side as well, so the "unbounded" portion seems to be quite opportune.
> 
> But I believe those benefits that we would like to see are made better
> by this series, which makes the stocking transparent such that the new
> optimizations don't make the existing memcg charging code any more
> complex than it is. By abstracting away this mechanism, we can make sure
> that memcg just handles the logical charging semantics, and page_counter
> handles the implementation-level details of stock management.

Yes, these are all good arguments. Especially when clarified that this
leaf only feature. I have to say I was struggling to see how caching on
all levels of the hierarchy would work in practice.

> Personally I am a big fan of how try_charge_memcg looks after this
> series, what do you think? 
> 
> > Quite honestly I am still not convinced this move
> > is the right thing but I would like to fully understand the mechanics
> > first. Having discrepancies among different counters just sounds like a
> > potential source of future problems.
> 
> I hope that I can present a good argument for why this is not as
> concern as it may seem initially.
> 
> My first point is that the memory usage counters were always fuzzy, as
> specified in the memcg v1 documentation too: 
> 
> usage_in_bytes ... doesn't show 'exact' value of memory (and swap)
> usage, it's a fuzz value for efficient access.
> 
> Secondly, the raw value of the usage is actually always accurate. It is
> just the stock portion that overcharge the memory at times, making it
> seem like there is a discrepancy. Flushing the memcg stock immediately
> bring the counters to their real values (like what happens right now).
> 
> Finally, this is a change that is only limited to cgroup v1 users.

Right but is there any actual point in adding caching for memsw charges
now? If you have a way to opt-in to caching then you can simply disabled
that for memsw counter altogether. Fewer problems to deal with, explain
etc...

> This entire series actually has no effect at all on cgroup v2 users,
> which I think is a nice perk. Obviously I'm not out here trying to
> make cgroup v1 unusable, but I wonder if anyone is still using the
> legacy feature.
> 
> I hope this wasn't too much of a brain dump on you. Thanks for your
> feedback Michal. Please let me know if there is anything I can do to
> clarify my intent.
> 
> Would you prefer if we continud the discussion here, or if I sent out
> a new series with just the cover letter changed? (I don't anticipate
> any code changes, based on sashiko review or anything else that I see).

Let's just iron out things first.
-- 
Michal Hocko
SUSE Labs
