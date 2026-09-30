Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046B24DDB23
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782379; cv=pass; b=L8NCnfajYPlPU3YcthFHzopQiiJj8ewkGomGo9dJIddlRsxd57pRn+yVlEo85U3FoheblvFp60HO69yxnFJxhuUcai0K9vo2Hw2HIi4ij/jrnBaH9TOtx/15uDM/9UPMEezMwD+MRQGg25rNeY9munOQEFUcsNKvymGjgvTdWl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782379; c=relaxed/simple;
	bh=jKEqTeivdQOtCzgWSJBttzXJT/4mH8xL3yRAI43cdyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMSut5VSTofykUZVxiHxAraxphcfx6XdYw20/a/AoUyccKMhfSxv/y/K8easqY9PBtno0kMI3cjxA1Et8enWoXu1myN6i+vX2Z9KKS2ro1df+98ZeiVprrtdI0OBmFX2cn4THvK/R9On8/78AomcfrU/PwA51QxwD0cIJ7LugSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B663guFB; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B663guFB"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso5430813eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790782368; cv=none;
        d=google.com; s=arc-20260327;
        b=ci+2pu3fWvQMIOlIFOwMwJI4TWi6EhpGWqCrbRE3DkkmwW9PNy0ye77YPUN1gKR4O3
         4tyro5+QV61E6L4dn8VZ7VxMh4iFa5MMbck8tDWJ/CNlsO9wYPfRVeycbbL/DAoJazth
         QN9fsHIdmisU6ASPbDH5w3fZW7sq8kGfXVWQek2kwggYLqjga9tqoAmWf/R17CvfBz6X
         3ydPTEq0JMgGQrJpYG5E9r1qmjy8J50C1+Dg05jIz3XJ00FLSxGPogYsTJ11h5uqUvsE
         MpEpFqLzTM4c7s0Kl964iG0dXFPGHkop+NWViF7X5nE/LV4J6DLsiIoeiZO0DYjDDOnL
         kXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        fh=lkDk+YaTuKM7Cb+2QGEn93YzQE2WSJ4m9MQvy80wsXo=;
        b=I/0EzNvl/mcrX3R8YmGxPMY4FQQQsGWg/6l+3VVbPzH+VeVOF6bYZIsTAwGz0uoalP
         gpb1hiQnQLsL8OuUNJ6VPWlPhG5Zl26Lb22R2xille4ronWpyAqQ140XcM8jJDKkvImw
         oQVfA3jzhTbdaOFDhVTNGaIxmpBP1Jl1HOfHVHUZ9pftEZbYX6Whbe1qy8ubTi41+Dw9
         eXte0lKPlfhfmBY2saM9kxvBeCB3U/rbWns7eN19qzdnZ76xWHKGoe6vwhmTzXABIYYz
         1eP1SbqvP7Eu2PnfKax9wmCh3TEOzhxDtYmeYrQAYdT0nyjUUryynLQxGrZeA4tr55yK
         7LEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790782368; x=1791387168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        b=B663guFBvAqOW8MQAMitn7yoJ48tDTJS9uvlodawozzZs7l/gVANa+uP2eh9dNWShq
         uKCqvYnAh6br8vgkgQC8qp7JgApeW6R7fN/oLDMga3t15MPSbBVqmnj1h9vBjE1/1LVB
         qyfoAa0sUzxngejtzo49A52hrkgSCz6i4rb44eofw0RFTV84xNPSfg65v5x6s1QPn6D9
         xaP8pJMh3zIy6w1vkJyk5XzpubgMwTDky/WTSZXsPggT/tyQKdYTbwszXP6jeznfY1L6
         kU5aZs0E30h/jFtseYPL4XDi1gAE7lpDxWPggElTaeLRm3Ucp3lr2W6pC6Yt5cKs2r5x
         Wt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782368; x=1791387168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        b=S0zFKp53xeaD6MdEFalVaa3Ba3S4crd2f7ia8iiESvxRgY4jPHGd4r4bjIiSIAVwNq
         vWNa/bVbF5BtphMrq+mQtyfmMXc2wUtF8VxbUfXm6sHQDPSjXseSqoxCKas27Qib4Pu7
         pesGsB9htEE0yyR27/bKsis4PWVPwpmY3INM/ikQwnv5xtD/zzsKwc3UxPpB02jHrwqH
         qjN8jU5bWBRGoK4fwC8hIwOVoput0SpXsDgMgydsRaep0RdoylVgwNTZtRPKBr/0B/W1
         piO03BAGWbV9Zk0zKmVU3T/VH4HvmlzRUGIHBl5PXHakIC3oypev9MDL36aEYvrug+hH
         e86w==
X-Forwarded-Encrypted: i=1; AKwUvBwXu2yaRwiAFlYEwYBMYTlGG2moLTWgDn9oDg2RUud1mhPwnYJgNXoajaeMzfjp4LQzhkNoc5G/sjIHhs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfGLMvVwZ7n8CjmfcWi2L4tjFGCjaQ818YnaFbZXER9O3NgAb9
	VfX5TAwfg7EXRLSzSfsHsNfDUFV7qg5OX82CGocJ4bm7dwgiFiibiklChfaqmlS+MgYfIh6iYI/
	ObfdJE+lFZpQF0E9jTtAk1jHWihb64/s=
X-Gm-Gg: AYBFou3wO/HtHVoR1BuXXlKnPds/YzM0atOmCoAy3nqwn51GZYNNzLM8w4Da1uXvOVJ
	uJZR+ei4AH8gvOS+530HbBy4BpS43fv8zxLVmandaMETU5ISB3TffkGzOm33q6i73xrZi5nzj3S
	0Wn6mrd//8CIxs3NEn3BIIMDg3Q2n92GeZzLN5Vo2vBsNiVDrl0T3gLwrwlNvs2npbJ3vYymzSg
	AbOz/0+Y4y4prwTAyPNooGz2gWQdFVxo9ZBYwWttN7nJoaVCC7Dq42+wGb6D64WhfdGr8Frs3Ob
	zLiQpZC4AB8LQKmZATH7phpwla8krI5b1bcEwm/pDg1/e+QREnI+gCA5LqCqvZk4jtvnar88Z/w
	hbQB6FS6dqNnG8w==
X-Received: by 2002:a05:7301:4e4b:b0:34b:fd9e:ad4f with SMTP id
 5a478bee46e88-34cdc4beddamr2091392eec.22.1790782367990; Wed, 30 Sep 2026
 08:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930072732.66578-1-clamor95@gmail.com> <20260930072732.66578-2-clamor95@gmail.com>
 <c0318145-a999-43d0-b0fd-231256a89005@kroah.com>
In-Reply-To: <c0318145-a999-43d0-b0fd-231256a89005@kroah.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 18:32:34 +0300
X-Gm-Features: AclHuK-_tulOAdDAmKKjx8njVHGh0FQ7Ovbfd5JZjEuw69vNm5JUgMfqqvzwGzM
Message-ID: <CAPVz0n3DseAutXOXAmD0mkmim-zBkYrW0qTyxXjwQenYW+GrNg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] leds: Add driver for MAX8907 LED cell
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 18:02 Grif=
fin Kroah-Hartman <griffin@kroah.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 9/30/26 9:27 AM, Svyatoslav Ryhel wrote:
>
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/leds/Kconfig        |  7 ++++
> >   drivers/leds/Makefile       |  1 +
> >   drivers/leds/leds-max8907.c | 81 ++++++++++++++++++++++++++++++++++++=
+
> >   drivers/mfd/max8907.c       |  1 +
> >   include/linux/mfd/max8907.h |  2 +-
> >   5 files changed, 91 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/leds/leds-max8907.c
>
> Sashiko said this does not apply, what tree did you make this against?
>
> https://sashiko.dev/#/patchset/20260930072732.66578-2-clamor95@gmail.com
>

Hello!

I used tag: next-20260918 on top of commit 3f2425f5b5bbb

>
> Thanks,
>
> Griffin
>
