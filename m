Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359825;
	b=N+DswdubAQhu0sfBU0FvlcGrw3sjfSp+JYW5S1YW5G515DuS8apyphl8W9Gnfwi3usoC
	 utqh1PyOTL2cuM4tPb62+yZsOSCoFmJCDc61z/Nsn9L56WMzFXrBbkZSe6YnAj8XSbthq
	 l/hxXrrmsr4nxeJX9Xp6d6iSjv7EYrxZYphu/5OWvWUByQyvtFK43clEqGVitJgwbEXHh
	 D7veXPvHo4AZvdKXKksuQl28E7W4RLl/THXrgq+xvdS88tscqOQatd79Hax9vUfNy63Lh
	 jOZqPSApJNLCoVYVqNvFwZ0VHsqs+BUH2U0XRlyKw4lEiae4vUjgi9Q0f26SIsL2Z4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359825;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=fYIqeuS0EVw8v++leBMWFK66zEW+AyDpwPnBgEfXrpU=;
	b=c/giQ312mA9TawgrFBveEmh9OTWfSgii8kMgg2O7DWqxNyHEzkASgWY51QF9D5xb13qs
	 tscdjBwoyI14NcZOQt8YBOn5qRiKsrjILReWKc0zw2shmOSwnMjTIV8AuEUHne5f8Jv3r
	 rSfuQshXWQJ4I9q5KpCpJsevPx4S9hb9wu82PE5S6CargP9zefuH41+NWRRIGWz5GKwZO
	 Kwfq93LPRCXUC2NRu+zxz9vmxkopsLoGuRn3Ar2jZ8JBsSWKvny7HbBagNLsp8Tu223v2
	 d0h7if4RKjWeXMM2ttH8WUl9Xozc6Q82RbEegOUc6Q8zvrugCB+c6pwEC9ATmUMY1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CU1D/8K0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8814B606A31D;
	Fri, 30 Oct 2026 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CU1D/8K0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FED1F0093A;
	Fri, 30 Oct 2026 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359825;
	bh=fYIqeuS0EVw8v++leBMWFK66zEW+AyDpwPnBgEfXrpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CU1D/8K0/t8LSSxAxGITiXcDHQEQeJ+I/zMrg0CDBnk+jZkujnoW8L7Mx+dii6hY/
	 yVgZbwsiqG8k/Ff+Cg55nDvoZiBqz244EChN8VcLjVLmXk4kVeLGfr6H3+8crGrC8j
	 bzsMuwExULKaYbVSGUNUJHfg57dkDcIWvJ9eRXLuZS3MgjvumwsxOtDlbcZm3VwVV9
	 cJtmYNanDJv0EHuiQ9YUc2hVAhpuHI5DA7I+TQ368jTbOSsYMck3TKzmxZ4jISTDmI
	 8AAAV0Oo+rIjxp6nt99O/c3f9FHyXhyC5cSb6TQ69Qu62dUrz+I7UF5yzKxzmzXA+8
	 p1MzMyUP7LxwQ==
Date: Fri, 30 Oct 2026 12:30:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 03/11] media: amlogic: vdec: fix the microcode loading
 and prepare the HEVC core
Message-ID: <20261030-prodigious-dragonfly-of-revolution-93b00e@quoll>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192507.210058-4-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:24:59PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The secure world rejected every microcode this driver handed over: the
> images carry a 256-byte signature header that has to stay attached, and
> the TEE only accepts loads once it has been told that boot is complete.
> Pass the whole image with the signature size, issue SYS_BOOT_COMPLETE
> before the first load, and keep probing when the preload fails because
> the secure world may already hold the microcode.
>=20
> Add what the HEVC core needs before codecs can use it: its power domain
> and clock handling, the reset and memory-power sequence used when the
> core switches between microcodes, and the per-codec hooks in the
> request path.
>=20
> Load a microcode into the HEVC core only when it is not already there.
> A browser opens a new decoder context for every seek, quality switch or
> advert; loading the image again for each of them makes the secure loader
> answer TEEC_ERROR_BAD_STATE after a few hundred loads, and it stays that
> way until the board is power cycled. The image survives in the core
> until the core memories are cycled on a codec switch or after a timeout.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  drivers/media/platform/amlogic/vdec/Makefile  |   2 +-
>  .../media/platform/amlogic/vdec/aml_vdec.c    |  72 ++++++-
>  .../platform/amlogic/vdec/aml_vdec_drv.h      |  21 +++
>  .../media/platform/amlogic/vdec/aml_vdec_hw.c | 176 +++++++++++++++++-
>  .../media/platform/amlogic/vdec/aml_vdec_hw.h |  64 +++++++
>  .../platform/amlogic/vdec/aml_vdec_platform.c |  27 ++-
>  .../platform/amlogic/vdec/aml_vdec_tee_fw.c   |  87 ++++++++-
>  .../media/platform/amlogic/vdec/reg_defines.h |  24 +++
>  8 files changed, 443 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media=
/platform/amlogic/vdec/Makefile
> index f752716cbf9e..f9c35e9ac902 100644
> --- a/drivers/media/platform/amlogic/vdec/Makefile
> +++ b/drivers/media/platform/amlogic/vdec/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -aml-vdec-drv-objs :=3D aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_=
platform.o h264.o aml_vdec_tee_fw.o\
> +aml-vdec-drv-objs :=3D aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_=
platform.o h264.o aml_vdec_tee_fw.o

Why can't you just comment that original patch has issues?

Best regards,
Krzysztof

