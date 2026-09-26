Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315835F5ED;
	Sat, 26 Sep 2026 17:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790445127; cv=none; b=BdgYkIbFzKC0oR818vVLbyYMG3WKFBXzdJRdQKGXKmqbExF9LyMMjzA2DWXlgHhxbjNBZxQAYpPHDnEu3aY7YzUeUNnBQttwthDbr+lCXZN/8hs2pvrBEpoQpWljlKJZL5UImovVrgd2tlRyTJGpYhXK6o/yV02fujKmUtlXw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790445127; c=relaxed/simple;
	bh=wgAKn22Ni7MmAUF9oEw63JADTQTQaEwIMtLKGB/G/eo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hk/0lcPu/KyzEHMYoFW/c8amQCFKyGPfqLM74DYFsvMTF/ZP3XRznb6zYz9klEulzdEdE/kXKDUeCAvSyqlAZxJ27863ZjeGYmD3Hf9FpitVqCriAJx00FvGmUWHo8/BsY+oA9Hzl/B8nSaCPouCcbms/5mILy8wZ81MdLsVnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Llw/Ozns; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Llw/Ozns"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E4202408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790445123; bh=6NE3Q9JZyqp+/wTbVEXAF3fyZw5nQwa+hgB/Hr18ZK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Llw/OznsfKVAc7JPgpDcnVAd2FkrjLbWzFecVFOInN9m8M3heQuiHlCFH2E+a6uAY
	 9uk7depmDp17bfvyHJ5uy4INjFd30wUaUq0+UcjEC7hGlX7w2I5P1Mib0EqXK377ej
	 MuooYOnrXd2uGXBSkAqLtf+iLmRyNNK1L2B81KSWlnJdDiXujaIYMtyUttE1LSKnFH
	 xjz13UklOpf+VIDYUL8twB29KwwoL9oajZaFr+Su/7SewHmSHvsN9IrDfkKHLCTZi8
	 Ka+sOGdLzPFcTQy3z2fLH6ZyaijwkrV91w9laKLfhz6PNiEMCRaLScD04qFFcgTszz
	 d13EFt3KiYTvQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E4202408B3;
	Sat, 26 Sep 2026 17:52:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Habil Eren =?utf-8?Q?T=C3=BCrker?= <habilerenturker@gmail.com>,
 clemens@ladisch.de,
 tglx@kernel.org
Cc: skhan@linuxfoundation.org, anna-maria@linutronix.de,
 frederic@kernel.org, linux-doc@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Habil Eren =?utf-8?Q?T=C3=BCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH] docs: timers: hpet: Modernize file references and
 document userspace API
In-Reply-To: <20260926170649.6346-1-habilerenturker@hotmail.com>
References: <20260926170649.6346-1-habilerenturker@hotmail.com>
Date: Sat, 26 Sep 2026 11:52:01 -0600
Message-ID: <87wls7529q.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Habil Eren T=C3=BCrker" <habilerenturker@gmail.com> writes:

> The current HPET documentation contains outdated 'file:' prefixes for
> source tree references, which breaks proper rendering and hyperlink
> generation under the modern Sphinx-based documentation ecosystem.
>
> Fix this by modernizing the paths using the standard literal backticks
> formatting. Additionally, add a dedicated 'Userspace API and ioctl
> Commands' section to clearly document the supported ioctl interfaces
> extrapolated from include/uapi/linux/hpet.h and samples/timers/hpet_examp=
le.c

"Additionally" is a clue that you should be dividing this work into two
separate patches.

,
> including the layout of struct hpet_info.
>
> Signed-off-by: Habil Eren T=C3=BCrker <habilerenturker@hotmail.com>
> ---
>  Documentation/timers/hpet.rst | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
> index c9d05d3ca..e21a6185b 100644
> --- a/Documentation/timers/hpet.rst
> +++ b/Documentation/timers/hpet.rst
> @@ -23,8 +23,35 @@ The driver supports detection of HPET driver allocatio=
n and initialization
>  of the HPET before the driver module_init routine is called.  This enabl=
es
>  platform code which uses timer 0 or 1 as the main timer to intercept HPET
>  initialization.  An example of this initialization can be found in
> -arch/x86/kernel/hpet.c.
> +``arch/x86/kernel/hpet.c``.
>=20=20
>  The driver provides a userspace API which resembles the API found in the
>  RTC driver framework.  An example user space program is provided in
> -file:samples/timers/hpet_example.c
> +``samples/timers/hpet_example.c``
> +
> +Userspace API and ioctl Commands
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +* ``HPET_IE_ON`` / ``HPET_IE_OFF``
> +  Enables or disables the interrupt generation for the timer channel.
> +
> +* ``HPET_INFO``
> +  It is used to query the capabilities and current status of the HPET.=20
> +  When the ioctl call is made, the kernel populates the ``struct hpet_in=
fo``=20
> +  structure and returns it to userspace:
> +
> +  .. code-block:: c
> +
> +     struct hpet_info {
> +         unsigned long hi_ireqfreq;	/* Hz */
> +         unsigned long hi_flags;	/* information */
> +         unsigned short hi_hpet;
> +         unsigned short hi_timer;
> +     };
> +
> +* ``HPET_EPI`` / ``HPET_DPI``
> +  Enables or disables periodic interrupts. When activated, the timer tri=
ggers continuously at the specified frequency.

Please keep text files to less than 80 columns.

Thanks,

jon
