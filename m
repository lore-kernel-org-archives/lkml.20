Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657734;
	b=SHpvIf3rkp8NF2YOlKJ9f1/OyMVwDZLRsYBz1bqav1sXToS1CpEt33vHRLVuM1VK6nww
	 esiFvYRHqqsg4XQs3Zvs60zRy9XdXGmBUd8mPFV11BmogzMHMI4eAVjS8kccJzO903Wz6
	 LnBQrjKQ+lzhJETT9M4J3ZyVmy1IfIeRIW75a5betid4S3rd8uDtS5rUOuuuk1CvmSWVA
	 V49qM+xTaMVIiDeCJSo8cCy9lj/Y+uzLUAVKwnF9gROUFM8QG/xJHONQJ/MLqa5gwaXQI
	 zqhu90tJZz90bZDL2xuDKI4BNbNuH+2RSKz1fxlh0IYKGN0v1GKcgLLqyCu+skkBh4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657734;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=J+6bckCmK2lUIrFjTFxSh9bJ8iDzGwv9OEtw1h4sZho=;
	b=ShlYoU+OwI3GXSEmykZEq0+4iMbyjJ5f6qWL/FMU7AJ792gOOdHT/FKkTYWy7aNq9aaA
	 h4+ik9BOBNwAfVJzl3nSudQkkB4NP1pp5O3I6vV/Tm7LFIBoy9Kx+uZvOK3hZA2diqcBs
	 fMYQOonATMW1rOjlWmpzHuMKjhSAGsoOLELrJrBAYjwecAJqf+4AuywuUxKwn85KCPHlG
	 pSavovMR5hfkgoRTM0CzI1YFRhXL6X5OKj9/eJayzWgXv1sfdkOGq3chGrUYRQbY1Lzxv
	 bkH0rG0kfvyAN95Mx+ApvyirdxMlIoDzG//i1aeJko3MLx/tCjQLGi4PukjWCKx9u0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=murTgoPv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090C606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=murTgoPv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEB41F00A16;
	Mon,  2 Nov 2026 22:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657733;
	bh=J+6bckCmK2lUIrFjTFxSh9bJ8iDzGwv9OEtw1h4sZho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=murTgoPvHoDtVG4E3uaQu9/t6vhyLm79X0Y2luEuVpeTgDkUZ/H/zP/v0POF+JBGk
	 SNXr9JMd9ZNAJ+AFxMw2bUedIY7t5bIg2uswRTeWHDjG6PFzLJZpXarXYuBRThpgLX
	 iFRwpDEW2bbeP1nvdbWr48etnomdWPtyOQ85jW4Aufq8qFicgTUE1+w4zdXVk5+T9S
	 GWFtaD2jI1BPqIr8uNVg/XkcKcv6vs0bt3xbXwf0GKcLy4x8fWTweA/Lf3C7mkLlcX
	 F+OSZSiAf6IAPj1CydmgRyNlNSN3n+VeDNOry7yPRoU2MWVBARb/VPtStAiZ3w2Zk1
	 3Vj46Wulvqawg==
Date: Mon, 2 Nov 2026 23:15:30 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers/itimer: Preserve nonzero remaining time for
 active timers
Message-ID: <aukLgmXkPBneoMe8@pavilion.home>
References: <20261102070148.1064849-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102070148.1064849-2-thnkslprpt@gmail.com>

Le Mon, Nov 02, 2026 at 09:01:49AM +0200, Avi Weiss a écrit :
> itimer_get_remtime() preserves positive remainders below one
> microsecond, but struct timeval only stores whole microseconds.
> So, for example, the conversion to tv_usec truncates a 500 ns
> remainder to zero, causing getitimer(ITIMER_REAL) to report an
> active timer as disarmed.
> 
> Clamp active remainders below one microsecond to one microsecond
> so they remain nonzero after conversion.
> 
> Fixes: 2ff678b8da64 ("[PATCH] hrtimer: switch itimers to hrtimer")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  kernel/time/itimer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
> index 03a32dffc56c..a472a4f8babb 100644
> --- a/kernel/time/itimer.c
> +++ b/kernel/time/itimer.c
> @@ -36,7 +36,7 @@ static struct timespec64 itimer_get_remtime(struct hrtimer *timer)
>  	 * then we return 0 - which is correct.
>  	 */
>  	if (hrtimer_active(timer)) {
> -		if (rem <= 0)
> +		if (rem < NSEC_PER_USEC)
>  			rem = NSEC_PER_USEC;

Right, though at this point it can race with the hrtimer at any point.
But it makes sense to have.

Thanks.

>  	} else
>  		rem = 0;
> 
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> -- 
> 2.43.0
> 

-- 
Frederic Weisbecker
SUSE Labs
