Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718147F78D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824196; cv=none; b=HtLc4+Dqvq0I6adxTIsUJpRzrdopOahzqkq4zIZz9thKW/ebrbxiQMAhpSPBctJ+lZSSyVi3Xz7RuiTLcXa/COcsnf23KigSm1D2BbsSuIjduUopEjOEgl0WS9ayiR8YclEd4CKgxgxqwpuKl42KM+c8/BnqFsb30UuqhJEti+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824196; c=relaxed/simple;
	bh=MIvtcb0X0+tt51Pl+ZWqgdR+gE3gISV52JCgXKMZQNU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jPoshLzYlfiwkcnWhWglEKqLWrISkMZqErPATzEmEmWf06GnqhJofwY26yluvlon/gAU0n9juIeB6PVTjraV33bQsFq8SjOj3jlgooZwkrazRQ7eM6FtIYPB//M1959Lix5qjTz+jGAT70WnLVegPqUPuHk5xjGwEXbKyHujvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hBS5oDod; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hBS5oDod"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 94DFB1A11EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:56:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22101601A6;
	Mon, 12 Oct 2026 16:56:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7162E11D704D3;
	Mon, 12 Oct 2026 18:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791824189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MH6j8M7pFAPnzl94LKdOgm6/3MkJo7wgCk+vr5dg8Bc=;
	b=hBS5oDodYO87xuUeBsonQIlL/JA0M2cwif2eWH0Dl+dOvybeNOCnIH89bRopG89TW/mPBh
	dr9YHFgkZ/h4JkpoIFwFbIyh6wzd0mDul2oPIniP/y+jyASSWLtu12p/RJxQnSqqKJakhi
	8+J7om5KxNDgbw3+cDhEC9GuMedWzz9NC3uHh0sdblfTKVv8HORJdA0DOctpFyfoG9IeRm
	xn9MFO1s6mCp7ptvcjqlTknk9WoiUNCBnS0AG7NmbE6hy+e5sVYHxSHJZ+x9h3FcjD2eqm
	8b2F4iqQQsNZvr+KMveQLK3TBcc6DCI/ezKvzXydvrlpMJ7fFGZzXv70N4OwZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Frieder Schrempf
 <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2] mtd: spinand: Do not re-enable continuous reads
 vetoed during variant selection
In-Reply-To: <20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de>
	(Frieder Schrempf's message of "Wed, 07 Oct 2026 15:06:57 +0200")
References: <20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 18:56:28 +0200
Message-ID: <874ieq3lj7.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Frieder,

> Fixes: 6eb7c193e751 ("mtd: spinand: Use secondary ops for continuous read=
s")
> Assisted-by: LLM
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> I was using an LLM to check sync patches for U-Boot and the LLM reported
> a bug in the upstream kernel code. To me it looks like this is indeed a
> bug and the fix also looks correct to me, but I would like to mention, th=
at
> this is purely LLM-generated and theoretical. I didn't verify the bug and
> the fix on actual hardware.
>
> @Miquel: Do you have a hardware setup that would be affected by this?

I do not.

> Do you think there is a better fix?

I agree with your bug analysis and with the proposal, just a few nits below.

> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -772,6 +772,9 @@ struct spinand_mem_ops {
>   *		suitable to use or not in general with this chip/configuration.
>   *		A per-transfer check must of course be done to ensure it is
>   *		actually relevant to enable this feature.
> + * @has_cont_read_variants: The chip needs dedicated continuous read from
> + *			    cache operations, which must then be available for
> + *			    the bus interface in use

"The chip needs dedicated continuous read from cache variants"

>   * @set_cont_read: Enable/disable the continuous read feature
>   * @priv: manufacturer private data
>   * @fact_otp: SPI NAND factory OTP info.
> @@ -810,6 +813,7 @@ struct spinand_device {
>  	int (*configure_chip)(struct spinand_device *spinand,
>  			      enum spinand_bus_interface iface);
>  	bool cont_read_possible;
> +	bool has_cont_read_variants;

Can we name it needs_cont_read_op?

>  	int (*set_cont_read)(struct spinand_device *spinand,
>  			     bool enable);
>  	int (*set_randomizer)(struct spinand_device *spinand,
>

The rest is good to me.

Thanks,
Miqu=C3=A8l
