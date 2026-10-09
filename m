Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA33D75AA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557829; cv=pass; b=NGk5puBfHuZlUaplF7Q1qz4/3Ivik/hu8A9qPNQ7HThmXWVdPos4dH47BW+VwXEeNYBxexqPabgJqQAnZlYE/8LlVu03dyjGew44QaMexk0xRcbs+qmsJHJjyyFfXYTRr3tME3hLf81Vh4tA9zytzPo1/+xYuEmk12RbEVOWNA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557829; c=relaxed/simple;
	bh=7FMDwtFaggzwsWZRhAsGBAF1FXfEG2DezAZSb3qCdh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXNKopYTQ4dit6f+KSRpaLtXHO3HDiS49et5tzsO8FygNQ9yDDXf8P04QVvpXib9gbuVsyB5TR7X7XALAzU3PdjvzrCN9V7r5FXDB+giDupSt4Wm7koVjg0wh1/+GplPff+amgSmJkvHFiHLIUK+NQCbBS1JDW6qH7x8ZzZvbX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiSNcDh5; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiSNcDh5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso3216192a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791557826; cv=none;
        d=google.com; s=arc-20260327;
        b=LfyY9ObCTQ3mBPN5ktdkGlb8AHATcNHIvJtk2SMl2EaZW/df60TuXJ4h7ADjlksSDj
         ugnxSFTy9stutWYM1caff5VYs0tN84lbFAN29RO0OABk3CBvQ4b+FZsQF1v3N9EIoyYY
         ObNwG+DQs1LHTX3hps2iyN//AkMESkw1BoHKwv7ROVIAUrlUukKKHpPT6Vafn7J6CtLn
         /FQsQW+DVHsDHXZKOYV/Xus4F51aCt6JisU/QAn7O7PE/6WYtGeB85P4aOpF/Y3fkZue
         9sgGQLaPyFUre6rIIbDQnvdHzWWekD36tdflajfXyuUmeaPqObV0P/RAz+wXkB1BWX9u
         WL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9SUnuP/9pVrP+Sunop9ePoVz110aW+tgJ5DFz5LYCdA=;
        fh=yCIEkZt78gfDFus5abNjeVhsyQB5KHzQ1nJGV0TaQgE=;
        b=q7dBi5Tj1IRl2EDSbr3YCXAFqAtRXR9HR6e80EkLx7Ux7bB7lCO6uiqqCzI8EZxAUT
         L8QLRo3JOLa3I5SCJWrcdlDBhOvxtOAg1hu+8ilC+eUJ5MKNGNrMxNnkIdHFKY6skLez
         3BSbkR0STz2w/DTP6QXUwzUbN60hOUO9HaYfovkxgsqpvhZ1j36A18xd+yAnATMdaZHf
         SFWuDQslAi9Y5JQbeRFvkhLCpi7QvOBChps5lfTbXupFUxV8XnMfiWWxySPJE0fZ3BFZ
         pLVANm3Yk32RS0xBt2QM35gzC5xkFsZBmrSo5+WVdljfDMgdhip22LdNGvl+liH1BgoZ
         Zdpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791557826; x=1792162626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SUnuP/9pVrP+Sunop9ePoVz110aW+tgJ5DFz5LYCdA=;
        b=CiSNcDh5q7WZ41ABH3GjObYLj1DpnDNrCwYxGeA6b3QluOym7qxU6Xbg9jeloP1HmF
         HEhorA7zwF4HW0i1+5hVczc9CIzoPxHrnm5jpJRYaXdfmWV741hQBJLtxIMpRZX8l+44
         9808Np84bzlp6yVQk4NRKrsdjMMoDOIXfY5SJXgs6xO9wo2An9w5ccc7vHtymEyZ+rMc
         794xcSmhM/L9LoLR/i5BoWUaA7/LZdV/nGm+cdRYiJetG25Q7L96r7IP4WD9The1EdYD
         Iy18eaoMy6wZGud2zidb0rzu9UGtmIsuTQxWSnLHSEfz9aU/X/RKAyvaHYAzGaHIEG8W
         Mv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791557826; x=1792162626;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9SUnuP/9pVrP+Sunop9ePoVz110aW+tgJ5DFz5LYCdA=;
        b=nqb+Ow38wWY/jvhVdeg+m00MKv3SgkKN7YD70di1a4lPVbs+DHpCPaVLPGQxGnTR2n
         2qgFzsXHzAOXwp/fYZI5Rx2wrgauLvaPjYvPBWfrUP/e+UG+VvDEGIwU+TF4qVNdpWia
         l8Zl2F/PQG9VsLXuCIEzmvGb8izqAacer90QxVhR4rDSwRD7+/o56QxF1418wSx9qg9I
         c22qa/XruoPOGNAL4MmdF1JrmUfQ1sAbKBTSLBQ6pSPhPw8nkjHl9AgYV4mIz6qd6KP7
         h6QUlJ98cMD6AsSS5eImeuPAp/d82aFcolNBzi9NKhttSNEYSux7ijr3KmCzURJfgisq
         qBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBypSDHoJCxzziUEd0GfAF9Tv52zr7w21Yb9Hs1GIqB+lvvt+Qjztewufana95QnBxkq8Jq3bonxQT7M+kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKejwLDIkKftrxaEeLGsHVN0co+wXrFVvY3wdbpyl69KgeySexa
	EV1o9dhVsL47sWH+y69l0TPqHXqOXiHq7uXRkjvJtY5ub2zhQjfOGLHy/44DvZOczo4sBefFi+F
	UP/enS9kyqtYP5ZoSXNf5GykL73ceRgwwnjcKO+HYUg==
X-Gm-Gg: AYBFou3BQqB1qPR1CIEdWNBxi6Hr+A414lwCGRlHKgjU3TccBwbjKAivpsZ3n/iRVzI
	H1K6Ar2PxWizc9wY7+VUCsaqB/4RDXC7q7a2pfFpdjLj3kAYxNYAJhQHCr/a54m5lXyYUeLj2aS
	VYYHwWPG//FuRKJM770IHcG6A89VfL2kFEkim7VJmgi84utt4AYqu2c4k3t5yWNUpZasOIW+KOk
	geMEHtYttwc9PKwpsKp0AfHYqTSzristBXOlK9Y6oaPlZMFsozq+J7xfhvQQZmd1bt1UwLBOleN
	cYEeo++lKIl0VcDwIi3Vxi2FdrwyJG7eptDjpEeuLOHYdZkCbQjx79yYxiqvQ926+FzxxslCqZW
	tJyeYUJmPWcI=
X-Received: by 2002:a05:6402:c50f:20b0:6a9:8863:ada4 with SMTP id
 4fb4d7f45d1cf-6b17ae874a7mr1721313a12.3.1791557826030; Fri, 09 Oct 2026
 07:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-1-vincent.guittot@linaro.org> <20261008191236.152916-1-kayracizmeci@gmail.com>
In-Reply-To: <20261008191236.152916-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 16:56:54 +0200
X-Gm-Features: AclHuK_v5n1Ouyt0X_gZmkpqODynvzfs5VCwBcw7-YKwWh2i1MU54JpfI1I1mBY
Message-ID: <CAKfTPtB4KU_vJ12uvW0aw3CdkCvAujV+0cJYJ3zX3rPPZbCnzQ@mail.gmail.com>
Subject: Re: [PATCH 00/18 v2] Improving latency of short slice tasks
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: arighi@nvidia.com, bsegall@google.com, changwoo@igalia.com, 
	christian.loehle@arm.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, lukasz.luba@arm.com, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, pierre.gondois@arm.com, 
	qyousef@layalina.io, rafael@kernel.org, rostedt@goodmis.org, 
	sched-ext@lists.linux.dev, sshegde@linux.ibm.com, tj@kernel.org, 
	void@manifault.com, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 at 21:13, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Hi All,
>
> I wanted to ran some tests for this patch series. I couldn't really
> apply it without some issues, but I think I managed to apply
> it cleanly this time... Tho I may have been doing something wrong.
> Please let me know if so.
>
> base: 4a3b51aab6e25244d97936aa65e6d5425adf98e1 (on tip/sched/core)
>
> Command Used Each Run:
>
> hackbench -g 4 -l 100000 > /dev/null & sudo chrt -o -T 300000 0 ~/rt-tests/cyclictest --policy=other -t 1 -i 1000 -D 20 -q -m; wait
>
> Environment:
>
> Zen 3 with 8 Cores and 16 Threads. And Fedora.
>
> THE RESULTS (COOKED):
>
> On Base in 5 runs, average values are: Min: 3.8, Act: 5.8, Avg: 8.8 and
> Max: 2511.6 (I need tea.)
>
> On Base + Patches in 5 runs, average values bla bla you get it:
> Min 4, Act: 5.8, Avg: 7.2 and Max: 1781.6
>
> Or, in the shape of art made with love and passion:
>
>  +------BASE-----+--PATCHED--+
>  | MIN   3.8     |    4      |
>  | ACT   5.8     |   5.8     |
>  | AVG   8.8     |   7.2     |
>  | MAX  2511.6   |  1781.6   |
>  +--------------+------------+

Thanks for testing

>
> Hmhp... Hope I'm not missing something. I need water. Bah.
>
> Tested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
>
> Dancing donkey chases a car while shouting "Linux is the best, my dancing is the coolest. Cry."
>
> Thanks,
> Kayra
>
>
>
> I'll add other not too important things below, these are pretty raw.
> But if you wanna have a look you can.
>
>
> THE RESULTS (RAW):
>
> BASE 7.3.0-rc1+ #2:
>
> RUN 1:
> [1] 1950
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2115) P: 0 I:1000 C:  19990 Min:      4 Act:    6 Avg:    8 Max:    1885
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> RUN 2:
> [1] 2132
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2297) P: 0 I:1000 C:  19990 Min:      4 Act:    6 Avg:    9 Max:    2695
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> linuxfucks@micro-softly:~$ (Opsies. Who's hostname is this? It's so cool. Wow. 'linuxfucks')
>
> RUN 3:
> [1] 2307
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2472) P: 0 I:1000 C:  19988 Min:      4 Act:    5 Avg:    8 Max:    3246
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> RUN 4:
> [1] 2493
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2658) P: 0 I:1000 C:  19995 Min:      3 Act:    6 Avg:    9 Max:    1991
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> RUN 5:
> [1] 2671
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2836) P: 0 I:1000 C:  19992 Min:      4 Act:    6 Avg:   10 Max:    2741
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> BASE + PATCHES 7.3.0-rc1+ #3:
>
> RUN 1:
> [1] 1490
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 1657) P: 0 I:1000 C:  19993 Min:      4 Act:    5 Avg:    7 Max:    3091
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> RUN 2:
> [1] 1671
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 1836) P: 0 I:1000 C:  19999 Min:      4 Act:    6 Avg:    7 Max:    1529
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> RUN 3:
> [1] 1848
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2013) P: 0 I:1000 C:  19998 Min:      4 Act:    6 Avg:    7 Max:    1455
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> RUN 4:
> [1] 2023
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2188) P: 0 I:1000 C:  19995 Min:      4 Act:    6 Avg:    7 Max:    1524
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
> RUN 5:
> [1] 2200
> # /dev/cpu_dma_latency set to 0us
> T: 0 ( 2365) P: 0 I:1000 C:  19989 Min:      4 Act:    6 Avg:    8 Max:    1309
> [1]+  Done                       hackbench -g 4 -l 100000 > /dev/null
>
>
>
