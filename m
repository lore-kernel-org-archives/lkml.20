Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039249;
	b=gRuqq/igj/uk/bLJz5vhPBeEgpi+pH8LHrY8fTmecQGvOph1ptLVla1Ck0Lh8GDTu2FG
	 oplxOOeCxoO1xrT8Urhws30B44+Hwk6+6aOr9RU9X3yLGPePgpXfDgog20T1VCGLiWQCD
	 lqv2RM1l5CCncP++JJZLsVt2EDNTt3IBRsYP9XBiQJWZ20GGH56QbjaFMpDGzEwEfZA45
	 hUxF5ohecMsdhFZ65UFF/Puey7kcJ03ufCtkVLVlbTudnBG5xRoGjWko++pQoasULoPzz
	 kw1y87j6RbjEtO3LNEiS3l3eIDx6Rs9Nfh0QJ/zzIK9hPD+HHFEzG7s/VhcMxbRTgcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7JqbkVq7GYaMRNusjcdgx+xn2VDbTvxJSvG0a9bBTdI=;
	b=pqcsHA2GegaHxSgjxWC4+Q07PwMcn7/rSdtZw5/D1mg077i+HxTxBPlwtDZVOPJK62Mw
	 XWUGujMxWE4Ymzc7PU5JOZDnEhIZ7qdzsjbIKVFDrHAxKHIwQD5wX87VmRlq6oRL6pIJz
	 Svz47SaYX3T8XX715uNPYdVQkhAKoxW1wuy6UZDktAFmsXClX+n7x0K7bXy136/iZoPYQ
	 0Z4tA+K3bCkdjGnvieFhHsSXQ/uhTR5Tb+/STysGrKqmt8nzMCS9hcMHXO+AU8+zkyZkv
	 bGcfjOrNOGRywimcGDBZkKMLOCga94HJGSwPoe58T8vJkfnK+5566h+iflUm13pPI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q7ISm7uT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E17A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E17A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q7ISm7uT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1894510f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793039247; x=1793644047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JqbkVq7GYaMRNusjcdgx+xn2VDbTvxJSvG0a9bBTdI=;
        b=q7ISm7uTWLJdZjZWlv+QJ3l73hoyRwWYc4x/gMr2HIlSAZaUN8FZb2CJC6ArEYnz5P
         4dhMWq6Rr7x0LXYMzI9zBFbn07gKwewb5wFXt3Cg299nMl+ysNICiXwD2k3Kg/ZPmboW
         FW4BOiv5T8gWU9603oo0Hzonx/eWnCwbOOHK0rFDLV3mUsRzpd1LA1GHSlJI/UK42BWG
         djmalSJGEnOCSOAGI1AdzXuClSXMcZZLaWzqXkX+Gz4yDYX9XWP8NBQs33h8Gi4eM+gT
         DMzBAGmQ/PvKq6LopsJgCgBm88IeWXG0kKO8T7XIti93wr+b7LRx9BTGJicrWXYBaFwR
         ZOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039247; x=1793644047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JqbkVq7GYaMRNusjcdgx+xn2VDbTvxJSvG0a9bBTdI=;
        b=ukNDcoWgfVD2ldIm5alacfvICYNxyWzBUPxnaEFGqHGw9Ui/EA4mSAPtcgPtHIDvNw
         U5yOIma9XJ4ZWjHPYdvmE2agWI8N3sTjSOpMrc8g5pSNIZQb7mQUz8oVudi4afbNE5O6
         jhVwNk+iBimwvrLEA9SA8YbF+8Yle2ehKjbPmdvb7qRCpaFbUlRzpAgOakutlakwLaHe
         RIC1Bl3k63wABxQbR+ktQIwg3qKu7ZKQgzvwrrCmzrJk6lkmsdNpZ6fa0uvxlpQDO2U2
         BHi/IxPhd6D7WJ0veXBKT9sYQysiTriCOOYRQxcGxEbgf48ZkeQ0ROwq5ir2qBJ9NTA4
         Opaw==
X-Forwarded-Encrypted: i=1; AKwUvBwt46lO2EQHFYeZIn+zMkTkhA1vFBxEE3aun7LNjBr+r3kfxpLA4Y/kFYGpYeYdY/RyNd7F1CNxbJMJRWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYImabxBpXXKxDICTZiePcgZST8CaYQctzlj2TagPxZTneCJTMDj
	isYKZUtYE9/LDxNssCn7CeI/ND5OOd9cGzUuXLYOUelwHJ0LaXykUFv+EVNiGLGxu6k=
X-Gm-Gg: AYBFou1ek/PxkHKSFMOwg4MLeEj6BhtjeG5l/Xv8kVMgwPBVs4jwS5P/o+AsHGg7cCt
	L+z+RYjTVoIW7rJYzbyyBPO05i9R/bz6NC1kZzXFIdRG/s28YiCYs1CbF7n4wsKvl+BTCSJxgY+
	WfSwW6LlwXZXQN0JrHOr+S7f7sHzIb4K/6KQLVPaoFvNIltLRC9iG9MfoTUq4b0Tcjyv4t5rtrQ
	Grkst5vhJ5Fthf9ke+6isf6jvOGH1bQbnuXryepOdK1a2+CLTl/fNtUvyGvQr9FNmKTwIS4zRu8
	vAYtm7etT/9zzxKGFrAiYLEvQUJinyzJGAeiRR06wkb+RVdtEUwKgyIm9RuFtInJW/+KL7ypXsJ
	l5+ILKJ27vJIKPRuKHkttiYo+l+ETtFxfy04jeUfzgSvcSBHwgXmbQUfHAD6SktIo2tdRM+ai3B
	AZzbOX0FgRYqHySVJRV57aZyV/drI8KinzzzuywSaIFVSSCn6y5ahilUBZ/L+Bd/IT0KzmIomJi
	m7m/Jy4L0Hnu7dQ8ykifmBXUlYdR2t4s9L8wPMBaC+Lf3UJmGYG4yMkKipF
X-Received: by 2002:a5d:5d10:0:b0:48d:e62f:db70 with SMTP id ffacd0b85a97d-48e3eb9c239mr14221106f8f.48.1793039247581;
        Mon, 26 Oct 2026 11:27:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm18177958f8f.1.2026.10.26.11.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:27:27 -0700 (PDT)
Message-ID: <297198e4-3179-4de6-b5c4-ede4faa92ebf@linaro.org>
Date: Mon, 26 Oct 2026 18:27:25 +0000
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
Subject: Re: [PATCH] perf print_insn: Include sys/types.h for ssize_t
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Andi Kleen <ak@linux.intel.com>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>
References: <20261026174535.3157580-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261026174535.3157580-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 17:45, Florian Fainelli wrote:
> print_insn.h declares fprintf_insn_asm() with an ssize_t return type but
> does not include the header defining that type. This causes builds where
> stdio.h does not provide ssize_t to fail when compiling util/print_insn.c:
> 
>    util/print_insn.h:21:1: error: unknown type name 'ssize_t'
> 
> Include sys/types.h so the header provides its own dependency for ssize_t.
> 
> Fixes: 218c200f677d ("perf script: Consolidate capstone print functions")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>   tools/perf/util/print_insn.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/util/print_insn.h b/tools/perf/util/print_insn.h
> index cefa5c5f246e..3de9438af9cd 100644
> --- a/tools/perf/util/print_insn.h
> +++ b/tools/perf/util/print_insn.h
> @@ -4,6 +4,7 @@
>   
>   #include <stddef.h>
>   #include <stdio.h>
> +#include <sys/types.h>
>   
>   #include <linux/types.h>
>   

Reviewed-by: James Clark <james.clark@linaro.org>

