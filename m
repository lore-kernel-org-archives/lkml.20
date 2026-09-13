Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF936AB57
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331521; cv=pass; b=mOGTuA1YIu73gS1X/oLa/1n/TPixkFPb7Gs6SoaWcmSFlVbuS/ZgkprkWL9eufDOTaXxkY1k4EMmJs7K0cQnHmIkR4EAa7ZGFJSxOUz6Venmxy1yHAp564OICfh2eMHGhvC0YJt8kSmqGMQGiS+uD79Zrqz5aTY1U43iQxpB+qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331521; c=relaxed/simple;
	bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpuFWjEGX9zN+AbO/L8hBFICJim6U4aWA8WqepVCfIoDitBX8lS6jIoT3iQ0UJEWn/nARO5RcpHWHP4LKR1rrIIIrHItfQiKWLq53RaT4Ha6o5llvC/a8BUqPVSESEqPm5qP7xQa4DWUHklBg/uPXmkNA08saWGK8AYO5EekX40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlEsPGDk; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlEsPGDk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c25420fe973so437596066b.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789331516; cv=none;
        d=google.com; s=arc-20260327;
        b=flLMf0QDhS+2N9Xi0f7edLeBL2WZsJ7V6+hyJVHJG1ZPMbPmkJE36mbPIy/tgmHl8y
         0E7rnA8mL3ZpW8Et1H8AkbIM+1HdvlMOsT+tNYX+Ck/au+AdCXsQyCqYDuEyojGbBus4
         PlEMj9GmZqypIIjjgFG0r9mC0h5g0lgxr95Q+BYC3lIjR6XQFPT3/CeK146JCTeLMGs5
         /HYDUPVtbyY9EGQ9/cRvzJI5RqO7HFTxYeZWKpwAS8/cc+oRQIHAsHwSesmdUtrYuvVx
         BZUp3SYn482vI8k2zhni/sYNXRg4dyq9FbpKjWbnQWTkg7nu8n5/FbPOUa25aZwk7ZAc
         W8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=;
        fh=Ua9t9Vkt5mceQ2R827RXnmtq8o7NDT9K29PFXYULxEA=;
        b=fc06AFsHrOQaYtkY5ZPnx7dYFIPnW7j0BPyqQ3GsjTpAhYoDq0s4hyM/6x78yKQkpY
         df88Vq40nRce39udTiqKME+iPA3eRY5TsH1Gkqw9hopVDQQDMg8DRmQdawha8/D/cq+F
         8dhsNUo7BX+1cM1ovZm3h7ekO+mADPCmam3aANGpvFxWLGtF5kzXYuqNfaeKsZEyLawM
         BtDodghm5H5asw8p920Xp5pswlC6XdgLOc/lkHwioLe/I+8Hdn0u8bSyqSoCIAoYJJlG
         0RvdLJ2716w+HnzZwj9PtozFeoBSgtoqYQORowqYIUk3yBx0ErOrPw4JJjPpsiBHSJpo
         Iyxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331516; x=1789936316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=;
        b=XlEsPGDkX+T0oZxerVgd3xTeyvFY5JPlqU7qEx6dUbN1pUtnDbM0tIZI76TsIkalim
         wirEo2SANyM09D1pFvZwwmX3Iqc7Tqprqf0zRcn68v+9UXrqFNqAyMAfxfdAFoABOpvd
         KDYEVN1lkxbNKLom25bT2plJ2K5E3B0l7SUsFVOD0jE6mRyHK+a5VJOgPSnXCnQ9fak8
         yKEcHIrByb6An66FgSubzpQ/Nww0o/p4g75ioD2/CKAtSJOn0KcXUCrvi1Qwc6eLW7Pj
         8Bw8LAQi9W+ronKyYApcPP7Q9m5XCJ23coKT/OzSEdL2kPUcjkhAiogSoG/TJilUeZjX
         Txew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331516; x=1789936316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqPuY8bjxg2PMPBTTRCR7VVhfztLYnhGPDT7UUbH0mI=;
        b=cA1IlYwp0acESONghXHG6DIvocJxyNywzXMBFN99xZ5/iCEQXNPlBQG4HbhkcfrPoP
         R9Ck0PQmXIC3UsLpXRXeeJ0gPERIdlYo0/ajLA3Qkr7/atdQjd3DS3Kal5ed3zmO4SwK
         pfDD5nJ/BTGJEVr0q9HU5M/dp9bp0bED1UbAKqNb8IFyNn/xXUp0WCF2GTGebS0HtI8A
         cKGNxpFpoQUhn6SxLxTJqQpCUST1eac2FiPc82OmFzzlcvPkdKTV/xTlBEpBB9kspuwj
         XfI7lM71mT06ICEQOSFzL+5itKJtqQNZnuc2pwT3PbDuNebjgQoG4XkaE4VXpA4YIBTy
         Pt4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1hMkW0hOtkWHkHz+Yf4DO0HwXfZDY/heLWO+4diCwcBVIVQAxku2WlGoa7k2npmZWSOxznNYqbbTstnk=@vger.kernel.org
X-Gm-Message-State: AFuF++l/6nMlKcwRjZi3fSyTTbKTx74gh04xjBawP5CSKgnkKXOjm5pB
	QKK7oJBDN4v8kNUpq8Ti+c2cP2PUWLe8B08h//ZPZbGmbe+1IjGJlU3n/OCJ5guRPlxC1fdz/yc
	zvFZ7x26I8wIXQ8SEvKdyMR4mXOK0jQ==
X-Gm-Gg: AYBFou0cd1dG3zDnUowWG1G9D6Vbo7PEPAfvQRykuxLl5KDq9W9oD5uZFzXH1vM5ViN
	w5PdnvMboFC943NOGXBOUz9lDIImnxd0jDisKrW8a+MRQUwm510jaBmeebmkyI8muUHosG/oc1x
	I7wCNmUnDErxKOKGeJ0SgXZohKcykSO51Tm4cTZ37lYzXB6cWdSupo1yrwf8x/glJ+PgOyXISGR
	tjKjlON2XQWTXghtQ0D2jIB9Qvq4IinhTOQSZDkx/2uBPRkSGcOPgH5K69xhFl8NGLYob9og6do
	6v+iuwT41XegZTOqLvh7eK0AVC6UqYpKz5X0Q5hwuV3/VYTaIxgCxpW25TLeK8HKJe4eEJFCaXw
	xxRB0eBE0ZMWezok/B256JxNZjmb78qi7bIcyGT3tmIdHkguheIlNDH1YotJ2UKLo1w==
X-Received: by 2002:a17:906:c143:b0:c29:4204:8dbf with SMTP id
 a640c23a62f3a-c2966559aadmr741799066b.7.1789331515865; Sun, 13 Sep 2026
 13:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqRM17TZ0-5pd6Y0@sirena.org.uk> <20260912190056.42192-1-mhun512@gmail.com>
 <aqaKPEFt7fQe8QQp@sirena.org.uk>
In-Reply-To: <aqaKPEFt7fQe8QQp@sirena.org.uk>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sun, 13 Sep 2026 16:31:43 -0400
X-Gm-Features: AcwNN1XzcLLgpV1RUYtG_pNLmmim_sFz6TTENWG2NHxxEf0dq49kcafrryEazGg
Message-ID: <CAGEsz8Gy5=4msSzPjvRAS88EEbZ0eRvpocu6iHQWv8-48J0dkA@mail.gmail.com>
Subject: Re: [PATCH v2] spi: rockchip-sfc: skip DMA cleanup in PIO mode
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about that. I'll send future revisions as new threads.


2026=EB=85=84 9=EC=9B=94 13=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 7:34, M=
ark Brown <broonie@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, Sep 12, 2026 at 03:00:56PM -0400, Myeonghun Pak wrote:
> > With rockchip,sfc-no-dma, probe skips allocating and mapping the transf=
er
> > buffer. However, controller registration failure and driver removal sti=
ll
> > call dma_unmap_single() for that nonexistent mapping.
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
