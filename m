Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5C1317173
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762408; cv=none; b=uMVIsfSp6QP5+avGnpsm8wubOhiM0pX0mXpJUyAgCO1Yi7MDQdU1verfrahm2C3xYcTaWtEdCGujVrH31H6ELs6guJXgWDKWeZeshH6K9N+IMEJlE6onE9t7Fp5U8gaSorgaEs7lwZLsWK16UKYNoV/7UAbja9xTUTealJE74xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762408; c=relaxed/simple;
	bh=EfaOqUAKpuFYnsIVHOrJ/0TiRDwiEAdiDk5roFX7nBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+fQ/SCisDj0TpcVoZ1c/poh9YdRvrb6beF2XbU4OsGkEJLwLEQ/XzMygA0yUtRLDY6WRwNhT+UyV0qyaaUTV4f75hJ1/Ga7DVYpXdUGSeLijZNRNS079c5p2MjLje5vxoIlfY7iGDbvd0goJAbCUVt1vAWsLHdZg42dcR765XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muIFYUAB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muIFYUAB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F9B1F0089D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762404;
	bh=EfaOqUAKpuFYnsIVHOrJ/0TiRDwiEAdiDk5roFX7nBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=muIFYUABjvVKsuiM3VBK55HhCAl+mC0Uikqx4GPkxeWHxqibglMVZjsEthv2ZS+3e
	 AUhs7Dsb5LGjbHoWTADLFwi6PS2TUpgK3/78Xe8eMbUdKN539B2sJYH9aPU5Iz4Qy7
	 dOy8ABR4lDoPUjf2w4lq29/TV+Jabnsvm4baPAWqFCZHtGs1oSdU9ApeiXO6wwIKiq
	 d/eiE3Q0EFMLgqKhfEzFze6+2VxEFdqGVAVx8bPa+CdzAv+j59rjCpEUcp9T+ExYO2
	 K3mbINZW+Is+H0dic4Yv0CZbYYeAlCZEAkEOeWBD8H6PaVXghSyTHFPuf/eGSy4H+W
	 FvGcKLHCaVphA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a770b3ee1aso8421651fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjIBrNeHm1mxBjN217hESYn/xwI1rv0l13mRggC9MD3QVVkjwqdUzaIjaQuVVFdpmQlWNAauMAZG4c72Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOgOWxEHKM7UJQTK3irwG6fKyxbH4GicZ7sRUa5sytF0jaC3EU
	lNPkPNGNB799X4cJt7vlHXASht6cbTolwlDE54tLsTSyJIHn63NNQzb0EZa+lSvzEIavS9BwH6X
	ZBnfIQrF1NBuewq2Gs/g7CKlaXsjfP14=
X-Received: by 2002:a2e:bc1c:0:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a77919076dmr3451661fa.6.1790762403440; Wed, 30 Sep 2026
 03:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-3-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-3-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 11:59:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLmqvjJUgFBtERvtkO_+=m60ag1UC-ZOAdo8_7X3cERKYA@mail.gmail.com>
X-Gm-Features: AclHuK_48zLXL0KDLF2JWFOLuk9UnViCs077-v6ZyB7fHZb2R7O5ZT3ShI4k8r8
Message-ID: <CAD++jLmqvjJUgFBtERvtkO_+=m60ag1UC-ZOAdo8_7X3cERKYA@mail.gmail.com>
Subject: Re: [PATCH RFC 03/10] dt-bindings: arm: cpus: Add Cortina Systems
 CS7542 enable method
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> On the CS7542 the bootloader parks the secondary Cortex-A9 core in a loop
> that waits for an event and then jumps to the address found in a global
> software register. Add the "cortina,cs7542-smp" enable method for it and,
> as with the other release-address based methods, require cpu-release-addr
> to point at that register.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
