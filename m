Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0350335BDB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736377; cv=none; b=NYPppCn/ycB3GJXIpmDccBWBWWhjCeCzVmb+BDYBxy2PSDMALupZ+SBRkZtfSSpH82iIDIEIFjoPsQ4F7ZIJNT+RKVFKcQ9us8VMQhbFqe3hpWAPQKlE7f2ax2AdlgpRMY6zxlHzH8zXZw32vDkE6FKJEuQiSLB9iwyM/jtC1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736377; c=relaxed/simple;
	bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0WKiS+6OR66EJuxlj0Lc2Shv/fURWjpqJMgaPLz+NExiFAugLXOqeJpB/0uxNv6UUqkdbrHb/cSBGIOxIDt7xfL/t6o2ps/TdU8fevs9qiJ6Aivq1y5pAk0x5A1ioWelkBnDSQ8uG3ofdhGOXMMqP9psh8H9Kub3u/8WR8IY8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNw40hmy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNw40hmy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af27fe287so987250f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791736373; x=1792341173; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
        b=oNw40hmynIT6k5A3rO6aAD8SUzY6NU/0EmKSd33HNs3QgTHBxh8Rl+aUmDjn/z3hFV
         PwqUjlwP+apuVXI/YS98tou91vuosazRgR0nnXRZ8ss6RWphutN1wur/DgasXCUemSoh
         d0iR8EuKvk6WhGXSNguiSYE/+09BvG4tqriPnn5AE+L93S13Exux5Z3uKaC/8K4dLr07
         p6FMgcReuFydDOIqrmwEdDXtQPcQPgSWxJVHJXNhbIstNgWHF3x9kCZLNcf8L7QCe4Y/
         VAwYEeK3c44ZowTR3iPv55XQvUbkOub1zgLSwmdEULUi3pUVbU5UVa25CeGWlcw8QRJT
         4i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736373; x=1792341173;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
        b=ZofAItasCsUQ7r+BkxWEAI9qwPm6ZhPrVXWlBztuzGb9Vjh/rCeztYWp+LxFkMhnHl
         mfaCOUtorcqYujHAG0VFnk5yG78tSD4jmMgcWF2JKCjRX6m3Clm2Ykzz6kTEfrKoGPH0
         PgmwEJo0C7BZHYjiLzIDWKA8TFMCZqV5wJbeKsxEkOPWo5Xh1Nnz0EjFUEErwGiEtX1L
         D6/+MygIa9y3+JCivdu+CsyFoUuPFOFyAWF6yG/pvVkUi6TAPjO3tmDA2+039Pnu1tdR
         AG6j+PLi0JD46pKSkSZPeMCD1JGSFBj3dSk5Esk7xIa+2wwozXDLHX+sufUxwjPYbz0a
         brNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF7vXbQCgbA7gjznXep0hYYw9xOaH60nqXYhZCq8IbP+3vuuIKP/xHrXJ94i/T0PHYCJOu7GdwEXxb9K4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNRguZ9G+MakBK0jIuyy50hgzjji6PkzuHtLi2AQ0jW7za8TyD
	t1hGXFl6p94nXAtgP4lICI/g9xL9zP1h04uji5/qlS/heYomHs8zgVD0
X-Gm-Gg: AYBFou28pmCpGRQ+l95BVR4VqSHTYXakTjqq6U6/QMFxNnq5ORMcilJNc23qbFAbcE2
	538970KO5+Nt2CCqvJ7XZMBWxVFBxucv3+ZkO1B+TFTs+FN1mISwdEhmLSkWmXJr3KCYyN9wMnl
	7fLg4sARZ08+kLegVQ9kgQItOXtQOb1ltjJZ/NSWtRdGC1peWhuY+rk8pefSeyjie19/D+wDJp1
	T8CvpndNbpSetNHjJMcIBGyllhg4QcF8ElLhVer9CymiYo23AxD8gxqJXqCFcvHmWOg9hrrA1Xl
	lFbHvvlXEVe+spQWeT493hCp1lkePvnzneifZhMDTKtNQN5utrN9LwxfUVfdmIVy4xMJtjBD9r4
	4ISXDvM1wWiJNnKPODXuW0hOlbGq0mh2/ivfjmZieXNftfbNFr4RVyDFbBVjuw3xM6p5/kF+quJ
	NG5qtjLCsQsBYFotZI+fLJtZ/k2ujK4QaAR11V4SaAOoD1JX9SVF+Jaqo3EFiuvcguixWu2Q1t0
	gEdXi6s8cl5HzWQ3AYkMsA2qjOUwffUU2WJG424Zb9+45e4zc5RzYLP
X-Received: by 2002:a5d:58dc:0:b0:48c:77aa:2f78 with SMTP id ffacd0b85a97d-48dbacecfd8mr10168095f8f.56.1791736372532;
        Sun, 11 Oct 2026 09:32:52 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dba1be42esm16537414f8f.5.2026.10.11.09.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:32:51 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Sun, 11 Oct 2026 18:32:46 +0200
Message-ID: <QRsVQG8CQny06omTkaluXQ@gmail.com>
In-Reply-To: <20261010130024.177503-21-ghahramani.navid@gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-21-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartl3bGPPFXTCGY5ZUHclgI1Q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartl3bGPPFXTCGY5ZUHclgI1Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Sun, 11 Oct 2026 18:32:46 +0200
Message-ID: <QRsVQG8CQny06omTkaluXQ@gmail.com>
In-Reply-To: <20261010130024.177503-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

Am Samstag, 10. Oktober 2026, 14:59:58 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> Execute bounded SPI-memory operations through the controller FIFO. Honor
> device and operation clock limits through the CRPM divider and cap the
> validated maximum at 50 MHz.

The registers look identical (though with slightly different names) than th=
e=20
quad SPI controller on my machines. I have a more advanced driver here:

https://gitlab.com/stefandoesinger/zx297520-kernel/-/blob/dlink/drivers/spi/
spi-zx.c?ref_type=3Dheads

Please give it a try on your hardware and see if it works.

My driver has optional DMA support, which does allow measurable improvement=
s=20
in situations where SPI access and CPU activity happen in parallel (althoug=
h=20
DMA operation is slightly slower than PIO with an otherwise idle CPU) and I=
=20
tuned PIO mode a bit (in particular avoiding redundant fifo size reads).

The qspi driver is a bit down on my FIFO queue (I plan to take care of pinc=
trl=20
and DMA first), but I can speed it up if your board gets to a point where S=
PI=20
can be done reliably first.

On the hardware otherwise, it can also raise IRQs when the read/write FIFOs=
=20
are above/below a certain threshold. That allows PIO mode without constant=
=20
polling. I found that it doesn't have an actual performance advantage over=
=20
polling PIO mode even when pushing the CPU during SPI transfers. DMA mode h=
as=20
clear advantages in this regard and I found no need to implement an IRQ dri=
ven=20
PIO mode. If the performance characteristics on your board are different we=
 can=20
reconsider this.
--nextPartl3bGPPFXTCGY5ZUHclgI1Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLui4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiohIP/jltt0RdhiQcFCJFiY+i
lBWYzFfkpW0WFbbuaPjW07QU6TdmsxABYgtMo5UywPDwJWTuxuWseKezgKcvAu93
aBjVqfPFTTzLHuLOS9Lvw9+kLzMTTMXNUDmyJdknX6o3MATiXogR65iHx2QLKXUJ
Y7qtesJzGYj6G5HbN0OmNJAv04MR+44AtAkwso0XQQ8okMG/yy9uebCsAGQTCQqD
zWHgbM+m2HAo2cGDAW5VAA49G3GnVUod7kAiCYN1+qwP7/Eahft6Ahvh/30adTTJ
I7StoebO/u6OmOpBrHLNCZRxGX/xZNNYzjhvsNz6cBPFxmcBmXYrs2nSe7daBbAj
tT890gloLO7vRy9S24zRzks4qRP58KjAHge/p82nw4n3lw0/WLrFWlwmnW5taghI
VfIrc51nV9hCh2QVh/duqzEMYSKw2pgf8PETjR2185t+J7ioga4wbMVsNV8FJ1cb
YGD335pLu8UrmU/k7yH91l0NUD4A0szLWfOmZY1bhcm7XD4MG7Yy3UAp1IqbVPb4
es5TEKmpx17UqW8PbxdRqYGSoCvm7PKVxz1W8/L8HHMPFdLh6GFVLn8t8D6ip9Zs
z5pOSJw8bzOEb6eU9zlkJZ1hF0zEgHLd+RcIJe6yEvwcV96D8waWRc8e3FYW5jyg
nGvefMr6NWI8W0ygaYQIDGLk
=l+tS
-----END PGP SIGNATURE-----

--nextPartl3bGPPFXTCGY5ZUHclgI1Q--



