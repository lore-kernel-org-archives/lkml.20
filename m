Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702318;
	b=ALIEUidhbZzkOwgj+VQFW+oWnLKLON605zvYe9/1kShnTquovUe7zHgT1BkzBS+0mFOt
	 ll523GPFq62+krTsAseStjvcy9habZvHNbF2OpjjQHwXbIEp8+RKVJIQYznd4Oj7yDVyC
	 bif8q5NKG/VrHbkffHW97GY/WobKDYwfZZqToEBxUC0TMYnQWFTT4HMXz1ccbp46cZRtw
	 Fy9VhwNbmnhJ1KzsBI05Qz3sPPlVuXI8NK36mMEbarbddO89VyvY/jk4Fnu7DrBhGs4ga
	 D7YP/tg3WlcyEts6j76l0kL/9rP4TjjzCtVVPwBgEwwvm3jWk8QdPfBAGaKz528c6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QBU+JY0LIvKeNHjcy5gTbrjwDNu63TsOHh29cK8nd4o=;
	b=5WEqfB5fXrUjoUIH7Nt+NrpvIzAORG4BcLm2wrozNxwWj3S6sd5sRYKkOOJ7cNDOUte7
	 6W2crzCr0nPpH6h3FhdtPDqZ8PyxQyyhh6os+1FRjWsghUMPQuVDY6j2zhlzlWYjvkXvQ
	 Ah3eVbpLN5UG6LuWzu9G/05Lpx7Y/EoU/EtzCVjOD1DQ1TvIvZGTTyR5rL1u9QnRvwT+N
	 SrmmcSnWCj/2CfKxpsgUAQMuOGlfk8ss5ewXPhjwuUMRam1o52Re7Wzxg1XkxYoy4pCjH
	 /SSICsgc3kVrdVV0X2qQegvrtUA2194hl3LrjQkI15dUGVb/sme6UIMbh/I/Bor6U0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ols/R6zM";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA6E606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA6E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ols/R6zM
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37600b0db49so2923698eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702317; x=1795307117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBU+JY0LIvKeNHjcy5gTbrjwDNu63TsOHh29cK8nd4o=;
        b=Ols/R6zMu1kix52YL4gO5G6t2l7MiCVboq6QHsHUlZh2C3x/yzt3IZrAH3frath6cD
         IHSwWZ8L9+AL+FuxJygZaWikHgFGc2CAl8pnkoeHXpjyjqFfP19Bo7uRxdluOcabnYNR
         zRii8/9UJcgRqZslD4goexaigmszzwT6TkqlMK75b8yS5cah+Td2FSI5WVGuH5+o8iE1
         0ilIhNSyE5ctI9aBg86g4QPNsrczsn6Z3ByBpMl0F9bGyNZbmWIHictoqeUQ0xWr/jWx
         6lij1GXYh6GTlCxmrMgDcbfX8DzpHAsFDNAxjNjpcpFY94Pe8U15mqheTpYJiwX6Phe4
         jtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702317; x=1795307117;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBU+JY0LIvKeNHjcy5gTbrjwDNu63TsOHh29cK8nd4o=;
        b=MgLDiF3krtYHOkycVYytjfijbBb1URRFBxUTcG2vpg6ImUWVeW2+GJ0EEZVBpbZ0xN
         ewLO0SYIOZIhMUj8YW36/c34cPL8XkHHVVwLtZH6xI85Xu2h3jY7dvFOZAronpsfS7d7
         VR63iwc8PW+a2vuE6bU3hRuUs+ykDnpc2BverLuW0ziOOqFKZcohUKRirF9YbtJxYGyD
         vgU6tmzu4Be70y/URxUL3+VSFWZg04/QYUv3HzY7HXrCMyKe+KZzk2PhDFnoeeWzxhwZ
         0bEo8FWkSNIhls8Xo/J9Iv/n/NiZuc4cjkyHSSDp7ZO2pkgpPRCSsmpA4h0XtyhJZLKH
         TADw==
X-Gm-Message-State: APuU4Z9Joy6VfryLlaERIv1aB3G0s5Z3eVXEel4vFqHzogITDbbBP6bA
	9F4yvYnTv/FL8Ynoo70Wje4C83chfGgW4wSsuz7bXfOE3hIDwYYghd9C
X-Gm-Gg: AYBFou2bZoP5PBlFufMkcSoAbOMr6Pxuj2thdjdgLP8+sqWNQu60Xq35CAZsl5H54os
	KkyfmLNnpm5jJitY/AHSlGkNE3aybYoXvE7jP+HvCPbLAMRPXQtZRCkNctPh3/jrtpnm3XRBQ7s
	fniZ/h2d5PVRVjsxeA3nCCPRuJiCYJCdgfavMkOee+Iu9GQ0NiF7mhgzd+FbwUJA0+Wnyh67plH
	0bdCrw/06Yh0Sb7Q6y6ZS0jsAYioOOkABdS2JwXIMfsTT8IdwvJNeckWm5bxYYvpHtg3fmWk4oC
	JHpQuhf9opyqHjs/kDKC9m9ln0lsgVTkEr8mymo5oAHguZbB9SLrzpHKX0uzylEuFpNo2hxnZ0S
	xTmgU+veciUBJ+H56Ue0h5ZT2mNA4p2Tnz1bFS3x+2kTWP/o+2NtCVrK52AGZYG18J7NZnMA1QL
	EWDIKkGhoglfI9EWOffGvLuNafyvSauVpApjZcQkAowLcPI7WRG220V3tC/n1y9PeUwvhtV5bzM
	aaCe1Q5wzsBPG/04nU8tnGD+BN3bl9gWD6hzFYRuXrum8E73uNwDRgqoqPGLCam34mB2ZiV9ebx
	qtIbxC0r9s66PafSP4W9rAyceKN7tFJNAspRd9sG8NxQfYcXSqDMSkt5DupcDs8EyaA=
X-Received: by 2002:a05:7301:1509:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-379658c798fmr6036337eec.4.1794702317178;
        Sat, 14 Nov 2026 16:25:17 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm19708520eec.17.2026.11.14.16.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:25:16 -0800 (PST)
Message-ID: <a813b1ea-6971-4fde-b310-659a03963fba@gmail.com>
Date: Sun, 15 Nov 2026 09:25:12 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 1/4] PM / devfreq: Fall back to previous_freq when
 get_cur_freq() fails
Content-Language: ko
To: Bean Huo <beanhuo@iokpp.de>, linux-pm@vger.kernel.org,
 linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, "Martin K . Petersen"
 <mkp@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stanley Jhu <stanleyjhu@google.com>,
 Bean Huo <beanhuo@micron.com>
References: <20260907192140.2701755-1-beanhuo@iokpp.de>
 <20260907192140.2701755-2-beanhuo@iokpp.de>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260907192140.2701755-2-beanhuo@iokpp.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/2026 4:21 AM, Bean Huo wrote:
> From: Bean Huo <beanhuo@micron.com>
> 
> devfreq_set_target() calls the optional ->get_cur_freq() callback to get
> the frequency that is passed as freqs.old to the DEVFREQ_PRECHANGE and
> DEVFREQ_POSTCHANGE notifiers, but it does not check the return value. If
> the callback fails without setting @freq, cur_freq is never assigned, and
> an uninitialized stack value is passed to the notifiers.
> 
> hisi_uncore_get_cur_freq() can hit this. It returns -ENODEV without
> setting @freq when its PCC channel is missing. On the mailbox error path
> it sets @freq to 0 instead, so that the core does not read a random
> value.
> 
> The other two callers, cur_freq_show() and devfreq_monitor_resume(),
> already check the return value and use devfreq->previous_freq when the
> callback fails. Do the same in devfreq_set_target().
> 
> This does not seem to cause a visible problem today. The passive governor
> is the only DEVFREQ_TRANSITION_NOTIFIER user in the tree, and it only
> reads freqs.new. So this patch is not marked for stable.
> 
> Fixes: 0fe3a66410a3 ("PM / devfreq: Add new DEVFREQ_TRANSITION_NOTIFIER notifier")
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> Reviewed-by: Avri Altman <avri.altman@sandisk.com>
> ---
>  drivers/devfreq/devfreq.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index f08fc6966eae..f20d9a660779 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -348,9 +348,8 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
>  	unsigned long cur_freq;
>  	int err = 0;
>  
> -	if (devfreq->profile->get_cur_freq)
> -		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
> -	else
> +	if (!devfreq->profile->get_cur_freq ||
> +	    devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq))
>  		cur_freq = devfreq->previous_freq;
>  
>  	freqs.old = cur_freq;

I agree this patch.
But, I don't recommend to execute to function on if statement.
In order to improve the readability, could you please update it as following:

        unsigned long cur_freq = devfreq->previous_freq;
	unsigned long freq;
	...
	if (devfreq->profile->get_cur_freq) {
		err = devfreq->profile->get_cur_freq(devfreq->dev.parent, &freq);
		if (!err)
			cur_freq = freq;
	}

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
