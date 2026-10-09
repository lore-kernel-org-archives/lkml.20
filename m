Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF77C5013A1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577710; cv=none; b=UDRW/vM4frlNiVJk+KaI0J91aYmZV8POqPc/0B1DwcGsgUdniQRHPANcq1a6HxC022YMFiyre+TSbT2QS/e448DftIKDTiSUKcZN6ZXPklB/FVGPIl4vQl2ylvY34X70BGXVZiPIIhiGQwc8lhMxiFmMk8U9cp521XvF4IgNVek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577710; c=relaxed/simple;
	bh=C1FpKwPdoC9SdVvTsyZs13W4SKhnWEvSVxLSBx00Bl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bOUterSQBtCwG/QdWJyfFUKVtW2dnyfThpzrw9X82HD0ZFmLZtjgTwTLcznYU60K/skxJ7PkwENobNhyZWVgydN1hXdW4uo+WTdJFlSQ82OIbk68lZjv9RZxqnymCNvDlF4cMCqS4CzmXtPJYeE/o7I0KQ5r7aoNgHznTotFmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HM2nT4sd; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HM2nT4sd"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso2803125ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791577705; x=1792182505; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMFAKZXIR0alBn74BYebm/J97bXNn5OnzcXKQbd8cJA=;
        b=HM2nT4sdD5PLmTHoscwsMCl3BAvXZPKGlUokEmhJEyLA4gbxqbBJF/1yt9S3Zegc+/
         u/4Sa/MQu3Xq0V6uIUJn7g744OD5SEOD4qwrqsfrxZVjMi8WbatiBp4GdQbdPlZjyHNf
         K/S9ga2deOsPeZAsHFLM64d4YhQfnSl3BJSKJBzPNin3J+jn3voBJl4pcHktqN9z8WHB
         I5YMDGrghyoj/f4dndrA6ohagTOFNe6RAlIZ8jVJ72xqJIPl7n9FOASwz8+ARgYhVAXr
         PKQIeF91apNj5I3ObZxyX6uTXGRFiPDH/4I4R5LNKgyaI8U2kAz1xRCl0ij7uXg8+CLq
         Kyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791577705; x=1792182505;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMFAKZXIR0alBn74BYebm/J97bXNn5OnzcXKQbd8cJA=;
        b=PNnsjuB4c3VmLjfZQg1I15wqSV7fxtDn3Y5rZB3XUiIFBq9UawUA2DU9CKy6H5jAvs
         c9ko+Jk8HlIoL87GCArHL8j5mCQovF1FFo9AFGZGU0islg6Gmn9t/OAaecKFS45SC6f0
         ZkXI6I/pBkjAzL00ohxcGPpmnbuOJg1ud33lXFBUbLZKBiQ+2JVUTo+t5G8z7PxxuBQp
         NDpendaKd5b2qBFt+4AU8SwFqpFxeiqc/Y8wprBD3K3Yz4ypTgA496l1WqrJyNymm0FK
         1Oi+lfgA7gQQjcBigm23xsyMK1nli9aVgnnG1ImjmmG+xh+L5wN6Y4oWYnCMPMBUakBB
         dtpg==
X-Forwarded-Encrypted: i=1; AKwUvBwAgMdA/9KsXDyvbG/k5H+BJ1PjXAJ6zyseKkBKvilPhR78TuSIxj8YsscpxzMWwUBd5IK4VTg1n16RiNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg8m+ExtOzXFM73kUtrwvtYqbU9LI62izgnMRoKYuB2R+nWuV1
	FvxqoK3W8cehcCNVo3LbUoeWfEOYzV2gTJT/5NeUXBO6XjnQ7h6MQki5Uw2Hh6HAySyJJ/nzvyD
	4r1xPYYH68wC4Hg==
X-Received: from plbms6.prod.google.com ([2002:a17:903:ac6:b0:2e8:43a8:2261])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d50a:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2e842f31562mr27667345ad.50.1791577704679;
 Fri, 09 Oct 2026 13:28:24 -0700 (PDT)
Date: Fri,  9 Oct 2026 13:28:07 -0700
In-Reply-To: <cce3cc5b-7942-4833-8ff2-8dc544ba45a2@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007234815.4026028-1-jmattson@google.com> <cce3cc5b-7942-4833-8ff2-8dc544ba45a2@amd.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009202812.2149137-1-jmattson@google.com>
Subject: Re: [PATCH] perf/amd/ibs: Clear stale IBS_{FETCH|OP}_CTL in
 perf_ibs_start() with CTL2[Dis]
From: Jim Mattson <jmattson@google.com>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Jim Mattson <jmattson@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Manali Shukla <manali.shukla@amd.com>, 
	Sandipan Das <sandipan.das@amd.com>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Yosry Ahmed <yosry@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 09:19:49AM +0530, Ravi Bangoria wrote:
> Since the additional disable bit in the independent control register
> eliminates the RMW write race, we can simplify the logic by removing
> the IBS_STARTED and IBS_STOPPED software states. However, we may still
> need to retain IBS_STOPPING, since ->stop() can race with NMIs, and
> NMIs also arrive with a delay.
>
> Can you please review this. I'll send a formal patch after testing
> it thoroughly.

Your approach also fixes the race, but I'm not convinced that it's an
improvement. There's a lot more complexity here.

[...]

> +	if (config & perf_ibs->valid_mask) {
> +		ctl = config;
> +		while (delay-- && ctl & perf_ibs->valid_mask) {
> +			udelay(1);
> +			rdmsrq(hwc->config_base, ctl);
> +		}
> +	}

This loop will time out when running in NMI context:

    perf_ibs_handle_irq() ->
      perf_event_overflow() ->
        __perf_event_overflow() ->
          __perf_event_account_interrupt() ->
            perf_event_throttle_group() ->
              perf_event_throttle() ->
                perf_ibs_stop() ->
                  perf_ibs_stop_dis() 

Should the loop just be skipped when in_nmi()?

[...]

> +	/* Catch delayed NMIs which arrives after disabling IBS PMUs. */
> +	if (ibs_caps & IBS_CAPS_DIS) {
> +		rdmsrq(perf_ibs->msr2, ctl2);
> +		if (ctl2 & perf_ibs->disable_mask) {
> +			rdmsrq(perf_ibs->msr, ctl);
> +			if (ctl & perf_ibs->valid_mask) {
> +				ctl &= ~(perf_ibs->enable_mask &
> +					 perf_ibs->valid_mask);

enable_mask and valid_mask are disjoint. Should '&' be '|'?

> +				wrmsrq(perf_ibs->msr, ctl);
> +				return 1;
> +			}
> +			return 0;
> +		}
> +

[...]

>       if (WARN_ON_ONCE(!event))

With IBS_CAPS_DIS, we are now treating CTL2[Dis] as authoritative on the
question of "is IBS idle." However, on the BSP after S3 resume or on any
LPU after an AE #VMEXIT from an SEV-ES/SNP guest with IBS virtualization
enabled, CTL2[Dis] will be reset to 0 and may no longer be authoritative.

> I think the intention is, host IBS should be disabled (could be from
> CTL2[Dis]) before running VMRUN. But I'll confirm with the HW team.

Another question for the HW team: can the hardware set CTL[Val], or change
CTL in any other way, after CTL2[Dis] has been set? The answer may
obviate the need for the 50us poll.

--jim
