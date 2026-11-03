Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712886;
	b=zhvItv1rJlkVZ3Az3rGcH0sLCoUX9idRLAjCsJY6CD1DEby7Yioc+YN2U4wx4y8ZwiIb
	 oQfj3CF9h6QWj/i8ocj21t6a8d4FjQYo9dT4uaP5DFKoF3zrBGjJHJdiRfqmhqVu86L4y
	 euxu4ok0WRR9AwQ9K4/gxb6AQs/O5dvnmjdaAACTy3mx5WEZgfgZr0iIm1kWuKROOvsWc
	 mWVxNktF4DA9lPz0PVnzHUN+qWcSbG4HYE0kFRULk3TCNS+7ej8U+PEQBF4Uan5WahoNH
	 NRMhsU1gqeFAhQe6apS2NH1Zie90+D31MgpAaYseTeVNpxqCeBNL/JTAPKLmft9GL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712886;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=HWSAH/we9gNIK2OmlcyS7PqFPDaQMokJUJolmwC8Sew=;
	b=BZ/LhoWd1zU1G8bnxTo98JjDXbH5ohl9ps11/hgP4fjvTjUIgRqPtOUYs5tGHEBfiEIG
	 YCiAd+BZd8a45HaX9ce4GB7ZlyS2rGtz0h8BZKSdvEXOleqmxT69vJB9n3h75IApOtJ54
	 c1KA2rMPM8sc7WUIf0TgQdhNL+yRWGOmYPp4rHXie2mDBQOf1fCp7iH9XZ/UXvWAub6HX
	 GbcN42ezANj/5WC25QCqZ+udm0U7dT2f5Qa5FeXIhntNnNj6HEn+ijbREOkr4Cg2DkYH0
	 gBMWf7e4ArOkSjtyBmgkq/42FuQLuf8L60EdYj7h4Mdzlh5vU5cB+Qb0TaMXJ7M2tAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mEflP7i/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F6606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEflP7i/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DD51F000C1;
	Tue,  3 Nov 2026 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793712885;
	bh=HWSAH/we9gNIK2OmlcyS7PqFPDaQMokJUJolmwC8Sew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mEflP7i/cXbnXx4pbAjMEMm+KNF+J1JFZqL86MsfMNqhWs8pzbW1c4kqWvEMM9r7T
	 Yk94uldKLtKuwIuWen+Zh5149fNUYbHAJ/ZsXXL5yvZ1kZvgeYXxkTiz10QY7D38qN
	 ZPdqOb3PiPhVKR77Jpyf2KTCQTuiZUwhHTngsM2S5pCdX6SA62UVWb5ijz0j57yVK2
	 MA5M8WZ5+VZp9QTMWjOFrvaH0SjCUDKkwQ+rKVSYG+q30iqnzKn/ooz27OgbZQWKFv
	 i8gNxpyiIimO8fv3xK9lWCk/fABB2IKQihcvcU1SseY6II0hCpUbjUtPV1QE9Q/RGc
	 qL7L+McUB4bJA==
Date: Tue, 3 Nov 2026 14:34:42 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: anna-maria@linutronix.de, tglx@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers: Stop hrtimer queue traversal after seq_file
 overflow
Message-ID: <auni8vp1hOge-G9I@localhost.localdomain>
References: <20261103103438.2154751-2-thnkslprpt@gmail.com>
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
In-Reply-To: <20261103103438.2154751-2-thnkslprpt@gmail.com>

Le Tue, Nov 03, 2026 at 12:34:39PM +0200, Avi Weiss a écrit :
> When /proc/timer_list overflows its seq_file buffer, seq_file retries
> formatting with a larger buffer. print_active_timers() nevertheless
> continues scanning the remaining hrtimers, restarting its quadratic
> traversal even though the overflowing attempt will be discarded.
> 
> Stop traversing at next_one when the seq_file has overflowed. Preserve
> the SysRq console path, which passes a NULL seq_file pointer.
> 
> In a (virtual) two-CPU KVM guest with 2,048 timerfds pinned to one CPU,
> median reader CPU time for a complete /proc/timer_list read fell from
> 51.1 ms to 14.6 ms. Repeated tests showed no material slowdown for
> non-overflowing reads (13.7us before versus 13.8 after). Short reads,
> seek-to-start, and SysRq-Q tests also look fine.
> 
> Fixes: 289f480af87e ("[PATCH] Add debugging feature /proc/timer_list")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  kernel/time/timer_list.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
> index 0406bf4488e9..84275b6cd2c9 100644
> --- a/kernel/time/timer_list.c
> +++ b/kernel/time/timer_list.c
> @@ -64,6 +64,8 @@ static void print_active_timers(struct seq_file *m, struct hrtimer_clock_base *b
>  	unsigned long flags;
>  
>  next_one:
> +	if (m && seq_has_overflowed(m))
> +		return;

But it's harmless, right? I mean the bad outcome is just to spend useless cycles
seeking and storing?

Still probably makes sense though.

>  	i = 0;
>  
>  	touch_nmi_watchdog();
> -- 
> 2.43.0
> 

-- 
Frederic Weisbecker
SUSE Labs
