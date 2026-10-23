Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773840;
	b=QnlNlNORHh++QHazfEWX8285hpIk7yKZckrPdshSvvzIzk259JxY6J53oeu/C8GpZn5W
	 /jfx+8xdW6ziLWn4m/zDI1vmGoAlTVVfPle/ff0WmKd0vK4EuqpJ84lgYhr7kXrKW2Cs9
	 LGgBAtjR78GlQajoNAI7mUCuad56YLQwq9DLLU4h97DM9z0UnRuDmRSu3IYJ1/gFidhxE
	 wTmNd+Vz1zbMq8PA11TpIYBAwkS8aBhCxI2p841xTG/AMqq4r4YneUcgSBR0dB5jo2uOs
	 DaO3ONU43bvr7IpuBo6SWQTFTL0dsvZBujpPvb4UTIXRLIYVNwnwe+umARQfRZw/c0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QcjFvkA1d3cVHe/XpUIZZRMP9RY+naa+sxiF4g8aVzQ=;
	b=NUwVb49uGoujZ61qwLxhLpuE2JG/bSfgPCd6n1NMgpYfDH9Q1Cwf5mOU1aYGX1J3IZ/w
	 p83gR7vh+woE2J/bun+BG6aIVKiw1aYdfXfAbHqUVQ792GbCvn93ObtQgD/1UThYdCwBv
	 UHDKklhJxRdn/sXX4BrqaBKW/VEjcVXY2W5RI9REzykPbWokid2+ed5Fs7/E2+KMRqBth
	 eRTPT/kqE4eZvyKAmQaKevAySaYz9SvYQhsedgX6kxWplDTkQc/6CYlHKlUwu/HGLq/gN
	 Eeek/D+nnKCdiH3TZzKp9ER1nRFXHAixzpO63vkjri1wA3nL6SMVhoREeGtIyGPKqOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DhIjBHX1;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC5606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADC5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DhIjBHX1
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36681e85e87so2576816eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792773839; x=1793378639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QcjFvkA1d3cVHe/XpUIZZRMP9RY+naa+sxiF4g8aVzQ=;
        b=DhIjBHX1zUOJGQVbKbX/leEVidVcs39KyltpE01YcU1UbaY4aztTulbWWyy2plvhKo
         nkMfTdtvUcOpBmLP+azBoIILWjOOEXzDeojioUoWLu87tuMBaFlBQ8MFcNqw6J2JOr8a
         2PhuLr3I9dDHubo7GGyMQb+qPN8QdjCnZ6WuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773839; x=1793378639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcjFvkA1d3cVHe/XpUIZZRMP9RY+naa+sxiF4g8aVzQ=;
        b=jK4xrnbJcx1sqjr1OOYBArbcz7910VirIhVEkTSbWKJpkMRdJkEtNIlTBxYIrPwsMk
         x6em0ciyVQZCG9s+KNjC51DX80xXsH7pKaarVFofSBEUeBVSIljnPmr5LpOAV/rrZPMH
         sx2BhXCkJxjFNfRof3EHZSIOxFsoNAyZ/SQwfWFnSpws7+3Dz2dJAN+A4BiPA8lOXHVk
         i5SI0DNULStccQikZaYmJZbVCLgd2kuekSS/bxfz2hVPCaxGUKsw+0JzsD8VrkVgZQyD
         ZS8c5T9ltMF2CTVMwJr4FCSmgl/ajiH25ePhWGxlTk2p2t0Dzsq8tWqXgwUgt8TfWhyp
         +ylA==
X-Forwarded-Encrypted: i=1; AKwUvBwVvK26VAMUPeqDWU3/QPYb7l/F+Y+3Yqzk7eYTLGUEDA6NbM0fE2qvTcFxn8xd0m8tACbCfXj1pDaX1Ss=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNPawCvPb5rj8G6Oo+YY7rz7viV6Omg5G49652GmmYxjL9c9sJ
	dUczG+GcFWjEPJ2WUjT6cpKfc9Gu/O2h+t+WnzUwC1c7Kpce4mRLloUwcTKlId5vhy9JZHsWTOL
	be0k=
X-Gm-Gg: AYBFou2MwgLHhzUNbHyWQnqYzRwfXPMXfnZ1NTnl5Lp+Sxw73yA128AFa/MP+zLyw2E
	sqtn+nW25gHBnHEIrGuyL+6k6eUE9hep9ZmqJWoGSaGpOc07SUG7dvxls2tdw5Gcv596XW14Vja
	dKwUaChWzHf98YD9CesJ/xOJLW1Pq9kfzqY5AVIZ+Fx5DTX6YN76GymsTbdHY3u2v0tNOsPUIpd
	Bens29mW367UKKhb9xL+wSMZ/SiV/YFK0689wPTr7psUcwTb+UEWG625sMhbc9qT39aEHiJwR3k
	+9UGooF0YYd1MiilO5nECI4vMQU+O7x1ZyVhc+nBvs7ThI3023euNK88GA5gqCuxgyb2mAjLnTC
	kCY0eYT6ZWUnwiv9SUApBXXknplsrU/BxDn3SnH1ODWqA+XhjuZa3X/xfwEz8jsqbHJrZ4X5Kaz
	fv0gRenefWUxCPUFT+yP36MP6uJ0L6tx5MgESQ73+2t6Ha84xwr/ZMsfaPi3DIqVdrQsINPSve/
	2JNFEMZN2AbRHNverhGtot8dvcAJhpfVT5TUcDkwtMAJf5lC7AenA0PyqY3qa/o/pC5V4f2LU3+
	De3XgxJLG/Q+KT1Rxa0=
X-Received: by 2002:a05:7301:a10:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-369d97205cemr3198207eec.9.1792773838852;
        Fri, 23 Oct 2026 09:43:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4a1d:784c:3fc4:37a2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-369e6e5ecabsm847022eec.19.2026.10.23.09.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:43:58 -0700 (PDT)
Date: Fri, 23 Oct 2026 09:43:56 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/17] iio: accel: kxcjk-1013: Discard
 pm_runtime_put_autosuspend() return values
Message-ID: <atuOzJiEs2ruiHJz@google.com>
References: <20261021235818.3059519-1-briannorris@chromium.org>
 <20261021165858.v2.2.I7751f8c9dde6f4a576a17dcfa13a4c729fa748b4@changeid>
 <20261023043637.102d9a70@jic23-hlaptop>
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
In-Reply-To: <20261023043637.102d9a70@jic23-hlaptop>

On Fri, Oct 23, 2026 at 04:36:37AM +0100, Jonathan Cameron wrote:
> On Wed, 21 Oct 2026 16:57:03 -0700
> Brian Norris <briannorris@chromium.org> wrote:
> 
> > This driver propagates the return value of pm_runtime_put_autosuspend(),
> > which is not particularly useful.
> > 
> > Returning an error code from pm_runtime_put_autosuspend() merely means
> > that it has not queued up a timer or work item to check whether or not
> > the device can be suspended and there are many perfectly valid
> > situations in which that can happen, like after writing "on" to the
> > device's runtime PM "control" attribute in sysfs for one example.
> > 
> > For this reason, modify this driver to discard the
> > pm_runtime_put_autosuspend() return value, and inline these pm_runtime
> > calls for simplicity.
> > 
> > While doing this, it becomes obvious that kxcjk1013_write_event_config()
> > and kxcjk1013_data_rdy_trigger_set_state() are intentionally mismanaging
> > runtime PM reference counts and instead are relying on (racy)
> > autosuspend delay for correct ordering. Undo this choice, and instead
> > properly drop the reference count only after we're done touching the
> > hardware
> .
> Sorry, I should have looked more closely at this in the earlier
> review.
> 
> I'm not sure this is actually true.

I'll admit I'm also not 100% sure either. But these comments I'm
deleting sound awfully suggestive:

	 * We will expect the enable and disable to do operation in
	 * reverse order. This will happen here anyway as our
	 * resume operation uses sync mode runtime pm calls, the
	 * suspend operation will be delayed by autosuspend delay
	 * So the disable operation will still happen in reverse of
	 * enable operation. When runtime pm is disabled the mode
	 * is always on so sequence doesn't matter

That sounds to me like, "the put_autosuspend() is in the wrong order,
but we're relying on autosuspend delay to flip that order." This text
has also been copied between several drivers that borrow that same
structure, IIUC. Overall, it seems like at least one author was
documenting a race condition, and was simply lazy about handling it.

> A device being in runtime suspend
> on an i2c bus doesn't in general mean you can't talk to it.
> Whether the mode switching in here is a problem or not isn't
> that obvious and will require a datasheet dive.  It is inelegant
> but maybe not a bug.

Agreed it's not guaranteed. But given the comment and the nature of
runtime PM, it seemed like an obvious transformation with little
downside and likely upside.

If we're not sure about these things, I can undo them.

But mainly, I don't want to spend much more time on this series if I can
help it, nor introduce more difficult driver-specific work items (see:
all of Andy's comments) or areas of potential regression. So I'll lean
toward the safe / less-change option if that helps make progress.

Brian

> Anyhow, out of time and energy for today. I'll take a closer look
> at the rest of the series in a day or two.
> 
> Thanks for looking at this.
> 
> Jonathan
> 
> > 
> > Use guard() for managing the mutex in kxcjk1013_write_event_config(),
> > because it helps simplify the above refactoring, making it less
> > error-prone.
> > 
> > This will facilitate a planned change of the
> > pm_runtime_put_autosuspend() return type to void in the future, similar
> > to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> > type to void").
> > 
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
