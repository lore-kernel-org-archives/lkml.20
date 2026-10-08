Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6841F36F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464960; cv=none; b=Rw+j1XBP2tDi5XTE7Y9SYEjDwtq9Xi0cJPneWijCn02wubUnkDLUsi6OKwjeDkdYUHy9pNc1ckNpMzfmGLFNSpkXJV8zaBFOcp4iYU68c3qFto9yEYZ5mFiQH98xXb54lxDqXb9oW6LRg8hISmpBl8IlqD+JcDg29ovVKceApcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464960; c=relaxed/simple;
	bh=V3eTIHy2DWi3v2L3wOUlRbxeTD70UP9xOW8gQT+EMBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKfbCxtYqK0WsV/i2GaU6uPlQr10v9NzlnzY2tICWI0lhXY+ryIqDINuC2zQjg4GIEY4fbE4OwmTZWRU059FLnXObJfaCDgOKoP/uHfHPFQEDWwzEj7FYIBPeNdPPG9pfyardn+KT0cxB16l/msYMcI+LkoT9EUXgfxaEFosQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2AhXFHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2AhXFHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EF61F0089C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791464958;
	bh=06Y+ZmPCA1Ov0LyWhX2+GB0CQGOz7fspMTCa9v78ZA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L2AhXFHB0CmHK+KAWgNzc06NrG/j32XOyhfdgk4u7yozR4UiQurQwi/xMlZSqsapo
	 Z1nJxdvFZ5/Kvmg8Br8YT05TwzEc7gBvriKtVQNkzpn9MIh/3PvE1DpkgxBO2MWNao
	 6cOn4/Mdbh5d7r5/AnYcDr9idLmcWpK+xWGQEGqB6OOhmOfVudzHN43gbdm962aGTG
	 X6E5cEh0ypXbOtUtQxvLLy5hhTvUva9UH78ZgEqljjFVcVLei1Yy9K/FI+50Vaw9xa
	 HNB3sUTztd34usAj/vBN8SSqIY2UUAG1TuwbKOKCYLJvNvfK/nvxb1pVzG0QEa0VWF
	 n02/d4JOOXXYA==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f488ba6e90so1284103b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:09:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgcgplhvau1vBiuwXWPSVEjsvsD+9grgPSDCpYfLL6t9l7/5+G0FVnNdqp5Xt5bawPWY1vxYnItNV/Hwo=@vger.kernel.org
X-Gm-Message-State: AFuF++lWtDWuvJNi1103BNYxlnA99+fFtydaaPL8ah+1R4jSq0qEsYIB
	pPiIJKg0fn3S5SsDtjFbJ1H8fN3ygYgg/+wj6XM0syCzviJBpZTHymcf47uXMeY4+b+zeJN/Sjm
	lKBd4Hi/2qm2ZdMEM7HdNDmUOYILktw4=
X-Received: by 2002:a05:6808:5191:b0:4f6:2ccb:c2a with SMTP id
 5614622812f47-4fc473a72f3mr4935583b6e.68.1791464958157; Thu, 08 Oct 2026
 06:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004193647.182052-1-rosenp@gmail.com>
In-Reply-To: <20261004193647.182052-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:09:02 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6rXAcmubvduVEfVLpMS2Lg=bj4MPvfpuxR0VTTkTxLQ@mail.gmail.com>
X-Gm-Features: AclHuK_XUvLh1xTRAQdE1rC4iigCwbo7HwEZoZ3CB7mNSTeHSs5dlA2T2fNhkSs
Message-ID: <CAD++jL=6rXAcmubvduVEfVLpMS2Lg=bj4MPvfpuxR0VTTkTxLQ@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: brcm,nsp-gpio: Convert to DT schema
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 9:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:

> The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was only
> documented in the legacy text binding, so dtbs_check reported "failed to
> match any schema" for the gpio@20 node in bcm-nsp.dtsi.
>
> Convert the text binding to DT schema. Beyond a direct conversion:
>
> - Require pin configuration nodes to use a '-pins' suffix and GPIO hogs
>   a '-hog' suffix, as the old example used arbitrary node names. No
>   in-tree DTS has child nodes under this controller, so nothing is
>   affected.
> - Document slew-rate, which the driver supports but the text binding
>   never listed.
> - Add #interrupt-cells and gpio-line-names, and make #interrupt-cells
>   depend on interrupt-controller.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Patch applied, thanks Rosen, excellent work.

Yours,
Linus Walleij
