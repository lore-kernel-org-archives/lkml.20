Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960802;
	b=vXQ4tUkPu7wK2Kh4AXOo1xhgI+48k+UW94wQtdk34Dbwkm5EkrOCFyYioEFggJOoHM0K
	 4syjcbX33UJV3fE8T0qTdINxE3CbWLX3BttZQzSsKLh7crCDsKrpP/hj+uHf0pXq5LJoc
	 GYT6vE+3ju6tG/D24HbzJ2C3LiRZqbGQQy51hbHJOlcrarENQR/B14V7F8fsh/HDAMwAE
	 wqJVAl+ZOBnWXmXMXHzaH9EVRJ1jhbKuvrWqQTIj2isEUd0DghZ+U4YUVdQwZl1+G9TsK
	 WStIu4/dh5gfZGCKV/KACsMR8HjIjuExumqehrEgXtI7XzB6vWS3lLLqw/QfK9AXamg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5SnQm8FyNQxZwAbJCgUjqGUAHNHa65Xtbn/htElEqBY=;
	b=Bh8MXGP1aeOc/cH5PWAbqfxy6+NaQn3XW2aslOKr+i5FkAlVGlgjuQCQZLF4vJW+DQhn
	 5q8QltJR+vXESs5HndohzZR6NlZhQo1ga2Oi9RWidDLam9yrJSfFDSp1UupqviY30jwLZ
	 OA19dnEYoh2YCbtdz1GQ29sMRDcZEhXA8r8nF+sqszHMTtdMBT1xv1C3eN/NKhqYAtovd
	 DiUDQ3NkqSzjIm0Fu0R7H8ja6id6g8K9jPctq8SLVjVibw8xjcPOSdxzsC1l0G8vGiJFs
	 53xDz4CNbQlw10259U27cUldZZluYuh3t+5ZkgJ1D+fVQPXqYU9Wp23dbw15Do6THhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=aeEtvROS;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B5606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671B5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=aeEtvROS
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so677933eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793960800; x=1794565600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SnQm8FyNQxZwAbJCgUjqGUAHNHa65Xtbn/htElEqBY=;
        b=aeEtvROSN+N9kdH+VhPWpAUl1ReBu8ymt8yfie255y6IcLtzVm1XLHh9OOg0Q2A/+b
         Dewvynl/IkBG8rNK7w3PtHhI3F1Na/4YpCGGl9x1VHy+i0JJDEqLLeSMEc2t2P9cYo8M
         jPL2ySXiRTsZzwBXqhMUHCv3bTk3v95pjqjX4HQdw3PvIYjdwmgppDUViPImQ7OboIB9
         NVHze8wYurNpXlxM21XKlqKLLAJhcIhJKmXsXznH1eNUTBBh8r+s7uLUpSBFXgiFhkxr
         qS5tg1ZuahcfjYksnKuTcBRa7ioJb8YKvwVdU1H6KCZ0WFk0MS8flmLJl3G9s1tjOTnk
         LYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960800; x=1794565600;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5SnQm8FyNQxZwAbJCgUjqGUAHNHa65Xtbn/htElEqBY=;
        b=zRx6/MM04eLVwqzJjXnm957VRrrXygKSGx9KtnYET4pOl4Ar1+uWWoGif/qMIaM3Pk
         fyfWqxLDulQfBILRx+jjufKF2ULO+r1K2Ot02ZNOHYrjzltV/xDBiah8sAa1qPOre7op
         fKjISdU8J+Cfzc+IIppf13keLQfoVXFyzHI78BwZUCK4DusZiirZ3TCYRFv81DJ5kLyO
         QA2J06KaMS6+Fkad3twdBMLyMHrK3vNayBgaOAHUfJUZfHRiuQa4K0rBxbfGNMVb63M1
         FZIzSoopWNkfMld9YdNDwXmddK0VqFMHNebleAqobPA7zeA4iIYQW43l2nH9xUHuINhT
         D5/w==
X-Forwarded-Encrypted: i=1; AL+hErEHBBRa/4IuNnHyIVtG0prdseJ+6AA924K5OCMdkW6ZwIOHGCdFMHZRZWUWvTcjq/Co5F1y6UrrgATSk24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GjWg184PCKsW/AbilhlE9eqnU1eM5XgTSxkFHIefrv72TtJEE
	yS6sPtmqOmz/t+CoBiCj5rho3VwxQxDwWXKD8tEdMsTp3ydDHeNvBCuq1ATJdf3qTWhzEls4SO6
	opPf+yguJrQ==
X-Gm-Gg: AYBFou3aXOp7GY1HXHNakZTIVEagmi/IeRTc9/oGO5H8T7uVMGfJmkXePqQ9pra8D5Q
	P7/eB8GAMmz3MCVjGLlk56vza5mlj0xXfSHV2UhL1G7qiY78j5D/q9NnGPqAqrQxsgRUEv8SBzC
	c0AMINRdSzDOe1UQG3kEgy9A+bLjFtn8poLYI50/TVq24TuA4UKiCcBeu5bNR6kQwLGouJX5Icu
	vrqmHRHg1KgB8XJK4BCiqUsF3WxhXjp1YGlKDyQNvdbG6qthCYa4HBkLqot1TCcEDnGRyFmAXJ2
	u8nWRPDP7lJzC34gSbcRhTW43Am+YlVZ99qLvGgSzyNgOE/4asLDKYvwLjaXpQwYZFBgTJueDsP
	fW2E32Krc/HZVO08t1+/fVa8Fqj4DayAD3iblRzr+Zja6XfCrjN9olcmK62j9o9tS4MdlqzPAnX
	zeEzP+Hr29w0ImbbBDzEYKyq02s4QeseyNnYP7I80HpXGRRqi/9pBYlZbGIiOTn3QR06iwf0zAu
	IwQBq8a5xhD1Cyy0EaU1mjVrvOmVEmjOehR+a4Cj+KbBiNRZVaxFJHWli7QVoJ4s6fY2hWAEq18
	ZpuNEUNePXZlK5pmJKNF8NZc5x8=
X-Received: by 2002:a05:693c:250a:b0:36c:c483:7077 with SMTP id 5a478bee46e88-36f75b1ffefmr2361493eec.14.1793960800111;
        Fri, 06 Nov 2026 02:26:40 -0800 (PST)
Received: from [192.168.1.107] ([203.221.253.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm11482680eec.3.2026.11.06.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:26:39 -0800 (PST)
From: Michael Ellerman <mpe@tenstorrent.com>
X-Google-Original-From: Michael Ellerman <mpe@kernel.org>
Message-ID: <9fada7bf-11b5-45b6-858d-4c6b79d6a507@kernel.org>
Date: Fri, 6 Nov 2026 21:26:34 +1100
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
Subject: Re: [PATCH] powerpc/watchdog: disable watchdog when watchdog_thresh=0
To: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>,
 maddy@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Cc: chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org
References: <20261104034018.2676750-1-luiz.capitulino@linux.dev>
Content-Language: en-US
In-Reply-To: <20261104034018.2676750-1-luiz.capitulino@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/26 2:40 pm, Luiz Capitulino (Red Hat) wrote:
> On powerpc, trying to disable the hardlockup detector with:
> 
>   # echo 0 > /proc/sys/kernel/watchdog_thresh
> 
> causes an immediate and endless hardlockup detection, eventually leading
> to an unusable system (splat example below).

...
> This condition is already checked in __lockup_detector_reconfigure() for
> the soft lockup detector and the arch-independent hardlockup detector,
> what's missing is powerpc performing the same check in start_watchdog().

Arguably setting watchdog_thresh to 0 should mean watchdog_enabled becomes false.
Then there wouldn't need to be extra checks for thresh == 0 anywhere.

But if the existing code already checks for thresh == 0 then this is fine.

> Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>
> ---
> Notes:
> - This issue was not discovered by AI. We have a new test-case in our CI that
>    sets watchdog_thresh=0, when running on powerpc we get the described issue
> - This issue was initially reproduced on Power10, but I developed the fix
>    on Power9 (which is what I have access now)
> 
>   arch/powerpc/kernel/watchdog.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 582ee3fd71c1..44f178e07531 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -487,6 +487,9 @@ static void start_watchdog(void *arg)
>   	if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
>   		return;
>   
> +	if (!watchdog_thresh)
> +		return;
> +
>   	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
>   		return;


Fix looks good to me.

Reviewed-by: Michael Ellerman <mpe@kernel.org>

cheers
