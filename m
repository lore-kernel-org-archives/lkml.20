Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF9415F2E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145914; cv=none; b=gyvS8BFErx2LwqxzIvOyqFwu2GH1aWGoIPw8fSpIWDO7JtsFzJ8LPv2uHalwYCZCu0zKUelTxSEMnnGDRBjXdWfQcryKg1sTzM352JdbNsLZKHdKhd5js/xxCqVYGBiyyddsF8grNntXNe34febWK+9IG4i3rF4gVugzkSTWrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145914; c=relaxed/simple;
	bh=mfwKAVk2tgsaRf3EcqdDECyLiqTSD7GjUlH9PDB78fo=;
	h=Subject:References:Content-Type:Date:To:Cc:In-Reply-To:Message-Id:
	 From:Mime-Version; b=care7Tja9IL/PFYPghIlLEkZdOuUulME/5uu7Hm/TSYVfYc9xPUboxhWpKoMQ36vNPZVHcaqJR1pbLrCzwKXj+a/Jh2IrvsNnkVomkY5Mq7G5jRPgdR43GsLzehUvaUFtR58jB+BOSy831woVCiVkrOHuBIDLfNXvve9zsvsbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=GgujK1/I; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="GgujK1/I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790145899;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mfwKAVk2tgsaRf3EcqdDECyLiqTSD7GjUlH9PDB78fo=;
 b=GgujK1/IVLZBna5OOZMywCOZSsTVGew5L3F0W0/VkM1dFlzQrUtvjeLJGjXOATZNyvkUif
 eZD/qI9qvc4uAdAB85c1AtLWUFZEwdmdooxoY+8k3YcOcnQ27Zy5I+fcPS4gCJ8EHChJno
 njC9rtkl3RE+RJFW4gzt4gky6AwFUkkqdKeUZgKg47N1hj+BRN0h1ualRvg/4gFu/UeR/r
 rvJ2g97qU7tpe9Uk6KretbVvG3S4Jr+H0F2iADLEM4iXRm6x84h8pcIGY1pNnP3FJL7XPe
 2r7pEhu7PGKDvWb8LxOOf5+klOYf+rO3ZokDUqoNZXPmsNxnhZ2SZCgfAd4k7Q==
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
X-Lms-Return-Path: <lba+16ab37569+38461e+vger.kernel.org+sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110434.3426051-1-sandie.cao@deepcomputing.io> <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
	<DLMHKHTDP2W9.3GX33KSJ2YIJM@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 14:44:56 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
In-Reply-To: <DLMHKHTDP2W9.3GX33KSJ2YIJM@linux.spacemit.com>
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.87aa009f.6c8d.46bc.aa71.f3065515c380@feishu.cn>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

Hi, Troy:

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Wed, Sep 23, 2026, 14:36
> On Wed, Sep 23, 2026 at 12:07:20PM +0800, Sandie Cao wrote:
> > Please note: usb3d_u2phy also use CLK_APMU_USB2_BUS.
>=C2=A0
> Could you share which tree and commit this snippet comes from? I checked
> k3.dtsi at the base-commit listed in your cover letter,
> 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998 [1], and usb3d_u2phy has:
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTD_=
BUS>;
>=C2=A0
> Are we looking at different versions?

I'm sorry, I check the wrong version of v7.2.=C2=A0 I will correct it in ne=
xt patch.

Best regards
Sandie

>=C2=A0
> Link: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux=
-next/+/3f2425f5b5bbbdd991ca9cdfd5502e68d8895998/arch/riscv/boot/dts/spacem=
it/k3.dtsi [1]
>=C2=A0
> --=C2=A0
> Troy Mitchell
>=C2=A0
