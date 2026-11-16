Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798424;
	b=jIzxgBypT5beGnclLJEraS9jimW1YSQdI17zkBYEd54b+ecE3kIZxFM+eZFse9d588s4
	 +OZaMz6bodhKs6m4Re7V+GFVM5zUPwCjAdjodiD1csZ6o1PQB0OHGtVW6EVbzkvzWevQC
	 Us5w9bc0FMDWsh9232lJTM67I2a2aA5IqdMKnTe2g+D4nLFLndQDjEtM/OeXZSIDhkH8V
	 frV8+aSKnd/pVq/o+ubmZ0hm2VL2BgCxGMO3Q83SV1Ylt7AlUZvGVJLrwljc9+SlUPk1M
	 4UVLOtRU5Bjo/ymb7fvZ3tjzpGvx1mLlR/a7IqOcGAEunSToZm2Vs+2o0VM7iXNq6rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DfVzAJ8JYr3tOeyUpGtQ08wEF3tJXXOK1aQTqHdgZsE=;
	b=giHNSB1X9UR8msfQACLm4UB2YQH8MMQznJVtk96PpXBj4igiVoczCoeI2dKzucqcIrhY
	 6mG4dqlUssHpxvJeQOr+kWK3BL4J6IzeSScFASLL5TWa1PFq0oiI1RhWIkNKGLbEXNW7+
	 eqVNdG/SbJu7he1I+8DykT2Rcg6BDKmiHK4tWW9KI++LpAYd/eSpQLgqt7NeLhuc67Wqi
	 s1sKuDs1NN8KoJGsjdOZgYFlhH9AS1WR+qhkHFqIrwcDiXTEV8Je6cVtYpTFr1HPz16PH
	 +0dOfcW/T/ddoNXHstKWkiK+SJbLzvm6OPtGTcLTqYRkLyCQPzAlgH51yjdDH9eR5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaqr0bjN;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5546606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5546606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaqr0bjN
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1746862b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798423; x=1795403223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfVzAJ8JYr3tOeyUpGtQ08wEF3tJXXOK1aQTqHdgZsE=;
        b=kaqr0bjN+QHNZOPTQJ2d0gdtYA5vBPiqzZjkPR3gzLC/zAlsFH7Dd5VLunDlMve6mh
         m/+tPJ2oXxfrm6ah/ZOBKfKMB/AK1QyfTjV0SSZQJ6QvP6PAoQ7ndUVzPbCTJhObF+a4
         euxOdqg+nVo3UpwlpWc3+BlSsZW6mzMZpzHzneuntMiQRsYl1thsjuk+t2CNmH1QI2Bp
         w7lj0D6kZ+WCTWUd534xL7Xx8UDAPM6BQ52NDMRIRaJX++lwOUKfwP7hMOYdcQhVYyhv
         4ok84pCIKmUsj8pon+pT70i13BLxPHBMqb8/nGy5CsiKYLoBLesG3FM2cYBXpiicSX+p
         xE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798423; x=1795403223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfVzAJ8JYr3tOeyUpGtQ08wEF3tJXXOK1aQTqHdgZsE=;
        b=Act9oY4Hx2qMGjUs1QhWky3qzsWZEofyLjYf/o0pAAVodNruFFharVbVtfYdjdYTSo
         9v2AUG1aFoJ7Xn9skQa6JvyZJV96vmcVGPHi/dAigtinJzfpjtnHbm/DqNxviIfUH5tv
         lx/hP1ma+ZL1lYdT2m21iqsfGWWFc6Wd554I7ITaMRbF/0+DdQUacG5SZaj+z5ga/06i
         0g4kVZu0o5ytY5ymMwC744iiH7NMY1d42DSCTnS6lgI30vYK4jnzUbNIXYrmOwjQv0LT
         Hb3z5Bl5ONNiGLJZyG0PcziZSv3nCCaKXijWbzdnXeoaK1+vzWq6HV7FYqyonTLE0SIK
         Hu8w==
X-Gm-Message-State: APuU4Z8TUvrHcf/dNqFvGBApdgvKsx1/SG3UVxi+SxdSu+f4CyjQM9ZX
	4ZnjvY3J4CfkgS+oGnv+U4mKmiLzewpy45E1sjBHJiIe/B//HFq2Qq9PUd07gl/I
X-Gm-Gg: AYBFou1YwbsN9RiIUPyDmGDxfhtnuAMTO14Bw5MEqG4THrVxPH0iLafErFKu1SPyrNJ
	GYEQh5vQZH/pxdluA0UTO054UA7EK1pQOQIOjU9UKc7f4dIpsey84ih2GoKhwXsbWbm1F2QAz72
	2NU+ifW0T0k8J6gxApuHASiAE3DMYmJqpn46MxCZ02NGl0rUcQeEvytMsU3yzbNBqCGboVedd7j
	G8eFaNTA9a20Qe6rJ92mZDyTm7MtJAs2EgYPLnMPtwymF/xKXeAJ1sq0IGr84F7ju2BPXgCLUgF
	ZQI6DaC+zvzeR+6EMGtwffgr9fizQ3UIzga0s4Wbx+zqYTz8lrmbn+sLliEsKubtCW1usuq4f0n
	ImjjEggqY0pu/FGboG85Q+Cl05tv4fS7WFdypFp5PgIm64tYY+wKXNSwcN0IOYhgNsvcgADp3TS
	7hl2dYLQeEArOo+q1jpA6aZBfrBfO31QzFvzYcoAjvXD1Xmck51M1ll6/dbKS5LzrfejQ738J+H
	RNPLdgAS+ZmVT9uTAEMvbBFkZi7fafkN4LEWg4IzJ/u5EeVadlpGNbe0vGI3gZi4OYVFen3Kx5m
	OvQAl+56INexfZC+JtDvGZQwTukWBB66UbRiDhsH2N7hrQW4BQ==
X-Received: by 2002:a17:90b:5627:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b1b0a37140mr9756701a91.39.1794798422744;
        Sun, 15 Nov 2026 19:07:02 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb18b73sm14150263a91.3.2026.11.15.19.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:07:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A907E423BF1B; Mon, 16 Nov 2026 10:06:57 +0700 (WIB)
Date: Mon, 16 Nov 2026 10:06:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jan Kara <jack@suse.cz>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] fs: porting.rst: use literal string to avoid warning
Message-ID: <avpzSippbZRkaki9@archie.me>
References: <20260924183915.400588-1-rdunlap@infradead.org>
 <hyk4puvpheleitf4kt74aamqex2ytuxpda2iki5bgzoteldf23@pccvy6sdmerx>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2aSM361HPXJ12lPa"
Content-Disposition: inline
In-Reply-To: <hyk4puvpheleitf4kt74aamqex2ytuxpda2iki5bgzoteldf23@pccvy6sdmerx>

--2aSM361HPXJ12lPa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:32:43AM +0200, Jan Kara wrote:
> On Thu 24-09-26 11:39:15, Randy Dunlap wrote:
> > Avoid the docutils warning:
> >=20
> > Documentation/filesystems/porting.rst:1417: WARNING: Inline emphasis st=
art-string without end-string. [docutils]
> >=20
> > by quoting the const pointer in literal quotation marks.
> > (Adding a space between the '*' and the '.' also works but it looks odd=
=2E)
> >=20
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202609231806.ILZP6Fy0-lkp=
@intel.com/
> > Fixes: 025756ee7b47 ("fs: port mnt_idmap() and file_mnt_idmap() to cons=
t mnt_idmap")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>=20
> Thanks! Looks good. Feel free to add:
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>

I still see the warning on current docs-next, though. Has the patch not
been applied yet?

--=20
An old man doll... just what I always wanted! - Clara

--2aSM361HPXJ12lPa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavpzSgAKCRD2uYlJVVFO
o2fxAP0awLC/NOAhUdn3hqtAYhGUjdvzKU295bC5dTxWWiP9pwD/c/ih5Jvt+/xO
1xbWcqLtQkEpyne9Ow5zvgkmhh7JTQc=
=tb6M
-----END PGP SIGNATURE-----

--2aSM361HPXJ12lPa--
