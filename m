Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB73EC814
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546487; cv=pass; b=r4Y2c5GWULLjsrcPlSP100uDzomb3x0DW3EEQHdTpP5RzGzFutodEJk05pb+3wgiaO+cgCNLk+RGKsvBUMTejWLRIhioQU+r/xUx+m+Xcq+R1WgZ3afcfSiLRPy5e69iXr7j8IpDye5W0uO08GIx5ZmN6LcieezEt6S2jSkGdDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546487; c=relaxed/simple;
	bh=kIYgiSZ7YV7WDfHeQrNvX8UYXcdwtFclhCQ/c6/wqkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICtA33qMICLODKx3BOQ7Q3ALKwUip3QScatIU6FVliIARSH0b8xnTPpbqR8D3YyoWNTXoaFBahY2vLBl7bzUvPIxQLngt7KOfYCqWqaHdZZMlkWLdYWZvW2eTqt6zNgcyzw9r0ODdh+9Nd5c3UavX8AGcxg+IahZmKLl7DnTY5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8j9eP2m; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8j9eP2m"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso1970426a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788546484; cv=none;
        d=google.com; s=arc-20260327;
        b=QIcBRQidwlMxNnjyZpGhfomfhhHnVZeDCucDXHcxjyfOVn1j3og/yMHjNy+1QEkryq
         uuKoiEN2BSAKQq0IabAvIxCYWye2KImD1TZmgtTsme4mmDx2UsKMLeFRcEaSj4loJSB/
         6HB3Sse+JU+xrXwswjq42yD1V3VKsYoKFwzU6RXC/kPZ9si6g+VPd8Ci7lRkOySJjsE7
         91wLJd35F2sJbH0GUEOubbiPwfePxpd2WZfmmWHS8yj7UNOBkw3lcS9A6pJ4c6JheEaK
         ao3OR2zt6zNFs9v+pYWf/IomANBm1B2LEiQBB1CrIx6B7XZmPuz7n4CB9y8pDNFVjf4Z
         iXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gNbP/W4xLE3i1okNIsOPU2vpDyzXNTwhcTGTap6FKmM=;
        fh=Q1v2jIndBKOImPadM6AgHwwVZhMegQe2oQMtHixm4IU=;
        b=pCScAa98Hs2B3s+e026xLZb5mt7ftWC7BeuT2rvhzc+sQXp1hY3+jN2+M1i5MEaPE2
         FV3oyiGJupEtDSsP8DVTIrkt+4n+LEHywGl3YTgk5J7BLmXDpie8+EivZ1a4iuwsoMcC
         rG93xQQ6DuYGMEVlqg/I4bJ5NOW4pu7LtqNs0NWDx6cCsT2E/7chjclxEJT0Q29ZWyjd
         VZXFCucln0VhkocrSPaUlcJuqNQhFKtLCS6Cwy4tzTvZMPPvVzrjYCPa1T+ahNa18jA8
         wEVwE1pIXY4rvY4cmRkeGOLj9DAG7wh7lIAOMdLokXnEUsC7cMXYMWKrWTvBCguup1wP
         T6Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788546484; x=1789151284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gNbP/W4xLE3i1okNIsOPU2vpDyzXNTwhcTGTap6FKmM=;
        b=U8j9eP2mbXBIsGv4hDM3ZnWicQtE/2uZOHMaPJVosvWQtMRSyQb+sFCuwOPxOEzakI
         aLnARD0Y1h8seX+ECcljWNOzyp1R3H3ZcVPZ3Gd4V8BQnrzchYrPuXM7mMtc7C+/cWvS
         mNoD6HnUC99uv1o1KDacTTOCar+EduyyKe9WXLT4r4n5EOF1C22gRfnEyA5pEakEOh4r
         /RjMB0ks192hUH9aR3uM2pHzCPNFdCjp4T3YXTV1rqisOiKKQX3evaBd+owUNPDXCBg3
         TiHpWsxlyum9K6pHDe4A7273bcRAbBCqNVX22inTxe7AhH8S38elVWBtaTgEAAqZpD09
         2eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546484; x=1789151284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNbP/W4xLE3i1okNIsOPU2vpDyzXNTwhcTGTap6FKmM=;
        b=J3htAM67ujH0ZiBdAi3vAFFNu0lMLifgFe1RowtZYJifGB1FF6So8G/5a/vdEncQbN
         vH89NEGlaWGnDLwXYpGDOf1h5/m4O5jEDvMeV9K7LZm7CKEeiiXfC2LWxetx3avM/V6R
         WwD6zMaCIbdQwG/fEa+CjDdMiNateyJ9Fv0+if5yUAxw309aG1DuDLn5zNBG8TQ79tjU
         evbjn+41R6BdTNmCwtdg1PEyG4SwgkqZyzrQnBBIIbe5CUiecvjCEfTmdX6fitaHw4iL
         zwCyyAylBjHbcSpfP+V2lxNxFcGD2NlXoVMWB1bJEAmOdXIOPMN6X8XC6hWZhO45QO3Q
         HxRA==
X-Gm-Message-State: AFuF++llfQxUEYdQIxyAZAtEQZqOGIdmi6jiIpm5/gxkj7nLSSEClS4M
	LI/51kwsVtVW0x/s7/fdEt+bn5nbL7KQgoMJ2e3QraEk1CDN/12IAW1qnITQLmGMF4PFk5jUhlm
	CHBua1/hG/JCPC48aExzfI2sm1mFTTmA=
X-Gm-Gg: AYBFou0eXssA+KaCoXIXWVB9XAHAJsQYJ3Hd0jUyKiFUMwQYSGSWPIjbAy4Mhy80u+6
	ghTA9tqQI4+98ZqPXQuSCN0Uv/cSKkFt92SyL+0wP64Qjl81l4cC81ndXo3OJXe2Ri/jn9rCo81
	zrK7WZqqqzoN4kT+ZrhrQZA0J2gVSjqY6fsQjKG1SSk/Ly/EFsgIxRCrOy5r5GUmxZUQUdALay4
	3DUoSgH+rF57pCQkSqr/3yxk8SEd7DQB/cKEP+ZgZxDL6NvG8KrtJAYJUX87oFklrHDwd2kth9G
	jpSbI5YNf/6wQSluRux8UGW7dlnd5RJ+zG/pMTCvenibvOKvbkuJyjW09FuveW5h/esUVfxwx9y
	hhOKQQ8GHowyedu9bzIo6flvC+eyvUnGBnZ8LiOgFMFTLSlRSOCDcUKKeflsAi6sfXvK12jgJZ3
	WDdTu1nA1KrU3vOqUwE4Eo+/q7tUGLFAeGLUNWxP4ftaNEyK5IyD/TPYY=
X-Received: by 2002:a05:6402:1d4d:b0:6a7:ee55:dcd9 with SMTP id
 4fb4d7f45d1cf-6a7ee55de4bmr1867044a12.40.1788546483976; Fri, 04 Sep 2026
 11:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430221123.79947-1-rosenp@gmail.com> <20260903174710.yxgdfqjt5neryhjh@earshot>
 <CAKxU2N_SPEoxJ2jE_Dm2AtYW5vxU-Cx66knCDL21bPGdbpHhCw@mail.gmail.com> <20260904180343.ppckrd3ohix6ftyf@jockstrap>
In-Reply-To: <20260904180343.ppckrd3ohix6ftyf@jockstrap>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Sep 2026 11:27:52 -0700
X-Gm-Features: AcwNN1XLyC19AVAZpQEsxXl3GhdmSNTfJNBvK98SfkjT3U4vwc55YNcNsW9TbUc
Message-ID: <CAKxU2N_f3XxNnYPxTYth2NXu6srX+aXZ3zRgunVdPPfMMJsJBw@mail.gmail.com>
Subject: Re: [PATCH] firmware: ti_sci: simplify resource allocation
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 11:04=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 13:34-20260903, Rosen Penev wrote:
> [...]
>
> > > make[5]: *** [scripts/Makefile.build:290: drivers/dma/ti/k3-udma.o] E=
rror 1
> > > make[4]: *** [scripts/Makefile.build:551: drivers/dma/ti] Error 2
> > > make[3]: *** [scripts/Makefile.build:551: drivers/dma] Error 2
> > > make[3]: *** Waiting for unfinished jobs....
> > > make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
> > > make[1]: *** [/workdir/Makefile:2232: .] Error 2
> > > make: *** [Makefile:248: __sub-make] Error 2
> > >
> > >
> > > If I am not mistaken, k3-udma.c and k3-ringacc.c will be impacted. ca=
n
> > > you check and update the patch?
> > Just the former.
>
> OK, I would'nt be able to apply the patch which breaks build.
There's already a v2 of this.
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource
