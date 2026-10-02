Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479E73B83F9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936822; cv=none; b=lBSnfYC21eYWu8NhtXwjPh3t9aEjrUeB9RYl0teuDhnGNtS63JhHqRdFyHrVhaUi8whG+R2Y57r4L1cJV+XcvcF0QbD5R+xfgB+v5I6y4Ae49eWO2LOkcD7og7ODYcGWHIIm2rUSPeCU79xy1r+zevGHziZDxabBMdJ3VGoL0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936822; c=relaxed/simple;
	bh=M4tzdgxQsluQHaWsj90gAHf9v+JptyBQYA8/vk70GCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckGg8KjeOwQkdB81ZaXxhAaE9dbNWbBBcKGySTYrHYIF5w9bD0D0gr3uikw/nG8wP8U6JhHuSmibu2KyQSxXaQHn06H1qFLE9m8sKZA8P3CWa16Q8caKOk/OYUTqZfeEoVeCFSMyzpHQGczKE04esWUvcli+aqAXsaNDTpPmNsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=UBn50bFV; arc=none smtp.client-ip=62.149.158.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="UBn50bFV"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id CaTexjQPkXmotCaTfx5U5J; Fri, 02 Oct 2026 12:26:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790936815; bh=M4tzdgxQsluQHaWsj90gAHf9v+JptyBQYA8/vk70GCs=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=UBn50bFVpOK1NSFW4pfe9au6wLver9CE/rI+p9F/6kxXMrbQZ6ob0zoMWgYS2Anky
	 56bxH/9dh5U6a83++kmzCPf7Iku4rNvyHcIjkoIHfyqcbExVGzLIvyT70coC8GdZ6l
	 az1zChYqJhdGf0tWAwuqy60JEHunNl07F0qd1s7/au0fbE82JeXHgy1nuEEO9u6Edj
	 +lsyzAsFW06idqK+ucFfMFgPqOFchAkaBCjQCYdhtR295LQL/VY+SX/qjmEVEQ9i7C
	 rHG/rNd9zDhTozR6l4gpyxNWk/avLQyr3p5QXn/ejJLmUpcS90AenogQKSLqZlX2pR
	 /drqy8oZ5SYag==
Message-ID: <7274f4ef-edec-4282-9c92-b6f7918b8320@enneenne.com>
Date: Fri, 2 Oct 2026 12:26:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] [DO NOT MERGE] timekeeping: Apply extrapolated
 ntp_error to clock snapshots
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
 linux-kernel@vger.kernel.org
References: <20261001202134.33929-1-dwmw2@infradead.org>
 <20261001202134.33929-6-dwmw2@infradead.org>
 <0d5d56ca-89fa-4f09-bd24-9c730dd27656@enneenne.com>
 <4751c410a0cb17270e6c2b43e70d01bfd7d6f0d0.camel@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <4751c410a0cb17270e6c2b43e70d01bfd7d6f0d0.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNc3BKdKAjMlkRKrUTZAyozwF7tMzQzkMTR/I3+wSqi8GKOKJt8FbzntvtNWk5nOjftrJThEqNEA1ugMvDvfXdK7nPU+jQY4c7ccx+P/T4rTMfkdC0Hf
 ZgT9Q7L6wMoNZjDTSaI24Jt4YoIfrwDP+xpUAVOp5agOhn+y6sXfTO47hEri/tXG1WAvUtG/Lw+ZV50k4uISVdBvKBb/aV+9RvFFkBoO7YzSI4qYvpMvurPN
 uBXG7Dd12w0w98LnE9jccbp2LiJ8zoGJlQB0yx7IY9SWKxyiwi8PRy1b2h5gq3afZ9U4l1Xy8UDUc0OqhUJj8dcWQlAlrBv/BqXgMV/4g/UZncBFF9ReSqgE
 RGX4ogwOEY0pOPk11s3xMNvHyZ6PnRRvkmmf7XukMQZbSO+FycA=

On 02/10/2026 11:14, David Woodhouse wrote:
> On Fri, 2026-10-02 at 10:30 +0200, Rodolfo Giometti wrote:
>> On 01/10/2026 22:21, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> The time reported in ::systime of a system_time_snapshot is known to be
>>> slightly inaccurate because of the way that the reported realtime clock
>>> sawtooths around the *intended* time series, limited by the integer mult
>>> value used to calculate the inter-tick times, and designed to ensure
>>> smoothness and monotonicity for its consumers.
>>>
>>> It is particularly inaccurate in a tickless kernel, where ntp_err_mult
>>> is not adjusted on each tick, allowing the reported clock to diverge
>>> from the intended time for a large number of ticks before re-converging.
>>>
>>> This appears to be the reason why CONFIG_NTP_PPS is not enabled on
>>> tickless kernels — because at that scale of precision, the realtime
>>> snapshot at the time of the pulse bears little relation to the time the
>>> kernel *actually* believes it to be, thus introducing random errors into
>>> the PPS phase correction.
>>
>> Since enabling NTP_PPS on tickless kernels no longer depends on this
>> patch, I think this paragraph should go.
> 
> Yep. Assuming the NTP_PPS tickless enablement lands under separate
> cover, after the main part of this series but before *this* "DO NOT
> MERGE" patch, I should just lump PPS in with the other users listed
> later for consideration, as you said.
> 
> For that assumption to be true, we have to be happy that the ntp_error
> reductions in patches 1-4 are sufficient, and that we don't need to
> *also* switch pps_get_ts() to ktime_get_snapshot_id() and have this
> patch which applies the correction to the snapshot.
> 
> Which leads us to your next question...
> 
>>> It would be better for callers of get_device_system_crosststamp() and
>>> ktime_get_snapshot_id() to receive the *accurate* time, not the
>>> sanitized version provided to gettimeofday().
>>
>> With 1-4 applied the correction at a PPS edge should be in the tens of
>> ns you measured: is it worth having ts_real differ from clock_gettime()
>> for that?
> 
> Good question; I've been wondering about that. In a sense, I'm fixing
> the same problem *three* times. First I eliminate the cases which
> *introduce* significant ntp_error (patches 1-2), then I let the system
> *eliminate* it when it does happen (patches 3-4) and now this patch
> even *deducts* what remains from the snapshots.
> 
> I think all three *do* make sense, even together. Especially now my
> last-minute Sashiko review pointed out that the 'eliminate' part is
> only for the core timekeeper and not the aux clocks (we *could* change
> that, at a cost of extra work on the timekeeping_max_deferment() path).
> 
> But also, even for the core timekeeper in a tickless kernel, that
> ntp_error can still accumulate at *any* time. If it has exceeded the
> elimination threshold while the system sleeps, it could still pollute a
> snapshot which is taken at wake time, before the correction has a
> chance to happen.
> 
> So I think we do need it, and my inclination is to hold off on enabling
> CONFIG_NTP_PPS for tickless kernels until we do. But I'll defer to your
> preference. If you want to merge it sooner on the basis that with a
> 1PPS signal the system doesn't get to sleep for long *anyway*, I can do
> another test run with just patches 1-4.
>

Yes, please do that run. This patch changes what PPS_FETCH returns to
userspace, so it has to wait for the chrony and ntpd people anyway; if
1-4 alone are good enough at 1PPS I'd rather not tie the tickless
enablement to it.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
