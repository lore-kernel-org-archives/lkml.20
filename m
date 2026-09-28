Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540054973A0;
	Mon, 28 Sep 2026 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590785; cv=none; b=motZDXhj3i9/xKWCAzAQ6Dd2Z24gedT7ZMlZCQZGK/nXYpkbyedbqETlWYj6Oly9ZIBFO/ITQA0DGAAN8DxjVAWzWsx2qyvBQDpw291x3ix8yV4xlTk5AWzyJwmmrroMdoAm0hGyxIwsnqgRoI3VKqXm2t+MiWC4+SAURG7fNRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590785; c=relaxed/simple;
	bh=f19vgGdFA2rOi2DwFxP88/eKF/POZe5MQTAmSiw3rsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+wn/6U7iQ+iPE4A6vWfgU28TrMtTEIGFW+JrRS1o3MyXVYKjXT4tJpZw7YUxZjIISMgFx9xee517KPgcpI2QyT9KznwkdWjGGrzheMfPsc2YDH53uJjhZhQBf9TTI2EKulqFMIPhExdvw2Zi2zqTvgXAJHl0Y9OcxsyV7UhzHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmzbuiIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmzbuiIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0761F000FF;
	Mon, 28 Sep 2026 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790590783;
	bh=R5IjW6p0JCzbjjEnLYLbF1zbG5e9XSjD77RNp9djL0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EmzbuiIMbMvlKO6UavAjUCKsiQCf7Xv2dxoJ5U5RH2apfbGZaWISMQGhxCa+xl+h6
	 YY9s05cRjhrJLrj0MgMtI5jyfD1Mrbznfnml9aFELeNK33POLpDgu1QAddbthTupRH
	 P9fRCxk6kcpvHTgntbRf89hGH6PdU2J8b/7SLU4hdBI1rrWRDV4ets+8g47R3sn7jq
	 Lj0IHD7Dpe47dxy3Xymral+r3tzKoyZ8ZBl8y/FmKBN7KJpB0OIdffEs1ZWKJFqmhY
	 wKoy+7nPYHW578mufNYtCQXP4DsyAXsTEPbtl39REzdxyxW6ViXwUtcC6ZMifhZNCq
	 VWEbEupCbPhbQ==
Date: Mon, 28 Sep 2026 12:19:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Message-ID: <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>

On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
> On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
> <mohd.anwar@oss.qualcomm.com> wrote:
> >
> > This series adds support for the Ethernet SerDes found on the Qualcomm
> > Nord SoC.
> >
> > Nord uses a QMP v7 SerDes block, which is an updated version of the
> > SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
> > currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used by
> > SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerDes
> > to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
> >
> > The series can be broadly divided into three parts:
> >
> >   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
> >   2. Prepare the driver for PHY modes which require different SerDes
> >      programming and readiness checks. Existing SA8775P behaviour is
> >      unchanged.
> >   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
> >      sequence and readiness checks required for USXGMII and 10GBASE-R.
> >
> > The changes have been tested on the Nord Ride SX platform, which has a
> > MV-Q6223 switch, running in fixed link USXGMII 10G mode.
> >
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > ---
> > Mohd Ayaan Anwar (3):
> >       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compatib=
le
> >       phy: qcom: sgmii-eth: prepare for additional PHY modes
> >       phy: qcom: sgmii-eth: add Nord USXGMII support
> >
> >  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
> >  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
> >  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
> >  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 +++++++++++++=
+++++---
> >  5 files changed, 219 insertions(+), 24 deletions(-)
> > ---
> > base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> > change-id: 20260923-nord_ethernet_serdes-c486f715f383
> >
> > Best regards,
> > --
> > Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >
>=20
> Good Job=EF=BC=8C
>=20
> Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

This has to stop.

Why again adding fake testing to the bindings? You cannot reply twice?

These two weeks it's some plague of such tags...

Best regards,
Krzysztof

