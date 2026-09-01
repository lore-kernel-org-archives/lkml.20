Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C08243B6CB;
	Tue,  1 Sep 2026 13:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270231; cv=none; b=rTpmmgFJKBiyDOa9uTRKpEZ4mk2d/d/7zCWau50XU4x/oq7Am4YGBpgcBYi2WU952nw1TSo6zFxgxuhH66sBM4n5L2xwQUt7gnyG6POdREoE4qEjy7trgRiaAUsS5NTnKfs4xqZ99NYGrIUzCpGlDFT3b3fKuBY+V/pFPRT8z2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270231; c=relaxed/simple;
	bh=LEoW5De6xHLsSe/uCIq6HrCWbNSoaNSoSpqWQUgw9GM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tbwyD2rz69fbP4jFa3ldVeq7xogrekrVcZm/7rzeGJX7VyOu10Q0PPU46kdL9PJwnalNTTWcw+dghlXzkBqZMLUejQ5sNcCq+bFWCfh3saX17DlYkbIWlFX/VGOdhL/6StaOf7vDNN1fS0TXRO+KTE3+3q+swTPvlqqwRXEOCrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BByjt9G6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BByjt9G6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8290A1F000E9;
	Tue,  1 Sep 2026 13:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788270230;
	bh=jqd0CX0Nkl+CnHnFS7gfwjuxBHVYyqRS+bksVWYn0mo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BByjt9G6LpgIqg6FR6UTXIy95Cm0JnoU/sUSSZq9MfrPzuUSYUoPzUiMtQpX8H5kq
	 TERs8pL80h5DlHewsL0EQ0YVHmFnDIU5KywLVS2iY2RQAQSM2lDpUwEm1OjQd3NlUU
	 k42NlGAGTQn6XcpKlgpWGz9gMjibfEDxp/n1VwlHzQSfcM6hocCYZa+yFwLmvFOD9g
	 PIDBIOf6qyE91IQ3OPNNpDzamvm5TVnjsNRJ5c9ZcjbUsWgqxvnhFhrj7/DqCEOHiB
	 MRvk1Gu1HY/lCbQYG5YryLsSkpjLd9wSWJv/8HTL6A8UUXH+UnYgkm9+bnBVlCG8EQ
	 3GKYGMcbQyYAw==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apV2iSFXlc3XY7Wk@tardis.local>
References: <apBrZuxU8bmCgG8h@tardis.local> <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local> <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13> <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local> <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local> <87jyp6d2ut.ffs@fw13>
 <apV2iSFXlc3XY7Wk@tardis.local>
Date: Tue, 01 Sep 2026 15:43:47 +0200
Message-ID: <87tso9axyk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

> On Mon, Aug 31, 2026 at 12:02:50PM +0200, Thomas Gleixner wrote:
> Right, that's why I thought fully revert on commit e901c1510e24 might
> not be needed.

It's gone already and as I told you before the reason is that the issues
were not restricted to the ordering parts v.s. count/hardware and the
fallout in the softirq code. The whole issue with nested unlock/lock
inside a guard are not solved by reordering local_interrupt_disable().
Not to talk about the lack of proper debug features for it.

> And if PREEMPT_COUNT_IRQFLAGS=y is the future (i.e. it'll be always y),
> then we will likely have local_interrupt_{en,dis}able() (or a different
> name) as a general API for everyone. So the API (and its semantics) is
> not Rust-specific considering the future direction. Hence previously I
> said that we can move them to Rust only but seems a bit unnecessary to
> me.

No. We need a proper strategy to pull that off and not exposing the
functionality and the name right now outside of Rust makes that way
simpler. Changing Rust is one thing, chasing down a pile of random use
cases which crept in _before_ the design and strategy is settled is a
completely different story.

Thanks,

        tglx
