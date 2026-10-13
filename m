Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B4517BA3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902941; cv=none; b=HTA7+0emGHY2wUuczgLfoTN9dNtKBcBykeMbLhINNIXdBtCwrzozhTPirK8b/tcX6/8lboxC6OluLlMKdYswmCtdKJjwBj3b0KIevBgMT98/mM7E7sTmn1aBa5lcqFCmJfUVMgOKKhZVC+0gmTBuRJ1W5MaY0s4gYA+G3mqkkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902941; c=relaxed/simple;
	bh=cVA4vzCqXXIeCeCWsLEP13aJ1NxrMANcqoblpdZR14Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpllyKSD2jW+6EzjcdDUUUHbak+ya1HksKjLNr3cTCii0YLC5jGr2qh3oFKlxUEsAzuTxvL8Lbynr52WOT6an6SAGRTC7ffyhYTrFpeCHkSkFF0SJgwzSO7ZJ9llO0x8ELrhr1xvaxQbo9eqyEmrNoOs2uQqwgIoi4Mdc5kp7CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L22LOjbw; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L22LOjbw"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1207895a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902940; x=1792507740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQnPST9S9TXx/lpXdW6R6/PTycYLIXzyk2fMAOlKVx0=;
        b=L22LOjbwcAv30k3FN8mD4y2Y8JD4ehjLesxHyj1YhOgY12eg3W/jwXt244sYXGRBiv
         nF58V542nATq/Rkohay331L6XSnqEa60jBtSZTwUVz69Sm1GaBAl7aWHuEwoiL0tEa2E
         kJ7k9VpRVA59g7V8eiVOt8tf1wdnI47DUY53TW0zXhqTkz2qOSlCZwCS+PfQYOtxh0TR
         /GS3XLC5IgsQ++gKb1yyZ+3bEsL3nXuNl8yuZ/dj2Y6s0K/vIEFAOgAJRCGLujkSg0Nj
         OkY0WFAOShjS5G7kvNFlozrjYMjqkjirU2pEwNXjzm9/NgHbODZBIWihqtRKZpcgpkjU
         W4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902940; x=1792507740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQnPST9S9TXx/lpXdW6R6/PTycYLIXzyk2fMAOlKVx0=;
        b=atXAETHweJQj+TB9JNXoKIHZu7UcrX1HsQm9zlvSVq650I7P3UWINyHXlWhC7ZD8GD
         zS9y2gnjtRdPKp1sXi4tTLXooTT5zL1cKaD38px7RZi1CEmPiWjb9hs2q95sxTQNf4yN
         gc+stbxCSPtJm9vGO7mmUhJZbUPeMOOVYj5gI8bnJIFaUWlfbO6CXlcEI9fxyI98+FI+
         hFQWaDvb08vIEqa54nZiUdW2YwYNxhIxcP9Q/anJBeLAkO3XS6YmVlGuRJyrqGZ0MlDO
         4GmSfVE81XF0Ffhgd876lvh6LrRrEpgadUl2hYbNotRSqQANQ++/nv8vGLh5KozIvSBp
         OBTA==
X-Forwarded-Encrypted: i=1; AKwUvBwAbfreO3yOeUeoa7r0shAeGFr0f14TOk/lVn0MpMCZLaiXcmHEoWE1Ya1odWuGiYTnNPHkwSC4B5Nxa5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIngtm+Geiz1QEFn9sfJSp75SLhPwAilGIHpxhYnqTPA5xgK3k
	m2xBfZeEd6TdIQr0yZQANC0E3C3yH1bnV9hPYxLnjyg8GV0xR9n9Z5Nk
X-Gm-Gg: AYBFou1iTqUf3/ZOW/VoHyOSjsIHmlgfzabLbtSsoyZEd/Wr7FLXp+N0xH2rf03e1Ul
	RRSAchWxv2cSOhPD03BZdv8A7Sqm04ZPtBcJTTWSf3vN4+ljfmiyh19gCfregSWzpxwx1/rATPX
	Sj2yk4Qn0Y4ZtoPnbce7c2SYlVlNMPFkuJs8xG97uzo3AMuSJgIDaogJzZo5x0WbrsdUsAi3fPE
	fka6DnVzGvzBNEgQjG/iVyfCQGshiafKgaUjiesb1Ka+di7fzHxjGwGpPAUGJA7+jzcTdtjNryM
	y1Pe4WZBGD975mgUGZaXovCB3hZwdwq/nj6XXymTj5kIH2Ki+MHGDzA3kGi+WTyLgjZbQta/rOf
	D5eLu3ECvOf2l6BQfBzjxO6sfo6pio9I/ewKLObDCLYg4VbDaAiSi3BJNE/aG7foI+pRynzGzwK
	DI3k90hL/aKlremUN2prOcFln4pVmdiiTWuQJ9EbY9Pi4oeyU81eF98C6GyNeGhm/etysFpY1YJ
	B1UeKywbRXFA+en69EY3w==
X-Received: by 2002:a05:6a20:9c15:b0:3e0:bbb8:bbdb with SMTP id adf61e73a8af0-3e16be9eb80mr11142742637.47.1791902939830;
        Tue, 13 Oct 2026 07:48:59 -0700 (PDT)
Received: from arch.localdomain ([161.118.199.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896b68ef2easm5380700b3a.7.2026.10.13.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:48:59 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: dianders@chromium.org
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	jerrysteve1101@gmail.com,
	jesszhan0024@gmail.com,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV140FHD-N43 panel
Date: Tue, 13 Oct 2026 22:48:48 +0800
Message-ID: <20261013144849.343351-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAD=FV=VZs9bZciynpey2O6Yy5DQJqeq9Rgz_Ks6dgsBhVUkenA@mail.gmail.com>
References: <CAD=FV=VZs9bZciynpey2O6Yy5DQJqeq9Rgz_Ks6dgsBhVUkenA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

> Hi,
> 
> On Sun, Oct 11, 2026 at 9:44=E2=80=AFAM Jun Yan <jerrysteve1101@gmail.com> =
> wrote:
> >
> > Add the BOE NV140FHD-N43 14.0" 1920x1080 eDP panel found in the
> > Sunniwell Z96A.
> >
> > raw EDID:
> >
> > 00 ff ff ff ff ff ff 00 09 e5 f4 03 00 00 00 00
> > 13 1c 01 04 a5 1f 11 78 02 3f 62 94 5e 56 94 28
> > 21 4f 58 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 c8 36 80 cc 70 38 14 40 30 20
> > 36 00 35 ae 10 00 00 1a 86 24 80 cc 70 38 14 40
> > 64 64 44 05 35 ad 10 00 00 1a 00 00 00 fe 00 53
> > 54 41 52 52 59 0a 20 20 20 20 20 20 00 00 00 fe
> > 00 4e 56 31 34 30 46 48 44 2d 4e 34 33 0a 00 97
> >
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
> nel-edp.c
> > index ac815729aa83..ba981581f3b4 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1972,6 +1972,7 @@ static const struct edp_panel_entry edp_panels[] =
> =3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120X=
> AN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
> TN07.7"),
> >
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x03f4, &delay_200_500_e50, "NV140=
> FHD-N43"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unkn=
> own"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116=
> WHM-N11"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0609, &delay_200_500_e50_po2e200=
> , "NT116WHM-N21 V4.1"),
> 
> Things look pretty reasonable, but before landing I'd love a little
> more background about this panel and where your timings come from. Do
> you actually have a datasheet here, or are the timings a guess based
> on nearby panels? This panel is also curious in a few other ways:
> 

Thanks for your review.

Regarding the NV140FHD-N43 panel: I could not find its dedicated datasheet.
Instead, I referenced the similar NV140FHM-N43 panel [0], which shares the same
resolution but is 6-bit.

As I understand it, per section 8.0 POWER SEQUENCE:

- hpd_absent maps to T3 (200ms)
- unprepare maps to T10 (500ms)
- enable maps to T17 (20ms).

[0] https://raw.githubusercontent.com/yjun123/e-waste/master/sunniwell-z96a/datasheet/NV140FHM-N43_GZ.pdf

Since delay_200_500_e20 is not defined, I'd avoid adding a new delay entry.
Reusing delay_200_500_e50 is acceptable and works fine on hardware.

> 1. ID (0x03f4) is much lower than other panels.
> 
> 2. The EDID contains the string "STARRY", which is weird for a BOE panel.
> 

These two points are indeed strange and I have no good explanation for them. 
That said, I found a third‑party EDID for this same panel [1].

It contains identical information to the EDID I extracted from the panel, so
this is not an isolated case.

[1] https://github.com/linuxhw/EDID/blob/9c0c1bffc9c0f1cb2044115149a5ecb1652803f8/Digital/BOE/BOE03F4/C26FE7F0F22E

> None of that is necessarily blocking, but I wanted to get a little
> more info. Thanks!
> 
> -Doug

