Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875192;
	b=tUwz88evP94k2eSakAmbwPa1O/kGF8RAuGvNfAKnDel3A4dS6Kd/BJyj3pFr11gtDiIY
	 Jpw6B7nmkS8Ghb8JA2mnm/uPpak8FNnj+0D5r90XbMFmAnCdC42zy4zn5pmLO6TTGh8N5
	 QSM7SM/SNYMkC3o9+Z7UO4sj8xOLajc0GExT1vI1TfUDIriDGB+hEZw2ma/V1+G6G/M69
	 Ur67IcX5AWMPxk6JPLwtnxg+ARMLXYfrud6snGrZsHBUbtDXrOhT4+qbbiu+6dmt+EHDu
	 f8WpV5Rj4HbsELS8+NeRwxCV3yT+r6+PWTIGVvU0+nLFFgIP5jaA942LQd3ENWywKKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875192;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=VeFGWIimZaZIih600Ja3w4EKU+S0SuyJS8PJnf9bBhk=;
	b=cApfhTZwl5NTKbT5YpNVOihSFb/sWbfxH/As9/W/mh67TRR8XyFLnFxOE7XuEEWp58PB
	 GxT/GZBdDtNlrEmDJhaxgsWSRuFg1ZhDrWhwkS8MEMqYSPMWUHOCfTXnfTBCpPYSKkTTX
	 9Og6SR4X/eI/bQDBhDIOtppjxyNr43fQG5guaVagMDgNP5LZaCoqLi47DZr4JQZ+mL+j+
	 ME7cvYrmM1YGL8fcrbpHva7tQIR9YHvcnQG8iCYhgAOtcC8KiiLQ0zwPv14tSHtHvu9Oz
	 8X5aw0Jgt83DYZRpPehZA2E4NLTKOjUT39PehhnnoMm+93PFvWLiYLW724CrZbj/NyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=IYBwtY0m;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB5606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCB5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=IYBwtY0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VeFGWIimZaZIih600Ja3w4EKU+S0SuyJS8PJnf9bBhk=; b=IYBwtY0m0KiGv73k3YawYSKlxW
	BprZrKSrfeo9uhb14jPdh3sgO2rV1RRhkLU3TVbR6l3Mndi8tT60lt2rIsE0cGQcB5WLO24ZjsiZX
	ktuiSLp2kcgrF3nlBvZnXLCgBBf8nkyCOfyPb3MvXbzuAcDUKNj9IIKttDrcOm5H3xy6qrT/mL5XH
	r1ujkL6dcdXvMBHBSRadYSQMO5da+wiJRx2Fff0AYxl68ppxvV2sLUkFLdOFaLdIOIwI5LY8ZCwRv
	K/BMr171E5ST22uStiVzlCzqdljOBC30L25RD6B0LqSjsBGz8zXQGtwF1XL3lJL1vVRlCES/BuS7q
	7D4mk87A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOusK-008RNA-1p;
	Thu, 05 Nov 2026 10:39:20 +0000
Date: Thu, 5 Nov 2026 02:39:14 -0800
From: Breno Leitao <leitao@debian.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, kernel-team@meta.com
Subject: Re: [PATCH v2] kcsan: Don't enter an nbcon emergency section for
 verbose reports
Message-ID: <auxbeij5bSW4skit@gmail.com>
References: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
 <87v76cahn2.fsf@jogness.linutronix.de>
 <autB8IxyWgtaH_oE@gmail.com>
 <871p90psjl.fsf@jogness.linutronix.de>
 <auxTn4YuYHUOt4ml@pathway.suse.cz>
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
In-Reply-To: <auxTn4YuYHUOt4ml@pathway.suse.cz>
X-Debian-User: leitao

Hello Petr,

On Thu, Nov 05, 2026 at 10:59:59AM +0100, Petr Mladek wrote:
> And there seems to be one more lockdep-caller of
> print_irqtrace_events():
> 
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -4649,6 +4649,8 @@ void lockdep_cleanup_dead_cpu(unsigned int cpu, struct task_struct *idle)
>  	if (unlikely(!debug_locks))
>  		return;
>  
> +	nbcon_cpu_emergency_enter();
> +
>  	if (unlikely(per_cpu(hardirqs_enabled, cpu))) {
>  		pr_warn("CPU %u left hardirqs enabled!", cpu);
>  		if (idle)
> @@ -4656,6 +4658,8 @@ void lockdep_cleanup_dead_cpu(unsigned int cpu, struct task_struct *idle)
>  		/* Clean it up for when the CPU comes online again. */
>  		per_cpu(hardirqs_enabled, cpu) = 0;
>  	}
> +
> +	nbcon_cpu_emergency_enter();
>  }
>  
>  static int
> 
> What do you think, please?

If print_irqtrace_events() is going to be used both inside and outside
emergency sections, wouldn't it be cleaner to keep a variant that enters
the section itself, for check_flags(), instead of open-coding
nbcon_cpu_emergency_enter()/exit() around the call? Something similar to
this current patchset approach (maybe with a better function naming?)
