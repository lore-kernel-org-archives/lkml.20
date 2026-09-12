Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0037835E549
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209521; cv=none; b=kU8tkWaMlPHxhI+ud3E8AmJ6KC+KmPfr+9F8iUCAc6XTV0Cnf/zp1V1k2XGT2N5l4a3oTNPS9iFW/7qNZ6vSsT+DHZS0LVX+1vZU/ROsbtz34/Sthc9AE1ar9mbtzRxzmDe0M6wMtnTg22XBBy6Ym5Yu/J86qhJrn5r9ug8ruVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209521; c=relaxed/simple;
	bh=WA8Dtf++1QZSzfJJSLoVka2UMZa6hkRE2vBFfvye7QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8U3IKcZIuQWVzOQSBfeBYiSylV0KQasME7kR07/KvL07Y9E5Mbsq6ptxRgoraxfPXSOIFgpT4SCCeOObpIVPCaYYHMica4yUJme9KaiflDBU0cjRIq3olFW7ti93Esk5q6M7fw9jo3kMLgwrJ9/P3LYBtctFRlo1ZthDJw73R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=R9cgxRpf; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="R9cgxRpf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=blftxeO3iLSnDKoqR4/sTtxvcW9QMXIRLglAwmn6Hqk=; t=1789209520; x=1790419120; 
	b=R9cgxRpfheCg5B3u9oDM9pBymXKfdAzNi2EitnklQWMeNvgb8aARYaQdvebmHBYa3qY0U+J9d25
	QX62H5qt/8VAxtuwrbjZZgINFreOvYvlw/gVua14Ntc1a/SmmJeNLm0dD6G5PhmsZmmKrkL7d9Bvv
	HHdovL7a5r/8fRNwhn0o3ryAlL1wZ1smajppG88tegbXF0bIOlorxVJnIdbtaGq9FYvFuR7cMGqGg
	ciB5NqCPjoGzW+5mbJGWLNwqJO+o7clgdggxT7I04o+WRAzu/hsBo+mxafXdhox4jyq4r1LFwDoVh
	QNqhlgR9cdm/ccMcQwQOenRutZmFv25tsWTA==;
Date: Sat, 12 Sep 2026 12:38:27 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>,
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: j.neuschaefer@gmx.net, f.fainelli@gmail.com, Tony Lindgren
 <tony@atomide.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
Message-ID: <20260912123827.3aa54e58@kemnade.info>
In-Reply-To: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Aug 2026 22:32:18 +0200
Andreas Kemnade <andreas@kemnade.info> wrote:

> Add ZSTD compression to still have a quite high compression but with
> not too much boot delay penality.=20
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Anything left for me to do here?

Regards,
Andreas
> ---
> Changes in v2:
> - rebased
> - practically rewritten 3/3 (and therefore changed author)
> - added more measurements
> - Link to v1: https://lore.kernel.org/lkml/ZDoDYh01GYjdwp63@probook/
>=20
> To: Russell King <linux@armlinux.org.uk>
> To: Nick Terrell <terrelln@fb.com>
> To: David Sterba <dsterba@suse.com>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <ndesaulniers@google.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: j.neuschaefer@gmx.net
> Cc: f.fainelli@gmail.com
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
>=20
> ---
> Andreas Kemnade (1):
>       ARM: compressed: Enable ZSTD compression
>=20
> Jonathan Neusch=C3=A4fer (2):
>       ARM: compressed: Pass the actual output length to the decompressor
>       ARM: compressed: Bump MALLOC_SIZE to 128 KiB
>=20
>  arch/arm/Kconfig                      |  1 +
>  arch/arm/boot/compressed/Makefile     |  3 ++-
>  arch/arm/boot/compressed/decompress.c | 15 ++++++++++++---
>  arch/arm/boot/compressed/head.S       |  4 ++--
>  arch/arm/boot/compressed/misc.c       | 10 +++++++++-
>  arch/arm/boot/compressed/misc.h       |  3 ++-
>  6 files changed, 28 insertions(+), 8 deletions(-)
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260828-zstd2-045ce924f624
>=20
> Best regards,
> -- =20
> Andreas Kemnade <andreas@kemnade.info>
>=20
>=20

