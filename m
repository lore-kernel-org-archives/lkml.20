Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CDB392825
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712102; cv=none; b=qrgTqEpmAvZoin9PF5PfNdk06AEZPnz3Xacj9ykYkunoOnSo5UWhkrc4Fs2zX7NeY7npLNolif1WxUKcYxmLx122T7+gnkFSPZ/yMoywodzAJ+XZHsn2caKc5F7WbWQWjPUIhAw0+U6ChRMPS54ym5lV+AZwvGN7Wuc4d/r0Ls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712102; c=relaxed/simple;
	bh=/nGkxKty64Zs6DIuCKy74U9spS8M0vXhXeCAVv7FlOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C9v1j0mzuJ+x63D29M+NSVCoPdEf/uBaQOG55whdVcJMR1EaYD9z7KaDYrfaH0mSiEX7C+1lnQw/98V1fbN49C8apYjEdCF2SUdE1ajwxm0dFt0F6OwJUwcZhk4UKZsoS0ctDDXESjjbSaVVfVYEXwBgR089RTUEUvg8ftbWVo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWxEN7wo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWxEN7wo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347161F000FF;
	Tue, 29 Sep 2026 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790712100;
	bh=fwwl1+905wNs5g8kPG9IHNJv53g18lsliWLvv+kSiMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bWxEN7wooSWbVX8Aju7GIqk3XR/HW+iLZw75WotULq5cKDu8fH2HaXKVqsUZo3xfn
	 z995yr/zsNQwbuMkj3x6cUHHOuR1tH2bIdmZe1Q/rLqeq8TTLlRPbR0ChejKKn3VNU
	 fTwzdUWAw5LKuDnnhUyRNKN/n4czvIkq3BlkeK89AOBP/Te4A0D0I8PEP8k5Jc4dIH
	 hYWE78pIG1HZn3QE9dn+zRn6pnBmEzSw4tkE1R4qcrF9eHNrsh0P9cyG9JbP8C0GBO
	 QPMOWHdF2vyJ1HIOGynLwvLc3XZ8i/pdI0NgR4mIjrpsAe+gHoLo/2XOAL4f6h528k
	 fyRh5487FRsdw==
From: Thomas Gleixner <tglx@kernel.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: Re: [PATCH] tick/sched: check skew_tick kernel parameter's validity
In-Reply-To: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
References: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
Date: Tue, 29 Sep 2026 22:01:35 +0200
Message-ID: <87ecebj080.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 29 2026 at 23:25, Sergey Shtylyov wrote:
> In skew_tick(), the result of get_option() call is ignored, so even if a
> value of the skew_tick kernel parameter was not specified (or specified
> as a list or range), the kernel won't complain. Add the missing check...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
>
> ---
> The patch is against the timers/nohz branch of the tip.git repo...
>
>  kernel/time/tick-sched.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index c1ee0b256445..34ceccdd49b5 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -1483,7 +1483,8 @@ static int sched_skew_tick;
>  
>  static int __init skew_tick(char *str)
>  {
> -	get_option(&str, &sched_skew_tick);
> +	if (get_option(&str, &sched_skew_tick) != 1)
> +		return -EINVAL;
>  
>  	return 0;
>  }

sched_skew_tick should be converted to bool and this function should
simply do:

       return kstrtobool(str, &sched_skew_tick);

And to make it complete, sched_skew_tick should be annotated with
ro_after_init.

Thanks,

        tglx
