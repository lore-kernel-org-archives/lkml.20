Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3233750CF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621359; cv=pass; b=fGtYI7JXWcz2JNbtRBDH4rOGNp9UlkVKIRmxhwHq2Hy3b8h2uh8KmUnRmgvK/qosQlEzUkqv2aUnJliN979wYvYQJzUZlm+zvA3y/xWFPKE+3Tw7mBZOolI2pamZifNTzNQIC5IwN5KZA61j6aFFyR4D6tVJxDxUYq6+YfTMAQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621359; c=relaxed/simple;
	bh=+Ah0iXSrbj/vIWOgcYS601AF8sHPjPNavmOfnknsgk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuyMbOJVkEUrCaxusU8cqAKD3LUS6AOKDnW+892572WgvlDMKbn/XGJDwKNvdBin+uMeCaVqLrrxjBIe20jHDnfKN97V0Owoho/jijzSgW4FsiYmrWceXCMOUXcHQvpyYfqmPzNq/dz7mP4iRLLaDjrBoTCGW3/PF9x6rAnP40A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlPELZ6s; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlPELZ6s"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33c2520ad38so950387eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791621357; cv=none;
        d=google.com; s=arc-20260327;
        b=SjwETBpJFbGmBSDmzfdGn2eIQCrhjnfEydWADwqUDBIm0sDNzAfPTceAeYhLYocTE/
         re7+BTnEAMCd2QzV33TxAekQVPldGMureKugdIn2FY1DYL0kmjlH/ngB8tRe8Mq7TLgc
         +0IAonq1GmzyECAjzQ6hdHSPZL2swfRwQU9pRjkXPF8Dw8Vum+eW314iwgm63UVj9Z6X
         WKaZDB1Ga29AxahCdP6nur/dShcK/Wcq8X4GNAMjNVvw620GDHNF41Txyr4xgQPYLdi1
         xnTnEuf7w64YdCDH4Za37ZRFHXQN5LX3fPVPcp0dyq1aoKDcT+B3xfD3eFAJxPAmpYzn
         biEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MjeVPOBrZxZk8zOp/qAcB3ja6M2cpy7hSuGh4PvxsM8=;
        fh=VunCmyt/J3raMWjoUYFP2ajx1N9qbk/ad4ZOwAyLKoY=;
        b=HTP5V2iP7v+owmd15+eogMgU//t7nCZrpyWyzv3eay+3knE4noOpFwYMi8coC8dUMg
         eF8jNBWkCHOPPrpW1tj+VmrueyDhvbOqrLYZYONvTc+UdJ75ZoTxR+5sB3t07TA5UXk3
         klLIcSa+j9ibvasyxpl5oaIOM3Y+2CHTGxON4P18Yv1RySWTHvxh/xitSzUxJzLArpZ7
         lU60mM6aOdEcPhF81Gfwy+WmjsEz0M7h3q7Cl3ldxgn0wGZgcEInBik7Xx7nU1rsDdEc
         E9sSvvHX41slkyTI7NNtJZG9I2KwJ2BpVRH5yMEA/7qa1cL2PZglXk5HKvJoOQ6kyUdz
         /bxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791621357; x=1792226157; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjeVPOBrZxZk8zOp/qAcB3ja6M2cpy7hSuGh4PvxsM8=;
        b=TlPELZ6spcRhrnsiajkHguyuT87k9gYOAxxhFxBbeUh4LCU9Ljuwi4xeNM+PP15qS/
         PBy9vjx1tR/LojKenoL3Eqi1+3r/FhOal13WvNjWwMUBO4DQR2lDmZiS9Qo3qJ2e/4P6
         Lu9YP3pqSb4q7U+ifLBQV8i4yKC8KWHGZVv4fOBUUHWo8oLQusE8UogmMHMcG6z5dSYx
         vrrLfzpp8funNiW9EofTkdcTMnwBD6nZfMOm3tD1xgbKKGhFaSb8hb1SmP3IO5uUjPSX
         0lyxAOmuqjs3OlflNb+fODP8icALqqBNBJDy2UaFLpa2GgZM1C/JnFLIQSQFvE6Cs6MJ
         H2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621357; x=1792226157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MjeVPOBrZxZk8zOp/qAcB3ja6M2cpy7hSuGh4PvxsM8=;
        b=CtAdJXFFAQeMsVBkKmsBhP+nS/GJ5OGYb0wMjbQQwxhC/rFJkUxHFDftHlEZs5rY91
         yr2xSqP0LCHogVWeLwuzI3D3tTNl+skEV0zleXIyY+mfWr8bEf6hbhTm4k7GtFewJlkU
         gz2Gpm9lmTqt/fGgAApFiy/TWwswjd64Pwraz7mBxik0Mjax4Wbrq9JCv9uT2g5qWIvR
         g1Hs619wNE0uubtkaK58FdqBfxAk1t3GD70sfDH/kjdykKuZNKqp3uC/zWUGoJA85OND
         yxJbYcsg45sWfko7RBlVxh3mCyyRmNR8lF+VBJiMWmW1y6NTJOAL4wQgPtLafz/ca3ul
         YaoA==
X-Forwarded-Encrypted: i=1; AKwUvBwPxHUMfwBDx5cAEAwFtzPVviE8MVk4H17PZHFE55jPiSJk3i1BD8KhWI0FzJHEGXG+2+OAnpcj6X+ceaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhA+0dntGthWkV5BVh0yz/tergHsEUqbzG2esbiGBgwq21p8m2
	7asf30XULc8enEd5PjpypvHrgJyzeyMdu031l57zlGKs0OBRafK07S3ZldjtIxFS10KR6MHsPKu
	0IHOiQHMzsG8t+H0o/319f09NI6a+3xE=
X-Gm-Gg: AYBFou0UVwNfU05hCOCZ1xNhr3kC8EIsDxUt3Q3faF8ZvIHTUt2rcJ+BRXjyENQRLlm
	Ruu8Ax3q+NG5M1Muw4obe6X70RrjKCnEbszQsE9GP6oseDU+62Qx4YnG0zGieyqbDJ0ukkBjQYr
	wSM1fQk5b9tfq7VpbdJoiqGcP3HAZ9/WvpipTXaj0d22/8esGZ8gFMKzw/yYYlIqTE0VcVKq1Al
	Q/dRCw6KH2LYwpABldZpeN8/koWh4Jya+CGR3d4pvd4T86izndoUM4YLnmxuNXA+LEK+I0rOE+i
	+EcnzfD648HHHJuwge4UoVEYyQ8Be3WxHugXIDTcKgceOsjKE0hrfGyMiQ==
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id
 a92af1059eb24-16a5f112b00mr5539162c88.22.1791621356878; Sat, 10 Oct 2026
 01:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919235145.48273-1-marcus.yu.56@gmail.com>
 <20260919235145.48273-3-marcus.yu.56@gmail.com> <arVqTWVw-eIZEcrR@ashevche-desk.local>
In-Reply-To: <arVqTWVw-eIZEcrR@ashevche-desk.local>
From: Chang Yu <marcus.yu.56@gmail.com>
Date: Sat, 10 Oct 2026 16:35:41 +0800
X-Gm-Features: AclHuK_Pdn5Y5rSwaHJD0Cqyy5Aqi9sXQlyXeocnYHJYtBTpz7Q3w3982yGkDko
Message-ID: <CAJSHAZWqWjtfmZu8yL=7e1T46CQ9YmY+LRdVmqFetqPOhsF6rA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] iio: light: add AS7343 multi-spectral sensor driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Hao <i.shihao.999@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 09:22:05PM +0300, Andy Shevchenko wrote:
> On Sat, Sep 19, 2026 at 04:51:45PM -0700, Chang Yu wrote:
> > Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> >
> > The AS7343 is a 14-channel spectral sensor featuring 11 visible
> > channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> > flicker detection channel.
> >
> > The driver exposes 12 spectral channels (11 visible light and 1
> > near-infrared) via sysfs. Runtime PM is implemented to stop
> > measurements when the device is suspended or torn down. Power is
> > never cut (PON=1 always) to preserve register values.
> >
> > Future patches will add configurable gain and integration time,
> > interrupt support, buffered reads, VIS channel, and flicker
> > detection.
>
> ...
>
> > +#include <linux/build_bug.h>
>
> This is unusual to meet...
>
> ...
>
> > +static inline u8 as7343_atime_steps(unsigned int step)
> > +{
> > +   BUILD_BUG_ON(step < 1 || step > 256);
>
> How is this any useful? The step == 1 gives the result 0, the step 256,
> 255 respectively. This covers the whole range of the returned variable
> (u8).
>
> > +   return step - 1;
> > +}
> > +
> > +static inline u16 as7343_astep_x2780ns(unsigned int n)
> > +{
> > +   BUILD_BUG_ON(n < 1 || n > 65535);
> > +   return n - 1;
> > +}
>
> Ditto.
>
> ...
>
> TL;DR: I do not see anything meaningful from these BUILD_BUG_ON():s.
> It's not a problem if the result gives just wrapped-up value. Or is it?
>
For now just letting them wrap back up is fine. The values are hard coded
so it's unlikely to happen anyways. But since these are going to be
configurable by the user in the future, I'll make these into runtime checks
as per Jonathan's advice so that we have a way to tell the user that they
are doing something wrong.
