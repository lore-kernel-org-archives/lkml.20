Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61FB47988E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595049; cv=pass; b=MBwWrbdu/M4WBZyANit2SOlNkHAdoT2ZUCX3ve8VdVT1ysk9XbOuCapsUWFnMMMJtHJ/Mv5uuvnGWc9x96k6xtYWzN+3RoSDPfi2BSHJ+DJopt2LuWi4tu2J8TyuJnZnLJV9aAwqf6FtGgy1TKfVYaReeZ+4AusdApNqOMm7MOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595049; c=relaxed/simple;
	bh=AayDStxvWbgnmWnKvKHBN/OOsgvHcfSQuvWss2icNiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7Jtp/ASFDIFuSjtFSaonoNWygdnyHuw4W8vETEUXGecd1Ny3RJpFAMsKapYUbPBSCbo6SkHWeZ4/Mss/Gp648fK3RvlyA9T3Bc/pUVkcz2XY9ORW8dvNnuQbsEF46weM4WkUzYSslLPetgQVigmGKQxQhPzO01WIIW52XmB3TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=dXbtpYXH; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="dXbtpYXH"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-86162c086f8so790347b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595003; cv=none;
        d=google.com; s=arc-20260327;
        b=U1EubG4pHMBvI5umkEctOcEJVePVZFeiYayjdu8zf9znlZynTiKdvJmTf2XRJvmLKS
         Uc+HbTd1hzRG76eT22FIouarS1LXAh1k9pM53oaaj+pXHzy+DuAsC2dKkmRo8ThgFvUj
         KnqGkkkUv2n4XyLJUNLbgFYQBR56DXnBhb90OmxSN3FHSs8w7mGlaCpoBvqwetpCA9qp
         iVGZ+IJN4t7RhQ3T/c88JbphACQ8HPAFyuYaBitj52RvW+PVnF467sJ69RCe/1bG5qD6
         Ky7VqhpWWtwW6OvE3kw9triTPc1DCoAuj2esFk2Tw8ET4wGLAr6q/OW4q8jcZyQIKoRR
         jPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        fh=QqFXR9r/vB3v4/r4K33bwHxP56UoPCsthLVf7ENyzrU=;
        b=coXQ23diP1fcnRLNFGatR6H9alFocp+8pQVb8JnTjjIg6usUy0JW2D3ZRjuEo3xtD9
         dk37Hi7TDz3ZrxU6grKn7E3BHFfgst2UuXFIl2IyF0z6RkXpU0ue+9qbtrJzaNEMqEjA
         Yorwgtht65M2hGmUIGiakx6RpIu680vTaamTTjlQruRJ8br5LjL0/8o9/kczy84q55Y3
         /BKaQho1yc5/R0ESRUEiCyjc7Qw6Jv4Ae14Wc377k1b2WAjfGmLYIR5MgOEnhq139VIF
         eb7xxYO5j5388lyLOuD6bVkd4uFT4iXpVbv+szBnR0BQSDVsh8Swt6RIOz4cGnOt3deD
         jJqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789595003; x=1790199803; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=dXbtpYXHwQ9TyJdQPhosUApAyoV2HEIct/41EktUePE54v6smV7H3Q8v0nGzn/94sZ
         mZvMZpMe9XLxMfjWFpQCjrmqc+Z/HemExcC6X9QrSqUA7pGkQ+wvF/tUB5WDTqd9WyA3
         6NRc4Qghta+bqGxbrV3xAuDsbjgruHCwelrWGV/uun4TDBYo8wlUJmQlvTjTq+CDxZqI
         3PShdKMApdjlcHlbhuI06nwzjxqY0ek4e/frKxD5wuf3UcYu96nCIggxuvEn0gVBXjdI
         K6rHo/3zhRGvAdYVxFyd4ILb/btN+a72TV5ott64EfY0CNUPrbuyvg68cKEtwhHg+ct7
         Ytvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595003; x=1790199803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=PU+7Zpjhs9Ek4VcuGf7WwWSWKG6VI/ulj8q2nGsUfFQzdzUzQP7U3b5dCmv0nMZnKp
         VtkIjifuZqpGNWetWCkprcLGCXIjxglwoOxZBqhv5tsjksFxAxrt3JreVyM3rVFwje01
         u43of/sjRJMaOj9CvUKKwqtALwPIy5TypNxSNy+Sd8UPY9px1lXu+FlP4JpLY2rVp3wc
         d1WQpNgFp9eIDBY/dhOYAPY91DBLbcIt4Gcgqm+KwBLXo1cKIpkw2ha5aJHIpNbMa/u9
         p7OYFPaO6KwAg1PCnJixysUOcRzP2ISPw/yEzXkP0SdgApAwdXPGQ8n9H1C+fk/MGOEX
         fYIw==
X-Gm-Message-State: AFuF++myHBpt/P/RoE3hN6UlawJRh64jauAO64LTxTjPcNGZA0jJBTk2
	hKMXxr6+SDn+2NKaxBUo4D5So98TH7KzQrMtm3mKzuEhoResmxj2Ir5JOiSf3KtIojo3JrgsaED
	e2pgzJnALvbXwO/4Dtg+GNDEtLwn4dtPmjaBXuFKv
X-Gm-Gg: AYBFou0p1EdeXGzxP5aTH5XUqSeP7kgkiLO8Z23JVcm/MEqUVPvcGQurw4BWTqTyA6G
	n4i2QmVL9eX7uMyAbsaxOY71KSXY/y8X8QI+YsClVzx8e/7o5Psxb2Dug3xGE+bo+0JWc3Ag9JS
	GACssWQtlzhOIE8nicOjtw5Z0WCdGMEsoLSagsIWerxy3Gohv7PQDIWbKzJeKsDqSsdqSmHakhT
	70Yh/yJi3NHS0iWGTTbUF46v9uK86Fpyx2F98aTko0z9gF0TEJ7HUDHHkFX9cXVhL3Cgp2YNgz/
	Cd/NXjnCIn5FEEnttbJhEHSnklyqpyvdW/juPBgFLLDn6u5V30IX9AtGgHdCzcaQbzlKh9WN/vm
	kUi5qRK2m2Q==
X-Received: by 2002:a05:690c:7:b0:873:5c7b:c12d with SMTP id
 00721157ae682-8944596a1a4mr2540477b3.21.1789595003466; Wed, 16 Sep 2026
 14:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788284852.git.sean@starlabs.systems> <apfz3lf1RIfAkKYS@google.com>
 <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
In-Reply-To: <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 16 Sep 2026 22:43:10 +0100
X-Gm-Features: AcwNN1U8ZB3podUdFXiPZ834VqBifCusJKONnKfdetS9jbEaRFfMhwBYCh_JS1c
Message-ID: <CABtds-2srRmKDvNj7g_0C2w8L72WczLsA+Vc_Yg3KC4gvSJyqw@mail.gmail.com>
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

How about patch 1 and 4?

Thanks

Sean

On Wed, 2 Sept 2026 at 11:01, Sean Rhodes <sean@starlabs.systems> wrote:
>
> Thank you :)
>
> On Wed, 2 Sept 2026 at 11:01, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Sep 01, 2026 at 06:48:01PM +0100, Sean Rhodes wrote:
> > > Move the firmware attributes class helper out of platform/x86, rename the
> > > coreboot-table firmware driver directory from google to coreboot, and add a
> > > coreboot CFR firmware attributes driver.
> > >
> > > Changes in v14:
> > > - Rebase on current upstream master after Linux 7.3-rc1, preserving the
> > >   intervening coreboot table bounds and CBMEM no-map changes.
> > > - Drop the standalone include-order cleanup. Replace the affected relative
> > >   includes directly in the firmware attributes helper move, as requested by
> > >   Tzung-Bi.
> > > - Split the DRM coreboot framebuffer dependency update from the firmware
> > >   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> > > - Keep the CFR driver and its runtime behavior unchanged from v13.
> > >
> > > [...]
> >
> > Applied to
> >
> >     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next
> >
> > [2/5] firmware: Rename google firmware directory to coreboot
> >       commit: 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602
> >
> > Also created an immutable branch "ib-coreboot-rename-7.4"[1] for patch 3
> > and patch 5 which build-time depend on it.
> >
> > Thanks!
> >
> > [1] https://lore.kernel.org/all/apfyaxKEEJz20wRC@google.com
