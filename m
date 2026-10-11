Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B062448D11
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720811; cv=none; b=f76Ti/I4k2U4VqDFxV/i+NgGSGs0CswomiuNuoruK4mXPIbUXFclTPgf/EaFGTjebEbSDzwVLXbfC9xGtOFHoy5Gwh6S3wJ9v/Ziqh1VWjnVvCbPVJQiLI89Vqrld6SMl4bgrfnmB8hZ33+KQR6B2LYol4kE+WmSl5AQrHcD4Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720811; c=relaxed/simple;
	bh=xANXtOiaSRHZikF1Pq8P3t+bkAaThlmuB+FyvIC2ni4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/19qkrRjPtlf+z21wKLUxv/caD0W98MDwXLwowP0S4Ro2In5bpNVNrty4TmrbYaxAVuE1i1qKJDe3wclXe1QMPjvvz5NE9pR7ItcRRo8L4tmrNtNK8SzgfZpASpcL4eRhdous1YU9fE7caKTkkxPpCPP5vn6FqB3d9UmVr/NgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg4Zp6gQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg4Zp6gQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so9023075e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791720803; x=1792325603; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WNhfRaYtKVpVmrsy/HA79NcbT4wzVybUHXDzkeeAVs=;
        b=gg4Zp6gQFqmEX1CSGivAJLsgiteD3K9J98Mja3K+2XmXBpa/rat5BMIbTY77Mi0mLr
         sHzzr4VhkLDpA+K0qKWvg4xHuqk+Zq3lwBrRCTJWNd8uPrsiKMpvjtAkVaZ6jdfuNfZ8
         ctC9/0zuQd05XoUOdgp+IixKm33DnPuKJVvM/BDHjyWGjOeBHjSGE4JjG7RCa4/h32Qs
         NP2e4ng8Yynp1gZddbbQ4oCxH1zA/FDfjyMksMDguFIRsQSzlFidiDsYUD/LfbCaZmBB
         I4IqAFZXgkl7hXepDbnJpDpZcPZL65vKWpOqHwhdMbpVhlHsnsQFlODIiZdNeFFP5DJH
         z9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791720803; x=1792325603;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WNhfRaYtKVpVmrsy/HA79NcbT4wzVybUHXDzkeeAVs=;
        b=lh0tptMwTwXX0AcscDTUBA5oqYt6DEC+ajsBMEiQGMo9SgmSwQN9//HBjXtf/eONlF
         ohpoRQ8tEN8E/nDuCCYSnHZ7lwYFFygs7Dr44y+QpcFvMiCVw7DSllOx76Su8uZYLfO4
         cMW3G5QcXj25b+ngEr+dblXXxKApy1dVEd8LIynmzQzsZyXdQJwK7yllHOGTXd6tRYR5
         S04Cf3marnsNK+PgJhj/dJyQTTgXVeSSPDL0RRlZPgAY7wtQlAL/sugGcrfuEoZ78jzf
         Qik7hZ7o3OcqT+RGkDy3l5qIGxqLZVYjkLP2qFnyW43UhvoieP6upYfWJOG2aVGB9oLB
         qcRg==
X-Forwarded-Encrypted: i=1; AKwUvBxSMldBHxykWt2/jQvcpu6Y8O4Z+RFuaukTWAls6TAom5U1T+dVOlF2i/b3XqnCphl2nHAlWMrc9Tf5S9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkmNoBLRv0aa6LTABJnaV6eOVVHC3oGF6uBN3WinVWsNGl4R/C
	/i3A81MXA/fFGPuedLHNwKcgBmTCwpZguM+hb2SjOZFNImtUMh/7UOG8
X-Gm-Gg: AYBFou0jDXaKkZr1etc1WUDAvCfpMdXkmr8gCIBrQZZsa2E7KevUVM49ujOlbeeJ/cf
	FXMgYjUVCUurekqqRpLxF5istc0wXe8qlHbQ4kt5OVyArK71vEyQgVt+Jlg1sQNnebnJdh74AHH
	8lqBtoVK2YgN9FGKZpee21U/wVWQb0lur/EEYh+pE0LTlruiNiAJeDjMkjr0pMHRup7YwQoc+oV
	CmUUWBp8JFyTTywWG6gAUF3u/KO+MZko4Qf/czDugdSYoPL4r9E0FDj20VZ6FA0Yi0Nn2zgAn6J
	GwCQqAbNA8appdJr0/Ut7fRE5KmaYuqnygOsBT7SsQbihuVgRT+XCWYG0NCSg7e4MsgskE536vB
	fgU62AU2XdyMqidfi6RXsbnDqeym3HxIEtDr1064zdigebEFud61dmsvMP3zTcYkvuPbsQU2XSG
	BPpVPl01OFYy4g4Hj6wkZV80+pW6WfmQva77hGnv9wOoVZZs0MZ0oRGdMPrwg7mQu8iLeBabjyo
	1tNjmlu4g2w/bwke+ZvU+OyRWqaT5ZtTc9sRNykbnnijFzlqFM7Tqkw
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a18e446880mr106551865e9.3.1791720803247;
        Sun, 11 Oct 2026 05:13:23 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm328215565e9.4.2026.10.11.05.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:13:22 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sun, 11 Oct 2026 13:19:13 +0200
Message-ID: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartK_YJ80XiTvajPgjPcZKRXg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartK_YJ80XiTvajPgjPcZKRXg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sun, 11 Oct 2026 13:19:13 +0200
Message-ID: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Samstag, 10. Oktober 2026, 14:59:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieben=20
Sie:
> +/*
> + * Each bank has 16 lines, one bit per line in each register. The regist=
ers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not
> supported + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */

This looks identical to mine, which itself matches the old zx29 GPIO driver=
=20
with IRQ support etc that was removed in 89d4f98ae90d ("ARM: remove zte  zx=
=20
platform"). This old driver had support for IRQs.

My hardware has the same register layout, but no IRQ support (related=20
registers are always 0). So I wasn't planning on reviving the old driver an=
d=20
just using regmap-gpio like you do here. If your hardware has indeed workin=
g=20
GPIO IRQs it would make sense to revive the old driver.

My hardware has one annoyance: There is one GPIO line (not one block of 16,=
=20
just one single line) that has an inverted direction bit - and this line is=
=20
necessary to run the routers on battery. I don't yet know what the nicest w=
ay=20
to deal with this is. If we have a good reason to have our own zx gpio driv=
er=20
then life would be easier :-)

--nextPartK_YJ80XiTvajPgjPcZKRXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLcLEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoijZ0QAIYvFbnd86a0BA4vB7p5
HZW7/UnHb9Rd8bwaNM9LhFgFYmTeQPLzMoVsSUt84V+JUge57Kw8nPV0Iux2YNkz
IdzhQiShuW4/7oRjYqDSPStnkxVSeFDPOTmMJWLxqVXDvgWr5UMdCq4btlpYiPaU
mnnG9uvEjFCocDCxhCQpoMAx7HUCy+EnNge9vMPmXezh6+S4u1dYYE0Ap1u9kp1w
9yOd6Joq6hldxa8Rf+IVb8k9aFOz34eK/3HCBUuni0/zIIMiSj4EhUosmD7LxtMp
9GQ0bmuDTognLxJQHVRG2mH11ihkfvtEW25D/Dmb40YQsepPvjBAO3aq/DkoVWAc
+jc5MaYUCIZkiKvpU51Yyc4dWrCPr8mBZLDhGE8mT1kt2a5Viu4E4q7aePEqqmrX
7BxuiP6EDWHhdlvd0twIv4QjP6j+qE6+RbtGFSypOUQ8r5U83qrBNXid7MWXKwEA
zyMF2uh2oFdGAap3RK07ohCigHiuWkbk0HYdDt/VUP/pZLD2OR7ozZ94ResxbsyG
9ymGPuuDHwzHy+ULVHiaeHWygV0AfO3/BdAh+IfbbU8XgLQNve0f3ouodUN98L9M
NZAeS7Kwtpt/55jvyJ/ZxDufW+xIHnHrqrW0HPf/asAchms/6+TkScZFgcJRA8FY
2yHKUduoenPY8vgxk+nADhIb
=xhk2
-----END PGP SIGNATURE-----

--nextPartK_YJ80XiTvajPgjPcZKRXg--



