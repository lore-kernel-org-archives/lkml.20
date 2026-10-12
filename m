Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D04CB8C0;
	Mon, 12 Oct 2026 18:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829636; cv=none; b=CmTC8uY072AuzBJwJpPN/Hx9GERCyjBB5JnfQUcaGrK6jbojzCLoy5GJXKDVgSA2553u50caR9KWEgx6uRTEXv3oAVcbIcQ77sDMYeIrkvJ5E1lzNq0HVbN3/yS13GYd9QWcuEtx5TJGeI9cLZg1Lb96V/3gay6/RJsae0U3Uo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829636; c=relaxed/simple;
	bh=4Mw5a9VrVDkCVt4gd2XCCNT0RRexgNMCUW4LwicTpc0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TSnN1w8a5x8VOsHqw9lFprRyQPPyUeFUxkyrmluM9sR/IdWJcMcqAN1oPJt1wnp9sYR/jrXrf2NXteEOBq+zf+BTQUaRzkTN7DpZj6WNxagw093aT6F9ehnWSygbv7lbp5cJL0NXDyGvvZoyzZ0PVyZK3wPJe/RHtbTCvv5pOyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SgPA456w; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SgPA456w"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 181F84E411FE;
	Mon, 12 Oct 2026 18:27:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8629601A6;
	Mon, 12 Oct 2026 18:27:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C4FC11D70089;
	Mon, 12 Oct 2026 20:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Mw5a9VrVDkCVt4gd2XCCNT0RRexgNMCUW4LwicTpc0=;
	b=SgPA456wP54NA6XbiWQLMIwqjo+DKCGUoeM1meJu59I6Ju3cZE6YgiPqbXjbyGzvIXSkeD
	9wqpDVkMrODSnUwbDpqm2KJ1ZI78qvsyX4fL1aJoZ/6jbLIuAyaqDxvbgDHwWYeX/R3vMB
	LuOkQv5Z6J6qwp7ngJVppGvZ6Gqu1Cp2U+xe3ZQHVTMOd0IYYrNg4/kBNdpRMaGSB0ngZL
	6IP2eb22Y9tL1RGeAkhDQzdpDUJgSgFoPgCrpKwLVGWP4e4ZkKWfQKQ84uotxJDQOutDWP
	ozhVrzxQ1FglBHQKMYn9uWTJSC6lSVhkYfx1nEGQx6cCFDQJfPt+8/QLNimFBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-arm-msm@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: qcom: drop setting of partition's mask_flags
In-Reply-To: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
	(Gabor Juhos's message of "Tue, 06 Oct 2026 22:00:41 +0200")
References: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 20:27:09 +0200
Message-ID: <87qzhuzsea.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Gabor,

On 06/10/2026 at 22:00:41 +02, Gabor Juhos <j4g8y7@gmail.com> wrote:

> The 'attr' member of struct 'smem_flash_pentry' is 8 bits wide,
> so it is only usable to mask the lower 8 bits in the MTD flags.
> However the MTD layer does not define any maskable flags in
> these bits at all. Additionally, the meaning of the bits in the
> 'attr' field is not documented, so it is not even possible to map
> those to the defined MTD flags.
>
> Due to the reasons above, remove the 'mask_flags' assignment code
> since it has no effect anyway.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Sorry but it no longer applies after Weigang He's:
[PATCH] mtd: parsers: qcom: fix offset/size overflow on large partitions

Thanks,
Miqu=C3=A8l
