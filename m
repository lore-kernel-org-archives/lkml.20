Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447267;
	b=1hvfHvt6XMpaYFuwHETX15Gz40G0CwyA0r1c1pf/wbcMa8mJhl5fNMBdpY4LaW16eHwp
	 5oEbCiGO0wKxsxsXXmBqgEa/FCMPmJt5wEGsKWE4rtTfBuL9XL8FHN3k5ZPxgeyKfTF5f
	 YTCFLrfVo9RbgJs+YsvlncmuOhFb/Nxy/jY8SIPSW6+gmpW4//kkSahoLNsIKjINIda4a
	 Sg8TLVvxZPBxpaKhQqtIooGXklenkwhRSOKTN8d13L1ChLrdP0hbjBMY2HNu0u3iW45Qi
	 t5XMJaUvamEDQyAlOxS49UP/GHRz9VZrzmxHe+7+VieSl77zzj+EhBg/8iy5kdcZCZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3y75OJSM9/zxmcC64Ykr6WF/StKDRmUno9+CzVe16ow=;
	b=LrySWfYW8BJYnZho0PzSQadSwoXy9LVQD/vk1DIIgzuRxpZolNR0Lblxx3BRMSBmb+ZX
	 BL3/uBKgk8XyFfuXqUi3rxrnK04FkkyJZ+OUKoFLGu1TFNL952A392UKwguKnM4zx35mU
	 UA0zm5lCzwSRGcvbaVD0TBGn4oMsb//FfIb976QPo4TACD/Q3CtKVXCI7I7gfBoBYEX/E
	 oR2RDJtqwk9IW1SPU0oLwjCDNTnT3I+rrw4+AS6CHYmmQ+NeNnhmFuFfHovzrMUvsW5QW
	 mfr50bz42UYNTlxNLLeT0vQkoIn1j3CowrMiSps4RcfU6h9lA7zS378TYGfV0GeQqcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbvR2sjj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF0606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbvR2sjj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso5303415e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793447265; x=1794052065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3y75OJSM9/zxmcC64Ykr6WF/StKDRmUno9+CzVe16ow=;
        b=sbvR2sjj+ZhIsSY20xruwRefHxqUgPoICa9Km/YPa5eySj7hn/Vfx6zZ5rp5NrWBCn
         oRXLGeCjZf46s/MRhkL98Jse1zFnZJlop5hfbNJwJmmGZwU2Z5NmqVPYiCUA5mhKH9pG
         bmBHM8tGiKflxzhfxV844Ddg3o8cANxFP2luuymxh7dZsb+cA8Xeu+BBeiu6wqJrYp1B
         lCI61mAVHb2BKEn3k94AgtixnlQVbThLggHbbf2SgDl9O+NkIH7+ws+FL9QMjpYV7hZB
         EcJ4iiTI6U3de/SMNLhdPPE2RZ4d35epMxe8rH3qRs3Ov4yfO5vYy1gjRcQpq/j87zmQ
         +LHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793447265; x=1794052065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y75OJSM9/zxmcC64Ykr6WF/StKDRmUno9+CzVe16ow=;
        b=T9yc7qxY3+wbV+nmI1DRfS5F+6TRnCKY7Xl+c1AiFFHP+rEs4p7NufdoGpCKbi8mLL
         wQDDKi+G0iW7zxg1Kc+tuPzjQotBG/L5NdqLDnOiGoariPCYU1oqOwQ9yIeV9Z+owTX7
         clZryzr1oBX60ez7tE9FTKVTWsRzhZV49Ur46FStoa6eDUsxU6fic6D/ypkUO2nD1KWB
         FyXMqyJIKOQSckZYnyhFZMEYvjeYA5GKWVsAEvO/PGlNt4pW1YaAOmyWxahbh7jymUNv
         YzdTtxKN2N7Qg3/IMERv4ot8chNqbxJVGixx6DSfvqmDZ4UDZXWQaNKY4MdQ4bzLLAxQ
         1m1A==
X-Forwarded-Encrypted: i=1; AKwUvBxBcFy1F7c9xt9ClX6ylvPhdw0VQi7er5bqGgCd4/bk39CCNs4A+ovKfkxXzE3n8Iorp68yJOfJBe2y8s8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmIDkGNRaDeCC68eJVBcsNSIjgQI5mz46AymfTESdRopDqstmD
	V5SDWL1Qu9KqnM2vX9yX3Gp4sWgMd5F/7OCXCOvvFUveEinkcp7WT/9WXddB3w==
X-Gm-Gg: AYBFou1vgejz3WNu8hUt7fFEERtSUMj5Z3BKaePFB9IydjIieJj1g3zzOVNRep2zrmw
	dZ9hg54mHKMASCOjvBd3Mt77GW7aAb9a2zlbLgL68F7QuM3kJghIsQFgrGG2Q01+a24HC0sphj7
	/EKFxVv7yilXRQBbCvMjbxi2WMrSKg+eUeFyNgbQPs0Zre0nh4W3D4P9WpqmtfVCpOzqdiSv83j
	jbw9eb5iNJIWGf4EM1BG+Rp9/5tYrf6UdtFZVf+RjltnRuarGMe/qLmAEAQAXvoyl3Dw8CAy0CW
	XJyAUfBHpSLUDh2hg3wKKYN5+3lgSnqyAYRR6t7oPrt4yeR4ttvCrE2v6LmKkDEBjejs60RPwgw
	F3blJcGzPYoLJr7lso7wA66EhAy/6iRtF0+evpn5B0KH5ip7YXbVBZ5AyQsAHezRiElTY9YXoPi
	vDQjXbTMigKhcZjf3zN6IoXqPY50v0r3xu6iMYyuqyECv4V/XBDHM9t6Hy2JVY4bm40zCIlJzgT
	2Nk3FzUzBHdAmkKoFwZe4As7bkT3+OdM9fxuzT3nIiDLiK20jpqMCZG51P0MMaHl5DsmdibGcqo
	vV2UN1lfwgZT/jyF5qCfp4CyQKrImZoVrC3K14Y4rJP0GnkJGnk0/tX/
X-Received: by 2002:a05:600c:34c5:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4ac16acdfe0mr108560615e9.2.1793447264836;
        Sat, 31 Oct 2026 04:47:44 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm8374016f8f.9.2026.10.31.04.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:47:44 -0700 (PDT)
Date: Sat, 31 Oct 2026 14:47:41 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Stian Halseth <stian@itx.no>
Cc: Frederic Weisbecker <frederic@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Breno Leitao <leitao@debian.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cputime: Don't warn when the tick period starts
 after idle exit
Message-ID: <auW3XbhjMjakWAhT@scheduler.schedules>
References: <20261031081408.3378884-1-stian@itx.no>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031081408.3378884-1-stian@itx.no>

On Sat, Oct 31, 2026 at 09:14:07AM +0100, Stian Halseth wrote:
>  kernel/sched/cputime.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 9e0fb8633d823..17f3cbd5d403a 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -478,7 +478,12 @@ void kcpustat_dyntick_stop(u64 now, u64 tick_start)
>  			kc->idle_tick_overlap = 0;
>  		}
>  		tick_start = max(tick_start, kc->idle_dyntick_entry);
> -		if (!WARN_ON_ONCE(now < tick_start))
> +		/*
> +		 * After a switch from the jiffies clocksource the tick can be
> +		 * armed more than a tick ahead, so the period may not have
> +		 * started yet.
> +		 */
> +		if (now > tick_start)
>  			kc->idle_tick_overlap += now - tick_start;
>  		kcpustat_idle_stop(kc, now);
>  		kc->idle_dyntick = false;
> -- 
> 2.43.0


TICK_NSEC = 4

         switch
            |
            v
Real: 8 9 10 11 12 13 14 15 16 17 18

Time: 8 8 8  9  10 11 12 13 14 15 16

Tick: 8 8 8  8  10 10 10 10 10 10 16


So if we enter idle at real-12, and exit at real-13 this happens:

last_tick is 16, so last_tick - 4 = 12. But normally, last_tick needs to
be 14 and tick_start needs to be 10. Or am I missing something?

IDK if there is a better solution tho.
Maybe fixing it from the root would be better. If its even possible to do it
cleanly...


But this code works correct.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>



Thanks,

Kayra
