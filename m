Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431369;
	b=uQZyWeGtkgyCNuxhvN5pFVinxmr/aZ/ujc9QTZ99Ug7usOtfyhjREfKjXMBOW9O8QRtB
	 Gvv3DdMK4N5crUVzbqGK4TEozW60cjIfywCm9DXg6RhK1EaGRihmtcmi/IhKydHcM3+km
	 kqznHgH34uD1woLNXi3QC1HA45VsBpEtYdVh44uFthj2PnCHSLa5ZBsuWBM/jMYtIxTTS
	 AiQa6RnfF42k3w/wv5UF7DSQVHexKiQ/U91suiVYu9iMjXKmUQc3MuybFmUkTupgKpfyF
	 dGSRHtLHqYX7dodM9tU1y0YH0zMQ4Z//c9+f2XEMjca0x141JPvElgU3ZtQ/j+Jv/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HOWMPxhd4f93QJar5jGD1zCLcJhCkyttJ4OvEo5q/4Y=;
	b=Ip+H8YJYzAoRjAdhhVGxqkq5O+EqV+8pRG9skCA05hQwYshTYnXdtRtgylkEW7d49Pvj
	 mHvcFc8mHFhLZJMMJqzeMMPChrLTHGZumXNlfPPpE8BAAWUwUKbMcUnd365CadBSXIjOz
	 MyWkpNLcRDgUPKP4s9PYhRjOT7B5oSHN+vC51VQmJsPb3KGWJeeDI1Yucehe78NQo1y4d
	 TuhXu4RtO6FLSCu4QQ4SGpkzGfN5M1jPDbBjLVCROGywGcYZyrSrXBACvgev27OPXfMX9
	 /Byf6ono0FtU+UiC6vVg/lNlvA/EdfhSfOhaRiHIwlyHbpiGOYL9AudlyLwGoW6+7mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=okonski.org;
	spf=none smtp.mailfrom=okonski.org;
	dkim=pass header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=lHNCFgLO;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A1606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29A1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=okonski.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okonski.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=lHNCFgLO
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so3359330a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okonski-org.20251104.gappssmtp.com; s=20251104; t=1792431362; x=1793036162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HOWMPxhd4f93QJar5jGD1zCLcJhCkyttJ4OvEo5q/4Y=;
        b=lHNCFgLOhZw1suFu2q2t9UrH6IdJbQiG14s4vxAgBzqtqbmzJ9VbJDLpB6i0DMhhFt
         F61s2N/0s4aAsvbR64ZwciQoc95mi3clQm4uafNxUwZF9XRoc7KN5qbNILoYWpoCJnM4
         eqnVAINPlQFn+JlKUc7u9Yw3mlt+Mgsvhh/cHP1zLbjJVXXxvqtvhhRmO5P7DeLfAnai
         wd9llXdSdN/vg7MfGZg9otSYjql+sCIyy6takZ7bibn12yyDb+ahOygsC14TJiy1ysai
         wWyC51g4B1w5h9smBnIS+s7ROkqTPWiH4ax0seFl+mK1reCRn6WOr9iDX/UeUyUlppYk
         duJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431362; x=1793036162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOWMPxhd4f93QJar5jGD1zCLcJhCkyttJ4OvEo5q/4Y=;
        b=mN3m3GUJ3biwmjqGXkbde5+IZ4FyuNgNUSe8oW4jcKO0vNuUY7FF278vDc5Y7XNg33
         0kGO3XcXgM7ogfpohWysH0x5xOAwxltuCEGJsDvYgUxEEy6o60MtGEev33xA6frs5/zz
         d2InNwRCxkTtd4xqRyUYKFZnKrT9dJ47bJ6WZpdI2Q6FgUYPv39BuompKrPU7ctcM0Ox
         GW6dLXf0gosezQhwKhrtHbCCW5yWfLySRvovzYzuEooHGZh8fAEd/OYPcEYta54V5r/x
         5hjZqYpEpH8xpmf9hSTQGAljcQ3GlYO2+0Iiju942p94H38ag7Z3NP6IPOotsAkQPeSL
         rYmw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ7vv114r6KK7m/e0iXWrL8B0lczJEWXTahFWzbEK6n+DKItOi6oHFbyXa8v4D8u7iQ9Anfe2b32Xl43Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKz/HLqRxyrVmvklZQ3CV5UeCxnsdMapX5y2j3K5g5q3XTj24PW
	MzKYEB/286WNVxvnikP+odURJWFta/55Kg7tui8qBG8F4DB3zrhce7ri6stBa40S80M=
X-Gm-Gg: AYBFou3A3QnC0yVYl4g1TWa8LPI4VuolmxBaXs9Zg7g5H9cjil0rW2/CHNldknfY5MY
	TTmIyKnQiEP+eUZwCrmVf8fZd/1N/0FWKE7vRBqTs9GrRiP0uI1N2ZCUmPwFPUHHTpX8p7c9v1J
	bDPzm3WaM6Uu2VZHch0dSFGIGHByX88nAU3SPUQ/FJq9ZxnpumUO0hmvqMgRstH9oSB6BevB7iw
	yIGX4vC0PeLKo7gJL5oeuBRX6/UBii6fdAhRDXW1aRavf+/55oTqLOfc3fFKqdlt0F1+O4hSSQ/
	l00Ib0OG0meoTNsjH9BXvzMqoXwAHMEoo/KeTj2hrVomUpq+yovTJWl5SRly3UyYBlhBG/G4Ncm
	doaiAxBG4f7HBWOsA05odSr2QqnJ8S4mgRP3DtFyy0noKjr7swEss3aQXfHNZ4uknAxIzoQbi+O
	AgwPGhMhgWHgbNf8Rn4ufQkVPcVIvKMbS0VQIGUqUk4fC+hL8kIOYUn2GdBsJTqJkh0n46waCGw
	iNPVEvd1QBdGpTeOneo4NUF67oslNaJvg4pPDhUxSw54F90Mrq8co7Ub9Nf1SnBRU6nIJ02m9P0
	aS6FfX5jkm71ZUQ78TiUrTOg+aIeFS5HkG4xUmg0xus=
X-Received: by 2002:a05:6402:1d54:b0:6b3:a1ad:ef80 with SMTP id 4fb4d7f45d1cf-6b3a8186202mr5025787a12.27.1792431361999;
        Mon, 19 Oct 2026 10:36:01 -0700 (PDT)
Received: from ?IPV6:2a02:21a0:10:748:1::2? ([2a02:21a0:10:748:1::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9da2sm4455871a12.31.2026.10.19.10.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 10:36:00 -0700 (PDT)
Message-ID: <f1d0fc39-6939-4fb3-a422-273cd5c347c4@okonski.org>
Date: Mon, 19 Oct 2026 19:35:58 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Vincent Guittot <vincent.guittot@linaro.org>,
 Mike Galbraith <efault@gmx.de>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org,
 longman@redhat.com, chenridong@huaweicloud.com, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 jstultz@google.com, kprateek.nayak@amd.com, qyousef@layalina.io
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
 <58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org>
 <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
 <atZM6uF0CqCNh__I@vingu-cube>
Content-Language: en-US
From: =?UTF-8?Q?Jakub_Oko=C5=84ski?= <jakub@okonski.org>
In-Reply-To: <atZM6uF0CqCNh__I@vingu-cube>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vincent,

Your patch fixes my cpu.idle test case.

On 10/19/26 19:01, Vincent Guittot wrote:
>  /*
> - * Preempt the current task with a newly woken task if needed:
> + * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> + * in the inverse case).
> + */
> +static bool wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity *pse)

This should return enum preempt_wakeup_action. But with that change, on
top of 7.3.0, it still regresses from 7.2.9 if you test with a nice 19
spinner in the same cgroup. I think it's incomplete.
