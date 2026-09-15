Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2A3B8BA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479450; cv=none; b=P4yUYMgWjSNGOAhtKmWS6ZrlPm6yNUIJLH92x1n3wQx0GNKhFjMFuVjtIwRXotn+VtJtzXb9tCNOAn/+3QsmEMN8oT0W6T4RFZhS3kzjHlUGDCkxS/ucNIkzLkHTW+wN1u5X6X0xJTO5BSV4lWt73Aus/Xn4lmtvPlGenxtHIK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479450; c=relaxed/simple;
	bh=7AnuNVhxyhuQj4OIhzM09mxSGHTJ01Pa2juVDuoGhK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K/frjnpJZZWzLfq4LkuFPWnn+WQ3CzYIIcCLDv+TfPgxG8Hdu1VFwd10SPqbGOW/5rNaKg44fk8hBUMlawzwWdWgFtBsBOgSMwJfujZ3m3sEFhkTHlf6XlgMCdkf9/eJc4UqWQPova6eeCP6+p8leI0UGVQ8nfEIHTQ44/J3knY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rJYS+GGO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rJYS+GGO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF11D4E40639;
	Tue, 15 Sep 2026 13:37:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AD3560498;
	Tue, 15 Sep 2026 13:37:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4A6411C7AFEF;
	Tue, 15 Sep 2026 15:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789479444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RKb5raYH5jjg44l7lX7tk09hl1TxxM+EOthKDMqnefw=;
	b=rJYS+GGOGKJDnkFEYwc5rjJq7ei4z5rkLCbLTzhsk8d087j7LjBZnO/99LP/hq5fEXQI46
	aEsuCC9tT35rvp476F9GJZO9KTowL/EuCqr764OoQkL2k5jQTrEJVeTLUCWhs95SsW1SQK
	/sjidzNIBpCQt3TfBTRV8Od2FBDMEgQVT8LgXgx6jShnJHRIlY7BTN72mwgmv27U8BDRrA
	ZJ4IGE9A3WakazyW5nH1u9vrfPHiH3TqgcSUTmK1vWDw9z65PlOh7uePo18kJRnCbOmSpt
	Ggmhe9eKq9eYQ03SZGNqmsF/8FxgBtHaWTTNWPQ3TNOgb02RLRpD50z05YcfVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <mwalle@kernel.org>,  <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <tudor.ambarus@linaro.org>,  <alex@sverdlin.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
In-Reply-To: <e15daee278f346cd8dae030e2409445e@infineon.com> (Takahiro
	Kuwano's message of "Tue, 15 Sep 2026 06:13:57 +0000")
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
	<20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
	<DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
	<fb4398e88939472eaa86cdc098a3d265@infineon.com>
	<DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
	<e15daee278f346cd8dae030e2409445e@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 15 Sep 2026 15:37:21 +0200
Message-ID: <874ifqoctq.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

> This didn't help as SFDP cache size is truncated to PAGE_SIZE in sfdp.c:
>
> 	/*
> 	 * Limit the total size to a reasonable value to avoid allocating too
> 	 * much memory just of because the flash returned some insane values.
> 	 */
> 	if (sfdp_size > PAGE_SIZE) {
> 		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
> 			 sfdp_size);
> 		sfdp_size =3D PAGE_SIZE;
> 	}

That size just being a sanity check, if it no longer fits our needs it
must be increased.

Thanks,
Miqu=C3=A8l
