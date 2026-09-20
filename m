Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CB1C84A2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898710; cv=none; b=dQYT/BTOBM7YO4GFwMsjDkT0DdUa4XzitthGfPxaA5eA0WKxWNQ0sI60pjgE5RoPk2b5mGEcjxjmuCpYkUpr4Rj4sZSvqad1XkEKfJpmZDeaOODyrE+vVZLl5lMX8YeDyb1HXpQ2KRBU7brx2HtuvUikPlFOtbYj/EVM5gRanxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898710; c=relaxed/simple;
	bh=PVtQgVmSpyfIu95EBVnFKjv5QM6juuMMqQmwaZS/fQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPSDHtd5Tt6KG3w3Btol5QytQNYRSq99vIlYjHILKtlNyDbL762Sx+he7tq0gg/LObCOG6wQxKGBgJPSIj/xM/j74SYZJCfrFl4mrpXIndnln95Aye+lZJrPataEjK7UFZ0XLgCMXp3OX1YIx2bx/s43b+3Ce5sNxFKfiOaB2z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWBIbzhX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWBIbzhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66801F000FF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789898708;
	bh=M7NZhpxBrkp8Vzpt1FhZ1vqtn7lpguc1OW9Ue/8E4VI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=oWBIbzhXtymHbRL5PwQwT5FWNGGs8IXtkiIcpk1knJHMO7/gLmI+30eOv9l6E/7qf
	 TlqXlfjla12uhy9qrykUEChWGrzFpoRUWk8a56MaRpkbWPxEQbG1OLyXY/+RtyA+wv
	 isL/TnU8KzIvhqoVhbzm9IhsX70HHAKZGiuP5MbYzi1sQ2O1IxoKQQ6k81DGKqmU6A
	 GLVVelQMEGqMoPqi5rSIXo/p8xG2XdIxGxPRAiPKd0wmn76j4Ob6iSPHmROvoxrgwH
	 0P82uuTppu5lGfbv/RnphdCmRlAsd4y0516++K96bD52FwCmLaaQuX9RFjqfnOSfl0
	 gVfg6u7FfeDjQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a58fef219fso7963751fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw9poW7tY2pcl7S9yuK+GjgVVwv5SKUPb9Q578v4dbEQV3Qhhw2pGjybgjwPmsNNIHuWXcjKo3TOylrNKw=@vger.kernel.org
X-Gm-Message-State: AFuF++kbS6dEq3weJwa6lotx5ZRmwWbC7BOQb+A3X5/Ro3dFsgFJcNHU
	K1xDf2NTJ4AqAlqfQc5Tgrp1CmqwYb7afnGAV6EsolfdmdnSkcj/DjogtLxMKJ7fQdd3f/ARwU+
	BV1ZRyfxIBeuO1x9PjZbllZ2pI2HwstU=
X-Received: by 2002:a2e:b8c1:0:b0:3a6:d50:e26e with SMTP id
 38308e7fff4ca-3a60d50e441mr6927511fa.2.1789898707044; Sun, 20 Sep 2026
 03:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 20 Sep 2026 18:04:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64zjCan5Up=bxJ_JfCcj2y=2=jNnM8buKQN2ULEA-82cA@mail.gmail.com>
X-Gm-Features: AcwNN1X5_0H5ONYiyVVLAE5WEX7_3CXfPb5UokMjxFhKsOHjiWGm7bWqapkRcO8
Message-ID: <CAGb2v64zjCan5Up=bxJ_JfCcj2y=2=jNnM8buKQN2ULEA-82cA@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
To: Lee Jones <lee@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Andre Przywara <andre.przywara@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
	Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Thu, Sep 10, 2026 at 6:44=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> This patch series adds support for the X-Powers AXP318W PMIC, which is
> used recently on new boards with Allwinner SoCs (the A733).
>
> The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
> interrupts, and power key components.
> A datasheet can be found linked in this Wiki table:
> https://linux-sunxi.org/AXP_PMICs
>
> There was an unclosed topic regarding the handling of LDOs output
> voltage being limited to input voltage being provided by the supply.
> Chen-Yu noted the min_dropout_uV would be a good fit for that but
> the actual minimal dropout value was unknown. I've arbitrarily picked
> 1uV because it is the minimum the framework supports. Realistically a low
> dropout regulator is bound to have some dropout. This choice does the
> trick for now and is certain be less restrictive than what it is in
> reality.
>
> If anyone has problems because the dropout is actually higher
> * it is arguably an HW design error
> * it is a good time to let us know what the actual dropout is
>
> Changes in v8:
> - Fix interrupt optional in the binding (mis-understanding on my end)
>   Resent quickly to avoid wasting time on v7 over this
> - Link to v7: https://patch.msgid.link/20260910-axp318-regulator-v7-0-de7=
20ceb9bac@baylibre.com
>
> Changes in v7:
> - Rebased on v7.3-rc1.
> - Applied Chen-Yu change requests.
>   - More complete register definition all in the MFD change.
>   - Add writeable region holes.
>   - Fix invertion between short and long press IRQ.
>   - Drop confusing comment about DVM.
>   - Use MFD_CELL_NAME() for the regulator device.
> - Link to v6: https://patch.msgid.link/20260812-axp318-regulator-v6-0-d6b=
84b55c000@baylibre.com
>
> Changes in v6:
> - Apply wording suggestions from Chen-Yu
> - Link to v5: https://patch.msgid.link/20260720-axp318-regulator-v5-0-a1a=
fa7ee24f9@baylibre.com
>
> Changes in v5:
> - Fix shutdown register offset
> - Re-order patches to put fixes first
> - Tighten DT regexp around swout
> - Other points raised by Sashiko on v4 are unrelated to the addition
>   of the AXP318 support and pre-exist the series. They are not
>   addressed ATM.
> - Link to v4: https://patch.msgid.link/20260717-axp318-regulator-v4-0-50a=
ff97084dd@baylibre.com
>
> Changes in v4:
> - Capitalize patch 3 title
> - regulator: add support for workmode and poly-phase.
> - i2c: fix probe through i2c sysfs
> - Link to v3: https://patch.msgid.link/20260717-axp318-regulator-v3-0-779=
dc1b97dd4@baylibre.com
>
> Changes in v3:
> - Correct mess up v2 errors regarding ops and ids.
> - Correctly propagate errors when checking axp318 threshold.
> - Fix DT binding regex regarding dcdc max ids
> - Add missing RTCLDO.
> - Remove axp318 PEK MFD cell:
>   As pointed out by sashiko, the driver name did not match anything in th=
e
>   pek driver. While the device does support some handling of the power
>   button, it does not seem to match the existing driver. Register 0x36
>   relates to DLDO3, not the power key, as expected by the misc driver.
>   Leave this out for now.
> - Constify axp313 and axp717 mfd_cells array for consistency.
> - Link to v2: https://patch.msgid.link/20260710-axp318-regulator-v2-0-ee5=
f1c56b49f@baylibre.com
>
> Changes in v2:
> - Dropped _NUM_VOLTAGES macros
> - Use min_dropout_uV to limit LDO voltage to supplies
> - Add bypass mode for EDLO4/5
> - Prevent crossing 1.54V threshold for DCDC6/7/8/9
> - Link to v1: https://lore.kernel.org/r/20251021112013.2710903-1-andre.pr=
zywara@arm.com
>
> ---
> Andre Przywara (3):
>       dt-bindings: mfd: x-powers,axp152: Document AXP318W
>       mfd: axp20x: Add support for AXP318W PMIC
>       regulator: axp20x: add support for the AXP318W
>
> Jerome Brunet (2):
>       mfd: axp20x: Constify axp313 and axp717 cells
>       mfd: axp20x-i2c: Fix i2c instantiation

I think this series is ready to be merged. Mark gave his reviewed-by for
the regulator patch, which IIRC he said acks the patch to go through
another tree.

So please merge the whole series through the mfd tree.


Thanks
ChenYu
