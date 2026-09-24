Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484D043A7F8;
	Thu, 24 Sep 2026 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280558; cv=none; b=GFnt2+hvOQ4Vcmqw2nMxAeRrkJAlwa4SWAYgXsMpkeAQH8KJCoUIQ79sUsNFKN5fCvEx1O3NLDIP/R28iN9cSDuVQkvqdkwAqkZPDhAsYwpXVAKYm2q6xeOHG3Ly7WcJQecBDMMwtpU78/3BzNY8/4s030u702ObOJ92rytKrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280558; c=relaxed/simple;
	bh=/cIgyXCDISxrmfs8S9l2BvpPVeC/zBqj8O/YjhZVBh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hfb0+0sFg4RdHM1tSGMUzOV8U2hFjKuXyCq/vQyg6IIqDagpxv0Uhly32cG7aeasY1DKoDb2KCBhdGspcHbFZYVQaQfxUQ9BYLxQAkQ0AuAZcA+1a5fc6AMNTjGEw8/7ckwmWfjl7+TKYLvchqs3DKAXoGZf8oVph2cgRM2/UDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6dsdxBM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6dsdxBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7521F000FF;
	Thu, 24 Sep 2026 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280550;
	bh=nh+8dKN55u4IeKtWn+XN0JFvbomxrPoy2GrpO2g5A2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X6dsdxBMD9iS+7QcBmIgEEL8VAjRzz4iiucA5ASH+/+AJq2o5BWE/JBzgevkkaJZr
	 gzwc04Jo+ixD/0bxfWPjnhIREf9T8UrfkekJououHHvTP6sVlS/f/siCZkV09fdGQ5
	 u90Gc6aZ2t3UrjlEZskpYqvTsUd4WxJ4Uw5GNd4n+pLiMs7IdyFWmZBK7kQ6T3ftN0
	 W8LT5t/R63v6e6mONkGSss+MiNwDM4nTXIigwH6GOCVS/8Q8//s44YS63uiBRVEcKC
	 TrdRaNWI3wzzd47FoecnYuC3GF1X76XJsHHxuAVrs7iYU+Mo8W6WtDBvGofY5opR2D
	 NltM/c1sKRLEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] mtd: rawnand: qcom: make config_nand_cw_write()
 more generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Gabor
 Juhos" <j4g8y7@gmail.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Md Sadre
 Alam" <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-4-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-4-f3012199b161@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:09:09 +0000
Message-Id: <20260924200910.6B7521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: code and commit message mismatch for config_nand_cw_write p=
refix
--

commit 0e6310636afbfd85ec148281a9348c826d2b016a
Author: Gabor Juhos <j4g8y7@gmail.com>

mtd: rawnand: qcom: make config_nand_cw_write() more generic
   =20
This commit changes the declaration of config_nand_cw_write() to receive
a qcom_nand_controller pointer directly instead of a nand_chip pointer,
and renames the function.

> In order to make the function more generic, change the declaration
> to get a 'qcom_nandc_controller' pointer directly, and update the
> callers accordingly. While at it, also change the function name to
> use a 'qpic_nandc' prefix.
>
> No functional changes intended. This is in preparation of moving
> the function into the 'qpic_common' code to allow reusing it from
> the 'spi-qpic-snand' driver.

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 1f3c00823309f..99fbf54580836 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
[ ... ]
> @@ -378,10 +378,8 @@ static void qcom_nandc_config_page_write(struct qcom=
_nand_controller *nandc)
>   * Helper to prepare DMA descriptors for configuring registers
>   * before writing each codeword in NAND page.
>   */
> -static void config_nand_cw_write(struct nand_chip *chip)
> +static void qcom_nandc_config_cw_write(struct qcom_nand_controller *nand=
c)

[Severity: Medium]
The commit message states the function is being renamed to use a
'qpic_nandc' prefix, but here it is renamed to use a 'qcom_nandc_'
prefix instead.

Could the commit message be updated to match the actual code change, or
should the code be using the qpic prefix since the preparation is for
moving it into qpic_common?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom_nandc=
-share-more-code-v1-0-f3012199b161@gmail.com?part=3D4
