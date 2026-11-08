Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148076;
	b=CKabGM0bmMIVWZIQmZsIafq0pNC1r0K24k5oRIIihgjmHM1DF6YTFr7CwiaYA+j6HED3
	 vnxmWVXk2AX1Qv+pRdn12zjp/uc4d7MJX7jnjC9eKx7jfv5Ejyyv8vTZHyjHVnKguxqov
	 Ab5MoHURRdZUZXLgJMQ51p6I7b2/kjxecR06WGz70pd9mZ804nVC97BZ+GzPQn9l7Ajaj
	 fmwoXt+MTBTIdetaDBSIAC6JmbFndCHCv4EUarZaV5l5ioy3XhSIbjH330kWeJPuxpRLp
	 hrTSyW9P8cUxqxjVZG4WafbQTyyJqdknSMbmEID0jqxc0bY4yLkiPGe0gDQx1UAX2nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148076;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=j47MBzCwdzR8lT+wF5UiNgyrg2D3sXQhhloVtgFBaC4=;
	b=gNtf/jGTBo6jeYbnCreiADop84jwAsiXU8mLUI1ROoxx1htJZmGN6n92fIyBnAn9Ah8c
	 RYScdeve45o6K0t8A8h++rQhBwnbb5cbZvUHxQ3Uvq0PU+ZQjFp8Goj3xiw+X+ilmLQgE
	 aqSc4jHqoThk49yk7T73SmUQbngiQ+GeplJQnmFzQZo9i8RFcMNEW70D2PcFu/C3figib
	 pF4wJsc4dWobgx0z6nIaU0Tk/Imfgr+MrNCGG3gbftNP/p4cpu46qux/CbiyJXFyVfWIV
	 xrsYiGdnc5+af4+rTxbC3T8a6jqxvV9EeDQq6lMRNSfcU67X4S24GQxDprdpc9F4WaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igssIa8L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42722606D810
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igssIa8L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97CB1F0089F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148075;
	bh=j47MBzCwdzR8lT+wF5UiNgyrg2D3sXQhhloVtgFBaC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=igssIa8LsGeEDyxBfxCPVb79hvgYJwY+qnaq3KYFRkXTFtgelG5hDeFnXVP3cHBnN
	 7nfoQlJMbR/i2822+d/G5MfeezvvEy2SXhsNYqLom5POQKdHNRWB/W2/x1CZ5ArIxF
	 H41kgHsxhNfSk8uge6jYHrG55cM2fCjraz223Yqt/CdM9G0Z58OmTy+Nx424dm6TAW
	 o3QFMWpV4vE/TJOBNiiiTG0jmgyIH6TwvvIL0w8PIDIYSUg5aod2GzskRj6ltEkTlB
	 dIT6FGYTrGmMXR5dodULUal3GwdxXFtvFvqauKARkz0eE3dSAO7rBt2+chZzfMbQ1y
	 rNVpDZO3kxedw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so1047791fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:27:55 -0800 (PST)
X-Gm-Message-State: APuU4Z92x0SIEwgPlv6PCuoPNXVc0iZtPKhJ6y4OQwixBd94+zU51Puk
	HA2m9xisE3LESVH4snA692OPy6WGdCXWpLVz4pZcHJ/eGcUbahuuYrdVUzIYxNIcCYMh7KG18GM
	DDLN8+7OLXNb0gXS351gLYweNeFnna8w=
X-Received: by 2002:a05:651c:150d:b0:3ac:dc69:e62a with SMTP id
 38308e7fff4ca-3adfa32c6c6mr4253071fa.2.1794148074722; Sun, 08 Nov 2026
 06:27:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <au4SLJH2hZZpVhGa@sirena.co.uk>
In-Reply-To: <au4SLJH2hZZpVhGa@sirena.co.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 15:27:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkkDRtfOK_Pu2S6fuMfCDWgOZEkbyL2pi=QekMyJieY3w@mail.gmail.com>
X-Gm-Features: AclHuK9BzKTpmPooj-LkIYVmeFpVSV0LfIiAxz2g8JPtLHrKizF7qPLtFUvsMJc
Message-ID: <CAD++jLkkDRtfOK_Pu2S6fuMfCDWgOZEkbyL2pi=QekMyJieY3w@mail.gmail.com>
Subject: Re: Fixes tags need work in the pinctrl tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:45=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:

> In commit
>
>   0e62a6aadef5b ("pinctrl: realtek: Initialise omitted offset fields to N=
A in config macros")
>
> Fixes tag
>
>   Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for R=
ealtek  DHC RTD SoCs")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'

Fixed it, I think.

Actually it was a copy from terminal to editor bug, stray ^M inserted.

Yours,
Linus Walleij
