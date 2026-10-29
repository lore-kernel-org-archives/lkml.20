Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263315;
	b=3EgkZ6nRhJTZPQtr61CEwkkWinrN1O7aMULk5T6KU4EXN+5MK4HZ4cC1g9ruVKBPbGk4
	 9iHWY8WqRkiqGhDtvjuB+WE2gZJb5TnGtQxL18esMZDEco1urdbc1Jzx+c8GGqUeKb81h
	 bkvzDrkPe0Z9lCG6fqHLJ4L+URDnUFjxy6v/AOWo8Ei91qlPZw4C0wQjbNv0GoRF+2xvq
	 AodbDxWD3xmXNT9dPLVwEdQfS5fBNBKckw3TOoUcig9XItT7K411wicBMiQfOZfhpHHM0
	 +3z5zbY0oJ5jietrDPIb0k1DnpSgm3m/Z3WBCIQd0UyJcYPZhp19lVpJppXEQm4Q7ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ZnSPMKHjuy56tpoz3QPooFj1j2bL/rWj50qKdr1tVhI=;
	b=1zNhkqAcoKtMZcV1UsYD5HqIvA69dJ368Yh8kfFPr9TS742kz1KMBXa7G0NOtdJ2/+AG
	 XrODoMiy2vgRb+G8TmHsNDZqDyWk4Gju+vON9jc9mr8Q4iEmShXXCoavKbci5ZE2Aqy0M
	 DdkK2nStHI/CMDuat58PNHBIIIPrAS2+xsf60b6kPTAmUJV7bUdOdXPDonrwcblqwluQP
	 oFixsWL5axRsf+sYitwkfxHC0udir6oo4p81RvB9NRtn7mzPm5eHGSH5lcq7HgDB9kyYa
	 80rrjz/5NPDy4lexOLMG31ULTuwpXxuwEtFkGPM95slrYAjgL/JD8LfHF1RGGMghfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1sErkGg;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C5D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1sErkGg
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4aa3a2a5a15so1171865e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263314; x=1793868114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnSPMKHjuy56tpoz3QPooFj1j2bL/rWj50qKdr1tVhI=;
        b=R1sErkGgvoQTSYcNS8QAKHkKd05LNgpMwe0hBGsd4aZc9HnCxR94D7ITS9ZMfj0TJI
         HgdDh5rPSzBDYb2YXxQRi2UCJNEULGYyYw0ZIgz4VeKz/tJPOXYjnHvW4sZWvBfkJpbH
         2cytOSw8hSWUr0dEp/18d+hGWmqzxpqFIelaFcslW9vMlAW+K2XkQ6/6RRLvZh5oDk0R
         rMWQE2Ukbg+OS5ZsGQ8Z0PxKHWsFUwiP39rskJ6XBnUmvrwhWHEbN3wZGQs/VTne++B8
         lYo+r/WGNNWLTtGldnHwQ5Mct10E3vqpCsUM/lZR/h8demsmfViKhbaAyy7ya8hZtqUm
         NVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263314; x=1793868114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZnSPMKHjuy56tpoz3QPooFj1j2bL/rWj50qKdr1tVhI=;
        b=LszzEM9et32R4EukFKngPmnCf0cx/e1hEaglMl3GCM5Qo/RGtrbZ6F2AzyYBU/IH3q
         woj42WEyYzoH+LgtCTpuXOKEmJ7hL3j8kza/ZeEUqrAna2vMCWhinQ1XIfEJpyAYwZHy
         xGOfQJCjICPOQpK5/qsEghQHTqQAslWk1hPGB4pXCAq+KqMVrOElf7ztOK2ZdzKzhhcG
         LsQDWgh83lMMtzuW18C0NG0WFyz+xWub/E9p5mWnBiqbxgkAbPKD3W2wVxGfunNHHM5e
         PkVionXcATBZl2jAxeRn0ajAVz56IxxOF/6ki6dUQMRVuYL3RO1i8LXo4xvuqGP/RmjS
         E6SQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0ztmxEUck4d1WBYIZS9A3KIfv6awEmFjdRyWlDoyPKX4sTYNbRCmoSSec36nx8MTaUGKQGcOo6JYKGXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdYN1GoEogdJHdHhL+7wFq0c6eYEiZH3v4RFR/uHqun5jiLqJ6
	mm16j/ZxWwSwdrNA0tyB1GNaW59Xq7OiZVZzGlibA2Cm2BcPZ5hn5irS
X-Gm-Gg: AYBFou0XHHEvjdf+btIvwe7Y4xYv5+uD5t3dC0qQ5uXm1gDKk0HFMWc/7PszbUxZd4g
	562Yk6fe+9QNxUfdAltKUGN6NCdd2SlyF9ZnTkN7tHs2IEsCsJeSAF22pW9XNGS/4rZYPtb4uP0
	CKMmNv8F2Kz2nZEkfT+imnAl+x7ooqnql+nz1kJU2loFVuuzMNuzQSjEfppxh6qALi9NET1YUss
	84ncRS1/bNQAM5ElorelSIM3QWaMVGct472frkYkwkZRvt5yewtfcjQUJLztsGBM/ViNjJrOZIW
	+JwR7pZg6IJDQ8hiKQeH9deC8q/4CeqIXRQibTqdV4G39ezvIRA/NqrAfO7NbrwUhAQP4IK2q8E
	KkhoV6O2v//fXSwdvtGSTjiVmILejQYEOOopnXxiaupkclufzZNJw6qHhVEtASk3opKbDPTgr5H
	+r7lMT4dodsgz9nS8pPXzRSbUAeqCaNDKYbvFzxyWu8x9KgxiatxFDg/b9eQxysOHMOOf7inEHd
	j/uhJhXv+ggpxeXr9wf9B/K9SQXhiwB7s2nK3lamLvWV58zYPiE6M5rymDVstq/ZlOVnsQnugyb
	FBtJuNn5N7Zt463GeAWKpu/ieZIqqqn0Up2/GF8JAmai5PnscPbBsEqfvfkKK2QuWZkJr5W9uwe
	Rxg==
X-Received: by 2002:a05:600c:8b63:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4a96179c900mr105436375e9.0.1793263313575;
        Thu, 29 Oct 2026 01:41:53 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8e0sm32159179f8f.29.2026.10.29.01.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:41:53 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:41:50 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Qing Wang <wangqing7171@gmail.com>
Cc: bsegall@google.com, davichazbh@gmail.com, dietmar.eggemann@arm.com, 
	juri.lelli@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, 
	tim.c.chen@linux.intel.com, vincent.guittot@linaro.org, vschneid@redhat.com, 
	yu.c.chen@intel.com
Subject: Re: [PATCH v3] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
Message-ID: <auL5Yok7oZrX79GG@scheduler.schedules>
References: <auGzaT-RjHdctV60@scheduler.schedules>
 <20261029073017.2464877-1-wangqing7171@gmail.com>
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
In-Reply-To: <20261029073017.2464877-1-wangqing7171@gmail.com>

Hi Qing,

On Thu, Oct 29, 2026 at 03:30:17PM +0800, Qing Wang wrote:
> On Wed, 28 Oct 2026 at 17:01, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > On Wed, Oct 28, 2026 at 11:44:49AM +0800, Qing Wang wrote:
> > > The current NI_RANDOM implementation uses a random dice roll to allow
> > > newidle_balance attempts according to the success rate. There is a better
> > > way to implement it.
> > > 
> > > Replace the random dice with a Bresenham accumulator that distributes the
> > > allowed attempts uniformly across a 1024-step window:
> > > 
> > > Each step does the following:
> > >   - Accumulate (1 + newidle_ratio) into newidle_window_pos.
> > >   - If the accumulator reaches 1024, allow the balance attempt and
> > >     subtract 1024.
> > > 
> > > This guarantees exactly (1 + newidle_ratio) newidle_balance operations per
> > > 1024 steps, uniformly spaced for any ratio in [0, 1023].
> > 
> > I still quite don't understand why we need this. If there's not a gain,
> > the old code is simpler. I'm not against this but still I'm just asking.
> > Changelog just says "better way to implement it" but doesn't say why
> > it is better.
> 
> Sorry for not explaining this clearly in the changelog. My reasoning is:
> 
> 1. It is deterministic and reproducible. For a given ratio, the
>    balance frequency is exact and not subject to random variance,
>    which makes the behavior predictable when debugging or tracing.
> 
> 2. The attempts are evenly spaced, without bursts. With Bresenham the
>    interval between two balance attempts is uniform, whereas with the
>    random dice the number of skipped attempts follows a geometric
>    distribution: at low ratios we may go for a long stretch without
>    balancing, or balance several times in a row.

But there are no numbers showing whether the bursts have any effect or
not.

>
> Also, looking through the scheduler code, I found very few places that
> rely on random-number-based probabilistic decisions like this. IMHO
> that approach is not a great fit for a kernel mechanism where
> predictability matters. Using a window and spreading a fixed number of
> allowed attempts evenly within it seems more reasonable to me.
> 
> I'll put this rationale into the changelog in the next version.
> 
> > Why do we need to make this 0? We need
> > 512 calls for this to happen. But for balance to run we need
> > newidle_window_pos to be 1024.
> > 
> > So, we reset newidle_window_pos per 512 calls but we need it to be 1024
> > in order for balance to work When weight is 1, the newidle balance just
> > doesn't run.
> > 
> > Or am I missing something :-)?
> 
> You're right, this is a bug. I wrongly assumed that newidle_ratio is
> updated once every 1024 calls, so I reset newidle_window_pos in the
> update path. Since newidle_call is halved after each update, the update
> actually happens every 512 calls, and the reset discards the
> accumulated value before it can reach 1024.
> 
> The reset isn't needed at all. newidle_window_pos always stays within
> [0, 1024), since weight <= 1024 and we subtract 1024 whenever it
> reaches the threshold, so the residue can simply carry over across
> ratio updates. Dropping the reset fixes the issue. I'll send a v4 with
> it removed.
> --
> Best regards,
> Qing

IMO, I'd like to keep the current code if there are no numbers.
It isn’t worth it.

The test results of Prateek on this version don't reflect v4,
since they were taken with this bug.

BTW, this patch removes sched_rng() which breaks the build on Linus's
tree and tip:

kernel/sched/fair.c:8663:55: error: implicit declaration of function ‘sched_rng’ [-Wimplicit-function-declaration]

Thanks,

Kayra :-)
