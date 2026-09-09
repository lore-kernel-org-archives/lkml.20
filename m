Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235093546E5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788931494; cv=none; b=CG1zlfBV6NUJVOcz9FwEXUh7ryUAjUD1fFX6NIbWfM4+dM8LP03LB6MZc9vmZiZK1d4BpfNtd4LwKQ72H0BEQ7090dUqD1Jq9CZAdgr1qiU6iKkaqh3nCMHS7FHSo9cudWCguCsZY4uB6cdb31wVbyUmb4MSn2+wQiI1lWuPxO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788931494; c=relaxed/simple;
	bh=H4G9CkscD/oOxO5n+mSyd4C19vjSZpszhCK1nTAND9k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cFZkzvoDzlHyXbdr/ZabXv+/uGVxSAaCcSIWfCulDUjtP1A3bBfr/U9I0gUBWOjAVYqinGTAEpSamOsGxSE4rpgNm4PzfKIIjvj+CFrDYwGEEs1jIkQdasSTolQXOOqQnpa2/J2Zczecgr4JSUQUxKnQog59TFyNc1UnVoeFWeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3xMhQXi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3xMhQXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6451F1F00A3A;
	Wed,  9 Sep 2026 05:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788931492;
	bh=fTwmembWulALuJ+oSUQaZjAZLiSxf9G75gTaYNdeONU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=R3xMhQXiej9PLY9sKsP6oqMJfHd18O23R8yGBcfXwgXyV/NyhYAWrsA0Obixny48m
	 nQR3Uxh5ohlyVT9ef6Gpzaiclyuu22lcfRBDHgtOZHPBH60zgIvki4f42LXTMdMddT
	 cX0Hl9LCgCTjVi/3asfoJoKJcHn+Jcd4zEcb7QGk16GrhYD+UdHeqvPex1i3IOBCdD
	 slDJffP5EJcspeYPQoxKMyjw0l92qAGjl24wp6KJUFpibUnGylRIZ7fbai2dQgxfEf
	 qEEFGdYVInbNmQ/wrvigzRe+DVfz6xFrJhngHfd7zZmp8jypJmds7X206AAG8qQl1k
	 F/SUgvj8WMo9g==
Message-ID: <31a3ede9-3861-4837-a821-91cca14dd450@kernel.org>
Date: Wed, 9 Sep 2026 10:54:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH] arc: kernel: Fix clk reference leak in show_cpuinfo()
To: blaze <1466528493@qq.com>, vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_0F7ECDD4429624B3213BD758BED2F788490A@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_0F7ECDD4429624B3213BD758BED2F788490A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 10:12 AM, blaze wrote:
> In show_cpuinfo(), clk_get() acquires a reference to the CPU clock, but
> clk_put() is never called to release it. Since show_cpuinfo() is the
> seq_file show callback for /proc/cpuinfo, this causes a clock reference
> count leak every time /proc/cpuinfo is read.
>
> The frequency is extracted via clk_get_rate() into a local variable, so
> the clock reference can be safely released immediately after.
>
> Fix this by calling clk_put(cpu_clk) right after clk_get_rate().

Thx for the fix and right on time as I was queuing up changes.

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> Fixes: 98f2892607c5 ("ARC: [cpuinfo] Add clk info in /proc/cpuinfo")
> Signed-off-by: blaze<1466528493@qq.com>
> ---
>   arch/arc/kernel/setup.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index 0000000..1111111 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -593,6 +593,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>   				   cpu_id);
>   	} else {
>   		freq = clk_get_rate(cpu_clk);
> +		clk_put(cpu_clk);
>   	}
>   	if (freq)
>   		seq_printf(m, "CPU speed\t: %lu.%02lu Mhz\n",
> --
> 2.43.0
>

