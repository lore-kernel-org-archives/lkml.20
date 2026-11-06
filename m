Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973683;
	b=GO65hRtjgeqsDQyvsCGgN2qFs+2d378E68X5lYyFGeJklAEzkmGn5eLRawbLpzyf9/1x
	 T3pzZf81HEFq//+QUt0NnVqwBZxOnWr9NqRqEz7FRq8t4Kphqxd7za0Ufsn6w2/qW7VSZ
	 oTPK0q9AmEfDhH8aGwFW9bCrNzt7TbgXdREy028HHot7GodscCIB7lvtHShJy3vnrXG0T
	 qfjs6X6zqQhdqurewqM4xJDXI9UVu1wxflUBx3xpzwpKByEtYFh/HaX1/9hikhfihJFPK
	 /UJ0iNoYejMQztJmarc2u+5SRrzlIX5Sc/f2b856nFwcc6Ed2YQtc6t5w9SV/kwH3Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
	b=PefdB+/BUJksvZPKKxmu4gmlXh4fshYRobPNhUhd5K4tAlt54/oQeW95EDVJqns346/Q
	 X3FuluoHn+bqEr7/GEtk+eRVGq9u7sywp42A/95pgfJsOGDG3Hjg1nJeGQ3+VTZL155E1
	 g8p5pPpRxxqgT8/8lZFRIOx8aT08XY7KKjyNu5p7HseH569n54ODQjskFTTh87A2YkXHK
	 dRUlORj6X77JvP/OteUIjBc1dE8AGqJlFgC4tRYehiOQZoJtWZ+wG18GY/YfyCdK+QrE4
	 5CHf9egkWYjT4HowXLulToTbGmhFAnRi6XFxwujO3knX+1oqole8qnzuWgDEN42yhZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL4eyxbM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E44606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E44606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL4eyxbM
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso1436682eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973683; cv=none;
        d=google.com; s=arc-20260327;
        b=sRJXsyAGvU+B6FEWPAlgHpR4sUQBYvZ3lTNp3KGm79GbCkv0knh4yY9zZ74ZJVp4+t
         6ZGzOZ82D8SLyIXeqfNnWDdEY2H+dD1TbRAeK/u5JD+ZsOW/+w8pgnmnQ9Mls/tNtZC5
         8IiotxFxG5F8uMah8CZgTqeFwX6bpqry2jQlFmT540PzHQDKAoNgfkdNweGP+TYJRVyy
         QlMxBMZxh2P6HXm+UqCQkGGWty/d5mgsqTLdZPB9cW3bRSTOAC0isdIupinEz4vqsn7u
         ZThPtEMGx1e6nI6O6S63iE/yASx5n7SdwTi4+5a7QN/voHGhfFlqWeHqfIZgFdYakotq
         73ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        fh=0vmsGPZuJPfjqbZjIPgEQVMSSAOPxMGJ9bQXRjvZGa0=;
        b=aUvcN3qkPyr7o42lfB/+GCnq8Y/cfOTsNDRkwbrDE90wjt6zb8obWxMmEjxQWS+lzu
         GKqlnflf2WMPiHp6OykogC49JKwvzc05TboQhkQqDrKvt9MBOl/nw7WEQCnyj18tqH95
         37+ezF+fjVyk2zcniOnRqWIMmo2uyAHmTKhOtKs6rQELgpwqA+bAbFesaw8kcKESrqEp
         n8ZQ6QJeSqbJz9sHEYn/WwjnCI3ym3ux8ulXDpYvTyLNyUGbN6hwtO6FQyLNmRD9KkOt
         e3wYSk+AmUWXFdZcaHSDbcrj6QDgPkRAFC0YmCA8GiYx3oprz0kTHfJBlJC84UNrtlZT
         nwyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973683; x=1794578483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        b=AL4eyxbM6ObsEeaa/2gazaSA6gok3iVwFeDJ35E8/pILPVLYgobruozBObA/E0Ggq5
         hgif8S8hZbEx6Bf3cNzY1Tf49lnz6zSVH2vYhKsCcXtuROB4SwwgNXynTcRx1UY8rXWs
         ZT8iGvsq1xD8mxC7xx7CJk9mXQ/QVDZpVdFxRcVhb+An9UbIfIHTryosu7EUoC55bce3
         UABoSch8O7ZkCBkxTYU07zOzKyzE/1uizzOd+nMoCH9YBaHJhPaz4lbnc9U/Cwo5LzJH
         NCF0QgV9ITR92fjzJdEuhrtNdzwbNBDNocuomHgP4b8dlaY3ZJocLbuZQpKtLwsdKCjt
         dOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973683; x=1794578483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        b=aA/+UlweFhZAUtIZH8Wgm5h05fIRGf2wiqG7LGBWgJWtZUas0O1g/56wy8w9x7UcF+
         oxcDQo+KDcYoOwRfvQMGat0lR0c+3/LMvMJYr2bAelx1P1Yl8AXlLwO4s8bw0m0SW6ms
         vt4NVqm2X4JgWX/U5P5SecwxXilQ9zfpxJfrDuG5DECX/HWlJfSCI9ve4hrjHzKvDx3s
         lBbNgVT66sMfsAcaCF0kE2GleSEcaPDkM4VK8Xi5JIobocAM50mk6jHPVTmsUKofhcsB
         2nhs5RQJ4n5Q3RxIUXUFM2lyHKfoXiBgLigrulZ15cR2+QiMMNZfXavrt/hsxZ1Bkc4S
         3t+w==
X-Forwarded-Encrypted: i=1; AL+hErFQp1eS7IJvL6pRTGhjx3F3X6hXyWaNl/X7fhbJVR0S/TP2e0+NKY3wE04dCDqQaUCxDuu92DYynto33jA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BYVzOf9Ok0CX9lVnDKCJHJfOsp/I0jTldP7eVIn/bBpCYnqjO
	kRemuo6UUfqwjzqUikkZmkcMBRwe+M6CkyZqgd8mhuUbvd4ts1SnZD4uhbRF/p2CAnGG+3p2yKp
	ZuLWbJ3GSaoKO9cC1/OBdZ7xw6zjsikc=
X-Gm-Gg: AYBFou1VL9JbSycwUudJ8xy5Qq40V8eVa192WIDamTN8EvnKuuuQ8uyTWoYB2WtvyS6
	Zzd3hXbNXnY0lQrdMuRkbJwkNYQjT00oa04DuQyPGgb4hNOoN3tAOPHwWi7GezgkGMPhlF6kz6n
	r1o+BJfKIXblfL3nzdqNo/vZAJwML6+gCeQYtzBrhcRompX9G93ZV+j8/MbMhNlXpW+DNrOCdA8
	fXq138UBLaIJEFN6R85o1xDgTis4sF2CsbV1/fNiNs8cH1hup2BbQjRRb0KlG1q2oM5ZHpshSbA
	LWI/oM96tZYFKu3bzufxFgD3jXt36ApF5ENS7ooSNU+M6Z7W2w/kwitN+GJEWMXtHiaalZezO6n
	9IE96MXMHdG7xIpksGD3jwRe+k88qcT/q4wjmexqJnFdcuhEfu8cC2GZtu9Y8m8j3gR+y3Wl5rX
	hcWVrIkrWDW4VJSxL2zMoK+/9NuaO0aQ==
X-Received: by 2002:a05:693c:26cc:b0:36a:3005:aa65 with SMTP id
 5a478bee46e88-36f7611ec47mr2929151eec.15.1793973682246; Fri, 06 Nov 2026
 06:01:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-4-clamor95@gmail.com>
 <au3UDDpLUmeIOwEH@orome>
In-Reply-To: <au3UDDpLUmeIOwEH@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:01:10 +0200
X-Gm-Features: AclHuK-xODZ4BK6vgyhpVlnU3a_5DM9XqVLo8nBuS_cQ27Qs1NsbBJmpnu-OR1w
Message-ID: <CAPVz0n04Cuz8d+8m07oMVBpLGwcfVyMDu=uv=_U2zjoFVpfULQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] drm/panel: Convert LG LH400WV3-SD04 to use MIPI
 DBI bus
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:23=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:03PM +0200, Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 103 ++++++++++------------
> >  1 file changed, 46 insertions(+), 57 deletions(-)
>
> Same comments as for the previous patch.
>
> > diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/dr=
m/panel/panel-lg-lh400wv3.c
> [...]
> > -#define panel_dbi_command(priv, cmd, seq...) \
> > +#define panel_dbi_command(dbidev, cmd, seq...) \
>
> This probably also applied to the previous patch, but there seems to be
> no reason for this change and the related changes below.
>
> >  ({ \
> >       const u8 d[] =3D { seq }; \
> > -     struct drm_panel *panel =3D &(priv)->panel; \
> > -     struct device *dev =3D panel->dev; \
> > +     struct device *dev =3D &(dbidev)->dev; \
> >       int ret; \
> > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SI=
ZE(d)); \
> >       if (ret) \
> >               dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> >       ret; \
> [...]
> > @@ -177,14 +166,13 @@ static int lg_lh400wv3_get_modes(struct drm_panel=
 *panel,
> >  static const struct drm_panel_funcs lg_lh400wv3_panel_funcs =3D {
> >       .prepare =3D lg_lh400wv3_prepare,
> >       .enable =3D lg_lh400wv3_enable,
> > -     .disable =3D lg_lh400wv3_disable,
> >       .unprepare =3D lg_lh400wv3_unprepare,
> >       .get_modes =3D lg_lh400wv3_get_modes,
> >  };
>
> It's not obvious, and also not documented, why .disable is removed.
>

Noted

> Thierry
