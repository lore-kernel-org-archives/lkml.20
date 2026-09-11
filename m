Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3503C456F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092191; cv=none; b=Fxax01vnjJyS0H+jfj1TPECzL0gV32ht3jy0rX1Xxz2IqZiTot/GP0ahbxPIJCpMB5chH6irm5D5mSfzewAwpZL9lFsU7dxDeHulQCWppsgcE6g/o4y6HoxRQ9wCmW1IdB/JK5nX3x/0FA4XESrS/BQ//y8e0zpmZ6CnVFeOCCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092191; c=relaxed/simple;
	bh=p4+ap8iN4dSSeNIC2F+epq8WIYVdpPuH33P0vIVK/GU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=sBG7XlANqThb8ppKeT//uN42QoBvg+tDe1ujLnhMO0SWdQ7gkk01PgKnEtw0KsG82xnO+1B3JYlYaphhYWQvos2ChDL4nh2BDFHOS5GL1hDyul3pyaHnSFeMNW44LLCKMJk3g5+E4savhMUzieVeQHsTneePAZmiZOUAITMQ+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ktooi5Yt; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ktooi5Yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789092177;
	bh=p4+ap8iN4dSSeNIC2F+epq8WIYVdpPuH33P0vIVK/GU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ktooi5Yt3+cHvXXVJIdm5WMqT1MQBDK6mViQ54PCb34h81Mut2j5WELCkkmmlZsXe
	 chjwveWztyct5KeWxFt4AcXaCS5Wss8oNgX8OpOqiT4XBiUmAJDKB1xOzWoPT0nhpa
	 MlHSNp9Lrf4N+PqHRavNHS8oHftQCjhpGjhLE680=
X-QQ-mid: esmtpsz19t1789092172t4f8b07e9
X-QQ-Originating-IP: aSvGHA2+aoIKS3fHxwTlfYEZdf0xYuWX7HM/PfxhtbM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Sep 2026 10:02:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10264822679062085663
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 10:02:47 +0800
Message-Id: <DLC48RE9YAU6.1YO47FZILOUWJ@linux.spacemit.com>
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yao Zi" <me@ziyao.cc>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Yixun Lan" <dlan@kernel.org>, "Alex Elder"
 <elder@riscstar.com>, "Inochi Amaoto" <inochiama@outlook.com>, "Haylen Chu"
 <heylenay@4d2.org>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com> <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com> <aqKxMmgpFLE3CmQ8@pie>
In-Reply-To: <aqKxMmgpFLE3CmQ8@pie>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NzOHSugmTg7XqPDmIlu9eQyPXvynWm3Zq4EcwyB+HRjXAEeE519rUMX3
	LjoQJQf4lDCeC+UaYFCN+L+xw2kUN6jP4tgRVD07ec6hsBWspRI5rRk0zmKI26DgTTCKOyW
	nQZXf+6Nwl8+FUrStY7kxRYVVOFWyT2itiVxDcu/DA0pjUlLRRYuF5gBhs2RWE0VHh8ugY7
	lilX46Thy5BVvYWgT8OGDl8pmPmXc7johJw2SgNtwQptXXPXDL/fqth5nnKxH54vRhIbqae
	oGt7ikneZ5Z/KMVwhy/DT5tsDOQ9rVluV/Q4nyaog9t1/q3A7iRYtEEXbjohH1kUv0fvQJY
	awHVzLG4I2ufRpaInuAL4F7Ho16kr9+8p07n7FexognNg7zr9YM95xC9AfV1bHJ/ylAVK6t
	FitIwI/P+tSUQs87v3e5qJjqUsU28bX0LESngnK18WX/XbsMi/BeSEkrrzPXBgyWT5Ph6XG
	TaSs+6amv4jPqTKCPuCeBF/1KiIqV4knKX4oz7lXkHCPwBZlLoTgonUhkQKWhzD83CpLL2c
	f3a6zAh6hNKZmcjsq3X6+jkQpAzJxKq0yhxMtSvTwa/faMBiybgWoXRnV6yjMQ1Tzbnaqz6
	NloRQIssbA3dlRaGBcUGMDDcxpJ6wXr/Q7Dv3xfBBcyDtRUSM7+DGwPgdG/CrvJyFNGaOYi
	ifHVF+/mDBY19NWhqvk9hpeL/y2WHe2y7U0bH9mvq2dVBfJUX7f8+bVSgQtD97TaGD8G9OB
	TMpK5r97KSeZejhDKD13o4c+amAorSITnivRBg74RArOeO9QB3SYay4O4jSEJl2/VoDOtkB
	Z/CQQEugXaFvB/gwFjATfZUEFBG5VTCN2Ol+Krmb7TmotLGevjgLjS5iROnuswGG7q8By49
	6rng6PhfNTME0lbgiOwJfpOoSNs5xLlCnE1rNKtqq3HE4dKrLB5n3y10j/yBX47eMFqFpjp
	Hx7cBnCB5+vzFEx3Nvy8sTptYygfFKvcsikIdwuQKbQTjX5Ng7yFr/BN5ZV5XGzInQtyG28
	bisb3gUR/CHVlmLq9usxdNuwAyUdioe41ufJyhe/tzYc4fSzqQjwQiPihaeVQ=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 10, 2026 at 9:31 PM +08, Yao Zi wrote:
> On Wed, Sep 09, 2026 at 10:07:04PM +0800, Troy Mitchell wrote:
>> CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
>> running by firmware can have a zero prepare count, so this flag alone
>> cannot prevent set_rate() from reprogramming a live PLL.
>
> Would it be a better idea to simply turn off the PLL before reprogramming=
,
> since protected by CLK_SET_RATE_GATE, re-programming never happens when
> the PLL is required by downstream? This also seems to be simpler.
Then assigned-clock-rates on the PLL provider node? I tested this
on K3: .set_rate() was called during provider registration, with PLL3's
prepare count still zero while the CPUs were running on it. Disabling
PLL3 hung the board. CLK_SET_RATE_GATE therefore does not protect users
that CCF has not yet accounted for.


--=20
Troy Mitchell


--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqNhRw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvFiQA/1yR1e1N5dqm/JjKEw3dfM8yjqKmhTeY4evjauQO
6r/JAQC+EVD4ZL95QJzBkQT+HKp2w5tll5d/gI8NIB1sW9JeDg==
=Z8ol
-----END PGP SIGNATURE-----

--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e--
