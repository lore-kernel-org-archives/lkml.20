Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547134;
	b=sbD+g408RpG+yrqmk8T7lYzOeP4QsE78jUJGJyPvG2wW4t1G3ayMJrATg5dBTbesgbzJ
	 7vyVV+9rm5J3rGZiouIUh6ngu8jUZ15s+4hyMp03E93vTb8RkdCpxYp32ZezLGFcTxtqV
	 ll+RH4W5y0CoTXvqluvY8FI9pmVGZePK5l6iRX2GQB+P912HPLSxldi6mRicfjuqoo7l0
	 LKMxf/8oR0px4Ler+4ia6ZbWABhLlzcOM5GrKDQYWHx2I/9WcVs9M33VIxnIRnh6dtBJS
	 5YwgCqmcDZi2cQJkpwZUS2BL9WqQxC1PGKu47kXkTAqaWkijrFPDSG2MZ6+Swn4oTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547134;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=Db6MSaWC1nph+iBpAayOp34joceEe7XbWXKE1ts0440=;
	b=iKOZrfkfeQkaDqC5DzzLnkJGO33kLelocXmKTWLczPBnNFV5s1+bGikAUDb1HX0bqzFN
	 WU6f05Odrbbja4FfGdgNXDeHUMTetQZ3Q2f42TuoEirWi9YyHYhNTnYf67xdshDVa4zO1
	 aOOX6h4QaASctag/9LN/J1z7obHJQbYMXeIqlaMOL+JZzcVTqd+cCPo2XUfzDwiGOUdio
	 P2pg/D9BxVc01P/U7LxP2ftmF0S1w0yB+UMOtyjjpqkv8DTG6x9UZZEwfuucWjwQH6n9Z
	 gEdoNqVF2iF6zRPXo2rk1Uvb76O2ddKkEfsawUdRXKHzZqZ54heYP4uykds2Ib8KxRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=bLC0fOxy;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FF9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=bLC0fOxy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792547065;
	bh=Db6MSaWC1nph+iBpAayOp34joceEe7XbWXKE1ts0440=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=bLC0fOxyaX4MKdSENu7e9+j03/YTx3BooYzV1evUyuPG2Hzikk9N/ehFJYq4T+Fyu
	 3rplGtmnIALJ/0ZXTlPYtAuvtqaF5unngnsLZsrYJJ+bEra3YNHv2CSp/lZlBl32YX
	 RzbNb+wnbn7eIQJnRLVKBrwYavlGCckMkCiA5JTk=
X-QQ-mid: esmtpsz19t1792547059t267944fd
X-QQ-Originating-IP: wkbnyrRUZdB1FtN4w3MkwVwE+Bk+3i/yyO+zNhr61Xo=
Received: from = ( [58.254.68.16])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Oct 2026 09:44:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17375456752936230907
EX-QQ-RecipientCnt: 9
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
 boundary=387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 21 Oct 2026 09:44:15 +0800
Message-Id: <DMA4WD1NGNRQ.1RNCFNAJJEZCB@linux.spacemit.com>
To: "Hung-Chun Tseng" <alan.tseng.cs@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Guodong Xu" <docular.xu@gmail.com>, "Yixun Lan"
 <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Alex Elder"
 <elder@riscstar.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MgQY1K25Ph0mNDr4xcVxjLikQJuk4JQTwcOknv0vsVAIeviAuFkWrD+H
	NXgq0XsbcTTGQ/eg4aJ88KsNcPwQ6SjhNRV16TUac05BDf2BhtEc0eLI4l93rxHhTL3NzEW
	avKlTx57PX1pNy++LVh5A7GFphSINJBCB22kQTduAPN03VGSWfskk+paIka3kon2M+xeZTA
	MF1vnhI6d2sM33P2qr3nvJpMiYh98OSIbaZirMtv15Bh8MvUfbzcBxUtsiIO8vWnY16zRh4
	oV6eflV24iJ/5BDuiW4HpWgvv1jRZDa9wklzHDLN101342rJAKH3SvQD5rvmMAa14qOJU5u
	gTWrBv6jnJsm7Ie793yuXJdifK9S6U2clAnO+ONDyGMeH4cI6lSuv1OJz/BoUj3vSEslE9j
	znmCKlfJZxK2pg6Mgfp+cctW62jKZcdCuW2c7e6PFRCjiXZT6JvoEwVzSgt3BW8IlKYMeXW
	IyQlFU5yYn7lXZ0QpoTdak4M3RaTX5xyqBwsO9ZMin/sk7w8kxLO5PNMoNEGHpxSZa8O7l6
	U8Fd+n7y2Q18bfDHp51XUD/HqFViJ6gnI32YL/Cy3j2SH9cIAtwcAOOXW2vc9AYTgBUxQvH
	yCDmtlU8KQRpyhD5uSTAi0s1B/cdTujDYryKzhZ9slZOoqTiCrpWXbtSXDbNOJT0SRhLFmK
	7NkF5cvZuher7IRRyoPcWDTeu4ls4eyYHbdyiU6hgvTNKjqclUxW57Dzy4IgazNYDK/HO9X
	+jSq21qjgvhOMVqiO+6yHyWs2dk73imEf3XTDl292QxdH+DGc9OCeC1KTH4g2cNVn62WWya
	r63yna/3tDaiNdthsLZnHror2nCs5QwapOoxtbHBi3PMCq7ziUSTL5UH1W+hY4FZOxA8EeZ
	5i8oqggQwAw3weWqZzpkI5s85RZ1M1kPmy6akQcZPb20s5IvFfY/Nhb/xQEACBL95eASHvH
	IgIEwqAugMIf4jf+fMTQ+nldIxYRizqvfNAd+10ymVdrzZgIKARpLamBkqwuJQOBSNuFD9k
	vGWirlEV2HSzSYtvIvqo4KF5sRv3PRO3t8GU9TW02B/ILfgqUjHTLNfxYibjabDMpu6Ovdv
	UxYSngSZpHy
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Oct 17, 2026 at 10:08 PM +08, Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
>
> On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
> for the fan, the RCPU2 registers read:
>
>   0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4
>
> Only PWM2's register has its reset deasserted, which matches one
> register per PWM.
>
> Use the matching register for each reset. No in-tree device tree uses
> the RCPU2 PWMs yet, so this has no effect on current boards, but it
> would break the first one that does.
>
> Build-tested only (riscv defconfig, W=3D1); the fix could not be tested
> at runtime, as mainline has no RCPU2 PWM node to exercise it.
>
> Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU reset=
s")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCatgY7wAKCRCYCe+A+TM0
L1PbAP4pf6L7pzMnGbBsuKt7Kk9qD8b3b1bwtWQ0vmzVlbKVCAEAhGu+FJgNIwDK
GXteQYRh4Sb+q6X0GtcsqP9JAvvtVgw=
=aoHn
-----END PGP SIGNATURE-----

--387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5--
