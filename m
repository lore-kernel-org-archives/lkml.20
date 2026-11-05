Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840495;
	b=GrQMVL3qBwlGVR53GCs8Nyr66ZayfxXNilmAiznA00FlESb9Nooc5bltBY+woBwJP3u/
	 CrUr8EWkp8ova2qMAijyQSTAC9kds/gSjoMkKTey7Ie+iVpo1PskNpTv5SZv9+9p5CvPc
	 EcaM1Yct7qHNZfYLOcMeM26iHKc+IFE0hKSyIsNIKJjf2/01BshZqlvKLyateRWs0hQBW
	 obksQiUxV/m572WNvecHqMqLuFXtajZ/Mut+y51vAroL9Za2v8V+WLQciIruz8CZma5gW
	 vW8eTrliMZRExd1AInPgpOkJhHM1MWPbywjD1M7aZww/vnAx/Ie5vunE/AML63yJIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840495;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=kZxX/XIkUIJjuTAxtj9rZq8g8wa65n2oh9KUXIeg7Jw=;
	b=QjTRo8SjYEJt5xAo89b+Et5CRas2JrLac7vfbqDR77pQIr7jZJckXMITV1tsezSgBDYo
	 w0bYV+MTCGsHPIYqDAFIK7QubAIu2QBG0d2GFWuazBQd/VXxPHP9ZcXjydpg+d0xSzQjq
	 Ufjz3jVoAzOifoGz7nA464UmE3vY2FPow0o3U21d1JTqU63GJ6KKQg6c7nsn6HV9Pjuby
	 9MwowWjfKgADr1Yg6CCGqm9rG9m+nJ2eHTIJPIzAG964G3KYlTngKHdyvuN9TmBHr1Z24
	 7Zf+ar5wDrQraNsBKjuWkYpAo7xs9+6q4nvQNI+ChDyIam0CkYAV24xIFtg0HD7dptw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eMR10iCu;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC1606D828;
	Thu,  5 Nov 2026 01:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03FC1606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eMR10iCu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793840430;
	bh=kZxX/XIkUIJjuTAxtj9rZq8g8wa65n2oh9KUXIeg7Jw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=eMR10iCuDsFB1F78SQwns91/ipxyB7mOxad6ESpd88ZvFIjKpj/akcwHlXtIdCwwl
	 Ou4DipQck0jyIQYbeWHT4kwcNTV36CGWcwFKFBZ+GqDLsqvAxtZO3prWnUzw8JqwUw
	 ByACrxS2jSSln4YLVdmNhMljLKusqm+G8q2cz9Jg=
X-QQ-mid: esmtpgz14t1793840425t9f665007
X-QQ-Originating-IP: 3kPxtlDRI3SKmHDdIjQxdPAEL0gM87Iz4VIbjjf+RIA=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 09:00:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13532499832840154010
EX-QQ-RecipientCnt: 17
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
 boundary=ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Nov 2026 01:00:20 +0000
Message-Id: <DMMVCWRCJKLN.3GKI5P3X6TQNB@linux.spacemit.com>
Cc: "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com> <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
In-Reply-To: <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MiUxkXieYO8R5F479AZG0CCaMSPpI8BjUSMydLSCmKzOjNvTBU8VtAxi
	JXZtp8ezY8aeOdCyzCS68nr5BR9s4J5taYFHCI29RbWgLuuaEgBiio42s4AfEgpVvUW1v5C
	vz44OcAsPCP8c2ym2stbX2lS/5w9FjlRiuXwS1ywnZUr8nXmP1lrmXPzYUbSJxmmp5jBnrV
	v80FChJoAqRZgz5jzHb6l7KXGEYf7amU0KYmfWCqP5MX0KbJGYuF8aVSx0zogG3ooezDwm6
	5+nUenLK6WLTULzqQ6QokEePTnHJv4O/Av7FPNhq3xL3UVje/OWHF988AjgpQEpA1WUy3//
	HC4ZJIhi1Jrm3ZdzR3xV8XG4EtNAfDEcygQf1RDkRAvt9bdBzgBfn20Gcb2cidTyxJSKgHp
	Epsliz4+qn7LT59G0rfjR1Vb2ucHv1wS4NxLQWtALGh5TPdutL0jtJ9z/GJ2VzVMFjNdKIt
	rma1VXM+Roq0LryzShJY275dJO8/4hPop8YWZEXxkadRB49/GRhsM9IB0dNIcjmojx+SHVj
	3KOujew+YVtQkJKtndue5qytOKPklFQoyEfudQGI7Z4RMrlKyNuro4/qyWiroKJi4w/nPvs
	PrnB/mL3AWFMSYnMr3yh0+cHDf/QAhpzzIXnW2AJkfn9vbmBFXokVBi5QVfcvCB8Wcl6O7v
	JM+XqSM+3kCcXdfhAEOooifBDp08DMR6OSuAkooEEx8Kuc2DGAWTnRy6UQIJN7RLF+DhfgH
	GkQY2tPUD4puqZdudoev8npCls87+8gfRom5zdsQgs57B7WN4lCtSmWiN3APxjX2OztO902
	zhtEwyAfKdGo8IhlGFGDcemzzZZ5V00xxX8ye/Ag1amGAEdiTM7/572BAy0d3clZysxob/N
	LIvdMRi81e4zn+PVOx1pqYx4HDUPIKwQJnZL86Idf5220YQfzvIB5DkSHt6urfbodVjK/YB
	F2FkRkaeJd4/PWhzeVCMSOsprMYdVAi8Z/aXaya/Tb/nM8S20lcRsksxLE3tyo23dl4uw/j
	ugMuTeJusH9FT8OtPFDt3kSoMofx9CASt5N8u1LYU3g/rv6MdJrLZKiIcskY7w02zUI333n
	PfcnNp74GY93SlLilW4oIaEj8LklxqT9QrhsGVl5biU
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 6:34 PM GMT, Iker Pedrosa wrote:
> El mar, 3 nov 2026 a las 9:56, Troy Mitchell
> (<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>> [...]
>> +               timer0: timer@d4014000 {
>> +                       compatible =3D "spacemit,k1-timer";
>> +                       reg =3D <0x0 0xd4014000 0x0 0x100>;
>> +                       interrupts =3D <23>;
>
>
> K1 timer specifies interrupt as <23>, but K3 uses <26
> IRQ_TYPE_LEVEL_HIGH>. The IRQ type should be consistent.
No, K1 uses the PLIC but K3 uses the APLIC.


--=20
Troy Mitchell


--ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauvVJCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+QZwD+LjXA7nF7yyOy
r5aU5N43nrOkq5zWRWyg3wPUqMQ60okBAIu/lWTjTK76ntl7G6+I0RE4LaYRG3ec
dmzhL1IFj68D
=Fl9h
-----END PGP SIGNATURE-----

--ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05--
