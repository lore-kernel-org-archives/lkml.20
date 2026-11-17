Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881891;
	b=JTPI0xyhcla59R9/HK+1kdjPu7kn0/FOzAD7CYnrh1ACtCiRyf3FPz55jPDTJ0yzfc0P
	 gNFZUNo+uSmkrF5YD6oY6qGIemx3QNgU+u5dqB8Dvd3rI+MOcG6WT1Yyp7nODUHcZKmvl
	 PpkTArM5qXeQ0yHiKLQnuuU8eV92kcGnxGMTasR1jwJHgfa4p7XmAGoEQ8KysQXrTPPe7
	 5KEl5We2Tbkb+9V2l/Bb/Ksg2S8BPQj+LYiwzWQi7nm3MCoonadA5U5GnAFs/zAhjjCrA
	 CTUpUBj6SGctBNtKyiYFlA6J2t32XwOQf9ckgyNiii7og3VtYw60MOgpulx+jvuv1ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881891;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AimkYquJyCFFibwV9+Pbk3SJdPbv5xwkRGDYXWIlb9k=;
	b=JYLPUA8nBhAX/i1WxorhjcndbtBqBMcN+s8BJaZkeI7GF8VCPRl7TsFSSXeWV3Qbt9MI
	 aYAa0tAkO9sPmgAlF06VnfS9668p31/Eb7ebCiPEzbJpJAlBBg5M0CHFvMafTk1eksorl
	 VauQjxReGa+2wUEO54VF60rOJxNoobCU0HypTq+LQRYnhhqQR94bE6QxNHt+s3qF48vGf
	 lw9OM3GFJVifTeXzkJ/bZ4+IOpCI3eq2/umu6mg7FPRhZ9B50ecyEoCusN3+1Ti4bCy2x
	 xc+wPGAlNfMh+shnM97Ymhkd8C8oBtFVVakiOp4olU7lJeFWYqboZzDmiiyhKIW5GiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXEWjSb5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD833606A333;
	Tue, 17 Nov 2026 02:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXEWjSb5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B041F000C9;
	Tue, 17 Nov 2026 02:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881891;
	bh=AimkYquJyCFFibwV9+Pbk3SJdPbv5xwkRGDYXWIlb9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CXEWjSb5ZnnpV+YPkcW++70u9Mes4qmDIt/YFUFz/eEfP/rmi47SDFz1ibbhq+jPo
	 OnylbBBq1afLViHYoODAKVU3vmpC4+mfozzPZywVOKknDwPK5TGQVDL5L78LYNC/I0
	 G2xmhM/Ap+6HC22V5F2L+ee7n1t80kAtXH5PU7WgLFICVqttgyGgW3j8KPeZhHhtUT
	 ltHfvmyr+z8nY0Mo/M/wWJ7eD1zDiPpFiEd6t6e7+vUlMViky+7bHLjpUqQ+icsFrw
	 gwi3kkwIiTgjoezKFOHgSRmA+2rGWK0KjQthpW/5wIq6EV6a2S3b3HKcWWPDfRvKwn
	 EBu735HdLT1aw==
From: Jakub Kicinski <kuba@kernel.org>
To: arouhi@sitime.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	jiri@resnulli.us,
	vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	ivecera@redhat.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v15 04/13] dpll: add basic SiTime SiT9531x support
Date: Mon, 16 Nov 2026 18:18:09 -0800
Message-ID: <20261117021809.2220080-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-5-arouhi@sitime.com>
References: <20261110202607.55744-5-arouhi@sitime.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dpll: add basic SiTime SiT9531x support

This adds an I2C driver for the SiTime SiT9531x DPLL family. Probe takes
the optional reset line and the XO rate, then identifies the variant from
the ID register. The 32-page register space goes through a flat 256-byte
regmap window, and the driver selects pages itself under a private lock.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> new file mode 100644
> index 0000000000000..3ec1ab5aa56cc
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -0,0 +1,308 @@

[ ... ]

> +/*
> + * One 256-register page is visible at a time, selected by offset 0xFF on every
> + * page. The map covers that window, uncached; the accessors select the page.
> + */
> +static const struct regmap_config sit9531x_regmap_config = {
> +	.reg_bits	= 8,
> +	.val_bits	= 8,
> +	.max_register	= SIT9531X_PAGE_SEL,
> +	.cache_type	= REGCACHE_NONE,
> +};
> +
> +/* Caller holds page_lock. */
> +static int sit9531x_page_select(struct sit9531x_dev *sitdev, int page)
> +{
> +	int rc;
> +
> +	if (sitdev->page == page)
> +		return 0;

[Severity: Low]
Could this use regmap's paged range support instead of a private page
cache?

sit9531x_regmap_config has no .ranges and max_register is 0xFF, so regmap
only sees a single window. sit9531x_page_select() skips the selector write
whenever sitdev->page matches. Nothing ever checks that cached value
against the chip, and outside of resume it is only reset when a regmap
access fails.

Something outside these accessors may change register 0xFF, for example an
I2C tool or a regmap debugfs write. If that happens, sitdev->page goes
stale. The next sit9531x_read_u8(), sit9531x_write_u8() or
sit9531x_update_pll_u8() for the cached page then skips the select. It
reads or writes the same offset on whatever page the chip is actually on.

Later in the series, "dpll: sit9531x: add support to get and set priority
on input pins" treats a priority table rewritten "by a profile reload or
an I2C tool" as a supported case. An I2C tool has to write 0xFF to reach
that table. A regmap debugfs registers dump would also only show the page
that happens to be selected.

regmap's struct regmap_range_cfg supports a selector inside the window,
here selector_reg = 0xFF, window_start = 0 and window_len = 0x100. With
REGCACHE_NONE it reads the selector back before switching. It also keeps
the select and the access together under the regmap lock.

The sibling zl3073x driver already does this:

drivers/dpll/zl3073x/core.c:
static const struct regmap_range_cfg zl3073x_regmap_range = {
	.range_min	= ZL_RANGE_OFFSET,
	...
	.selector_reg	= ZL_PAGE_SEL,
	...
	.window_start	= 0,
	.window_len	= ZL_PAGE_SIZE,
};

The commit message describes the flat-window design but doesn't say why
the regmap mechanism wasn't used. Is there a reason for that?

[ ... ]

> +	/*
> +	 * Keep reset deasserted, never pulse it: a reset discards the
> +	 * configuration from efuse or a pre-probe NVM blob. Release it before
> +	 * the first I2C access.
> +	 */
> +	sitdev->reset_gpio = devm_gpiod_get_optional(sitdev->dev, "reset",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(sitdev->reset_gpio))
> +		return dev_err_probe(sitdev->dev, PTR_ERR(sitdev->reset_gpio),
> +				     "Failed to request reset gpio\n");
> +	if (sitdev->reset_gpio)
> +		fsleep(10000);	/* internal boot after release */
> +
> +	rc = sit9531x_read_variant_id(sitdev, &variant_id);

[Severity: Medium]
Should sit9531x_dev_probe() enable the supplies before it releases reset
and does the first I2C access?

The binding in this series, sitime,sit95316.yaml, documents vdd-supply,
vddin-supply, vdds-supply and the vddoN-supply rails. Nothing under
drivers/dpll/sit9531x/ gets or enables a regulator, either in this patch
or by the end of the series.

The binding commit says:

  "The driver does not enable them, since the boards so far power the part
  permanently; describing them gives a board with switchable rails a way
  to say so."

A board that describes switchable rails per the binding gets no consumer
for them. If the rail is off at probe, the chip comes out of reset
unpowered and the variant ID read fails.

If the bootloader left the rail on, regulator_late_cleanup() in
drivers/regulator/core.c finds use_count == 0 on a regulator that is not
always-on. On DT systems, where have_full_constraints() is true, it then
disables the rail late in boot:

	if (rdev->use_count)
		goto unlock;
	...
	if (have_full_constraints()) {
		rdev_info(rdev, "disabling\n");
		ret = _regulator_do_disable(rdev);

Wouldn't the chip then lose power while the driver is still bound? That
would drop the pre-probe NVM configuration the commit message says is
kept. It would also leave sitdev->page out of sync with the chip. Later
register accesses would then fail, or reach a part that has rebooted from
efuse.
