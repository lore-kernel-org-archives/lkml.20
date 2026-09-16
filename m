Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B53E4BB7E4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553165; cv=none; b=LXjPY3mHLC47y6hStUf9bNoH+hn73YLL0Qnldh89xubjF/6XseGEG6R9Irx2VFemT09oBxpG1mmnDrK2JA7kUxfMKQFhFxYH2pumaJ8obgQfhJTHVfM4STcv/Brzg+x4FVKO6XnD30oGODTxuc1+KOaiu1PLxEbHBklcsbq5ZeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553165; c=relaxed/simple;
	bh=ofElsNABt+b8mzZHZC0QsNKjZvHd8Uyu2Z/XtfzFnDY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CjV+iqedGDuwaULifhwvrEV4F5JCjhws+j6NdrGCBmcsfOkGReTJZQdJu/PLo1NG1Sy5uiPb4wTA7hzTUwumwfmPOiTVK6jWSfEhk2L+OMKO/vnAsVvPYO7Gi4i/N70J7MfsKRhI5nN0iC/Twhzws5+GBGNbBxf9rtt28cD/VJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQTZW1WD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQTZW1WD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so5220105e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789553143; x=1790157943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSLFVgXdU1ZjalH3c+5t4p/z9xUpz8ESSa4EgBQ9fIU=;
        b=jQTZW1WD6n5L2Q56IxJVwtY4ARZwTZC/A5wUAqqAPHim1SkgOtGLuiseaInyJEaf5b
         ak8qu2sJnz7Z3NncnDIjCcp/qQLadT7BhpEmKTy+f8m/RUtsOF3nmXcyvAjWdinfXBmr
         9E1rjfOUX893OYuVEl9nqWOt3JW6WhzFt7aNsc/xSYQXuFZ3wtayF//xF6Vwk5GeUrpk
         WGgtNS9QRRY67n1DfAEIH5AjU1hxxpW3UrPpbBa80mvdT1wJAPR3s9N6Vjq4XNy4Y8YI
         9zMrmODrI/2SbDbicIfSizsWllUgIvqRlqQYZFZ8J3AMoGypzTWwHsYXYlW9PTupt5t3
         AxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553143; x=1790157943;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSLFVgXdU1ZjalH3c+5t4p/z9xUpz8ESSa4EgBQ9fIU=;
        b=1Oasvuzc/LjA5JPiIGOlrgLCuiwpOYn8V9ijyfx7ocjy0UQnYYIR4abqte5iE93uhv
         hRFkk14dOgcIiQdnNH4pKmMntDOfhyN4h48dYU4GwNYPvLc1UAbBJX/yTZsuBANOg2vk
         uR3oXHcRu2ETQHq4eAA/7OZsgVj8mDcB9rTM5hVuugoQuybGkGLwK21SlTYNn/BIDViS
         cf2KpepOanAnda9DT+nLczxPfvLh4k4xoApWxoFptOleZLsFglhDA7aK6bLC2ZJsgjxh
         BAHONGBe2XTqo/Jktcox9vQrpvlO2EM65BSRRdVsNn7hGthAkpAhUTfz+gqPc1AX+98e
         MG6w==
X-Forwarded-Encrypted: i=1; AKwUvBxMFFDfaI5q8iIs+TXPCqRh42ZctSrb9SMXhaf+yB5DTPuMV6YhZG9mHhnAWIwafD3RIv4DuRhBLzb9mzU=@vger.kernel.org
X-Gm-Message-State: AFuF++mPC36GKQTSrv4/XRjT7WTaNohkKMmHmXRqgW4FAxXNZ/PbSfHr
	kW2ghHHcRxS89zQ4oZrS2Pr3tEI626iqIAPaRv94S8AFMTIGe43n9u8D
X-Gm-Gg: AYBFou1M+Ku3p4tdp48wt6rbdJNN+IBlyUuf7Dps0pXDSB0Hfg2s46ACQUDC9A/xwRB
	40hdhtERbBX0xNQMbwRo9ZHIKRrAImzUcEhUnxFIB4KfGnUUsE0gNAB4aeyuR3t1bvbLUYnlUPm
	oO/gh/22xof4gH5eVDAd+8gk/9UFPMUSqi1b86jfrBAPQmeUnnL2oVNUuGI4FixNLQk7lY1dH97
	+e+q6a4IIlENjmi/aIGbScgI42piueO64plBHQgsk/IFAmMgiEF1d/rMwhRgHGyi2a1J5A3wAkQ
	tzaShwNBoHCERMu8lEWhLS6+2rGRuBOy+CPNnieELKX2xR9uni4514dY67uXNEwV01sfo625p/G
	yq15OLuQ+9UcRXJjoT4KWBoQ0kCnna3GM1kEA06Ki2G+0A/OrHl/mHc1n9ZqxPoKZcmKP2gkrRR
	WsOCUWu5tvdRTVtwxvceiicy61wV+KzxEoafbl2FwLOUDxjwUzl3cVZs8r+QjjssdesnuxlXC2d
	CSqycFRyo7yjulf2UORiWkg05nlqMDrsFm/
X-Received: by 2002:a05:600c:3547:b0:49e:7423:687c with SMTP id 5b1f17b1804b1-49eac46377amr20615655e9.1.1789553143138;
        Wed, 16 Sep 2026 03:05:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fca640sm39034375e9.1.2026.09.16.03.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:05:42 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:05:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, HyeongJun An <sammiee5311@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Message-ID: <20260916110541.35d70289@pumpkin>
In-Reply-To: <20260915194203.3511147-1-arnd@kernel.org>
References: <20260915194203.3511147-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 21:40:31 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Two large spi_nor_flash_parameter structures on a function stack
> is really too much, and this can exceed an otherwise reasonable
> frame limit:
> 
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> Change one of them to a dynamic allocation to make this more reasonable.

It wouldn't be much more complicated to do a single kmalloc() for both.
Then replace then memcpy() with structure copies for type safety.

Might stop saskiko bleating as well.

David
 
> 
> Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c21a6953db96..5d0901074f50 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1520,7 +1520,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  {
>  	const struct sfdp_parameter_header *param_header, *bfpt_header;
>  	struct sfdp_parameter_header *param_headers = NULL;
> -	struct spi_nor_flash_parameter params, params2;
> +	struct spi_nor_flash_parameter __free(kfree) *params = NULL;
>  	struct sfdp_header header;
>  	struct device *dev = nor->dev;
>  	struct sfdp *sfdp;
> @@ -1532,7 +1532,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  	 * Get a backup of all the parameter to roll back to in case of an
>  	 * error.
>  	 */
> -	memcpy(&params, nor->params, sizeof(params));
> +	params = kmemdup(nor->params, sizeof(*params), GFP_KERNEL);
> +	if (!params)
> +		return -ENOMEM;
>  
>  	/* Get the SFDP header. */
>  	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
> @@ -1652,6 +1654,8 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  
>  	/* Parse optional parameter tables. */
>  	for (i = 0; i < header.nph; i++) {
> +		struct spi_nor_flash_parameter params2;
> +
>  		memcpy(&params2, nor->params, sizeof(params2));
>  		param_header = &param_headers[i];
>  
> @@ -1711,7 +1715,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  free_param_headers:
>  	kfree(param_headers);
>  	if (err)
> -		memcpy(nor->params, &params, sizeof(*nor->params));
> +		memcpy(nor->params, params, sizeof(*nor->params));
>  
>  	return err;
>  }

