Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353899;
	b=NxN1g1Cajm8Fjyu3R3H/el1AnObn5mEtYCi4YOXz0+Q1/yz5f4xybqB+6J07ICfqzTy4
	 VFpI75qDzITEa7GbYqVQzrQvS4E3LzyMT0wz+bZ29CnJ9dSLPjZqt1Yn9TmqRCaNI9NfD
	 uHGSRXGp+yDBcMILToPajxDAJIKhwcn4wqEjoTrQUfbOhXsxMj62h7J/JmMeX/JVu+VT7
	 gXXe1BPyACNpL16wrTDr8I3tWFPRu0zpslv73h/lSDHV72OTH+n/3XVyIriFtKyPBvMnw
	 3maX6TIM1lhVxT5GLlSAL9Umy6oCcnmjT3UJxVQQIMp/uUq/4dFYf0WJP+nSgqZU39Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:X-Mailer:
	 References:In-Reply-To;
	bh=3goS1ZvzPsjBGPxncKSbBYPM6KR9BNseO+p7Dqy/lc4=;
	b=KxcgHhMxQTa4G7IwqCJhSUxPHLdBNseCTYZqUzatGjRRR+KRgUgXRjp9upX8QaITLkSr
	 NSEeArcplpSHH9G49RuWFVafQ5F84OGD9wmheaCd7tph2U2g9wVl5tBfQQUlhvB4TWmDc
	 aU1Ixcs+DLedsi/3XqXc3h0vwKnZlEtigzq+1nND/ffEFEtSrUBcXS8SuELWN9AvGr6ss
	 6pnQxlfaJexY+XLxRL37ITp03aOFFVzTR73O8WsFFLWZAVpJ2LkNP/WLT5/WfOYijk4YW
	 fvTWeFZ4LOynF+RfTXjBo7apZ0ISU8m9mn/A3yS8BeQo6dqLS9klVrjOumeHEMeaoeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jdDKc8kd;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D863D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D863D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jdDKc8kd
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1534216f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353897; x=1794958697; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3goS1ZvzPsjBGPxncKSbBYPM6KR9BNseO+p7Dqy/lc4=;
        b=jdDKc8kdHnj4J2ixG5bgLBvuzcI2INXdTJx6MrOoWNWokauorvc53N7DJ/LFOWV7H5
         kURia+FSOM57yKP4FC5ZbrJ32uSJjmWgS6utjkSBstbF49sbAzVNEj/s/XLFv/SlqkZG
         3u1zAW8aFDJ2rpzuzsd6CvX+zbYO8MsjVuseQW3VTUFw7aHAD3BB3tjGXHh4gmcLXQwe
         vT17jOmPT0P/x3O3RdcBL0XYLjj5h7uL+jWJc7qsarmuE+v+hXdSiLJZFfiyn8ldugcO
         j+CPy+WE+kWxKbnG03rfpQxgDe3GKBETsm76szBCIkMqkSCmZ1H2oivY1jp09+EHKOx/
         sVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353897; x=1794958697;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3goS1ZvzPsjBGPxncKSbBYPM6KR9BNseO+p7Dqy/lc4=;
        b=hFpaoCkl7xXNJDuNarS64zPOiircKW0rh9e7IaJUwGQYZz99OHzBiNVrE4en0faoOT
         +XSxwVyW16mJc7JjKHvdpx60MziV6+d9TtBxsuQJHQt4QkCwa14WIELHRLv0jop52CP8
         lPMfh3H7uV5uJI6J+mMvFI1ImxHMIElimHnVyvmvr4FzTbQDP+hJ35b6Blq3VPGHR20K
         m5I4d6GFGlzzrl2ppEvHdS0qUmXxFhf6O6J0iMJnKcbyWzHrBlE8d0ALhPHKjyZknGQl
         3XeK5gImHifQRUJjOxYv/moapBTr9bHooppa7P9zmqyMMwf9gdiQxiq6EgXyuQTJdNzg
         2Q0w==
X-Forwarded-Encrypted: i=1; AL+hErGAuXTShma0HafUgGOWo3tvs5ZeMsGG8VPvKkymqQK5av2vMgK9kbc9SPPcddiWacRcdtK0bd692FGrAgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EQem0VGjacOR0sCJ7Rj9zOnalZ3NqKZbqrK14R8DwCSTWgpu7
	B77rQ2B63b42IKujNH5TJ10PmyABbuhm2b4QRz+1kHqNs04ecC3Lt7S+
X-Gm-Gg: AYBFou14NJzeOCGN44CpWHACPIZgBKl+9fujXjQMKExr8eKWmw0rOvHasId9zy3okRC
	uy0odeQAfwY2VfVUuylx/FXTl3fKcWu2HEp44q8UcKTz1HDzCGUEokb4cI9inmxxot7LuoWSOUM
	q53QaDMsHqKY9ad3bD1kwW8DeiO1cdv7DrXc4NS3/T/ZqA05ECU219T/Spr3hIargQrkqRBUNB8
	kkWW/sutYQhJyVBOo9v6tLBdvkzlzLk3YVBJSvhORVNFb5nGnn0x3LHKjl0BSW5U57YcTzsLtb+
	4YH9JS4FaZomMbJhTwwdXsFU0fdHQshoScO+wXTbPmLt49zbBQ2qkYvm1LPQHj9ArDvaXo7LiO+
	7NqHtGOlY97HydUhPhcl+GDHE79t4opgqTkKWQQa3swho71y4WClJ0ejzw/5+Q2B7MxyVZTsXfi
	v5DcJjSVQsRg2PNTCry9K/jBWTAd13jZuEZWDq10vgvj+a8UjnNgSQ6AT58JZsRjm2y4YcB+X1D
	XlSNzSDWivukpnuBLZFlLzuMArqeAe01vqJ2nROtHI0VohOfefvbaK+t0T31QPVLbzyyRcKS594
	CkCUgROhDWz2bnNQKgVtwjifwg==
X-Received: by 2002:a05:6000:22c3:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-499c7a24a58mr837283f8f.24.1794353897092;
        Tue, 10 Nov 2026 15:38:17 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm7145551f8f.3.2026.11.10.15.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:38:14 -0800 (PST)
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
 boundary=df3f1d7e3ac6deb5b88938f076a8c8df9b981cb0159dbbcc10385a6dc479;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 11 Nov 2026 00:38:08 +0100
Message-Id: <DMRXD8R42LDK.HU7NYASSMO7C@gmail.com>
From: "koraynilay" <koray.fra@gmail.com>
To: "Namjae Jeon" <linkinjeon@kernel.org>, <koray.fra@gmail.com>, "Ian
 Bridges" <icb@fastmail.org>
Cc: <senozhatsky@chromium.org>, <tom@talpey.com>,
 <chenxiaosong@chenxiaosong.com>, <mmakassikis@freebox.fr>,
 <linux-cifs@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ksmbd: set create_time to btime in
 ksmbd_vfs_fill_dentry_attrs()
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261110161659.481208-1-koray.fra@gmail.com>
 <20261110195625.3211657-1-icb@fastmail.org>
 <CAKYAXd_vxYCEXAJPSH7i5+0Oeaz11P=7-vfA7yP-KO=z569vtA@mail.gmail.com>
In-Reply-To: <CAKYAXd_vxYCEXAJPSH7i5+0Oeaz11P=7-vfA7yP-KO=z569vtA@mail.gmail.com>

--df3f1d7e3ac6deb5b88938f076a8c8df9b981cb0159dbbcc10385a6dc479
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 10, 2026 at 11:45 PM CET, Namjae Jeon wrote:
> On Wed, Nov 11, 2026 at 4:56=E2=80=AFAM Ian Bridges <icb@fastmail.org> wr=
ote:
>>
>> Hi,
>>
>> On Tue, Nov 10, 2026 at 05:16:59PM +0100, koraynilay wrote:
>> > ksmbd_vfs_fill_dentry_attrs() queries vfs_getattr() with STATX_BTIME,
>> > but discards ksmbd_kstat->kstat->btime and unconditionally initializes
>> > ksmbd_kstat->create_time to ksmbd_kstat->kstat->ctime.
>>
>> I tested this on a kernel whose fs/smb/server matches ksmbd-for-next,
>> with files and a directory created on the server, so without the DOS
>> attribute xattr. Before the patch, a directory listing reported their
>> ctime as the creation time, while a query on the open file reported
>> the btime. With the patch, both report the btime. A file created over
>> SMB keeps its stored creation time in both. smbtorture gives the same
>> results as without the patch, and KASAN reports nothing.
>>
>> Reviewed-by: Ian Bridges <icb@fastmail.org>
>> Tested-by: Ian Bridges <icb@fastmail.org>
> Applied this patch to #ksmbd-for-next.
> Thanks!

Thanks!

Best,
koraynilay

--df3f1d7e3ac6deb5b88938f076a8c8df9b981cb0159dbbcc10385a6dc479
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCavOq4AAKCRDmj22qf5IG
XINhAPoCAIej/sisqURd0Ymd8YFq84QGe9rn6aXtTtvXnXv7tAEAwKnnjlYbfJby
oWrXd9I3soiPgNwRf+pblHVL44o22Qc=
=bDzo
-----END PGP SIGNATURE-----

--df3f1d7e3ac6deb5b88938f076a8c8df9b981cb0159dbbcc10385a6dc479--
