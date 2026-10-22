Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792647796;
	b=tfhxXcpnexMVcHtACJJUVh6e7UhEwqJGXfapgvfRrM5TCAxdE+2gtoeDREnd0ONY+SQ0
	 BoastPgei/rgDd+ZKfjLQ4MVCwEVR8hbUCj9Ml7xy4pPP3e1PcxWWM7VKQpclBKIe4luK
	 rWsL8TM7xR5RiJ5xHQ+Pl5+Xw7XxakcqpEXsWZYQyKTPlnE07ghUgBZo/vR0hWIiHeyZo
	 PVr3oFhUO8SYh/zlGIh/w2wqY8mNMkzweUwe2xiOJwAAyBqBt4eg9V8aW9xU7QDo905uG
	 yijYK0+Ps3bfoszQ5m3ytGv/ONCnMRMxY2Xe8syU+ncQbe6HGlsnqLOJZxX97fbw8vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792647796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1K/YYZH4czm1jU+b1K7rWbHbwEBfhgBh/2z0QlPDjh0=;
	b=AgwyPawFoYtszryj/XFESABfoRoIDppfbjSw8J/hACyg5qcA/2aePxfOAdadAnIdTPfF
	 svG1XVkwRHlF+jYyPUbQELqP2cLpTyjdEJSXYMC+O+iG74ML/46TUUHSAflWe1VlugbB6
	 wrtrJx0n2qM8G+I0xkHDrrpdAbwrTNHUZG1n89l/uqJQrUuvu30vAvEnNLg6A7gNFXuyG
	 ixxVaB5h0765FuPMsf79VVr4BONVQk3nVbZiLocSChFvKcoh7tf+wutrqyJk8ueGXtsQ8
	 GqnxmI5fL7Y35PX0Rdtv9bTRgRlV5CdADmsJryDydV9BXTCak7TEwtPgh/yitAs6OMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kH695NvC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kH695NvC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so14244815e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792647794; x=1793252594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1K/YYZH4czm1jU+b1K7rWbHbwEBfhgBh/2z0QlPDjh0=;
        b=kH695NvCG9gFq1sp3uzyLgfPBPtmHwYMyIQGGangMeXDiy/ULmRclmsZ6rZXEJ4Cj/
         diHRdEJG806caLTm85R4QAbARXRbAu69baxE5brcFkAFUlTadHLH0Ztb4TBL0IORHKQl
         CaU6dcKk3t0cabtyqfal7szBjRU6e7T7Vt7Vsnzf7eIAi1qydFqfW4soPFIsKRXR2W3e
         EP9UFoac7vKqpPtVgB+Ap7R/Z5prglndztLaImICh5ZuzyghFljDwWLn6B1FB7elYKfq
         0sdBzqc6Mpd3AIC0dvCXFBHpoF1fvz8A95zYU899Gghb+4XYdgGBpsuzJbXoDkd5F8tq
         q4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792647794; x=1793252594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1K/YYZH4czm1jU+b1K7rWbHbwEBfhgBh/2z0QlPDjh0=;
        b=ixubxNtDI2WbrDdjqoaKAm8mT+P5MXCdKN22qiTtr+Lidc2oNrCJlg8/sWbTwmJnMM
         gwYnH4xX758djal4jxbYb2mKO7/rQUc/iaELGiIEvR9p9SeExYzWevyZzSWukN9BXCaH
         qPhAJCU8UIoPGgVMd93tX/Pt/3s7mm8h2TAn/9NiYLobaWUgvB4ETKEovnQ2nZZtC7jK
         hL0xMyT1uLatKmay8/5PsYO6lVtXRKIgI3mITD9XTKxCSE0OVI+3fu/6yYtGGZK925/O
         4wlF9Z5/Y0MRlpbm74kv9j+/RNYl3H91+dUEXjPdCp52zkKV/Znwm9LUY4ASj6rfZevp
         amIg==
X-Forwarded-Encrypted: i=1; AKwUvBwK2xLm75v9IMFc6s/QEwsLvB8FyCnuYn6emOkMbKMhW30bqjK65lT3BGL9k0+94umrh9onDUQHbDi/gXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxiC+bs2F+197rWhRaW9v8H1KgZoyGjTmLhGAO41W790/Zk3qt
	D02TOW34x1My7SAy/lR6s8sOCkISy0o/zOB7wD6TwVuG30Q+zekG7590
X-Gm-Gg: AYBFou016qVuZkV1DzbOYk3mei94bvaZ+dT4bSx7vmRW5NSpAwtoMGZWYRB2KDUZOM6
	fqeYnmpZy7s4rasxGsv7cBBMt2xsFRVoBrtrN4ftPPUeD2jB3mjJJXTaEkxjRUghWYhCia6IRsB
	eTdxvgiU9N/D0hzm/FTN6l+W+M5/ZucexgqSCk5IaHGReBWeopYL4k7I/USXxE+5pMdkzfZl3Fn
	+H3sIv/ZY0dyFG/uRyvqjHqbd5CLZo1ebK23VaoGdUpIfncsa76kDbOLm1PkLJCyfVIjm6Ys4Ku
	S7aZ5Ov3WkPr6hTR5ApZa1gglXybG090fDscD5sL754e19uJirmnYK3nZBzRrzc34bas2gnXkFy
	in8DardDGHYVaUGhDQ3u0jX9a8tlchGHUszxeYtjuPNfM8Z6UYF7OlXFhM29e9qZzda6wE4DyNY
	d4aSTY7xuWOWmdd7SUg0dz4Uw6zlAiuoptvw3LH019PPSUy/3qXWhEH6FiXBtjokeFi7maNOZ3q
	MQi4ENHZ1Tu/GNK/ZhLwHvZWx0e0dnAFF7EBGU4LV1GoYoriVvFJvpTa+3xu+8NPjyWrzFbZZYk
	r6eU4YqxfSZjyHbDd+KCNmI1EtRO5xC64ma6dnqqvZZvRCSf73Eux9/21zuAjULQkbTAQF64DR2
	ih7+VBc3WrGGyJjiyugUg7xWT7ym+suQU/EPF5BlpNimtQaBtCTLBiqql4MgWVzQiUgMnUxtktB
	d0MQ==
X-Received: by 2002:a05:600c:4713:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1fd8a675emr87635575e9.1.1792647794024;
        Wed, 21 Oct 2026 22:43:14 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b4f9d9sm43385995e9.11.2026.10.21.22.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:43:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 07:43:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Jiri Wiesner <jwiesner@suse.de>, 
	Daniel J Blueman <daniel@quora.org>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] clocksource: delayed watchdog can mark TSC unstable
Message-ID: <atmhdRzqx5t8PYrc@gmail.com>
References: <20261010065509.72916-1-kmehltretter@gmail.com>
 <87a4oeerwm.ffs@fw13>
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
In-Reply-To: <87a4oeerwm.ffs@fw13>

On Thu, Oct 15, 2026 at 08:32:25PM +0100, Thomas Gleixner wrote:
> >   busybox-79 [000] ..s1. 15.168486: clocksource_watchdog <-call_timer_fn
> >   busybox-79 [000] .Ns.. 16.269726: clocksource_watchdog <-call_timer_fn
> >   busybox-79 [000] .Ns.. 16.269820: clocksource_watchdog <-call_timer_fn
> 
> I did not think about that scenario obvioulsy. The code is resilient
> against long intervals between two measurements, so the easy and
> straight forward fix is indeed what you (or the LLM) suggested.
> 
> Thanks,
> 
>         tglx
> ---
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -673,7 +673,7 @@ static void clocksource_watchdog(struct
>  
>  	/* Could have been rearmed by a stop/start cycle */
>  	if (!timer_pending(&watchdog_timer)) {
> -		watchdog_timer.expires += WATCHDOG_INTERVAL;
> +		watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
>  		add_timer_local(&watchdog_timer);
>  	}
>  }

Yes, I tested this change on v7.3-rc5 (72d3fcf802c4)

                              baseline   patched
TSC marked unstable           2/3 boots  0/3 boots
watchdog gaps below 250 ms    3/3 boots  0/3 boots
minimum traced gap            0.231 ms   505.484 ms

Each boot had four QEMU TCG vCPUs. I used PTRACE_ATTACH to
stop only the vCPU 0 TCG thread for 800 ms.

Thanks,
Karl
