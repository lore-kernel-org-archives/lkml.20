Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ADE45C709
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141631; cv=none; b=r8JKFJ8s7ERv9XCZbjFY7yWajvKesYbnwdYXbP64hLFcTwVWUvzf+5iOVrLz3igy7lVLmYDT6V8JcE82n2mi5Feh/9Nc8yMqoLLHnPB1zmH+HF7W714hBRLvBhxb/ShnnOvwhDIiNUmMFZmvXPXe4hPLkdtsrL/L+ls24/tuqXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141631; c=relaxed/simple;
	bh=vskP+/VjFJbpd/SHB0/S8yYPgH1R4r61pmY5+tzVuQg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=inWGDwY7REG4aZCqDHVN0GjgE16pmBPIFUJh1AesAw5RxfDku06i1I+h6HOe3GsxypsqXgRNGqW4Ii7Mczkwaf78a1wQTwChTKLx2mlQdEoMYXq0y1on7jnfg3mFxpuEuwasXFOzshlGGcVQ1W9l2KGM7LW7n6Fr0+uCHsOMNMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=fD/lcTYs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=diKm8IcX; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b="fD/lcTYs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="diKm8IcX"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.phl.internal (Postfix) with ESMTP id 098C6EC0178
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:07:07 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-01.internal (MEProxy); Fri, 16 Oct 2026 05:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792141620;
	 x=1792228020; bh=OTaAd/4maKewG2ggdGudQ6CmCKW+hc4cP+G0dOFsHIA=; b=
	fD/lcTYsve1upT9OBn42bgRNawp3ybdmmj1CXs9RwmkY+PEiHUwWMhm/60p/Lj2T
	1e01c+wEb/jFPmRrhOx/LWzbgwm6qIERG2hg943FaIbq+FMEo5McMg+EmcQS+HLJ
	lf4aNxu3h4i7/OYhf153DcC2fUzLoHu2fOVxV2Ld3nvMceS89fiCZ7f5Puop3UcM
	XpB0r1gt2t/OqYoeFNpkzuSmM/61hY/B5pE92tW1goH9+D1r7VqqCmwHlB0f1xbP
	5Xse+lA15IeiHo/if2oLB6LS6TdpW0aHmrWwIGKQJd7M1AwKZIYSOQL3OCvNRqrY
	/eIDOW0TY6llF8HzDdGqUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792141620; x=
	1792228020; bh=OTaAd/4maKewG2ggdGudQ6CmCKW+hc4cP+G0dOFsHIA=; b=d
	iKm8IcXqmlcGL1SpIAOtDsi+zMyU5B8GsySZz4c9EcMdfnyRz6tMKGUmYojc4efk
	He8RznwyzOgNt6wxOmjJ/zqq7SISuX771UEf4D7csmPiQ0xTT/RLTlGEVdzNJ506
	BpEIP191Mqs0VhHRUj6n4DgOZnxmFKb25e8zqjYAPYhtkcYJAxF+MSMORDhQaKDi
	+G2EvQhhcw+P0HmtIGD63tvBPDr8O2KZO9OJ1mU7dSLTS3LsdCIcTuxdQYnanYP3
	gKYMvesxup/8TN/BJCuLPQhbpOech+r+3nGI8cJuk7bsTTpBZ7N0xtYUSmCgkhwT
	+HMq79QA1pdMswsXriGBg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=alex-min.fr a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792141620; d=alex-min.fr;
	mf=PGNvbnRhY3RAYWxleC1taW4uZnI+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:OnqmhXHRlrYwd/zxrHn7ytfMBjjUfsP/svQZwoEGjeVE48S
	8zGwuzVzdxGxHEAVfZTEsX0gvX8di12p3AH/Px59PRuq110pc9G+x5u60Vko+o3m
	gRVS+ebhQ432PR5s7Ti+oaf/oBSNkg9Yk3WVwusyMqhve4gNBZFPHcE6y2rHg3wm
	mXLe81bbf8lfS65Y4BR/9FrE3cyAI3wBmkyFJWgRhibgotlYVD+ajXkDQuSqaz8/
	B2zDVbtybGaG0ZPDOJn2PTJe/oqK/SIh0scaa6HR+w+b7gD4ezpzmszmj6kuTKu9
	6iffe+SPAlL7J0gU4rbYGTAhtoZREU1Lhg2s+OQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QP8ECK81WgLv6+NFiwneUkRJp27m2+W5M9yH+ZYlZmc=:vskP+/VjFJbpd/SHB0/S8yYPgH1R4r61pmY5+tzVuQg=;
X-ME-Sender: <xms:LunRavd_9WyLanQAvRz1Mauo54nnF9DTgptr0vG7BFiIhyLhAYFk5g>
    <xme:LunRagA6wvomMxKzoEyi_SGBk2pmQM1dqZ1pSZRRi4pp6Jyfzml6giC4PTH0QT3qe
    Dgwj4tTtJljbb8ZG_GW1lUaBgFaJeWo27JZNuuUdilCQKvFUuJJNjA>
X-ME-Proxy-Cause: dmFkZTELavOtQ9FpUxHAzPLKum9t8lHe5U9i/1vYWhRUkD0TGlEObtWIOXGixw6x/W3aNy
    P7NNTMQ3gdKVc3Vms8ZutNL/4NTrGyKy8kCepGiWj6WLzYbsnbfIS81B0VdL7R9irerZiV
    0r5mHIWaSMcFThFdupRn3Y1ddrRUdMB42g5NUEumlEpYZpAxnXzHokEDU7uiJWIAxGwcZf
    /AQlc5kGuNojctJJysXfFcgBHJ/H2v/+nPQefbYzfuPvVsBHOppHNzdnTL0fcGDNspSNqk
    jQGMDOtwK4+TidFQeQvHuI1t3F5jW9oqXjAhJdW/YTqMNRS8HhlBaHVJbZ+qNj6akSp6tw
    TUMvk246ur4qVSPCr+hMcTxhlJcBz3Ltjd28m/JmeZOHebqpBrSEYpYNc9BA7UL5WF2q4w
    j20YosnoJWqFrS02F37wFt/m6bGHftdWdG0WlL0Zozln7jF44u1+5rKAUAa34yKlrUcgtu
    4vhar7nV12ZIHv7GVmE8BnN50UwBdsULEOoKTjTwoBBn1C/lO10kZ8tQTG108uYWlaMPDZ
    R9n0OZhyRE++TPet8PEwBP6GXiZpr5LV9UzftYlwT+Pl3NUTe4PzoB7bSX6lK8EKAoS2GM
    SgPPMTwXrGXq8RJmXHAyo8Y2MIN0472cvVuhhEJuRaewvnEroI1ZAiPewvDg
X-ME-Proxy: <xmx:MenRajJmHrDodbSucl-sDUBgoMYCm821U9EHnYjR5EznxYF_RVNUIw>
    <xmx:MenRalqtYL7hPLYcgaWqQIzzC-76rcXHzOE8PUDAoyorBCjjERBFdw>
    <xmx:MenRaijH3DvTlUTQVji7pdKwXJejpyuL8LO15H_AqYIFADNr9nXY8Q>
    <xmx:MenRasYHNfLVehVTPgFoZth9BRGw5mwOZrnY_AM3mCjbRx5l7AM53w>
    <xmx:NOnRaqqiLuNUY2yUx5GINR9D_mji4HC3w7ak7NSd01pwPuC_9f-wAxEy>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 65D1AF80094; Fri, 16 Oct 2026 05:06:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: APbt_9TFhOUJ
Date: Fri, 16 Oct 2026 11:06:09 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: me@samcday.com, "Rob Clark" <robin.clark@oss.qualcomm.com>,
 "Sean Paul" <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Akhil P Oommen" <akhilpo@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>,
 "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <a9eede13-f9f2-40bb-ba17-76eca6b9757b@app.fastmail.com>
In-Reply-To: <20260926-a306-vbif-mask-v1-1-2bae5e81c05a@samcday.com>
References: <20260926-a306-vbif-mask-v1-1-2bae5e81c05a@samcday.com>
Subject: Re: [PATCH] drm/msm/a3xx: fix VBIF halt mask for A306/A306A
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Tested on the Samsung Galaxy S4, codename jflte with GPU Adreno A320.

No regressions seen for the A320 on my side, thanks for fixing A306.

Tested-by: Alexandre MINETTE <contact@alex-min.fr>
-- 
  MINETTE Alexandre
  contact@alex-min.fr

On 9/26/26 8:17 AM, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
>
> A306 and A306A implement only three VBIF XIN halt request bits.
> Consequently, waiting for the full 6-bit A3xx mask times out and
> prevents runtime suspend.
>
> This issue was reproduced on a DragonBoard 410c: the request reads back
> as 0x7 and the acknowledgment as 0x00070007 - the poll eventually
> returns -ETIMEDOUT, and a3xx_pm_suspend fails with -EBUSY.
>
> The downstream kgsl driver corroborates this (see link). Since the
> single-character difference between A3XX_VBIF_XIN_HALT_CTRL0_MASK and
> A30X_VBIF_XIN_HALT_CTRL0_MASK could be confusing to read, the narrowed
> GENMASK is instead defined inline in a3xx_vbif_halt().
>
> Fixes: be0e82b8e0c9 ("drm/msm/a3xx: Drain VBIF before GPU suspend")
> Link: 
> https://android.googlesource.com/kernel/msm/+/c90c7feeca2f5839ad6824f816c0bd207602a2f4/drivers/gpu/msm/adreno_a3xx.c#637
> Assisted-by: LLM
> Signed-off-by: Sam Day <me@samcday.com>
> ---
