Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648A11F936
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518669; cv=none; b=afEtJXW/ezEEJnhXZrd0p5x7DOGrb6cY7MaVFJMZRRxWVA6ikYAmKy5uH+gjVs3LfGmGQu751pcRWTvU4EL6/+42YYNR7a1A2b9Qc1xtkN9A7n7vAb2MeV2JjNnycBteONXWuEg9SyuVbugJHIo5JJPiqVKn7I7GGueyUtN/wwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518669; c=relaxed/simple;
	bh=8VkAPD9LDqm7d05XF+l4kP18KbZK75aLsQU4vJdd6zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lxwwd0n6Z4ZqR3eFPCk4Z7NSbHsFN/6Z/ymEbsN2JYUrlxz69T27p5fN/v/K3mB3xe7L0n8RJhi2aEOdVuGEgY+FkEwVhMYny/PBOKSi2WZS1D6fAnnD+trLKh+CgFCTIytbo4P+IMpbk3okT9ME8uMpX7ENrgdB+JE9ZOVCJng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde2so574773241.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518667; x=1791123467;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hSwyiSqecYc1b+uiw5Lwtr2HGwahE5D4OZtCe4oNRG4=;
        b=1IoOxkhqiR3INwzZbOL1v1riFV7cBIjlJuLzfRCMiyhlqp74ZbYfEMXG2qA/F6P73K
         rFoYEFZl9JLohNi8NL/AhTZhzHrP+nDR+tCjqCB8tc8AZehJ9u7zhTzzEpue+aRh114c
         kyF2I9+uAaqGeqjOy/56Iga+vzJZvAepYPO/TA9PZAaq9lfe1j4kxdHW82jRP8zFTbkS
         MOd3D9lkL4RGWActMY08i1tUsrZEo/RBB2eeV6wVjdSaddlt0QWTFiN1ix1Qff613QcQ
         NToREgJNCmQ9YHOaBd4LiEw00IzizPZ1ADRlun/oaRWgBgnOCPGYrgwB1iI5XItIb3JI
         tqwA==
X-Forwarded-Encrypted: i=1; AKwUvBwgdzdyfldeSgcBWyZM0s0ZKVOlPH9Dvu0GVVHrWpOpo9Do2foH6FcufjPzrPm0OnN5+AUTilgCbrJQLoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMW8w8MTg8YU50QZz7yl+gC8MjPJ0yHeDhXizWLbQvofHtLTYY
	ATqKtdpeWmD4HxgQS+EmaUxsD5J1m5UXKaCtN8T0fEohbYzj/QLD+ijRbvmXGt3I
X-Gm-Gg: AYBFou258Lu0CnGFRsttObvGrlQnS5Yn8uLAUwjcwhCQ7BnPYnGbrtiAfPBmmL8i7sQ
	Rqz5so9D/fOanixQ0uWdXhwS7c8rOYJLwZxMtSDRRwATTJWAG7QMS/rcMOO2jdO+B65Wi29XdM0
	MeFBPiK+4hz5p3EpUd1yiCmpU36XGnwF8frNVs8gqyCa0PMDfsm2Oua+gEv9KUBWSyQbcQ1lMLJ
	ZAAxrISNh/MiJkMrBcWwvhdyRvFban+TKquFYG+goH+MX8TFXIp46Iu1IL6q3SxYzTJHVf53+r4
	02NpgwBHBYi9kyPMUiLGTLQyUv5u6Vp3yhaiSHGzVkKnSXrnl5LVn1QyFWMCfn8lyBIUUInXb4O
	O9m9Q7AAFx6yi205fX6cQ0Qw4+hblW8kdnRvl0k6oK+a/ZL2k03E0ccfnPsAE3JUx3ULY9DVSYu
	DQYwkcFij3WWAmTz70DdBgXWrmIcpbzknnipAbGjr3vr6rxLYyP+Wki1gbnR8N2UK4PHSnCnfBQ
	YSVEWWeCAlkbYGur1MITMD3m4kUNqfE81ZB
X-Received: by 2002:a05:6102:26c8:b0:7a1:f7d2:e846 with SMTP id ada2fe7eead31-7af1e9f25f2mr3232878137.22.1790518667252;
        Sun, 27 Sep 2026 07:17:47 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b08af71sm2797146241.5.2026.09.27.07.17.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:17:46 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c963a787c9so733462e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxI6nDX3nI63bSN3iL0/PjqQe4YxnwUcWfoJd+PkBKg63reeXgtjWt56F2rYjI4C89AqN1vk6yTIWKVa4=@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:7a6:f970:27d6 with SMTP id
 ada2fe7eead31-7af1e9f2d0cmr3199511137.20.1790518666358; Sun, 27 Sep 2026
 07:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094402.741645-3-thorsten.blum@linux.dev> <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
In-Reply-To: <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 16:17:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtDAzX5OsWHteKk7uyaFvXG1o9xvnsDkeH68HR47m9tQ@mail.gmail.com>
X-Gm-Features: AclHuK8L3KT4Gm-Oc3iO6o7xAeDJJ21XQiCKW5qIvopKolo9VS5m0M8TAzfubE8
Message-ID: <CAMuHMdWtDAzX5OsWHteKk7uyaFvXG1o9xvnsDkeH68HR47m9tQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k/serial: Use generic BASE_BAUD in asm/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 14:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 31 Jul 2026 at 11:44, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> > Include asm-generic/serial.h and use the generic BASE_BAUD definition
> > instead of redefining it.
> >
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Sorry, wrong copy-'n-paste:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
