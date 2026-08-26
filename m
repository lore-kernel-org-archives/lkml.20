Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D436D35E1A2
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756459; cv=none; b=jdAI1GFv2OQuQcme1h0xujTj+ntsHg6QG+hgbuODkTlxyVbmIWRkiMMDnWm2spxVE0iBK7pAoRHIUh3bQyIEp+pko1kQMHFX5oc0CvUqpOOR5DoJaIWQIc+kvFyG8HpSM1zy9FnHnAcZHh2H7Yvow2vmRdFz7ssjDXAORBlL2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756459; c=relaxed/simple;
	bh=WP8pmyIzZMGnqAAFxWnpPPcF8QXlUAgmfmPPuHq62/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4VqUaAF6GwDqXqms84fFsdfw7JV6U5h3WoCjscQNsN+DJjVUx6AfLXnevmFaXYXSilQKLSqjFUCz4+Nlo1BfnuPTTz0KYyupvXQAv9QJUl7GfPgM8tkBf9kCClGcIyWIeMNLqjiPwpdC0Z5e/LABsM72ea/ELf32VLCVqyeXS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L/3KmGte; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L/3KmGte"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso1473409a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787756456; x=1788361256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJWAD9pdRAdWL1M/hPeKfzSnODYwRiZNjp79dFuoVMY=;
        b=L/3KmGteJAX+KeUzLU4vfs9GR8sKq8HvAZOs8LMdXq6YoHLQcOqZ0jAYdxo7WcZhyv
         FImYJPnnD/YWWRbPZDTbvHfITQj5w9SSUwwtPWWaC7ZTV4I/h511Bfwwi60I/MaUGdOI
         /OjgyRB6O71QruSEjLhFlcdQ4cEHtaljnh6CBNiY0S5EX5Xf9e6REGvwmZff8RSqo8Ha
         LgEuixobxA6l7uf0kDcbEH0ZPRxR1N1Q/W+SZYh4JUKcjudUePYxcmpZtG36Sit+5UtO
         18w+Z81VUdpLI4YwMzFo1iOhIkUPfJrW1KBISFRVauf+01e//9wXfkpTMQtmnwGD9u6N
         /Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756456; x=1788361256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJWAD9pdRAdWL1M/hPeKfzSnODYwRiZNjp79dFuoVMY=;
        b=CXO9GLS83ZL+1x33GTS3EUvRAhA66MQyCLXSPYxitqyYQEbffMG3kEFIlJ0nmU1nw1
         iRSu0A79lMpHYzPmp1MN1kE0JpoLLOu8F9/lHx6TYZBEO6Bn+gxO7N35KP7+KXgggiBD
         clnrCElRdyOGJc8l37ks9Lfk37rWtFoVLLpHocQAmqGx3defCV0AVo8TRmXf0KEW66j0
         Znc1nftWD8NoUMv4ikA/Wv1kJLKnBjQMYoR8+zPPlMKn28NQIJolLavUFUSCZZHw5BUm
         7BNPy5WT8nX/pYAaXeI9mVE5ehJogMyRwCZyy56s7b9feg0JDD1iv61KhfnS9fhBubYy
         yn6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkPYIY8g+KfC0AgjvW+xFkBmtVEOWRpoDv0VBwEWAM58fxustcBtB2isomL8IMv8+dNBIVEaFlXMz1i4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kVVlX5RDzYwQ5m7UO30A/n59nzjm8FM8bIpLIscdyqgSg+7Rnf
	IEWOfOVD9FALt/irHjkBJGnnaNYMY1ciHxHubOWIBSdU1YSauLL11rel6etJ4iNyGao=
X-Gm-Gg: AR+sD12pnjRq5V039jg5xo/XukWqBsfbiHfG38x3tBwdypK9Ptg1wA+q3wTl/h1DfIP
	DV5C00TgQprwaGOKB6euYD+ebiKliD4YHwTRSm6zxfAEjop3L+XFqF3cyFqt9GsQFYFdQ0OGAhc
	bpkJPW7iiTYRIYTv7XC+uezIAiOEbUXGDMVVqnIcH13EubnH1oxgID5ejdUI7TSUAPsBLa+cu7L
	+BQh4nxeJVZjxboRWRTbQ8j7ZtFLypDkoBluLa2p72lcqlt/hCcMWGX3w5zvQkInJE3X89Zt6ra
	GXhBWXi5XdtotC1eg7MPABpcgS1JgeZf49dSfBa8dCcLbglSn40kMntgWfurv+Etkitm/JJLAOA
	g2rhmGh3W19ROdMR//2xixJ0c7J/z7F/gaEKo8GogpcQkjkphzZ8xm1Ehki0zlD1oQIjn2sxO99
	q9qfYitshHKoFngokY9hPPNQrQwYuKmBwUxttKErmT62ugEh/e/G+UjSNZGDqGqg==
X-Received: by 2002:a05:6402:3811:b0:6a1:7825:5230 with SMTP id 4fb4d7f45d1cf-6a5df64f1bbmr11162378a12.16.1787756455810;
        Wed, 26 Aug 2026 08:00:55 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b625bsm5284365a12.6.2026.08.26.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:00:55 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:00:53 +0200
From: Petr Mladek <pmladek@suse.com>
To: Xiaochun Li <lixiaochun@open-hieco.net>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: Remove remaining boot consoles when a real
 console exists
Message-ID: <ao7_pW9r9sydNDID@pathway.suse.cz>
References: <20260821071721.178517-1-lixiaochun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821071721.178517-1-lixiaochun@open-hieco.net>

On Fri 2026-08-21 15:17:21, Xiaochun Li wrote:
> Boot consoles are temporary and should be removed once a real console is
> available. However, the late init cleanup currently only unregisters boot
> consoles that use init section memory. Other boot consoles are expected
> to be removed when the real preferred console is registered.
> 
> This does not cover cases where a real console has registered, but the
> boot console was not removed because the real console did not become the
> preferred console. For example, with multiple console= parameters using
> the same driver, a real 8250 console may be enabled while the early
> console remains registered. The result is duplicate printk output from
> both consoles.
> 
> In the mailing list discussion, two possible approaches were suggested
> to fix this problem [1]. This patch implements the first one: during
> printk_late_init(), check whether at least one real console is already
> registered. If so, unregister all remaining boot consoles. If no real
> console exists yet, keep the existing behavior and unregister only boot
> consoles that reference init section memory, avoiding a period with no
> console output while waiting for a deferred or modular real console.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Link: https://lore.kernel.org/lkml/ahBsSW2bB2CRfW-k@pathway.suse.cz/ # [1]
> Signed-off-by: Xiaochun Li <lixiaochun@open-hieco.net>

The patch looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

The patch looks ready for linux-next. I am going to wait one week
for more potential feedback. Then I will push it to printk/linux.git
unless anyone complains in the meantime.

Best Regards,
Petr
