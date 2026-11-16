Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842790;
	b=2fNPZsOfFsN12ycMgXh0NZzs3AKUl1yHphNKnoB3D3MnFukWr1JyaGAoBfgf981v98r/
	 GlP1bYVSMDZRJ1XA0WqQ/BPutzfjNu9/xGDxmZVB3fP4gtg77CQDm4vEop8kkvB0oJx1K
	 FGt8kcGFJeEzLHjrXvdE6pydMkEHczUm49Xw7rCxayAwDl7V3IE5PbMHUO0dtGCTHCQxX
	 J5KuCpTsdFaRo1kCoijSr1QBoZg2Bgku3N3ryl+8Fj3gOGjk2kgpwF02aRH9Z9x0od7bh
	 5BtQR1ZibNHB4Uyq9MXsooXQzV/ueZHaVDmN/yuON5v6/uiIbPBzRIQq1AfQDt31AQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842790;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=hpzBj+RHJEHheQEZ885SE13+QYCxtEbbWBOo6hPrBZM=;
	b=5FcnfgkTZh0pAf7+R9bSEiUbfrqtg+bpQKWodTM9SkwH0TteqK9QcKwT+x609bQn4t50
	 1TzY7AUU4cDC0u/aN3z6OEb8JME2+RBFv/re0QEiiE25OVBJkrJcTdD0B4Q5N/enDs14t
	 Cu5PeK09EsbnKqYNdN68x8Ku/l63Q0JBtivOTmzEbtU+Kuvtg5az8Z3eplxkaAI241AA9
	 S3Mm7FV+/JQ1EmnqRkH1vwKRdBEtQOfqcIhZHh5jluiXmd0xH1Iv17yRcAD1jBPoh6Oct
	 CH7XMP4RSW+bsIz+Q+rR96DTFAWKc2AF0rP9QtBCpNE+Ywg/F2D4mVtoHe7tiAjvQ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3bhVhJY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3C8606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3bhVhJY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F691F000C4;
	Mon, 16 Nov 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842790;
	bh=hpzBj+RHJEHheQEZ885SE13+QYCxtEbbWBOo6hPrBZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a3bhVhJY1PqsfLU+lydtgR80Zsql+r8VUsOsFQ43GnPWo3pbwBda2hyUwITvmxVws
	 5mggB+qJnmfLN5fW/fa/2wOhkPThZvLFYp/D9Y48KO95XF8VcbTWdaZ+m2sTeFBiYw
	 H0bLc071gSkZW0heyas5NZSB6Pwl9D15SPeETcyRMJSW2Z4VxJX76XmWf9cgf02jaI
	 ZSLTHCvma4QtrppGL3WsX8QSP1r2nIyxrm+fcGrzIUZtLMOMX7k6C8a+MQ0e01ULbq
	 uHwBpSHHq/VkHM2lyhORsmVw/WS/Vaz9kH4dJ4bvcoGceCcuVbK09rBDwdKBMHP/Q4
	 8/D7kfskrVE+w==
Date: Mon, 16 Nov 2026 16:26:26 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v3 4/5] tick/nohz: Reset got_idle_tick when entering
 dynticks idle
Message-ID: <avsgopVPwV0Dd6Kq@2a01cb1180649ff18fb8790c3bbf7a16.ipv6.abo.wanadoo.fr>
References: <20261112163813.524336-1-marco.crivellari@suse.com>
 <20261112163813.524336-5-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112163813.524336-5-marco.crivellari@suse.com>

Le Thu, Nov 12, 2026 at 05:38:12PM +0100, Marco Crivellari a écrit :
> A tick firing after the last tick_nohz_idle_got_tick() and before
> tick_nohz_idle_exit() leaves got_idle_tick set, and the next
> cpuidle_idle_call() then assumes that a later dynticks idle period was
> ended by the tick. Now that the CPU leaves dynticks idle before polling,
> this can also happen within a single idle trip when it switches between
> cpuidle and polling, e.g. when it polls because the tick broadcast has
> expired.
> 
> Reset got_idle_tick when entering dynticks idle, so that it only reports
> the ticks of the current period.
> 
> Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
