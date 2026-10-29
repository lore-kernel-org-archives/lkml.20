Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265507;
	b=ssT/5IfhyLc/ciGStQ2oPhFey13vJ7gvazrdAldCwUMce/tfGOP7q0IO2HRVQQkIPfYG
	 ylyQBqdqKm9RNQp/xwxL2WXrUCn+S9jteZSWiQEHWEX8noXxyGO9E+2Cd1wRq45UQxZaz
	 MWJbkrSCXini6K1YekbooCHxEg7wELCVPKJXQ5To6OM1S4iErHj9gmfJQ5v1wYsjcORzU
	 F04DRVjaZ2oztl1Y4BgD/1xXSeVuF6bz6nHSHq3LVaWr9tQmIy9wjnASRfgCKtFmI90m8
	 HdDmOcvso/FBhjijI7PVzL3BytJWgwDYHUFNPO31q1dr4VZKY6XjMxTkHvEBmLxjipA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265507;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UkwRg2MfCoRtAJI2sGxhVQjo2bap0vqxQXUt68TRs8o=;
	b=RnlV19S2GH7D9ceJh8Vrc6UCre4xit16w4IdwOGJb8HWyWYKDBhSR9UhHYlmZPsyy6yE
	 owYMcIt5v0SdE6Tq+d9uEBrhxPogqvHrBhiZqmb63HtQYvp3Fzl96Wbf9nPEQdmb45HBR
	 +Znisww5F9iG98WUc3MrgzUjxYFJ2IhfkgUHKkqaYTJb5m6wOlDHziLJw2goZKOEv4YXv
	 llhYz25AiewB95OqE9sJ8zZyEDTk0LISknjzXyaLw3t4tz5BBYRsoROjFd7higR7iF9Hs
	 5CgVhFh522GrbVxOe4MOfe3NYh9lobiBvsp0xjPk+YURS54xEmNN9vCPDoRCOss6ijw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPG5loz0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA469606A31F;
	Thu, 29 Oct 2026 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPG5loz0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54F61F01825;
	Thu, 29 Oct 2026 09:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793265506;
	bh=UkwRg2MfCoRtAJI2sGxhVQjo2bap0vqxQXUt68TRs8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPG5loz0OzzMkDVWR0/RpNMb53o+NMDQ8VSEFjfepQzfcPpperDYBZwPoNNeNuXO+
	 FkRxqWgqe4eYfxS1nYOjB6wQZ/xqbDR+H5e0gXKGrgldBgH4Gmm0OaX81ATkpADRSi
	 TGzIeIazP00gQWOV30Urwq0V5NhUxJrj5dv7qfWC/woUpG/I4RVC7f4FuNgsLcb+c9
	 rOG3r4VVE2tMYRR1aWjgT1wIyKxaF6r3JHRqW/rgCpeVnw/LprE4s6KHUJh4D+YwlZ
	 Eaz30jiCbbmNhI3jaGaef4jqEDApfzBH3O2P/uV4L7REpM6bmmfTT5GthHZY7vWaS6
	 Y/pOavIuBOLAg==
Date: Thu, 29 Oct 2026 09:18:20 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Pedro Falcato <pfalcato@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-ID: <auMHSGBR6SB6HcTZ@gremlin>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
 <atYJA7nIu_RwpoCC@gremlin>
 <auIIxSorX0bhZNZc@gremlin>
 <auIPRjj2t0BcYlOa@pedro-suse.tail5790ac.ts.net>
 <CAJuCfpFVv-t08YGMPR3YHCyiOK4HY-YjMk5rB6tdBa=mq2MvKQ@mail.gmail.com>
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
In-Reply-To: <CAJuCfpFVv-t08YGMPR3YHCyiOK4HY-YjMk5rB6tdBa=mq2MvKQ@mail.gmail.com>

On Wed, Oct 28, 2026 at 05:34:38PM -0700, Suren Baghdasaryan wrote:
> Sorry for missing this fix before (due to my vacation) and only now

Never apologise for taking a holiday ;)

> finding it. From a quick look it seems correct but I'll spend some
> more time reviewing and testing it.
> Thanks Lorenzo for the fix! I completely overlooked this overflow
> side-effect. And thanks to Liam for flagging it!

No worries, though it has already been merged -> Linus's tree (lol). Obviously
if you find anything of concern we can chase up!

The general idea is simple, really - though there's nuances with the memory
barriers (ugh).

First off, it turns out we don't have to use UINT_MAX when initialising a
VMA, since commit e5e7fb278e59 ("mm: convert mm_lock_seq to a proper
seqcount"), as 0 works just as well (it's not observed since VMA is
detached at that point).

Then we can simply detect when there's about to be an overflow, and zero
every VMA's write seqcount.

This is done without VMA write lock and with potential concurrent
readers. Which is fine, since the write locks are about to be unlocked
anyway, so any write-locked VMAs can either be encountered as write-locked
or not-write-locked safely.

0 is even, so that marks everything as unlocked. However, to avoid read
locks spuriously failing due to vma->vm_lock_seq == mm->mm_lock_seq, that
check is updated to also test whether the seqlock is odd (write-locked), if
not it allows a read-lock.

Since the 'reset' doesn't acquire VMA write lock (not required and not
really meaningful in the context), nor does it block read locks, it causes
no interruptions on that side.

And, as per the numbers I got the LLM to obtain that I shared with Pedro,
there's no meaningful latency when this happens, which for most workloads
takes ~days/weeks to achieve.

For backports, which lack my anon pgoff stuff, I will simply make the
fields 64-bit which make it practically impossible to hit the issue.

Let me know if you have any questions/concerns, thanks!

-- Cheers, Lorenzo
