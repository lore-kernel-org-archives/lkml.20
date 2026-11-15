Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755587;
	b=2t5hLvHPe/JmOs6Lb0aXDHcfNJ+CPqu1A4NNeJOEe5yjc8OzBaD2npVoU5vmQdic0hV5
	 nacIQHJ4fo1UZxV0PRvwvnKvCkhVU5+C1xr3RHSVB5Gc5Ccbrf6rAkuUfa+SNFA1w41Wa
	 6UOa+XcAm2xXVm3wHzj525x7Pm7SwkMA5KO/9Q3NoVO/Jtg+slrNT2b35w1vSaMIQIs9i
	 2L5XD2X8rOrCEE4yMoe6fupmVOFyeyq7E0oBnNwgrPS0818qyYFV6t/N7n2D1BceCOXYO
	 10xMJfr0/Xp7KQn70LUcNB4HooesbLWiQB+yP3pGJz9nTc8Ym2olSk3G10pP60S92Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755587;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zb6M21tik/Uybubx8lCWSAbnZMH+mqVYIGHAUrVbrB4=;
	b=MiVLJN/rR9PIVGNnOwSPLFUjvdQmnYFM0Rn4c7T4IVjCD7Vx1P/SuXjwj8dLUQsfOGvX
	 gJX2QLu5Jy5BmuCoADCSYkED8j2siG+W5bqyMn1VfO1NwPq8f243C2GFaMcX0Lb9A9Gdp
	 oVeaQ6DuXVb/9DiUADy61ZUKQOGBzq9YxB3mtGTN+Z0dD5vGxCHGEgY5K6UkzrNKDSURc
	 hkOWvV5U/7zLzm7/HBE3jeDo6/sQjvS03LAMMlv7m/F4lTRw+31TrlaPbPXe3zhc9eTlo
	 RW3J2/goqnNEUH8bKlXqZ5YgxtzxuWFDIdo4TzeestVgvv6IGkI3HmFyfopiIoXYAgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e47mmARq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FDC606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e47mmARq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F05E1F000C8
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755586;
	bh=zb6M21tik/Uybubx8lCWSAbnZMH+mqVYIGHAUrVbrB4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=e47mmARqVe9ussV021ZMFPkxOupAXEa/bfQ5+TsP8Sf3W1eWnr/Wc9gnpYez6QnEu
	 SijgS+SpbmF79ldejZBfr0Rg3q53esexRQpDkoxzEi6o2B5Y+lCPGIPtbWivuI0ris
	 4lrrwws3y1KK36NaII3BQgT7BGGlf+XN/bYDFnhDUovHVi0A5W1AbqY5emguBIgJBb
	 R2z6nSlgIu/m+CadMY+5KaezpuglT4UwynwBf190g8cN7ZfCYv9ZDNn1AOONntiSwF
	 BQenXd9lKU/gkO6WW4VZ1w2spytsXnmtgHEcUzZ6RpoqyH0zTZwcNtyHXxc2/J/NGA
	 C66RpLYLBHBMg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acd523a802so27434001fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:13:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvq1XKvcuU2oL9aMmdOFm2yT4BUIcJrexYgArhPV/T/npL2wkdGZqro5t5bTE/1rMNQ2Mkm1iZMdBoVwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rQ6YJaFd/HfoO8oCSsRfsrAOFQK1i3/wj/dF03MDksJ1CuEW6
	hjZVPyyW+P+FmPKrmNXdzEFmDf5+6M6rjxkO2NDaP/LMC4JfBlCqKftnfQXlHq/jg3qj4ewWcPY
	vPwqG2HO3GlFDmNX+dUlDxeJB6iQ8gYI=
X-Received: by 2002:a05:651c:1b0e:b0:3aa:fcfc:aa9b with SMTP id
 38308e7fff4ca-3ae2b536dafmr24545351fa.27.1794755584925; Sun, 15 Nov 2026
 07:13:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115150903.16855-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261115150903.16855-1-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:12:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v67N8ZgHUoEWje4vSNa_VBdKsyyPfeHHiOSP-P6RPHDjUA@mail.gmail.com>
X-Gm-Features: AclHuK_KstftpDWV4de9QJqrjHW7hPs6mQ5cgjl6PxrEvBCv-LJZNjkPDDACJic
Message-ID: <CAGb2v67N8ZgHUoEWje4vSNa_VBdKsyyPfeHHiOSP-P6RPHDjUA@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - support the AXP313A power key
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:09=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> The AXP313A MFD cell is registered as "axp313a-pek", which this driver
> doesn't match, so the power key doesn't work on boards with this PMIC.
>
> Match it as well. The AXP313A has no AXP20X_PEK_KEY register, so hide
> the startup and shutdown attributes on PMICs without timing tables.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
