Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501500;
	b=yRjpD3RBe9wvZCwFEv8gPrCc0aHJOHgtO7faGSoHaqPl0LD5YN1HGZ5A5rDYs+5lamsb
	 fyVlC+8MghMYj2d+sygtIqJ/vQyNZOKhQCq1OA9oQkmKVR7n4/pfAM59aQf66hz4b8be3
	 MFGIU+jkxBhv0cKImxgMGFHhITNf7nrnb7sC2xS7YHtKaEbN3FFoSFLpou/1SsprY+nqj
	 JFSx0VdqvYz8BsYAGMwLSE501ehqrWJYoiBoz9vzacUsWW5LyFw9VLFVNOHF63xTouPwV
	 r1FRB+G4nezBLToA8VgwCV+VBxZf79pNhDHBXY9+0bP0ouL0LIRmdCjEafcQro3QXyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
	b=NWHLjQ7UZItarcTIWTh0J9HFslayvQPmaIURpdHvHr7RdLxjVAlkQGfvs3/PntX54FeA
	 YC1dSeOptnmI2IpP6cWayAXVeya/5ZZahJ+Wu8MM4j1GBXwiqha/VNmjcpUeR9PXL4eTo
	 2NYQOmB2S6n9DQqOcDX3CSB7lHNxqZ54GNIQpgkeS7rh0SHEf0LaQj2GHZdPu4Mv8Q2cZ
	 8hWi8cNwYGQx8xEVmVsvbn+MMgpAqbpHANDgiLb/wMWxLdlXt5IvuvdFl+rK/ZsyWcgBh
	 nJa0rJ2PxfbAYl88I1gDT9waGhsHrFqUZcEaJcZVkhGk/qhf6J4F5yLgoGMAxMZH29Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xF5CgZtM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731BA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731BA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xF5CgZtM
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso444271a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792501500; cv=none;
        d=google.com; s=arc-20260327;
        b=WSDzU0l0MoIzM1gQ3G+r7MArWOu8nOBVNcQjRZpBOymM+st/HwIGIVTIknCLWFvtEv
         fcwKs95EeJcu/7p47c4Otxa0A4RpgOfFzPTON6wjZcuV+98NXF6k8cw+fBySahD5fbSn
         LfRGvEWi/93aS3Y9CRkFrBPzn/EyPKL8nnrHVaJ/1BcDXe2TYgj31h5EICtdTfdaCnVE
         1wYfQ+qNLaDU8P9ooPDRRWkzw+uaeiwzXj0GcrBOnIkpVqDvmKaC8EHMVb/hFe5fa3m7
         hQxRbP7ePbJTHYDijw17M222xuj/Mq7DPcrlBecvCW/VavGUc+OV9Wm3EAe4vVzSaMsp
         ATkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
        fh=flDrodYmp9JXwwWfGu/TI0ba6u1HuFh8fre0k0zEDuw=;
        b=s0uugXwT3FhD9ZXg3LkpiWQvyTIDPm4QC067s1EbIoOENPy3micLbivFMYDFuMsUQz
         u2PKrw+XVo/fWyH4OnIbNeo6FvVzGJJca7Ngox/I+TJ7ZgWAP0V+0gKeAhh8UmNbL+zo
         L3k0jETgAzRuOYu3XatkrlLh0J4yjU+tYvbWvyIFFoWZPX/oc0T7plbZghKl6NkyqV/a
         JBF8elejCLF52YDf+ceBS5xFcN9zMEM8Jbkw1jf7YgK5BHWvDvGYgrqAUvOysrS1u8gu
         k4fG8fuVQjX8qBcX7d08YTcCv/rsuJCAMd4bn7/tgLxteyc1AZUZzvhdbc1qbFpN4qMF
         c/ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792501500; x=1793106300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
        b=xF5CgZtM7ONqwjEt3lKLm698g3fWzyCOm0n5BjWOqpvFhg9vNkeqnuqF1kivJaAQiy
         BbyR27Q730S9zFPzDslSY8IWdOMVWgB5gbNE1aCM8IM9vpicXZOIN22To2gj2yrA26ok
         XyYkWMCkD4kG0pvvs4zJ3HFT9BDce0RLo62efSCvM3QO4chKPLw+TBqPo1/d1lElw/sW
         My/YP9OBng9gTSZj2mCEpTILobrvnnWAhQ49Mss29w02AySVE6JQqkIDY4W520ozszEm
         km6QiWF1uP98FQcrFj6arFGUsrm6dYfRlgi6o4LQN3qb1qt4tRl+0vRnumG12yF65Y9I
         XS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501500; x=1793106300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
        b=Eal5Ujm90YRsb6E6rqeik3pXXcobJFca45HAwKlu6TJtqEqqY3bLQn52o3s5wQvgJ7
         FhIVlpMwZMhtuL+Lx3ULORgL9dr+LugMbJx46MYG7I31ka3WyrIHjTiYPNQ8eAEBm2kD
         EgEnsA1hNDozkzKPL2onlBunmpOKJ0cKFq09h4EVbFYYEStuV8FGTcwat06jF6Wf64Ow
         HnaUFjMrUEplPUhJlEVaW/g9c44ssic0WH6qYrl2tJDU60GE3d/dURLd/HSt7B/ov/rj
         0Qnm6ebVMt8PXnzqAOcnu3LZheHjwoxctRg6LACK4qdk4rnC2gnY56WZm81c8YFxNehv
         u+CA==
X-Forwarded-Encrypted: i=1; AKwUvBxShwyPdeeFBDKmxDQN1Vm1w75k9otir5ZVs7W6er/oqgwN1I8H39J7hMrLy/sEotKnyDGj6hqQQ6AIDNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdqzGGDl1uO4TjMHCqWT1A2atoQX5zjxJPQRf5q5EsYTkH6jGp
	nf5+Jsu7J0y+/GSD/wL//t30+IGMJ9B+xXz1rgv4uTyU6siu601IETOF7kESXa47zbTzzTwockC
	w3Kq/pKb+ht70XPmpj/c1zyU3jPLths5/U1xbywh2PA==
X-Gm-Gg: AYBFou3HphLuXOm7l4J0YG0V2Xp6fWSVT0qxGwTS663vC2FzGBM594jqozWK1aAMqlE
	O0oFgdMePMShwn7h8nIOuIoVlVUPCKw6u154RYoXTp2piudoDBRMGAMzcis3cK02/eiIJKlESwg
	2KVpbbKdvpjNceTzD3KpHI3QuO1E4y6CTnv+D6Vmrfh14dlrPq/8YW/oI2LUqrK7syp5vHh1XAK
	tYXt0y0iaRhQ/CHEO4/fd31KS+F2B4NjGesrWLMkH3AWaosqBN0SYTKkF6gHwCeNG+eAvk2TSWO
	/ErB7txKESjsMlKaDVaTEuWAO/1zOdeV1gU1b7NuluxZ21jLi7DMD1kddje0krFTCRnHK8nuH66
	D32fRIRAa8V2MVhWMRvZTEid5++msFaMVlw==
X-Received: by 2002:a17:90a:d50:b0:3ad:676b:28dc with SMTP id
 98e67ed59e1d1-3ad676b332fmr808023a91.14.1792501499592; Tue, 20 Oct 2026
 06:04:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020093655.344585-1-robert.marko@sartura.hr>
 <20261020093655.344585-3-robert.marko@sartura.hr> <21892f3a-8e0a-4c72-938c-b2e77b9f0dbf@lunn.ch>
In-Reply-To: <21892f3a-8e0a-4c72-938c-b2e77b9f0dbf@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 20 Oct 2026 15:04:46 +0200
X-Gm-Features: AclHuK-2Vur9-XXFhf7sHu604ujSpE4RJ1TCAk85iRxwFehzOQjuEaxeKnqe0nU
Message-ID: <CA+HBbNGLc+imr9geBVSZthromLUCBTbC-4roVuz7SM2PdYPfuw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/5] net: phy: mxl-gpy: release MxL86211C
 Super Isolate
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lxu@maxlinear.com, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, lgirdwood@gmail.com, broonie@kernel.org, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lrosu@maxlinear.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:48=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 20, 2026 at 11:35:36AM +0200, Robert Marko wrote:
> > The MxL86211C can be strapped into Super Isolate mode, leaving the PHY
> > halted after reset until software releases it.
> >
> > Release Super Isolate before gpy_probe() reads the firmware version. Do=
 it
> > again in config_init, where optional VDDP setup is reapplied after each
> > hardware reset.
>
> This needs expanding a bit. All reset actions by the core should
> happen before probe. So why is releasing isolate in probe not
> sufficient?
>
> If the MDIO bus voltages are lost, what else is lost? Should
> phy_init_hw() be called again?

I think that Sashiko confused me, it claimed that PHY HW reset could
happen during interface up/down, etc, so these would be lost.

Is that correct?

Cause if PHY HW reset only happens before probe, then doing the
voltage and SI in .probe is fine.

Regards,
Robert

>
>         Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
