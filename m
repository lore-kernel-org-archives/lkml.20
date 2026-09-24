Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725594BD7B2;
	Thu, 24 Sep 2026 20:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280597; cv=none; b=cdDKiAfZKwKF7uB2v7N2NWm8AlR4b/NAq8ar8sr4muyTQk5gvVz4px1btLFWRko65qJFsGsQ59JGI5i0PThf34ai7gU7srv0O7N/fMje8qwmz/P4A1Ue1TCT7q1tBg62EVwdcC862j5ju9jTHCCAox0Qa+0hynBPM2cPeGfLL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280597; c=relaxed/simple;
	bh=k0VSI9Xje2iq1txPz4aUwwslHAlsiTP3UtNhX8PUPYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ufTfmE/1UQ/cFDdX2FZlaNj2WtxFHdSJ0v8UzzYsZyfH5WLC/vmoU+0CeXSyjqqe0YU5p9YWTsJMH7OkeFaBY6GWucVYOvutkzr0FWyJCzVZfPp6Ijos5HkE2tsGJ//gaxoXrAYAQjlVk9etWColaJk2GBSgppUb9/n9OK5Hdm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRJLWZoV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRJLWZoV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D471F00893;
	Thu, 24 Sep 2026 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280593;
	bh=CQu78KLwTEVbiYZbpFLBvZknwpDQdFRkcZnlV1T0Nwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PRJLWZoV8qL+VhzPZsgQJTFScwTpVqZihRhIWsHyuu5iPluTcbDLsxqfOMk2bgoZq
	 epFbXSrzFFXHShYIxIbEYNn2xCDkEHCfAwhu/dsA9O39zM0Pyqz7KVMu9aGhyY5z2m
	 Zldy0tBEeyl4e7v6zNxs+M+c8f97w7Kal0wwraVQE2JEBZ4vvKbzfQRlQ2sqgJX5mI
	 gt7TQXK51wbjODnvqMlMIbVtv43gkCLZChEhF2zeWeX0amr0FYY/qR2oxYmr2wUCLj
	 N52x/I4SdJmhxNNS+RgB4OU9dSaqW5VUf5lDLzEZxNJLc2QlsvpEC3rhLBW3A/q7p2
	 4CZgiUpZrky2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] mtd: rawnand: qcom: make nandc_set_read_loc_last()
 more generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Gabor Juhos" <j4g8y7@gmail.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Md Sadre
 Alam" <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-6-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-6-f3012199b161@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:09:53 +0000
Message-Id: <20260924200953.63D471F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: commit message incorrectly claims 'qpic_nandc' prefix is us=
ed
--

commit 640e8b0121507d995cca38494c17f8a44fcdb750
Author: Gabor Juhos <j4g8y7@gmail.com>

mtd: rawnand: qcom: make nandc_set_read_loc_last() more generic

This commit modifies nandc_set_read_loc_last() to take a qcom_nand_controll=
er
pointer directly instead of a nand_chip pointer, aiming to make it more
generic. It also renames the function as part of a preparation to move it
into common code.

>     In order to make the function more generic, change the declaration
>     to get a 'qcom_nandc_controller' pointer directly, and update the
>     callers accordingly. While at it, also change the function name to
>     use a 'qpic_nandc' prefix.

[Severity: Medium]
Does the commit message accurately reflect the new function name? The messa=
ge
states the function is renamed using a 'qpic_nandc' prefix, but looking at
the changes to drivers/mtd/nand/raw/qcom_nandc.c, the function is actually
renamed to use a 'qcom_nandc' prefix:

> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c

[ ... ]

> -static void nandc_set_read_loc_last(struct nand_chip *chip,
> -				    int reg_base, u32 cw_offset,
> -				    u32 read_size, u32 is_last_read_loc)
> +static void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *na=
ndc,
> +					 int reg_base, u32 cw_offset,
> +					 u32 read_size, u32 is_last_read_loc)

Should the commit message be updated to mention 'qcom_nandc' instead, or was
the function intended to be named qpic_nandc_set_read_loc_last()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom_nandc=
-share-more-code-v1-0-f3012199b161@gmail.com?part=3D6
