Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840796;
	b=S73VG+gupVa3XMdy4OHwdaKOyMvYLAOBfXgzZkVW+6VHEjCIPDBD5LbFK8jcUNtnLYb7
	 c09dMuUlOkaQAqAGvmxKLD/glZ1ukS0PmKIhZVNyFB1hqBe1q7xIxhfB0Onj2UcGb+8Vw
	 sd8xN2+Y91b+A1VO54/05smTP2s7Up1cR+bMiFs7O1tqAbo8S+1srSHH+FIU6c+UNTH5t
	 ZatWQKRHmWd+mPaSBDOfX8/TzTtZ6RTfXmOYKHJCllPgnp3TjrVJ0dycegfsOjLCidkI/
	 mVjX2nHoxa2xKutj3kYLEitpHj+B0Tz1StrswYXdQfG7tT+ns73SxroDSSM9yE7kWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840796;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-QQ-IMAP:X-QQ-SSF:
	 In-Reply-To:References:Content-Transfer-Encoding:X-TUID:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Z6KzLUrXAz/7ezwxnktJkotKAtm3QpIuW+6JblMcjgU=;
	b=bovsZx+h6ZBtpQksS4ra4gRThPs9N87RR+44YrsrCwD2BWLgU7lLaWswOSdf8QwXQ63f
	 BlU0ckh96wqr1BiSJX1zdNqQ2WWP3XXJNXoy6I1wQZ+EyreK64gA1ESzbsVn9Nt7Yivem
	 HSj/2FzZGSw4pSC3HbGJCXTHAdInCQ5hLXMUIKPd7jem3mMUK8oZ30hm72fPnOC4e+OEh
	 SewsIpLfnzyuHVIbOd+fZYg30QWIHVj+Z/Q2UTF0kSh5NPzW76mcf+fmPe5EFnzk9WnwW
	 6gkj55/8LdVfvnPf5euUMpH6WVx7CmoQJLUb0YUaVVnFyL42UKduMMSzBFmjE6dLfPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gW30Pkey;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471CC606A328;
	Thu,  5 Nov 2026 01:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471CC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gW30Pkey
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793840750;
	bh=Z6KzLUrXAz/7ezwxnktJkotKAtm3QpIuW+6JblMcjgU=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=gW30PkeyylzigtFyedAgvwjpTbVkLmAYMIL7NBkSYjCJZDyS5Byd2gd+ARZUFYsGl
	 ZPiasFCzbL8Yo8rbK64ln1YzDpoPRE4eCYR8jNq8BELz/K8baWEVSJ/GP5u0bLSmM2
	 uJG82FG0utuoXWscvdgPUsfwPU78EB3xIQ32WGCM=
X-QQ-mid: esmtpsz10t1793840744te03083a1
X-QQ-Originating-IP: f1iOjw8CoXrK9BH5TL6CnZ6XmusYLHJuBDVeTopfVro=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 09:05:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1357862901825971351
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
 boundary=44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Nov 2026 09:05:39 +0800
Message-Id: <DMMVGZBBQYU8.29I5BD5M9Z92Q@linux.spacemit.com>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-QQ-IMAP: 0
X-QQ-SSF: 0000000000000000000000000000000
In-Reply-To: <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com> <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-TUID: fCS71Nn8OH1k
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NkLA2q2LD229lrTptkMGgc3LgSv0NORU3hyi4g8YZEoQ0JrgUVzEAP9P
	GMgTehFb2YFC5LHAljXetK3oQtyWvztbfDl0fW/MWCkLEJ8L/aBEVQCXeQnO+EfbaKtXkSV
	WbPGOKkLvnz3AxJDVRb4E681HzmQbYt1hSGD6lFgmFenFETFPu39c4Funr0I1NKMu2xaD4K
	ARClesWr5T2RVKHslcofSzsol4K02efQToZgfIgJfKAIAcBEPdFM93QQASsbXOtXxb4O4HI
	YbTJUvRdnJU15qZIPZXv2Bbd9Dwdp6Z2vPvtE5/2HoV1qcABnKcddjOfJB/ldAaPb39JmMP
	qamLIJBPAeplHraw5xIFUjDER33MGl+tqIZ/ZbxLtH02ysgLqNXpamgI3oPY1NCfXq07RLP
	96hvw9SOp3th14X4dzGtXOOmeZ8T0NKY9HyLVsa5AKcNv6oShBxApLNgfGRE6BBIs7oWRph
	KeS3zOC/byftJGef+m1TbFMfsbyA+L2iyTSqeXPX8NUtZLlCzFtybvHokp5Wfo9coh2BLTl
	mf/rs3fITvJY1w9xG/FEOaOXFo56QZ5UQRvOGugO06EiXjNvPQ7a3fWuwrLXd12hRHCUTgv
	yUb3VLAMy5sbfHBQux0AlWRZs35G+Cz2IoHmdOzCvNTjaIiO/XTlUELxsdqKBx49D7pvxll
	qOz89fyCZ+eGGsDtVLxLtvlTqbpdtDugjEybBwJClw/gOG87MlheAa0tWdj65f9zTRhgRJV
	xhXsnpyKH8x/PmgqlIb/FcLejjyOrFPoFw60GaiLE/B/8+jfkid3M+i3Vk271ai191Dz5+B
	hxkFI4izv1q4HRG2Kt6crTYyf6ijyxz/cc2SLrHFYV3SIpJW2J/Rx9bJfkJ8ucmmBfujNVg
	nCS1MZW9hzJH6hdzOAJHtVDAdhiwsftDCIMfRmnod/RpdXBUqlfjdwtUy0Kc9f912RGnt4t
	0HDKy4wH401iAp9Drq2nUZR/u7FZn6NlQenpoVgVB3uG1xBVNd6MN1rIG7qFJPKwOxciK9G
	QZ4Dofa8SqTn9jv/qFOK0lt8ZFoXFKWKQRvaFFJyyYNLneADJ8hiU1JKjEeClHW3XRZouwN
	msJyMthmjUh
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

--44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, 4 Nov 2026 19:28:00 +0100, Iker Pedrosa wrote:
> > +       irq =3D platform_get_irq(pdev, 0);
> > +       if (irq < 0)
> > +               return irq;
>
> Consider using dev_err_probe() here for consistency with the rest of
> the function.
platform_get_irq() already prints an error through dev_err_probe(),
so I'd rather not print it twice.

> 32768 looks like a magic number. I'd recommend you to add a comment
> above explaining the clock rate bounds.

> 3 also looks line a magic number that could have an explanation. I'd
> suggest you to add a macro with a proper name to have it properly
> documented.
Agreed on both, will use named constants with comments in v2.

> The device tree bindings support both spacemit,k1-timer and
> spacemit,k3-timer, but the driver's of_match_table only lists K1. You
> should add K3 to the list.
K3 is described as "spacemit,k3-timer", "spacemit,k1-timer", so it
binds through the K1 fallback. I'll add K3 to the match table only if
it ever needs different handling.

Thanks,

--=20
Troy Mitchell



--44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauvWYxAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQvMTcBAJiD4kR1iAZMK1VbPW2J2bTMBOjkpvGkklin
34cjePNAAQCEM2Pd5FKJRojTn0AA5gzgAvnCFeqcVgmsKyYYY9m0AQ==
=FeT9
-----END PGP SIGNATURE-----

--44909840bed98da606b822ce956ecc68a224b49c56b1dc02428b296ecab0--
