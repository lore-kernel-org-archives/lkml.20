Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5064E3EE8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543081; cv=none; b=SKa5JUgOfDwmWrleOT7vuIBJKti/HAKSoPtKmdFzpBPTf3ZT7GNhU6Nm8yXBMwYcppUC1mNgl5XUfvBu6YHm8tl8H4KhZNka232hzojbMJF84q4oqc61Pql7YtITQVOwNkwlRyjw0XqEXzlRS5jStxywDHNMC0dHTIIccUUZFi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543081; c=relaxed/simple;
	bh=1o6KRoN44DSCBsEysacGHYHuD0OPx3QcKtHFyX8sd4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMnZaJQ08RUQ94xyx6u1PqlHyzBqGERzAjs5Jfwe+iuyLsVbVesqdhyQtqCNuwRDPUa/OrUnmRsprtO2/Wy9+tssUaedaM4PIPfTyrISIZEZQcE4TmuF8psWKIU3l0yPTUSPTRn4/GsYVRo7bz76SMsxzvDHug+Z0pgwG2GjGLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DxxcnajC; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DxxcnajC"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4af173320f9so1001185b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788543077; x=1789147877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZOIo2HEBu3h7pqrMStXOScgEdgGJQw6u08wXyRcXzU=;
        b=DxxcnajC0he1SOcAFrrSuAfXyZv4oOA8yvbURCKp8Vvku4CTKqu3dG+FomGWlcBBYN
         vle9M6Vy+Dr8D7iE4yic42ZcoRy61lbZJFVlpKvSxrX7/xAg/S827ZfADe3G0okllIOx
         fNY+OYkw17dUULwPOW7GZY84Idw3NTdY73Iqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543077; x=1789147877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZOIo2HEBu3h7pqrMStXOScgEdgGJQw6u08wXyRcXzU=;
        b=sFscEQX07IIlLddl+rj04AfTFQSKeoY5VBUjw76LmO5I8co7bcTc4e8cl5A686TiRp
         45cscjZEUyIuIPUQ9aYARh9MoTslcdXFgb1d5ObuaIapnCwY9Gpwu5DsgFzjhILP+1c9
         HtB8f48vcRaVpr5uiI79sO89+taESUVMJwGio3+7WAFwrFJ1WrrKpCc4FrQmFSCdrvP6
         ZRQAxM98/stKoQMjvXJrXjY7vcRPNT7GD2QHrxlxZYhXlGtzGo3wG/QdlNipDgsItPf+
         tatRs6HrdjDZFGCDUOYE8rDlpM0WKbtCn+xUblwO03JB1u6IOWuc2Qh331YYmh3LpmsA
         uDsA==
X-Gm-Message-State: AFuF++kYJHagVvKG+DqxQj5ERFvbmpJun04i2/yK1+lAZ9ab1xNYVoer
	cnBFIPVpZ3ge6pKes1v5mXfLz/VLNOiXubSMKNgqIZ58qdmOA1buPCdqZ3IvaEJlkdQ=
X-Gm-Gg: AYBFou1ObGO+3nF6kbVLz4c+iSZbfEZC4C/hkwyCxqE3IIaVtgtd70C+se14uz8/DCw
	rmnKJUjtWWrAK3h6U9f4MX62F9pY2Y9K5EhPOH0ChfatF6xMbqES71N10AhQHJF283XOVnDu8bI
	7QtXX2F9nfP6pJtj2ONkYGYwj5ZhPwCz2JlLoPKEPMiyuJtPKnxoMwDrcosHGYKxZgrlH88UX96
	rZSG+XhpPLKpqY6f/K+sYRzYcah9udAo4tB6Mmvd7kjOeHy3K3c6yY1ui93MGJZufwZfUW59Pje
	7Xg+VxpQrxlmFhwMxOXM98rj+HXrWQo/qiRPi18PvV0vqZ7DWJ40Q5WZHo3E1kWBWsdpy7X4NAr
	idSNXqXaiFitYOwY7nfzbluiEhSzsPvo3unm8GlSXds/whNjlUHK9bjrSHB0tpqBls2XSA4jhGr
	X3siBeogcOyqc4LQ7oXKfjY2G6NA68+mKithBzFZAQNQgOR7kn7i+XSaiA8oSMLXkIVN04
X-Received: by 2002:a05:6808:67c6:b0:4b3:880a:f08d with SMTP id 5614622812f47-4b9622c002amr5220754b6e.11.1788543077130;
        Fri, 04 Sep 2026 10:31:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d23c8dsm2733250b6e.5.2026.09.04.10.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 10:31:15 -0700 (PDT)
Message-ID: <f1b5ae1c-f6cd-4f9f-9143-4bdd3b8c2b46@linuxfoundation.org>
Date: Fri, 4 Sep 2026 11:31:13 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpupower: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Renninger
 <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
 "John B. Wyatt IV" <jwyatt@redhat.com>, John Kacur <jkacur@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260904124005.3270-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260904124005.3270-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 06:40, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

> 
> Assisted-by: Cursor:claude-opus-5

Why do you need AI assistance to fix typos found by checkpatch.pl?
How did Cursor:claude-opus-5 assist you?

> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c | 4 ++--
>   tools/power/cpupower/utils/idle_monitor/mperf_monitor.c    | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
> index e8b3841d5c0f..b15371e3e6bd 100644
> --- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
> +++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
> @@ -72,7 +72,7 @@ void print_n_spaces(int n)
>   }
>   
>   /*s is filled with left and right spaces
> - *to make its length atleast n+1
> + *to make its length at least n+1
>    */
>   int fill_string_with_spaces(char *s, int n)
>   {
> @@ -263,7 +263,7 @@ static void parse_monitor_param(char *param)
>   			 "try -l option\n"), param);
>   		exit(EXIT_FAILURE);
>   	}
> -	/* Override detected/registerd monitors array with requested one */
> +	/* Override detected/registered monitors array with requested one */
>   	memcpy(monitors, tmp_mons,
>   		sizeof(struct cpuidle_monitor *) * MONITORS_MAX);
>   	avail_monitors = hits;
> diff --git a/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c b/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
> index 5ae02c3d5b64..62b8cfb02040 100644
> --- a/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
> +++ b/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
> @@ -276,7 +276,7 @@ static int init_maxfreq_mode(void)
>   	    cpupower_cpu_info.vendor == X86_VENDOR_HYGON) {
>   		/* MSR_AMD_HWCR tells us whether TSC runs at P0/mperf
>   		 * freq.
> -		 * A test whether hwcr is accessable/available would be:
> +		 * A test whether hwcr is accessible/available would be:
>   		 * (cpupower_cpu_info.family > 0x10 ||
>   		 *   cpupower_cpu_info.family == 0x10 &&
>   		 *   cpupower_cpu_info.model >= 0x2))

thanks,
-- Shuah
