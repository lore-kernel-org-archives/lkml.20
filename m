Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8F3EA97E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179223; cv=none; b=iey8Y73vgUIClemRwf8+nB8K40HNQUlB7n9rLuXAH5BR0IwgJgAxmd3F/AKMp+RWI8Ifpvon9CtOCSrziiPeDN58LKHaq+843qobMw8vmPUbLo/WYny/YjDGjv2iVQSIM4ca9Y1ypmZ2j7KWE212hGpLlW6ujuHnqteRnD6Oj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179223; c=relaxed/simple;
	bh=BcAjF3TL+Ihb7EDrDh9V9JHpSYGBIqXKmJXpIHhW6Io=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AVby3OAwmBO3AzMQ256bAmH0QsVm2nhJYL21i1JZNQcGEMPEEooK5sI01NopxE+B5VsNDQhuJYlEouwmMIFpRYXz9mTCR7269dRVk1fegFIC3OGD261EQwYWpAkf/QOacCRyxeTc0zXN0L1V7sIfgV++yLLzgg40A6Pmz97DZ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eFdeS4u5; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eFdeS4u5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F6974E41493;
	Mon, 31 Aug 2026 12:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6913B60231;
	Mon, 31 Aug 2026 12:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A49C611C789BE;
	Mon, 31 Aug 2026 14:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788179218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BcAjF3TL+Ihb7EDrDh9V9JHpSYGBIqXKmJXpIHhW6Io=;
	b=eFdeS4u5Qpv2+IhaM3NQwDzKCfDcPJgJuCHBMMLv6fen2KWdTSxzcj6FIjp/DcPTx1zcxN
	t0vM9zW5Sjp2SoZaat0OBKpNHrjKEpfCZWDGqxA54hlj6fbTuMsNf9SH68Cj/xdH6893T4
	VQuOZ1Wu7Xooh4jtGyce2kwOhZb1IRwV/yGo1IdW7EQxB3J5S5R5G0IFlmhGzVO3LMGpI8
	DTnkQ1Ou9iJe/z/mSADPOzC0uc0rRMULdCkqWCwmDkQbWFYNJsEpO9in1/CyskFvGz4CVB
	DjAXBW153j13HbJ91kY0zA9TUKyvkbouk3bUEu4U1RQQffVisTdgYnvM74XOgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with
 more than 64 bytes of OOB
In-Reply-To: <20260831114000.1844796-2-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Mon, 31 Aug 2026 13:39:59 +0200")
References: <20260828085337.3916199-2-mehmet.fide@gmail.com>
	<87v78qbtqz.fsf@bootlin.com>
	<20260831114000.1844796-2-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 14:26:56 +0200
Message-ID: <87se3ua31r.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 31/08/2026 at 13:39:59 +02, Mehmet Fide <mehmet.fide@gmail.com> wrote:

> Hi Miquel,
>
> thanks for the review.
>
>> Since it is a total rewrite of the former approach, this is probably a
>> good candidate for a Suggested-by.
>
> Of course, I will add your Suggested-by in v3.
>
>> > +/* The controller transfers 64 spare bytes; larger OOBs keep using
>> > the first 64 */
>>
>> Is it a real controller constraint? Or is this a compatibility fix only?
>> If this is a real constraint, you can keep the comment, otherwise I
>> would drop it.
>
> Compatibility only, so I will drop it. The SRAM row buffer takes up to
> 248 spare bytes and the ECC engine computes parity for whatever length
> is transferred - that is exactly how the bug bites, the parity moves
> with the transfer size. The 64 is the on-flash format that U-Boot's
> copy of this driver and the kernels before a7ab085d7c16 wrote, and the
> explanation belongs at the ooblayout, which brings us to your last
> point.
>
>> No explicit inline please.
>
> Dropped.
>
>> Please modify this comment to express why we use our own layout here.
>
> Will do. Something along the lines of: the core's large page layout,
> computed over the first 64 spare bytes instead of the whole OOB, so the
> ECC bytes stay at the offsets the established on-flash format uses,
> while mtd->oobsize keeps reporting the chip's real spare size.

I would instead talk about the fact that with 64B OOB chips, the core's
large page layout was matching U-Boot, but U-Boot and older kernel where
clamping the OOB size to 64 if that size was bigger. Modifying the OOB
size is no longer possible (we must respect the actual chip geometry)
but to avoid breaking existing setups, we need our own layout which
only exposes 64 bytes.

Thanks,
Miqu=C3=A8l
