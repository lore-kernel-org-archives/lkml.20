Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678503148DA;
	Wed, 23 Sep 2026 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148512; cv=none; b=QDBgvOZvAaeD/hjS6jU2czaN29mIs1Yx9J5s0BSiBxarnuyJkkR9e4CG8ymgg9cVATT1LUovPF1MI7V0JrlCsZlYRAwxr6cyczzuV7Z6E2hpAYRnrfOTtTkXxqxhthO08uIUDb6Nx6n5UGF3ccV5+UVIasTnnKXqPqr3CfVefsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148512; c=relaxed/simple;
	bh=QV5tBrSrp/a339LYGOG9L4sXj/It3jcM5XUKg0dX+bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qdr239KOkugEPAVjf7bbcz0iWP5Uwg98VncyLYzoxglNnnxYJSBHQnTuho6N1B23ZtyNxfVz4Bw7TmpEmztSuoa5+I7XxLWAm78lgvYG9QCihnmWkzgCt+P+RhRHDC2VCfriQAxPtYYUK/Hd4I4Nt9mYb/JnJpXHHLbJ5txei/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eeBKtYUE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sM2UjPHv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eeBKtYUE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sM2UjPHv"
Date: Wed, 23 Sep 2026 09:28:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790148507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XPFwZnie8vPbgBumSyCLo6EWSt9/QaGEGk8dTunXciY=;
	b=eeBKtYUE7JZW/sRZeD2Qexa7f8noZm+LNRp7ovDGeO+FXBgM7U6GWyTIAttsetEFsppc/0
	xfHzuNDY4blgFXSYX2tKKp60H5PleLzJ6mWYww4tesBFqYiq3JPD0nOWa9aje5hkSHbF36
	Nhq9njtqiUVf5273vOBLlTE02F3EfgergNE4NtVUYTbwxQWzOHZbln3KrU6PQ0F1cL8/ns
	+UlXhJSW7npCFtT1EOUHLyAIS37ybO+3gNDw3ZGx9AFXZswd7Z7SvxX1EvcfG8SWBz7I5I
	5sBobMpICiCUXJwc95Pf0USA95JInPWayJYCO5l0RXlz1D4xdOwX/AymsKHwiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790148507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XPFwZnie8vPbgBumSyCLo6EWSt9/QaGEGk8dTunXciY=;
	b=sM2UjPHvkAjj58CRnKM5gke7Tn3imG2neWMGS/CiTfxJx6tRIol5MXy92pPaaAjog0tP7u
	q87otrzE42yvovAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sched/doc: add a preemption model overview
Message-ID: <20260923072825._dV0YtYP@linutronix.de>
References: <20260922083101.99685-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260922083101.99685-1-quchaosheng000406@163.com>

On 2026-09-22 16:31:00 [+0800], Quchaosheng wrote:
> The scheduler documentation describes the individual scheduling classes
> and various tuning knobs, but there is nothing that describes the
> preemption models themselves.  The only place where they are documented
> is the kernel-parameters entry for "preempt=3D", which explains the boot
> time parameter but not the models it selects.
=E2=80=A6
> Assisted-by: LLM
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

This reads very nice.
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Once comment bellow.

=E2=80=A6
> --- /dev/null
> +++ b/Documentation/scheduler/sched-preemption.rst
> @@ -0,0 +1,84 @@
=E2=80=A6
> +separates the models:
> +
> +``none``
> +	Code paths with long loops contain explicit ``cond_resched()`` calls,
> +	which perform the scheduling.
> +
> +``voluntary``
> +	As ``none``, and functions which are known to be able to block gain
> +	such a call as well.

I know what you are trying to say but it does not sound obvious that you
refer here to cond_resched(). At least to me.

> +
> +``full``
> +	Explicit preemption points are no longer involved.  The kernel tracks
> +	whether it may be preempted and schedules once the request can be
> +	honoured.
=E2=80=A6

Sebastian
