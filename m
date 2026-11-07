Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059849;
	b=tskB2IAU/WnHJP5XuIeInoXJnDY3b1Po5uul2It8Y7D4eJWq1T/mh21GHVNmBkip3jwD
	 DxnkGL91UkhKux9ragTiOC8aI55X4NMVgrIPyBZncLAZJkQUHxGu8afM+zD9l4H/rK0g0
	 FighB9kG6GzKMNsflMFv9hC56PR/j3IhJzqBWV1HknjB/v88nl0JyyFpCu5f5QW6oZYlG
	 h3dirhgXnE3aiM8nK2ANd79Nno188EKCrKQpXTpCAJw+fEyYqnARThqLLoHunTHE4XB29
	 71RSFfsmaA5gUPgTxoOa1mc4eF2Hxq94a5JCHHioL2bYljoBCJbQkOJz3Oyf6avFdZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
	b=WOSfkfXZ2HMX0kPI2Nk3xsaHBLwTpXXr2gG06wF0EBRCSpnj8LSr8MD+a+hldQRXk55g
	 9g6MdS8PakzgF9ZWKEXNbHNxihlnUolDL3sIGh48T+jnztn5pq8cFa8zHJb0bDv52m9Ls
	 KmwlrwfLkRlzuHJsetZPfgYSxG0OdVSohfffR2u3Y+US8EDdC1dj8UTHp2jqXaB1dcAdi
	 wXnpu0agsaZWHCc4hGJTgy4BM/FpRkRI1GYZ0aTJrgK9eb0gWvvmIgtCvJOBJdtTI9Pnf
	 kOpN1c6d6R/7PoAjurBo2LDLKVuK4egPbNsNjjvugkJS0IazpQ7Nlv/7zHKwhOshCRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb9bekSB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF46606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF46606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb9bekSB
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so3129500eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059848; cv=none;
        d=google.com; s=arc-20260327;
        b=jSq0HNaD0lBP2F+suU4WGIuUKdo8T1hhMWNtaR769o6BeM521YL+5QB4w35cVUucbT
         1qX+H1PNKBVDTSmgALtek9XZaNiY6lDYGBtpEeqbCmy2sUb/wuliwT5puXmPHo1Hb8kJ
         5O5wRGkn0EaiGYt08rQCSmBD17aKWqI7MRWnEpm6vt8hgSYRFqF4+f7FB+ZUyjlkysE9
         bsyWcorQEFisOVWmF2DzooYTBfFyO8uh2p+NAfDZuiwWOH4V9Pr2Cf/4vSWnj1TvrlYm
         cE7dPfe+OeG51UjpCoAZUz2h4DLKuEzX+B+IOFexa8aFbKhVBGKvj1IswErUWQwtqe8/
         /Bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        fh=3cB1jS7NHlsFBJIRxQ4CPTiYlknzPV54QY/mjmT0qL0=;
        b=PBXqoEvkhTiTAvk1rltoMEzTe5ybaPRE64zmXogq9GtHZa+btb2J59Z8sPm3MoIllk
         3kdFl6L86C9VMVvDR2dL1x7z3bgOphLAHHRQboZkqLtO3TLMjr51hcQsHLNnfKVzzuQk
         9KRgVMw0jqlZorHrOBkJHmqkQxFD/MXDTz+DVSx3XHSV80SdqAB3i7lfln0W+64Kr04T
         ejriChapHq2G3dYG11ojXlerKjRQ4pVaaOyppEhIhRSkAqyw7/GSD/DxOx7DGL9wbqwj
         MZ4cb4dyq3JezyJ3Fcw+tw53MErXHq6sSG8ygLIxoG9amAzKhCsw/uMaodaIHjRvm15A
         VvfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059848; x=1794664648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        b=pb9bekSBbz+xu2u0EigR2q569gXg9ukKx33kFt4Ckm3Ze/Mke9vrgStZOPNUbfCp//
         8wISeU9KpKnLtk7SRVkReTXDwKntNDrB9EBfDBBy/K9HoUzRM/vQDJmKs6vc4GAdUYZB
         LG5/wAbO7AYvecwG/xABv7okDo7BxsEXCypsQm0H1ooKr0O30BhaNjGm7B7UZVQj+FQ/
         AKWowHbO7VQGLhDk/f5MCkcR9jPutmrzLE/acJalzITiNL1NDSFwCcCKgdKlVN57gl9Y
         1OrSlEYoZp6q1j9fZzt7+8MJIjvYxr0mMPoSiFNp/4VSSZ1C5QCm7l2HvFxz48zAgdtn
         IblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059848; x=1794664648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        b=Gdq3BKUdQoJGFIozNM66xJSAT6dkbMeQrEDaHNOZgRDWrcRL8S2vU5G4E3tqsVCtnE
         Kh8DV03ETHcDk9hbgii2556Tywhi2L0RZ9kKSs2MeI+9fvJD7Z1VFdZHeaI+/RZJNo57
         COjwZ/Z7jEuyDITUV/PfZ+fFBjegjH07QEnaDAzHkoErXgmn5ME4qZ8DGe4D6gO5kunq
         e1azrmjYbR3gbejCi4oYmjwKMgzCgCSIcATJUFC1fUFPy/k6Hes9ddXK27PVOumXhkg9
         m7jZTEqPz82RWsBPgqBvDOvKt7BKsnQr7qYgFzIkEDxl6R/iAGGClvADjuWRVaaTHPE/
         LGEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/240pJJI2Q74GBZLBynumNafMiHwgXvHSHxHXN1q+lcmz4L4HKko98Ul0avWM4w3J/AembbuUAu1FTYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8svo2npPyUe2/sfT5o9cBW7pyyaXT82xko7cIaB8R9dM2edtkH
	9fOY576dPRLWy3UnFckQwTRsJL9ZXHYHXq1WaluSJeumb/oo/I+kGnI59JGg7ekgCISf5iMG24x
	FmjeXy/pG8DD3xA51mAxiXYoH2l2g1vc=
X-Gm-Gg: AYBFou3PxMi4Q736sJW7TigJmkUpM/ooWN98UuvLi2LgeEe4b4c2n2MNZXUlvF0p9Zn
	GE0XUTZWl0nlKFQ5WS5F/EO37hiTOb3sqFjXtPCeDFKyid1iJCxYzRkaH7Uq/9zWc6sRnxnMPDE
	4zuz/jgZ6CSZtTDCbdP/lsdsBJzEkfr6CAcOUbZMaQuoREKPNO7thdVYLbDauJOXS+gt6xMvs3A
	VleVzvkTUFp4t/BkLi+a7HT0+bUvvlgvAnAwS8yf/l7UcZ8cEIiB+FsHqj83ZnX6TJVJdXUvb+e
	sERH1b+MYuEjiUXS0ZTTwyDoEjLuR4ef7aEcldwoYvlhB+oQ7WlLG8InGliBZ9EUGw6iIFyafm7
	nCj28cJyC4qWeIDVtoEgUvWpuEI2bo+6lJweVvbCVb2+UqlnaD44imskS2KwNpsuOkoGKS8UQlH
	ITriBCIuVUkbOfFVLpTzYJ6GuPuxpg3chh13kmjx+u7N241LEGnNY=
X-Received: by 2002:a05:7301:5044:b0:36d:4570:a32d with SMTP id
 5a478bee46e88-36f727d41ecmr8063214eec.2.1794059847565; Sat, 07 Nov 2026
 05:57:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-3-clamor95@gmail.com>
 <au3TcHXFt5Yhs_V8@orome> <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>
 <au3w5Euhy-DyY5qQ@orome>
In-Reply-To: <au3w5Euhy-DyY5qQ@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 15:57:16 +0200
X-Gm-Features: AclHuK-rhOpUYmipYorAqU7OgtCn1M9P26bKqsgHA68BQBZ6wF3WXusKjqauthE
Message-ID: <CAPVz0n3JghP_XxiS22htU_uydhtzrTPKHJsJ4uR2iF12ogsXfw@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:26=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 04:00:45PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
5:19 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:02PM +0200, Svyatoslav Ryhel wrote:
> > > > Switch from a generic platform driver to a dedicated MIPI DBI drive=
r.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++------=
----
> > > >  1 file changed, 78 insertions(+), 89 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/=
drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > index 83c2af1be9755..d5d7ba2096608 100644
> > > > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <video/mipi_display.h>
> > > >
> > > >  #include <drm/drm_mipi_dbi.h>
> > > > +#include <drm/drm_mipi_dbi_bus.h>
> > > >  #include <drm/drm_modes.h>
> > > >  #include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > > > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_t=
x10d07vm0baa_supplies[] =3D {
> > > >
> > > >  struct hitachi_tx10d07vm0baa {
> > > >       struct drm_panel panel;
> > > > -     struct mipi_dbi *dbi;
> > > > +     struct mipi_dbi_device *dbi;
> > >
> > > It's somewhat difficult to exactly see the difference between mipi_db=
i
> > > and mipi_dbi_device. Maybe that should be explained better in the cov=
er
> > > letter of patch 1? Or the documentation added in patch1.
> > >
> >
> > It is already documented in detail in the drm_mipi_dbi.h
>
> That documents what the struct mipi_dbi is. I'm asking about the
> difference between mipi_dbi_device and mipi_dbi and mipi_dbi_dev. It's
> not clear to me why we have both mipi_dbi_device *and* mipi_dbi_dev,
> especially since they're very similarly named. People are going to
> easily confuse where to use which.
>

May anyone among DRM maintainers clarify if this explanation is
required? If yes, please point what and where I should add. Thank you.

> Thierry
