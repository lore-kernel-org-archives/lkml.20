Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4671DF75B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791766486; cv=pass; b=GfwILF83MBSo0a1EFpT8RDGrTqEwCFS+v5FIHicKEO/6dqgQMkWK++RcKP09qJOlArnJtsX84M221Vds0dxjN4U+jOwTigZ+GoBGZszmOpm5JrWGumZMEBmzT4n4xKQgsVFOYlWcP7l/NlXAMhp/01ZZzUeM3t5aFbk4HWFRxTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791766486; c=relaxed/simple;
	bh=z73L5s6hared9oAt/obXy0ATGlrzfh6sbHRRtAq+RH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHqMDnxXartSQ6z0EuzbpNt0qCL25p89jeBIPXpxN3kC2a0oW9buOwUNozZSDIwxIa9CYv6NRPO2sAGTirfk/X2244clj+Vm4s85sAunBxdn7oBn9K/PnwEH0XUrbLYRV97sMEMptd8zJocutcyVzLmzv75+4VZyrwyjA9Mqu1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=odl9ciT3; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="odl9ciT3"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93a40a9a01aso822934785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791766484; cv=none;
        d=google.com; s=arc-20260327;
        b=NXO3GHDo0Vbb7110vBsAB3/okYQCQP59rIcZBdBYp45DzV7OfNbUud4jzn219K+DPv
         1V2O0qofVI3ld+0pg+PR0QxlubGDrPWC6w6QkQ0DY2zuhAejYX4GgZVI3gr0MGvh6Jzx
         oqBVkhZ0TaWbu+0bL/sg49sOrYgt+T7bBlZ5Gm4ClJdCmCHhInCAkLI7hMEAIdt0BRZ0
         v+vt9HrxOdaIsoFhfPgcRFuWBRaFwOpCRWdH8NZE1g7gFYBs9oaUDJL3D7y/T1R7OjAk
         JrkF0gJRj/dfQAZ/rieDrWZs1IaIyNUnKQeSremdJYCugxsu9ntBmztLPzKISF1xSC5e
         kfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z73L5s6hared9oAt/obXy0ATGlrzfh6sbHRRtAq+RH4=;
        fh=cLghsYR2sC6Pk4UR17I7Y096sNIq5miKmh29VanXvwM=;
        b=LsM8oxPdZI1AlAcYNJtHU6hjIC14xDvMeE90wmALoUEnCU75Ho/KAT2YWhsG9p2JH1
         txHgoWddcy+t7li+Gv323klbDry29zWWJKSUMn/7xli0MGT25jOjZrM2ogW/Bw0N+V6C
         A6+VpK33g38n0OO2Atr9bcdIdpqZ0inQgiNSwXCuIM3OdJpmGyKOMNWNV3+5/v+fr11S
         3TEDP3ow5hcx2Hzv4IRQNZfJxaIlkqhux6MyYXvqAtdQovJW57vYZwcyOFrSzRgSjlyi
         Ug7Y5sygSgocNDpR1ZIucLT7JgoFRoWo/RVGBiQ9pitGQE81h/RKstqPVBXYIuAYxcdy
         ESCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791766484; x=1792371284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z73L5s6hared9oAt/obXy0ATGlrzfh6sbHRRtAq+RH4=;
        b=odl9ciT3nV3wd9Uwxo4veYr02lJSyQMmDbo0aerb2f6DwfghsQyBw7WEi1ig35fy/Z
         Ba1eCA1hDrDPY2k5PfvpNJECZKr4rj/ZYwv2Tf3u8zbZ7WOOaOTE3oK9j8mTVoqDJWKs
         pX+zC5ltq8IxvGq3ceNAoe/9rjdhb1hD2p49/q51i12JkzVAEJBEGGtREO3K8ndojjG0
         pB+sBUtOYbqk/l6urGs/f4m83e5KXjmjHEm4xFDcyPLN87V0H1Pb4mzMzuajMY8x/guS
         uGxHfjrzUqKfUjwrs5feVcFk3q+tHnMxIPJpYcQOyLzFqVWYpb8JB0OpeBjs/wXgozw5
         un/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791766484; x=1792371284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z73L5s6hared9oAt/obXy0ATGlrzfh6sbHRRtAq+RH4=;
        b=SgDvVtC/5fFhzymIPJVM6VzWUhzAcEJEmicnA6xOnzzp2V7vzCgZ4I775RwxZI8LMq
         CzuqOeiPBkMZpNUEt8ZkKN4PmTRTf9AfV+C2pn2e30CTMwmj9aqJuS2MAGuH4I8DzCtM
         ALDXIB4NNmNfETsJKPhc8yAVywrGSDDhbBPeBO3+kaM9ukODvB8XFdnSKW1Jj6FPczOX
         yT14+LKjo2VqGtDf1eX1ahwaekQuVWnJdM2M1FBUbcpOR45LyQoKYSVPfRH//sYq6NNj
         2/mFGh6Yi1QgWOd24xPZF8AuIcFaq8pghzMmPIBJzGz8Tx0HJEQ+cqwpynhOykU6Tist
         8WoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0lhQMNRjboBINPSlUyQW4H8OVlVw3UvD3LEivdy6dkFtDyHu8FsuB1SOs1+RzimuRd11b3NpcCp0g/e0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4gxZc2TxYqa3QjI0mTLgxVQxjZ66caqfEM4rceizdei/++UvJ
	Al2BiDSTl1RjKA1PdfQX80ZcsR2/SHkm77GOF3z4GAJhANyJYR6aDmPOPukny1HjD/BcQz/NzCp
	xZmOd157mQNPyEmf4fqb39KJZxgyVHynDP2Stqkeg
X-Gm-Gg: AYBFou2A10yXcuPjecVtkw9kzk5Ko7Sz2XRIHaNGP8qcaVkcFCP/rQxkjj51/OyX5Xw
	DRIAmjjCoP1XKheLnbzUgcafU26rpKXALE7D2Uyor8pKOMjsSbiiCFGdWjQA8hrGVlhDRKYl7Ua
	pBDpUSOB2mecq4/Gxhds4b5CTi5aRNUKWNiDplDtBL09e1+05S179ymj8zjBpXipdrxVC9i2l/W
	kg+A2t+JDUD0qFi3gl6z2WRdilSh6YIobsjmJqKJXO3b1zZyDhbShAv0xLjoJ1EqyDGJHSRl31f
	gr4wmtFSOTXIT+2oJlOIefMy87XFno20hhhyBmzoCoEtCMNiCLUnzIqWhTPDYruVQQ==
X-Received: by 2002:a05:620a:1711:b0:93e:c173:f68d with SMTP id
 af79cd13be357-93ec173f8abmr1211663185a.33.1791766484355; Sun, 11 Oct 2026
 17:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009143506.2507607-1-jjc@jclark.com> <20261009143506.2507607-6-jjc@jclark.com>
 <3b1a2994-5251-4800-8c61-b63d7a435b21@broadcom.com> <60accbd89cfaf0d4be1da5ec2fafd975@tipi-net.de>
 <CANz3_EYfcBopo=HgRioXkhoT6P+4WWpfFT7UeWkXd5eM_RNpSA@mail.gmail.com> <41c32f5a6f38ec9df8a79ce896912fb9@tipi-net.de>
In-Reply-To: <41c32f5a6f38ec9df8a79ce896912fb9@tipi-net.de>
From: James Clark <jjc@jclark.com>
Date: Mon, 12 Oct 2026 07:54:33 +0700
X-Gm-Features: AclHuK-h1OFPlo0ZWt0hvoY6EkyW_QWQiWizvFOHFe2U9C08x_069ctmbPv6tuU
Message-ID: <CANz3_Eae-M6V9XROx4GqPB+BVjVWWuO5JqGoBOybh0-D7DNZVw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/5] net: mdio: bcm-unimac: implement timestamped
 MDIO writes
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Doug Berger <opendmb@gmail.com>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Conor Dooley <conor.dooley@microchip.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:22=E2=80=AFPM Nicolai Buchwitz <nb@tipi-net.de> w=
rote:

> > Let me just confirm how I would need to adapt my patch with that fix:
> > in the pdata branch of the probe, I would call devm_clk_get_optional
> > to find the clock on the mdio node, falling back to pdata->clk. I
> > would still add the chip-specific compatible string because the number
> > of MDC periods has only been measured on that specific hardware.
>
> In the unimac patch you would only need clk_get_rate() and can gate
> write_sts() on it. Not sure about pdata->clk though: bcmgenet passes
> its "enet" MAC clock there, which isn't necessarily the MDC reference.
> If write_sts() only trusts a clock on the mdio node itself, you don't
> need the compatible either.

Sashiko wanted write_sts limited to BCM2711 because the 63.5 to 64.5
window has only been measured on BCM2711 and we don't have evidence
that it applies elsewhere. If it doesn't, then we could potentially
violate what PTP_SYS_OFFSET_EXTENDED promises. I think one could argue
that this is too conservative: clause 22 specifies 64 bits and the
63.5 to 64.5 range falls out of that given a free-running MDC and some
other reasonable assumptions. Andrew made a similar point on 4/5
(https://lore.kernel.org/netdev/c136b0ad-6d7e-4695-b988-55eb37550d01@lunn.c=
h/).
Florian said he wanted a compatible string but I am not sure whether
because of this or because of the clock. In any case, I am happy to do
it whichever way you and Florian decide.

In the probe, I believe I still need to add a call to
devm_clk_get_optional() in the pdata branch, which is used when GENET
creates the UniMAC device. At the moment this branch does priv->clk =3D
pdata->clk, so it would not pick up the new GISB clock from the mdio
node. I think this new clock would live alongside the existing
pdata->clk: the write_sts rate would come from the mdio node clock,
but pdata->clk would be used for gating. I was not planning for this
series to make clk_set use the new GISB clock.

James
