Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456406;
	b=EVpD0vcMXQZ7jR/so2JAcobPlYk2bGi/rd/nIvcVjJV1NlAMwtnGRw5fljBgjS8AMGYE
	 9Zi3vgWjSKN//S5/doU+F2E4fklyDDuaAxg7coTiM70gjA2W2DweponPAMNaFovvpH3kK
	 HaNIgXdLeTLpuQ/xcUksxUm1TkxaBSFEXoTgRL24OFETdEwmXzEuUqf4BhocYhFHUsihX
	 WfZ2s2tFmKqLDSdNsBz3OCf9/N5PAaaNXIoLfTWUdOWLcm5iOrU5MbGh5uubHFPRTAmpQ
	 DsJBI8NDWYhaD7aEWh7biSUWSZOk+Sji6iuzwKQ1LWOCP6ybrXp4fPjfuALYEMOAgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456406;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=yoYaomVVIgBtPptVSpd/XzENTexn4bVDmzF3s0hSweI=;
	b=LzfvlJKz3Ywu9XG32HjSQ5DB8UaGRxYbI2E89ejGe+7CYaUefUAy9O54Od2pIMuiQBPU
	 NE6sJT2hkoE/rcon4Rl+OUyk2pyv4adnMLHo3DZmvQAFZWlDhGB4laRIqICK6IDnNVDvH
	 F6+T5KeKQxDbo47xNCAmOfhv850yJo/yn46NeHmuWh5Ne+y8pf1pGKqXzn3zRP8PN8Nwa
	 0LQomiKHrkFgT8n+55fwsGiZHRf2l7xraLZmXQFyaHZhPfB6S7/HVe5E2tejYM3yRKID3
	 F4m+Qj7vwfExM1Kjnj7WglSvihKxtJWtl9KeDZ/LHWrj/+IfGtfwn349zjHMKwrxZlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=k54nASmC;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=k54nASmC
Received: by dvalin.narfation.org (Postfix) id 267FD1FF1F;
	Sat, 31 Oct 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1793456402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yoYaomVVIgBtPptVSpd/XzENTexn4bVDmzF3s0hSweI=;
	b=k54nASmCB3EMFcBsWdVMkxFadLU/2tXmjQpaOS3wFU2JOmo7Y4E+1C+V/KtLwL7puagWfg
	dAR7a1VzFwp8nAKa4nOgLvC+390hoCCaD9Pvq/Yrm5bPHFgPxyNRx0RBAChzZJd5q2ECMk
	IBV6QBZh/xpgEW/YcZBnnhE2ARE8Gr0=
From: Sven Eckelmann <sven@narfation.org>
To: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com,
 =?UTF-8?B?w5ZtZXI=?= Mete Kaya <omermetekaya0@gmail.com>,
 b.a.t.m.a.n@lists.open-mesh.org
Cc: davem@davemloft.net, b.a.t.m.a.n@lists.open-mesh.org,
 linux-kernel@vger.kernel.org,
 syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com,
 Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH net] batman-adv: reduce softirq drain in tt_purge loops
Date: Sat, 31 Oct 2026 15:19:59 +0100
Message-ID: <8752561.T7Z3S40VBb@sven-desktop>
In-Reply-To: <2282819.irdbgypaU6@sven-desktop>
References:
 <20261030000222.286935-1-omermetekaya0@gmail.com>
 <48b23995-4f67-4f3b-8988-78546cc23ecd@gmail.com>
 <2282819.irdbgypaU6@sven-desktop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10939703.nUPlyArG6x";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart10939703.nUPlyArG6x
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 31 Oct 2026 15:19:59 +0100
Message-ID: <8752561.T7Z3S40VBb@sven-desktop>
In-Reply-To: <2282819.irdbgypaU6@sven-desktop>
MIME-Version: 1.0

On Friday, 30 October 2026 00:59:51 CET =C3=96mer Mete Kaya wrote:
> +               if ((i & 63) =3D=3D 63) {
> +                       local_bh_enable();
> +                       cond_resched();
> +                       local_bh_disable();
> +               }

This is repeated (and will be in the future even more repeated). And it=20
contains odd magic values. This should maybe be extracted.

https://git.open-mesh.org/pub/ecsv/batman-adv.git/commit/?h=3Db4/hash-itera=
te-disable-bh&id=3D2cda1f6e4640b3bbdfadb8ef1ef633cf3c87f6ec

Regards,
	Sven
--nextPart10939703.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCauX5DwAKCRBND3cr0xT1
y5ipAQD63Kw+bMcj8AIxPvUzFYUhtLLwiicMmdsg9ZJ2/LHOZwEArOXlL+o9jBAT
bphEj2XUuhD/qPQdN/fRfzOXi0etzwg=
=Mymd
-----END PGP SIGNATURE-----

--nextPart10939703.nUPlyArG6x--



