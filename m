Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0166D403123
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766732; cv=none; b=JaOkKhKuJTJo/JtvptvL286d2xtwW4AFNH8W3PTi1Ssl5IeMeYZtq3VwZ/F59C5SZFrFX82mHcuMOo2JNj19gafSzVmPIumWSo5cyG40LySzoOaihtpAdaFz50qI5fb1DuF4g2BvWAE3iXQQxOjsg6L/hN7G9vxe3EEksPV8GBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766732; c=relaxed/simple;
	bh=S8XfCQRdiI5dIzCT6SQenjRdFiNySS83y5W/oEq4YPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlCWRw13tCRTLJrJ2xWlwYj+E6U+arKCbaajPhG+g682vWM3wrWOXtGASd5A9o/uF9XfEq1Wt3NZZxE1WZa+1Y7M7sdN8VFcoiOPsRjyZA98Qn5wQHcZOVPo7h/VqqizBZnXAEiYCOygGQ24lpIfpRrxph4u0wMkmpr3r+M13Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c652293bcdso3743432e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766730; x=1789371530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9lmypLEXa6TadsDuPofomJEaEW0deGm4lNyHfP7S4tA=;
        b=KIP+w1L/ILNOc/muSryNoAcIeP+wLQdEAoG1lBHHYKK2LjIPGHdLdX6XoXBlZLieBb
         h84+Ea7/LUkJ6NwiIriP3KhECD8z/iU5zRmEpJiJUa1qX4yE2FP+XJ91kj5igOY+Xnb8
         q6f4lHLsysQ1jqwK5Ye1fd8LbDUAEUXZoAhvJO+I/zjBgDANZLv/LoLChLF/s9NjAJHc
         824D7sAvNXZFkAqLY/8ptzbWBLILKFFjiJvYTUfMt2/sJvHh8nLnB5Sz4XEPYtGlUy53
         NgAX5VieziNcOQudxJjHvk+GAIc3QmncAW7nInhZ9EQjs7IppX3oBOHzoSfEx5lJnFfz
         1VEg==
X-Forwarded-Encrypted: i=1; AKwUvByGYOGnjXjEWj7CueOFuzghHIoZC4DfXO9KrJi9lwmRQuUDVIJEy1AESU1yreAWqKzOtG+L1nAb2d9va44=@vger.kernel.org
X-Gm-Message-State: AFuF++nTJvczuW5FFwCV57izd50RtWERzLLiSQ1nx3y70rIop/Ayp4SJ
	2G++f9Xy4Wn2RgGKSdTR3vvng6E02YFgvP2pJtsRwIpJRvNoRoPeTjmWdVp4Pqrg
X-Gm-Gg: AYBFou2eDiQ5pk4m8vNgTMZgePy2PrUWhRlyQmS6QGL/aXljyZ23NPf6SJ2FtTxR1fn
	hVWyqLE6oh5YewMfa8E1j7J8QU/xVyQwmNMHh5926j/XnJesWY10LtnS21fAgcY+G0ari+rVB1O
	jI+tIkM6JNG7O9nwXfIlFATjr5VvNAkP9HvB2ZiFsboE0x43RSoHwBFYcahUuLGr5IVVZZepEmk
	24n9Cn3ol6YFxzAMtKqupRD98qliUw1b3qfmRARFDXXT8zRJWt86opisidQZusj4W0IA9B6OpDA
	es0yJEirFYp/1I9zUw9YeNXwBwNJg7z0w9WOb2jNFWW2XUEiVKMluIZLzwl0ycJkSAW++W1YOBz
	lbeQHVc51dcW4QW5UacPPi0KOqfDxHRRN2C4FFbtCJ5y8my5GN+s9Gqco1xsJQtwS64J107E9iX
	Q1MGuWoyA8/R9H/B5spmn1mq9w1xbPMANtX0/hknlW003QgNwM0CokRLtuJPY40CCZwDTCj4vLd
	7Z55Ig1eEL8ydBCmc0XOM5BUQ==
X-Received: by 2002:a05:6122:630f:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c7ed7740e2mr7173641e0c.5.1788766729885;
        Mon, 07 Sep 2026 00:38:49 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ebf559cbsm7367869e0c.0.2026.09.07.00.38.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:38:48 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98076bb236eso1634132241.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:38:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwA/Q+A+/g5cL4FxenRILGNR+tLtP3YD1l2tYXLPyFvanPOYzBs1gYmWmBXn4Wb72hlF9LSJiE1Iwt3Aos=@vger.kernel.org
X-Received: by 2002:a05:6102:5803:b0:785:a48a:e3b9 with SMTP id
 ada2fe7eead31-78a4a6a93d8mr8633268137.4.1788766728573; Mon, 07 Sep 2026
 00:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9ty9kjb1bKFgjgBS1tgM3zP2tK+5qTFzT9-0t+1jykBDxw@mail.gmail.com>
 <CAMuHMdUG7_7GDPhs3H7kiarqSYR1_gMD1onYu9Hzem-_a-ookg@mail.gmail.com>
In-Reply-To: <CAMuHMdUG7_7GDPhs3H7kiarqSYR1_gMD1onYu9Hzem-_a-ookg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 09:38:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVyFiywZJyaRCRjdkVptfiFOk=wy5+sQ4Mb_BgF10Q=7Q@mail.gmail.com>
X-Gm-Features: AcwNN1W0aE5OZzjNu-7U0GJ53E9ptLdW1F38nK2hxhqmN1mAIYRx2w1qul6NQfw
Message-ID: <CAMuHMdVyFiywZJyaRCRjdkVptfiFOk=wy5+sQ4Mb_BgF10Q=7Q@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 7.3-rc2
To: Dave Airlie <airlied@gmail.com>, 
	Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sorry, forgot to CC Arnd for the uapi breakage

On Mon, 7 Sept 2026 at 09:36, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 4 Sept 2026 at 21:52, Dave Airlie <airlied@gmail.com> wrote:
> > amdgpu:
> >  - Fix for drm_amdgpu_info_device with mixed 64 bit kernel and 32 bit userspace
>
> This commit contains a "cherry picked from"-reference to a
> non-existing commit in upstream (it does exist in linux-next),
> and mentions a discussion between three people.
> It would have been better to include a link to that discusion:
> https://lore.kernel.org/20260820045438.3974-1-yogesh.mohanmarimuthu@amd.com
>
> Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
