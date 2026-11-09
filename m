Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256192;
	b=qtqn8zEMtCO+yDCGcnGDPRsqpkgRnuEBrEGaKSSsm6rns/4uHeGg29G4ok+DrCQ+XZyv
	 Wr6o57N9wt7dAIbrWcKSiWyjkHQuTQDrRtSZbOYUhnv0dyMXCPobhgUCr8wkZjQdnbo8E
	 k1UDN3EtFiVZCF8BQZnS5Dd/HoxKH41XmtCgAHqfv/ems/EBhvimnl+rRyKR4xMMa3zT4
	 eb1+DTvvAk5wHFVUq/G2YHXodbmipqd7IireNjtFU907hjUw22EYc2IMBnBMKRSMf6yGp
	 TnrCXhexKsFnuEk8nWcr5PrPsf9Sx1ydrt0r9qrYWd/YdrMihE8AGOJoRDElYdgFnrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256192;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iJ8ghNK6rfbISz12CEB99651jKjNR6sV3+bHiNah96I=;
	b=wHXP7rWuKYgOpEGTJvToCzBx3GpbIi6LrAp2T15GAMdkZDzOw6RsZHKSZtgrcop3Vhea
	 7cG2k9fI9weKzgQxwmzX4eLkwnwBhIysgmgTEo9mKle3qzpd8Kjugyr7LgRkR9Ba21Lw9
	 YhHZ5iI3+6s452e2k7B4qh5sIv2BqD6vvyBt96xQGQxFEj8iVQ5fM0wBfcdEbGOoUi/nz
	 FRxKL+vsYzj6MoFlQvOOYNkYIN0r9Q7sBh+dkXKeDb8aWY/mtZBcHlEBAcV4Q2ewUQBPI
	 h24k420UNWQLDUvIFT/SQY8qQMfW2UPiwe788ZT/a0o0oq/y+oaNXpNtp7xCHpLlzzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Wd2recMf;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB56606A321;
	Mon,  9 Nov 2026 20:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Wd2recMf
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id A779A401D8;
	Tue, 10 Nov 2026 07:29:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1794256178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iJ8ghNK6rfbISz12CEB99651jKjNR6sV3+bHiNah96I=;
	b=Wd2recMfFtJsQluNogI8eFJRVvi90kxls6hSB98Ij8OJDE8NIi3Qn0HDvn2Ycp689T8JoY
	TmevMAdqijNyVaLPCsNgNZddRiwbIf+13YldQ3YdJYOMpWlo7bvTVOB/OvbgMcouluo7WW
	cXOzjbniujIPjJQzF32pxBI9dyJqp58xvaRplD4JPSQyWbyJosojswN5UBbJyqiihoGDhH
	p+neuD4TjLk8VA0PI2H+ZdQXk4aXcT5kqfdF6FW9GhRA4ED06csaujDiPNIDyWrLcXhkDd
	PVY0GDtlO5nBl6cAATsf+G/cuLlSu9DLegIc0Tte2Rc2lASvxHCxwCoBiZRjkw==
Message-ID: <23518740c620e5575d5ca5f46aa99f1dbb7e1172.camel@d-silva.org>
Subject: Re: [PATCH rtw-next v9 0/4] wifi: rtw88: sdio: Fix unhandled RX
 request interrupt storm
From: Alastair D'Silva <alastair@d-silva.org>
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>, 
	linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec
	 <jernej.skrabec@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 07:29:38 +1100
In-Reply-To: <162821b6cf0e6d17aa33c81d55a716b553e70579@linux.dev>
References: <20261107035321.1210303-1-alastair@d-silva.org>
	 <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev>
	 <f2784538533947a38e9d03af7bc7fce8@realtek.com>
	 <162821b6cf0e6d17aa33c81d55a716b553e70579@linux.dev>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


On Sun, 2026-11-08 at 06:06 +0000, Luka Gejak wrote:
>=20
> > Please take Luka's Reviewed-by for each patch, and send v10.
> >=20
> > [1] https://patchwork.kernel.org/project/linux-
> > wireless/list/?series=3D&submitter=3DAlastair&state=3D*&q=3D&archive=3D=
&delegate=3D
> >=20
>=20
> It might be the same issue lore is experiencing. Nothing newer than
> November 6th is appearing, maybe it's related?
>=20
>=20

Looks like it's still stuck on 6th of November - is there someone we can po=
ke?

--=20
Alastair D'Silva
0493 18 5566
