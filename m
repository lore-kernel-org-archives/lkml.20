Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50EB377AB2;
	Thu, 24 Sep 2026 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280582; cv=none; b=GVOqMd3V4TON7MAqAqdWdzOBUkVYGQK+93Pw3PSWocKUn1DngUx/5lfFfWuUQPhZk9WCro3qQKLxl2cJNedWxNL6v0bBN4DSKhjo0c+A0g1v5ZP5ELOtHSsKxjy2FVCle2cZvgLcmahbBGQgcpdfPmekgiawC2WUF/KKa8mMTEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280582; c=relaxed/simple;
	bh=8r77lv41Y+BSsQOSrxCC0qUKAKCkhR10BAen7p3I2eA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dkBZX6XDSmO0KgXZyS4gOgt8zmu/WYkPoEzjsd1ojLWdm5qaEZCghXf0lBTtcWfhcQtzOsk1DU/KS7eKKMK9SC/uRIksXMStvpUA6RixURj0BcfHy0QH5q87mLkTwpTqpV0HjJ34FtpmUQcLDjdSx5Jx3lf+2KPmtp+N7X6Js0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxk3tB9P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxk3tB9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED351F00893;
	Thu, 24 Sep 2026 20:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280571;
	bh=CfT0IA0fjDQQ8vfTtzX8JPsthxmsdMYwTsZjiz8d5m4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxk3tB9PNAaPyWcQdnbt4q6+gO2YTkBKNyo237uh/6O6D/gdVCKL1PEx8eiyPLaP2
	 fHxbP8vJLGhJoxgLkOsrtoibuvkSg7C+uzq96nppHmo/+1s8Vn6rHYQVugUAND5Gfg
	 s9zEsjjgfvt3jHzghwXXjoc8Uv40SePyVeUpYeUR40YHx8T38l+jiOlJ+Wo7W/iCHo
	 l6xwDSDFvZ2jzqCzoNXGU40KOuzNIv+9Bu+05Cceit0juKEFbjx4RgSSyZgdIdLZIn
	 3WsyjnvzLaVjWVEb00bGdiWmUpmInbUa48pd9pF44K+aOqXyuDIV09Wfe9xp6QeZ6y
	 XWpC7W54Uxsvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Gabor
 Juhos" <j4g8y7@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, "Md Sadre Alam" <md.alam@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:09:31 +0000
Message-Id: <20260924200931.6ED351F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: rawnand: qcom: mismatch between commit message and function=
 prefix
--

commit a83607e63ec53429dc425262093eef9dee3bfd4e
Author: Gabor Juhos <j4g8y7@gmail.com>

mtd: rawnand: qcom: make check_flash_errors() more generic

The function gets a qcom_nand_host pointer as a parameter but it is
only used to extract the nand controller's private structure from that.
In order to make the function more generic, change the declaration to
get a qcom_nandc_controller pointer directly, and update the callers
accordingly.

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index d7642db2e2df1..12bfb14cd9a37 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -449,10 +449,9 @@ struct read_stats {
>  };
> =20
>  /* reads back FLASH_STATUS register set by the controller */
> -static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
> +static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *na=
ndc,
> +					 int cw_cnt)
>  {

[Severity: Medium]
This isn't a bug, but there is a mismatch between the commit message and
the actual function renaming.

The commit message states the function will use the "qpic_nandc" prefix:
"While at it, also change the function name to use a 'qpic_nandc' prefix."

However, the code changes the name to qcom_nandc_check_flash_errors, using
the "qcom_nandc" prefix instead.

Could the commit message be updated to match the code, or should the
function be named qpic_nandc_check_flash_errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom_nandc=
-share-more-code-v1-0-f3012199b161@gmail.com?part=3D1
