Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039123;
	b=ZBHEbOA9j8X9oRkskZ8SrpdtHnYHV9eBnWNSDdCe7t9Ahtvx5fdGHFUapRF6TBOWHD+k
	 ZUmi+QaEhrHyn+C7mDfm3HM0QTF/Wf3yy5lG7ty/l7tct7heLqGlyUBkwC3OoVAUOqxYG
	 KzAZj/Es6gb2IzYh8KhMApWX5dcJecmX65odjC9zASnVgsbFMc7+IiNbDyKK3my2bjFLK
	 LaRgIL6AIA4wmzmm8y1aZ60JzmfGeqte+7zWhCMyuTUKuJ/GZ2+Kq96IoH1DYjd91dp0O
	 9ohp9/SHrwEP1oEmNVsQ6zOausX1oeFEAKR1FXYYpPedjSjsNPwB2EKtS16z68++v+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vdBCJ/vLKHby2bGb6OC+NMtqwV//jUE1DYJZoK8t+Oo=;
	b=F+S8Mi2/xcFJAv8KImYsY3vKiHPxEc5j1H23AYedQ9xCBrlo25i+FGq0ghpvNgn8BiOt
	 Sz80OHmFE8An48XXA1QBqpK7YDFfz1RXoLrE4yCnHPVzBDo/aQ6uB0P+eo42DugyTahCk
	 N7UuxLQfNzVQQ84AlgH3GUARkMrht78GpmkPeNpk1wY4oOZsVFOZM3ukqldIfTXRpmP0q
	 87Q45IuUHYGubzz+JoploX9OXIJSEz8h9incwMIH5qUvjWwG08Y1fZ4GN1456rOlxEP9a
	 yNjBkQAH5rrHY+AuaRc5zRm1zyB75FVuNSz+FRJZk9F+TbZrBP+KE0bHRD9eiKphvoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uqdoJbIH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFCC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFCC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uqdoJbIH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so12903105e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793039121; x=1793643921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdBCJ/vLKHby2bGb6OC+NMtqwV//jUE1DYJZoK8t+Oo=;
        b=uqdoJbIHCOeV5+pkDrrnEwqLxDTdGNxZovGcn3wqyFIL+kZ+hWgj9/E+mqmojnktyR
         UyNRGHcfzgnUjgag5bnd/m6E5nHT6UeEMXL14vUly8GFPgjLbsuzHvT1uRIypfmZicH9
         jzaTV5tIY2OEZQ/Fe5r5hcr9eqquKzUAi4u18Tq9AqEigV/7UAiGCb84SfQJrnYI/Oxp
         KB/ATw/+vKEhgdzPzcLvhcRQu0X5vcAgooHOqGmOHjx1yzRI35sqbH8YLPhmazmlYvqK
         nAjdoiLkUXbrZEbihG4AeRzk4fnK5SE0jJkGuyFcO22+lQn9V5nVlLtu5FKwZJMxRoYA
         ooNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039121; x=1793643921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdBCJ/vLKHby2bGb6OC+NMtqwV//jUE1DYJZoK8t+Oo=;
        b=o1ZbgmYHExABti4dAy8j9TG2By8PJMpf2VcJZvNyYZHNdqg/0CZOK72+cpTAs/CkTL
         2jtVY1F0P3956uRP834zyFY8NT7V/9cBmLl3ExDfRertOCrf/30pFCzNJ2NuUcmNJ7Gp
         q+eZunvqrm4Yl0oQc6KOlfHxIxHB8iTDkYFlEajY3evbim3+zJU7A9UEJLtxN651a+la
         CAA7kVyP8CpP5dsgimc67x7xdzfkcAgAnRznkkeD3oZmrijd8uTisAjT7LsJzEgYATtI
         8GHeKoNuHBmWf7a8KZGQNClcLlcxG/3Q5dodpf0CWd0ZBgwENzsIHMLNh8r2M6FjK2Oj
         lMvQ==
X-Forwarded-Encrypted: i=1; AKwUvByX4JJK6ZlcIev77bA3PnMUi2UrMelTwCi57A+7ynweL+A/eVs/Y5MEvAqNI1DrV8IpFY8Ot5O244KN4eY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFF81DNRYhtpKf8TqPTrmBA5/mA8ogXRFuUgUXs52Ok3Pq2IvR
	RE6G13AKuDcNbzYsZnax1HWDpmHNpy/jzuZVL+OJtCi5Wx/703ZTNhrX7r4Kwgvbdyk=
X-Gm-Gg: AYBFou3xpkqKkAbsdi3xaUbP80nJkG2h6U6jmy0FKwlSElOtLchCNctAyK0lLG5beyn
	1iObNE7wkuWd47gEqcm34UM2V7pKIIqTLgtrMv8Kg25vYMZo3G0OUknKVwnVR/nX9TDwnlcWxki
	RCkO1gdRrI4P03RmbpW+T8BlcuMZdIlUz9/kz6SNtMDU85BBbPUV1l83K496Pd2QW7zbeen8ZDl
	QlxjStYaZb7bCHL7sUQ67wfXrgo/+NwceznbXDNfOzZvdwojBbCenB7YTUrMeJXovk2EAsvcBRN
	t/xCmxAPg3bJEEJ04HN9/AVMwyNNKMvyN1n0Hm/OcAhp3dhRG6DyDa7iebDArrJ3ki5FfFXLxbu
	kSVHtpa3VeFCsReKk9yQtT78Y/6Y1DslHzS8sKrRAgclbR4bTaB5Rav4LbkK73XsC31UW5byBJy
	gpakPrzX3RsAL5NRgEKcoBrqthp3u/peTL6NKsbzrPd2mRKYJClia/NV+hpof7icwZfWwSqf/2r
	R0xYxSRpzSyWjqslqUcHQ1a4CYyk1fIUn2dDvF4+N1aiaQrr61n2nhcf8c9
X-Received: by 2002:a05:600c:8184:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a35aca6b82mr129661965e9.26.1793039120991;
        Mon, 26 Oct 2026 11:25:20 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0a9cafsm223451635e9.5.2026.10.26.11.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:25:20 -0700 (PDT)
Message-ID: <440f4ac1-28a3-42a1-a030-7a47b04c0d14@linaro.org>
Date: Mon, 26 Oct 2026 18:25:19 +0000
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
Subject: Re: [PATCH] perf parse-events: Include errno.h before kernel headers
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thomas Richter <tmricht@linux.ibm.com>,
 Faisal Bukhari <faisalbukhari523@gmail.com>,
 Qinxin Xia <xiaqinxin@huawei.com>, Thomas Falcon <thomas.falcon@intel.com>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>
References: <20261026174814.3158229-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261026174814.3158229-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 17:48, Florian Fainelli wrote:
> Building perf against uClibc fails in config_term_common():
> 
>    util/parse-events.c:954:30: error: 'ERANGE' undeclared
> 
> The kernel headers included before errno.h pull in asm/errno.h. uClibc's
> bits/errno.h undefines EDOM, EILSEQ and ERANGE before including
> linux/errno.h, but the kernel header include guards prevent these macros
> from being defined again.
> 
> Include errno.h before the kernel headers so ERANGE remains defined.
> 
> Fixes: 6b9c0261b3fb ("perf record: Add ratio-to-prev term")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>   tools/perf/util/parse-events.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
> index cc7ad331a49f..efb46ba9ba22 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -1,10 +1,10 @@
>   // SPDX-License-Identifier: GPL-2.0
> +#include <errno.h>
>   #include <linux/hw_breakpoint.h>
>   #include <linux/err.h>
>   #include <linux/list_sort.h>
>   #include <linux/zalloc.h>
>   #include <dirent.h>
> -#include <errno.h>
>   #include <sys/ioctl.h>
>   #include <sys/param.h>
>   #include "cpumap.h"

This seems like a bug in uClibc, if it undefs something but then 
includes a header to re-define it that it expects hasn't already been 
included. But I suppose even if you fixed it we'd still need some kind 
of workaround for older versions.

There's another workaround that is slightly less fragile and doesn't 
have to be applied every time linux/err.h is included in this order. If 
you change the asm/errno.h include in tools/include/linux/err.h to 
errno.h then the libc one will always be processed first. It probably 
makes sense for the userspace copy of the header to use a libc errno anyway.

But maybe it's just as hacky as this fix.

Either way:

Reviewed-by: James Clark <james.clark@linaro.org>
