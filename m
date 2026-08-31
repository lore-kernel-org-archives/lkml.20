Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF173C456B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180026; cv=none; b=kPqvtzRyJ7ugjc1h04IA8crd4/Aw7w5NxH6QEzkHwkGBLA+ztk6kayK4qOjoRSCKKG+gTZZrTAoYoYQxJ5hyfFXyr8nOnJzINYR16odWg4/4oBeH1O/xnF1lUioHChXWtYEC53UppVG77MDAt7jk+OJGiNUd9F0hiFWFgUfSPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180026; c=relaxed/simple;
	bh=KkkehfMd9n3LK2UIAbLrDl0c9I3JEeWBic8VihxWB28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uP9iBIVzoHx+u2Jvr6SHlrsMQIAt76897oUKGKILawPU7KKQrKK9Ox0mpHawrANEg3nZzsh6AWsUe37UOs8m04RJtl3560LJ1gNpdAaTHgQutls0hfjGrpxurZLGmUz2y9TmtjQQCyw/VoRgybv6ePhGBsBkAUYalDYLTE7Twq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so2350988241.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180023; x=1788784823;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDjQEmaO8nMillvg6lw6y5CLfKSX+705cRaL+2tb0Tk=;
        b=WO0GTyU6fN5WKK4DuabPuV0zuS+pPA9OMbX/SPDR+xJAN2zhwwMnrAC7bZKu73EfP4
         TeFHKj7hVAKCxAG5SGCAaocFcfsGUfdxsf7yIv2CWOE4aItEKVe8LcJAOL4wT4d5gM0w
         +G6R1qwqxW8DX9NMfUgc6pH5LmKDpIQJs1MMa3UCCRyDg6ZFsMmmGxAdi0dl6rUxpm81
         /VikyAouIxnuzNgOSowrP5+nxqaR9Ppa6flivWdtkCSXwUqxoJMVhaw64oNdNfQcrQrA
         kiZ7ThYT1MalV+jcznt8Er1URIawWn4nGWuH00YwwfUKvQPxg4NjAlt+0qsusMQFUmAD
         LB1w==
X-Forwarded-Encrypted: i=1; AHgh+RrALNLDzQ9L3fqtjmCWaA4qy9ZnOKQgEzIoX3qweAi1xYh8IXD/tQAYGx/21dX6Mmyr1HNlj54PIqRfCVA=@vger.kernel.org
X-Gm-Message-State: AFuF++nionxuYdbA7654kVLh1dv9YRXW/jTpoNDRFSJs+u4qIO4k1ZwA
	aNPHdOD+/EPoxHJFrVpXLVPNTuqMOvkYBOnkgY7EEdXGTWkCbFEkeeIXJVRrpzHi
X-Gm-Gg: AR+sD13hgZlIxJS4pTKiAu9ksbpTPtQvi2EFlsuxmKomDqe5JFeNRqNNnOcTk9BDJNr
	EDznzA99XSeJai9FlE4cnBJjiWrC89/ca5BzVcAyrnuhakE2pNkaZ6tNiYoNgwcdEno8VBXDIOm
	g7OnelKl5tFeM/UIEVNz3mvG+NxWYRIXVFcAYrhcN4ajtx4zj22bCI/dafwk2m5Dq1NINaYMZf+
	zB0QQt6HuohnMvPQggxA0FYA8iX5o0L8VFtrpsf3KXzWWWv80U69BpGMFouHBgXenP6jxKl2Xpq
	T8DvISA+6UWCQcPHA/JqzAMvJGRAG6K01Qs2fsUTmfZYloRB7OVFwcarirGGrZ7JDiyZFhYV9jT
	SJ1yZXCX7t/uw6MG8dmdftlnVvuOGFeMgZgy4qjqaH5qV6OyfjtssrBduC0oVxBMuAljz9mczIc
	ZljX13p8uH5/Mp2sr4eA4ljKVum/b6WNr12pPifrKVJucXjz17jKMLFT+VdJa+HLrOVNhpIWUur
	/M1BCQ65e+U5M6yHZ9nyqi67MIpr0BGqRkF5w==
X-Received: by 2002:a05:6102:1266:b0:782:f8e7:27f0 with SMTP id ada2fe7eead31-789dc89b758mr1266469137.19.1788180022999;
        Mon, 31 Aug 2026 05:40:22 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7241da935sm8079282e0c.10.2026.08.31.05.40.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:40:21 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7850c523f20so2787836137.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrsM0um4rwDl2bMqQ9y7X+o3b+G/Ynx5s2chb82uS2maRZ/WlcMXr4lQCMCq/V80JKyZawMBvp1iXDq/QQ=@vger.kernel.org
X-Received: by 2002:a05:6102:2c85:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-789dc7e86f7mr1577779137.10.1788180020647; Mon, 31 Aug 2026
 05:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
 <apGqg5a5I9g1CoF_@levanger> <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
 <apHfhILRL0-lFOEh@levanger> <9de2f5e7-079b-472f-9d98-91d878dcefd3@gmail.com>
In-Reply-To: <9de2f5e7-079b-472f-9d98-91d878dcefd3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 14:40:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbdO_aY+_CZ6KV23Y-XGfhb1+F8yLQVBY6Tw31PTKzvw@mail.gmail.com>
X-Gm-Features: AcwNN1VSJrr9aEDo0FVQh3lxnRuPny3ZCLnXQftv09uT0Kmgcq1-H6pLZpi5V5U
Message-ID: <CAMuHMdVbdO_aY+_CZ6KV23Y-XGfhb1+F8yLQVBY6Tw31PTKzvw@mail.gmail.com>
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
To: Julian Braha <julianbraha@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julian,

On Sat, 29 Aug 2026 at 01:19, Julian Braha <julianbraha@gmail.com> wrote:
> On 8/28/26 20:20, Nicolas Schier wrote:
> > Cc: Julian
>
> Thanks for looping me in.
>
> So it's not great usage of the Kconfig language to have the 'range 1 1'
> and the 'default 16' here contradicting each other. But, it's currently
> legal.
>
> I would prefer to disallow this, but a proper check would actually
> require SAT solving (or similar) in the general case, so it's unlikely
> to become an error in the near future.
>
> Anyway, as long as we're continuing to allow it, savedefconfig should be
> considered bugged for not handling it accordingly.
>
> Let me see if I can send something out this weekend.

Thank you, my patch can be reverted again once your "PATCH] kconfig:
fix extra output from savedefconfig on out-of-range defaults"[1]
has been accepted upstream.

[1] https://lore.kernel.org/20260830221129.2668354-1-julianbraha@gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
