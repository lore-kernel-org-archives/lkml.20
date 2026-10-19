Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA14D3BEF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421295; cv=pass; b=gSuAYXMh3kHpxJ2TCSl/wdVSecZa7X2/EQWdaRyYgs8CoeSBHwQK6wY6PujdShn7Pn16Ik2kb0w22luacisFXz29vGQgny60zfgiP2xY13LXbxA6wAzQKZ920Kz9CUUUr/raIH56RGu69PJGHHzMy/NWgrJFi3tEBeogmmleps8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421295; c=relaxed/simple;
	bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENxwVlKQ9CNKdx64pBiR5EeMnzdsll0Tn9U5bWJbFOWu7+FHxYsPLonvOTZfqhLLJ2bCSLXCaEZKQy+gstQsdwMfixHGG4kTmBj1FOaD96Gt9x2il+2PlMZ/xZdQ3EM2n1fXnFbJtKVN70vXjmszdV6Dly+Aev+6B1MU6oTONvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSHkxma6; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSHkxma6"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a707f37eso23082756d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421293; cv=none;
        d=google.com; s=arc-20260327;
        b=RO1DatYxvqZzWQN26T/CgohRyA4skjfi/2tiHFJ38/7QGnefC/NvT7AR69jnOsy/B8
         FFVHrE9WSLYBgpCGUq+/Kq7oHufPSlut8sFdH9kr79yYx+sKLvDAeu0iO6K6aKx/JwyY
         xW/9bXYWHXMO3h0Xof3cDkMHgyWF1pnlfBiSuW795TmDy3FXqvD1fevp9MSRZk29qqu6
         38D9U+jlfO+RAlI6REETs3FKUNiN1P4NM5MDrcM1/ZCpkjWoNMsIJENV1LzweFMZufkc
         EYxZM0VAUn4VeTHZq0G5j23YKCsV+KJ6Nzx3juWWY4XX/WoIBifKiI/pEDhADLdHDZPR
         O4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
        fh=zh6nNzS2hEkX7s1ku4YFPkWnB38wBaJsWk7dGOpFPsk=;
        b=nFfPvBlmXR3DNayaxYrQctGojpUv3sezSyAthM8ZpoSyWNsWeUcw4tHzljcw+FdSb7
         Zpi6rO5ouG6/Yx62SYvzqT24xGHV4Ir8sN4y3/mh1FIGPZ7mDeEv5yjj8FGruie7XQdr
         DFf1BrhHwiTpLJDLuDcp5gXjuslU13Q1F6jjPMDitFdXp/aJX9dTJsBwMr5Gz1714b/r
         /tBi0+lMtfyxYu5raWMAcXJALgEul57YkMSueK/OKkPcInTlzN5copqAVNnXdOt7jE+m
         JmYeH02kK/EC90B+J9hxg0kPS8++rsm4VLlzJzVzGez9nTbtGBA1ZGXQwy0aUy6Euipd
         Zk3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421293; x=1793026093; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
        b=XSHkxma6BTDnT13+x5AWBYnD/5668BqCyFUIwVqRS4d9l+lRr6vivni/uVTf6PPL1r
         a6jcrh56+CsT38D2X0SICw0g6El+S324MzWVsKi6Q3HvBIQI1jh3T2zhImma4tYPM6ZD
         PoHq3iZzekh1g9bmJyfEDhfK8DiNlYCglrF5ZFxIjBoqiEFFNrT5Sex4IgtLiQUmLolG
         3ArS/SFwSq4bGZ8BISUvbyGkH7f+ZIc1ljtug6LIUGHfEGI1Xaw3kdYz4r9j4vhU7SIA
         GwSBhXj5YCIhJ6Ir/BvceLkecUuhF/K+vMw1DH/fDFSkxfhpcqtp9bAbCIRlkXiDvAmN
         AnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421293; x=1793026093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
        b=dSH4ZPtkkdcTxjXrOIB5gyG5UpdBxKibMxPqdMcxJiTTmANcFwY02EsMbUuWnuHmNt
         Hb/7nONhH6mDKPLZFcLs4vKW3p82fKKF3hNhXkivQCDRb0koEPHrl/BsmS69qsKPNfzv
         oJYP0BRd/pOpxCnIYj5s4CRQX8Wi5oZiXPUZJsYv3OBjUIXG+7Fson/QvrvBoJt6l1hS
         QRvmJkDh3DYaHv7ggouZ4IhBTYpFD5uf4R8hji9a2EjR09fCTjbZUwVDqNsnS9TUwq6F
         rBiBGQbBhZHLu1lCexb3CcneRreip4cgH7Lypazl3bMNy0dtO9OljZFVPY8zv+CD8daJ
         Eeyg==
X-Forwarded-Encrypted: i=1; AKwUvBwX5h/qXvSEPN3lK986hF0WdE/BenTjMyv28SJ+nuPP043cu33vuvO2tQf5JYz1el77GAHP1o7LCX+K9HY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJydU76fIublA6PVM4lCQUFpYckD9zhyP0Yh8ucJJuQ40BevBoB
	Gfe1TdqsJQvH3Vp0ejfT1K8yJ2XdSoB9VcySD38m3zUZTA+mDTwsaOhwrhJTwV6TVgzXE+ByQRt
	0jsBNnxByKTRwQLSXxb68ca9N7mii/sk=
X-Gm-Gg: AYBFou2w2vqLEjja0tM3OO3aTKaMHzp0AAicGS957w/X7zZ84/h/1uPsobtNw+Trj5l
	1p+oztIborl2NtleF5IuKdsTsSLuMOHGDmuj9mR8X7FOUykMospiEJLyVjL58cBGv9ZvHzJ9/iU
	JmBWkRM//0FoqhitIRqyyG5GclPfpf2PIXRGL73o/aPrfSrqEEllVmk5++uZNHhTfa7sEvsRhHa
	O1jg9jlhPXB6Wbp+IWHGnj0QqVUlK6kg8WiQJA0qEXNQVhPwKjlSadCVWmgK7+Beg3Qw6kPu3Hu
	yLGqtoxmTSCbdQhuDablivrLSlqQUUef0Xp8VBBJW5oD3jKH+2GrFWQh
X-Received: by 2002:a05:6214:20a1:b0:917:8ea8:cf48 with SMTP id
 6a1803df08f44-91bdefcebc3mr137859616d6.11.1792421292969; Mon, 19 Oct 2026
 07:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com>
 <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev> <CAKspSoNJxEcEH1AwXHyNY5cWVvCQ3LN0fcZ8d9ajAoShdBMRKg@mail.gmail.com>
 <ddf53c75-80bb-43f6-9e48-629b49a6339b@linux.dev>
In-Reply-To: <ddf53c75-80bb-43f6-9e48-629b49a6339b@linux.dev>
From: Victor <victor.gillholm@gmail.com>
Date: Mon, 19 Oct 2026 16:48:01 +0200
X-Gm-Features: AclHuK81zGARuTkywifK9g6jYxkCdd38peFdUhidq_nESAH0fApy0cojRf-755k
Message-ID: <CAKspSoMNC_V40bDXzB8noHJG9F2FT8L0eUmh0-Ks1fOngRG62A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ScreenPad and Task Swap keys
To: denis.benato@linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/18/26 22:05, Denis Benato wrote:
> Alright, I see what's going on. Then yeah I agree with this decision.

Thanks!

> My remaining question is if that screenpad-as-touchpad is fully
> software emulation (like dialpad on newer models) or is actually
> something different that can be made in driver... I think I can see
> some code using hidraw to send special commands to screenpad
> and I really want that inside the kernel...
>
> If it can be made in a driver that would be preferable. Guess I will
> need to take a look at asus_screenpad... Can you point me at the
> correct repo?

It is fully software emulation. I have made a ScreenPad plugin for
Omarchy (Arch Linux with Hyprland), and the touchpad mode is part of it:
a small helper grabs the ScreenPad touchscreen (ELAN9009) through evdev
and re-emits the touches as a virtual touchpad through uinput, so
libinput treats it as an ordinary touchpad. Nothing is sent to the panel
and there is no hidraw involved, so the hidraw code you saw must be from
another project. As far as I know, ASUS ScreenXpert does the same in
software on Windows.

The repo is https://www.google.com/url?q=https://github.com/gillmania/zenbook-duo-screenpad&source=gmail&ust=1792507315199000&sa=E
(the helper is service/src/bin/zenbook-duo-screenpad-touchpad.rs).

> Before doing anything please be absolutely sure you are running a kernel
> with that patch series included or you will see the same "inverted" issue
> after inverting the bit only to chase a ghost issue wasting a lot of your time.

7.2.5 still has the old update_screenpad_bl_status() with
"if (bd->props.power)", so what I saw was the regression your series
fixes.

I applied the series on top of 7.2.5 (all four patches apply cleanly)
and tested the rebuilt asus-wmi on the UX482EG:

- the panel stays on when the module loads
- writing 4 to bl_power switches the panel off and its DRM connector
reports disconnected
- writing 0 switches it back on and the connector reports connected

I repeated the off/on cycle twice with the same result, so the UX482EG
does not need a quirk once your series is in.

Best regards,
Victor (with a lot of help from Opus 5.5)
