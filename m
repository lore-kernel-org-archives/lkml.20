Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652522;
	b=nUH56buWhdmcn/znjbKTOwnSERuyUHcf+zGYEcGJJE9nLg5Eisic3AvKxIIqyODJhMkc
	 Ha0NZWQQdEPuh+BWUZZtBljO/sCCoIW6IAnNrmLQjQVAM0l56AeCKypA1aA6mOumRmzio
	 h5jWqkN0Vdy8uXPigqoPtfZr0P4SfgakwRizOMuZrmJdgczRDbPw27gxaGoaFDMOTFfEO
	 VWmrThAlc/z9eGYmay454TyBZR0bwqi8OM4Kh0I3ukqsJ3tx9LAhbNrHO4hviMCdEru2p
	 MWpHgRzjV+lq2csHQDEm9j8U7YVlMxB8abHd8Xj98Pht9fgBAaHWeQgarwQlmGxlNGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Tqk8hLSfa24lrMQkcg/49BjZeHEkNKhCmyNnUdkMSKA=;
	b=jAchVN42p/wKwQ52mZna2ran1TJpsb9SluByhyV4G4qkhcFfYvK/bwWNijGdzSk4quG2
	 RGsXjwk3eu4MRqV+PAD5dVfJkk6S0ONeuFRdLRWx4i/B5Bb68xDggJ6ZjJb2HmA4mt2E/
	 Bx9EF4XZu2CZgHK0xZHqxrj3wQZZCbIApy3pcZ074fojPjOpROyLryH07lFbmi+HCQjro
	 DOIIcmGZXQzukenZZS9g5P0i/alPqY+PO9IRTNc8nDJQAuQuMP2GXH3vZ2Jdc667lI1jx
	 RGluv79dda9DI3hqafFPJ28w3O2XV7aa98OYkBWF4DjjhIj1t2TJdGe0jWENCp6RHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Jmv0Fc5/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD7606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EDD7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Jmv0Fc5/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so3317090f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793652520; x=1794257320; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tqk8hLSfa24lrMQkcg/49BjZeHEkNKhCmyNnUdkMSKA=;
        b=Jmv0Fc5/nYljQwlrG6yZXHbmK/vOygjMgH9V+ln0loEIT4Mj9avnQAT/Tp2Vjx0Yxf
         mC6bHTNlyXApzspb4edfjQ8jfA4fVnDyEDObcW1s3f9uFnPxqZvBAGMWDbhPMrRJrdJB
         DKO6VuBGo8URIw722ulFAEd+Tb25uRngvoeGuc/c8VzWzB1KSEGrKy6kl9u4TWtN0XHw
         wWLRNoAGvC/MZy+HdKh0r/HEluDJe9WySLhESDlUfb+CPRTTplh0t616k5f767guUtGl
         0SMoZ/9/6anudRuc1ktioORbXsKy/bZfEg8l708Uml0eAAyjVyC54mhI22iO3c8ZwLBy
         AVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652520; x=1794257320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tqk8hLSfa24lrMQkcg/49BjZeHEkNKhCmyNnUdkMSKA=;
        b=zl5DBR6FnMW2sNrl+wdwzwii967XNS4j84C3xfeXsYRuNk27hEpAs7WWObbEI8SQ+8
         /IphiemyWBbdWSJa1/jE+sIGW2J/wPzsgoc2tT7JbiDmkw7dlIyuEHxbfi5vvRM49zjo
         9dSWhgP1K6tNwW/ZjNGvV0tBlugt1LmdlLGt//BCdiqciSvlXUwt3R6Fngl0lAjnMbhI
         sZKwQtcShEiQk3RFlf+NLzMYvrFz2Yuhj2pw//ZVkKpSMTX98qCe4McNwgci0iXBnp+s
         cHs3b4q5OO8bfRJh7fzJOyMRECnTX969OT9LYngdXjeYP08SrGaBC8YwULKECxV6K/FP
         TYyg==
X-Forwarded-Encrypted: i=1; AKwUvBydt8izStqKtfEBYK6jv29PbhnjWCqVdr7zPfwYuT1JiVTsKBEYPW/eq8YVyYlwS68TNo8lfwpVCcNVGXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FxsNNJ59/adtjbOv78IB83RjXkS59n6ApVJvr2udrOorG+xlH
	TF1hnLjK3c9ZrPu83ayWuOQw0NtdMIDvvmvhGBJ7iBEC7GAwqF0fHvzQu5yNPZz7zdw=
X-Gm-Gg: AYBFou0nXK0vHUV0Lk4uiDrqJsPxyJCuLAgLPtTB9lCxxFoFGf9JntompjojYe/umjg
	gDK+eGzh6o17nB/lvEb7foNjry6epiStRwj3WCm+N4md/pTIUIpr2prb+22COwM3/b64pv0cMwP
	N9BmX4XjvXpFlDUUZwGPLPP7aCW9cGavkGHndxS96mbDkmBQaWd8tLa2V5qu8q1sk8JKQofIJZN
	16TOS1vlTFWHHyDx1s8NXVvVhMKYkLJvc0VkD2coOOywysAFeuvfttyyT9jd0UT5WE5BkJqOYtT
	R/+VsOvSvmiUxpLt5boE31rixNoNcZOK4CCla5wl+66l9SZgM1mAx2xCKC4ekPbdhz9Su4NTEX4
	p58jturyK+ddWiD+0rePdUyZa4/IP4sP+ZVZhh5ZcSt9mJvK6pemjRVZSYST6KTDfswmBWcL4vK
	0pLE0RYD3tWPEvsC2YeZO1eedH6mVMNFuDBgaYAAjCJaGTXqle1FnPHpDk3tBs8+UxyNLY54h1o
	09ZLZ1W5kjugZig6vbzw0z4tMZeLJ0xRgkID9bCg4WPpifVxdIvZCVjvXFDd0kK304hxKGGd8oJ
	dgQ3665E2obZiXEqfkuBwIjwJWZmXvN1pA619P4=
X-Received: by 2002:a05:6000:2889:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-48e6e2e769amr23073454f8f.11.1793652520570;
        Mon, 02 Nov 2026 12:48:40 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm22252091f8f.35.2026.11.02.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:48:40 -0800 (PST)
Date: Mon, 2 Nov 2026 21:48:39 +0100
From: Michal Hocko <mhocko@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Tao Cui <cui.tao@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>, muchun.song@linux.dev,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
Subject: Re: [RFC PATCH 0/3] mm, memcg: isolate deprecated v1 state from
 struct mem_cgroup
Message-ID: <auj3JyE47UjKa3ek@tiehlicka>
References: <b36ab4a7-b692-49e8-92b5-1dc4d76dee00@linux.dev>
 <0BEF7489-16EC-44EE-847B-A6AA380BE11F@linux.dev>
 <32e80536-64e4-4ae3-a7da-4a37ed415f0a@linux.dev>
 <7ia41p9341lv.fsf@castle.c.googlers.com>
 <aujhaEfimB0S5Msu@cmpxchg.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aujhaEfimB0S5Msu@cmpxchg.org>

On Mon 02-11-26 14:15:52, Johannes Weiner wrote:
> On Mon, Nov 02, 2026 at 04:52:44PM +0000, Roman Gushchin wrote:
> > Tao Cui <cui.tao@linux.dev> writes:
> > 
> > > Hi Roman,
> > >
> > > 在 2026/10/30 14:05, Roman Gushchin 写道:
> > >> I believe we want to delete this code sooner than later, why would we rewrite it before that?
> > >> 
> > >
> > > My assumption was that v1 would still be maintained for some time
> > > before its eventual removal, and the goal was to reduce the coupling
> > > between the remaining v1 code and the shared core structures during
> > > that period, rather than to rewrite the implementation for its own
> > > sake.
> > 
> > I understand. But personally I don't see big issues with the current
> > code caused by the v1 stuff. Maybe I miss something...
> > 
> > The proposed changes on the other hand create difficulties for those
> > who use v1 and maintain some local changes or simple backport upstream
> > fixes. Of course, it's not a reason to not change the upstream code if
> > it's justified, but in this case I'm hardly convinced.
> > 
> > > If the expectation is that the remaining v1 implementation will be
> > > removed in the near future, then I agree this work becomes much harder
> > > to justify.
> > >
> > > Am I being too optimistic about how long the remaining v1 code is
> > > expected to stay around?
> > 
> > Well, Idk, it was considered deprecated for quite some time already,
> > so maybe announcing that it will be deleted in a year is reasonable?
> 
> That might be tougher for v1 users than the member placement :-)
> 
> My understanding is that there are still a few heavy v1 users out
> there. I'm not sure they can move within that timeframe. Personally I
> think the cost of the v1 code now is kind of negligible now?

Fully agreed. 
-- 
Michal Hocko
SUSE Labs
