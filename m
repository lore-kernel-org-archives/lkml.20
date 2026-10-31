Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793405157;
	b=HP7SCBbKmcpa6S2ubwOJHP+Wf4u9VO/Q3jhkRI31BDS9YJ4JqxQAuWKYS4DU6Nd4wCMI
	 hEuLuohcnOBfrcoWaNklZW1HB5RfiHDBUas2CJ4+JFUMl9SkHUS+ZoyRBfJGpwcKzXjN2
	 z1/1x4mpaOQC10RUMclmjAV5/LICbn3t9GDadGjSY0KborXwz62bn/+PkMJD+HTL9FxNk
	 NLqypJSBoOw/uZFmgIodpmqYE/YercBdkXOGXpEhWMXDvQKYwP4pFIASZBtovjzeT57Q5
	 gguoWbNsNCiAzRsNsLOn0++PONMs/sA5ybB6RJCnX0t3axSPS956daj5oQxD46bsSUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XOj2kx50KExaPhf12usP15/7ab/0W6fLqpQdDyiLVLo=;
	b=XUuhR5OQIb4cf3YNjK3XABZb29R/2ayvxk296bz0ZaB9kRH5Pg0RcCoyRCwlSUkXdPMx
	 Frzp1ixKFfdwKYrsZtGPbVH57IQl9eXT3B1ytgOw7XaljGvI8xlNL3AbNUsl55HQBXWMg
	 4HCbukq5x7j99SWywBuAKmvX8XI0sQZr24Ov/clbVYt+0CnHSwEmtzEA8EVnXUGXahX25
	 95mseS7zIimLoWWk8hbbLddl09FFfLITztr40wESN3wPexduFbwlDr2sVlk0b8TLP8LtL
	 I45T4tAUlS1EyvYxpxJq8Autxb8SaO6iEjr+EoVnI0PWoqNLtiItGUKjIPFTudiruLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OB0xVIhj;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF774606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF774606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OB0xVIhj
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso209629966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793405154; x=1794009954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOj2kx50KExaPhf12usP15/7ab/0W6fLqpQdDyiLVLo=;
        b=OB0xVIhjQih9Cn37BKn1Fi8ZMvff/bJNHpuBffW4xNKyATcsDTAOhX9sdFCqd8/ynE
         cVDtRs1jpcdU880p9bYnQ/2kwRL0oKCm+gClJcHEfH2ABaa/odhkh3iGNIVOtmttfAxm
         U+kXqFPfQhsgfKua757JQQIjS7/JQwOiJ4ulI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405154; x=1794009954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XOj2kx50KExaPhf12usP15/7ab/0W6fLqpQdDyiLVLo=;
        b=g9YFdQ7npv4iMBMabu2gwL8t1nXUNP9a+v3UlK07Cm6+RKnplFegXGflJFt5idRGeL
         xkMSjsZSt4ojkbRIe0yoUdrqWdIX8WI9UEoQOuGPFgtud0XqIUKg3FW1+EYcBdnZny4z
         3Ar3YY8kCJIsGUASBRyDATnlFOLBw04FKhYWv3nIsD15Vp/sBccBnfA/RLitdqgZa75v
         SRGHznu47teAjBEPVk4JBzfEvMkfxE5N0RHa+MDYGnDOGHm4HGdhMhsTmM911r4M61NQ
         iOGISgnRs/qledyFW6IACiVLlwEbzhBYWS+F5Zwv9I+vtDdN9M/vzApg3usxd6wseX9b
         srKA==
X-Gm-Message-State: AFq9FYK84QpGihTI4RWH+o15SUXBQeifbnGXL5B4AvbIChv+ARZw4LAq
	tCxg1RL2SAy0yI2X0Wn8/nFNGH2f14mtZweKMqVmUetKILU21kpiLYywqGZxm9xdilOMH2hZsFy
	cpAYWuuY=
X-Gm-Gg: AYBFou0J8zy4GFF2oFNtPG/3RuzO7OJ6laPSaDwrlfrEof2o8iduHmZ+m9geShwDMpX
	GEMmx6kZS0Jias2qwCWPlj5qOq7W3IcU0BeS543ol8mxq9e2CjYfC08P/9JCzWQ6WP/Ib1lToqh
	jXMpNrBC8vsfu1XPRYCd/ktIL5p+PWBfAdDJEwW2Z47sRLKE28vwH8JxSWsK9B3KHoLW8RCps22
	gtKpoxWh9gzA3XBzKGWdjCgb8+FEIi3mpWYB+8HYFPCvhg8xK8zyxcPYM4F9ox8xH8zePozJ7tP
	BcqkxCEbjl8TbarEAMnZ7fEi3aX9WvUQ/qEPKVvBGpW1exTQP0S7DlP4k3VjstvRPSsuNjZ19gW
	uH+lv5iwqb+BXkR3TBBZVjDG8A+VtwRTHUPTP9SFuspLq5Nu9L5oi8YfpV+MJR+xd/cS6f6cw5X
	EDrjtZScS47Cq103qZfbEqBHJJDzcUDspk9cjmqJYXrZL1JGNt2kLjPM04H497FvXh+jgdNM9Rb
	wRHoW1eloXLDAm9M7tU4cwkK0sUpsqgfqyTuJ4SvIpE5idpKZy70odEEeyRXeb4h/IG2qkHqIy4
	bNpKHoDie+2pC1FC7ibinTIKB+ab443jT2rNiQq7SsXvx42eKLCsJzGFE/9lw00d1FUVmUa21hj
	+qX8=
X-Received: by 2002:a17:906:f58f:b0:c35:3880:773b with SMTP id a640c23a62f3a-c4ca7ad101bmr342565966b.45.1793405153987;
        Fri, 30 Oct 2026 17:05:53 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f62esm118086966b.34.2026.10.30.17.05.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 17:05:53 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso206477966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:05:53 -0700 (PDT)
X-Received: by 2002:a17:907:d78a:b0:c33:cc6e:105a with SMTP id
 a640c23a62f3a-c4ca7a4f5b5mr343321266b.23.1793405153174; Fri, 30 Oct 2026
 17:05:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atSiuBt4n03_iQNW@gmail.com>
In-Reply-To: <atSiuBt4n03_iQNW@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2026 14:05:36 -1000
X-Gmail-Original-Message-ID: <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
X-Gm-Features: AclHuK-APOiwRDE7hIZoY7w5PGm2oNc9L34o8Z0G1ewjyuTei8gb6tAUrxu-pv8
Message-ID: <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
Subject: Re: [GIT PULL] Scheduler updates for v7.4
To: Ingo Molnar <mingo@kernel.org>, Stian Halseth <stian@itx.no>, 
	Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 00:43, Ingo Molnar <mingo@kernel.org> wrote:
>
> Please pull the latest sched/core Git tree from:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2026-10-18

So this seems to trigger for me on my laptop. Not every boot, but I've
seen it at least twice now:

> Stian Halseth (1):
>       sched/cputime: Don't account idle time twice after dyntick-idle

where the new WARN_ON_ONCE() triggers at boot, resulting in a splat like this

    now < tick_start
    WARNING: kernel/sched/cputime.c:481 at
kcpustat_dyntick_stop+0x82/0x90, CPU#2: swapper/2/0
    Modules linked in:
    CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted
7.3.0-19045-gb92f6e90cf05 #7 PREEMPT(lazy)
    Hardware name: Dell Inc. XPS 13 9380/0KTW76, BIOS 1.26.0 09/11/2023
    RIP: 0010:kcpustat_dyntick_stop+0x82/0x90
    Call Trace:
     <TASK>
     tick_nohz_idle_exit+0xaf/0x140
     do_idle+0x1f5/0x2e0
     cpu_startup_entry+0x20/0x30
     start_secondary+0xf0/0x120
     common_startup_64+0x13e/0x148
     </TASK>

I haven't tried to figure out why, I'm just notifying the guilty parties...

                Linus
