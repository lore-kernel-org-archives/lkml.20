Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B169439F62
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112216; cv=none; b=b71TJxQ91UUnicvc0m8gH2nUj0ehFKp952TMGbwt3VzOcTRfD5CwASMeAzxzE8HEice2rwgDvJdpOV2WLE5PjxPzRZIOED5l1j+gpU1TyOqERO68WGHJVzXZYZ3dW9uGXhh57GpqvsbZLYP9K1lXdFipNoW/X1EnihvFqWTQqEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112216; c=relaxed/simple;
	bh=gbmyJ64L6uNWZRacKLU2Vghqz/zZpdA4Wk9MoWvK9Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Faoz52hOs64yJAJYbnF0GgeJORTYL9sEY402OR1qLP1j3K9dqI4lOxcD9LFVmUvPntSniUTsExraCzb1ilDf4mdlAUmS6WnjINL7GzpqSUGySpQZ1Abp3sH8hjGePPZRZsGh7ffQfkqAqqfZZ9am48Ocde/NQQUoCnsHzf7WBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-782af6c753cso613080137.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112213; x=1789717013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fbsARpw/dJVoneGGfEjuF+GfyjF53s/yH8EH4RLlPOA=;
        b=BBI1uezz2jlbYozRo86Fw+qlbDcmVp3NYBoaEbfzCN4GyfDZOkuXrHvGCPQmXqK6M+
         wv4PQFAvDW9aXTB3YG1y9lPiQvi+xr0IOfHp4ltk/izDS16WRjBXB5dWF8imp+f0jIrV
         cUM0a5YI23Rb0HMveccaWmVMdB+Xblnt0ATX0hIwGBmq9D74QyTTxdFRPPUpTFV/DrLe
         vuVXKumK7oSGcyQesIXWKKLnHLxwQ4TutfTuXtWBJ1BRG9w0vrlbc+64kRin8QBIxYfS
         0RLVPvQPQpxTEMEna7Kwe5FutkUV5HbAO8qmvOZ1XMMoF91VNgrtHCtf5rWuEO7ZLowi
         VfmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB0A8PvuJUQXo96ob1Ol2FcRQSY+z/4JqZEEqGNdlN4YsZUdXoa0y5SKl4NSV03SonboFuDFpLUnD1FeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n9Y15odbHK6C9CqaZRcvX4HyAePntnmuEJxOvCXIeasVw3wHQF
	YKrbki8AhgoEUrRH5mWpcB5gIQAjeIRIh3HpVUFZLkUjjlCWdVRfX4n55Q691A76
X-Gm-Gg: AYBFou1SAfpOIB4nVob4mUmMcVaX6FBNoiuYUoX+pSbR0WxsBO/xjjfJzSgSVfN4hcD
	PHmu7zkd+o4j95lVOGSvhbK1yRfFmDZEqG+hPpaDdR5cUEwGxbL+GGdcTsm/qetRVKslxF81SRv
	U5qwvaXgTIS/iBYDF9P5UV0K0YT3O09RAeM7/Vmy22RMabYalTIRi/hM5aY/ms0IEyh2UqtqBG4
	lzo81Vuw1Q5QHpJhMExDPxl8cbQMi10TqB9uZmlHYhy0Stgo1QPrw3nNNVrmfWhIYZYuO5PEHdj
	SHtMrHTqap3FpiLnUDQJRdmo1FSfwDG/KQJfI4b4cxohBCKZHoPRoukay0VZTeqSGcqfzJQgCF3
	2w022hAG6iAx706IK7JVAEGs+bLEiaLAdhkcTGrECXiGmETugWv2qqfAOlyFx0CAwmPVqBX98QF
	CZTlnH+BIRps0bAmZ5fFqLG6lnxBq6JmSsRbdu9Xuw+k1EQcOnkD8ZvMhJ0+PG3KZk+QNS8b4yu
	YZWULVv80n4+Il8VzdgpvXVeb18SUrhGc5x
X-Received: by 2002:a05:6102:6046:b0:786:e7a0:603e with SMTP id ada2fe7eead31-792a97aa73amr2891405137.7.1789112208502;
        Fri, 11 Sep 2026 00:36:48 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927ddaa082sm1703238137.7.2026.09.11.00.36.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 00:36:48 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-78fe51a2dbeso533025137.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:36:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzi5ovc+Xqho2UkHXX+ngS42qIP0oUrTvO8Q4BUYsGdFw0ZxFQ0AR6+daWwKjhvi5fFGpI/FpVq8E0uZE=@vger.kernel.org
X-Received: by 2002:a05:6102:148a:b0:77f:fb50:8820 with SMTP id
 ada2fe7eead31-792acdd6139mr3532430137.11.1789112207336; Fri, 11 Sep 2026
 00:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827093948.2825531-1-lilinmao@kylinos.cn> <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
 <CAN5rfbSh9ZoUkReAqv9rHYowqKcZFa-Svy6LP-MHvqfBVhjdBQ@mail.gmail.com>
 <4f3c7184-1b5c-4074-b8a1-49261833df8f@gmail.com> <CAMuHMdWoZBGyH=WeiTG4QCNC4hr_+pC4QQb-wjK0afZgMUy1Fw@mail.gmail.com>
 <f2656a6f-0bc4-2afe-1a1a-f8ce1167e090@gmail.com>
In-Reply-To: <f2656a6f-0bc4-2afe-1a1a-f8ce1167e090@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Sep 2026 09:36:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBn5yjXA25zOjUbtOjeY105AwJnP+tvJjRH5Y-qzfjVA@mail.gmail.com>
X-Gm-Features: AcwNN1VMa2RNewNSKr2wzj3QZMXOaBYMFGdqezh5M0Od6lwZNKFjHs8IMjeEn6M
Message-ID: <CAMuHMdUBn5yjXA25zOjUbtOjeY105AwJnP+tvJjRH5Y-qzfjVA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>, 
	Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Fri, 11 Sept 2026 at 06:53, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 08.09.2026 um 19:18 schrieb Geert Uytterhoeven:
> >>> Unless I overlooked something, the fill also looks wrong on paper: the
> >>> first line is filled with a repeated byte and then with repeated
> >>> 32-bit words of the same value, which cannot reproduce a 3-byte pixel
> >>> pattern unless all three bytes are equal.
> >>
> >> You're correct - we'd need a memset24() to account for that. Without
> >
> > Unless the frame buffer would be using a DIRECT_COLOR visual (which
> > is not the case), then you could draw pixels in the 16 console colors
> > by replicating the color index in all 3 bytes ;-)
>
> Sorry, I don't get that - are the console colors chosen judiciously to
> allow for that?

Sorry, I don't remember if we still do that.

> >> hardware support this is an academic exercise that I don't have time for :-)
> >
> > True. And as this code is used only to fill the first line (the blitter
> > replicates it into the other lines), the performance difference between
> > a simple byte loop and a true memset24() won't be that large.
>
> I wasn't worried about performance as the blitter takes care of most of
> the work (though we may schedule away from svblit_fillrect() while the
> blitter is active). Getting the 'simple byte loop' right is more
> important. My sample code got everything wrong in fact.
>
> There's a reason why we don't work with 24 bit sized objects usually,
> and probably a reason why 24 bpp was never implemented for the
> SuperVidel :-)

Yeah, 24bpp is tricky.  And in this case we don't even have to deal with a
different endianness ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
