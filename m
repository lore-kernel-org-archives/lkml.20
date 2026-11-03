Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699191;
	b=yf1OesWqy58qnVtU5BvOs8xk/J/3dubXIaKQBzIK5ZGuF2nw51vtB09ZS1+yFrkfNbKV
	 NxNTQUp2A15SF81iBRlkHldmHcGNiyKfUkyuXwNQ6lpd2/TOf9g2tpQlGkaBLTXhKHfa3
	 I9XKqHhEXs3ZiqGeYDnI3a6gzjHBQrZToBCWGBM41nXPoIwRyN6OXcPW0zkYt1beCWd5J
	 8XyHGBzVQbnpWN+BrU0wqiPotX4Iu/c0mZrl8KPdlk73V3WAd9iFVobj6/3ZHQgXNZyB9
	 Cz7u1viSVhA1+bebkxN4xPXSX5BvMNcNnP8A28TebEjXyFdjZmfTycmpjMVX6LVXhdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TfCJZBWlg9xCDMbP6EylNnsQT7dhfJ4NDHX5m8GEH5g=;
	b=rXl+YSubsh+kOro3jOFoU+5PRE4jj6/k0xtdpUTUvAnme3BQ5EDNZLKY4vFNCZH3Ijuy
	 rmp7MkP/9OOvSFVELTksbuh39oomzHuYY/QbDbh1bjBhracd6iUVgG7qgjFqSljpyZzQ+
	 NDz8P15oiZjTLKNAyL1rQaxoGARhNWcSy7ziVljZvWcg1HnMjtKfEKcUl+iatIr7XTJ9g
	 h686hCDngdWbmZRIAX7tcTij4ZmeCdjJUxpRro+o7qng7h8h2arX4m+PsZstSrMpwAOf6
	 hV2bIdJVVFu4Q1Zw3ifbxtIwWG05gEA5t1OSZT/nZFRamG0FquPEAMvf0TkFHXd50zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLaqA+su;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7BC60A2635
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7BC60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLaqA+su
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso576454e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699190; cv=none;
        d=google.com; s=arc-20260327;
        b=gCi8w2kVfPSBanNb7saIy+VDbmWzIBoYxP3Ra5Gc1Rwy7uofZEgPGgYDlA/vCXOIyF
         507s+vwS/4VPiOnGEYeBS2UYMo11b6RGoIqWc+LshDnvhxyawDjH+F1hjgcfbPMYhIwj
         F3GyOzS3602xCSEI0tRcqp1QxqUAJTIs1xPEVRyhHkkuPqEFV2CBJsKlbf2pmu8IprfL
         /gQqjtm7S+AZo4CUpCbprcGKP3Nw+EcSbe2VwH3fRCfjU5dymuxk52//1hgag3J07F2h
         MumI8PKvqT6oHnekxtlBslz6gElXP5m8TDnTvT+wlvfM4FAxFGXmc2NZCGGvI0XDlG6l
         e8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TfCJZBWlg9xCDMbP6EylNnsQT7dhfJ4NDHX5m8GEH5g=;
        fh=nvFshsTTgB77EJoBdH4z/Kvo3mibdTHfTtGHm6Wtyos=;
        b=BNQ52gtIjIM9x21r3pPo/psdveScIQPFPp2YYiwkcGNb89F6t90OayJagwffYicboT
         +d2f+dkkJgaST6wOcwbyn/XeS/UKY4T1i+1jm5tlkzF8JbB5psCMh9k/AMRH0G5kAlyl
         GHkPUSCN2nWwJsKeIQdSKQ/OCRNXI6qOBJtMMgoVRALsB2e+U+UWtmm85wO7tkeofnwT
         UM7lmsk5dSx698sfG/a8rW2ZWDICHPX4UoyOtpurC26s1Wj/CYRuAqlfeHVDuS6i8VaC
         U1GpLBpgU7rKzOyU5pj2ptoCqMH0YCUymr0A3fZQqqvcXTTBHUVVkFj+dCnW4LcRGd/y
         Nelg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699190; x=1794303990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfCJZBWlg9xCDMbP6EylNnsQT7dhfJ4NDHX5m8GEH5g=;
        b=eLaqA+sup3X22TEGdbkLsmVSRLhDS22iEq15Cb6kfValfNHvr1QfkYdIvzsDSMBSD6
         EsKdqWimU/06e7+1yYVkL7dSIKoyMms9X46qEAPheBnbAYqE+me+vYpNUZIM4qGFF3k2
         qec9ufcFhCainNUH8WYPo5Pi6XPuB0RkdrOlczQiV89u9nQ4vt/vhNDjog3nH8pybLnH
         HHfHShXjOzVTvez2lHcVuaDZpBIhtnfxZ7GyfwD9fyGKsacG7PFTEqKf2ZvT7fZqiQR1
         YVDc7R6nIGEonaSDV//efs1BE2kftZdcSSRF5j4KUoMbsm4LN65mvKTOHcj/mJSh5tSj
         k8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699190; x=1794303990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TfCJZBWlg9xCDMbP6EylNnsQT7dhfJ4NDHX5m8GEH5g=;
        b=PHg8IEvWR9uTyOPCqonr9S6D+Atey0C8zEsHilRqwPNSd/p0uklm6qDRn1nckWi8wG
         uEEROgpRmbrNwud/pUocH1Y+qupf348BUlSvL5Jk4xDfoKunklNEjb8zREPkJ9HUyawv
         C6LbYAWfh4IGUNusfqdU3w3Ui6W50Ena20/IxCgV6gT/xNWRn1v4xV8tILBEvAffDhN7
         8jV6hDW+/L2JrQhepoR/aHMae5k7QGICQTIkgoXyHd9TFaiTOFb9mlbzpioTjfkzeK68
         +Ggev/fLUQmkEbRsvehOErCTOBugSzwGIC/2zSIIQPdwNv5F5lddnKrTxNHpqT5vkH5k
         W/jQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/cMxQHVT/xCB2IhhPFkDiUoh1MqBgFHwYwuBx68r2EzRRnHSmKDPbU8U+fcUCKwZ83hJJDb9PFk+2EzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cD1Z53B4+Z+/7D6oCF8QAye36mOU3+XG0MVhjW9ElasjCpgsE
	YO+0oHM5ciX/fjRNaOrfF5XwKhLZsvc3a32u/JV+GGp6jzo2vYXbVe6NwVYLN6MvI3kVW7lhFfy
	ewkc9/XzmyhDN2b3ZEItb0M7/6EoCR8EbyGay
X-Gm-Gg: AYBFou16Z+r20N61ITr+nLf0CMkja6OntoljqCl6dMDs4olSDzKEaIrgTM5AVPUaNT7
	AisvqYKrX6yDamJpSCxwEegasuvbq7ckOggg/QSKUGROwq4vRMkcT9stxQRHIxfOOMiywUBodnP
	jEzSCozBzX9Hi/Z7R34YMYa6nhzswLmfMbhcF0ric848l/5DG2eMccKB7LO2bGWTHnNLXGGO6zI
	Ub0eAxZkPaIxk+0eMjdw8HQXtFFy1S13tIgAiMZE9Hsj1hrO/6hIDLSTuORusC+b2lhCBQUQGbd
	zInUy9KTmW3ro1MEBL27jajpvzACg4G36vdbH5c4Pa3cYPP25uAa3JsTkD3XCwMxHNmwcRh21X7
	e+w38ayAg4Xz91no0Dq+KYOB2CsU4CyJ5gjsGOj5BrT/XYOzhfJYa7tOxUnJ0cwQTbpya
X-Received: by 2002:a05:6512:4041:b0:5bf:d9b9:f06d with SMTP id
 2adb3069b0e04-5bfd9b9f1camr2951949e87.24.1793699189254; Tue, 03 Nov 2026
 01:46:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
 <37fb82ff-ed5d-41d7-91b7-afe4379a636c@linux.alibaba.com>
In-Reply-To: <37fb82ff-ed5d-41d7-91b7-afe4379a636c@linux.alibaba.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Tue, 3 Nov 2026 17:46:16 +0800
X-Gm-Features: AclHuK9dE_-Dxs5RLnz2KSOFKJG1TvonZoilixLFygN4m3vxm5vLKkyIbwwbr8I
Message-ID: <CANGjgdkx8DJLjD-j86p7pUqY+uNukSHqHyOFuMfK5YqSAX6knA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Tianchen Ding <dtcccc@linux.alibaba.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Mike Galbraith <efault@gmx.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tianchen, Mike,

Thanks for the suggestion. Disabling DELAY_ZERO also improves the
15-worker pipe-handoff case here.

I tested the same v7.3 kernel image across three fresh boots with
DELAY_ZERO on, off, and on again. Both 333238da9a19 and DELAY_DEQUEUE
were retained. I ran context_switch1_threads with -s 15 and -t 2 or
-t 15, keeping the native CORE affinity on the same eight P-cores.

Each entry below is the mean of nine runs, using the native 15-second
post-warmup measurement window. Throughput is in millions of handoffs/s:

  Workers     On A       Off       On B     Off vs. mean of On A/B
        2    1.156     1.159      1.158             +0.17%
       15    9.172    10.425      9.165            +13.70%

The largest within-boot CV was 0.60%. The 15-worker on-again baseline
was 0.08% below the first one.

GNU time's counters from the same calls, covering the whole invocation
including warmup, also show a change in switch types. At 15 workers,
the mean involuntary share of context switches was 0.36%, 41.48%, and
0.36% for on/off/on. These results are consistent with your handoff
explanation and Mike's point that the added accounting changes
DELAY_DEQUEUE's behavior, beyond the cost of the update itself.

Thanks,
Chengfeng



On Tue, 03 Nov 2026 15:07:41 +0800, Tianchen Ding
<dtcccc@linux.alibaba.com> wrote:
> Hi Chengfeng,
>
>
> We also observed a regression in a pipe-based context-switch benchmark and
> bisected it to commit 333238da9a19 ("sched: Update time before requeueing
> delayed entities").
>
> Our working explanation is that updating curr before calculating the delayed
> wakee's lag advances the runqueue's average virtual runtime. With DELAY_ZERO
> enabled, the wakee's positive lag is clipped to zero, triggering repositioning.
> With only curr and the wakee in the same cfs_rq, this can align the wakee's
> vruntime with curr's, making both tasks eligible.
>
> Curr can then retain the CPU through slice protection. With equal weights and
> slices, the wakee's newly assigned deadline can also be later than curr's
> remaining deadline.
>
> Before this commit, the wakee would commonly preempt curr after being woken by
> curr's pipe write, while curr remained runnable. After the commit, curr
> typically continues until its subsequent read finds the reply pipe empty, then
> blocks and voluntarily switches out. We believe this change is the main cause of
> the benchmark performance regression.
>
> We observed a throughput recovery after disabling DELAY_ZERO. It would be useful
> to try this with your benchmark as well.
>
> With 333238da9a19 retained, lag compensation on delayed requeue uses up-to-date
> runtime accounting. Should we consider making DELAY_ZERO default-off?
>
> Thanks.
