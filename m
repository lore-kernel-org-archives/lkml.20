Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860851;
	b=X9xAVEUpETiTcUQN859j9Z4sRS8ddT+EK7jbktyE7ccSWQonPJgK9zHvEOOYzJ7L9Gb8
	 lquIh1i2Ky6Hl9fGYSsKJfmtzAyLG9h9jqZ6ahTZ2n2Z2g2UAEmto3j61AwhhxzYU15NK
	 iGXPDQU1N0c6ycObz51aASyNGv7p7zlCptDsoqkDJ/NaRYT5WZ7E7w4h5cHSGj1zPvA8L
	 WWXOSxgw2Pvo3M/8p3fJrbpeDEEsTYUszY6HHerdnTDylqEl0MFV9Yfpciqq/HpgbQn15
	 7X68TOnBhMmPRePtJ82JulRwWHtE0yvDL5MMaZ9MQ5v3F3U2q00cFK911qXY7nseQsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
	b=VvM6/vv/GCmX0mqY5t6F4Io99D4WuC1+c8tjHD5u6VglY+aTAO2P7iapvQNaXOPPGHF5
	 hKpE6k3dv2ExEM7DA/q9I3YkDeSKFDdEWvOvKDcyKP0vaG8oPfiWfjvPrIDom4aeQbS0q
	 96WzKJ8NcLj/hIQ7AeMUcLsxxgLKqn95Cqz7Mr9Bja3uo54sxndEiLC8QeP/0Ql8sN/s9
	 6tICyJ/4Ow/y7tykofZRgWGM0tRHhk6sF5eFsTjwVssL43ddo9CXzRChwWU64XZ27AW0F
	 y6I4r5yz4tlqT7XIbJg3XR3mqhVmrAZViGfpWgX3GQs1Mf7Fuyta7Gos+myyvDOksUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XUHueja7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B741F606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B741F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XUHueja7
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so34621915e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794860849; cv=none;
        d=google.com; s=arc-20260327;
        b=oQ1swLgBm8k7/KXhUBDxNsyBMTmttqnW6QjDoaqSxHOVXNLm5oi4kBb75Zgi1zDNkl
         XUUS2vQYR7x3x/zCZmCwBLdzsjf58O84tPwV61p//Mmfjmus9UsGo+PH+fAtqYjrvpW7
         6UYwJR6ahOeOvb5OjVso1vVLVAjGisO2WA0c4bIfaOa2U5GD5RcUmhaLVqC7ftmNTPnM
         BHRbVYb2dAYoyNDe8lCerpxOCHIcSRelEIaJpXnxfhBDW9aOqnBvm6R8IuBt0MUJWoTu
         A8zOwJUxRUShSf2xBRXGuRWxCNgZHXC3mWAzq0jrF5A8yPPY6RdeEJZYRD9fTqpaYHBA
         fZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
        fh=11zpcQ5vO4kEHm8i2PLIW7un2DcJnI8sI/NNAC7YY9I=;
        b=mtPkbfI+myPC69b0Pq9oYlBKqO5R+CulnMXBvZrdYrxTmJKutfIckartXYf1ORed4h
         Ln+aWjL/y57K3bH+KlFkBI8aGYcAto8NLMPYeFOtTba3juQy8xgez8eXxCDjsE8FWsFS
         xjzBcZu2oMDdKUJCiJfErjv0GJNVyNx7EBhv1MWtfR6gSRU2Iujid1eVlELDjC+59cDk
         HdgFhnwVi6SewbJeejP4VMcdZ6nKnFbUWIQWa3hxVYdezIFK00X2hA4+0lnzwtT4t60t
         OEj9cVSa1nIxGzvHlNktdMoWTqfHDKuUaO6S/vAQxrWt2eUXsdgH0sQcqwcvPBAHgR04
         k01g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794860849; x=1795465649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
        b=XUHueja7fTCl518TBN0YXy5rWl6MSwG9BZzfBI9+bRtqQqE4X1OWC6+wNzqJlOdS9i
         m20VOISd+lrIRLqiFsQL9ae7chJ+J6kWrnCbMhPX998AJQ6B/Mqf7EuywNJkRRSQiV+t
         EOqMgik16devK+xORUpdTF+dfNtqJnpu/2ghA1CaF5g+WQaKMgDS1DzgDtRl6lNRuU7/
         LodM89W0AYyKhpmG2TSgV4ejrIqDjIna+DVaSrIr8g/ROCeAdIzSmCZvOIyEhVKkKmWL
         UTVpQDpa4mNYj89vMATjIwvJdR/A7NUhM2gLnkXMDGGAox3mV3WZRYRez89hITqZs8Sv
         AsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860849; x=1795465649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
        b=ucv/jdPZmDIanx4lRkSy4g1LBoZtKf5j691ha9/sH4balin8ldhDXAn9Zx+C1lAbNw
         DOIP93HvCgKIaWCpjlFkQUq0qKc0ixr4yvDXFwDRqX1FBZGtFl1rhGH2KDG9mOzpIjx1
         9/Op96b2TR/yg7LZ3r1iFpsTtuZfYpBv9m4D5zfMOz9G7bYZNkdYjoIdP4CBm8VZ8uHY
         E8bDWFV24D0oJ9NUeA65IuZJPqGoLX/phwxuu+vSiLcdvbnAqxtnX/d0OMYW2tc2rXZ0
         YVCxHGdfPFEbZcjmU2i+w7BkM/xZppGvg9mUc4Qta8WpKWvLWQZd1AsbjrDgEbdC5U8U
         YyYA==
X-Forwarded-Encrypted: i=1; AL+hErEFyr9IufR2gQLli7SNxj9BORPnqH00wDIbFxQvOkdt0iQjJuHK2wIWYoHMdk9b5dqmguh11AW5s1XnpUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n0hsZ8WtwufVeBe5+AL0BulFAZS4sdRLaDu6o08RmXkNNYZoL
	CmEZJhM6p6IcG3zm/nlk73O1Ygse20HPfestLLfLSF+IkRAHb7vmmGakbB9HOvk7SHTC0pNGTSw
	MPHFxL8iZZUp9fy9ZM5fgtXigDLB8kIK4c/1yt7PiC3fSrLTnjjyqLQM=
X-Gm-Gg: AYBFou0p5NcerYoV8qEfYUjYjR+D21VOVrRRVzM93onqd+hGslAbsB1XheiatfnX+U/
	7oJEKddz9Zbny51fa0BK973R9alaVdYAGiQ4E+6DHrnpbp/kaHaJtiYPbS3SS8sz5qyRjqCuFSH
	lCCdaoO5EX8JQKFbNblqwrkHBQHvhvMvNKyryJbbKkOFsSavlh9ms6lO+olu8qmR96Tj20YGLV0
	5PqFC2ps/1en03zJxs6AAnWI8FhNZ2ydCgSy/DwxXTHx/wYxGLtC9nyjwIFoxzQPpTI0Rwb6ei9
	/5zCXGeDwFHRnZzGr68VV/gUJsb5OBgKCAu6NUsznd4wBfRWSSdoV6/71Bx/YK/3uedjnnhbBsW
	OnBCcoyMwmOXmt+Gmj74jeLPveOo/VY7HhEN9OBRPSnldhlxeJa66SgZW0OV/TVfFtR9iYG9BuL
	ZFbMdK0Q6GbT3AZfVmv9Ldr0sEI5zD2nWDqUYxOnFzR1E58OboSgMMo7ylvvXOT2J7yW1Ymwypn
	CYRJjgX/N2SHSrH+hzFNay9MH7k07f8yczlm7cylcWqv1sxssMXTg==
X-Received: by 2002:a05:600c:46d5:b0:4a5:87b3:ddc1 with SMTP id
 5b1f17b1804b1-4bb55a8329amr246833655e9.13.1794860848685; Mon, 16 Nov 2026
 12:27:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 12:27:16 -0800
X-Gm-Features: Aa3M54pXKunFamkiknQGUyYNbbElkQwhbPGbBu1ME19Fs6k0HydAJH4S3zC-RSY
Message-ID: <CANDhNCrsMh-7njT9HhiSf2nhPNCzyEOf6PmzfGw45m0wBTXVcg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] sched/proxy: fixes for proxy execution, with selftests
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Hi John, Peter,
>
> This series fixes six problems of proxy execution, and adds a test
> module and a selftest for them. I found them while I looked at how
> SCHED_DEADLINE priority inheritance could move to proxy execution.

Hey Mathieu!
  Thanks so much for sending these out!  I've unfortunately been
completely underwater since LPC, so I've unfortunately not been able
to be very responsive on the list (and apologies also to everyone
who's sent patches or feedback to my last revision of the patch set).
But I have been collecting some fixes that have come up during this
time to include in my next submission. I think there is some overlap
in a few cases where we've both tried to fix the same problem, I'll
try to get some quick feedback on your patches and see what I can pull
into my pending set as well here.

I'm really excited for the additional test cases!

Thanks so much again!
-john
