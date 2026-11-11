Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401185;
	b=pQ7IKHjjUoj96+PRcnwx0gDua2o+hWHXocaOo3UvJfVIda85kmdXQOljRgtvP+iDLF4b
	 XSHF2SvCYVH7HzfaM1xoLRSVWG6BivFeC3c2ykrw86sa0OJ10bY7aQ4jLZWp/JF6qfxGw
	 VJjzE8tFPhttFiZ7O/ucvxDmGor32MgEU3enojO3dgTLaKhNe2NpPcLmRkZLuNAp/K8c7
	 tNL6dj9exRDI1M1Q2a2Oz12FIkQTdLOm65CA+BcfraXixSEwsCXyyAACNqCKEeubVVVIK
	 ICjW2ivwJJIHW0Z3F/ICqIdkp6rO5wDhsbMYX9w7iolhygPFQGL+JzcXbHCl4tcauAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=dqsxlzBlqew74SM4eg26ANWnUTuVT40bw8C0+TaKeeo=;
	b=GPv4vxWela/SBVfqenz2OlfvICC9ggZBCgmJof9ZaIzrSE5D00m608zjr2wFxiwdJxCQ
	 AzRCkrNFgI4XclL7i84rcHASZEQiuK5dAgXNwjkJh7rJQZD7joehwrh2zbhVmiChdlFcq
	 VjdQUgg1T14ZFgkGY5FO9/ETW246tudF3BdzYihRsrsOQkdSZIFL7FjFIgBhVwqLtxZK5
	 2F5smNQSWPkOhU3c9UbpzZ4A8DDOj+q8HR+XJcVoeKjBshx4Mort/aYKOx9jdd2qXVSPW
	 V2rTzEG85jzbrU5ykFhLjxj0rEec87qsASQRcY/X8ZH4v4HabPulYPyhiGn7clrmWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PhPF5/f3";
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AA606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhPF5/f3
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b394e2af9cso13145687b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401184; x=1795005984; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqsxlzBlqew74SM4eg26ANWnUTuVT40bw8C0+TaKeeo=;
        b=PhPF5/f336kk32pIDggkoR5F1cLDUDOHlAT9EDD8vuatswaO3ulHJeY47zN+FViWr1
         AoSyekktOMXiwWrnLb0OoyqxIx/mho7L7jM/xI5kb8wv9Y/O6QIrRodYh5QmjGeGBPu7
         D9MveKpvkX9cxkKH3+rLJ0uH8dOAy5cvmk1T/h+LBOM7qvSaR8fd7eCrYV9DnwLsq9bK
         ecDw4Jl641jOZOmww8+7E+6RxiZGYYsVja7EavwrseSSU0/lZgPVI/kCEnBfVxySXWSF
         cZW0Sjb2ukFfnTln1gnQnKxuvm+PTE9ZmgY6xth9Rp3qpmn79SH21lsqBFr90TpejFnT
         8ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401184; x=1795005984;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqsxlzBlqew74SM4eg26ANWnUTuVT40bw8C0+TaKeeo=;
        b=eQjdC4xNFE7YQgX6zWqUWocoF4zPVN6aHAWOJnuYKEbuU8jnvFVl+x46VxcfN5LQLj
         JmAJnUIARK1ras9uU/OAkIl0+06b+q7JW+1QQ+WXi5SSeO23GL908FyK4QeDJX1PIHkm
         qRkTeboU5TBq6yCLlw6G73zEJQb313ko3TxOZf/QgmWUvesJkpAcgSZT1HJXeeQUcXNm
         mHfcvhKjIRqAPPZbrPAMOF6DsfXu/nYV070mHSZpA/ILAlsng2UDXhE/c9IfhJtZXiqi
         bnxtFPLsOhQPBaNhwLeAN1OeBkxHSmcoDJOSWxeowDDbbcw3Cnbt1XnadnE4jvkb9kuK
         qOxg==
X-Forwarded-Encrypted: i=1; AL+hErHmyQEOxz6H9E3Slw949DDK1hDKmXhM7mfTlzgQAYcALY8Sl9wBbUCBlyYkaH96JZ4l6kxIZJlb8t4fPbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r3VJnF5F4jyOaOtU2KZH4jNVSslvjo0uZWA3aY5YuXVTGurlt
	eL7DWj+5iPHLQMvjTJIxSwHRi9mwcl3pX+hpZlN7WaHe0KMRUMQpIKSBHbS4O6z7
X-Gm-Gg: AYBFou0K9TPP8GJTiiSmdrUvST+AFa9A9GpzA7BbAVBJTBKJ0nT6HlVgteBr2Qwf6wg
	rwWdFHB52adHTxTczstRinawO9DvPAwnUXwJiU/re1eNo7g0iiJZVdCjKs/HjEGSIUF8fMrXHdN
	FsQvZSnHvdYIqw9AnThNsWGIzO9Txwxo4mUpoNdLk3FIRYFqAA5dS1kLXVbn+ZkFyRlvkEci4uV
	F6oHMQnWMmYWMY5FJsMNJ3/GBQp5RccopbnouVuX5i5kjq7GM85L1B4vEVwVeuXlFs399WWbPmb
	W6mdcKA8ST6HC4MlvpRnf/oyXSgs3UGXteIUHZos9yBxGszzX0SPEQDFQN0zrsH9EsCVPzA8971
	tKDzh/d10M8rrholYmrPYvERfh5npOcEKo7c6C17VhvGbaSkP/O8NlVY2GIkiKmymb2g3E7OSFR
	AFtGeWKebzVp0SnLrIG6rpcHfIdBINzg75QZtxOzhe//ROTxEeBx2CRXQGjEwqWyFL8ccb5eWzJ
	HarSgp1HarKj3Znz+Ezslt2t+4XJejT0Li6i2rah6r/p6WlkkN+HqlsuJhYgCCU1H8mHhrAQYZh
	19Pr9fkv6ylEO2VkPMdNbfkLdzp37+YrrbdYtex7NXCjTOObPH0HfWERQTh7kw==
X-Received: by 2002:a05:690c:7482:b0:8b3:56bc:495e with SMTP id 00721157ae682-8b3a801e5e8mr16968697b3.12.1794401184204;
        Wed, 11 Nov 2026 04:46:24 -0800 (PST)
Received: from cacher.localnet ([111.94.230.110])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3930bfb64sm43554307b3.0.2026.11.11.04.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:46:23 -0800 (PST)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ALSA: hda/realtek: add micmute LED quirk for Acer Predator
 PHN16-72
Date: Wed, 11 Nov 2026 19:45:32 +0700
Message-ID: <1jca4Y-sRYC8k7kF1YLCmA@gmail.com>
In-Reply-To: <87jymju4jr.wl-tiwai@suse.de>
References:
 <20261111021328.16153-1-faiz.faadhillah@gmail.com>
 <87jymju4jr.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9ruMX38yRFmCy1eDNUUa2g";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9ruMX38yRFmCy1eDNUUa2g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 11 Nov 2026 19:45:32 +0700
Message-ID: <1jca4Y-sRYC8k7kF1YLCmA@gmail.com>
In-Reply-To: <87jymju4jr.wl-tiwai@suse.de>
MIME-Version: 1.0

On Wednesday, November 11, 2026 3:59:36=E2=80=AFPM Western Indonesia Time T=
akashi Iwai wrote:
> On Wed, 11 Nov 2026 03:13:28 +0100,
> Fa-Iz Faadhillah Ibrahim wrote:
> >=20
> > fix micmute LED for Acer Predator PHN16-72.
> >=20
> > Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index a756e0076021..fa78a36bba5f 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -7553,6 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
> >  	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_=
HEADSET_MIC),
> >  	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACE=
R_MICMUTE_LED),
> >  	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEA=
DSET_MIC),
> > +	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_=
ACER_MICMUTE_LED),
> >  	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_=
HEADSET_MIC),
>=20
> You see that there is already an entry for 1025:1731.
> You should replace it with the new quirk instead of appending yet
> another.
thanks for the correction, yes I should've replaced it instead.
>=20
> And, please elaborate a bit more.  You're changing the existing quirk,
> so you'd need to show that there is no regression by your change.
I can confirm that the headset mic fixed by the existing quirk does still
work properly with the new quirk, what do i need to show exactly?
>=20
>=20
> thanks,
>=20
> Takashi
>=20
Thanks,
=46a-Iz Faadhillah Ibrahim

--nextPart9ruMX38yRFmCy1eDNUUa2g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQ4w2twx+ytUQ2e4TSHcmckvkvFGgUCavRjbAAKCRCHcmckvkvF
GhVzAQDnLtHDC0XAj07LNeeApkyPDtbw2pLd1MRVX7ITA1uRDwD9HEPBArX8mOK7
3CGlC4F0bTF+CFOmEk4RoEjkhCnrcAA=
=+rHd
-----END PGP SIGNATURE-----

--nextPart9ruMX38yRFmCy1eDNUUa2g--



