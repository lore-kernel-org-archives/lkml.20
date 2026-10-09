Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E1C4A1DEF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538979; cv=none; b=a6lgaS5+AT0pYrIQ9Tohg6jCGOeIvbf1DkDu1PHtEyPfF+IuZxFC6NnfhPWpT8DJqRmk5dTNVOz9/wvIdJnm3k5czxFjhDz/qGB9ajoeFxdcdON0NiO17xbcRWvZrukij8djzpTU7HJvg4/8cyPO5XF/pvP+ofjAWJQJYA4/h0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538979; c=relaxed/simple;
	bh=ALY1O9tPv0kwiP8hOApzJYIHIqYDvjbsrechk39f/v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkF1cVHTldXJZOpEKGDergNo3g4I1viJv04dUrrrQjKh4cQain1WqpUWOe8eC529CiyoJ7dyv1jyEdDLZ1ZAW9cpMjbZ7emDiGfv4sYZn/S+JVrgB00Z8zV15ED5RI49lp60kfA5T4+PWrMR/noANdDTjTCbgXiv6rBxABcj0UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UALXc9n0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UALXc9n0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e5d08214dso865377966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791538971; x=1792143771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87sDAQaZgbuZUIRnkfj95yPvO1LFq8s/STt1FfRjdWI=;
        b=UALXc9n0rd0+LHCUqo/dxG4XIcJwjwfe33hweiqjLpNZSP8wMAoKSctx+0d0ZfUoR2
         mw+qisE09jrKWuQ43p9clba3fHlWo/fH05P8bkZcmTih6mKj8Aq5hGrZMQ4RsXeWeZEz
         sV0ZlhXAVYcNoagK6rL4CBPUn76t6zasveHVQdg2voVhnidqJF04aImHkTlmw5S1x3K4
         xdaN41/BPN+E57acyRQDLnALC0Y3a+hdscUhw02mX3sGuiGlwQ+X4vHUkvvA8J/ygJKq
         oqcvWonX9Jlz9hrfhqNpvkEN2DiLhq6BxcnkNDtzW9Bl2yLgK8omeo7mwe/83parWnjf
         Z1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538971; x=1792143771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87sDAQaZgbuZUIRnkfj95yPvO1LFq8s/STt1FfRjdWI=;
        b=gN06Ml+sLG4EmtHZP1kkH8FIDQAms5nNi48Qe7Y7ICC9FPzC+zczykyPY0OxwCwt4n
         I9u0ZzW/JbgyRRgoN0vQmoLil2wLvY+vUtRzPx1rlHr5cVoQ/7f0AhaRCrfxXIcKBfEn
         y1LRhKWRWKltXYZtz8wVD4IPWGscGI5RxTgLvMjyZUNC6KUjfaeZx4j1V9/xUJH7gfVv
         5LCCzJSRQJfdkf15otTG1r1+e3MzOCSC0EHcjTUF+TKdjyXg4iO2QUoeTg/gngZqzyJG
         QpimmdBELzr2+Rqu4PL1Ddkw2ylsNrsJ6NzfhTCnrNJkvMIwLshPrbR/ILpNoTfCf+JS
         s0ww==
X-Forwarded-Encrypted: i=1; AKwUvByeEzAwETTpz/XuqCYUNoAYtRqgnp9DdyjnrsGJ8HxpIsIduhRLGNNAheZnTd/AiFnXWUl/+8fdSM61h+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4YEs251kK2xu9ExZ8H0nkh6xsP3qE0253n7xlhW8srsLqeARS
	bvWDnQ5Lh1UfJ0lzOtu0ohU3sJIciYpRmzfAP+dPDTFeNKBFvz2aamXAlEUDEVnSpyrR1w==
X-Gm-Gg: AYBFou0IUfvY19FmZIH53SZPRTrRLDe/52nIzDeA/Co6P+HaJIJ86zh7dhc8cFrIK1O
	6v/djZvzxJ/J35UeV2ub8pPDKViGKwpQS/YKe32FgugWOPLyy5wMp/WGJwG1sMsiaH/h/SNqzai
	xoIJjoiJq3FRAtwCVnVvsuzYPRytDfKd3H65pEp+mqvCSmeofbtN2iv6FbMldmEV4uQL3cDQLhb
	H2An/XWj6Ul4msl7F8NWL2ZzU+OWefDgPSyImx+llQxMp3TO4/3VvXy8BX/1IznrpsSvd8zvCcv
	MFKRALOvhFyA5pIhAM6ugqnboffT2MCqDA4S05a6rG5uOE3W2mPaA1lnL2+ltSDgfViy7POqAon
	CoO9MzHKhxnMXjXYnuG3xkw8r0Ok53HHcVsjofz4mCZqiybde7pfzQJITFKcpFzKLqPQjpl70CI
	8IBQyo4KW6IK5QTIT8NnMQcuiKzouk/pO6pFIyzmC+J/TpgA9GZJHyrBg1p2ByFxD/96Onyh+94
	0lvRrK+bf+6BKAFhOzb/nWmiUf9NITEP0HX+4sDu8tFjM0bibivxpbqxPyYSvlhtieMHNM9QEWi
	sfrJ0s2jTN63aiqZC3LZvfoJcsD5ik5hCJyhod3emcbCICWL1U176OiiYwmg+/NbTp9kWSY9YD1
	cYVKZ1ScFJZJvedn94zwvWk0ADuPeDL3lhg==
X-Received: by 2002:a17:907:9620:b0:c29:5172:6151 with SMTP id a640c23a62f3a-c31aa02998amr127473466b.45.1791538971338;
        Fri, 09 Oct 2026 02:42:51 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a97654e6sm71202366b.7.2026.10.09.02.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:42:50 -0700 (PDT)
Message-ID: <6d9c9501-70d0-4e1e-933c-eb5a45bef97a@gmail.com>
Date: Fri, 9 Oct 2026 11:42:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/2] net/sched: taprio: fix RCU stall from replayed
 schedule entries
To: Jakub Kicinski <kuba@kernel.org>
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006113335.241564-1-krystianmkaniewski@gmail.com>
 <20261008091732.7794253a@kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <20261008091732.7794253a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 18:17, Jakub Kicinski wrote:
> Could you restructure the helper to avoid reading `entry` after the loop,
Thanks for the review. I will prepare a v2 that fixes this. While
reviewing the patch again locally I also found a few lines over the
80 column limit, and v2 will fix those as well.
-- 
Krystian Kaniewski
