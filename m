Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871246;
	b=ztEr9O8wBIiHuLtUHoSEzfn5HYpW5SOb90MepH1iIfrBLDFidBOka5G4AcA2dFSHREO8
	 rWeXTh+PhtzSfHP/47v9baVvZuVDApFI0iylN77FOfEV1+PeUhpjZ/QLMMDemRuaJbe8y
	 VElm0Rp8avg37iS0UAO9hCbf8gCBGcFiQorbTFsrb8FiEjWS1xvXN8GyjvcCCDjMhbtIQ
	 Oxa91x63REVqr3nexq6/jAuFSJBQHXcShUBaW/g+mgS4kqgZS2cO4Y6VHXlsMIZLxdGjI
	 jcDhh1P66WdioypL3706osUot5wPKzPamjQrWVZtj8ZC40NwHw2UXLb6wYZ1NolCHeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871246;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iBOfy5O+0eohQ89wWM3JHoeRMFw720CvWts9Mtt94kg=;
	b=egO9U1IrXt/nrT69DOnRFSkFm8TgpNDQQmdbHUZ6so931g5966vUSZQmdnwEaj1SyRPF
	 16u38/S3GDG0f4tN7dRMtytE+3LczPmtxCjNVu35PsK3tDlAgaLvZf9IY9e+3Hu+z4jpu
	 ZJ/KdA2oPjY/kaPy2xbcqASL2c6M5OZxgvL5WES+dzWaebPkyKcaaWaRNbOgTTGh9cb/5
	 jn179KGeEnsj1++CB3JDaa1nLOjLPQLXxOiuixei6JnF5IASZF1rPTF1Rg1yYnaFbyNOk
	 H2Wf1DQSATdbw0pes8fcYPCjcPJAM/MYEcqvmCkMWssx3Q51CK5IhbCCtSoDLK6NQXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kH2/2Thm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kH2/2Thm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9E91F00A1A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871245;
	bh=iBOfy5O+0eohQ89wWM3JHoeRMFw720CvWts9Mtt94kg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kH2/2ThmSmTuYrAqoZWP06MhveGLpQ7yH69j1W0W9ppNRp+veQPUYmrYbLA36ZTcg
	 WMl3HawM8b5g2sErObcuoxuM8NQh815V9gVHjcRldAhHfoIbEe7KFWivmcSNEyeMM/
	 LKEFyiNriYRJkjHYFRraLKVcylAXHuGcEfOM6rX1q1kG2IV3MLva53Y9EFyufrRxSK
	 0jpgU/jBiVxYQ51Tq5ggzdG1uOS9V4Sjv2PJ8yseTBprRQOWFqwTyLG1m74YoaoEuM
	 qw4dBMz2DrF6UJzKbgzI/HYamSx7XtcwlATncpgEjIBq65UrIngq8Zhl9v3QRkHYVy
	 5UHyZyi6r9zjw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso1617748e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByWJ7hPF0fTYTU4WwOCdia+EhXAs/i1e65lQIf1xI2i+Jlyz7n/pna8qC05kMlA/3Bg/loihL/9ijqLmg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ueNHLYS+RzQv0wr8hky7kW3XbqWKWUF3KI2YLfX2NdZ0vDti9
	13boJYNFb3TKNjQpARwwj5sgFGpMnEHV3PuTld5nY/JiwOhDI3fsb+eeuiLvLsicmZRiTZEAEW+
	TD1q+bn7OUymXrtg1nQyylRsgQHtUXI4=
X-Received: by 2002:a05:6512:3c8e:b0:5bf:a5c1:d11 with SMTP id
 2adb3069b0e04-5bfd957cd9amr6465740e87.64.1793871244374; Thu, 05 Nov 2026
 01:34:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-11-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-11-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:33:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmREn-duxqZyLmY97DR_TKiDLRgxiJiy=cno6rdosa8YQ@mail.gmail.com>
X-Gm-Features: AclHuK_c9EDZKaN1V7Dk_kEOYVVIT2evfGZYSvNiUvKlEjAfXzbR3MVATtMhYcI
Message-ID: <CAD++jLmREn-duxqZyLmY97DR_TKiDLRgxiJiy=cno6rdosa8YQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] pinctrl: qcom: Check qcom_scm_io_readl() return
 value in msm_gpio_irq_set_type()
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Ajay Kishore <akisho@codeaurora.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:31=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> In msm_gpio_irq_set_type(), when pctrl->intr_target_use_scm is set, the
> return value of qcom_scm_io_readl(addr, &val) is ignored.  If the SCM rea=
d
> fails, val remains uninitialised and its stack contents are modified and
> written back to the hardware register via qcom_scm_io_writel().
>
> Check the return value of qcom_scm_io_readl() before modifying and writin=
g
> back val.
>
> Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Ap=
ps")
> Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968=
f50
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

This patch 10/10 applied for fixes.

Yours,
Linus Walleij
