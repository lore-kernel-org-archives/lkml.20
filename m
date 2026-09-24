Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D9F4BFE6B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279582; cv=pass; b=RK3AK7s2zq+LD3nA1LEQtRICUkK1ybqFOeJJcFU9V7Ds6TXvV4UmDzY8BMJjI24uHvFuqzhvgzBes+HqhfUBR8MDqfockPF66BvLKI3aizWjBB4LJ58DED0qY/eIgiVJe2IzfxJ2WnGojLvHpDkuby9ImshkXNLKX1PYytmaD3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279582; c=relaxed/simple;
	bh=QoubT9CoXhKpEUyyyBiFnbmENvqSUiUg/q8bBXketCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZvGKxLvVQcAW5oM1OUT4d9j4h9rGzgAkU2RHB8IjbWX1dBP4LIUyoDufOUQwR0mTubc7YZzetNn6SFEiRy308QQwUSp3baN1YlMvuJKkYmGO4wRiwyn8pKt2tESLoGf0AVPPUr1p9zwbyenPc1ZmbCEwvfYTriRQlE4pqVIa1m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=qyRdLfhc; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="qyRdLfhc"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a5e045187so87947137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790279574; cv=none;
        d=google.com; s=arc-20260327;
        b=BmYO2fw/yLJKhiB/TDea54o+qQAEBuSeC2EspNWG3katoMODMA43KoavLykkaOH2X1
         D5FLeswmEBwiopxA9I7e2SsmHs1JxjrNMkUMcMePXAVeVKXuaDRknpM4PTAskwAgmrI+
         g7+OIKS9dwDGBnFCjUNAZbBEHkkWh3/04r9XqZAOtS/7jmkzPSGATWE9pDlGABd9qfcM
         qVmWcsikVJ4xd2kjHgTVBYiCUU7ZHgurshJcuSSfyd+IibI3gNuXGH1Dl8ACtvej6kyx
         UrU4PlFFgD9IXr60i3iLT0zNluBd+XcZe+QrzSgprPwDuSIDP9tfr4pylQhSKvtqIcgT
         aqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        fh=KfLi8yAg5dgExgm4E8GCpxjUDiWLLpE25dHo4DZ+U8E=;
        b=OAHR0wUxU5N4+DvcZM9B2q0lPKYXmoFHr5mxkyPMXOpXlOXjcb/AdA9NAUcdACq/Ot
         DqV1tqoA7XLmaT+9R+BHFnNDYQpRL7sHBiWSbZbnhuRkptnHSeIJ7lO9NNw5qcsYOuBc
         nhV4Xd+xbjnnyh37TLfs5xA/3u3EJXsNll1YWpNzoNe07TEC3cdNptR52f0tadqyDCi0
         EavjtBKCU+3c4dphMXQVHEBJJiOiC47jM1pWTya7Z2EWGIltDaotMv3lw9z3SIfkHxHA
         NynQNXkRRCz/SEwlJ8DL7S25HmXuXA1dcDfV8sKdlHNorBD9Rv8EO/iExO7aclchoApw
         nWKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790279574; x=1790884374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        b=qyRdLfhcgyRcsb9h50M0Xs2yyGilj46mmpAW1RrzesjpafuKgEpQCxfLZXUess3oyg
         WYpiruTSta4ce4G6sFP3W7we6wx9kHBbZehNbuOYCPhmjDkqLLSI5pdElXzF6htOVRXl
         Zo57zg/nuSEZi6nbv1skbB7Z2okM7mV+BXmIc/wr2x1CBNyyob62IYe6G7CI4VwLA7jL
         8s4iADFbqGOc6et8S3HvhCmH0C8CBU9YU/Tmxm3n2cCoPgOVEWzRDBp9oiPOJzDOJIgg
         q38RtBoz9gg0hCxWQBnY0MmEgZaeDI3FI0+QMdbMI1Y4N+TMfqg89CgU3Y7PTVcoEVYw
         MoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790279574; x=1790884374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        b=CGllBx0UGN6AAWX9aUf6oYcAeMVHemqHklPRyONEG8yZLBMoQ5Ij09lEkuQiJtdEAg
         DuViDgGbO3RpLWz7dViucsMGQhL+lqpu7TFqZGxBiKJqMZBTVeBA6zBqdeklJiI2LTRC
         kNs3xPKq3mI1EJ1r/o/36wE9vJZbxEC/ZMakG2+64hyaM/iVtrOust+14blDt+ZrKwnu
         HTqIrBVUlL5fxLM821jo62s+q26cYcET1wlFuhloQSjEKPIvR3e32gOeZZuVfxGlYvCV
         5Ik4DWrIcr2gToU5seHgWP5QkOE4ruQk5cAD5Y8iHbkls4FfWudM5Igi6vPL67j1KCls
         eWIA==
X-Forwarded-Encrypted: i=1; AKwUvByjN0/eHOUj1RXsTDCbxiL9e5cXPQT186xIsvsrUjj4PuznJVqGhcj0Zc0jLjSmjwr4K6VGuZCz3qwyTEs=@vger.kernel.org
X-Gm-Message-State: AFuF++norp7vQn9Y4S/Rq5/IBCr+YzjJeH+8V2DmT7fbrqR/iOugTKI7
	PSXmqaYBB708vMAUSp+D5FzupQ83CZk3/EE8X0JiSHnuDsFN7hsES6NW/ZBglvEN8dae54S/MIZ
	w3/92a7D2Mz0K5AYxhuc/MIQhurevWJu4AtFkm+VfAw==
X-Gm-Gg: AYBFou0z+45wQEIgYiwJaqYtajP4yH58a5AujdHuMWHObG7J1X2BubJk2bxRrSvt0mb
	hirbTU+FpTTJlU95Y42H+D2RaDnLS9I1Rqr5ClQYnSgjwzCwxxdIZKcj4MoPpIuDV8lztRBh4qY
	WmMDIremTWRnDRkAfR2T7d30Zdg7pw7vdlrCQPr5M2P9JTqlDsDUGEG3c7wxGfPAKfcYK6zkujS
	5WY8RxDQVqpgTgiJV8+bG2foEMJnTDGPpIl3AD3Eu6vJJcRIJfJ6BZM4Xt8BufLW1PNaac6aXSu
	pLoYRLHFWQY+kYIblSrBuRxa/TO55vii/laGoV+NaWqygWjCEijJXMszMHaK0rNdQ0g=
X-Received: by 2002:a05:6102:6a83:b0:7a2:2068:6b67 with SMTP id
 ada2fe7eead31-7af1dddb820mr1606892137.25.1790279573796; Thu, 24 Sep 2026
 12:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924125940.22665-1-lnicoara@thinkoid.org> <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
In-Reply-To: <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
From: Liviu Nicoara <lnicoara@thinkoid.org>
Date: Thu, 24 Sep 2026 15:52:43 -0400
X-Gm-Features: AclHuK_leAsQLblHRxuOpdcET2NRKKGqkd34mCi1ubZfnnfcE3YhUz2hrAzgGrU
Message-ID: <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Jonathan Marek <jonathan@marek.ca>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:02=E2=80=AFPM Jonathan Marek <jonathan@marek.ca> =
wrote:
>
> this is just papering over the real problem, which would be the regmap
> cache being out of sync with the HW registers. there's no requirement
> that the volume register be written after the int/path clock enable
>
> (fwiw, this problem doesn't reproduce on my setup, where this driver
> does not autosuspend and the regmap doesn't go into cache-only mode)
>
>

Thanks for looking. I checked whether the cache and the hardware
disagree on this machine (v7.2.6, where the macro runtime-suspends after
3 s). With the macro suspended, I changed the digital volume from 81 to
69, which updates only the cache.  I then forced a runtime resume, which
runs regcache_sync(), and read the volume register straight from the
hardware with the regmap debugfs cache_bypass: it held the new value
(0xf1).

However, on my unpatched driver an idle volume change did not take place
when playback starts (changed it from 69 to 81 and it played at 69). A
change done during playback though, takes effect at once. I don't think
anything writes the register in between.

The register holds the new value, but the path does not use it until it
is written with the interpolator clock running. The read/write-back that
902f497a1ff5 removed did exactly that; Johan kept it deliberately in
46188db080bd ("Note that the volume registers still need to be written
after enabling clocks in order for any prior updates to take
effect"). Unless I am reading it wrong.

On your setup, does a volume change made with no stream running take
effect when the next stream starts?  If your changes land while the path
is active, that could explain why it does not reproduce there.

Thanks again.
