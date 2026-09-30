Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835FF497B89
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764965; cv=pass; b=mi8PxLGne/9hzmt1vfAkdV7aOBd3nUaA14ZEri4rSl7zq+peYID6vfUzgtCwiWHCwgkBgV/GQWrd2KlCmm2RjtiW8rSfUPtI9P1IuI3B//HqGfQue/wTRhosj4ysIBsGrVq+uHKvVoBDH1zofz5iC3lzl2Z7GIfUEYjA9aAcrw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764965; c=relaxed/simple;
	bh=bsFH+GvDY/LoJjlhGOF78xHnoRniyt3cIA6gB0xNWXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHuYotXCWOtf5m1agHaohYtFH4YWpbLShYFNCeuTdlaXLyZOM9HTI51ObzW54rOVKu+BlVKffK/h+WruCtLGKdNyZDAeois96rISKvb1PlxKatG7D6e6Sz17YLKTRtZsJcPKjptwfoyl05TCUBj7fcV4B1bT9c6b4RFikRCfzHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qn2LkyI0; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn2LkyI0"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso6129445eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790764950; cv=none;
        d=google.com; s=arc-20260327;
        b=S6lXrYvmopZl1NKXI7pXsQBfjrO8LXTm9wG/EbPJMKKQ2n/wmQHxGbpkToLtSGC6bL
         I5Auu5efqOS8N0fjSagICiWyisGjM7UX/a0ALf+AyuI1g+/aSf9eKSCfXFC0w1W6Wp1n
         SA36AbwUnAUz/XAvaAiMtb0FE8QYb+vfKf1ORWXZfPJ9xk531Fy0sUQOpu4mapoSfezB
         buvtCXe4xto18sWRvOBYr/cQsuyM0pHp65rf2VTtqQ8AGe/ob+WkdnsfhbFlIH8c+U3q
         euZaumqLBZL+zRumfhMDiiRIbEN7ca9oZ4XJoV4/cUACPCXXFghpQcFPrvARgSTkYmdQ
         LGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        fh=XHn1FF1QppwHx9V6lxMuUPuu3YZrTuEPsoLXpY58jsU=;
        b=H6gm1TJrUpytKpqS0XqPsPDgk2usiYfMWYiMfMHn7i2utd/QH3/DjIQHehkJRAKAXy
         tyryNvzYA2WN8OMoIG77PEsUtjrUij9cfCYqY43H6RRKk+jO4r0nKm/weESSVeKzd+/n
         e58jCfU7rQGIeopDGVvtScSDy4wDqCRHVAQ36N76yYlgJiK52TyHhjbz11pY1nRcvRKh
         KR5X9QLdmEZb2n6xbFCAJCvqBm8k5+zyPocUxaBctOvpEIA8+F5XkrORi7ifPZUjBVjl
         Y3YuntkPOQJkdoszo7QV68jRxnKm5H2uGR54tAnd7KDK45ENQ9rp8ap7Fv6Ox115PXRA
         QnSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790764950; x=1791369750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        b=qn2LkyI0JY8rRfHLjXyRjc1mCxzEradOcD0RDojES9QhgN1U3RUQq2WwIr3kTCHB9+
         8/nPeVyl9My9cGxe4faycArWlAqLyhm6ZW2heGhMQ8I7zudVf0KL8p+nrnwgHdCHTleB
         4987k9riDbjdp+p6ig1xZ3WBgqW3/0+2iM0NU3QdEoQmZlYboPLJX2uJt/R0bP24gdt4
         YBrGpyED3wzUQr8eqljxMDM7Loc6lxGLssA1APigUNZxrRF6RyrOMmfINrnViCOVA+IJ
         RDWjaqw0HWzF9OFUzHV/luT1HNRYseSm0yvmKK47B1QIseR0TqvEv1CxXIEtL9juciBP
         3Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764950; x=1791369750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        b=biRhJzzbQOzx/qRlP2myEomvvwylYfvAM/n1Bgy6JTJKgNzKDphWeingc75twoKgZ+
         vVs5jxd2l84T8OUn1Izfo44zNkZc9i1GA8glxIwg+1DIV4w4AtIv0zZMUpm4Nz2HiPax
         NUVj8Pvg9bgXhHFWDzeadCmR1MRBK3aGfvXhjVcyV7D0R+zz+3ykuU6uUPcrdn01PXQh
         TZWnBb+6JEYrYfXIqNS6ANQCMzb9/uF0bzKYeylqSK4pRjAjj7rMfOQFaBIqt/P+3V/A
         AW6Zn20TjklVPo2Ch4hrQFdogJjIukrynz3l11DY/Z6I2bh3QRu8pDnUsEB59UxkkRJ1
         /QpQ==
X-Forwarded-Encrypted: i=1; AKwUvByh1RkT94m39R+u2/X2ZFaN9YkLr1mqVxN3Jx9/9dl8wku0Dj+TLz3esZ+tgqBW5Wqo/HHmSCJbwkhuNPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE+SgnYfnn3W7qkh1Et4y1xZhpnlAG5Mnko8dUiKlX9uUSu1KP
	3NsEwS/kU21kDmcrIX035UN3TMDlaOva4S9K73/Jpc32YeR+x1tbVsiFYJLoVuA7vMGxH1G/IHc
	AhmOeOTUmqV2ROIqkI+YcE+d2CH7U8pY=
X-Gm-Gg: AYBFou36sjx6MDIejY3tGaajR6/wDSk3PWzbE2rmbcUIg9xqkfJ8Dntx5jj3xQUDZYA
	gYand21djnKC3FKGAltqvCZxc9EYAqwa5FLFqt+Gf39oNRngaFlAft9Hf2ZbiwGwEl/KiAYnJei
	gLx1SIJyDd9hA21wrCOByekmGZ/h9iy1jDYQegMatCuwGvA4u4K+Qw1og20cXcGMX5ztC33zk52
	6fMJueZWJ4HeJY+nqxl6hdOMh0YlCiADV7FahHwkUkRAk7yXBEX4a+PLVIUdBfLf3pVnVy1/xQU
	YJmSCghnimOvW/Is/O2AYs1Twf3o8i+N5AWExkslJHZA4qtAA10Nx8SsZMDjdDcTtOpkG/Rhr0/
	ouDFU3Zu5qmSepw==
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id
 5a478bee46e88-34cdd0a96f7mr1217151eec.2.1790764949439; Wed, 30 Sep 2026
 03:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome>
In-Reply-To: <arzlR8mCg9d_z62L@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:42:17 +0300
X-Gm-Features: AclHuK-DuyyAs9z6BpVs9PR86an08DuP-rLMFIX2UP_bIS5QjiwEsXp1jDjGZck
Message-ID: <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:34 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:47 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++=
++++
> > > >  1 file changed, 138 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra-8bit-cpu.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra-8bit-cpu.yaml
> > > > new file mode 100644
> > > > index 0000000000000..f0dab608b2936
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-=
8bit-cpu.yaml
> > > > @@ -0,0 +1,138 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit=
-cpu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description: The display controller in Tegra20/30 SoCs features an
> > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > > > +  protocol and is referred to as '8-bit CPU'. Each display control=
ler
> > > > +  provides two such interfaces, which can be used to send MIPI DCS
> > > > +  commands to initialize and control the panel while image data is
> > > > +  transmitted via 16/18/24-line RGB.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nvidia,tegra-8bit-cpu
> > >
> > > The description says that this is a feature of the display controller=
,
> > > so adding a new binding and compatible string for this is not the rig=
ht
> > > move. This is all covered by the "nvidia,tegra{20,30}-dc" already, ju=
st
> > > need to extend that with whatever is new.
> > >
> >
> > How would you model it? I have tried to model 8bit-cpu as a bridge, sim=
ilar
> > to how DSI bridges are modeled. This reflects interface used to link RG=
B and
> > panel, without inflating existing DC binding. If you have any ideas in =
modelling
> > this, I am open to any suggestions.
>
> My suggestion is to integrate this into the existing "rgb" node, or, if

Not an option since it is not clean RGB and there will be no way to
distinguish RGB from 8bit-CPU.

> that becomes too convoluted, a separate "lcd" node (or "dbi", whatever).

This is fine by me but nesting nodes without compatible feels weird. Oh wel=
l.

dc {
  compatible =3D "...";
  rgb {
    dbi {
      ...
    };
  };
};

>
> Thierry
