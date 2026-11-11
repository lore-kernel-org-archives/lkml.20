Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368885;
	b=ViURqGO1aIDW3iiKS/vTYtxDeYsILnAEdx8xArBWuGPBHwGxx2x/P2X74+pAD4T8iM/x
	 vtIIyliuXgNt93E80p3cKcAnA6lYYDGNGEjgcI4QcNvARsg8Dp1Vg5V6pJqpKw6W+1X41
	 rwKAKnfSUb2GKBuDCpIKa07dwVsh7NYeKZGLvArojLOTX1cTdejkH8K49wSmtpXOKwnIn
	 gDD0jiLXd4VF72MmrOcryZqn08OteKdT/xQ9wocbSKqaZGp/mbZSglhdfV5VIRPJHVvZo
	 UqlveaLJy6999EaE2O0TATiJ281qZwffLu8lBH7uhufR1a4aNT2ZfHD8FmvqXECsaYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yP3MUaap2UdxY9ATROO5FfQ5a2wglkeLGxDqt0I3imo=;
	b=mEHMv8jJJkowlt79a3sZJgx1WdvZKom1i/DTvUg+CuB8ImBMHGfw1B2edp3fYSQ+dOVA
	 k+r/ZsUwq0iqGCMJJDIyQzY8ANtlsLCDz8Htg7oxK3a5BS/N+ABqUpl9hoVN5OOW0bUA4
	 ZLKjF0zzOMtUZOqKb8KH0onMt73MQUhFEHoAySKKr8gF72f/Ob+k+u/4ACNufdcybhtfl
	 qKOXQ9eBqDqpx33Vh0HEh/Xr+hbpoE/2V+/hwkuvH2/Z8PSb8/RaHR5GwOoFwqf2rIr8a
	 LTkCULGnGvsqR2H74eBjCfmZP/N/OSzXxNNiETZf4fXRFY40pIUiB1rl843eUb9tYWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=A+KG9HOP;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EDA606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EDA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=A+KG9HOP
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9441591aa5cso310142185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794368884; x=1794973684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yP3MUaap2UdxY9ATROO5FfQ5a2wglkeLGxDqt0I3imo=;
        b=A+KG9HOPsyaN1vGHd8cK1KSCmV7DvTmGOKgFtUX//0kPKXc4AiIXd+gNr1ORrDq/7m
         NgR3okExOZmsrveK7rl1AxDr3Y0vyk9U8q+Qk3nGrNoIrLobOLj8ynPBybCqOzxp9so7
         LfqXhh6013kC00eQpBefjbde/5F00bDVxBupiTl49OomTqG4Q53WT2fcUHU5R+zolFPr
         96+rs611Rlndxz/XLFhnHY5hWZDFpCDc3EvO6VPyjgKycN9zA8JMKxkb7VRgDlxyyK4Z
         Z/lMgpt2FP2dQnvE4otO6bTcNNKeor7oNZid3Hm5DKD29ERn6wLXmKNr+dtAGvE0ZPAf
         BX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368884; x=1794973684;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP3MUaap2UdxY9ATROO5FfQ5a2wglkeLGxDqt0I3imo=;
        b=Idi8EtNgcSjLAaSLiZuC6e5RRoyrKcY3kz6OOk7bXtGiJyCVuuF0m3uRvSrwrrPhHM
         VZmEp/FrwpRjwbX1AKDyQj+UbYdN3iCmPoZEPBEXg//jdEUeo7mDlOtfzp4PAIXKeINb
         EMIImSQR4NZTvbxHgQO1wDd1FlM9RozJ23rJ7dGANyXtb41iC1m+iqf4n9vfvdevo+f6
         R0z7ToRAu67/AlzUQbws7FraKlxHLdlYnyns/pjgg+hIco9Eins2hw871NBdPq5Yc4Rl
         Hz6hPQb0QDZqa3RQRvOTIqCZ0p5/ftVKjP4f1lQcq4kHUlyf1CffPuwilbbdYBBCvNvT
         s4Qw==
X-Forwarded-Encrypted: i=1; AL+hErErkcEdPPepkuw71XVScsaRrhz6UDBivMoBjuoj2tjlKM9bDoD+1+BQPBYKZBQ2rfkCh0GVMGneZttixHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vqxFa3SINydpAwBJ8OQAMe9O2a+QZTp/6NTidmLxFVpDilCx4
	f3eNbZ5ydmc8fi/5jsAuQ8EWTLAJs0QWv1qDssK6Jjf9bGcz4Ai8ds4+11Kqm9XQEw==
X-Gm-Gg: AYBFou3NIIcxWmp7F2KlDTX0Ul3raMrwqESdkf74tjq7ZyQyjOx2svnkZQY1NdXhYxx
	p7jeNrOI3Y/eWwpBeyMENGHUO02tPp87QidzH1mdmMFsIqezXkUwHZdHPciEU2/+xtVdJFDfgk4
	m89Wha5JLv7cVraIqfoWdzi7jCi7UkA43Qwnwfg2uYBUmzhv6lq8hAdDSoRAEiH75exkocvbMlw
	0TLx0ZF4JyUCy3mcUbFxpIv9ouzOoDYEOzCanmfUpTVS8JSUi5CQJxFSmYv/rUNbzSdT5an1fdT
	BrcRl/mls2VPTJiIjYD0J1Ifbqs7eH5iV9jeMPMcRRhZtA0uYVLdkcofiQiDkPOJLdFjCxDw6X2
	QHOe0JLwmHnGannx81pLquYbRmW01pK8xxvCekxOaxhLM0rruf4RN0dPMi3DFZ7PPdxC7mu49Hi
	1C4APjI9WY1ZkLZgxjK3kCOtaCGKTs9lyvjaYkmTMEIPGUBfs72dOnp2eER83eNl5ocfV3IHene
	ZuKbTqZ02uCMNTBNeEZkFcAUz6o35lYjtB+jovOajqnVOIUkEkuqTHDCOnkGSmYHvqLcmRyVKOB
	pFxCV7rt5InPvzXwN3Lw3o4ETy91RQ==
X-Received: by 2002:a05:620a:710c:b0:93e:5677:317b with SMTP id af79cd13be357-947ae870df7mr271298485a.25.1794368883684;
        Tue, 10 Nov 2026 19:48:03 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e9b4bsm385166085a.39.2026.11.10.19.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:48:03 -0800 (PST)
Date: Tue, 10 Nov 2026 22:47:59 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
References: <20261103221717.3840215-1-briannorris@chromium.org>
 <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
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
In-Reply-To: <avOw_4ZkqtKFHu1B@google.com>

On Tue, Nov 10, 2026 at 04:04:15PM -0800, Brian Norris wrote:
> (+CC Alan, since he wrote much of the autosuspend stuff, but also
> because he might(?) have better context for some of the .runtime_idle()
> + pm_runtime_mark_last_busy() questions)

I'm coming into this discussion in the middle, so I probably don't have 
a good picture of all the issues you've been talking about.  From what I 
gather, it sounds like this is mostly a question of how long a parent 
device should delay autosuspending after all its children go into 
runtime suspend.  Is that right?

The idea behind autosuspend was simple enough: Try to optimize energy 
usage by putting a device into runtime suspend only when it seems likely 
that the device will remain suspended for more than a brief period of 
time -- long enough to make the extra work of suspending and resuming 
worthwhile.  In principle the driver core could collect statistics for 
each device about how long it remains resumed and suspended, but the 
benefits of such a detailed analysis didn't seem worth the effort.  And 
given that drivers know more about how their devices will tend to behave 
than the core does, it made sense to let drivers determine the best 
autosuspend delay time for each device individually.

In theory, a driver or bus type might want to have differing delay 
values for the time after all children are suspended vs. the time after 
the device had some other work to do (not related to its children).  How 
much of an advantage would that yield?  I don't know, but I felt that it 
wasn't large enough to put support for it into the first implementation 
of autosuspend.

So yes, in the current scheme a parent's inactivity period doesn't start 
until all its children are suspended (unless the ignore_children flag is 
set, but never mind that now).  The parent's autosuspend delay therefore 
should take into account the expected time before one of the children 
may have to be resumed, as well as the expected time before the parent 
itself may be asked to do something that doesn't involve any children.
(Note that if a device has more than one child, the expected time before 
any of its children will be resumed can be different from the expected 
time before any single particular child will be resumed.)

The simplest way to carry this out is to do pm_runtime_mark_last_busy() 
whenever a child suspends.  But other approaches to the same goal are 
conceivable.

Of course it's not possible to determine an "ideal" autosuspend delay 
time.  In fact, I suspect that in most cases we aren't even close.  But 
I think doing it this way is still better than anything else that isn't 
a lot more complex.

> I don't think we should be treating current autosuspend delays for
> parent devices as meaningful at all, per the above. So I think this is a
> chance to try to improve the architecture so it makes sense, and then
> figure out if any existing delays should be tuned/reduced.
> 
> Ideally, yes, we can avoid making significant system power changes to
> the negative, but I don't think that we should prioritize that above all
> else, as long as it's *possible* to tune the autosuspend delays in a way
> that makes sense.

Of course it's possible to tune the autosuspend delays.  That's what 
/sys/.../power/autosuspend_delay_ms is for.  Whether it's possible to do 
so in a way that makes sense will depend very heavily on the type of 
device in question and the way the system is used.  One possible 
approach might be to have a userspace daemon that tracks all runtime PM 
transitions and tries to do some sort of dynamic tuning.  How well would 
that work?  I don't know, but it would be a good research project for 
somebody.

> Side note: I think .runtime_idle() should be removed. As far as I can
> tell, it's only used for working around architectural problems in
> runtime PM (like $subject), or for implementing autosuspend without
> actually using autosuspend (usually because they predated autosuspend).

I have never given much thought to runtime_idle().  When we were doing 
the initial implementation of runtime PM I didn't see any use for it, 
but Rafael was quite certain that it had its place and the issue wasn't 
important enough to argue about.  I wouldn't mind a bit if it were 
eliminated, but I also don't really mind the extra overhead of the idle 
callback pointers and support routines.

> At the same time, it makes it harder to reason about the runtime PM API
> surface -- because currently, .runtime_idle() is a primary reason that
> pm_runtime_put() and pm_runtime_put_autosuspend() are different.

I wouldn't put it that way.  My feeling is that pm_runtime_put() could 
be replaced by pm_runtime_put_autosuspend(), since they should behave 
identically for devices that don't use autosuspend.  (If there are any 
devices that _do_ use autosuspend and also use pm_runtime_put() -- well, 
I'd say that sounds like either a design error or a simple oversight.)  
The reason for having two different routines is mainly historical: 
pm_runtime_put_autosuspend() was added some time after pm_runtime_put() 
and we didn't want to mess up the existing callers.  Maybe this 
judgement was a mistake.

> "Last PM reference" can be a bit subtle; particularly, the child only
> drops a reference on its parent once it *completes* autosuspend (even if
> it was last "busy" much earlier). That means autosuspend delays become
> additive along the hierarchy. Is that desirable?

That's up to the maintainers of the device and its bus subsystem.  They 
can arrange the default autosuspend delays any way they like, taking the 
children's autosuspend delays into account if they want -- and the user 
can always override the defaults.  But one thing that does _not_ make 
sense would be to have non-additive delays where a parent's delay is 
shorter than its child's.

Your email was fairly long, and I have touched on only a few of the 
issues it brought up.  Is there anything significant you still want to 
discuss?

Alan Stern
