Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4B4457C2;
	Wed, 23 Sep 2026 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146949; cv=none; b=FpspCfQIX1I2Z2eV5sa6FrPaQRHQjRe2TZFnKW2j6FlGhnnyCG4MzMo4Bs4+iFZ6SWVjPa628bfKswoq8YN+7i3VrvV/N/VI4ng7IGH90TSg3Y6TvIXVZMF6+k/EDLdTmfwsyos3ORfTQD0F0UmTSXpLWUaf5OsZ50aNIKsXc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146949; c=relaxed/simple;
	bh=vV1f8XOtnhd4PUrG7fI1WwmGeEfJB8B4vF5GJJspy7w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=P9lVm1SxArrdAZhPOd7V0gkjzdOaAnmk/6VbhKNbuc6eYdP3TDqGpeXZH1M0LAWIaWxTeEHeIpFOwIdwDIhSzAaAq9rk2b97L/ncmFzbDVtAvCcsJLkhwg+qz3qKolKwrN42MtanXUQrf/p9moLOGi0Le0UkTwdulS3R8mQjT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GmpybhRJ; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GmpybhRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790146938;
	bh=vV1f8XOtnhd4PUrG7fI1WwmGeEfJB8B4vF5GJJspy7w=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=GmpybhRJZLnP/9/jb4XSUy7O32pj4B3yhNJVR2LvRoowBjsTu3k33P33u55vgKoRh
	 LJX4XuGWBOAmgBIx0erzZGXQmy3EVUAv5mIpLq6uxkGxDXv6vtqlPtrYfJL5e0lYin
	 Jo6YalOWSWi6Gc05xP7y0DSpkUzg1s5pHC3UUcJg=
X-QQ-mid: zesmtpsz7t1790146937t51512584
X-QQ-Originating-IP: 6YGW9d+Woa+ee2SDpHWKexzNo7pMSO7+fqf4Wn3ed+Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 15:02:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5313365158734513458
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 15:02:12 +0800
Message-Id: <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzrL4PfGQ4oQcvx3Y+HVF6X8HQKJwbt3MkIxps1XnwT5rsl
	56GQU+B8Dk35l3RG1nkBK+O1vWo8sAPlY4Q7LlGZNGZXz/CinsSNSZzf2MitPEYMLlDrSz8
	s+fqZnJaEq344dIF/uauaYMnoL9MO5W1knntX7EPy99Yy5U51lolLzWIMdbIaLBAqwSC312
	F8EaKwWhHsMhelWq+gsiVx7Kz+pLmGdCv2qmjX8GAhb6JtvC5gxxiD3sWpv6cttcK8uN6ja
	iSkZrcJYWGs1BVy2Vby9PfpvnzcsYbgAHd4L69fgDkGgeBNYsFgwZoxvtShYc2c3RGyDyZb
	femJoxgfRMmlSHm3r3V34XLczetco+zgQNDgPpqqm3Sz3r7pU/8nuFGdT0AKHBDUe0q88h+
	E09vfq5LvaFgEKCXN4dQBQ7YDVq9O/R+Zrq72RRro+GkNRILbBdG1hQuqkCWSUvIoR3ubW2
	snNlYhLK8FW8kXw6hLAPBmur79xwSjl9lnl2Xtc4GHNBHvTVGougNBh3A4pH73VV6Q0dr3a
	QvQRKoVhN+NryzSb0uqxYNpV0YAEygPuXmG2QGofKo6bYHU3UjKM81kW5yyXPLZ+YlBlvLe
	v8FJpULUuKnnrT/MItps6sT8r4cpaYw53h1HWKHuHvKKoEexC/gSzDCu74yG0h5SaUqKl/F
	hhtzwkd1uIMAugl7w7CyOgG0ykrS4I5EBC08XOQf1yG2UiRsJnA3+Ax0B+4PpRRxSx4xCpH
	6d6QFXXLiWYAtiF7myI5PI0sntcBiXqKyrGWxWJn0Xoy5fZ5nX9QQpSqR2RbPcfDVCShtsI
	8fhC190ecBCj6XXNDSmpDnORTnOe1D2b0Ykxa9cmnUkvXN6ySO0kTTHNpA/8r6Qr7ijsC2B
	Ln8YJFaPhKiI81rl9MjZ/tXfB8APDWx2Wv/G+srRpGQb6RWDI83xFcwO6MHzXTSlsjQ25Dt
	esBtY962pf/K0eVqNjV2aEcS0PEqn9JzVIcAUcHsIzF/8MQoyzm5Rp/8qLLzqbKyHND+p74
	yQ6PK3D0+1DihELfQvTmc1g8gVyiLjkPCyJ2EEH47HFggUbTZ452ZgD7EYkLyITL+Vy0uyc
	vDJqpZRH1pbSpZoM5w3qUE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
> FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
> FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
> driver.

An internal slot does not necessarily mean the card is non-removable.
I don't think its location alone justifies keeping card detect asserted:
GPIO88 would report a card present even when the slot is empty.

> We check the vmmc-supply is p3v3. We have the same SDK DTS config with
> k3_com260[1] , so, this patch follows the SD card patch of k3_com260
> dts[2].
>
> If this is not correct, we will change it.

Could you confirm from the schematics that the SD power wiring matches
CoM260 and that the card's VDD is actually connected to ALDO4? If so,
this supply reference is fine. The same SDK configuration alone does
not establish the wiring.

If the card instead uses a fixed, always-on supply with no software power
control, vmmc-supply is optional for the MMC core; it should not point to
an unrelated ALDO4 rail.

--=20
Troy Mitchell

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarN5dA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv0SkBAJoTYlHEntw6qzTvJySy6HApBMRe5LlDuAd7JRLO
XP9NAP0XoDVs3rpymXWxOxY0Su4MGjNUGi1VGG4nipsub909DA==
=Ux3W
-----END PGP SIGNATURE-----

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b--
