Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794055744;
	b=lxauD9aVOZ4BqKXh1f9TY/V51DWs9Z6ZoA0lRGoQ/6ykV5HiuVCWhTy84nQchiDULlqD
	 43vlH0ihw4oT5l2cbZ7pxexe3kIjP1krxTaDsONQmZ0FpOCLwYh8HInG2g6nswzVTKIPS
	 Mwq0Oe0sMLrdtc9B+fwHEHUIImBf488cHiVohsSE5PG0w8VLvbvq4TaXOnssHP6ZB446I
	 reSxTYzHctlRFGILw8wvyzK82yMXebtKPtiqLouD1itXzmj4X7NjCRGUTnR67iIUlx6in
	 2k80c6N2Eh6WHqYFm2liSZbqhlC4YndOOLE0vyjtQEYUKoR3R06LmDtoVExrmOWfCSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794055744;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=CaW/VQHTPMCaOIjymW1vJwqHbfTh8Y4QG0yBDvfrK/U=;
	b=RdmDTziHdOT0wQ0E9No2C6Y4cg4n6TZpD5zkJlJz51W5erT8zCli2rZ3sBT56h/gX3dc
	 V1AdYEfLJ9ofG3l2Xvmi5TxANlAaqgGyzyaWbM+DQd3x83NeRwYGhujMO1ewzXU7dsaNB
	 TxI1RrYlbQ1DKRjhwdJT6jVLGcHWgySSKj3oBoRBx9g8/Py3ie/eFXKMpSc7ofPw2X9/s
	 lI/A3mJ0WFmVqBaS3u2gV5plJI5uqQ34fWiJ6kVCXVPlXW03LNqsuyS6nqs+o0MJmEiU5
	 ZOjw4U/XbY/niB5iQC9o9ieo0tAoafk2ue1jehskJGs6bj2N+0K1PQL2xGS0WWgf/eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="eC/Vn1Is";
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA21606A326;
	Sat,  7 Nov 2026 12:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eC/Vn1Is
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794055718;
	bh=CaW/VQHTPMCaOIjymW1vJwqHbfTh8Y4QG0yBDvfrK/U=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=eC/Vn1IsbiohnHTB1tSgsdIYWwZcVVOXqLN8jRbOlccGiNqVAuYIQC9NqoyBB1gjS
	 Q1mYRKc1o3dT/vJ2POHXmVhwloyPVlqK1luc8WfnMorWm4tMMc4H9YhsICG7s2bliT
	 vKZemOswUccsL19cQpV3nKVwoUgvCA7ZvUHRyf/8=
X-QQ-mid: zesmtpgz1t1794055717t9ee4a99b
X-QQ-Originating-IP: adEHd0p0H88g7XXNw58gtXAVSCXWiNn/74yyaDVntEE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Nov 2026 20:48:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18126235862293624817
EX-QQ-RecipientCnt: 14
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 07 Nov 2026 12:48:33 +0000
Message-Id: <DMOZO92UHE9L.2PC9QE72225NX@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sarah Emery" <sarah.emery@canonical.com>
In-Reply-To: <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
 <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NpebRJ4Rwrau3Sdz/kxEp7NwDGkGjgfaH4r/aOxK90RUB3jsolxKVyA2
	uSKCajNHAV+eAGl8asM78jOcXziAhZANGLtPAMkRGT510XOAnBDlVaNgfIaR1eI6hQCrNLg
	W5bjB5tnDbxwIFHGeRHy2j++bcf9fEqvYy8s9i+YgvDtR1OqbXurThMsN2jNstbtwb8rDa3
	yJvFkNcJGlvAYdW8svLbe4BmZKpN452s/Yg8nOCyQBTgRdU+VmRYRiuVf+2y2vIZ1We3/YE
	POLaKH4uqJvlfMXSGex990NTNaVMCQxzomFZJnHKtOdhw78k53CXK/Y9vcdiYef7NdnTjt1
	nkJ+t5Jv/a1nBS/fpHgC76yuWaGTmjFwu/49GUoZ4jlW3fzRCb/+kPezIbz7fzztY2NAnNl
	GNLVgtjAEwkIcGP7Xge+DAkRtEeoJ3i26B2BRCQzl3+f6X7s8WVOUvd7q8TTqbOnJDsr7DR
	B3gahb/62LbpXKYQuqW/s9MV+EYs1JuwqafEFONKRBa3b5jPmNUruP99/pVtPazJ3ydlgzH
	KsoRYsSMI4+JtlT00OyD4KL+cHPkuadgruzQyIy5m25rvF9U2qCUxIQQAXHqIcfJURMS0ND
	7fIykpQkn7G3CgRm4xc1agHZqSa8PVSdlaAlkKS/ZR00iUBAHhXHrCVTUGtBeK6p4pI8dNZ
	A76oXvP46uB/oCRjUj6AvmvKrK+wZ2LHH9nbZet/UJjBZTvArnRZRTknU+0yZ9EXczjf/Zf
	Kk5Nq46yPNTS2gn4nomy88Bcc8LCwjEoVa3pJbZA/Hs7A9ZrVadKiG+wcfRw3e90E0aUtOv
	rLM50U0WxYZ5PA9UMuaG1F0/zDJgQXveIg+NilI2EeY+XNLU5mw62zqiDeQn62L6NOH/Ma3
	X5rlutHfgHh7R/TKH4fHo7Gu3LQMNvdjGemYHZedI8HHs2N/9NO9DL/5O1LjqkY9g7TTPns
	6WscL9oBp5J206pXwBalW4BhjB+fZRLbiCA7xrg+3m+UNq55Mx6LJyh7WQbCZTQKOYPozwH
	LYkqUYcei056gzd0W5j0i96fzK6oJl9merBEbYdCyKnfuvBkMZfBTZqEGIVUSyvLDUvfIrn
	xrEBWI19IUDGLM0+kRb6xw=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Sarah,

On Fri, 6 Nov 2026 17:25:48 +0100, Sarah Emery wrote:
> > +			uboot@210000 {
> > +				reg =3D <0x210000 0x5f0000>;
> > +			};
>
> This partition ends at 0x800000. On the CoM260 with EDK2, 0x700000 to
> 0x7c0000 holds the variable store (NVRAM and FTW), so reflashing this
> partition from Linux would erase it.
>
> I think we could split it like this:
>
>     uboot@210000 {
>        reg =3D <0x210000 0x4f0000>;
>     };
>
>     var@700000 {
>        reg =3D <0x700000 0xc0000>;
>        read-only;
>     };
>
> What do you think?

The layout here is the one used by the SpacemiT boot firmware for K3,
where U-Boot owns everything from 0x210000 to the end of the flash.
The EDK2 that SpacemiT ships for K3 (including the CoM260
configurations) keeps its variables in memory and does not use the
flash for them, so it has nothing at 0x700000.

Which EDK2 build places the variable store at 0x700000?

> The Pico-ITX node also uses 0x5f0000, but I think it should be modified
> to split out the var part too if it makes sense here.

Same answer as above.

> The Pico-ITX flash node also has vcc-supply =3D <&aldo2>.
> Shouldn't this be present here as well?
Yes. On the CoM260 the flash is also powered from P1V8_QSPI, which
comes from ALDO2. I'll add it in v2.

Thanks for the review.

--=20
Troy Mitchell

--4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau8eISEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+uCgEAthE6bIYvOlzD
wqobCMr4ha0WNJvGiNXT/BT3N7SAiJkBAN4u1t6ku3jmGXMK3UEnU6i/5sdIj3X7
h8QseFaXeUUB
=84Ci
-----END PGP SIGNATURE-----

--4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86--
