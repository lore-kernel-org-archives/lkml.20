Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5247252A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758947; cv=pass; b=KOXTXWn7MTR0OYQEb3rSUjv4sP7xUhwvC04srjRydLVTVnvVTmTPKBonr2DoLjhI1+PUbmTRUh5+nflCseU1d9tybxQVOgmdoWHHcK/BUoCf9iXU9//LGa7TL3jG2jAoHqTEmZFahTH3YADD6FE6culOf4Gewya21JsjsPCxQks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758947; c=relaxed/simple;
	bh=LudNYNgHQKH6hdYc0e5cVfVYBZBCqVTtPXU1MdM7gts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz2t1gtIAOqp9a7ljPlgIHWGf9XH4Z014W7NTyRdY8TTKDwS99+DUweyUSyZuVbBj0J6ywkMteDr1v9txHpx4o5yqIzLdearEPGsmWZ/TyrT0XsEfP13fwNRV8uVXGheMQcMYza4kW4wSm7+gB4z+mvDcJSTcEAFXERPH3rITk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBIRrWvP; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBIRrWvP"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7813590eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758945; cv=none;
        d=google.com; s=arc-20260327;
        b=jfCkw85X5iDFdw3E0gDtr76/IIfLzVikjtO0Q9ATmpYX6gz48U/SfUhUKeTXZkVyyu
         x0kfSjKSvLjlwikPPekj1t7eWk4BROtj0awrMfY4Mhh1o9DzSfkiq1bnVEkWzAnW5kg/
         HotGj7KhA6aXmVhqQqF2B+DvHMcwL3ipZuMHF05nDHCdKrnbA7nTeJ6/0+0GN3T0/YaV
         JfgCMR0S88fUohea7JFXkoxBtE+q81j/YzgG4s8MmYv64FxoaKI8t0G/5wq3mNQsmUoE
         EJZ3KjOtsZCstRex/OAeijeJ6OJ9DlFVDiy09NYUdeSD4mF3R4Vb1D4Kso//6d3dAY0R
         +Fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        fh=W8hxQr08wVMMdYbBrMe6RC0mPETRo8IEzckJbE692oM=;
        b=P7tceTL1LJGx3VT5qnvRWGsYuvGy2FYQGNmHoR59FP0/KVlPowIrHfl4yZSesLHXfW
         LrU1X/IhVOYMjPgVwKrGaHcCfPRz44TaynfKTV3SeBMVZ8Q9I5Gn0NzoOMbOGYI4QDSR
         iSfL2TzylwKa1dzphLliFXvn9FTIAuAomxWcnUXVEM2q6W/EuLhDehtBKLGgf6c+SVs0
         BnQ8ZoPCqd8MsASw3vuTl02Y7w8mu9S/ca96VSTR//mJpZhnup1Aewo6Rc5HS/typElr
         yDZMBULTJDhlEmC1vH55fE/s+RY2BAe8eaaqmxFd/OBr5GmsKkFg15GfMyU7S8qPGBEG
         Yfww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758945; x=1791363745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        b=aBIRrWvPgLicUMdgdqp2LKbQiCRzODbl2m7RBZu9meqKBaWGbuExyB4QG23JPma/1y
         ZE0nFUeS/kfPvJSaDizyF+Se6oa8JId16R9eSivFfLSeBVhDJJqX2Aw4JDXatWMQJoaO
         J+oWq/Q6a8rR+XjpSji5bPPLEUGgEER0sVftpfQCVV4w3xlc7dtMgHWquDoZ3tewSkJy
         /q+gJO7gHRmxGXrG3+GZvz8EJFHTaDNrtg6SksY1hdofvM4W7ybSOQcf3VM69rf5CUFy
         TYA0X99kdIlHrJN41VBdqCvRIfTLVdo69swwjcqP3pl+bD+QOTl/rrSVT0PJ9T/y+tzJ
         ls3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758945; x=1791363745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        b=QLN/0lCnew3arbJQEwsbD2GFgDOtcNoEVwtw9KgdOh9kXEGMtp/ek8uKNuGWOoogpP
         NKThwG5N2uuDeMnQaNRT4Uv4/0iUGDhbD8VSA+bX9C7H4zwJO6jcRR8HZT7mp9rt2peE
         cwY4MbZmuIk9NPhGou24nlRuedZmm72nhYcrwfTPAY+RrFls3QFJpL3bc3iyxUSRY9fO
         HcODZ+hHMUb8uO9OekSX6u/Nvc6BDQdqu7S19Ez1u765LwjdWLVfsYnePFmjfIZnrHGc
         UU7v3znyiF+ftnQHrAFIj43gZ+wlyeo7b9p8hbh5UxaLOIM2AYTgXpQj/Zjwptl+N3WN
         DXjA==
X-Forwarded-Encrypted: i=1; AKwUvBzEem5yQjdkr1kvfvWesJeV19RtgLvSo3bN+0RKqjKf6d7feIIWnz5EkAt9LxGBI+LBKpdmAPWjCnUdy2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0f9H+a8gTzyYPpG2t4JSh93dfgs1+LjhtDvvUKBdE+TpxpYHn
	r3lL/41uNZlE4y1tg5RAvL1jrcA+07hHzaypwQ+XV3gEwMZa5rUr/LOBe2N8PWSq98+uu13lgsn
	bkOo1K3m169VfYU4MZJwgTob6vj+DGOU=
X-Gm-Gg: AYBFou3gjkvUnh2fzxHgwMpH4pq79pEn7KWVVZFokM9JpD+VZPr/VRicbZfVJRHtEzz
	xf6F9K2OFDiwNRxs+V8kO10DG5tu36DsBjvjLHjpa8dTBvHI9dAutTb4j5Devm89SzL7vqMI8Fl
	zjPVJ4ws60UAPLPAn4POEWy8m+hmIcpDyK7/9jBoi0ho1cKPwfGmINC9cVwbIWoHE4gf+HG+vnl
	JpKT4A3hpMwimHfRgdTTw5BrxA5KRGA38QOq6pNab/8g+deovFytZ5OymZIuuedvLasz7Mv5dM7
	4mj/xTzIZ+xMxjG2dZ6u/7O34X8qkCbPE3awoQrXfva7UvGHjSFQvz20xpX+M0zbuXoayi8mzmJ
	5mzwdRuUAaQ2LQik9VvhEL/4=
X-Received: by 2002:a05:7301:4b12:b0:34c:85c:da56 with SMTP id
 5a478bee46e88-34cdc1ce152mr1130423eec.17.1790758945369; Wed, 30 Sep 2026
 02:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-5-clamor95@gmail.com>
 <arzMjoi2LcyfxCzN@orome>
In-Reply-To: <arzMjoi2LcyfxCzN@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:02:14 +0300
X-Gm-Features: AclHuK9Pghb36l-P22g_3lrlycHGrleGAXYX6a3Jb3oFvTmErepUHWwZ9_v-FXc
Message-ID: <CAPVz0n1WnhwOqz2xOp_0SsbgUFuYAf5YBByoMv_+XUDPANvhFw@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/tegra: Add support for 8-bit CPU interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:48 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:33AM +0300, Svyatoslav Ryhel wrote:
> > The display controller in Tegra20/30 SoCs features an 8-bit SPI interfa=
ce
> > that closely resembles the MIPI DBI Type B protocol and is referred to =
as
> > '8-bit CPU'. Each display controller provides two such interfaces, whic=
h
> > can be used to send MIPI DCS commands to initialize and control the pan=
el
> > while image data is transmitted via 16/18/24-line RGB.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/Kconfig      |   7 +
> >  drivers/gpu/drm/tegra/Makefile     |   1 +
> >  drivers/gpu/drm/tegra/cpu-bridge.c | 427 +++++++++++++++++++++++++++++
> >  3 files changed, 435 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tegra/cpu-bridge.c
>
> This doesn't need to be a separate driver. It should all live in dc.c.
> Or maybe even rgb.c, since it uses pretty much the same pins and is
> quite similar to it.
>

I don't mind moving this to dc or rgb, my intention was to avoid
bloating them with smth that is not used often and is present only on
Tegra20 and Tegra30.

> Thierry
