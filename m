Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F913E4C96;
	Sat, 26 Sep 2026 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436707; cv=none; b=djiehd+Y3p3ud0mkSMCJnArhfOuXU7TEQEerYGTc8Y5vlDir3W5EEX9AELY7g9XQBM9WaBKoBsY3OtjV3+SpADxzHj0Gd+E0WKRVdeG/rmeIEYKrbJWu328CqmVuiiyt1RopnogTlkk4aF0vKCAJ4aXeAD2SjshCJGVZw52DpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436707; c=relaxed/simple;
	bh=+TznahWGP/R9f+buMzIm2pnastsjQqrvftK9LcrJHIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mOpeFwmLvXYGw7HAjRID0QCRKTyrm3B1rZYIdar7J5AXrjEuj/qfAG4V/KnSU4MBDqlhsyKYhAfe49ONAqBKo+0BYVJTf6oKkCQzIEsGIw4wdARGZ+Ax6PdD8AnGmIIRa1bU32v08qa/wiBpYfuJKKIxFGH+J/XXFQ4Epy/Mmxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bzNV7R0F; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bzNV7R0F"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 836DD408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790436705; bh=jZxL8se37Nbgnf+brwBoJ1zGPO5KTS1yFCFAXNFy734=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bzNV7R0FVYOB98DLRHHq0AiIBG8hxU0g/xsFQSvLOOj4/nkc2ZMxPSynhpGxDG8W9
	 o6mnoWMITcph9w8o7uQGNt2lhTM7j5o8brIISGrbgG5u08L4gfis/AB5h31yCdIyFm
	 wTjFSg/limzm2ZwHYvJHulk1jk1KdQUATiJaHhfcABsKwoKWVZcDIjOSshzCGSRuex
	 Johl91Gf0f5fi5AxOJic47DEfiuMIOTJErNLXl/0G6Xw3dBrTRabow2htJCJHFWY6x
	 nxVXWqlIUTWy0T+bkFi/5EiN8HxTiHGtYbG888IJEUzfKrPpA6O0wtTdi6ebkD0pL4
	 daRVsTE2TtJoA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 836DD408B3;
	Sat, 26 Sep 2026 15:31:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Adryell
 Ramalho <lucasadramalho@gmail.com>
Subject: Re: [PATCH v4] docs: translations: pt_BR: translate
 stable-api-nonsense.rst
In-Reply-To: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
References: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
Date: Sat, 26 Sep 2026 09:31:44 -0600
Message-ID: <87cxu03u73.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lucas Adryell Ramalho <lucasadramalho@gmail.com> writes:

> Translate Documentation/process/stable-api-nonsense.rst into Brazilian
> Portuguese.
>
> Assisted-by: ChatGPT:GPT-5.5
> Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
> Changes in v4:
> - Fix nested list formatting that caused an error during make htmldocs.
> - Remove trailing whitespace reported by checkpatch.
> - Link to v3: https://lore.kernel.org/r/20260823-ptbr-stable-api-nonsense-v3-1-58c9beebf9bd@gmail.com
>
> Changes in v3:
> - Remove blank lines between bullet points, as Daniel suggested, to match
>   the style used in the other kernel documentation files.
> - Link to v2: https://lore.kernel.org/r/20260821-ptbr-stable-api-nonsense-v2-1-f07df4a0fc3b@gmail.com
>
> Changes in v2:
> - Remove the unnecessary top-of-file label that caused a duplicate-label warning during the documentation build.
> - Add disclosure for generative tools used while preparing and reviewing the translation.
> - Build the documentation with make htmldocs and verify that the translated document introduces no new warnings or errors.
> - Link to v1: https://lore.kernel.org/r/20260820-ptbr-stable-api-nonsense-v1-1-0341f55fec2d@gmail.com
>
> I used ChatGPT and DeepL to help me clarify some Portuguese sentences that did not sound entirely natural or clear to me.
> ---
>  Documentation/translations/pt_BR/process/index.rst |   1 +
>  .../pt_BR/process/stable-api-nonsense.rst          | 208 +++++++++++++++++++++
>  2 files changed, 209 insertions(+)

Applied, thanks.

jon
