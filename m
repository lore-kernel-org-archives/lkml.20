Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEDE35C19B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711661; cv=none; b=adz+Lvcwsc5fUN6PQ8XHdWHEMoZYTjO11D7lWT1W6LdUhQXifmhXtfIxjJOQt+94CVv85iwdA1vMWUKxnnp8I1HU6P8SddSa3e+lLtswTa2mw5qcCUhONgSnh4wx7QlBqNheXtbwoHYpC8qvYGEkWc7LdOyIzDKcqCxeEvtiQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711661; c=relaxed/simple;
	bh=DBlcgdV12MrjOqJmyxMQxjIysQak3VNvwrHTp2FPuAQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IENUSNtS5VEnUJf8NGRrPbbzEFqe/h3MHkf6S2t8BEpjysVGKFoR8qTutUZC5FpVfCGK4gzX5z5WhVAI/q08RcNNHOcRZi8/3diQNra0ZBGvpv9IfNqcR44/vcUu5BW9zvRzz4S4SIkPsz/IhRj5vJ7dDQvYuyOtjaRqqoJQPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEv/Dx31; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEv/Dx31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B401F000FF;
	Tue, 29 Sep 2026 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711660;
	bh=IQufTsUR7e7tQBmxEeN3J3HOKv9zUKtswGADCPXNGvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZEv/Dx315tkZaA/W+LpHV/XuJLo/A3jk8c+vjw4TZFMGdYpBZN8skFrzJzz6R1CVk
	 xqmSRIFfdqW4lEcxg2ffc4DZ631QjiIe+tnMviG4+zRlsE5IiZ+u5SrEKzgqDLk4bG
	 UXmJ3ZpSh8SYq4XubIWACKOBLypTOI0Q2MBIP+Ah/UKSXJY8mDdjriLNEFozVBZcY9
	 bzygBag4gFD5iqLxPr4feseRJjZXydKI1EQGEBIRVYyHtnbJuS4O6257vAlsYoGXQ7
	 JI9dLW8vFoP16X0QnXS+qftA0MF66YDJbajp+YaURdU5yEotw2Waj34idxrCOhSy53
	 +BzqrLTqOeWAQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Chaohai Chen <wdhh6@aliyun.com>, jstultz@google.com, sboyd@kernel.org,
 mlichvar@redhat.com, linux-kernel@vger.kernel.org
Cc: Chaohai Chen <wdhh6@aliyun.com>
Subject: Re: [PATCH] clocksource: Require consecutive frequency skew samples
 before demotion
In-Reply-To: <20260908111017.3277404-1-wdhh6@aliyun.com>
References: <20260908111017.3277404-1-wdhh6@aliyun.com>
Date: Tue, 29 Sep 2026 21:54:14 +0200
Message-ID: <87ik3nj0k9.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 08 2026 at 19:10, Chaohai Chen wrote:
> The clocksource watchdog marks a clocksource unstable as soon as a single
> frequency comparison against the watchdog clocksource exceeds the allowed
> skew:
>
> 	if (abs(wd_delta - cs_delta) < (max_delta >> ppm_shift) + wd_seq)
> 		return true;
> 	watchdog_data.result = WD_FREQ_SKEWED;
>
> While the readout window is already protected against transient
> disturbances (SMIs, NMIs, long IRQs, vCPU preemption) via the
> WATCHDOG_READOUT_MAX_NS check and WATCHDOG_FREQ_RETRIES, the frequency
> skew decision itself has no hysteresis: a single outlier sample is enough
> to demote the clocksource. This demotion is irreversible at runtime -
> the rating is cleared to 0, CLOCK_SOURCE_VALID_FOR_HRES is dropped, and on
> x86 the one-shot tsc_unstable latch prevents any recovery.
>
> A single skew sample can be produced by a transient glitch of the
> watchdog clocksource itself (HPET/PMTMR are not immune to hiccups or
> errata) rather than by an actual defect of the watched clocksource.

Which systems expose such issues in the real world?

> The threshold defaults to 3 and is tunable via the
> clocksource.wd_freq_skew_confirm module parameter (also usable on the
> kernel command line and writable at runtime through
> /sys/module/clocksource/parameters/wd_freq_skew_confirm), clamped to

No. We just got rid of all related knobs and we are not adding new ones
which are never used and not understandable at all.

Thanks,

        tglx
