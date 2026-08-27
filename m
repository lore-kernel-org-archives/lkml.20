Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A63655D6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812805; cv=none; b=sMIyZC6eW2oCfhIhmBYU1TxmaMvVPz6Ca6ZjBQoeer+eJIOXo7JKY/ezPV96f458gskLkoeYX9V8evnZiAJKIUVF6wvGlxY9R4z6zsOEbnYeqEQ+tFwXdNAToEFCYJ8v2zHQkLJXFUdm9+FW58ciiKV+V8WBTMu8be+RGK3s4i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812805; c=relaxed/simple;
	bh=m3EBblnKDAGIdH9tcjTA1Ngw0Wg21uv1CZPG3SHJxuA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=D+VS1tt7fuz0djo5ANP6nYKWKkgbH/8Tv58WIG+Cf84HdRhZxIEejbkIramfK8N1SZzwHBK4yvMAZ7pIGkdhCowhQmHO9DFDIBTYmUgHJdqsZL6Dpg0eCIwjtkN/02tSUtTva/E4oW6iBDe/UyXqfj4oLkQwITbaqmLAR1571VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D8lBglx0; arc=none smtp.client-ip=91.218.175.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D8lBglx0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m3EBblnKDAGIdH9tcjTA1Ngw0Wg21uv1CZPG3SHJxuA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787812800; v=1; x=1788417600;
 b=D8lBglx01oRN/hL1VdDcTvJaDF7nNDNzUQE7WawDH+U0oyE/bXDbqefUvQ/+Qj5iVFYkwbhG
 EL0GCzTmTU4dm9JevLaGaoLyFEDbJahZI50RQUAsqykKeKL9pkg0G72U8rhcPhn8DvNkMmVA8KR
 ixSUaIpQ4oBvDh6uPRhEj+nY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (8.211.180.184)
	by mta10.migadu.com with ESMTPS id 5cc20cb2f0893b0a;
	Thu, 27 Aug 2026 06:39:59 +0000
X-Mizu-Trace-ID: 5cc20cb2f0893b0a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 27 Aug 2026 14:39:49 +0800
Message-Id: <DKZIQPBOE02W.2DFMAOQGYO442@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
In-Reply-To: <DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
	<20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
	<20260805134119-GKJ77474@kernel.org>
	<DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 10, 2026 at 04:20:05PM +0800, Troy Mitchell wrote:
> My intention here was to keep all board-specific pin configuration
> overrides under a single &pinctrl block, so that they can be found and
> maintained in one place. Using a separate top-level reference for each pi=
n
> group would tend to scatter those overrides throughout the board DTS as
> more groups are customized. The &pinctrl block is also placed immediately
> before the &i2c6 consumer.
>
> Would keeping the current structure be acceptable for that reason? If you
> still prefer the direct reference, I will change it to &i2c6_1_cfg in the
> next revision.

I withdraw my earlier suggestion to keep all board-specific pin
configuration overrides under a single &pinctrl block.

After checking existing board DTS files, I found that the direct-reference
style is already in use. For example:

  arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts

adds the board-specific bias-pull-up setting directly through &i2c1_pins.
Likewise:

  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi

extends &mmc0_pins directly.

Both forms produce the same node override, but since the reference-based
form is already used in the tree, we should follow it instead of introducin=
g
a different structure here. I will change the board-level override to
&i2c6_1_cfg in the next version.

                                            - Troy

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCao/btSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/6QAEA8dCtfup87U2o
snvjwoIwNCa2Z99Am38hnnyreNWzGecA/03n71wIE+T3csVbRbAT21+VwQ2RuK80
7pZ57h/HWuEH
=bLKp
-----END PGP SIGNATURE-----

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64--
