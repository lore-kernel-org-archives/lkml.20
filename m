Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794531700;
	b=qPrDcLd4K8oReNGp57EkHVL9BF6eF8LXX5dEhO/5V1K0Ltpnc/ktfWGQU5lFioFX0jlG
	 U2p0YY5yJjx4yZ8hecUL4hjHhABNtNOtN4XVt4vFB2WmgIC7zZq1fCw5K/xpD76yF/SUQ
	 hqXZRan2llW0u6Fm8gr3xlYYim7aY3D09yezlsq/USTAfxfQ9LSUhyVaLiKUsG9/ttHMz
	 cTj5wxHUTtAVsLHM3/VHr2b0oPgiX4zHZ9f4y+WMtvElGhLXLvVoxxceHwMlXOU1GiLtB
	 3PlNuYU+UaGisk6ac3P5ViewOXJbAFIiX2TauAIGaL2XVRAH9vOGUeqw6M+SrdX4lOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
	b=hCkxHqW8cvCPxIVngV3BYCkLZzW9ZM77W9m7SAXSQWXm3dTArS2c+AgH+nKhDkWsoUnt
	 XLWdewo6646IkQHAygFvuI3/FL4qXcDvVzqMUnLtZhkPu+cb7P7T1Z+YSx3IJEdQaxB44
	 uqr5WOy0wr+NK8+6Ye+DvS0DRlPxrnCr8x2s11E43ihYqbPc51bfwBVgMj6xWLy0TMQ/7
	 Q+MjSBQ1Q7EDFnSRcXIlFOvtBoosijgjqe0Io+L2PN/BPqRr+XMD6pstU4Kny8/DlRNQX
	 +MX7mWvapvFlrQIDUqgJwQGPPoaKgAGuElL+euuchJlrKsxAc49VqGn/6Ybg+XXiv2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=joelfernandes.org;
	spf=pass smtp.mailfrom=joelfernandes.org;
	dkim=pass header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=G1jbsG+S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05586606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05586606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=G1jbsG+S
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so1943695e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794531698; cv=none;
        d=google.com; s=arc-20260327;
        b=k5b6hG0iBcDGm7wMd73PMnWGa++niGgWQBCSaywLuHnmOqK8tEe6drJxet9yv7qEJf
         OoXIIM7h6Ui+x9KVx0i1TypVDNuyfqFkU/5rNQ/j779xyS/Y6VatXdHYe2nCh10JexF+
         n7mpNO97fOr7jvtV00zfTWxXKHI7pBMWH3DG0Qf003nyaD6hIJQpTWowVlr4rJ33xD/N
         u2oJSZNRIPdrJmyEowMYwF2hkIM3H5xOjw9iqAUdgGaD/rQ8zc0FM1SoKM7MQVt2QhjS
         wbAKX9++T07BJcgrLEhE6S84O6d3Rg5lN2o7GjwLql3/8jotQiXJO/F0dUulXDGlzDGp
         GWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
        fh=N9BrhhOJX6ly6mI7IZB5T5b0Wg1/kYTgr9/aJTVLGyU=;
        b=ovKAd66V8XBhKY//5udYIho6lWAJp9iXRrVqEBVPaACWx1TQTIsEpg0QrF+2jFu5Md
         ZDSQT+dyCApMNl6/xkSra4Ah9TnSdgAClnjf1XTtKWASFPeJfRt5oR/tvqev74a8aDq0
         r4U0CdpyhHihvBQwOnu/hE1RDkEa+SdaC7+4AEQuvJ50krQkno7mJmNX2IPKBN2eUDjx
         I4w5LUFAGcNTstqDuccGExjNBgUuw08z8c0HdZ+i4HVSnfmYYZoMfD0f2JhvlGOPGfK0
         zZn61MYLFdZALB6sZVucOHr3tSE0roYDRqxDaTCph1+HVgXY7uqnpNKuliTKxFXZXvFm
         pN0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1794531698; x=1795136498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
        b=G1jbsG+SSau2XzDeW1OBYgcZTEKbYsSnIFjCz5jzxju2YOgwgfGuinOztdcmDgtqWf
         gs2+QeCPNvtJ/fn1ygL0g7bEy34oR7Y0N3LEL4YlJ9fDk3GdFupL6jpH7jf55PP3vmfg
         a2MC+9Pbb3enm3e5qIZT7H9J+PCKaYqIYCk1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531698; x=1795136498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsqNy8x4lmXAXvHwF9gkwZoG25xYnfN0MsYpVbWeuyQ=;
        b=EbujbfHz7DhIFbJ8lCslzy1a0O72dGNdRbFCHYuIyYhxoDDEu99C4qzWt20YagCyn5
         pV7STe0fxLc7oliC96lla/d6LW7Lrs1+7RMQrWWhNVD/2OpHMKHFGXJpOLv/AUMbHPJL
         RYBwNUJBTm5tjqQu8Xk2t4sC/UQTSB7wt/T+X6NnoPuWIcK1ESPJV5IbHBLpdvpLYWY9
         sGaKFWYrobe4jKMuxDwTnPGrM4oM4UkXitN+ZnZT+Nij1CmbI02ADG5T3E7OJdanvznf
         0nwuQw4Y/dQ9CaqUss6pFsDE/stz87XJH71382F+L9iihJSWeQzEU7sNgTsTeWEqa/PP
         78Bg==
X-Gm-Message-State: APuU4Z+YU8NsN3UbtoPnJsVQ8wU0a85/8LrovCMOD3S6JSi8+UFuhO3h
	/9rBe83U9+KNgZolLRJO2W3KwSpUq95SK6s3jC2JGtsML63GexKjPZpC58T8ugWnTLkDx7lHyys
	+YSZoSattjmDS6Rn9JYb+htJmNoned2iXecaaBguaeQItr0cPnicY
X-Gm-Gg: AYBFou0hwj9vQqFDFneHPYLuSlaSP08QryWneCaYAMgWo98tTwZpgyxSCImtv/jM6Id
	07mZ0qZnba4Eb0ah84L9h2O7S+6l4XeosDYKYzrfUqbgZEue1belLzrL6Oq7DOYaQAy6skyBf0a
	DFB7aLAbqc5PcUmHyzCPupNi8m+ovnlQaQ4Bn9uC2ez3IWpPet1XHvw29fA1I4Qsz2KXC9ba4hq
	GTmwqF7TbaxydJ0CAoQ5O3Aqqq/ThZnPDbk3+JnCoQnZTPqaYlF77Zc3J7ZO4I9prY9M7mzlwXR
	bK10Gu3aHPlfdE8XpWN41CtW9HReAU8/41q70Cbz3LTfBFLV4/CKsd5nuXOOGkLkk3wgIpd1tGu
	4VNvXZ4EphM3TYFwMTodO1VbkFXxAZinoMQIt1XWJXYKyH8x8z9aPH2MotnI=
X-Received: by 2002:a05:600c:8b8c:b0:4a2:1197:1de0 with SMTP id
 5b1f17b1804b1-4bb55a7a460mr17515855e9.19.1794531698338; Thu, 12 Nov 2026
 17:01:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113004946.2758197-1-jfern@kernel.org> <20261113004946.2758197-5-jfern@kernel.org>
In-Reply-To: <20261113004946.2758197-5-jfern@kernel.org>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 12 Nov 2026 20:01:25 -0500
X-Gm-Features: AclHuK-BlMNbouTRIZA68HB056zVMIxCfaWWRZW7PBno_ghygL1wLUmiCANRO7s
Message-ID: <CAEXW_YTY1rjYH8FwvLvc1JbOQYDuXTP7BEE0a6eoRfu+-ZC6-g@mail.gmail.com>
Subject: Re: [PATCH for-v7.5 4/5] rcu-tasks: Use pr_debug() for callback
 contend/collapse messages
To: Joel Fernandes <jfern@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, rcu@vger.kernel.org, 
	Song Liu <song@kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:49=E2=80=AFPM Joel Fernandes <jfern@kernel.org> w=
rote:
>
> From: Song Liu <song@kernel.org>
>
> Commit 5de907d24919 ("rcu-tasks: Disable callback contend/collapse
> messages by default") added the rcupdate.rcu_task_collapse_debug module
> parameter to gate the three pr_info() messages that report RCU Tasks
> switching between CPU-0 and per-CPU callback queuing.
>
> The kernel already has a mechanism for debug-only messages that are off
> by default: pr_debug().  Use pr_debug() for these messages, and remove
> the rcu_task_collapse_debug module parameter, its documentation, and
> its boot-time announcement.
>
> The messages stay off by default.  On CONFIG_DYNAMIC_DEBUG=3Dy kernels,
> they can be enabled at boot with:
>
>   dyndbg=3D"file kernel/rcu/tasks.h +p"
>
> or at runtime with:
>
>   echo 'file kernel/rcu/tasks.h +p' > /proc/dynamic_debug/control
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Song Liu <song@kernel.org>
> Signed-off-by: Joel Fernandes <jfern@kernel.org>

Btw, even though I included this in the 'for-7.5', I am planning to
send it for 7.4-rc as we discussed, so please ignore it in this set.

thanks,

Joel Fernandes
