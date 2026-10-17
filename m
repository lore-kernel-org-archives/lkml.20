Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A950437F312
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202841; cv=pass; b=DHkRRUILIQiUWfv3OUTK4nKCY/og8ez3eJbFWMhTxcKPDisnYNO+9YluuoX0q7N2Z9m7vfhnKxaVjbAb1O+ZA5pTqYhMGjUHxyjgVeP/nT/bxO/CZ6bdUYwTQQugIFkgARtrFl9rgaLjq0JYvipaT7y7FWUjrNXMd63nRU64Apc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202841; c=relaxed/simple;
	bh=ucLhLRqL2N8ilt+Zi5fdpr9rjtxklnK4PIUsffaVrRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2eET74GBTK4Wywfq22L73UxIlGmAkDDbQEGp7UyyC+iYjspeV0fFLE/yoCAlPdeBTgjIJlIhAOMTQSD1ceaQrPxxJW9CUUFhqHmCGjHNQ4JRYVrEoAvHVlLte4gQJ5tp1a2lDPaCpGmVssEuYXWQZ3watlC0vbHaFc0+umWEjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=H1pRoMlz; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="H1pRoMlz"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0dba37a7fso4774437b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792202837; cv=none;
        d=google.com; s=arc-20260327;
        b=F3oHBvrjIiK2NYfepnFGsnLkggvpTnXoALTsZGAaTYnnkUowaqmViMWOVphrS4K03d
         HsRSYhMKQaT7cP/xScIFAi/Z9uN7/b6gCUtubE2CpslhhG7Yr3ElcnYum+VMD594I1ih
         Jmplue5ygkEh2mMDl069x4c1QKOgWP4FU4sGJ969hed8ZzJAgrskXeYOLUJdfDTktfCl
         0ZuBaZvMEKOxbmatqWLhTzV2K/at/tL1H9XIxpFvc6Sop8BYkmLLig697NUKcOt+jv3c
         FtG9I3Tq8eV4+RL1rJMGT7zvZgNTy+wAD+8P51PonhMUj1GDnLXjc+chbmUaQnFdiEbr
         ggTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rt4iW6eCLigRGcM8uSRJchyBda6OwJVbeGjzxJgrzQQ=;
        fh=3oVf5TGk44GBTWSZnZ0k2rvXPYUyu/UNSoKBQ1VXp5Y=;
        b=AoJFAJNDFoiAPULaDEDbv57gb5oKbx9h24lbcYoqgAQmtgDxicHVhFjy2IXlH62Kpd
         JCU7HXwhisjGWIPHn8QMkUDjB8jLuRFc8uTYcK7LILudyJ7aPfLaTaXjQBdMfEwiBvZO
         wSrnLWvHRP5rDqi6uDYAzdkqUUp4gcb82/PS1QOF8QPHPy3jhIWNQOqODfn2EqMoNUGb
         EbCrFjLCxDa4H3tsuYzXIL/2Psl8opdtW06dwWMC/udoAIyytM9vCu82j6BBrNButgY3
         Pha4hWEXW9BB+409XX7YrLW4uwdsBg5yEO4OBM7/2XfiQBMaJ8e4plF1vfdW8/HdKGVw
         BUjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792202837; x=1792807637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rt4iW6eCLigRGcM8uSRJchyBda6OwJVbeGjzxJgrzQQ=;
        b=H1pRoMlzueVrol4qx0l+oT9cmGk68zNnu32dDTC8JnWWYjEoRwOrO3KdC/IXEToUSI
         bdy/U/OxQW9VR7l1mWrHLbrb4hwENywuM8XJp3iqGJsuoyZzjNH4e4qvHyDCn0GxseHI
         h5OKeRDakAaK4ix7JOJP/j2VKyu2W0R92X8oRH+oDqnjJpLiQbSXS2CCWrwiQ1+5WEUZ
         YJeCxzRX6E+i6c9MPfaVJd46qSCEI9eNfTmZZYntPSwitmGRPmnNRHKbOwieJcjFqyVl
         wM4FVz1XRTWz5HoDlpxUp4jglu2QVZUwPV9oDzyePr0brpH/pt2QGtpaTXrwwAziOm7o
         OBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202837; x=1792807637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rt4iW6eCLigRGcM8uSRJchyBda6OwJVbeGjzxJgrzQQ=;
        b=xrf479oef+a/1kqi3odPPAstEdZoo2Q6dJzXcJp/hQdzsXefcwfxdI47OaxGkJnA/J
         yA6AtCXmQQtsPJrv25oiYdbAKUYAv7YWrxA2Ba7jlUw3doJaB0aBIZXNNcR+UkJ8HVI1
         0qIorjH2MXXE+gK5ci/n3b35sCz6dRmVJ7RAIa4i1u0cwdnA41PTQeBm7dXcGOea7Bh/
         q6uYbXFoMSYuYnSqjWeduuQPNTARnEox4eEdszRgta66AUa1QWDQKAGcKN4VwVJ0Zxn7
         SoNbwfL0XJB4P5XQ6L95CURj5gwwz+zYWvmWVJsra9V9+LReKS/EdVOgCg/Cw4Ui5EEE
         Z5MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoMWBVtLpT+wyISndv9UisW1Gnc/e3ECxr2m0G1kw1EBHkOTOUwYr0fq2ExVf2Bp7M68U7xb/7Z3st0s0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+Zvzrr31Md6orJqeTX64CTMjPGrxwpoR76RkbYCv9q8HKGleP
	snOdzwlPtIU2Hq+BZ3segXQVuVy+h4p86/PpvPQ6Jl9wj36CgNlWy8W6bQGIYYKLrpeC46MOXdh
	6Ykr70XMZPn9ypYC/9KKGVM9o3XEWKho22SAc8qLPzQ==
X-Gm-Gg: AYBFou00LHe8NOHDUeHDRP/0443PitzWV0k24aEuLQuJ22zYYtI/JhoGi3j+qcInwP4
	D+ln6dJiMJM0cirmCtHb5H4YVuL5KFfKJbOcFLrzgUZ/wvFGDGOaCez5eSDDKbUImAOEIf9SM5R
	xMX1CsX1Frp0zVjqw+CtaSia8T6z2vrDovn2p5Y3Uzh9YX6DQUbOsozM1fO7iN6W6+Sg6sDl0V7
	TBesAilw6JJvxVSBmu8OMC+qWBFaJOPM9vjeGuEL7PC6RucawMf7gMDEeuEUyS1c/b8MSH1UlfV
	Oz3laXZsLKezvjAKIfNZ0QCcysw2maDWAm3clDYCY7+WrrcP9EWsJ2mnWp09iH6PN+aEilBY9HF
	krRsnNKCmjFFQaa5/wbWWTmFBhcgUodquJqWwXPzzRgs=
X-Received: by 2002:a05:690c:a4d4:b0:8b0:a7d5:8592 with SMTP id
 00721157ae682-8b0f2056466mr5190937b3.7.1792202836817; Fri, 16 Oct 2026
 19:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-breakpoints_rtc-v1-1-a3b6542a0fdf@oss.tenstorrent.com>
In-Reply-To: <20261002-breakpoints_rtc-v1-1-a3b6542a0fdf@oss.tenstorrent.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Oct 2026 21:07:05 -0500
X-Gm-Features: AclHuK8RuFJnIf3a20iamJ5FM0dBZXzdMrAy_kqn8gXFOTDJuXIEynXWTKXUKbM
Message-ID: <CAEev2e_aPeO_MF4k2ScHB5OmyOsMQe7-uz1cxD7vOAO8ntoXmQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: breakpoints: Skip step_after_suspend_test on
 systems without a wakeup capable RTC
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, Oct 2, 2026 at 4:55=E2=80=AFPM Anirudh Srinivasan
<asrinivasan@oss.tenstorrent.com> wrote:
>
> This test puts a system into suspend state and uses CLOCK_BOOTTIME_ALARM
> to wake the system up. This alarm can only wake up systems that have a
> wakeup capable RTC source. On systems without such an RTC (for example,
> most RISC-V boards), this test puts the system into suspend and just
> hangs, requiring power cycling.
>
> clock_getres(CLOCK_BOOTTIME_ALARM) fails with EINVAL on such systems,
> so add a check based on that to skip this test on systems without a
> wakeup capable RTC source.
>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  tools/testing/selftests/breakpoints/step_after_suspend_test.c | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)

Gentle ping on this.
