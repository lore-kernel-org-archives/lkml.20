Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259027;
	b=DvgQ5g9JWIrkUlmBJYeMHSjj8PIrmuILfPeqfrY73us4PMhOt8Sfu87DsrvK0WN2iFGu
	 veN+d3ST4WDLBCq2lqeJFV7v743crgkeNHZ94tQJWBWICKFxH0H8XlpU3VikpXR9leQWA
	 ejatbUu1bRouX0AjxQMdV7haPAIUlxnVfPBmRWgd1IITx0AFFi4qNLaZLhZUuFmYLhIxW
	 pxmN28r/6C0v8mOvZs5lQ64aK+/OIMsca+Ih2/nj0T2xmSofagp/8UO8+OKwLUeF1OlRw
	 D4MhzBvHvnAQucIlL659igoeJIifEFqe2xq62cjWqLH5oKArzyYZAyYoo1vLW09kG3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wv/hhLPWhmY3X0g7zF73HBjVxwILbM4aXNmpTd5ryb4=;
	b=Pff8f1VDPmTtQSrUm55ml92wDj182bAFEnxI8X8raiLZt4/tUCE6i+uR+1QKgpzpXsZ0
	 l4/IgC92UYh+Am5zClJ4upmbWuifLEGnoajk6YqCl5GD5Rjzmx7g8pvMz/RXZ/pVzhAn2
	 gckg6i/7C9oKnakCGtW5Qu+L9pJ0ciOYfHA59FTL0dT7hGVIjnaedltxQ0Nkw45I/Ttg/
	 1vuzdOp7xpYvv4hs+e48q6vC0tHbtmP95zsdho5tvulqDNQ5BWIdv2vUyjq6O54UvEsh7
	 KQIeZM05EmDE73wKpdVCtmJwx1WkHlxpzmZNlqv7UfSJtR8SQaVw0ZYdvUoDUWzYs1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ioHfBpge;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583F4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ioHfBpge
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso1199518a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259026; x=1793863826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wv/hhLPWhmY3X0g7zF73HBjVxwILbM4aXNmpTd5ryb4=;
        b=ioHfBpgeQDW0DtC+R4cAXLIrR9P8EYCIKnEyrGhoswjB463cJzhwxPnOuSQSWsi0kr
         cc0N51ecS4otM2pTW9ARGI/iM3lUp7jbBWhKDrvkbW7k7QPUBW7MmNxKkvcCQMR/qh6E
         oACXVhq19K/ga6kBSGZHIAdIp/5QLTKvDZZNNZolc7OMsWaym56lDnpU5kBKDsndp6xY
         /fFbikGOGkkp/KWGtQGLfTeQ2uICU0HmIvaVzrHEkrj3XBfzm9CTi2MKHuZVzkjUJEN6
         /bn8OBH5z+OKI2dTXlDpVA6XZ4p5O63OPa7iLEzuMq9p4y5sYSHOhqV80s9S4sCtZC4V
         HGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259026; x=1793863826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wv/hhLPWhmY3X0g7zF73HBjVxwILbM4aXNmpTd5ryb4=;
        b=hdp5mmeKUJ0De7IEHbv7mjVTYDfOGGSjhaK7wRepf3GK4KvodDcx+9anS+0DJDvB/T
         oIa2izLei4ys1PhMsvGuUYY5WDzRjdxAFQeyhmdKx3xH1fn3vz0kBQB8ksQlGGSABxH0
         Tmxsrd6t6QfgmCRZGuOkX7GVu1CYyFhp/xYcA6kB5wXrUZ26WcYPQFM8PBGnxtuppQzq
         p7LTkuGGSWvZwZp/DEZzVQARCUhnl5K8ZlN2bGQl5QcoTEPaGvUP/D5owpnuaOi7LT6P
         dOGeXS7DaqsQLbD7AJkHgvPLKc+ztscYF196oQUxjWK+3Pa/VdfCgo2VHKc+6FQzvlMj
         /S+w==
X-Forwarded-Encrypted: i=1; AKwUvBw1QtDjzrvW5HgQpG59ph7XFsLM/ozpR9FnlbC5otRbnvIunl9dfz8hVvlUB0dSDMbVORjAIhAz4xe58KE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiq29tEbAvbjdP2hADag4USzQZ10Chl/ctHySu/njK5rGt5iWo
	/tKKwnGeUrLUcooffCIes2zfLu/IVc6tefv+nr2ygmr1o1iUvcA42B8M
X-Gm-Gg: AYBFou1WznVGgSEBq8ybxu8kHu2zKzXAg++s3NsXXlY0oMzFYFkB8xzLg9nHghCwqv0
	Q8jurxYKBJhqajTggvwuewN1jQx+wdHO15HSc6zUdNbNXoYmxszjr05/Iiwpop+rq+8Mt+A5w3v
	uQHX0qLOEfX9DSag8sd2dE+rjmmlU7HJdnT5/UvU5B0uNLUkEB8M/Ny3qqboz/6NC5k9R7w46nq
	nsOFyb9Gc641UsBL8AMFudD422UMXhDff01JOm+eTyHP6mx8tKGtkNOgYPyDQoR2tB0WN1Dwa+p
	yKY1n+w1POF8Ny2a0IZuJJaDSwGEVEXX79aDuVu5cuY2CrN5H+KN42ITYV7xdP9mH1EgIcNyBf7
	HtKd+swz6JnhSvGytnBp3DTny7JiYdL9It7rkko0T86ErdBkYlQzdW3ECuYhwnptF8KrobSUaIA
	/6ht4h1vPUmlBmAU0Kz69thpducJR5jxHMq78zAi36256u3GhDPFDSX6ctiyxreY20iy0Z9yo1O
	LZtTrQ6wWn0AiPv2/dYos9LGs5Xrg0piLbGvcefk/u8fEPBdeHw2qWeYpfb9+UihV5SZ8wq31E1
	nPXcrOZPiHCYs8BEDTT79BA+IN4MXAypnw6vI5VQDQOo30pGh3AEtFHC
X-Received: by 2002:a17:90b:4cce:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3ae582c2823mr3715004a91.44.1793259026521;
        Thu, 29 Oct 2026 00:30:26 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57a2a053sm2660414a91.4.2026.10.29.00.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:30:25 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: kayracizmeci@gmail.com
Cc: bsegall@google.com,
	davichazbh@gmail.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangqing7171@gmail.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v3] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Thu, 29 Oct 2026 15:30:17 +0800
Message-Id: <20261029073017.2464877-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <auGzaT-RjHdctV60@scheduler.schedules>
References: <auGzaT-RjHdctV60@scheduler.schedules>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 28 Oct 2026 at 17:01, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> On Wed, Oct 28, 2026 at 11:44:49AM +0800, Qing Wang wrote:
> > The current NI_RANDOM implementation uses a random dice roll to allow
> > newidle_balance attempts according to the success rate. There is a better
> > way to implement it.
> > 
> > Replace the random dice with a Bresenham accumulator that distributes the
> > allowed attempts uniformly across a 1024-step window:
> > 
> > Each step does the following:
> >   - Accumulate (1 + newidle_ratio) into newidle_window_pos.
> >   - If the accumulator reaches 1024, allow the balance attempt and
> >     subtract 1024.
> > 
> > This guarantees exactly (1 + newidle_ratio) newidle_balance operations per
> > 1024 steps, uniformly spaced for any ratio in [0, 1023].
> 
> I still quite don't understand why we need this. If there's not a gain,
> the old code is simpler. I'm not against this but still I'm just asking.
> Changelog just says "better way to implement it" but doesn't say why
> it is better.

Sorry for not explaining this clearly in the changelog. My reasoning is:

1. It is deterministic and reproducible. For a given ratio, the
   balance frequency is exact and not subject to random variance,
   which makes the behavior predictable when debugging or tracing.

2. The attempts are evenly spaced, without bursts. With Bresenham the
   interval between two balance attempts is uniform, whereas with the
   random dice the number of skipped attempts follows a geometric
   distribution: at low ratios we may go for a long stretch without
   balancing, or balance several times in a row.

Also, looking through the scheduler code, I found very few places that
rely on random-number-based probabilistic decisions like this. IMHO
that approach is not a great fit for a kernel mechanism where
predictability matters. Using a window and spreading a fixed number of
allowed attempts evenly within it seems more reasonable to me.

I'll put this rationale into the changelog in the next version.

> Why do we need to make this 0? We need
> 512 calls for this to happen. But for balance to run we need
> newidle_window_pos to be 1024.
> 
> So, we reset newidle_window_pos per 512 calls but we need it to be 1024
> in order for balance to work When weight is 1, the newidle balance just
> doesn't run.
> 
> Or am I missing something :-)?

You're right, this is a bug. I wrongly assumed that newidle_ratio is
updated once every 1024 calls, so I reset newidle_window_pos in the
update path. Since newidle_call is halved after each update, the update
actually happens every 512 calls, and the reset discards the
accumulated value before it can reach 1024.

The reset isn't needed at all. newidle_window_pos always stays within
[0, 1024), since weight <= 1024 and we subtract 1024 whenever it
reaches the threshold, so the residue can simply carry over across
ratio updates. Dropping the reset fixes the issue. I'll send a v4 with
it removed.
--
Best regards,
Qing
