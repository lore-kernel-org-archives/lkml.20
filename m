Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314193;
	b=urk8AFuNe0HsJOqq7MEmHXQfGPsn6IMGzbZnFA1Pbv3RnObu6oZVMfNxgFc5kwy02+jq
	 uhgTdNZeFoKzyi4EjyxGCvet4Q+b/gzYxTZ3jEP7p9wGnlqu/c8rzYjJ4vHszWALS2Dxk
	 u/nD1x6MDKb+NTAkROAVdFhWkGpjwOTE7qoAhccbg6+avzY9Ksf4KhOfjKlTt2fiAgNHd
	 ymK1Blb8Gz7V9MFAtKg8Xzta6oSGtoWf4bm43V4FFlQSRKrURZGAEz4Vvi4nvzBw7Ztpu
	 PrutoqWGtE7hrNuQob7fG0A/MzZfA26OKYIQCdDWGgpEpQ679tSp8l3WUF6OYsQFI4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UCyHUDojeaiawZobyhmexXtTH6dNWwo2NHOImjmL6Ps=;
	b=GjMTZI+G6U1ydbBUXutDUfIcr71ur/VwXtCDUNb4uqka2P2sYcY5Q/b2/JLU6upPyvs2
	 suEV/TQowMLe3Ar2WdIfN8mVwpQQ8V0PK8p+8ih5oNvhSIyirbbv+HouT4uWp3pPmx/mo
	 1GnjgiNw28E63/hLQkUjABZ00lcIGHoile+83pOEc+bW1BaJW67kxFa/nShdYahGqK5rr
	 WinQ3EQKfGcacdC4+ZdZ9VeNvsTPfXQT8w9M9xAacsGkTJBRlC+Dxkawhqrp1qb8Dgu5X
	 Pds0n0DKVMVeLCA9qEykVTLFsqLDhsCoXrS4ANDjzZ4HifVGtUdLDGim02hHRXCWgSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GNk0yHYd;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B62606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GNk0yHYd
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4697404c2bso4801466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793314191; x=1793918991; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCyHUDojeaiawZobyhmexXtTH6dNWwo2NHOImjmL6Ps=;
        b=GNk0yHYdCL81OyFqHlHZl5jcMsG8rXUuRuFaNpaVC4InijraKU7eocGujc5q8kSdrb
         Wf7ipVFm9quyrKZVJYY1Eu8ma/nQCMzcqacJoirEROXf6dFvoP3IaTZAopkjjRdg44Hq
         pp8MUxLhP3/hDL3XW2WcuRlPv9WPD1+Doc7Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314191; x=1793918991;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UCyHUDojeaiawZobyhmexXtTH6dNWwo2NHOImjmL6Ps=;
        b=za2S32q7zYC8ZrzgjpKa4JBIow+2k7BcoEuHtFwGmft/olga25Rxtps+RRVQLfpdlH
         LIyN9TN0pRYzWE2y5SFT9XtgHnzRBv/qOhc012Pl9PAZvD6DfxmvaELw/jsMyizWcIHz
         o61rTsBb+pH9xIrAcCAOxcHZ9Sjcucy+ACWV27J8jCG9DovAwC7FhjJZcxvcm2UKJNkq
         AnxXSjdzCwvGNhvC5p2aXwh0tUgRmzpaUmpHfh6BBOeucG/PwvjdVK1UZzowYg8ZklWq
         ZPolV+O1xPShR04N20/FNTiKxTKvhBx0TuUh6Gu4BrzSEmD+7+hZM7lFR2THBo5xC+z0
         LAUA==
X-Forwarded-Encrypted: i=1; AKwUvBx/sTYwCPViepEnmgS0AAYbYL49zxrHwtw4iCKaEzBujsRbOFIDO//KvGB2bJNVJyitXGc6A5+V6pCEDBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtKa1whwVAguQDAxOUGAoXMVUP+Mf3t94NHPB5rKdsXw/tIBdX
	FOpJBfAA3uXMfpgz1Azun0XP4oBPkE24blgbwPVe/z5ugw6vMjBqEE65k616C9z3Yh11UZ10j61
	vsnMmG5zSBg==
X-Gm-Gg: AYBFou3vSGMMtejrcLJ3yrO1JLhTzoJfKlFIOudBdKgE1cDbYH6f6fA5ZoZAnxmJfXx
	MUsQi4p2sN1BxT8j1Gn2epAgmoA820CcGKmM0SkJW5MktyHoQvxnrNB/CC+GQM7xQcghGiFoVK8
	Z+JGM8o+znWC/4jGfUlvIsHaxyFbZe5bGnrqyC8yXFcPT2YAAC8MleERIJ3dBFwzYnUnEs0W+kL
	0qU1KM/q5hurUdkgURJfCI/mloFQXIiaCRNkOCT3uH943xoSzDxIu9Tei1clhkvEBhF3s3T4zdA
	tImx4OFpyFz+SZy01rZH6IEu+6vsEHyxavnG8LcMi6LRNEwJKEFbwxhvC/MbabhxZwVTRZDIEVX
	Ac3Fo3hQsd1/5pmH74rpTzxy00RasSJ317Gvr+/tF5g6XpGU/73RJUcsryJ+KoJmSFGHFVoOnwC
	wzQREeFvdcmVrgW+xD+R3FjwfZhEwQYLHNBY1nGcvBt7inEOcPL5AjQFdrzzKk2Y0OaIE+egRAl
	zlCcOLfyw2iwyyoSYZVrI+/oHtfDpfIxutMzHll2Fqx4YGy2snpNldb8Lps7IhWy88cuZMk09Ah
	svVLLoLo9L5KW9G/22CNlpW11UxorsGUKiN4lmMhH0lR3DCusOixWr8uWYWzGtnbQIoVQVUVFjE
	IqBg=
X-Received: by 2002:a17:907:6092:b0:c46:7fa4:9224 with SMTP id a640c23a62f3a-c4ca7a42014mr39565666b.8.1793314190662;
        Thu, 29 Oct 2026 15:49:50 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4caa337772sm7360666b.29.2026.10.29.15.49.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:49:50 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4697404c2bso4800366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQZDhMt2nGwqvyFs2xnoiY6mwbjFXEyZ2skzukhykfmO1nOZPceTOcSJMbpV2Rgq93U3SZG+7QX3icAMY=@vger.kernel.org
X-Received: by 2002:a17:907:3e22:b0:c40:5ee3:8698 with SMTP id
 a640c23a62f3a-c4ca7a9ec9fmr41675366b.31.1793314189653; Thu, 29 Oct 2026
 15:49:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5df90753-163f-44d3-ae93-c6be6ca8647c@gaisler.com>
 <CAHk-=wgrPOQTFxy-mV2EaWLj9RvHY151sQTQ8jc7e0FiorhvDA@mail.gmail.com>
 <2c9bc34c-f0e0-4b71-a1d8-bc2881d1a7d2@gaisler.com> <9d7432f2a82685fe36f807a38f4ebd0a76f1cabf.camel@physik.fu-berlin.de>
In-Reply-To: <9d7432f2a82685fe36f807a38f4ebd0a76f1cabf.camel@physik.fu-berlin.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Oct 2026 12:49:31 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiXTPC_jJ9o7k2JGVwA=F5_JFt4ikY2J4E69xJqYtAFGg@mail.gmail.com>
X-Gm-Features: AclHuK8ovhjIuw_35KXUyLPUI3rgCa2BuC78QWMpFkG7i9RDHr4wcqAe8Ud7n1E
Message-ID: <CAHk-=wiXTPC_jJ9o7k2JGVwA=F5_JFt4ikY2J4E69xJqYtAFGg@mail.gmail.com>
Subject: Re: [GIT PULL] sparc updates for v7.4
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andreas Larsson <andreas@gaisler.com>, David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 22:06, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> If you really want to modify an old commit without touching the date, you
> can use this git rebase command:

STOP THIS DAMMIT!

You are now telling people to LIE about what they do.

No. The fix is to NOT REBASE POINTLESSLY.

And no, adding a "tested-by" is simply not a good enough reason to
rebase long after-the-fact.

So stop doing bad things. Bad things include:
 - lying about commit times
 - rebasing mindlessly
 - sending me pull requests for stuff that hasn't been in linux-next

And if you have a *major* and actual real reason to rebase (completely
broken history that needs to be fixed), it should be mentioned and
explained.

Not hidden away by lying about the commit times.

John, wow I don't want to pull anything from you, since you clearly
have this completely broken mentality where it's ok to lie about
rebases to hide the fact that you do it.

     Linus
