Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D87511E7E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860244; cv=none; b=BJu0CIBOK4rR7FLdh1VzFUroYSqmw6APZ7F12f3COIDdlxoxcm+nfRPpwjaCGDHLiUwNb8MRBwoF6eD3OFM2co4MQ3Rcm0QK8QkH20VABiiM6PRytH8UZ1eqF4lxSmj/phsYchbBBh/nNcAsXqQW9KBJMKW08Ihe3DnmtDBz8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860244; c=relaxed/simple;
	bh=BE9ON5HBCt5tW4TTWzfj+lE0By1JuD0S4nG2Sv9Tff0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U6E7mP7P7k2e6C2q3+PSrOGaq/QQAJoWDAZwlf6skIhoZKqYf4XrwYeF0NI8qrMnm5usiDgY/a8DUgZcJFjRS6lGS1EIhUbGfBMs21qQLjZKKEoUqjj/LWIa7Q3scXWyW2aQ0C7m8EpXkF1gSTU2ekvKb2DoFl6CDGwute7QJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hrFUetqT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hrFUetqT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C04861A1A53;
	Tue,  8 Sep 2026 09:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94F76603C4;
	Tue,  8 Sep 2026 09:37:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31B9411C7A34F;
	Tue,  8 Sep 2026 11:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788860234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EqcRWg98mOcljlI9mTBH7+pU15MLtpwfrZFZb9Dljv0=;
	b=hrFUetqTIKCDLj4NHUxP3C7PZLgE6AEYwXZ2Z3GJXuxLsYmwjHcFrdvK5/HPkZzswMt3Be
	0hmSgZlbnUaH5Zs2ugviTlyI11jPWI2XEpfJUbBSZ5FrYHV6ZOrCleVe6wEnWJTE7IdHiQ
	NZatVDDRiU7iI053ov2Fkd3aeTY+sjpzJXnzAmrd18I3NhRoYv/0cS51uCv7GQfMzbfQEB
	+GeR4xv1TpNmJQ36gZHO4T7U70S/GnMWyrkBPdZSbfmr/aSPZy2cwlHqJaSya77W0SwZm7
	23f4OmKuYNXsmTzGheydpyCcgXMVel1zpS1/a9h9fSzDCH3LE7D9RmO5YeQXpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org
 (open list)
Subject: Re: [PATCHv2] mtd: rawnand: fsl_ifc: allocate shared ctrl with
 devm_kzalloc
In-Reply-To: <20260908060111.41244-1-rosenp@gmail.com> (Rosen Penev's message
	of "Mon, 7 Sep 2026 23:01:11 -0700")
References: <20260908060111.41244-1-rosenp@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 11:37:11 +0200
Message-ID: <87h5k0ulrs.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 07/09/2026 at 23:01:11 -07, Rosen Penev <rosenp@gmail.com> wrote:

> Allocate the shared fsl_ifc_nand_ctrl structure against the controller
> device, which outlives all NAND child devices, so it is freed
> automatically.  This drops the manual kfree() and the broken chip
> counter that was decremented in remove() but never incremented
> anywhere, leaking the structure and leaving the freed pointer in
> ctrl->nand on re-probe.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: rebase.
>  drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/f=
sl_ifc_nand.c
> index a88ac2cfaccd..4c2d95461c2e 100644
> --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> @@ -50,7 +50,6 @@ struct fsl_ifc_nand_ctrl {
>  	unsigned int index;	/* Pointer to next byte to 'read'	*/
>  	unsigned int oob;	/* Non zero if operating on OOB data	*/
>  	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
> -	unsigned int counter;	/* counter for the initializations	*/
>  	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
>  };
>=20=20
> @@ -1033,15 +1032,13 @@ static int fsl_ifc_nand_probe(struct platform_dev=
ice *dev)
>=20=20
>  	mutex_lock(&fsl_ifc_nand_mutex);
>  	if (!fsl_ifc_ctrl_dev->nand) {
> -		ifc_nand_ctrl =3D kzalloc_obj(*ifc_nand_ctrl);
> +		ifc_nand_ctrl =3D devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand=
_ctrl),
> +					     GFP_KERNEL);

This is a global object. I don't get why it's global. But it seems not
relevant to tie with ctrl_dev->dev (see Sashiko report). Can you please
go one step further in this cleanup?

Thanks,
Miqu=C3=A8l
