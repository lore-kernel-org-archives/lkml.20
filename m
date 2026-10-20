Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489252;
	b=B2NUGHFM1FbBChcdM/UC1SclvnFfqlr1ogYMIppc1ONiDMPQFnjfl0X4a8DTKOUmeIGQ
	 PLZkSHgVitqFIZEPv0izM6OuOl/7xC5HOupg5VX0oV0BNM9KGg2dSruFsi+V766xltI2b
	 a6w0oXqCmeVkjKMlxhOCSV5LrCNDY2QTRkWtidT+YLJJVQxhR2FBzlewR3cik8sb41aZQ
	 kHSeQU5lVdFFh/dkgimhwm5v5ZJGlXPcxQP3zKnAlr5lZsw5KWS1BoeD5QfXB4r/HXLuw
	 SN/AkywfHxqXPoss0HNzvhkqZg2fXoRXBctI2Xagaw1QyfI15XNpH1EEi1jPT/m/+2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
	b=ga2YWCqv+x1iBCWW+4J6ki4dKpHuEWRL9qyYj4YMTpIXpTwaDkTvuw/8CzoQLbJ2GUcz
	 9wYB/pDzNdULcpwniFyKBbKH16nsZpcf2t+gI8bSQi3FVdH0SOLJhrIb8EMHlHAiB2jS1
	 RHhuOjbyQxdWlc4kcszFRJX7X05X+sYh5KHyMXmDDQHLSucPhC91bMH7xejQFtN2DdUU2
	 +sTuSr5BrqT04sxzwTupKgnKjs8oxTFO7pcRlzcZ1hBsHD0qM28hklIE4SvqM4d0DHWKG
	 +h9ul2fy8E7gfLp4q0Srox6j5Gp+K1olVTIvZRyQh0Oz6WVYM8SIp1mD3fqGK8c/4bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XV4Cvim9;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40F60A263F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF40F60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XV4Cvim9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so21004355e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792489250; x=1793094050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
        b=XV4Cvim9PGmRPYDYWPvQxtCfIVwqwnzysqMcwp5ZopGQIZiwPM2c/Blf4nJty23CBX
         MUoruMd6T9T63oEUmvZDXPd3ykx9ceI+H/n0o6nSaYrKuLSBL+A4r1koIYW8OJJCy08d
         ogtgHykli4AdY+EDDENGKkka9QeVdV+NA8+62bY2rUbUk7Mc4T++oXX5CZN1xWDiJP8D
         ceMCkm7yuea88WI9Ugb7ISrBk64f7qcNE6jvwRziPHMQwGdJ+Zq++ik8gGD3PUVZNgkp
         g6QyDPzCN8CfWcseqJAaXh7BiG+/dwz9S2vUmThYHmNrUxEZivkLhOZWN72QgpkyQDCn
         daDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489250; x=1793094050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
        b=U0vN3Ij3KaEQtgY4VdVzpsgAaluGl+VWSZkeXN+lzei9w/LqsJ8JFxx2lF9WWsxhzo
         FRLbQE5yEjXikanTZn/DpNluq40wN3itvBt3yitn7Ofecc4h5fvzrM0Vu6egYsbjADkI
         el7Vzy0EjC4Kd8Ug2inxuQ898HeqizX0kqwUwpCxNcLW0zLAoW8odO+xMwSvCSQNvBRY
         P+moFq6T9a58I3+s0V7AZ3hTy8YBWvt1XfCAxXP/tFkld/eR9XQVVaD3OqOgEBxTFbCC
         vbgRbv7irrM/zxsqXx7wyouk1d99HQofAerpNEvOl/4QmijutOp7RtbfGpzkP8Q8o7Vj
         bc/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuGJVPfTZ2aVbtQCnkhLbsEy/Qu8cD6Hg8oV+ZXKvN4c/o4uDSE3EI1KyU3GhXPBi7bljRRYZHqZRz48Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMPVifTm5kNds6rN0Lv1lmW+tOGUmnFoSOV6Z1lkgmuHe6sduC
	kd64p+vB6xBkoYduhsv7KFE93TqAGac/v5VUrmcuUJ+PahAYUtl76bun
X-Gm-Gg: AYBFou2mZxw2nymQPII6tk2lvKTdntURIjrfe7B2SDrYh5G0l1jhYyRQ62G2U9Up8CK
	MYlQ5RlDVnPRnFAmXdTjimM3djTTjEGuptBN9i3OR4qfmx2EaxK3jJyPSas8Oi3Le8q7FqdIpgF
	dbfcKyyBw8x/G1+cWEio7H4kjLAp3YUHLcx1be7pk7hUGa/4Om1arVBUXXy27eWCfnofuvnYOkh
	xQxQuHMS5B7YyozG0cVFC0SUx+ejOYYpcPyGuqe3lO7GE5Yq8f/YDmPOEBDUTiPw45wzvuvpHqp
	gsYuoQdL0+B77hxXFWxV6FxzqE9k8D3IgF8pLq3irGwriIqO7Yd7NVYodw7O8j+8DIjGXxrp9Wx
	jISPi6xgNpxyZBnmv7IEeDVP/zJGvmNqDGCD4m90Cafx6r79PQ9H4IBCYpfGSKnS5FG7gtANYru
	Hrcgobn8BSy011+SEqWpg4ibsq43rsDf1Prd0TtMQAH4h3Apo9/6lyiQRBEYkFXw2hbzaKr4k8d
	MSWrvBP4py+6/3JodguT5UK6a6Fw8wKPgk=
X-Received: by 2002:a05:600c:4e11:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a1d75f24b4mr211056285e9.9.1792489250061;
        Tue, 20 Oct 2026 02:40:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm64517275e9.13.2026.10.20.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:40:49 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:40:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, "schuster.simon@siemens-energy.com"
 <schuster.simon@siemens-energy.com>, Ley Foon Tan <lftan@altera.com>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
Message-ID: <20261020104048.7b038bdd@pumpkin>
In-Reply-To: <c32b7ed2-fa3f-4a58-9300-21efcc88f056@kernel.org>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
	<47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
	<c32b7ed2-fa3f-4a58-9300-21efcc88f056@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 09:34:42 -0500
Dinh Nguyen <dinguyen@kernel.org> wrote:

> On 10/19/26 06:16, Arnd Bergmann wrote:
> > On Mon, Oct 19, 2026, at 11:49, Thomas Wei=C3=9Fschuh wrote: =20
> >> GCC may emit libcalls to __mulsi3(). As modpost is not aware that this
> >> function is provided through the linked in libgcc, it fails:
> >>
> >> ERROR: modpost: kernel/locking/test-ww_mutex.ko: symbol '__mulsi3' und=
efined!
> >> ERROR: modpost: kernel/time/test_udelay.ko: symbol '__mulsi3' undefine=
d!
> >> ERROR: modpost: kernel/resource_kunit.ko: symbol '__mulsi3' undefined!
> >> ERROR: modpost: fs/fuse/virtiofs.ko: symbol '__mulsi3' undefined!
> >> etc.
> >>
> >> Make sure modpost can see the symbol from libgcc.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes:
> >> https://lore.kernel.org/oe-kbuild-all/202610171933.J4bFOfL8-lkp@intel.=
com/
> >> Fixes: 2fc8483fdcde ("nios2: Build infrastructure")
> >> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>=
 =20
> >=20
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >=20
> > The patch looks correct to me, but it would also be nice to not use
> > libgcc at all. What I see is that only arc, nios2, openrisc and
> > parisc still link against the toolchain-provided libgcc, everything
> > else uses the kernel's own runtime.
> >=20
> > It's probably not even that hard to do right, here is what I found
> > is imported from libgcc.
> >  =20
> Patch applied!
>=20
> Thanks for the suggestion Arnd, I'll work to on the NIOS2.

Does the kernel support nios2 that don't have the optional multiply
instructions? (including the ones that generate the high 32 bits).

If the compiler knows they exist (it isn't the default) then it should
just use them.
The fpga almost certainly have plenty of 18x18 DSP multiplier blocks
than can be used - so the resources are there.
(The slow part of the multiply is actually the ripple adder that
generates the high 46 bits.)

David=20

>=20
> Dinh
>=20

