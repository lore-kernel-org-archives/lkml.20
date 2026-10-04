Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1DB3955FE
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791121762; cv=pass; b=GXiEJMV8Oev/MT4IsGLXL6tEDvA/CzFB5LDUuA9Yl2RfSoCkICNRO1jR5mpYcU8Yt78XSfRcr/jfVh3GSToGqP2of4gtr0zBvFo2YDX2lBw1LbDOX/jIcdLDMxhV+FXP70JTaTkkk11XnhjPjfwaDud7VuZ1xFpQ9C34Vc2aFXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791121762; c=relaxed/simple;
	bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqatUpjLCWJS8LK8t8DzgcbRHRO9/lUGLXom53ZzuOOe+pFIqfSBMGt9g/1n5O4Hc1JZ+Hcy3n8ufirPf/nUdKfcKnz7e3/C+9Jm1TagxjPlm3DhUFZfYG04XO9LaLAKGRH1p95Ll63/tbR1WcIqLn+WZgRUP2YRUvKcBlKb3G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+XPYcow; arc=pass smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+XPYcow"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e58733c31fso95255ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791121760; cv=none;
        d=google.com; s=arc-20260327;
        b=BEOfcx/2XTgY9WsCGLW338GZokrjo9SLXLw+OEuOjEQjikhs/G40yFamGlNumhH9NS
         n0CIy3nFOAhTu+YykZ//5irh4pQAs89yjiqo5CBIr73YBbP7+l1SaVxmk/E6+6NuaObI
         3HTti8kjdSh/tOEyRySc6K+l7tic0C9lFNtT4/Nf/L4kM1cv/gQ1Fk9gnmsSVDD/qWdx
         6AEgRwK2wTz4Ip7pERMPetttWPH0ywHIAdnME6WJHXvebM2j/F+f4E/UaP/jAR3dfRPH
         VPthfR9ec6JUcKPtjfYcUwFcZ9mAokM1umSGH9sje/qunlVlGNYXhH44qubPjmiGilcV
         UZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=;
        fh=AlNAwrfuDSpbPaRQnYSj2XjXOSTG4WqOh90YMR+1LdU=;
        b=gxbLK75qaL4aghrszZDhuZ/7eprbLA3DoXeZiwreg/yJnWiGiUBjth86+2l3OoKM5q
         ETtXg6Dh+0Pgv2JHdc0jrjMx587IEb26oxeEaqNadX4GUGgzthwGpPn3clNYo6xOuE9r
         frQ4NkpPgnkLRssCxDMT7MaeUDB9bSvHT+tPARjPghb3nBVh7t3noaKbOHwaTiGF9jyu
         WolmekQ1NV5xTMQI5ML3haDn7JcUqBs5IfaKxKroOYuSG2+giO03elRa38R7VwlwFBWD
         fBPy8dXfPPwuxMKZfZ+zooqDLStcDp170kZ0SkjxGDpHRHcEWL8i4uBZiWKo9MLQuX95
         InbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791121760; x=1791726560; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=;
        b=T+XPYcow1Fp1qKBICG2GU7LbXClqksNRU4Mg1A6ABipnIdRJrx6GkNMyYy3mln3bRf
         uCKNxv0t0NXEXCnkIVofnH+tSi3FIlRj7rX8nmlpwTZoNHKtrVX7AFJ3kLdwl+6/fI5W
         HXh+iV4ERcvu5Ze6oy+XgS+zSlu5/MtUJZQJgy3AOVMZ3gkk92UdqF9ooQ6WXuzvQYD1
         DievlNO2hJdBWNjpkVdjVW6mLlAGaUF090BIkSXJngMeteY9aijasZE4MRCo3NnN33cI
         +7E5qeZJTrmRcRTZAHmI2r2ZmSKxIaBNQUUYx0Ls7DzbHhaOP2dEDD1qt/Tr2cqueNpN
         h2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791121760; x=1791726560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LyXYJi1TmEPA7YN4VjpOXnC86f2Qy5TpD0Lev829kQs=;
        b=HiUuOJX35FgDPk1lLCmrv1ySAy543sW1BMLeUUkthisxU4VeJ+cipsT87leC86BJ1I
         l7cuhT7ZFXCeno3P4FT5+jPWftTxJlz46PUOaERk+JXjRw+eUbKYee9N0Xm2m6kdn9MJ
         lHzrLyMMQDgCiGgVAoqjLEHF1GkLJ+d8x7NNmUSC0M2ul5bjElYo/cpUxvyyYoOyI5Fm
         Ww1sEwclON5Z+YC50JJ/WJw4GqgfR8b3dQfGJC9tpBuC+3AZbvrP5tBx+8X0GtZGTXE0
         j2rSbvHqyig5wB3Nn+KvF15LGuMMVzY/lPZHBAEzW3R/470AGTMFCOqcwxXjdwi1K8c7
         HIcg==
X-Forwarded-Encrypted: i=1; AKwUvBwEpL+wdPHuyvf6NNmDQuBVV/GJXwu5Gly8h1TTuSdlIOPXOSnHv7PG+0er1Hc4C5wkIeq7q312V/RlLnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw94eXlx4WhQ5s6kPL1awhRpscUfwPPiNzOtiBaDmo27kqmR7A
	s+s+wxhWDmQK6YTVkzY/OcXbqxgMiPOFT00OV+/zrz+Nx5y8mvD0OXsaMEDI7zbrTiSSmy/+rVP
	1Gwzshbzy2gBZTIEd8esuly1i8r6iT1s=
X-Gm-Gg: AYBFou1TlkE+wUr/ulYxDE+F0KyOq630L6ywOLGFE0EptY9sSFPaKxVe9Qc//W7xmSn
	O/F1F8F4JY0OyS+7nrcCLN9/Q2+hSy01wNJ5y0o5K200ayIQcByx41esNHR+Y9EhgBbfC9JTg4T
	UPxRz9RXNeSHTeBsQhZMSYMaXr/p0ud9jHrWbPtg8IR9ewdp4ZzLkL11ZvGbZvV0hUOp9Y6FKGb
	Rg4wNQgUfw5R4iWwtuZBUKT/XXAJg8a93jnJy5Uxk1Uig+EfPNNpguJPUkKSbvXgOHRR6Kz8cbl
	/TxhjyXTVsdeZpOsMQ5GzpW0+E18hnxYn5kHhZJqCguV++QARcE4o9QXAPmSkp11z8zmjLjwl1S
	OurRnpTj4qvPRVGjMmxfbT+UAk+uWBmYBWwNa/07HTCVxOnnz8zlmbWP5jFnMjCcXWiYHVqFWLY
	AMBsDKZBzaBJ9zva4pYzWn+ZNhPQ==
X-Received: by 2002:a17:902:cf0a:b0:2dd:ad74:6d22 with SMTP id
 d9443c01a7336-2e49b654fe9mr80221975ad.31.1791121760020; Sun, 04 Oct 2026
 06:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
 <asCyI2_CNSoDJy1w@willie-the-truck> <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
 <asISGdljsG86gUwb@willie-the-truck>
In-Reply-To: <asISGdljsG86gUwb@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 4 Oct 2026 20:49:07 +0700
X-Gm-Features: AclHuK-zrgBelXuI-I6swFhIOsgOnzrRzpoelrWImLhb29cQsM2UcUlf5WCmPxw
Message-ID: <CAABR9nFMR+D0j5kYR+HwLBOHG4WF7PUDrqjE4Bt0-VTUacxmBg@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

>
> Sorry, but how is failing the probe possibly better than continuing without
> the optional interrupt? Add a diagnostic if you like, but aborting the probe
> feels completely unnecessary to me.
>

My understanding is that the driver is designed to be generic and
support various hardware configurations, some with this resource (IRQ,
GPIO, clock, ...) and some without.

If a configuration describes the resource, it means the board is
designed to use it. For that hardware the "optional" nature of the
driver no longer applies, so if we fail to get the resource the error
should be returned.

A log alone is easy to miss, and the root cause still has to be found
and fixed later anyway. Failing the probe makes the problem visible
right away, when the board is being brought up.

Best regards,
Phuc
