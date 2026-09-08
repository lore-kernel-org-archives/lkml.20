Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B63346A8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848236; cv=pass; b=SaYZ4m/keDhBWX5+U//Tho3GwfnFIV64NTK6bZmsRz2hHN2HsQ1Vh6euG+/w5JS3FpGWyKJ+dTDSRhp+AVNvunqgbRN6SOcnQg65w4Z8SNoV4lR2ANLRnOX8txFGLF8P9rkH66j3qJ7SabP20BjkeSxhhUHxSCQ5rcKvlQlXvCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848236; c=relaxed/simple;
	bh=1NgBz3a7Sjc82pVPmpM2bihEnkIfGTA5GgOxYc9yoT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcxniUT+5n36YDfE1nXKNJGcFuJAk5fRAE0fVxOJCjbFEOsPWCk0IOHBKA3zOcWdqoCJQB3tc1XhxJRRJamLs0tUef71jz6PBbifizd+LiqXf8Hh1B+w+yj+hBceMTy7Tz73Ad9yA/zX+FulOpAcDl0OOcxnAfZC/0ZsIyu4Wfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYL7Luv8; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYL7Luv8"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b60bc6b4eeso2890631e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788848229; cv=none;
        d=google.com; s=arc-20260327;
        b=TbgQs5Wjc3sAMeeHWHNgsCg2f6aI4kl8rc5Bmm5lJLD5RMqAwNjLIWfnqBTXEdmnXH
         goYckcuEll0znyW0lSVapcx4LEbTpnzMLxzVbhgKGtIeZ5iGs+0FPxLSE9llssGqKT1N
         aandJ7YQ42t+MIz6bgwPSvh8nrO4vYhFE9whwRCyfG8CceS1BJe27wH19Ng5HDXnk+0k
         kiKlEhvNxajj/h7LFq4K7DTb8JjjP3N6iHpJU2IyUz8nUdpRtp/+sF5QXXU98rcNevKs
         qXo5+lBflQ8fLnzcDRAuh3l21YHXPAZr7f4rBIb/RzqM1g5xcJ72zN2PmYeqDXFpEt1s
         46lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AwI0LwqyHhjgDtst5s0PxI0QDScbBljDRluNcb2RYLU=;
        fh=xcUQI+EWystF4rOtHEdabm0lJP13hrPpTDLAmHPlfp8=;
        b=AtdfPZHIkzDHlxRKmMMDiFkR9GL8Rf8JON/0w8DzHUJToShh3XZz4Y0cLZMexZ3Kkl
         XxE7CjFSc/C6mGlIfFi2/sI6W5lPnt0ClyyV2prJ217gqBey9628b5GPbPc9hJ4m4f/N
         TD1bgd7Y6rsgyKmvQp0jwblyULTMxNm6ej6yUaUELyQhOaowVHJXleUUe4tadMUb/JAz
         Rke8nwo3xdAnRQMgTbGXC4NYeJBPuABdf2rlyr/gVsDWFTNygMiMTHp50UHUg4EapU3w
         pgrsJbxjdJGaMJN/Xcc7HcXNGwBu3FHJgrfIx6sPbl1k5WMAE4RFP7WhlD8A8Ar/HAMk
         K/Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788848229; x=1789453029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwI0LwqyHhjgDtst5s0PxI0QDScbBljDRluNcb2RYLU=;
        b=bYL7Luv8tq66nAOdH51/Qlyqp8qnwML364/kNci4PFCp7kskxybHqKCGYkZjFj7xE4
         uCJYLbPRrQVNMTybAhx+ACX+MWJAk4N/4alh0EX1G6xiEtMUmgAyTtms0zeelZRpAOdh
         3q1i1vnGrgV/XgBTL91jPrrOklHCdjOjnC0WWOB+ENaPHtrIJ4tL7Pz9PPsTL0EWFbKU
         XRcc34HV538FN763/6d0qFFfsA6m1DtlLeWL1MWTlsDh43eDBhRKDnp20iEEYTqJj9EH
         SaY7DbiCmFsehn7oduwsf4jtw73ZlwSGAz+a8F4RDEb6wO+EVRjKhLIDrjh4vaivuMeI
         YVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848229; x=1789453029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwI0LwqyHhjgDtst5s0PxI0QDScbBljDRluNcb2RYLU=;
        b=ciThTuHjHMDvvbfzU2a8icHlo+cs16Z7FfYO50fugxlBbBt5GqR4X2r4/1Yy5dJFip
         JBZ7+5iREa9Xp//sFmbABvLsNNLM9klGkAOtTzqbq9JGyoXvM4hI7Bpo2/HzG7FI7QGX
         5+ZlSZVskhXX0xUochqBk2j60N9XgbluiU1QO3oGgjGMu+N4gHcKaYWJSViirA/zUwTG
         D/s71vHq9VUr+U6jrko3ZuXMba0utdBlGzvvt3wav9454UsFx7CJXh+dKIZ5TEp5/9kA
         uF0rsaM3vUaXMHu7Y2raf03cUMk4NTMcQnWXJ4Kg1s1Fu9iiSF9zDxFwH2iE0XvXSgty
         et6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXwAyiimA57l4ZL/P4MYtiUamOuX4eMMpkFc6ZLDa7o4HLeYDJXmLa5LAGmBUfUrprqyKpRCBnsCMPWkU=@vger.kernel.org
X-Gm-Message-State: AFuF++loVhZCDMGuIcLUJuEg35TdH2lLhVRFSdcPraOSSZRsFxPUxQyo
	Yu25A5BC2tcMULTtCQWkWBOkHZivlQ026QLmuVT6P6O36h6iDy14GScVk+kEEznbR0Ihoe2HOQS
	Eo6kNHDyln3CElbSs+ZAB0Xddrc2BOWo=
X-Gm-Gg: AYBFou1AGII53wmF2hAhQDRc8M2qs9MqZCBJYLFrDu2QPQbvqrukwswJ7cn6tlrtF86
	rqzp4o8dEXTtFh9yfWZdOGyRyNvX7nSxhafy1vWbD/o0SxkWEe9Bmm+lWm6nsqfRKP289nHwL0G
	tlOgQZyGU3AdkS4mzDKvjI/zHm0P33UXPYuKX83TTKsrcxwBmyrYoYhNT1lnZg0meLRX1NIsuse
	YFoTf9lbn3VzxGOgTWtZBbBCLdLGkwWzPyNc7ZwlZDXn2KJ5X593oq4vwSmM9RcVsY3OQ80xX1t
	DgoHrTUziBMlmKGT5rdjdotJ5+KHQoWd9RKk/RaULcDfvccoGfAKDJKjWkxw84NGBWzhho7+SJP
	IjMtx8l06r9wCquKdPgvRPngUctQgP1m2kg==
X-Received: by 2002:a05:6512:3502:b0:5b0:23b4:be97 with SMTP id
 2adb3069b0e04-5b616ed4b1dmr8420185e87.6.1788848228754; Mon, 07 Sep 2026
 23:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-bcm4356a3-bt-v1-1-ffa2d5233360@gmail.com> <CALHNRZ9ofDZ61YW-ZN07sf8sZ6gx4n-8SusSR_vop7R_vqbGFA@mail.gmail.com>
In-Reply-To: <CALHNRZ9ofDZ61YW-ZN07sf8sZ6gx4n-8SusSR_vop7R_vqbGFA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 8 Sep 2026 01:16:57 -0500
X-Gm-Features: AcwNN1VgNWSczffYbVkpMII3iSIGGLuXysgoIqRynjyRK0gNvf16cPtdnFgElDw
Message-ID: <CALHNRZ-D1Yz1bgp5hJjwBW32Lhd4Lbt0dQj=3wq-xWqp6uSC7g@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btbcm: Add entry for BCM4356A3 UART bluetooth
To: webgeek1234@gmail.com
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 5:34=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Fri, Jul 17, 2026 at 4:41=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This patch adds the device ID for the bluetooth chip used in the
> > Nvidia specific Broadcom BCM4356 PCI-E WiFi / UART BT chip.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/bluetooth/btbcm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> > index 463d59890befe..14acea7325478 100644
> > --- a/drivers/bluetooth/btbcm.c
> > +++ b/drivers/bluetooth/btbcm.c
> > @@ -506,6 +506,7 @@ static const struct bcm_subver_table bcm_uart_subve=
r_table[] =3D {
> >         { 0x6606, "BCM4345C5"   },      /* 003.006.006 */
> >         { 0x230f, "BCM4356A2"   },      /* 001.003.015 */
> >         { 0x2310, "BCM4343A2"   },      /* 001.003.016 */
> > +       { 0x2409, "BCM4356A3"   },      /* 001.004.009 */
> >         { 0x220e, "BCM20702A1"  },      /* 001.002.014 */
> >         { 0x420d, "BCM4349B1"   },      /* 002.002.013 */
> >         { 0x420e, "BCM4349B1"   },      /* 002.002.014 */
> >
> > ---
> > base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> > change-id: 20260717-bcm4356a3-bt-cd78cc0f42e8
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>
> Are there any thoughts on this change? If not, could it get picked up ple=
ase?

I see other changes were picked up a few days ago. Is there a reason
this one hasn't been picked up yet?

Aaron
