Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452187;
	b=XOzepMc4yjJMfx7UF3X9OeLJZGfe1wup4cYgT2hHETkfPwPXP9iLYVuH/asnWa3VQrb9
	 va96aBQuLimwVFh0IBwh4jkx0aDKtiYCyseMeYx3U49UfBT7mZGmKEIY843DRk+j0JTmW
	 WX/3TDpz0LNl5pb1SzOpzGRIlUvEqAr4YONf7pAXmyMgNOmyvRzTwkxdZ5G6KJJRhNmbr
	 YLFUzNPqiQdF3Z/2L6jhF+G4cnUgoP1pv8ad4d1l5e3Sse0KeDDI7h5T1lnc90Z9Sc3C+
	 tI3rRSI51fQt7ZAtwb3Y22tVWgxMJb5vBQAUnHTqGlkZX65gYa/QYnqL+ZEpweFm6gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AsdiVPeKCV3aUvIOkRhblwdU+P9wwsjvQNPDztlCLtg=;
	b=aTlB317JXkyRZLkb+HUxRgL+WjXhmXv55+saN9KPdJReN4lNxl2RuZf8Rt3fNdozjW4i
	 ufQ+hFUrPs69vQcWmC577aeM7Ybfr1pv0ZhhBViA9FJcnVSPVvgaxRU7KoYSo0+TGhgFm
	 Bx69jqpl1jsxYScjKUa1z9XjMpx+nqCF+Y6ZK1kOodHbTb+rgr0ELa0X4S4HcXo7vANAp
	 sLsplFld/E25RxoFjRXJf6omLtuTZ9BywVdGGmXxJoynLUTc7erN3GweYoZaHUDmw/He1
	 +F0ih/af8qLfARpihSFvbQeiH35r8FTaCgJ7FGnSjp50LjxOU/zD8JJXbQFR7Dpm+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxeMOBRz;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxeMOBRz
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so14575345e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793452186; x=1794056986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AsdiVPeKCV3aUvIOkRhblwdU+P9wwsjvQNPDztlCLtg=;
        b=RxeMOBRzQmRKcwf4nK6sXXNdsBGVz1qz1nDToSx14ab685t5VjxsmPcMXeOEQyhY07
         fIIPBczc2NnPf1QzoZMXnEe52BiwR8yRD79bznx1uW6fubjvEL4T1UiJGNrw47JojUHn
         BYZK5Q4/QgtKXW/Iot+7yGCFWe8JaDMmIAYFRgm8sUyUEqBBZ5vQXWS+ixnS0RceIWlU
         BwoKXWWGeV/UpwXxnW2wi6FDfHbGHE/V0Vk8j5ukqpovlkT+gww676t3AFyoe02lrGv3
         dGiX6naGF+5ooLCGy7bcOKVNEtOA7JPNpFT/qxZC+NTgA5UGPRcb3O61XfoheeW3ALmu
         1CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452186; x=1794056986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsdiVPeKCV3aUvIOkRhblwdU+P9wwsjvQNPDztlCLtg=;
        b=rba1c3p4a9ASvgce2AvXu7CMy3GbR9kCbe4BYpWYe/lLlnL+vXYgrfYLVtxSiCU4gk
         aL+bGLWAayqmNIQmv6Gq/wzdkCV+oLavPrvbYKjA6hDgp74VhCKUtn4AGBmVQovexWeQ
         Tm/hvZJxxbqghHFHO9vfs+P+EkckZcUmx+QX4FXEpiMPi2iYwa1cCqCAgypzzx9lflQh
         ME64zUPbFSv1vrqY3F6oQd3hWCyHOC1O1UAksTfl4CzcJrz+Td5s6+nCIBhEglesDDQN
         Mz1RmTxxOk2NJYJK/4C/SqtF94/2EJQoJAr6K/EXPX7FIPjEWtJ4jXZNw3b24p4poLNQ
         4uIw==
X-Forwarded-Encrypted: i=1; AKwUvBxYMqHTaZNgsvYOLGrZ0p6E+dRNyRcTR+LuBE3b7EnWj296oH/HRqbeA0/ucBLOFGSfjY0vKr049BSV70g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQjCfGGa8q3IAHJEm5jJtgcD78DojsMix52R6XXf868DZy+Wcg
	ITQiGGQIYto3FY6/61SocGwgIJ9+IGWuVTyFYxt15gS223JfRt1cJCpW
X-Gm-Gg: AYBFou23k0j3PzG1Z182cqWGhMMK97iqS5TTEnMl6BF5owoBg2Ew5VbCsJRDtsqt3k1
	tSEhoJ9Euchd5Dl+ZT5CVlJMBYowhyVbtJnfvJIZU8Gn1AibQEM/Zr2n2xvtEzixa/xllDr2z2U
	ktZPiikD2x52W0En9W8OXCsj4q6ceyzoEiRAeoPjjkoI3KUAduthlF8kxSoG5twBc3ospi4kj24
	ailsL6D8lSQIqTayeAQyRx3GavqWlf4phBOv92huuCDPhNjnlTZofgWtRAeFz1Trwpuhc+L2gWV
	8xvYVRCAYLTIIRdSBHcPGH8VrBzhVczovNE2QXUsK5FI9L71NLy0UYvf9BnTjeUbHBKNpzAzbbz
	H4yOKw52/IPDXMZZyzfExD4EEJfWB0kOLl1Vng+wLF/bN6QJhOeG5NqgM+Lx14mlKvnSKR1JhR+
	vfgYGQzpBNuA65PayLJ4enN5m5M48TlA3njAiW9Z3G2odirnaCDM0yhkKlkUkcQDG/gQua6lD5K
	WnLfypRwZb5O7kWU4Adwrlz8d65lgMjw/dWY0ogj0kVXZ5SwO3t9Yz7eE3+lHY8mDOOgDoD8NSZ
	UhKPxptWGf7j+EJRNbXcvTd+YJE2PhaaNxZU/r4W5jIZp/B+u7w1B/pL8i2D25QmTM+soTkcMGM
	HFymKW/ac8nlZhxWmNtiEC0ha7y/OzMvRMOLrlgto4mxlr9NH+Rx2pJkmB4XIxPo6uw4cIyemEZ
	TldVDLcBEL2uSPFYHPDA57kWzwikEceIeLMbWrlNSjzzxA/aWZLw==
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr122793835e9.8.1793452185480;
        Sat, 31 Oct 2026 06:09:45 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm196891285e9.2.2026.10.31.06.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:09:44 -0700 (PDT)
Date: Sat, 31 Oct 2026 14:09:42 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Marco Elver <elver@google.com>, Bradley Morgan <brads@mainlining.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] sched/core: Pause KCOV in __schedule()
Message-ID: <auXoWFzEuirP2IuC@gmail.com>
References: <20261005185803.39170-1-kmehltretter@gmail.com>
 <20261005185803.39170-5-kmehltretter@gmail.com>
 <20261030142354.bbc5e7f26fbfb6a8eee21290@linux-foundation.org>
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
In-Reply-To: <20261030142354.bbc5e7f26fbfb6a8eee21290@linux-foundation.org>

On Fri, Oct 30, 2026 at 02:23:54PM +0100, Andrew Morton wrote:
> 		__attribute__((no_instrument_function))
> 		__attribute__((__always_inline__))
> class_kcov_pause_t class_kcov_pause_constructor(void)
> {
> 		class_kcov_pause_t _t = { .lock = (void*)1 },
> 			*_T __attribute__((__unused__)) = &_t;
> 		_T->paused = __kcov_pause();
> 		return _t;
> }
> 
> Adding all this goop to core scheduler functions on non-KCOV kernels
> won't be terribly popular!
> 
> A bit of macro magic can trivially make all this go away for non-KCOV
> kernels.  The overhead is probably acceptable with CONFIG_KCOV=y
> kernels - seems it's only enabled for debug/research/fuzzing kernels.
> 
> Ditto the hrtimer change.  Aim to make these patches produce no change
> in generated code with CONFIG_KCOV=n.
> 

Good point. Leaving the guard outside #ifdef CONFIG_KCOV was an
oversight in v2. I will fix this and the hrtimer wrapper in v5.

Thanks,
Karl
