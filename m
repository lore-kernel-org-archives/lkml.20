Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DE4C4F6C;
	Thu, 24 Sep 2026 20:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280599; cv=none; b=olsk/iSWFIwv53V6PQ3sIprsW3Gv8tRzWkWEZssMCIEiOO7hDrqqAa4BlXplgRx6nzJ4dv5jA8o3DtMHKWGKpFpUal9H5Luk55y0f1NZrV7JB4CWzI0Qg2bpLl1TlMnwoeDj6q5WFhf5NMzA20VRiohK2eJzkMUUfYntduRsf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280599; c=relaxed/simple;
	bh=wTHjzzxT3i983dYaDGvzNQvjXkYQzkpGbCjSo/pi2vY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q411EliIxKtVwwwA4Ev90lOGvIqml0e6zasdBim228/jeu8gVrBkXjT3ZM+wNv87hFO3D+t48C9/IAyDYbC92qyDNWkGpIPqf/wl3gNwF/zMJIqQLAvJA8pWOojisLlohpv7z/4uAGkRYzT+kpCX5wt8mCnUCsGEmMHkDcNLrto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eMN7qiRz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eMN7qiRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747331F000FF;
	Thu, 24 Sep 2026 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280593;
	bh=JqYrY2fUa+YS7VUIxLE/rJCbq/fx0K/pCxLNjYwJ6rs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eMN7qiRz679C2wcwMJQREkQCNzW7PfrAAL/QMxBvyIL6qGSBguaO0CXTYlgPeD7Db
	 tGW27wOXgjF69dCIJarksJQyarJ/8ff6joU7/bVOXLJvp062BYlcB916fsZ+cguaZq
	 ocbA69HRjWCJKM/pJq7LJcTEVFK3TspYcUti0yg6jeHyqtZ66aF5DNQyjWd4QUCiRe
	 27FwwcN15aMO/aNLyb3IKitAcAwSfsStTO4FYaXjLyfGuDXRcSwRN2elNASpxDStgF
	 3n5XiUDf/mN3g9//edgI6FZ7D3MIj0bpXzfl+mfSoFfFeOAshh7wU96Ns65aGJ40ls
	 w29V66D/AiC0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] mtd: rawnand: qcom: make config_nand_page_write()
 more generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Weinberger" <richard@nod.at>, "Gabor Juhos" <j4g8y7@gmail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Md
 Sadre Alam" <md.alam@oss.qualcomm.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-3-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-3-f3012199b161@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:09:52 +0000
Message-Id: <20260924200952.747331F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: commit message claims qpic_nandc prefix but applies qcom_na=
ndc
--

commit 2cd47b90aa23e587aa720b2d04c9ca024d8178d5
Author: Gabor Juhos <j4g8y7@gmail.com>

mtd: rawnand: qcom: make config_nand_page_write() more generic

This commit updates config_nand_page_write() to take a pointer to the
qcom_nand_controller directly instead of extracting it from nand_chip.
It also renames the function to prepare for future code reuse.

>     In order to make the function more generic, change the declaration
>     to get a 'qcom_nandc_controller' pointer directly, and update the
>     callers accordingly. While at it, also change the function name to
>     use a 'qpic_nandc' prefix.

[Severity: Medium]
This isn't a bug introduced by this patch, but there is a discrepancy betwe=
en
the commit message and the actual code changes. The commit message states t=
he
function is being renamed to use a 'qpic_nandc' prefix, but as seen below, =
it
is actually renamed to qcom_nandc_config_page_write() using a 'qcom_nandc'
prefix.=20

Could the commit message be updated to match the code, or should the code be
updated to use the intended prefix?

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index c65a8416c3f5d..1f3c00823309f 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -365,10 +365,8 @@ config_nand_single_cw_page_read(struct nand_chip *ch=
ip,
>   * Helper to prepare DMA descriptors used to configure registers needed =
for
>   * before writing a NAND page.
>   */
> -static void config_nand_page_write(struct nand_chip *chip)
> +static void qcom_nandc_config_page_write(struct qcom_nand_controller *na=
ndc)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom_nandc=
-share-more-code-v1-0-f3012199b161@gmail.com?part=3D3
