Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397578;
	b=c1h7bHXf+7oSRHSVX4HAsfXJahlF9xBI9xVeQxiMj5O1JTlwnxmiojjDwHgbl8qp1vZV
	 EksBmuPyDchBfLzwSyEGilMEDv6HQjfsL8tIRvBMbB9kqAa/1A/UQDcHWkcqrg2czAz29
	 bz7yJulqirrO1v8L0mrKSzlH7C2sKYjt4yrBecpKznyKrfd037Hri28FoSFlXAaDxtY6b
	 vXLbl0xGaNx7FFype+1M1hIFQw8BrgrHPi/8znnsLl3wrqXTXjWuQq5rQ4kkFibDXeqNI
	 wtK5Y2H+TTdUscgE5dxa337P67J8gmDKdEKycQOEyR+uhXnpEwJ9aPi9xfcEITNDmZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397578;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1LeyAT4dhMZG0/AQrkkW+ry7HzR4FwfDtdXPAZFYOHw=;
	b=eV1MA+3o6bRvUurXlpLxdeZOC6smoSdhO/y33arf3hWv1dy83mUsj91pWQtUtg0uN3Yc
	 XHr3u7PLonlKrCG4LIa+yMeZv1NftpjAgFZLzK8DvLABBkxpbnakL8vF7PE721n3CRUlo
	 5E0/0kLOImuyhkwaO/v1Hslvy1ahpVW8uV4Qogb0mRmoxGo9/GsVYma7WmLq6F5vbZhti
	 mv8xbG0pTagyvCPMtsn2sa5HhcdcCurFNGe83nA3NZghqBtCYHgyTKFgLIvGpTioXREF8
	 xNDxWIMlqTAW8RNX8PgTgapj7wmpN9QMVypxSsgV+xOE8ddaaRMD0bJdkPu4g1PpNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDQYUhpg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06606606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDQYUhpg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DF11F00A07;
	Wed, 11 Nov 2026 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794397577;
	bh=1LeyAT4dhMZG0/AQrkkW+ry7HzR4FwfDtdXPAZFYOHw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iDQYUhpgt4n7QfgvxaGUkeD9NRyXYPfD8w8SKlrgQKNRJAvx1TUv7ENBxTfI96R+i
	 vaSk1J2QBAiw1HiMcTG1JGa3Xg18yuuQxBprl2Q6G2WRa7B6ixrsm0uipS5y4Xadgf
	 dL1zeUog1HlQSBr1SwjXuWvHYmvsT5NPlIRTRjKs1mvLb8lagudap87XjsjDM7ZchR
	 9ldqZIxTliUdsZLoU2GwezFLIcQTkrEHdpdYI/aKGTAUI+lq4rionlOnUhgpiEvwna
	 K91w+WezOPtESGBkFASitdl+grXpa2ewEmsv4DldNURa846B/b3aTc8zu/SKbjfIju
	 40m0DbEaP1i0w==
Date: Wed, 11 Nov 2026 01:46:16 -1000
Message-ID: <3461bfecf6bc383facc218d56863d6c4@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 00/12] sched: core-sched fixes and balancing
In-Reply-To: <20261107115913.261163891@infradead.org>
References: <20261107115913.261163891@infradead.org>
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
Content-Transfer-Encoding: 7bit

Hello,

On Sat, Nov 07, 2026 at 12:59:13PM +0100, Peter Zijlstra wrote:
> The main difference is reworking of rq_clock due to TJ noticing the previous
> one got it all wrong. The new patches might seem a little aimless at times;
> this is because my initial idea for fixing the problem didn't pan out, but I
> kept some of the groundwork for it anyway, since it resulted in simpler (I
> hope) code.

I wonder whether the clock management is too subtle, and as Kayra
pointed out on 05/12, saving and restoring the flags doesn't work when
lock sections straddle each other, which core-sched makes common.
Stepping back, I think the clock needs only two things:

1. The wakeup path wants the following clock update to be skipped. This
   doesn't need the REQ/ACT handoff. It can be one bit which says
   "whoever updates the clock next, consider it updated without reading
   it", cleared at the end of __schedule() so that it doesn't leak past
   the reschedule that it was meant for.

2. The clock should stay put across a section including while the lock
   is dropped in the middle. This can be a per-rq depth count.
   rq_pin_lock() increments, rq_unpin_lock() decrements, and
   rq_drop_lock() and rq_repin_lock() don't touch it. update_rq_clock()
   reads the clock only if it hasn't since the count left zero, and
   that state is cleared when the count returns to zero, which is the
   clear on unlock. Whoever locks the rq while a section is dropped
   comes in at depth two and finds the clock already updated, so there's
   no separate freeze state and nothing to save and restore, and it
   doesn't matter in which order the sections end.

Raw lockers don't hold a count, so they'd update each time when no
section is open, and double_rq_clock_clear_update() can go away. For
core-sched, the core-wide selection updates every sibling's clock
anyway, so it can take a count on each sibling as it does that and drop
them when the selection ends.

What do you think?

Thanks.

--
tejun
