Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B893B6C14
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899736; cv=none; b=V5pchR6qFERnhtueIoXZkT2KInQy8dIVVci9/Qzf2IOGEBpw1OS1u5/UWTdDLV9Yh7tZp5BR6pDWvEQUjzSCoUDlQh/lxHsQ3wmWraPKb7hvAvoHIDltIhbvEyc5NFu1gvp+X3wpm+oOhhue8S7w+wMYxM3I3h3yq/48lV+32OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899736; c=relaxed/simple;
	bh=dmuom4KhB+a1iF3KDGhN98dp9tB1+TbVBU6QMt8s5wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owijZgwUxZ0piDBB7y/1Q4/QXHDJ8b5haxuhaTMNFaBWwzB23liIlb2xHxYQ6UR2XN/yoTZBw1e7nZfYCIep7jqwkkI12I+pHsR4n6avPEOyIX7MdCx5r5KQzD6RlmPkFtL1NEF7ESIgFqayZ0EHelKwEwdCMJE81NAv8+tGWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODVc1Tu6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODVc1Tu6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EE81F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899734;
	bh=dmuom4KhB+a1iF3KDGhN98dp9tB1+TbVBU6QMt8s5wI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ODVc1Tu6KscBT4/FXgn0LB+fn/KLN1seHZy6qmsWp5Jx7mE5B0f9fc0sKCrXBLSeG
	 xTIOO33rAwX9iu6pQUxxyloB1yW107BUc68gidH1UyGN9kdTdlC6+k1NEueTlKdkde
	 c/OX/sDMbQ4uJ85xtbM0ZEFqObvmci7jQMbpmTBhtCNfV8jwT9zCElxwlsGF6jioJp
	 umAGt9qLrS/6ujpcDDMLYuJw08TbxnBobVfqp9Ml9tJGm456bJvMCCP5RbLPWL9L5T
	 c5xjHOdeA/KDLHC+n9eXIUfn2kQq/IqsrZZz6VIFyqIyDCbOSEPiRkAMoGiQBgJCot
	 7cl//8O9uPwKQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso4530497e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:35:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzoB0DpUb4mYVMCOt+PoXt3ychsHCqrc3SF6HrD+I3Ox1lrCMvVJ3DqwsMpF5MtP6ZAtqOTilz2yQZf5CU=@vger.kernel.org
X-Gm-Message-State: AFuF++nozP9z46M42D63FjUg7QfbesmUw4ao7uD+cndDSMvQk8yTvSdQ
	CqMQ0gMMCrGSctIT+mS5XPLLv1QpXj+pVc/nxXsc4nayrrcHCIW3OB9gbpbX1cRXOiNEFODyxC/
	5YBnk+rl9IIsXmKEBDp3GGpGa6KjfXcU=
X-Received: by 2002:a05:6512:3f0e:b0:5b5:e86f:3550 with SMTP id
 2adb3069b0e04-5b616eed114mr4995073e87.9.1788899733518; Tue, 08 Sep 2026
 13:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908174403.420507-1-kuncy7@gmail.com>
In-Reply-To: <20260908174403.420507-1-kuncy7@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 22:35:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLnzzEsjB476rkC9TyMG7ZiP8Ou1jBy70G_89Z0nrgk3cw@mail.gmail.com>
X-Gm-Features: AcwNN1XEHE4YjpmHKQ6UPV8OOAuOMn_3eO0GedRom7s1gWieUX8u4geTCwvQOgk
Message-ID: <CAD++jLnzzEsjB476rkC9TyMG7ZiP8Ou1jBy70G_89Z0nrgk3cw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: dsa: realtek: rtl8365mb: wait out the full
 chip reset time
To: Stanislaw Pal <kuncy7@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 7:44=E2=80=AFPM Stanislaw Pal <kuncy7@gmail.com> wro=
te:

> The reset bit clears well before the RTL8365MB/RTL8367S has finished its
> internal bring-up, so configuring it right away makes register writes to
> blocks that are not up yet get lost. The switch is then left half
> configured: the CPU port link comes up and the switch still transmits
> towards the CPU, but nothing the CPU sends is ever forwarded - no MIB TX
> counter moves on any user port, while the MAC reports every frame as
> transmitted without errors.
>
> The driver already documents the 1 s reset time the chip needs and polls
> with a 1 s timeout, but stops waiting as soon as the bit clears. Sleep
> out the remainder of that second instead, measured from the reset write,
> so the total wait stays at 1 s regardless of how long the poll took.
>
> Seen on a TP-Link Archer AX55 v1 (IPQ5018 + RTL8367S, 2.5G HSGMII trunk)
> on roughly three out of four boots. Unbinding and rebinding the driver
> always fixed it at runtime. With this patch: 6 out of 6 clean boots.
>
> Fixes: 4af2950c50c8 ("net: dsa: realtek-smi: add rtl8365mb subdriver for =
RTL8365MB-VC")
> Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>

Interesting fix, with an interesting optimization of the reset
deadline. I like it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
