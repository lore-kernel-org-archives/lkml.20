Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B2385D7F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343325; cv=pass; b=XJnwJIi1wndvovxentEJ6j+v1/iU034QO83dqtmDd+PIQypDIGKKCBNPaz4OTCy6b6gk8GLV7qqUgCOXmutwZK7PFPHgNT0vCQTQiu4l0G3R4u3douFGRDINxWBE3/itO05Z0DHHJhle67WIQgYH10Ns+wVtyjxACFd6u0XsJnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343325; c=relaxed/simple;
	bh=BsYSShzm/APLl8qc9BTfD5vA4H/CGzk4/kuElmC6cRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsgtFjApE8vMeHIMA0o+JFpLmi8DL6gxFupg+gpeSvLUXzc8j7tirNpksXc3qjRmbNjTf5OFctLRzTgkvihqEoq8RY3ep4kksvq2+YQ34xdO680GjjVAgq27Z5yIJlb6ptMrMwqCovEp06Sy0bTLjDfuOvothSFN/b2tHAoXx5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=cukFOPpW; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="cukFOPpW"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66e64e6e3fbso890705d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788343322; cv=none;
        d=google.com; s=arc-20260327;
        b=fQckl0myAc76yqgT42VBi+EPF6LdFBOGdomYxg9/Ddrxn4NXA9ttiY7ceY7tgXAuR6
         cyZyOBnVHWhAIPcL5/9b5cYFh/hudUeuIkIIQrpav6cS3lSQPQAyQbuiZyAn6RBOztwX
         oUh95+em8gojhdjfemhfXbx2YkoroAQTMse0xlpKCW0tGWDI5aYUE3iYmwxclyMqaFMV
         o3tB656W+H3xJHQe8NnBitAEfZos9ec9zfKvX0UTSpLjn8Hvb6mwqUI2cWn4Arue6aPj
         0ajGPqiDdTiyoJi87SoiIa8V/cbSu0v6z/lkIlXom1x2Am2PIor40D7s9IfXXwWlgJ/V
         vNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        fh=QqFXR9r/vB3v4/r4K33bwHxP56UoPCsthLVf7ENyzrU=;
        b=RtzByYHRO977Odqb9vliiEbwGPQtSWUEbfCNwl0Zyptq2UR/QxZIisizNe5ygps6aO
         UPKwPzcWW96aJhMmHwM0eOBRx/JTwmipFgmZ+YWrCzJbHI4///aSMcAacQczEPP8MWoZ
         7GscOs/gZJulw8V/x2iTM0s78JbyZ960FPfsupBnGvxbUTdjsFGrCa9D1AWuKVkraWSL
         UBfANbqgpb10EkECNReLRcZRkpgohNxAm2oCZxQqZ6bjhxTBe2VxlkALS0MfYUTgsFyK
         PBB9jmvg2ingbHbX3jEjhE1QkJYCmKmmcqkRbQb4qTF5dzHshQIHKIoAI8tpcTB/pmZS
         FWkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788343322; x=1788948122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        b=cukFOPpWULYA40IKjHFhEibnktjCVQmYg4ucHFPny96C3aCN3PJGdIQEx9YG1/yfvJ
         eIMHcbGPdrZlKseIxXrmLDKp+x4O+mGt08pIFeW+Q2p2/O4XsIbaepPsszKo0+q1YKG0
         YM75CO6VzP8BKdOw6YxIauvwSt4byls0MkqutJxBll9+fXW38v/+JAvn3HUqhtQ2uC3t
         2BO5iGZADmdpFgpGUGDpXlHgvNgbBzGRSDX2sZWt8dLLfPb95sziFLRIJtFfqu+BVasZ
         t//3ngPxN/sR1S1Rr+4hXXbyEAy5aDJazyebzk6WN4bL1jUQEdDSN3iORSGHmQ1u+6w5
         SPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343322; x=1788948122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        b=ERRKM1C0Qi+or0YTmCv9KGHRG8LQdn3KjPhb7+/+BZd24oE0tvP9rW2OebAxgWKG3b
         ELxW/fNm171cfhuemApw1o+KQ2bRjNmJKtMtezVGZc90JG/Z48OLt0G12bUpIxuBlZx8
         5los5kQt8pr4NNpewkwnFHnZHZH1D8Xs/yWq8trBICe/kvvE3Xx/zLmlQVShwigy8pAv
         frKVvsOOrQMq/4/Pvg1vEcgdSgz6jfFrb/nlIEuS1Q3xbAzdSvlz28Uf4U0NNzkZTrDz
         6wsnzhdMW7IAtLLKSfbHhoHK2yOB4MoX1RH7tmdvjv0V0FryK0QnDNGsWkZWBxwCiEyY
         eRuQ==
X-Gm-Message-State: AFuF++lAz5ya+nqCHwK8gj4KLvbBgSU3qbjR7wnksTW6hpRZ4r2y9PJL
	KHiGGF1zf5ZwkvgFbg0SQOO7N/KgxPIgaxVSUPNlj/5pUXntUjvQphfzNQXkPeuxiV9R1w+aFgL
	3ceKq/Jcw1U/dVKshaoHDm/7HduP0t4RkzerQKHJt
X-Gm-Gg: AYBFou1lfG8i+vsVhV8S27wCB04fEasR27Nv0I1Mel4kvxekKo8l0uDsk2teYUw2NH1
	+dK6rmK6YcPa1nDRfUbCqqYIWkhXwAwhWwIPbYbqLvZ/D2T/lx7A5ydk6Nmxo0ni5sHuhFFFJos
	xGLgmMq2479ynCNuisDPT/yP3BE7N0iayoD/TYUN/M3eynbXhLVntg1lv0pbqa3HHgCguvs8j+Y
	ectQA36/dWw6DI8njA1GgmgJG+00RFSUfZR62l5OUs/02se3u2m2aTpDn3FCdnmHDvDyghVTYyF
	OvbF6aKlmHbUNRgDkuqfcaUMguE4tePV1ZGZKQ5iBLMkESj0EKGCKYN4DNcbqCwpIKwq34k3N1x
	j
X-Received: by 2002:a05:690e:1514:b0:66f:7c64:9d47 with SMTP id
 956f58d0204a3-66f9bd4991dmr1118782d50.23.1788343321975; Wed, 02 Sep 2026
 03:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788284852.git.sean@starlabs.systems> <apfz3lf1RIfAkKYS@google.com>
In-Reply-To: <apfz3lf1RIfAkKYS@google.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 2 Sep 2026 11:01:50 +0100
X-Gm-Features: AcwNN1XY2WlZI7b41cj9pFZjq4mCyoo_3nH6T_KZHZYXfCYS3mXFpBitd3ECMtg
Message-ID: <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/5] coreboot CFR firmware attributes
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Will Deacon <will@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, 
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>, Yidi Lin <yidilin@google.com>, 
	Kees Cook <kees@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	chrome-platform@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Michal Simek <michal.simek@amd.com>, 
	Sven Peter <sven@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thank you :)

On Wed, 2 Sept 2026 at 11:01, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Tue, Sep 01, 2026 at 06:48:01PM +0100, Sean Rhodes wrote:
> > Move the firmware attributes class helper out of platform/x86, rename the
> > coreboot-table firmware driver directory from google to coreboot, and add a
> > coreboot CFR firmware attributes driver.
> >
> > Changes in v14:
> > - Rebase on current upstream master after Linux 7.3-rc1, preserving the
> >   intervening coreboot table bounds and CBMEM no-map changes.
> > - Drop the standalone include-order cleanup. Replace the affected relative
> >   includes directly in the firmware attributes helper move, as requested by
> >   Tzung-Bi.
> > - Split the DRM coreboot framebuffer dependency update from the firmware
> >   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> > - Keep the CFR driver and its runtime behavior unchanged from v13.
> >
> > [...]
>
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next
>
> [2/5] firmware: Rename google firmware directory to coreboot
>       commit: 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602
>
> Also created an immutable branch "ib-coreboot-rename-7.4"[1] for patch 3
> and patch 5 which build-time depend on it.
>
> Thanks!
>
> [1] https://lore.kernel.org/all/apfyaxKEEJz20wRC@google.com
