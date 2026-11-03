Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696537;
	b=TfiGWJJob/S14QT1W7pHcn7ksEFA9ex+z+kph75ljYFFKCho5lwMoTVUhdy+gBn+wu0m
	 Z4efe+39ZOvM01Ch9csxxMUB26bEoIAWQeRpeu+Rl5+nnTFqRGzji6BCbx1iYtwYJdAYN
	 N8/3HVAk9gC4jdzk9Lbj7FbsGckTv4IS3IIEmiDUxZoWaf/UbCWNmh8+TBKjwGaevlhp8
	 KNY68Y+F6Yi4NNnYj4dA1DN66gsEM2VRgL58tS1gBRoRx+uxgUtiH8zGEA+7CxOm3cwXc
	 cMJWurZ9Qw3QdAjgmArcgGgzhHsvxmQP2mfpb1mMEw7iSwlL+vn3BHaFwV+CUPS41FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
	b=R/h/vxoVqrhWHkxVsu17JeQLlt8aZtDqmzqdr60oR81btSmXTc1TNCv6RfgRC0mlig7p
	 ZBseuRHreEYoZzkPNgV/5YYi+XQQu4NOtnUOdN1PypZM+JgNUZNzwuNz5oK9Nwitm4JJu
	 w5kR94Ck1Z9jceHO7FHKZJookB86CAp3p4Qq9lHOvzb0Uf0vy7kON3KrksL2wvDKA0jYA
	 sMZLg2C6KVHyzZnhYfeOS+ZJNAIrREYgGpJZKgXlJA/kqWeSdzcT4zSXhez0qmKvQNXR0
	 nOpQ389Ty+T3+7Yt37UNUy/0i012VYEzOhL4o/tF8fW1Udpviu7ot/mp4Ebk2fxf6tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciwGRpx2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD50606D823
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD50606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciwGRpx2
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so8124396eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696537; cv=none;
        d=google.com; s=arc-20260327;
        b=NGf9ZI2W/fF9OH9fFdOBDuz/YhYkpGTUNh+O8GGNVmUW5USDykZ/LMx0oGr5XIFy4r
         bk1ubC65AIALwIxIqT0SmKStLArZGZ4IjGRoJ4VULD6QlcxrRKuRXSoU/N7uGE7YCYHU
         5K58XDIvGF6VUteS/UPNET8S0Dnc4VGX1rCf9vLeMPh0MZfVoJJ1aaFSMfkmlM5U3yPw
         cD5YQdfUoUeRWb5ympH+gtIczha6kZ40JupVbNsn7j0N+rzw1Xo5mxIKUrlnjFTDInsh
         KLWTfDXa14CQBdjKZeCGksmvSF6/rynXvweCx2akinCf1cIjwNHIX9/p6ZqSnPw/vX9c
         o/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        fh=DtYNuK/aJI/9R01/YvqWzM+ckmdzKFTe4bUdy8T0gZk=;
        b=Z4nrZBM2+VC8Y4LStsZ9wSmLk1aiROQ4Ey8VvuU8hTyDKg22QPiVz0Yoi6X/jyJjXR
         23qYXAyunBYYDYk+VLJAiqWcsgQRYRRp6f/YVN4qRoK94tjpwz5TMTvmXeS1/cOzLl9e
         7FW91KbEN3gvtE3xQ+GzxAZr0ZjZ6YVhJiIvTV3ghZcJfLmC1IEgOropkfQPaFLfM5LK
         lx/nR4b5anUbeYO+67Z7QGRkJ3/JD+8o56dkrLu6UcyQOsomjvwh4E4aO56jN3adNBCt
         OIkmoBcfp3lExlmn1zI9e3t9YR6JVCWSoqSZOnQi7ssp4JLm9rBHNo5Vt2L7NQZaKdbp
         ec7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696537; x=1794301337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        b=ciwGRpx2kcHNTz6ttmKCjLHvNvU4D+NrO24Iekv6nFHROsIHfJzjgzeFIvIop+cH9z
         rh0kL61fy6v4C5HPDGZYpdm8ehoxlvThnx4p2vZ5+6ij5RGxiAjHB8DiIc/iTexMqrpO
         u40ArrwZ8pGC1cU76kRdkxR+kJRe/HPVr0hbiWPjgf8ezUFsCYQTg2och8VmNHf5FcfY
         lwlVmvuFAR/1QyUGQjaQ4QIxCWXr0QUP7LMh0metD8NUvwKVGbk/5E5BzgLZcMkUGkkM
         ppJjttWc+JAv3zrtDfAaqElUmNrVKNW+l5+3Pc0he6clMhV6o15x35JflnwCHcfVwGA8
         Na+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696537; x=1794301337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        b=zdrYzQD7eEUwGl65rRo1SZz0DcuTaCz7J7p0aGS67sUbfzUvFBhjAwQLtdqb2dzCBM
         9mtmvpTTaKMWUBgBaYbIOMclQLhG1QJo0LkVL/vJ7zVQdz5C8A2Cjof5h5gvOA9xA6uo
         wMuOkXvmqbrSBcmnt6VSyOZoPU2lm23BpUF9ySdTlANS7tZ436D6TyaeCsMN7PrWj3Mb
         r8t1gVA6TnPEEl/FBOLbVYV+AmSuMQeIPnPcvUGAObYiqrwv8frvj3RVe5woGaj9r7Sn
         yaeBvw76/jndw+GgwdC/PpakUDEgo+S6YTL18O0ZTPss6eTvzyvtLmoPTOqJkJvUykEy
         LLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBymeEcpx45sDDRS+pIbS99MvxkI4rPNQ5gJLqI82dAySoR5XXJkp1eqQbCGP882aXQKhwLowtmI2Fa8Pj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nS86eKErU9Ir3R6OMifdiriXPmFq9rN++OBEJ/irXHSxM207M
	uhFXJozFeXGyKHwY7WQH7Bx+oLyybozl1Vw3hx2NBoSMxOBCDYFhy8Kpb8r/KgvTMA2RsEuYXf6
	R9JInkq1yEzkDb4EHplxrE/iXHYB123c=
X-Gm-Gg: AYBFou3aE6dqvUfxa0GiK/Y8PAZ5bxbKielJWlqt/BTOOJH7jgXJkzUlLvnTyjMmpqQ
	tc4IOvN508f970zor/VLGhyIEjtFhSJpxlP+3bFNxbGsIXw0Oh88OVB/b6m7F9oQqUZIgPmM3dW
	lqNdw9oNvSeDEicRIJwspol9hPWdTS2EYacwvlNtHRdVm6tU0SS8+N1kzfGrq2WQsUkECgeZW7Q
	Mck9cXqjqw+wr0cJbCdSxQDO57wPgfxAqcK7ldv2Mcyl2HqJ0xoSG6TYeMiDF1DgfcMY9oazydG
	KTsmXZa9CHA61rMmPwYBYWDq26YVt9t6rgZz7Oh8hePuw7Rp8UZOYDLZJyNqGC0tErcAq2SSfQ9
	nNhh5LrOMeR8tu4b0Vl6vlikiN+/mmKj0yzCaWUY4T+k0i3rqJgAz7zcv4CdPbdzyxutuSw==
X-Received: by 2002:a05:7301:1a05:b0:36a:11e7:a11a with SMTP id
 5a478bee46e88-36a4236241cmr19980626eec.12.1793696536533; Tue, 03 Nov 2026
 01:02:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <179362684510.3310106.12424997423646231725.b4-ty@b4>
 <HUi_TWCnQA2WP19xCg9CEw@nvidia.com>
In-Reply-To: <HUi_TWCnQA2WP19xCg9CEw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 11:02:04 +0200
X-Gm-Features: AclHuK9kP2YZS9qM8orBh3iwFzVk5JoYyyundAYGnDH-DFMvjVyJq8oHL57nrh0
Message-ID: <CAPVz0n0fpR553WL7bRYKFcHgGrc2pauMsKs1PTnuZVpN8UM5oQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/7] drm/tegra: Add support for
 Tegra20/Tegra30 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:45=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, November 2, 2026 10:40=E2=80=AFPM Neil Armstrong wrote:
> > Hi,
> >
> > On Thu, 22 Oct 2026 16:22:52 +0300, Svyatoslav Ryhel wrote:
> > > The display controller in Tegra20/30 SoCs features an 8-bit SPI inter=
face
> > > that closely resembles the MIPI DBI Type B protocol and is referred t=
o as
> > > '8-bit CPU'.
> > >
> > > Add DC parametrization options needed for fine tuning by bridges.
> > > Add 8-bit CPU interface in form of a bridge linking to RGB port.
> > > Add 2 DBI Type B panels used in LG Optimus 2X which work with
> > > the 8-bit CPU interface.
> > >
> > > [...]
> >
> > Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (=
drm-misc-next)
> >
> > [1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and L=
G LH400WV3 panels
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46011a636=
fd729c99781533e265297748b5a0b0f
> > [2/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9fe804e2a=
3001fd024c0809678d09c5e0ed359ee
> > [3/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d87ca1bec=
bb095b6204cf657508c91e5e995d9b5
> >
> > --
> > Neil
> >
> >
>
> Unfortunately these panel drivers are not functional -- they rely on a
> contract with tegra-dc that we've changed in v5 of the series.
>
> Mikko
>

Panels are functional, but they require specific configuration
described by Mikko. This is not an issue. Since We are working on mipi
dbi bus for Type A and B devices I will just add commits converting
these panels to mipi dbi panel driver. They will be as an example how
to make/convert dbi type a/b panel drivers.
