Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9F409114
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179812; cv=none; b=O6RQBJ1OL9X0f+n4tUFRRLQGTj69mBcQh61zgACqqG7/5gFlPfwxt2BAnTp29XLsOZ/iAajT2szF6ujgWTNd7wQwPdJqnaaoxaWdeV5A7tKbknazm6KLKxFIaTlAwYGNsEYe+a1+26962zCS7pI9ZFstg4Xd5W5USyB6kpb+uMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179812; c=relaxed/simple;
	bh=ULsHKhCz4adYfvJRj3d1HoVHkpYlk6MSD5mrDpZawIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMbgOSJ93PX8Ayd4zIodNMbRh3gQu8PWF+kjLuMa7kiUrmWAhIdSYOXvNlgJm71c6nZNi/sSds7QaNf5iMjrNuXKVeEUh+1tgrz7I5CR0hGUPP4viXo0ksvj1HnCfXndrzJl+j2mhu4YQIOaGTj+TEZO+O8PNl/ys1bp5x9ynTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso1777554241.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179809; x=1788784609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/YghA+m78NUSl4KQ8Qd7cAgk9snstUg+hq8uHFPKsKw=;
        b=BX5wwK0iGCR8axKEUnPEKw5xIgDQZMWxq3aee4QfzMhTQ9SXEzqHqRMMe8FNAVe6Eu
         q6v2BnVpn8LhRr5lW2HEJYUES+DbPD4uk4G3n6J5jdtJiVsFbUiygoKrzY9CZZ0sgZwH
         6QHZCcEs3F3TGpB75TZtBeaiecQlwLIUyCYFHlUISZcHhrQPRrmjrJITLHJ1nc1y887n
         g+Zf7B+YpL0xdjSDlJQqR21J771Vi5vg3Dx6XkApAq7E95pjaJ///X5YuTpe8R5HY1uS
         NmZM68UiLRQ2yCQM7WUJWPjO33vW6tJL0l7GVVK/5vLzk+JbvrNI/mh23LktgRGbw0mk
         6lxA==
X-Forwarded-Encrypted: i=1; AHgh+RqnqST0vtDnAXhDQ0kIxs1dR3MAiXcxd5ciObr/LA96yiCW8UxCYk0KMox6cCcN+P4zBimrJD5tZbNouck=@vger.kernel.org
X-Gm-Message-State: AFuF++kHgDH7w4Gjj3pwxpJHdbac7K07iBNDexCdBUf4zPOmtqVMGZO7
	kg2+87m/C5qVy3K3tpRRkuLtDFigP9fZHJY6v9tSB9goacVWzGntpmp0bgbZp27o
X-Gm-Gg: AR+sD13OS12QrVvRx6WHOokyZ7iuG+4r0ekYmGlTJGu+6nkZIlb/I1+Y88Bpwcs1hnP
	YpnnB6hQkgfQxKfkDLnskvJNlQyKIYoLYOiY689S8U0FvNmc0vxzV/pkIMwS4VA23xjoN3KdyPs
	WfuUOSTxEmN807Dxluo9jvw0xADplD4ZvVHB0aNeHM+NRLbseiSVPiORG/l1IlZcq1bOh5kEp5Q
	4SE2q+Rcm3TgxwlZOpU0/N7R7xmMFuq00qScKpGGcgECKUGYbLX4u5pEu/EahGNVMPNQ3igyYGP
	eql8HX4UeQL6lP0zehprrILVE0ZxZ5gzhBpyXBXXJzDOkenX+xADozyEG5aLewhqw0e27WStugE
	6I2Qr7fQc2NVPQ9pNA24mBOALCASqQDwgKHntUGoCRi4mqPVGGPdR8M2tT5tIGpHbMYST3s4doG
	0iUuYj/tqtEZFpgQKJHuMBFBV3+mD4BYZ1W44k/OxN0yBtSGuQe5qxkkLXZR49JRvBDt9hYD+io
	+n5eRy5ebSbqGnMdkB5tpshEQ==
X-Received: by 2002:a05:6102:e0c:b0:77f:fb50:8820 with SMTP id ada2fe7eead31-78598c3fa3emr9336793137.11.1788179808648;
        Mon, 31 Aug 2026 05:36:48 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aa3asm6660193137.3.2026.08.31.05.36.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:36:47 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ea365dd5cso575496241.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro63aOZvQoUwo5lKvxvE8+H1ruBD0WbZiVe8+ZaJAmzStqjDQUOKsCXuITVfJg6fiE1YoQXsWLxPBsRUJY=@vger.kernel.org
X-Received: by 2002:a05:6102:3a0c:b0:786:e7a0:603e with SMTP id
 ada2fe7eead31-786e7a069ddmr6332884137.7.1788179806637; Mon, 31 Aug 2026
 05:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830221129.2668354-1-julianbraha@gmail.com>
In-Reply-To: <20260830221129.2668354-1-julianbraha@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 14:36:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
X-Gm-Features: AcwNN1XxY8dUAVI2sFOPMPIRRG7NYFIhq8sQwv_cJj_9FFT8vqF_RRaivlE8Gco
Message-ID: <CAMuHMdWkPtJinDa10S_r7Pj2DTgcKpwgxt7U3tqm7fnSwGxm-Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, xiang@kernel.org, chao@kernel.org, 
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com, 
	hongbohbli@tencent.com, guochunhai@vivo.com, michael.bommarito@gmail.com, 
	kees@kernel.org, vegard.nossum@oracle.com, sam@ravnborg.org, 
	u.kleine-koenig@pengutronix.de, mmarek@suse.cz, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Julian,

Thanks for your patch!

On Mon, 31 Aug 2026 at 00:12, Julian Braha <julianbraha@gmail.com> wrote:
> The Kconfig interpreter currently allows defaults that are outside of the
> range bounds.
>
> In these cases, the 'sym_validate_range' function will adjust the default
> value to the nearest range bound. For example, see this example:
>
>   config A
>     int
>     range 1 2
>     default 16
>
> Here, since the default value of 16 is greater than the bounds, the
> effective default value gets adjusted down to the upper bound, 2.
>
> However, 'savedefconfig' writes non-default values, and without being

s/non-default/non-adjusted/?

> aware of the automatic adjustment to the range bound, it would write: A=2
>
> This limitation is also documented in a comment: "The following fails to
> handle the situation where a default value is further limited by the valid
> range."
>
> To resolve this, let's factor out the default-range adjustment logic from
> the existing 'sym_validate_range' function into its own
> 'sym_get_near_range_bound' function for 'savedefconfig' to use too, so
> that it compares against the effective value.
>
> Adds tests, accordingly.
>
> Fixes: 7cf3d73b4360 ("kconfig: add savedefconfig")
> Assisted-by: Codex:gpt-5.6-sol
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/lkml/CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com/
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Thanks, this fixes the issue, and would let us revert commit
ab74edaeb1ae7c71 ("erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
default logic") in v7.3-rc1.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
