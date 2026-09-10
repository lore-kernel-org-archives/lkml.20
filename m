Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD231618B;
	Thu, 10 Sep 2026 01:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004027; cv=none; b=PQ7OQdKygSOinUdTbITyUOzC2tJuKTYgwsVJsUq8bzquwEKBtARftycrT/s6i2bw3LObw5NiZzggMkq9eMiipYGDOQZ8q4AhLuqxAfd1/WoiO4oPlv2FThHV6btMoZXurzR61/Kns1VaqimkxxkiHPHHdIw9juxELcVq7Ayo6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004027; c=relaxed/simple;
	bh=1upMGiJeLzYtdrPLZ63MwfmHRhcTf7sTr78NB/LK/UQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=OOI0sSr7Kn6NKmoEKRF4yLpudWDnAC9LtNi7iq/OGSbpDL5F+GAkh5opqAWn4WQjXw4MGnmP/F5+jPc3clD1n4MiiSN2kEUmhbpeGc13/3BIp9rNrJleDJUpb8xERdO6VOAUBSttrk0iuSvrMh10yzk5n2Z3YLXiFnO6u7C5O6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ILqw91Yp; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ILqw91Yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789003960;
	bh=JRLAWTIhqaaecsAukWfEk30ICvbbdNAr1t0TIDEE89s=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=ILqw91YpOSY14+c8I7VK8ruo6YRhT7Am77O0aUoQRK3PGTB4zzQ9nAg9i6CT12w2T
	 1S8+BNAVnCpA8jyIuMt2kQcIQkmXXcYS3fuKZCsC+3hl5Rd8GgtRypSV+IHTZb590q
	 lDgZxKgJHfc1spEpNMTtcndXAfrhvU9Ld5+zYZo8=
X-QQ-mid: esmtpgz15t1789003953t3e8991ed
X-QQ-Originating-IP: e+6YXafASxPf1eSSOf6GAwmVakYdPq8Bw8GPT1vxgas=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 09:32:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11798593259033511261
EX-QQ-RecipientCnt: 20
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=11bbd86e82698157b531ee79da7e296696d006f746390c3a0d4a79aa529a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 10 Sep 2026 09:32:28 +0800
Message-Id: <DLB8Z04I9AJ5.14D1ET3LMEICL@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-sound@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260910-kx-i2s-dts-v2-1-91f5376c899d@linux.spacemit.com>
 <20260909172639.BCDE91F000FF@smtp.kernel.org>
In-Reply-To: <20260909172639.BCDE91F000FF@smtp.kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NwZEY09ZZGEZVvqf8+YezEAmM5w3WON858kCV+075xnJtCMxOzbXSBlq
	yqTq2sJ1xcR802fNLAUOVHhMYcQlsWLqIy2z7x9UD1Zc3hx/ofGmS9FNlWt/oOoPvLo/8xO
	SaX1fmnY2r7HCGU/l8KVYmOAb7wU8hfdRVUBqxEZ+9ncVdkWTIXqPjM/bZS+Q5SjuQIH1iA
	N7uKC5xQlv2C8hSidNKXHD/KjTzwyrE1xvquwnV/JM+fjEhmuVsowvYAgsjSE/rGAGtY8hf
	uBDRKTVnBUnmLl6FLf5xVw6KQKwPYbEqLoCBKMqQGHzcOFfwX+kqDC1F9iOFhdihl7dhASv
	C10ujbWeT/2r9M9asl3DblFWHYSz6W6HDlMGdwmfAhAXbMGcqPjqaX1z7FW0P+FQfia404P
	PI8K/4wqj1eOgsEkb3c61nw1UTnVPE3aCvt1/IVBECeu31l8z5DIhzqpUS9P/Zi1ur0dJ3i
	umYWf3iH8Ugr7vypSsu/wDs1UPOaiHBHwdBlMk/77Bmcsa9UhJ6aX367NZFAUF/GCVs2OIZ
	82Ic/q6Sbx1QRinOdGd6TxZCAcT5K5jbVcS/0c17skiZAS+yLpONik4k86J9m0lwdYyqFfp
	KnLBU7r29s26S0Dgg3nvQp+rD8YjKiMVeh//ddvxybjlLuvYX0GIV/3BdqHpk9M1pQk2heK
	4KerA4UU5MSx1PQ0vkoYdBBMHeLE+voTo24UR8LDWI52RIb0PI64TuySpuXLiZe2XoXk5X5
	zdyIZXrm6cEp516N/U/INu3228f2H9PNKi/mJKSsFtIQNqUC/QbQ/nHRgTPYujs7aaPLvp6
	ZSjScuOshIpI+9Anw0pBu1J/3pE8FqhcbdkSgKb6Mj3SUS1ZbXix95U/F/EYm1xXle4lDxz
	8yFq+w7Vy4j/GTCeSE0c5rCXK7eeRZkIP9/b9xtnZXJxOzEmdWpqxxWs1OJks18jiEosxmB
	1XwiOduVvGN4G4AhjJAqsa74s/BVyQhuzhCs8+0rtH6oBJiVt8LRhmkbddo6uDQuTq6cYK7
	JdDuTmbqzcWxK1qnTMvchhF7T414zMOXq1YFOuV4TbGP3V/xKXa89oGeG13SVJMxETX31HB
	yc6IfAOOATC5G7zwkxzhWqe6cwk0XIbdwluooxwh3pdelAKeWjYR/DVXj1jNQCclg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--11bbd86e82698157b531ee79da7e296696d006f746390c3a0d4a79aa529a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


On Thu Sep 10, 2026 at 1:26 AM +08, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The newly added I2S device tree nodes use hardcoded magic numbers=
 for DMA channels instead of the available hardware macros from `k3-pdma.h`=
.
> --
>
> commit 8163a94c4a6b08c0fea00752b0853d3f434a12d1
> Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
> riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
>
> Add the six SSPA-based I2S controller nodes for the K3 SoC.
> i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
> divider, so they use the published 7-clock layout.
>
> Link: https://lore.kernel.org/all/20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@l=
inux.spacemit.com/
>
>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/=
spacemit/k3.dtsi
>> index c3f2dce0969c0..f2ff9f02249c3 100644
>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>
> [ ... ]
>
>> @@ -1140,6 +1140,85 @@ uart10: serial@d401f000 {
>>  			status =3D "disabled";
>>  		};
>> =20
>> +		i2s0: i2s@d4026000 {
>> +			compatible =3D "spacemit,k3-i2s";
>> +			reg =3D <0x0 0xd4026000 0x0 0x30>;
>> +			clocks =3D <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK>,
>> +				 <&syscon_apbc CLK_APBC_I2S0_BCLK>,
>> +				 <&syscon_apbc CLK_APBC_I2S0_BUS>,
>> +				 <&syscon_apbc CLK_APBC_I2S0>,
>> +				 <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK_DIV>,
>> +				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
>> +				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
>> +			clock-names =3D "sysclk", "bclk", "bus", "func",
>> +				      "sysclk_div", "c_sysclk", "c_bclk";
>> +			dmas =3D <&pdma 21>, <&pdma 22>;
>
> [Severity: Low]
> Could this use the available hardware macros from k3-pdma.h instead of
> hardcoded magic numbers, such as <&pdma K3_PDMA_SSPA0_TX>,
> <&pdma K3_PDMA_SSPA0_RX>?
Yes, will fix in the next version.


--=20
Troy Mitchell


--11bbd86e82698157b531ee79da7e296696d006f746390c3a0d4a79aa529a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqIIrA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvKIoBALwKLoo7uuF39mKvybSqI95DC3y1EIi91MJWsMzL
lcWYAP98Y3nrDXnshzSwNi8LYPiY6ALW3eKvkhvPGtofCXnNAQ==
=1jI+
-----END PGP SIGNATURE-----

--11bbd86e82698157b531ee79da7e296696d006f746390c3a0d4a79aa529a--
