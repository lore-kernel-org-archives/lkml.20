Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BFF199920
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905229; cv=pass; b=fu9KyxgHw8pxEmPCV0uNXJCXz0qjE9f4UnaeClIMHcDh5u9aqsu4GXgTw+HvRuMni3+PXCNVIirWMTXFdWurP+gqPiOQKCVC61Sh8SG9Ihc6fdgvwS2JiK92kdkuNrD0jtlviJS/ldLmrL1eHTCk3bidA5zsAGYV/BVe0aZ8bWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905229; c=relaxed/simple;
	bh=0k16NvqGLpEZuwKFNrchs/B0fFA7CkRTfrBlgsWVXpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/Eo4FWqYrkPxc3WpgptZdrdX4eGd+01iNPHP6RNkeZqp4n5L7h2QU/b79aiBHUb5O3Dx+HkGfc0b7DEkHLZiEGCo7pWfbIoY56iDx2AZXqKkqBQbZsh3/RSf+vWm42FZ+iS3ySKP7AmNYYrvEVxy4tu2x/k4tP+nIFCJvrQwXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzmcyZ3P; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzmcyZ3P"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so3042600a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787905226; cv=none;
        d=google.com; s=arc-20260327;
        b=b23K7RnmDcesXLAITeXq73joqJDx1+oSh4EcbU5jz+4CnRxau+ISBeSCmyU3CvNj80
         FY9SiwX4euW+sqy4oVLcgQlBfhAGvI7kdDmY62h0dehlfDOQX30tBps1V4EVUHh7a++P
         Vxt/iY+CVFDCtzo3YJFDEZK5kHF80t2/YLglfP0Pq/dwBjLGMImPKKIszBpM2TazAujl
         yKy0szljTlcxfY7hirYewcL69B7Z8VWS6/iIUsG4tq26kJYEt4oPW1mVvljh3mZ/gkPB
         20sh1tEk9rLqvKR/Q8OD1Er52YAqOg3xNxtsRFJ7IWzoeIhpK62KF4DiTNP3A/5jIHkd
         gx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0k16NvqGLpEZuwKFNrchs/B0fFA7CkRTfrBlgsWVXpE=;
        fh=15R+Utb6BAVHH+fRIlyGnibJ0eobxIQJnnBoT4JgqVg=;
        b=KxTbMDyPSk/B9lTTMTn7Wd/2WIoG0g4xlv0iLik9kT1d4YKXjTZC3yIh3ti3qTJ6T7
         wjJtvV+/HnyDDwtK8jGZ8nqYQNV1ICwMwL4ww90y4NMvmEPf7NTTQ2YhJfjM9BnbWH1A
         qKH2AXCudJyN7iEHfgxWMhTKWmuYPRva+pvnPERBmHCWuwUvfsJCKGeWTvPZtXmq6JaO
         dXMpwd0Ll6q0Y+5e8K3dx5ZmEfOdQ0rVvz8VmRx4If0ey+CME1oUkQdUypiO693ekAaf
         eKBeKxW0ZM6bOUUTYDGNgkYe7vLUvAExfdW/nr5NPAIta6tu+Jqq1WybW6EBkEOn59h8
         2LjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787905226; x=1788510026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0k16NvqGLpEZuwKFNrchs/B0fFA7CkRTfrBlgsWVXpE=;
        b=TzmcyZ3PMHnMOggBiaeFsOAlYM5lI9hnGnRmqqparAPzIBiOBxB8NtPg4CvbpQUkwu
         8a6Jv0YpmGCVENqH0HJ9BV6tGSCWfB/Y5C7qAAV4ZSxO2M3P3PdnmbraaVIVCMgeh/7f
         n++C1/YCZ9O13MM6eItW2aoLmLWGYjPrQB/Ut/D6vp2eoo7zO8wW6xtCb7ky929tdSwD
         y4EVq4UBQEi4GxO5G+3vOXqoj1tdCyVYKA578Y/VhtM2f6VefBggs/Z3duGNDqJAt73o
         7SvbTR6kqtvbrEegskq3AOC2xCfht/lShgABMR1bR74zqMUSGH+kG4jFuyZbGutFP58b
         T8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905226; x=1788510026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0k16NvqGLpEZuwKFNrchs/B0fFA7CkRTfrBlgsWVXpE=;
        b=FqTbMUixrJqCciZe2kC9TemMdNK2FvRfPX7SGmYdlQ/qo9dBbwoHawaB3yagauO3GD
         gN/HWlZsyItIOnAeHWeAX8Ge/rvBDD7Tjxqk6EFOfEKX4mcXo/ybHV7k8R0S8q03Mdl9
         d77RoH1xtBkAyL+t87BOAA/sNTFd0rAgddj19GEgScBBgRPs0vMDrrmqTlfoY3USTJSH
         jO5AXB7HdaW3zAdgz3h7Zecp/hmXPzPxfSv79QJN4jG/tmfVjOSwJBjevaOKPtPhDQhx
         NOky9943xNXjvkcSSOzJDdlGmxMsR0maJS2XeCD9UlVs3WahidyXlado7xF5vCSLPzgg
         e6Gg==
X-Forwarded-Encrypted: i=1; AHgh+RqoVcYScO52MQLZBimopqjHwhuFr1FVL0ex3iwPubsKiskDLY7YgzWP/T8m99l4/DNw/H0op77PDC5qjIk=@vger.kernel.org
X-Gm-Message-State: AFuF++nghFkK++Qa/BOD55yoqipUxqw2G2GHRHb8LO9LNmO3G0zifUc0
	ylFy77UYVI7sb8yDwfUWsYQIT7TXvYpK3wbye9VGnT51se+0AZmSej2NURb6dzTPDYvHJQjdaXg
	wMfMfUkl9EjOwEvy2g4lerKbiZkKn//0=
X-Gm-Gg: AR+sD10mIV4HvUAE2Y7SciyFVJ9TLSYjNE7lIZfU44TZvgKPYQ8tflMJFrzDwQK8T/D
	TsGpdTOTjNEKFJSN0LA+yxUDn37JebMBCP1YFdgIwJ2K5Qo1dsNDXZMkvMDw0e2Yo2obV9eIaws
	cA94YcCShLzsQdETUV6IOY+3iejkE2o+sSlGug96axl6G9frWvGsLq/ueP+S6yfCG1jrp2EGlJH
	ML5Bsm1IHtSrvWuT1jMzSJo2fMIFsea0VUmATa3NUXQRrjEg3J1c0u4PIEteice0XrDTMJsm2Pe
	VLpx7LoEkDNE6/4ggSgb/SDVrfZxuVoKoRagAchqBfXKzTd2B9TCKU/R9q8xv8RbQWTquttgCOL
	xTqGI0om2FI0It0yC4ogq8vY2exTx03BD7Uwu1s1TB1Owkiv697xFXar9hqj1kcsPQv61ggnPgA
	pC7Jld4ewF1HjhGDSzm9c8E22R3thw+g==
X-Received: by 2002:a17:907:97c2:b0:c12:3cbf:9f6d with SMTP id
 a640c23a62f3a-c2553438ad5mr349187966b.1.1787905225763; Fri, 28 Aug 2026
 01:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apFDQhk9TUoLnEZt@gmail.com>
In-Reply-To: <apFDQhk9TUoLnEZt@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Aug 2026 11:19:46 +0300
X-Gm-Features: AcwNN1WCy68cjgOouN7IuXcolh-9Cy6oFOkAh1sFEBI3mJFOpc2cfdjaVoJZHws
Message-ID: <CAHp75Vd=0pPVFRrMOiioaCnZS11=nKNe9op7J0xeuafOzqV5=A@mail.gmail.com>
Subject: Re: [PATCH v3] iio: light: ltr390: Remove stale TODOs
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Anshul Dalal <anshulusr@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:14=E2=80=AFAM Chang Yu <marcus.yu.56@gmail.com> =
wrote:
>
> Remove stale TODOs from ltr390.c. All features have already been
> implemented by Abhash Jha<abhashkumarjha123@gmail.com>'s patches:
>
> [1] Configurable gain and resolution
> [2] Suspend/resume support
> [3] Support for reading the ALS
> [4] Interrupt support
>
> Link: https://git.kernel.org/torvalds/c/13fad2607dad [1]
> Link: https://git.kernel.org/torvalds/c/288ce72fb5fc [2]
> Link: https://git.kernel.org/torvalds/c/14e0d914a855 [3]
> Link: https://git.kernel.org/torvalds/c/7ca4b8957066 [4]
>

Link is the official tag, no blank line is supposed to be here. But no
need to resend anymore, for this patch I hope Jonathan will make a
necessary tweak whilst applying.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
