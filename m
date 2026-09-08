Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF0559CA8;
	Tue,  8 Sep 2026 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873200; cv=none; b=UW2Sf0wG4GWGc931odz6RP4ULogV6U1yqKnhmwqU6IyTs31Fyy9XnNmRcB0Aa8+nG0r6GagiZRm+agL6MeMG80omID4V7xDDcaMWqf1r2/6vcXN9ZbVXbMT7cIOKgUAU2Jfryl36kbmRqbTNtefKvTcEdY8W3ES5B9AE2VElV9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873200; c=relaxed/simple;
	bh=mIWyqqRMsfpDKfz/nz9NbsL48iyrcIIeqP8orz9L/8M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CmTvb242x3UvyB+3jUfD/wvxTDlTlsZTyz8s8rDE9hYGVYPWsp8s8ax1ZV2Ipg0vv8ONzheRXjQLJPtz70b1ftlV1AaRTj71Nr9PPiU3EQz2jIAXhAWrpgP1P2KLpkJ51Ku/bQSCoEQNXJoEv6iOlgoM8/4zk8ZtzhP6jV1vfz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FTMLz2Es; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FTMLz2Es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788873126;
	bh=mIWyqqRMsfpDKfz/nz9NbsL48iyrcIIeqP8orz9L/8M=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=FTMLz2EsWPsSiHxnudJaDopeTZI2t1PwzM7zATruCquh7F0eFfZhPak9fSP4kHP5l
	 KAdJL2XNBagLwhHX4Bzm+uFCVwvlxtWMFFe606Zylb01dcxRNLHZO7Qjq+ZDJ+4+ll
	 lkG7oNOK0gPockjo4nVsN7S4UYZkrGyBBNzXB55Y=
X-QQ-mid: esmtpsz21t1788873119tb9caac5d
X-QQ-Originating-IP: OzT991yKTm8aPCZVAdh22ewUudNoGlUr/PsMZfz1plg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 21:11:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17554750982614222209
EX-QQ-RecipientCnt: 21
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 08 Sep 2026 21:11:54 +0800
Message-Id: <DL9YLFXV5XHU.2GLN2OSEB8EV@linux.spacemit.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Ze Huang" <huang.ze@linux.dev>
Subject: Re: [PATCH v2 5/9] usb: chipidea: usb2: add SpacemiT K1 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com> <20260908-b4-spacemit-k1-usb2-v2-5-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-5-f07342ffa051@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NOSiq+6X1Fi2h96Ve7jtwZRi4zyHPpUx4yY2i1Wz+CloC3OzfV/KJww2
	ioJLxYrTwx9BTJk7Cg2AcHWll571CY7ZIxkNuhGXlQEJ+x9A3y1XAKX6mLfPigK4nwCzKBW
	M07bO1UefBd2BKZZVYkefDz1RS5wigfHTYuesYlPeM/CP36u0QnulTx1UDojC74fbhl5yvh
	hblfK4rgt8B+3mFo+rrbOkRlrEvc0qROqtO/7edaGK3/Y8kvKFuLTXRY+f3u15JCXn9CSBm
	vPRcUqxpf53DWPvt7+KOb5I7j3kB2glYCnnRj8LNSEtGmi8FzinkE/h8mbKX6amJKnOw1AN
	kTkYo0R+ELBP6JIe6v4rwqp9bWW5KRwcYkG2cMZP+CrgJdDmezhFFSIi1D6JxWaf5OtSm7u
	SLNAEanUjuyQs6qbS4koaPwwI/NcotQzlmloWUJ8224o2veInNasOHuTGx+t8qNL9WmEyd2
	m/nmM/RaC8h4Y+kD0UeWDyVxMBt+w4fF4YHaiSOoT7ptZeKjdiBznJcEmFAf5wqf9xGAS6d
	Zzz8cbKm+8lzRAbnp2YTQNpy0/ZZw4orAjRQmyGvwu284eb+UxtBB2BjuMCPsaF43TcE/ol
	iRKNiX7P8OlOUt8wX1f6Agodm3svsbZS0nwCy3NRmCMZ+gugrqNEnPcgGkSAwpoeEjz6WqS
	K8Kakho+QZv84ymQsI2dfni/eRv7NABPJCSiwZdnGeUz/GVJRtnUA2eh+ZekOq6QYgfSihI
	rLv2P26xZ/iN1sqIQXZNvJ50uTqlfeJNnBycnooZrs6mhR+WbNVWZAwutZjqd4bX9wzpdch
	QRICN1OAeQ+07XtsjV4jlTcoJAGqoTmRefRv7VbnIWucOqnjhlC5lQbvhz4LUazfL932kck
	8DkAZ9FId8TjvQ7tx8LV3h5Xw3ifx3cJe9+ERolvW3LwnAgASZ6H18CaJJfRK2t4RmRZjmm
	+tNZfids3xUStUyuC4HK0COsbX/4eiv55bgdAh6d2NVHgaPgIalg0MiZd5Y7sRH7XCjKQkH
	/omtsvyh7r1Ch1G6SZkyCDGtJ0M7ONKME4oqmeKEaUBJNxNm8ulj4nfyKnxWzzkTZoeuaz7
	6PmAM622eIsmwCCzBEPAAJcfexy89sM2g==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 8, 2026 at 5:48 PM +08, Junzhong Pan wrote:
> Add a compatible for SpacemiT K1, and add platform data with correct
> flag since the hardware doesn't have internal otg register support.
>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqAJmg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv4x0A/j9HUTzRUUs/A5yTaji1bts8yMGFvIYujiOYT58W
BYd+AP97yqSaybxN4+y/r68x8lBLo8FQ4tFvWHotMVs37WmsBQ==
=cVfF
-----END PGP SIGNATURE-----

--c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb--
