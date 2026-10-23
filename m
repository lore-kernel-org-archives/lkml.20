Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765027;
	b=Y4Gnx9YAK0afVOuxaDptKhep8dOUV97xEqVFsAiEJzzzkKlt778vW7Vy3UrUjXxkl5HU
	 fZENPmCs7iEATFr/sUD3jK7zxzTb+KlfpILpgvnYL2qwK5uvqSpk5keO/bvenVV6RbzFb
	 YWkJ/Q/ge0mPYbFGa5xE2gZbWF/WODfqUvSjn8797po5hHmblfmaYEy9lHdJL59AzQK7/
	 ocEKSzMXfo3zzx1yzQaN4MpScgN9A1/EVlQjDGk4MKaLFtKnmkEb2+WuGOprHUddY8RZp
	 1pgldafDsiJx+frMZYkmvQMQW+ifcnyXqFufoxpkuNNdLQHpwTvep40lsqGq30+tpKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hspaebYZC3S45MqYVptIGDURC4EwLbHzPpd9+9VEq8s=;
	b=ByhWIUV0xy6OO4/cUesk9281oCj+x4mIGO93IkW3PfZCmnG5a1wCm9uKZFcPANEPaa/o
	 vGIJhi5RdUYVk/rdnhm688dr1VarmBLR6l90FWBlnmr9GeUqGJMScvE1hREAAnZll4icp
	 m/9V/oorzEpbcvFdVkHsJSGUXUldosGU+MTBDaNqR+0GpRTGZZhH8+d8cyALGpTvJDCl2
	 x7AjOzmARTdfyKM8xUTJc8TtQjDDVzmaFYnnRwdXugj5gootTLbtXC8tUWN/bYZ21ER8R
	 OnPmytKMBDjiAapVJw2yCO4wdbh8QSmmlph/3pYZU6tFKRO4GiyB9ggsX9o0+k7Ohrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O68aBwKw;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5177606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5177606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O68aBwKw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so3657315e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792765025; x=1793369825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hspaebYZC3S45MqYVptIGDURC4EwLbHzPpd9+9VEq8s=;
        b=O68aBwKwT4lmSyisPMObTM69j1fCC10H9lf1gp8FzavVlLDBGrwAtP2dm1dy738mSS
         /piszHGbCguwnsaFiKxLKphNNtLhcyh0o8nVHibATSN9Sm5l/PROsz5GF1r/PQv5FPqq
         0wXisOrad5tX/CxWCEBrFKvdWetL5Y3hOhFe3Q/Mc/zIF2Ff/xpMv6dXutB/2JkvK79a
         RPbpcI0fZ8yuB14pKOmDG5f2F3llA1rK5FfFC3/P5E4dPJiXoWRHoBy8Uph5rGHVYs86
         3xWy7JT5hS9HHBTSV6qiSOgDefye1N4awpId7VsNKvY/9pjG0Qkw1dBb0+95/DwFlwh3
         HNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765025; x=1793369825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hspaebYZC3S45MqYVptIGDURC4EwLbHzPpd9+9VEq8s=;
        b=AOewS8wvfJXocRkLdYC5mckhPG+sweXn6dwSSI7oMG5mN0FJM+sZFDVT84prTtjTnK
         i5sQXn84unaVVDOzHvAX/kI65EK3f5NYHvzfiJSHHipsSBigRUjOVoTx9N2XpzAJEz4C
         pT+6BMeoflbd8IlD/m0UeThzj6MfrLa2Y+SW0VfGPgz9+1AeD15879kGfqI/B0VowSi/
         FchIImDHor+q40/48WZzqwhSzvL+tZSdnSycq1NsoJ6H5hyMOgsbroA/3RpzBgjnRY/J
         KYbUkEG36KRM3AHY9FgPadfDM77pWqbXM5bDY8ytQx8Iskk/jQE1YyW4ALmmB+ZrF0AS
         UTmg==
X-Forwarded-Encrypted: i=1; AKwUvByInAYAwnY+ToIG9yHoS2rFy5RPUfVYza1rrkYoSAYgzE12drIg3bylQLoUg+K4WHFCFOroaiXYPGXovvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6DgiKrxptBHaMg5qm7sic6uNrYkFOh/Gssf+yu0uCXKJlvqhl
	sZzaWjyEJvBHRCQ5DS+ptGfhdAUMLfFJ6vUvkSHqap4LSq+IpxpRuXBzUJHSa8ikBdc=
X-Gm-Gg: AYBFou0XU1BKfwGVM84C4PwU7KQugt4OUvhuo3UfCh+lV8IApVbduNO83cWvAjvbnDM
	QAIXxbb4lnYqm9btHb20i7J3ipqIKTHg5NAx8x42AMK6gM/N4mSmXa1YphCJoVMCUmirN5cfZEL
	NY0cjGVqB+fAHPOx8d7OucegimCZZ36zqLWOqGT3TYPgpN8fDe/ZZ68USgycRSU7H6AZtPnI9Vo
	GwOG7152Yw88zRMEe7eixGQz/ygJ/2om/S/+mT5bEQfNtibimbMmyq6QRs3Kz4c+G9g3/6gfCU5
	3CpllCs3krkXZe9RmbSxHHbYRg99nRbXR5QDZ8SnmLthA05Q7X+qyoBQsUpv1wYNpnS74aAq5Ow
	9OKPcFwf0YChy3YdgVbjECHrqw5FmnjvwMowLspLfr2oLY2Lvj9H93i13+JqITGo+U/fAvbabGU
	7Pz87j7+3IisYRtqW6Rfqr4r/h4s4ZTP3Kznper42CnYstVZxvb47MRjC07pxF1pH6ogjbmPokW
	CUVC8CuYNehzAYO9x3Jk0clflsZ6dmYENbTlnKzO9jDHZCIENFoCf8SLA==
X-Received: by 2002:a05:600c:1d0a:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a211c7fbcamr41795835e9.1.1792765024225;
        Fri, 23 Oct 2026 07:17:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cda986dsm7997135e9.7.2026.10.23.07.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:17:03 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:17:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>
Cc: mbenes@suse.cz, jikos@kernel.org, joe.lawrence@redhat.com,
	jpoimboe@kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, sashiko-reviews@lists.linux.dev,
	shuah@kernel.org, song@kernel.org
Subject: Re: [PATCH v4 1/5] livepatch: Fail object initialization on
 duplicate patched function
Message-ID: <attsXfOPYrprACJw@pathway.suse.cz>
References: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
 <20261001043228.74946-1-x90613@gmail.com>
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
In-Reply-To: <20261001043228.74946-1-x90613@gmail.com>

On Thu 2026-10-01 12:32:28, Harry Hsu wrote:
> On Fri, 18 Sep 2026, Miroslav Benes wrote:
> 
> > Could we also check prev_func/func->nop in the check in
> > klp_init_object_loaded() and have a pass if true?
> 
> Thanks for the suggestion.
> 
> Yes, I've updated the check to skip the pair when both klp_funcs are
> nops. Two nops added by klp_add_nops() for replaced aliases are
> interchangeable, so an atomic replace patch that inherits nops for
> __do_sys_fork and __x64_sys_fork from two previous patches now loads
> fine. A non-nop func colliding with a nop (or another non-nop func)
> is still rejected, since the nop would land on top of the real
> replacement on ops->func_stack and silently disable it.
> 
> The incremental change on top of v4 1/5 is:
> 
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -894,6 +894,8 @@ static int klp_init_object_loaded(struct klp_patch *patch,
>  			if (prev_func == func)
>  				break;
>  			if (prev_func->old_func == func->old_func) {
> +				if (prev_func->nop && func->nop)
> +					continue;
>  				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
>  				       prev_func->old_name, func->old_name);
>  				return -EINVAL;
> 
> If this direction looks good, I'll resend the series. Petr, should I
> just bundle everything into a v5, or do you have changes on your side
> that I should wait for?

I am afraid that this is still not enough.

Problem:

It would work when the livepatch gets applied the nops are removed.

But it might cause problems when the transition gets reverted
in the middle. All processes should go back to use the previous
implementations (original code or previous livepatch).
But the ftrace handler would just go back from one nop to the other.


Solutions:

1. A solution would be to create only one not in the first place.

2. It seems that we are close to the scoped atomic replace feature.
   It will prevent loading conflicting livepatches in parallel.
   Well, it currently checks only the function names. We should
   add another another check which would detect the conflict
   also by the alias.


Best Regards,
Petr

PS: I am sorry for the late reply. This patchset is far from trivial
    because it handles several levels of "what will happen if"
    and makes my head spin. And it has lower priority because
    it handles corner cases.

    Also I always forget all the details before I get an answer.
    It seems that we are all in the same trap. ;-)
