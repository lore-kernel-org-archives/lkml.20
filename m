Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB135E95A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257857; cv=none; b=sPP5pTpeE4K+7hUWS3DEpU7LKg2RyAhUgudrXz9s9Xo/cnannl6jCbeaN9yxb9QTGttc1SwkYwQZnvsWHaIeXzjR1VOqlOqianHarCsRfe9vfBK93cpBK03zu9wWjB3Zu0TH//rGeZlKZPBU6K6guh7NRD/1XgC4qQDtMvkKfCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257857; c=relaxed/simple;
	bh=f3IaTrQW3PdwJG2CI8iddb29hq+NAzAZPlqiyZ/dPEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elxCcBuF3b0pfSh5i+oulK/G+9ZXa1OTzNOvVfcVe1tLOUzqJ9hbnAj/5MJ9vCpQPsZK+Jkh0jkdYmpUiDtE/qyR6gaTBAAgqKKcsf7lIUWVkHZ1LyuYlY3OTK0Osk1+lkJx39uxwrBhXpnyrHCyqUsiOhBNF3fY3i9G93PrgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c671456e25so818758e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257855; x=1788862655;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jjjR751nJX1Dlxj+MGQJnqs6zskSNN1F11sy8NVh7g0=;
        b=aZ1Z17mbOIaGvEJJtDVsWt2TW9nabpNgvdxk1SPpTQADDT2/WfP4CG15rT9u722hqk
         q61jZK1DRLeSIuWoWoVhFbRLR/IPGxN1RjyL+OalnaSH8EvdxuVljJMV1K39znSMWqa+
         pxWC+YEcbnqBFmW8IKQ+tp5QVeTGVHan4DTz58Z68vmGrpPefdwtj0XC3+LyS9gM6YAO
         AI6p3TzTXMksIF2a4xE49/BDbBrSiPtGvHyKsJ5kMFhIK0zzRpXzTdbDct1ZQYLgCX/A
         REcVW5ppqX0WQrcvhb44Qd6jtrnLw0nhhNLR8vLTc49y8mqlJuo+g2vnAhJ3vm+0gJym
         EcrA==
X-Forwarded-Encrypted: i=1; AHgh+RobbtWZuZvknGmDS05HsxMXCF5w3vCXiTBnBvASJftastDrtQJcF0spj2f86qVMMCVy1TjSZRM8eW/8xeg=@vger.kernel.org
X-Gm-Message-State: AFuF++mVZAC0gCzMnT70rNTM64CMHtlkagv0cIPIr9640IV7Ido9x8kT
	IW/WRudPhm3VC6BIZeX47YN2pjj8/RSdcCuRtFnOl4lDhIix/lnnI+3Q1a/Xxgs9
X-Gm-Gg: AR+sD13/WL7ikZJWa1PGB6OQ55iba8mVdTcGXgwaM8hsE5rGOiAWaD0wdw4qP7yhPSf
	zQpS36ds9/mHQSW+IMYL5o+7Jz5P64dobN8VZMNGBfsVqbh2ta6YREmINS/xj0lY0oqAJJXKmL8
	j+L+e7g7dgdtk4tYs9iKBlTzkxUYl1ZO1dT9IGAJ5STsIZPTw5aySMVwMkRSIs7I4EDJu+Fwa5O
	SKy+c48Q3kGLClIE9/x3twXwAvh8VGjnX7n2ZyyTM+UTxXFROIosccrASNvAGsxDRd3al2Z81RQ
	1CRVzV0epXZRvY9+Mkykv1lB/gEvdvCK2E/e7+syuoEjwKy4kda+5WHhe+6JHeugC32Y5Phqncr
	EWJdwS8MLPV8l0617VmdiVi14ejUwu31sp1pUBKIJOM5NGr5LoSM6565vRV6NqwI5YJ7bdgZUJq
	0tSAtq1WeQzSejOK8KiFeEp92QjXZjN/ttC8RZX6i7P7SfyxKsOSedI9EgDQuktFr8ENXs+w8XO
	wVvvE/UP7TCWeAJRx/HXPKgrg==
X-Received: by 2002:a05:6122:8718:b0:5c2:a30a:1a08 with SMTP id 71dfb90a1353d-5c7c1c274d7mr1278208e0c.2.1788257854933;
        Tue, 01 Sep 2026 03:17:34 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7241e2270sm9869015e0c.11.2026.09.01.03.17.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:17:34 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7850c523f20so565994137.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrO0qsqJnSdPWaLE8ajZMtM5eaxy+W6LSJuO7jwtPKLrby49RaWLmag/lmsI2pHR91JzF8O+cJPjCCE6Ys=@vger.kernel.org
X-Received: by 2002:a05:6102:1a06:10b0:787:ebf8:77ad with SMTP id
 ada2fe7eead31-78a02a6eb7fmr955834137.18.1788257853731; Tue, 01 Sep 2026
 03:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830221129.2668354-1-julianbraha@gmail.com> <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 12:17:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUywobKkt5Zozh3GdOW57nF_XhydJh7PaqTBoGB-2XvTQ@mail.gmail.com>
X-Gm-Features: AcwNN1XlRAlFl-Ap4ZBsvizrQPe_wtXEO1vr6JdvvpwQv8gi-7uGjhpumvEIf0U
Message-ID: <CAMuHMdUywobKkt5Zozh3GdOW57nF_XhydJh7PaqTBoGB-2XvTQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, xiang@kernel.org, chao@kernel.org, 
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com, 
	hongbohbli@tencent.com, guochunhai@vivo.com, michael.bommarito@gmail.com, 
	kees@kernel.org, vegard.nossum@oracle.com, sam@ravnborg.org, 
	u.kleine-koenig@pengutronix.de, mmarek@suse.cz, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 14:36, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 31 Aug 2026 at 00:12, Julian Braha <julianbraha@gmail.com> wrote:
> > The Kconfig interpreter currently allows defaults that are outside of the
> > range bounds.
> >
> > In these cases, the 'sym_validate_range' function will adjust the default
> > value to the nearest range bound. For example, see this example:
> >
> >   config A
> >     int
> >     range 1 2
> >     default 16
> >
> > Here, since the default value of 16 is greater than the bounds, the
> > effective default value gets adjusted down to the upper bound, 2.
> >
> > However, 'savedefconfig' writes non-default values, and without being
>
> s/non-default/non-adjusted/?
>
> > aware of the automatic adjustment to the range bound, it would write: A=2
> >
> > This limitation is also documented in a comment: "The following fails to
> > handle the situation where a default value is further limited by the valid
> > range."
> >
> > To resolve this, let's factor out the default-range adjustment logic from
> > the existing 'sym_validate_range' function into its own
> > 'sym_get_near_range_bound' function for 'savedefconfig' to use too, so
> > that it compares against the effective value.
> >
> > Adds tests, accordingly.
> >
> > Fixes: 7cf3d73b4360 ("kconfig: add savedefconfig")
> > Assisted-by: Codex:gpt-5.6-sol
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Closes: https://lore.kernel.org/lkml/CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com/
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
>
> Thanks, this fixes the issue, and would let us revert commit
> ab74edaeb1ae7c71 ("erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
> default logic") in v7.3-rc1.
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR, this will impact all defconfigs that restrict SERIAL_8250_NR_UARTS
to a value lower than 4:

    config SERIAL_8250_NR_UARTS
            int "Maximum number of 8250/16550 serial ports"
            depends on SERIAL_8250
            default "4"

    config SERIAL_8250_RUNTIME_UARTS
            int "Number of 8250/16550 serial ports to register at runtime"
            depends on SERIAL_8250
            range 0 SERIAL_8250_NR_UARTS
            default "4"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
