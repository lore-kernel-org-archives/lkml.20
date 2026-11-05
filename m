Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842400;
	b=sFjbEQ3AV6nWwEPx6svsPD3RRI+jDuOH9Hqdorm/lblX2cgcvpXQwgKKH7IyhCFlACHc
	 MVz6reL/x6o9xTi9/vwC9w8RBbnmC4a0Zh2js/0V1SMe9e3ny+49Cg38gncVlfQk0bY8t
	 UaIE3TKWAfSMOran1KCXdUj4CL09vXvsn50qP9UUJAtU+ZpAB4B2zlyVlhK16pxY2QWPq
	 cUPeIdp+wPbfFEvgJvvh5EqyELv/HzTOG4FySUgzhDXj3k58b56r+zd/Fx7yAgj/A1Cr3
	 0jAI/cwdsv0l34j7AI7vO6ICxd+vR+zzyok3KNOZMMd5R+gExkubarc//1pKMeut1lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842400;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:X-Lms-Return-Path:
	 Content-Type:Content-Transfer-Encoding:Message-Id:Cc:Subject:
	 References:Date:To:From:Mime-Version;
	bh=/d8AjzMR8Kwx0Lf9prj+CTkH5Cp2jbRHWYUWf3O5Nro=;
	b=PxrdLhLdbQtFpgJycukFYGgQFxgR2Xd5OxYkPN2CEr8+vCM7iv3xYFmzH4WiESNZR/Fv
	 3F6HzQDvxr2h0ZliEx0E3Lzg0y+SJrMl2Fu0yC0DyIfpgjRAHuegOiEi5jjcXykvE1y7L
	 +GUNHHT72YKht7nDkx+enj9TW0ZL9kSJA3UdQD4zl5bZ1ryKyaVHW8ioqZtn20Xm4M7+y
	 laN7/C8b4/aN3WrTQZpeRFT04V7i8nvNOR/0EFOMuYaNLjcEcj4W77eCrgVuyTn47Jel8
	 glkYe47Kn2DKxbyVZbso+rfMGHGElTNjA++rbotuPkyHbW+m9uENVI4hgND11jKhmaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b="NW6/6Jnh";
	arc=none smtp.remote-ip=209.127.231.29
Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E40E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E40E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NW6/6Jnh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793842388;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=/d8AjzMR8Kwx0Lf9prj+CTkH5Cp2jbRHWYUWf3O5Nro=;
 b=NW6/6JnhJJ7Wt9dub9t9fuM1m8qckHGHDpKh3GXjqjz0Vr+TdtP1ra00SWhU3x8wRj7PW2
 9pXuWHG/Kr194TjEzZ9CmRZavFFjUK1PV+c6B2bBc2o0gxW7wpuVqEH8gy3cGgRrljADYB
 oov5K/UdoXQpTHYN6NJHGuZYWPA2OjY1tOVf5QLVhkJer8CWfu57Znyof5woiFWcHkEuks
 pl+xOIIIPyjEVQnRcTTIEmICcoAx7A8EUyp6SOwibG0XwGE2V7YkZnj469DhudYX/eqMo7
 g3fKh6lmbN5DC9khyprdt9uJyxHWhW8zV9M18bCuXqRZziUtObI9nJrQYhhzug==
In-Reply-To: <DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
X-Lms-Return-Path: <lba+16aebdcd2+5d3c37+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.569e40bc.e0a4.4c5f.856e.9977de981adb@feishu.cn>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io> <20261102060155.100679-1-sandie.cao@deepcomputing.io>
	<DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
Date: Thu, 05 Nov 2026 09:33:05 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Hi, Troy:

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Thu, Nov 5, 2026, 09:20
> On Mon Nov 2, 2026 at 6:01 AM GMT, Sandie Cao wrote:
> > Add the device tree node SDHCI-0 controller for onboard Micro SD card s=
lot.
> >
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > ---
> > =C2=A0.../spacemit/k3-deepcomputing-fml13v05.dts =C2=A0 =C2=A0| 22 ++++=
+++++++++++++++
> > =C2=A01 file changed, 22 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts=
 b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > index 84f66dd8f962..4471338a9774 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > @@ -184,6 +184,28 @@ &combophy {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > =C2=A0};
> > =C2=A0
> > +/*
> > + * Onboard SD card slot:
> > + * Plugin/Plugout the SD card before power-on the board for secure.
> How about: "Please insert or remove the SD card while the device is power=
ed off."

Ok. I will fix in next version.

Best Regards
Sandie

> > + * It works as a boot media. so set it to non-removable.
> > + */
> > +&sdhci0 {
> [...]
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0non-removable;
> [...]
> > +};
> > +
> > =C2=A0&uart0 {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default";
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&uart0_0_cfg>;
>=C2=A0
>=C2=A0
> --=C2=A0
> Troy Mitchell
>=C2=A0
