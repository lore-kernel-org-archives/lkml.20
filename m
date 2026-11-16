Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816689;
	b=AnDd0j8VTri561xiK9cVZFMar2oagY0jWH7v6hKCAEUnc/Zo+d/p6/sUHSmqI8IHFOCj
	 C9WzZa9/s58Ke3gCm+gFOo6XQvddWANXFLTQyA7TZyRelDaANUvvEBZa3G7cz4mOxZE6G
	 fPYtZqzORcZ0VV5FtmHONAZpAg0GgxEUoC9aHfk0n+AgLMvkW7d7SJksCAU/8itI+2wGY
	 A914DzZnJ1RNbKUxA1khbKt333qQNa574cJ541+z6tnR/MUnQ4w56wLss0vCI+yn7gjGg
	 +qsUF6FjoF3XafTbrDas1x+Ji72TLQQbp5R4LUL3Odxngx1GCdli0x+YgZ1q8OPe5/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kyRnP5kwtYUNzzZDX5JFK75xNgkANSF11ZGqIG35Fvs=;
	b=sR9/n6zv4wZCwDjM7PSmSy3PwS0icmb4X0guiU3CiBAiWgZ2zUYS+tGs/Z0lGghnDlCu
	 8zmCyexQBRbL8wgFOc0FaHXSwy0NgqF31qQGf3sXPEo6xO9yY6r9yihV1xKngfVw6UP4y
	 FTM8HghHdv2rbNwAagshHkkF0quLwMr0rgVHWYepEYuDTwiABd8j/lVAjW4NOim/Ok7jm
	 I6xYBafcoJmA7VmASgNK61N/90Rvgdz8rAaWrZfzjeP8EuVeQv4joFtZywMmQRnCTswvF
	 Ee31C8nN15fgNHjOmyWpOTLkv0onfd2/yKE3uL7l5L76i+ql/Uh1dl789rPK1qOk6jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yp//CuVQ";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A03606A88D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A03606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yp//CuVQ
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1306775a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816688; x=1795421488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyRnP5kwtYUNzzZDX5JFK75xNgkANSF11ZGqIG35Fvs=;
        b=yp//CuVQ6tdrKLYMsacnTGDNeVRcyjdQPnqJDsgEXE5mjxTaLLY2IDkO3w7/4LERF1
         ck7lG4y3JaDaUuNlqPyw2Mw9nWyIr3hTyvIRQGAxPWboDb4jfNOsmx6E0ddI2EvZKXNf
         1EzOJ94n3fEeNM6PndtETCPxRl7lBlNQjikHLpISJLcNFSAbjSYybnM24y/0ZkDvOxM7
         fEsYH31XCbEyXeZUpITz+ilx7YDm40vc5mYDu652koEjNkgebqAu0ci2xgm5lQXExJez
         uDWoyq2mr6ENsOBjoSt/enoPs/pdnn9oYAXO/OjDCyq+Yr1IhOXlKBP6Zs04H8UGUNDP
         8XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816688; x=1795421488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyRnP5kwtYUNzzZDX5JFK75xNgkANSF11ZGqIG35Fvs=;
        b=U3QMhHSdUwyQis5XJi0sghCLtJPf6dGMCkhlRebfyezc1j1sN1AWzxb/bnIAMugxDe
         9T5umdUhFcC3Aqhz9UmsOOjWNQiaaR6Z1JTSZriXuYH7MT4/E31qDcJ/sIPCugcWNL5o
         LYr9zxiw0eTJhJcoGeD2b4RJZwaOdwxSkgQfb/FHyBdpQekSxj6bkEXuuo+Papgw0ZiY
         U0XmXIwiG+cGhJSMIR//XY9Ko8HKFLYXmF7NWP+1Z/M2ZIaRyFh2DtzBXppsqDH6IYro
         bzQZ5IKSGx0Gx5T++eT4YRbXg79HDJSE1ApgTeXLouNrb3Dwy5ohSE0d7A59vTAYJdLi
         XhSA==
X-Gm-Message-State: APuU4Z8ozDY9Et0uDdReVo91+tK19uNP7vDMxIQn4aQdNjbZ1kN1lp/W
	JHRmuRYvjo85x9uNzozz3uz2JwMqBRQ3rIlZLVWY8YmSPv6rrxJvud3m
X-Gm-Gg: AZFdTZeFrQoGOUyWqYGBAZokrtq2S9AZkn5h8pBiuBFvAHRqHql3b4Lt+kF0icqEcnR
	crB0PG0iCmGiMkiz/NB3zGMY+helkhSOA8Lj11+9FpocqsWhbHMfp2puFUpoIcsRBgeeTJii4Se
	gmR3LoUt7atWSC4fOyYyGJekXD3H5A7YBPW91R0XY26E5lRDGQCwmaE5h4R6gn67hBZyI8LdfHK
	/uQ7iFikdete/3xtRbLJ60Arby4aIsUnYxp3aP5sgZTUfwS8BkQwC62jHA3OqxHdnvZoonsbVNO
	l+m5DWZqpD5gSdxF6hqWobdGH/SiziuqH3XXT/aquorlPcz+Md01+wOGPBHUuDtCk5+QRbQIDre
	6ns5NodsG4SYquJHuWLf/eQDnAChjQc1gskQrZ8u98uzqjCqW9tOC6gEgy/mceCVxLi2/KGJFlm
	mmDSfrYnxDf3Y/BL0CNYerHys+Xo2aTcDXvcoZdrqyBh9Ou6vY7aYw5EwRHcOKy6fu+yL121WA7
	u00i4AHtkXe+U9QFELTEeSc842TDROUECyPdahO79vuqT0g5+OSVyDBU+xitpiSCER9x5gxL9q6
	226kuSw8tR0XTNRCwJdNPHz7NsQ=
X-Received: by 2002:a17:90b:3f8c:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3b1b0b48069mr13299563a91.24.1794816688457;
        Mon, 16 Nov 2026 00:11:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm15087388a91.17.2026.11.16.00.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:11:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8D91E4240780; Mon, 16 Nov 2026 15:11:22 +0700 (WIB)
Date: Mon, 16 Nov 2026 15:11:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] fs: porting.rst: use literal string to avoid warning
Message-ID: <avq6nOcr_EddfFuz@archie.me>
References: <20260924183915.400588-1-rdunlap@infradead.org>
 <hyk4puvpheleitf4kt74aamqex2ytuxpda2iki5bgzoteldf23@pccvy6sdmerx>
 <avpzSippbZRkaki9@archie.me>
 <2571c5d4-f7c9-43af-b6ef-12f7414d4709@infradead.org>
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
	protocol="application/pgp-signature"; boundary="EWd/PLZe3Dyxq7Kb"
Content-Disposition: inline
In-Reply-To: <2571c5d4-f7c9-43af-b6ef-12f7414d4709@infradead.org>

--EWd/PLZe3Dyxq7Kb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:39:24PM -0800, Randy Dunlap wrote:
> Hi Bagas,
>=20
> On 11/15/26 7:06 PM, Bagas Sanjaya wrote:
> > I still see the warning on current docs-next, though. Has the patch not
> > been applied yet?
>=20
> This patch went thru the filesystem tree and was merged into mainline
> today (Sunday) - Linux v7.4-rc3.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--EWd/PLZe3Dyxq7Kb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavq6nAAKCRD2uYlJVVFO
o7F1AP0SXQPjS8cB1zqpVD7La05w+0/TjhT7iNLWZNRXCiwExgD+MEBax1sxKgvv
9TIo24H31S5uSJmAUUhyTxRhJN2ieAc=
=Qfgg
-----END PGP SIGNATURE-----

--EWd/PLZe3Dyxq7Kb--
