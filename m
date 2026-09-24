Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9145562E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292261; cv=none; b=TYBH4oe1ozqRrmmSBo9ax0EZSWyDCqtjKLtfHQBkmgmshO8YKZWSYnbH1zhGW5GNhJm3CLtsJaQoJaMv2doM73PJh1RnpOfM5ziv4PreWvxyjZs+NEZWRH9prY3cA6xkIaJq4hJ+sbzwQNkZLm6MlFh7pGZvcGa5zv+t+AJEyKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292261; c=relaxed/simple;
	bh=ANWbgstbKgAnuoPyayvM9wa2364fXfZxo85nyhIjrUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdQWFuOuZ2519M0eTNJtjluJndvHeE9nFI9O21uhcGiib8G6ITozR/Np0EruJGhcJFzT1R3mg7ym3/iwvAwAPxGwhpDSlEnSzCNOb64ai60p0SupUwrpJIv/7dedZ+0FBVtbP5IdGnEjZcV4NRTUqqjnUEhvzmEz9rQoCbEVkRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSYkqYc0; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSYkqYc0"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so305249a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790292259; x=1790897059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gLPcQvE2dfwkDZEgsOlXfyVstlU3w3zVvbEySQw3EHk=;
        b=nSYkqYc0mM990bxq/cixK0rAoB5xPPgPRavZoNjMnxCRi+PI3auOs3sSuIqGX6m1pr
         8zMwyILbxRkibS3csuHIE1JrvSy2AGovkNiVd4QIMuJkdh8HW+A9UIUAv0RMovSJWsx1
         ouA0wj0LblSkBa/8s7NxuiIkKFCW2QsQ1NabKqoFYcb2iMQ4kFbJhHPw1Bz9TuYozAeN
         b5kGdXEfs2RW7JlClqEAI7SSppU5dURhFDRvHuEHbppry2QOEvu0xWuQoajvcoeDg7PC
         AHCaqfZj/X+yMY0Q7NmYTH91vW0Qp2iW08b+zgCsceQ32LJxkCRySxZpi22jkUWzSv6j
         i3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292259; x=1790897059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLPcQvE2dfwkDZEgsOlXfyVstlU3w3zVvbEySQw3EHk=;
        b=Kgxnog7dJR4TR5qBqqmbXZG1V4b1LS8X1XfWufxklWQ67fR4tqvisHqWLk6hp62rOV
         tddydjEWX6DIQjiUmfj01uNjHCQ8XvPpoCNfY4ym8nLCf7LI/5Lbm01owGdKFFdZcMSV
         l1ObG9BPBqgUzoH2WWL/QPvOxZQawgJ7XemnxXjm7VeWMUsGLMth+KvM49BnIpdeS5Cd
         6nEIaB9l14ux8ZuH4qzqzPDcefQwA/CvVoT0DUQ8+qOe8X/ykxPLD4BoTZ60btISHfhg
         qmMa/uhLmvuhkhWQyXGEolJkQU6WUGXioGhLfweOgB6ldvy0+y7uL+oWRKY6F9z0pQQa
         XhGw==
X-Forwarded-Encrypted: i=1; AKwUvBxA/McY3puLbGYzLBGMzd4+NXIfD6FE2QR5ms/htGSE8VEuuwSX8XgGP+u1ynTnpjkcK7Rq5ROrlsxk01c=@vger.kernel.org
X-Gm-Message-State: AFuF++ltIZc88yRjmZaJSKGKdfZL9WQlwg6btxjROBhedhuM3zJ/A6En
	OLHvVK8ovf+zVdh+y0evOJnkJdGGk2B2XPZ0wldOtmNvGQ7iCr1CRFYDeozsGe7l
X-Gm-Gg: AYBFou3/8QxyZ9DfUW9dkaul4L3wCSJZT5B7IepHKpPmkX1m2V2y9FuO6Mjswp1lcdq
	GIKkiNLseeffLINoB7+Ay9fghPeO4T1OSbzNZuobm26vOiV6z/M8xV2vMndZWElS0z0m0qDr4CE
	cqhved21o2RxPp0pnOOaeMbOhpdgpVgNyu1IjzTN5MZ42L+2LnFi/rwaKE3mM0Tng/AkH4hIuxp
	eB0LQGe8tXt9xo9mSRu0VrexGNndX1TaHC1Nqr+QmGOBGSmHN7H3Bj/Kj+4Psjt051VhRxDavfY
	1c+biGLUfxvevaPcIQ7Q1+g2vGVGh9HUu3LsynjyByq8c31KmPvxNKNqqx/hmHQVsQ4HAYRevmF
	GmZtfFqN13Q0Pj88ZE/tJn+nRlGSEbQB07/uUS8XHN59NnG/enYAggnn7KaH8/MK9fQNOZkHy0s
	HikAboJjIw0IU752s3A7UvclYs/wl3mFU/QoyjDO9p5UX/WF8vdvTNBZXg0CmTxrae33K2Xze7f
	AxEGEYg16C1Inp9ZU1AFoo=
X-Received: by 2002:a17:90b:4a01:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3a0bb552fdemr350944a91.14.1790292258956;
        Thu, 24 Sep 2026 16:24:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b2235811sm1694959a91.7.2026.09.24.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:24:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 16:24:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ridham Khurana <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <0f077b82-5e81-4c43-8008-8baa3f6df9ed@roeck-us.net>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924205326.1739229-1-khurana.ridham222@gmail.com>

On Thu, Sep 24, 2026 at 08:53:23PM +0000, Ridham Khurana wrote:
> temp1_input_show() drops the low bits of the temperature register by
> dividing the raw value (raw / 32 on the LM70). These bits are not part
> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> return some of them as 1, and the TMP125 fills them with copies of the
> temperature LSB. Division rounds toward zero, so a negative temperature
> with any of these bits set is reported one LSB too high.
> 
> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> the driver reports as -24750.
> 
> Use an arithmetic right shift instead, which drops the low bits and
> rounds down. tmp421 had a similar problem with negative values, fixed
> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> values").

Please stop providing those "had a similar problem" messages (or tell your
AI to do it). This is irrelevant for this fix.

> 
> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Applied.

Thanks,
Guenter
