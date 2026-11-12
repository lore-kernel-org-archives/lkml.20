Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515102;
	b=kA58Xe8P2/7TdL9NVurMKhXuua2XbHF/nO2c1f0GvG2Grn+plAOF1MDstlgzXL/S3kKO
	 RWcdlvIY6KoiUx57Rjm83syYvF0spwPUo8PjhFcMcqKgIorO9dDBykjuo9jTH7J+IYraT
	 /fGu3flU2EcZxVCDv3fO8x7Yu5sQGcnsCez+LID/VojKQG8ENpzSbQS9+p2Uk9/eKC8Ef
	 xdPHowGWg5PywFP/WWu1dWuW/0jeEDxWjDQUTiDtsra6hg7YIKdcouaDtvGayEfjS8VJf
	 RUOGUH+r1FSgWO1YYcsurlP3V84BaFoLM85tAqdpyqZwZQibXB26ShKD7tZzrTEkpuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515102;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WO7meJqCu3VrBPx22ffKtmKq1nIJShD8oGFFbmqmLrM=;
	b=Hof6kdn/Tm1VfEDzmYxYdR2Bx/s8D/4P9yPnEhfv/IvA4RT7aS58EMcL5EYvnaRhcaZ1
	 /JTmR/J4L6rMlmHID3HRkIi85akLYsxHolGckkdKDIwy9NRM8o0CQ3m6dT/gYjD+je68K
	 Ius7rj2RcqAxURgq6EHf8t2efQGbO2Focn4O5WdFSfLokR+lFegAU1wI84+bOcgTr2HUl
	 aZzhvAaSsO1Tx4B+MtJui/EzmoGK584ch0+FOppyQ1VDtZTwQ1sNJMcrOdfetYSHrjiEb
	 QtACrV3uedeK0UnzTHecUS3JKcjAVdw/FcRFa/J4ExzkG5stnOuu0tdTOFgwRS/aIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgRFtgQr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC728606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgRFtgQr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3231F00925
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515102;
	bh=WO7meJqCu3VrBPx22ffKtmKq1nIJShD8oGFFbmqmLrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IgRFtgQrs2ggZrRUAgd25LkVaL607Tg2ecfGjNckmTOTeyCbaKKRNH9rGAnQ3n7GF
	 cDq9WqBdElPxScdNZ/jqgT2iFYGtlR96iqeFOYPA6dpjgcOMnOwmdWbMsCp3yJl1m2
	 F1bjpV7XACK2pGiidQycpLTgzU1PmwRi4YzFUfmt4gp34SXcfmiDiwCAijP/z6qSbq
	 BDR/6Df0KryyReWqDopf2ku9E92+sR+VkJmyMIIByhFTpZy0I36qQGIhndw30vLo1c
	 8qaDii9soLRHdnJvXceRFsdNjo/5Nl4lWiHfE0nxGt3AwQAfzoiE0u8l67vhUUtJ2H
	 qyx165clNq+3A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso290138e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF/ESibzo/CKAtvct1Gyo/bEci3cm4+kOhJc1VIRk2ncxnr1LVH0zKGpP972Vlhj89AcgoivmJHrjgTTWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qPUdGx+5QGUV056ZbfdBjRm7G3T2jdmZlccrQjekT6NrGG0Ps
	CEiIxMhx8b6Qa4nGxu/ovXzEUw8zkmeKHThIjKqfVZtKwQHdpz9yTdlLyyihnnx8k09+US2obM1
	Qhh8d45Q9nz8zQbTlsnY7ITArLPgk5HA=
X-Received: by 2002:a05:6512:3182:b0:5bc:f0d3:cb8f with SMTP id
 2adb3069b0e04-5c1709f7693mr184328e87.51.1794515100836; Thu, 12 Nov 2026
 12:25:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d9da17af-f49e-4878-a8dd-59a8919e6930@yahoo.com> <c76ba49c-a962-4838-b8d5-75c5b3bcdc2b@yahoo.com>
In-Reply-To: <c76ba49c-a962-4838-b8d5-75c5b3bcdc2b@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:24:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLnONqTy=DgeUSnZq=Z=dcq=7gvu6bQWEsnJqOXk1FPO1g@mail.gmail.com>
X-Gm-Features: AclHuK_eDEYBVPO0Vc1ixTirMFpO9gVm4DlW0a1sRNDxgMX4WsFgGC8V3sP-rXM
Message-ID: <CAD++jLnONqTy=DgeUSnZq=Z=dcq=7gvu6bQWEsnJqOXk1FPO1g@mail.gmail.com>
Subject: Re: [PATCH net-next v10 06/12] net: dsa: realtek: rtl8365mb: refactor
 VLAN 4k handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com, 
	kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com, 
	contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:36=E2=80=AFPM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> Move the family-specific VLAN 4k table accessors behind struct
> rtl8365mb_family_info, so that family D can provide its own versions
> without is_d() checks in the shared code. The existing code becomes the
> family C implementation and is otherwise unchanged: rename the
> functions to rtl8365mb_c_vlan_4k_read() and rtl8365mb_c_vlan_4k_write(),
> export them and call them through the family info.
>
> No functional change.
>
> Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

Looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
