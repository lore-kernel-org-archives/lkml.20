Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97A4BFE6C;
	Thu, 24 Sep 2026 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280611; cv=none; b=jAK1jWq/bSHgoKb2y799Z1fDGyaFmgvQkIteJ8+ZqZrct1OPVShajRjFTwrC/AqOMkvwefabD/0CrUfzBanpUfcPQM45UYsyoxpL314VUMJt59Cil82OXl1qEYCb5AwbgyNYsy0JEh1Z17PlW9dKlcXg5zHbPPpAwGVSR9iwnjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280611; c=relaxed/simple;
	bh=Uv8aoEGtw0qzX3CgJ7dLLwYNb2lIP08Vzqbd47x6+44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZWydYaja/TJH9CyYXaQ7mJZS/tcRXtUZURjmsAfIjaK2FBhJku419iIrVWqDwDA+XT4SGaNIERwu6blZXES9apF97T6qf3/sFna45fk9kkHdP6UE17juLHg6qVWdrE3Y4Ov63A7cslumCOxK/bPIoWyJptvBVoP71EHb1UIOYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owOBD9Z3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owOBD9Z3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2211A1F000FF;
	Thu, 24 Sep 2026 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280604;
	bh=1jOsfzsB3hv4KNrWjmgN4wnBOvlVFXQ0TixMOloSGIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=owOBD9Z3bxyNpfQo+mebKzx7nefUU6RKRXWF5C3g6rtPvf/jTfsfangRI3fdnqzZt
	 Eb3L1IwTFMcFJurhh9tUf1EWfRCPG7CRuzk+jdLeE91Fysidiw6IrVPFt94wiIy3P7
	 tXeqxgl3yJwQuaM4fVTNqssg3ElFnUANuAJM+m66M9Y2OucWs3R1dsp5PsppLhoeux
	 sOvDv+3lA+A3aYbuh/JO0XTgZW/y3mxnaxe7RHK7CCrK4jjeEAFMSM6hJy2VEIvqLT
	 K2YoifP2d1kAkKqpjcMFo85k2bKDW8zMB1uT4svQO9BCrQs5fjkmf91OiKjKw9Dj4R
	 3GDI3Vp3/gg+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] mtd: rawnand: qcom: make nandc_set_read_loc_first()
 more generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Gabor Juhos" <j4g8y7@gmail.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>
Cc: "Md Sadre Alam" <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-5-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-5-f3012199b161@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:10:03 +0000
Message-Id: <20260924201004.2211A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: rawnand: commit message and code mismatch on function prefix
--

commit 443343cbb11c6cfd82ac881ace012fb8d533a7a8
Author: Gabor Juhos <j4g8y7@gmail.com>

mtd: rawnand: qcom: make nandc_set_read_loc_first() more generic

This commit modifies nandc_set_read_loc_first() to take a controller=20
pointer rather than a chip pointer to make it more generic. It also=20
intends to rename the function with a new prefix.

> In order to make the function more generic, change the declaration
> to get a 'qcom_nandc_controller' pointer directly, and update the
> callers accordingly. While at it, also change the function name to
> use a 'qpic_nandc' prefix.

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 99fbf54580836..96a1a5a03de87 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -150,8 +150,8 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctr=
l *ecc, int cw)
>  }
> =20
>  /**
> - * nandc_set_read_loc_first() - to set read location first register
> - * @chip:		NAND Private Flash Chip Data
> + * qcom_nandc_set_read_loc_first() - to set read location first register
> + * @nandc:		NAND controller's private data
>   * @reg_base:		location register base
>   * @cw_offset:		code word offset
>   * @read_size:		code word read length
> @@ -159,11 +159,10 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_c=
trl *ecc, int cw)
>   *
>   * This function will set location register value
>   */
> -static void nandc_set_read_loc_first(struct nand_chip *chip,
> -				     int reg_base, u32 cw_offset,
> -				     u32 read_size, u32 is_last_read_loc)
> +static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *n=
andc,
> +					  int reg_base, u32 cw_offset,
> +					  u32 read_size, u32 is_last_read_loc)

[Severity: Medium]
Does this implementation match the intended function name prefix? The commi=
t=20
message mentions using a 'qpic_nandc' prefix, but it is defined here as=20
qcom_nandc_set_read_loc_first.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom_nandc=
-share-more-code-v1-0-f3012199b161@gmail.com?part=3D5
