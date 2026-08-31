Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3782DB7BF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178996; cv=none; b=EI4qMMpzw2mAjxyeoXoiiqLRMrWjUk8ipZ961Sp5/WYIoEgUh8vfiAcwf8tYWDqAEPNoup3WL0shVSh4jGQvlFTNmSN7cVx1bYv9THR8ICPdkp1CXn1zyb91uLeN5UaayLc6Bai7+p8Ro3l3yulwDXMk7MZAYLMxuTtsYuHLjxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178996; c=relaxed/simple;
	bh=O+MtEEzTjD1QAcLsUMrTVaxleDH6h75xowjVsW4s9yo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lEao4OY0DFhyx4MwoctS8zV7EYnp1QB537et/VKUhAUlS6E+hKfVcr7MUDGVunIN/GZ7nqGhlMqq7b+Wx18Wch8VKSnROX9uwcWnlVrD6U7YGeksPzt4+bkrSgNt199+rXCHQ8dMjzMiFSNvQF35aUmGuvEImGNiIeWdtPyUtZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fgyGWfXn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fgyGWfXn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB6421A18F3;
	Mon, 31 Aug 2026 12:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E41B60231;
	Mon, 31 Aug 2026 12:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B04C311C78B90;
	Mon, 31 Aug 2026 14:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788178990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O+MtEEzTjD1QAcLsUMrTVaxleDH6h75xowjVsW4s9yo=;
	b=fgyGWfXnZkPulfXWiljh1y8wEdoJIJnTlBH1wwJd8BmN8FqlD5mOHaYCLtsEgod2wuwby/
	OzXTJeAagZiNJCZ2yBw7IYu2SqTxophFoewB1IEhDrZCixFbacTTktsyXY3LS3ac+jzh/k
	+nE05GP6CkKtiVEjVDDIvj78HOltsZRisr3ySSfAG8CmafCBC6WC2ODHEV0PikB8sv1RIO
	HMAlB8050cACOykrLeMeoYSlvKqOsAypqJJHv9pmlVo7lYZ8bS9x9mKg0zwdFM1UD8d7/c
	rLkayQ9W4Xcm4MZroCMPdceqEZPvRWhM/mP+ixPHdH+O3YYHC6w2ef99+IKXHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on
 reads of erased pages
In-Reply-To: <20260831114000.1844796-3-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Mon, 31 Aug 2026 13:40:00 +0200")
References: <20260828085337.3916199-3-mehmet.fide@gmail.com>
	<871pbed8mc.fsf@bootlin.com>
	<20260831114000.1844796-3-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 14:23:07 +0200
Message-ID: <87y0dma384.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 31/08/2026 at 13:40:00 +02, Mehmet Fide <mehmet.fide@gmail.com> wrote:

> Hi Miquel,
>
>> chip.ecc.size is not covering the whole data buffer. You should be
>> reading mtd->writesize + mtd->oobsize, no? Otherwise you only overwrite
>> the first ECC step (out of 2/4/8 depending on the configuration of
>> the ECC engine).
>
> On this controller there is only ever one step: attach_chip() rejects
> any hwecc setup where ecc.size differs from the page size ("Step size
> needs to be page size") and the engine protects the whole page in one
> go, so ecc.size always equals the full data area here. But you are
> right that mtd->writesize says that much more clearly, so I will use it
> in v3.

Ah ok, then yes that would be nice.

>> Unrelated, but this comment is wrong, we accept up to <strength>
>> bitflips. Not a big deal though, the impact is very limited.
>
> I will reword that comment in v3 to match what the code actually passes
> (the driver's historic threshold of half the strength). If you would
> rather see the threshold itself aligned to <strength>, I can send that
> as a separate cleanup so it does not hide in a fix.

Do not hide it indeed, let the threshold as it is for this series. If
you want, you may send a patch to increase that threshold.

Thanks,
Miqu=C3=A8l
