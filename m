Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669482;
	b=DEAw6DE8kFmXru4K94VK16PJhFQNJdYNpxq6UdqpDcGxLbw0WoV7zB2QYbkxnZaFBXLy
	 QBsO5jV+ErIjnfUpIMByLnvNm8OoK8bayj79fdLt3N7DbD0Fourd+9d72QKrDg6zDqgvL
	 g/i6YpcpeWce0BUCaDocSKovqFs/+3XpNsbql75K1LKfNTcVlmeas6OmaLuLmbsDwJvIU
	 8RpobJKqhwQ3u3nAGX6vM1Yq1Xc9CZ51JwPcRH1CJvdHQGZGFH5O9s2SN6cc53r93XoLD
	 8ZoZF9SSnk4qNX7GhSxWdWVhJwzxpOwV91NGA/dFsd2Ti1OTg84XIY6S66md5CcT5sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VWgbZ4xbKtoA2aqGP09mPg1aludMi70xLgXzRieqEhI=;
	b=djELn5MxBFYbWyQN6w1miEvbdhTZUcyhGL2AdrFhUuTUkogzvjf/r9m3Fym0rssuJ17y
	 fBsSozxM5HZSvGjKuqHXBtkyvSemmIItANH1LSb+LrRN1fhWhNzSgDn1V70uyH6xUOQ9r
	 Tr7TMadu1AVpzW5RUcc+9epZG2qDAIm3+vYl0xgxIDbSFCMRO3XG2yVhkrP2Hq8sh+MHa
	 E+3DmsfSinRRxzneQiVVvlzkaA7idMLYqIZ7FXVoi4nRwoOdsjEvpp7LAccGRIZsc3EWj
	 To+cMgEY08g2R16BlhN1s1HAAZBknNcKUgsaqdDQal6PHHeYWvkmJn9m77zvJVqVOTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YPDnw6yt;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A4606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063A4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YPDnw6yt
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so31863085e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793669480; x=1794274280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWgbZ4xbKtoA2aqGP09mPg1aludMi70xLgXzRieqEhI=;
        b=YPDnw6ytzSQOOLde+/tXYwE6ZaayNrl6Kkw68Jw/jQFhioIFRit/LeIRTtgKe2hbB5
         WnZfJV6hvXJnWAnReQYo6FKhaFHGlXVkYUyEXJcl1ObaDmhWnv4hDh5cFhsm2AcHAd+o
         VgGifR/m5N0kN++ab7MVrU+Xkj0ihiyi0GQzWMod0xQXKgzFqABMskfP8kFuP4P5/S1D
         JD62JqccaSyW4YnlykDTBQSj1uJVviiYGAOh/+lQ5BorFj1RV5DFC8KqJqw5PlBFIsm6
         6C1wmy8vCxoit2mS7mZOulrB1B9y4XMqssoGBTvrt3hOISBpNbcOkdlQfN/Nw1MzrFm8
         1R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669480; x=1794274280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWgbZ4xbKtoA2aqGP09mPg1aludMi70xLgXzRieqEhI=;
        b=HW5a4ezx4uLZYaYcMvbLIN5GP40lak8aE7yft0xnrj/uERcmAQ3aWY3IrToN9Wd2/q
         EJZj5KAaa2RZxDb5BT9Eg79fxjq2Fp9/ozuIl+f4gH0S74vUh92rJJY+UF2AQ0zcUgYR
         VxHFLOBdU7t3isV3t9kN+sypM9HHaVs0jWiLuFecGiCv6qviA1b6dy5lNXrVj0NaYND5
         7UCYBM+gvht2YQ6G5vmfcpWOEwYSyCysvCp3y1FmpoQPUGx3uBCZ8UeN5PMAtCHF5UrT
         PFDvXR0fsczU5I1CShCnfSAz5VgUJhixSVpfxvs3pFt/T/t9y//UJ63PIRiEvoWGrCid
         Elwg==
X-Forwarded-Encrypted: i=1; AKwUvBy9iqHa5Y8Uj2BUDnIq/T10staX/zVnf4L6+V4ppYLYg8N9oxtqDkEPCpkweW23p9N3EJvbYEy7dL0317k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIzPDGa7Q//KqUmkvgamAKDpywyeByV/y04pT6pCmLY2MNTGQe
	msO7uB48iz8r0r04WY8L/h6GwoaHTeU7sOrDhhfsd02XgYVpsLYdjsx9PipI7U4R/3I=
X-Gm-Gg: AYBFou3b5HJ9T81ObFM2x0vW0p7J5Hy+iiW/vlSdpZjSH0m9MxHAlovCGqQE07c/eO+
	DA1k9ItTbMksIslmegsLBXrQ8JhLQ/XE5XZtyftYQKsak4lSHJjbk23g46O3dOnTBf46MsAQdxh
	WbdapZuJ8XkgZztDe3JTFvoK3aWuc+q/6VTJCgR+oqsAkIDiXPHYpKWY4iBNAcRMvN6lpNI2t3l
	oBI5NenUaKf00oNm1dyAXiv6vXnwMfvzwIDKZSTczZ1oqKHHcabZwr6HgDC3tm+DU/wFESDs9nH
	aLgINJpRr11dazghExCgi/EUG4FDRzHw/1sd3Sc5G7khy9PGwFwkUyt1zOdL+29VEBpForhHLk3
	ndG8DYwkemy+GTPSL1/6gIgHmKwgX7LzBV/nd+Hy83RddoyfQa3mWxQIexN/4oUnHKwWxDXBqqP
	fV7QR08TMrbDKNuSKyhIgb6+OOjds5r85SNUTLLuRhOlj05v8GlCRTV0kHUJFIfKK86nNEjWYwQ
	ArfgJg4656jRkjRKUrVmfh/qQ+ZfGYqEkttFaPdMW9xYSppp0weKzR/v9/rvbL2NWQBY+WLryd3
	C8EVFWfm724QSMgnUc6fKi6HSUxibx0H80b4mLEaoyfKnj/XU55iouvRKejnORi2bgeXkGeshOl
	nxsqSG4/um4Ny
X-Received: by 2002:a05:600c:348f:b0:4a2:be6:60aa with SMTP id 5b1f17b1804b1-4ac17d16b14mr270976345e9.10.1793669480420;
        Mon, 02 Nov 2026 17:31:20 -0800 (PST)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm21940496f8f.8.2026.11.02.17.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 17:31:19 -0800 (PST)
Message-ID: <bc97743f-5ceb-4ecd-8f3d-1b217eb9020f@layalina.io>
Date: Tue, 3 Nov 2026 01:31:17 +0000
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
Subject: Re: [PATCH] sched/cache: Don't use fits_capacity() to compare thread
 and CPU counts
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, peterz@infradead.org,
 mingo@kernel.org
Cc: tim.c.chen@linux.intel.com, yu.c.chen@intel.com,
 vincent.guittot@linaro.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
References: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 02:15, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> invalid_llc_nr() uses fits_capacity() to compare a thread count with a
> CPU count, only for its 20% margin.  Qais's series changes
> fits_capacity() to take a CPU number as its second argument, and this
> call would then pass the CPU count as a CPU number without a warning.
> 
> Give the check its own helper.  x * 5 < y * 4 is the same comparison as
> x * 1280 < y * 1024, so there is no functional change.
> 
> Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina.io/
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Thanks for the patch. LGTM, although I hope we can do better.

Reviewed-by: Qais Yousef <qyousef@layalina.io>

> ---
> This keeps the 20% margin.  Qais would rather not add hardcoded
> margins, and llc_aggr_tolerance already scales the LLC size here, so
> the margin could go, but that changes when a process stops being
> aggregated.  Tim, Chen Yu, would you drop it?

Tim, Chen,

From capacity comparisons, we had issues that we move too slowly or too fast in
some cases, that's why I was trying to remove this magic number.

I'd be surprised if this gives a global win.

Is this the best we can do? What is the problem you're working around here?

I see we have other magic like llc_aggr_tolerance and llc_imb_pct etc.

> 
>  kernel/sched/fair.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..dfd6528d18ee 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  	return false;
>  }
>  
> +/* Are the running threads (in SMT siblings) below ~80% of the LLC's CPUs? */
> +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> +{
> +	return nr_threads * 5 < (u64)nr_cpus * 4;
> +}
> +
>  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  			   int cpu)
>  {
> @@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  	if (scale == INT_MAX)
>  		return false;
>  
> -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
> -			(scale * per_cpu(sd_llc_size, cpu)));
> +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
> +			    scale * per_cpu(sd_llc_size, cpu));
>  }
>  
>  /*
> 
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8

