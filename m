Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288099;
	b=w81c3deMfhFMK8K+VQ4FIxUA7Zm8W0u1dAiPAw85TIHI1WFKYFwGxPtrMhz+dsEBdYeY
	 iXoAX1TPrDsZdQSrqB3t4qSvJQiNMO2ZIa7owbiCsJSLUcuUbuP2tt7tqApR1p+wMWQ/x
	 BhcO1dNvzYh0xqlO+cDA5kpo52hNb4GH+JRT/h939gyOaoY0WdfNcGXjUvEVwVF8R0wka
	 6RS99oZOi7kCwZgUDdmpqpvB3JVMgoa9FrQM70FFFcZ1UyU/iJXa5QJMUBqtJkXgh5eDg
	 bzMphi65ARLCs88ENGNheLcoeZhaUcWA/JxiJqa9wEX1JsMdt00mbv3RXFzfG454/VA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
	b=Zve3WeI3H1oPblOq5PM+osczTmM5YbAMlQIVtW7xlE/wvJ2sU1Lg4xJ75H4Z1nFzqEgT
	 8giC649YmZXcuD0P1FHZi2S3/bQB7lHaRU3hXi1ZS3S6XnkSDpvfnfPgJDfCWxDMfYpap
	 O3XuxO8rhCVgcatiJIIMR5+B0pz6znNnYl8ISmylGWh6Sf8R2m9Qy4lNFPNvIX4ETqRgs
	 Ut6LzwfL5CQ/natbMchstJHEE3lM73/350UkkHiUtRQqJYSw4TgyEzuKf9fVJqXQcL78A
	 T87pAWE7cuHDgnH9nPLvvhp6/KPJXsATNgFkeHLKRfM5mbo/unomJqRsUhzk2Uu2RyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JU48K3St;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71832606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71832606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JU48K3St
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so16974671fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288098; cv=none;
        d=google.com; s=arc-20260327;
        b=UZlBZLRFoznGAL9O5djUwBKfsB2m4qoPxhmakwVhS50XmUFtFHUVjlXJ2IUv2OGJJR
         Sz2FAKn/xixhD3pmrEzPkvZzAjEpUjrnPguUszlZLqMuePH9yQaaEuhVvmwTbKGYmY9V
         uin1J7k1l4uM5dBdaKhJuimtWuvCCNMn34sJxF1wD80U2EldRyuo09v8pZUNtcak0z8W
         a7N2XsRrzy7mS19ijiZhi7klyIPjaBvDO2AZAf6yobiqFrcYTDO9Sb56puaaH8BhNFhm
         uP2Wg6ZQ7vutK0izzLCBzYU4IF3RAhjbk6fiJYSZMfoOsLR7WiFrHk9jmqbq0zqnruv2
         9Cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
        fh=twSvucFudBtfov+WnadBVqekN/pDFrwEpYFzBAexwII=;
        b=FkKTMMEb0K0uWuDhqMNIyVAmqcMD6LRDjlJcN51S1i4wHLFSoJDA6iv136kEq4PL4o
         /HvSMnJF6Mt2U0NgMFqo0Q7Y6YBUV3SA5nOwg+ruMIZ1GZzjDlw852H0k1csbLl3DVM8
         V1MrG6AVYgr2DoxJarQHRA1xT3W42wekhkdLfq9spBxuqL6gcoD2nqU2ZT6tB/dy2aHo
         ANmNgflCKrJdo+RYjq7GmJT9wu0+OFdLpgqsMI21silGdDm0A4rnW17GX//XIYZj/j8H
         P8lW8rhji9egnv+UoJSeq2QGvMiNzBMbHsrWdBNb9Lo/e0VCGfUqCtU7g+WNJXA9CZM7
         OvZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793288098; x=1793892898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
        b=JU48K3StrPmJy+BWBXIimZZVccOgFf+hwfyzZld26az5XfF9tBNddSRRA6EbTNH/iI
         1gbEcjpkkMPDfjRZj02sayE/rDgogPl0HqX5RxpF3COYCVPkhy43++ax7kr9CZHbByT3
         /dG90Httmlbxd4g/b2oVe3D6+xBGiwLMUqyhyuPWpEoQ5MWrA2UcABudFCclnuawEyZk
         dhu2cpbb9eWELAn7JEH4LlscXqJmgRxhSQVK2TuZhaGHbfJ5Nk9UuZ75GB/iVe7JDuZW
         iHoDmjlZjcOt1gUo+onBNqR9c6cLGbeiJGrW6NvFYLzqSHKn5MvAW4M3q02ZPy6GtHkO
         6z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288098; x=1793892898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5Rm/IwaNhYgMhwcnqL255xWGYwp8sgs8BcKPKPbzD8=;
        b=L6ffOF/ViSfaC+rzsfxcII87d39Q+/dgswXpMKfmTtoAZmJRWO3Yu/0M+GVLsleE5K
         Db7q75wByU+rV47jCmrolo3lyAyI0v1N0EurxBdvaIC4Yl5HOmlhAcW1YDGfnYG6Q4k0
         GIzryIZZcSyTPIfFlNSD/R2yFGIsBuJ1d9+R0/DyBXwauRxXHPUGKaE9inMWdf/2tYkE
         qTPns65Es4thZQZ/xbTnEvtShQGYSSw0bdYeDajY1ArxIU/gl0m8Mlq5Ci6n7tSSVy5m
         2+BHvlYAmPRVWzWjziC9tSazpU+hUri4OZ1ARPiOMpy3/7qq0V1nVDyx7Paid0falf1D
         SX4g==
X-Forwarded-Encrypted: i=1; AKwUvBzw6nTMyK8B+upTD+cJ+L+2gzon01j5AKQ2D8UW30FoV/XlphS8tELAvh5wgZEDlkoOLqaqzjoif3y71BE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJlT3EEkl9dbf5v8uCiYCjRpTmS+bw3WL7gQCA0qursfkNzg/1
	rJtqhbpPEmUl5YUVu1Waufe6skmhC+ZNfRT94UzfWhl9QpOAKRO4bsG5Ki2bwNQQneotaHqRE6T
	XqRfOFFDCAGD+TMOgG6KR5sDnBD0CwwQ=
X-Gm-Gg: AYBFou0a1a45u1tBRFrLkIt1EnROvE2g5I4v7CJ3RI6uy0SlbH4D2QBNvlho9tTWGUD
	jVAITa3J5AQ4dpxryB2GwAYwPQr4CpjcviLpCHPa79WwUXAYCW46PQW15MPbLy2Lv8KrQj9gcIX
	9RZnn2H4ykEvDPVqd6ycklJIpA2ZjjXbiLcZ/GVJrjqfhQjrI+lxs35snPgf7NdAeDWhj6WWy8I
	o30Nm5Gp53IKPAPITdiGQfytaXgeQQmR7xwAmEAaV9T/nWKFIy8iEUj/GCaT4yK1ASW2u5L/ZV5
	B9qfqzaOEQFJrHCwisMkd6hu1XBObPrSUk1jXfayj8IoP2Lv63zF+9BA0/QqZ4rDUzcKF8h+rDf
	/jVfXRozC6r2g4YfJtB+eZhrz5p5wldXWc60Hhaq9ZQOSwLh1DL+R9799O7KUBotCGqm6QUJU9a
	zzxW14rlV9/hcFegvTcXRTi1vM8ELorKUU7N+01lMRgxXuHe7Vz5VT
X-Received: by 2002:a2e:bc01:0:b0:3ab:4107:1bef with SMTP id
 38308e7fff4ca-3ac9ce5418bmr14386351fa.1.1793288097433; Thu, 29 Oct 2026
 08:34:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com> <20261029091141.GG1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261029091141.GG1779021@noisy.programming.kicks-ass.net>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 29 Oct 2026 11:34:45 -0400
X-Gm-Features: AclHuK-YqVWgs2e1oeI2-sd1y4gbLXMqMG1B76Dt72P9DpeCFgJ2eqCh-7oWuCk
Message-ID: <CAEdQ38GiZLmnjYxzN6C92uz4-MOX7KoYvTuRrZ5Zike8ssDCqQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] alpha/perf: add ProfileMe sampling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Oct 28, 2026 at 02:09:29PM -0400, Matt Turner wrote:
> > The 21264 from EV67 on, and the 21364, have a second performance counte=
r
> > mode, ProfileMe, alongside the Aggregate mode that the driver uses toda=
y.
> > An Aggregate mode sample reports the PC where the overflow interrupt wa=
s
> > taken. On an EV7 that is anywhere from 15 instructions before to 12
> > after the one that overflowed the counter, which makes perf annotate
> > output close to useless. In ProfileMe mode the CPU picks one fetched
> > instruction, follows it down the pipeline, and reports its PC along wit=
h
> > what happened to it: whether it retired, whether it trapped and why,
> > whether it was a mispredicted branch, stalled before map, or was killed
> > on a wrong path, and what PCTR1 counted while it was in flight.
>
> Isn't this the thing that ended up as AMD's IBS?

I have no idea, but it wouldn't surprise me too much :)
