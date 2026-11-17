Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929139;
	b=uSZGJ8JWwPwT2a0OyfI7vTEfX+PSUkCIOQJHkxBonZ9BxFmlo83EdPzD6PIEInSb2b1I
	 UgTmlN+mtOOXZsw4LF67ZZrR7lWClGbq18KDtbdWXgqu99Ks/855YHnIXMDdXPyPpNOwh
	 nrpoLiXkm15qf2cnCU/Fs9gDnLlCHFpWROb5a4aKj+23aJf3hLtVkKnjPrC457qZCEqrC
	 +CCswE1RoxLApTsIGkCgkTnK9lAIqDHldn8MRkqWsgNLxvLSXh7NZPsipVwquvmsx718n
	 jFWf7BZqJq4XUbGhp3rbf2HfqoaPE2FpVBO13mU0iBHUd2geebFd0+3VG/uT656UXcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929139;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=rN+481S4GYpfidYv97LQA1HYewvg9PE9lPqaKVSokeQ=;
	b=LH1aymiGyd3lmxhSXiTS9TPo6fZVLQJnT+gbWlIkeRWT7QlAzTi1RiGRncAwU56r83P8
	 thTOeBEyqgStrFvxp5waIOXp347uP7i57mexi7NizxfpMf4GqmZQCe8KCLqZNI/P1KetI
	 ufQUHsou+ZHp/i4ZDhgvhMhoB0QQ+74XZfF4bQnul+VY7njcB7uzbJX798WFGMtIJzTgU
	 o/sPjV8NNL6QPEc5Ib0VG1wuxML3W9pcxIT1uZpAXQzZZdTh5ayw3vis3aPdwMdxX82rd
	 K89UQAhM4Kfhe7sWTwwJSCC1S5qgJTjB1bUW3JoIyh+yp4I8Xre1C5UD5njui13Mh5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nlsZsEvN;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D40606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D40606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nlsZsEvN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F2571A161E;
	Tue, 17 Nov 2026 15:25:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 695C35FD6A;
	Tue, 17 Nov 2026 15:25:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7806511BC0066;
	Tue, 17 Nov 2026 16:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794929136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rN+481S4GYpfidYv97LQA1HYewvg9PE9lPqaKVSokeQ=;
	b=nlsZsEvNVFjQKIYLoZjSGlxk2xzVmNeins+40O9GvbcX7Xc75uEoYS5khhPUz9tqjiPv1S
	I0EyQq7tDinSPTiQs4VH2Ar9GEsRgXAcF4kf8bhNad4FBwdQxVtplb6MeSJxbqeu597ppV
	B4v4UPoDVguGWGyhJgPe/WQMyOR8eLQeBH3mLuCurX6i+KqP9AE30qs95kIkuUpA5wXEpZ
	f9OyUW1fgkeqQLoY0FV3/dLnSY8d55i7dmTJXStbZ+TddnCJ30wdV3osYIy/4+FGY9cRxM
	XuueBSCCdPut/ie+6TFOroTDDP8QVvJzC9+nI5illLUlBxbEMtFvePe4NJojJw==
Message-ID: <e7ba12e9-ae4c-4f47-9374-517492b2ce85@bootlin.com>
Date: Tue, 17 Nov 2026 16:25:33 +0100
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
Subject: Re: [PATCH] drm/fixed: use fls64() in drm_fixp_msbset()
To: Oarora Etimis <oaroraetimis@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261117-fixp-msbset-v1-1-60526519ae2d@gmail.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261117-fixp-msbset-v1-1-60526519ae2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/17/26 12:32, Oarora Etimis wrote:
> Replace the loop with fls64() on the value with the sign folded away.
> 
> Output is unchanged. The loop runs once per bit it has to skip, so a
> channel value takes it about 47 iterations and 347 executed
> instructions. The replacement is 6, and the work is one bit scan: bsr on
> x86-64, two bsrl on i386, clz on arm and riscv.
> 
> Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>

I did some quick testing, it seems to really improve the VKMS 
performance on some workload (up to 3x faster)

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> drm_fixp_msbset() walks from bit 62 down, one bit at a time, to find the
> highest bit that differs from the sign bit. fls64() returns the same
> value in one step.
> 
> In the other users it is only called a few times, so the loop does not
> show. In vkms it runs for every channel of every pixel of every frame,
> and a channel value is 16 bits wide, so each run starts 47 compares from
> its answer.
> 
>    Link: https://lore.kernel.org/20261108-lut-v1-0-f762d70ae4cd@gmail.com
> 
> Fold the sign away and let the CPU find the highest set bit. The range
> drm_fixp_div() shifts by is unchanged, and the output is bit-identical.
> 
> Counted with callgrind, gcc 16.2.1 at -O2 on x86-64, function body only.
> ---
>   include/drm/drm_fixed.h | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 21d822aeed55..7dbe89ca30c6 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -28,6 +28,7 @@
>   #include <linux/math64.h>
>   #include <linux/types.h>
>   #include <linux/wordpart.h>
> +#include <linux/bitops.h>
>   
>   typedef union dfixed {
>   	u32 full;
> @@ -121,13 +122,9 @@ static inline int drm_fixp2int_ceil(s64 a)
>   
>   static inline unsigned drm_fixp_msbset(s64 a)
>   {
> -	unsigned shift, sign = (a >> 63) & 1;
> +	u64 v = (a < 0) ? ~(u64)a : (u64)a;
>   
> -	for (shift = 62; shift > 0; --shift)
> -		if (((a >> shift) & 1) != sign)
> -			return shift;
> -
> -	return 0;
> +	return fls64(v | 1) - 1;
>   }
>   
>   static inline s64 drm_fixp_mul(s64 a, s64 b)
> 
> ---
> base-commit: fc72cd52fb284f3707fa36a68ea5a22543a51d71
> change-id: 20261113-fixp-msbset-5965c14bcb9b
> 
> Best regards,
> --
> Oarora Etimis <oaroraetimis@gmail.com>
> 

