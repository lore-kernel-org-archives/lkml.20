Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571042BE93;
	Thu, 24 Sep 2026 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280658; cv=none; b=mnCRS5b0tUITh1DhUmkrWySEnBVv5Z9HoH1z8rskiD7RkBzd6WYW28bcjy/BpB6ZbljsZDKWFLlfdfa9eTSQ/jK8/ptFXe0A2V+88MkQSZxDAP8GeXD2dlNF9T3NuJNcJ93FsJnI58Cxj/uhGULJay+XaP/kiB0X85WCwpJ1jZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280658; c=relaxed/simple;
	bh=mz3vTn43yIalUlGbgIc2xvmEh6A36D5coSlbxFJJ6j8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D+9D9TPVT1TzFZocBkCmv4ZPPdO8sXYagfLF09+J+JVaZ5uppnYTFy2Qg4JffybbP0hNixSdOuk961GxQ50V0f2wsgvDcAPhLsyA5mA0h48AfgJzs+fkBOIlVlzfHgpFquXUvpTiUvkdrehOu9KQRQ9qrrqR/Yni+23FTPbGnBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr8Fraxz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vr8Fraxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5051F000FF;
	Thu, 24 Sep 2026 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280655;
	bh=mrGCecuZc3/HhFipi7r/vR1auDxKeYAI9d88y4Ykcik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vr8Fraxzz0rgp6rLkyCccIFR/H7st5ouBo574SfYJa+ltnuzyLEk04aOFc0tJjeJS
	 xWua5XpMsItdAvQ2HI/ND6G+5OdA9q+3D04q4jXV5RFn5FYOJ75Z9lOYMVPy5PX0Lz
	 JnSGdisrsVklZe8q9+uW3M8RDsGbFUoLtyIoOa2vb/MdAsR4r3s4WqcMlAoXDmnj74
	 QRNwLXe7iYVL73Jju6vt2rNtg+fBptZEIy0G7YNSZO8Mj08QVfwX2FWYJ4+zYDWISw
	 2PVfoYFrgtW051ErGqmycLLlMHrJXAXEQgRCMd/+OldJD0vsdhndzLEESsGpp+kA4R
	 WDzfyaByfHD9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] mtd: rawnand: qcom: make config_nand_page_read()
 more generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Weinberger" <richard@nod.at>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Gabor
 Juhos" <j4g8y7@gmail.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Md Sadre
 Alam" <md.alam@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-2-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-2-f3012199b161@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:10:54 +0000
Message-Id: <20260924201055.1E5051F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: code and commit message mismatch in config_nand_page_read()=
 changes
--

commit 83713aed92ebeefb24101c6bd3b2c47c7e4e9dfd
Author: Gabor Juhos <j4g8y7@gmail.com>

mtd: rawnand: qcom: make config_nand_page_read() more generic

This commit modifies config_nand_page_read() to take a controller pointer
directly instead of a nand_chip pointer. It updates the callers accordingly
and renames the function to prepare for future reuse.

> In order to make the function more generic, change the declaration
> to get a 'qcom_nandc_controller' pointer directly, and update the
> callers accordingly. While at it, also change the function name to
> use a 'qpic_nandc' prefix.

[Severity: Medium]
Does the commit message accurately reflect the changes made in the patch?

The commit message mentions changing the parameter to a 'qcom_nandc_control=
ler'
pointer and using a 'qpic_nandc' prefix for the function name. However, the
code uses a 'struct qcom_nand_controller *' pointer and names the function
qcom_nandc_config_page_read():

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 12bfb14cd9a37..c65a8416c3f5d 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
[ ... ]
> @@ -305,10 +305,8 @@ static void update_rw_regs(struct qcom_nand_host *ho=
st, int num_cw, bool read, i
>   * Helper to prepare DMA descriptors for configuring registers
>   * before reading a NAND page.
>   */
> -static void config_nand_page_read(struct nand_chip *chip)
> +static void qcom_nandc_config_page_read(struct qcom_nand_controller *nan=
dc)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom_nandc=
-share-more-code-v1-0-f3012199b161@gmail.com?part=3D2
