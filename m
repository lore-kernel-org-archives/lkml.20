Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3BE3B95E0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981169; cv=none; b=phVuiYR7tyaZ4xo+aNQSyZTPu2F+7r54xe68ZyBJTkb0TUYoU+CnOjM3nbAmSyIKA34qn0Zhw9w5UBtZYlOLQ0t8W8NwfDCxqnJ2d1QM02XAyILThzYZCUGh+cncnPX5T3q4VanatZcYOIQhNgMgQcUeuRI3Ms5xjXGcIfiJzFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981169; c=relaxed/simple;
	bh=c13K8Wd9tq7uHJpMmN2Y+Sds28GX4rj3Ruto93r67Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qd/ine9bhlVeU/yyk1b+oFvpxZTaxx892ZTIEEwQxrEVe+PB/oBgDDLTsthgn9L2m/JnPRTmgYf6qqfR6JlsS6/lSsY3LAm1ZSUstHNMJ9S9DT1uWjr49U1rKNfBtM9v7Fa4gBbGAgyrhFhnq5kLy5J4S1C6LBDaCszwa+/m9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECyBVnQJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECyBVnQJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so1373243f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981166; x=1790585966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vo4X1gyksG3IrTY1hUwlLoQK1ASX088BlxfO3PRFUAI=;
        b=ECyBVnQJ4ynjaFIrubGkLXsFmgXeNCnw8av72RyhlzRmEvsXLkCUv/L2M2aXIpW/3G
         9InkJ8q47z/emjjR4eZJvlzATtIBvLHnqWAAV2UHwK9MfRNhIkAfl0Cll14uMyheRisI
         GNYIbzDZGwUXLRH2bHKnMj1/s5MXXcMLj5Qe5ktpvb7NLkHXAOECa9Q3T7zHPIonC732
         MZRiheZ5p9gLY60kNFMpmLtRrBDMFWcQ6mJjJHi90h/kVS+MUjl8T6Q3mrJImE1S1pDX
         wfLpsPTL0Dd2YaMkrGTuSf4/P6axHF37lpZ1F3vdVe3h9ABCCgKJvmZAqeF+6F9SddvW
         WW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981166; x=1790585966;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vo4X1gyksG3IrTY1hUwlLoQK1ASX088BlxfO3PRFUAI=;
        b=I89upsXbHdRJFqQeMeNonB1jmMMEkhBvP0qa4+8g0pvDgdQ2oEDr8T/kYnw9jGRLZB
         kOlGofsZfngQ84sqxznSAbFjafhZ3QgIOqjdUnObrvGQed5TeX04iP4V+mOAEoWAP7rt
         EE994VtUfVphh5djk5EibSk89B9pTsDFDImurfJTrP/B+OZdzcIb4HR06rPQAbSqH9JC
         Vdsr6RzIR5V/UAnus64yUQAEPVzxNqAWnLwxCttJ7lYbS+9mPYQXU8BVXVla/Rd5w/nb
         TeK1fo4cCKTJHe/DYX4XRu6+A3Z4LKp5BN93RuFdmyveR59pSQBnQN7FYaZY4sfZgHeO
         VU2g==
X-Forwarded-Encrypted: i=1; AKwUvBwPdgFe+LTfXPHa5TqzcqLU3KJeMfCYyCPqL86Y/Gakws3f7w3MUf1XMBqMZ05LI/wTnjhp0TDvfYw/dnE=@vger.kernel.org
X-Gm-Message-State: AFuF++n0kkyZKS1WOZr9Ub0byefZv7ebAnA1Kw7dKrxQ/zhmEcYiYed1
	cQyC6hsZr4scKciNoHz7ELVaNvIK4koAxoZT4qSjzffqdjKqe2jMx37h
X-Gm-Gg: AYBFou0IPR/MBAyHRDQbQFsFWaJuQ8NGBv9sFLoWywzLU8K3kbHnHgS5zBep8FkG0C6
	75vgRXzN5cSh5zju5Th6/otfsHrXLy782KdThSvshYxf0Ejsrt2fjNT0YfFzoJnUP+ZEg5o32rM
	cfqw7Rnnqv9WIOu+fW1WS12uSFDI++oEZ+u7hDdrwkLpT2tjRfo7xxemZ7yhUhPgq/bbpaU4ITy
	3PLvZ9t22+JlJw3vuG18fPzkuD0jSGKVTdfFxObipUUtZnwC1YY8GSfSLiuFTDl8grRF/1RQBOJ
	ZzPkX9ELLbgnsiSTaqTo5FrNG5oKiVZBj63fkpcIM8vEK/FPLgqEjQm2akU3ruei/FqOy8zIops
	CBTArGXBZbch+/ZAGrsKjwHW6PUIv+NjrJZV+fcrxpIpIOhiGd2fNF7e0MLZA/ZChPk842DV7Pf
	VaPweGwnuXjYijb5BfEns9nhkFDK11I9vivXhotVyYNCl776/jQ6al7/s1s9/A0rp7HRy6E3wFx
	t1V9/wwwA+oq4339+ABxjZmFvvKcZLAS5ql4/CMYwZKdYBQ
X-Received: by 2002:a5d:5f04:0:b0:487:a15:dbee with SMTP id ffacd0b85a97d-4871e225ae5mr11911859f8f.21.1789981165887;
        Mon, 21 Sep 2026 01:59:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456325esm21322512f8f.15.2026.09.21.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:59:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:59:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Arnd Bergmann" <arnd@arndb.de>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "HyeongJun An" <sammiee5311@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Message-ID: <20260921095924.2f845215@pumpkin>
In-Reply-To: <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
References: <20260915194203.3511147-1-arnd@kernel.org>
	<DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Sep 2026 09:55:37 +0200
"Michael Walle" <mwalle@kernel.org> wrote:

> Hi Arnd,
> 
> On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Two large spi_nor_flash_parameter structures on a function stack
> > is really too much, and this can exceed an otherwise reasonable
> > frame limit:
> >
> > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> >
> > Change one of them to a dynamic allocation to make this more reasonable.  
> 
> Thanks for taking care of that. Will you respin the patch with what
> David suggested?

This compiles...
David

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 641f17ad51a0..cec699b52f27 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1519,9 +1519,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *nor)
  */
 int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
+       struct spi_nor_flash_parameter sv_params __free(kfree) = kmalloc_objs(*sv_params, 2);
        const struct sfdp_parameter_header *param_header, *bfpt_header;
        struct sfdp_parameter_header *param_headers = NULL;
-       struct spi_nor_flash_parameter params, params2;
        struct sfdp_header header;
        struct device *dev = nor->dev;
        struct sfdp *sfdp;
@@ -1533,7 +1533,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
         * Get a backup of all the parameter to roll back to in case of an
         * error.
         */
-       memcpy(&params, nor->params, sizeof(params));
+       if (!sv_params)
+               return -ENOMEM
+       sv_params[0] = nor->params;

        /* Get the SFDP header. */
        err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)

        /* Parse optional parameter tables. */
        for (i = 0; i < header.nph; i++) {
-               memcpy(&params2, nor->params, sizeof(params2));
+               sv_params[1] nor->params;
                param_header = &param_headers[i];

                switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
                         * spi_nor_flash_parameter data.
                         */
                        err = 0;
-                       memcpy(nor->params, &params2, sizeof(*nor->params));
+                       nor->params = sv_params[1];
                }
        }

@@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
        kfree(param_headers);
        if (err)
-               memcpy(nor->params, &params, sizeof(*nor->params));
+               nor->params = sv_params[0];

        return err;
 }
--

> 
> -michael
> 
> > Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)  

