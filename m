Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF94038DC5C;
	Mon, 31 Aug 2026 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212284; cv=none; b=rHrcKMOwRN+jxUgOKsJaLIFKAxO0UDpMb0KpKiy8zqkwNGY5trtobFPLMJ77IEL48C8ti1eLlKcJgsGZSphJ1HUDzLgezIGnnqzMF9/BGvc4T0UMRXvqvyzH9JPAIwKggPXw39PUOz6AaR1qHgtP9wF1VGDMysVITJrNgXynMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212284; c=relaxed/simple;
	bh=FIROxzoCKhSoWyKii6QuN0XwYJI4NdivDDFqJw9FoA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sHbaaHqs2Ngf855NqQ9GfMottKoPYiceuJHWn81WEWR1dHxP4uOpVmovMhDV71IjaaNAVAQAWUsNLwqYgxctulXRLzmJeYboWXoTVSUu7UeRKKR/ErzAf1ZDUvhTY1WK+fE5hNU9RchkKLD38fa9Z8ZawhbQnXVmwOpU6P4+QE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BojzB2Ri; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BojzB2Ri"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0BF40408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788212282; bh=906stpcRDzwnmUFL4NvDSF6wSzCWI8abUNVohL2bq6k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BojzB2RigyO3fcb0SO31LnV9JjFTlwyzpDLtAQxrBmYXyyaBGmM0C7L9e9Wtxesly
	 EaC9OZzfyaIDHWuqvbPIccRudZo0eRd9Am8JJz614v/dcbkc3ZhtfeHiQDkFQQ68sN
	 HuRo2Ojpz402C/cejrRlOVvtCkCkHC7mfBgFq6Sig5vrBpHTvuKpUDyhvkhCiNFh+H
	 8k7K/cuwSsnDbBT2tsipuoMOOy3GYIUY/eqpSjBA+xNtmgyEjscQ0mvaBpjYydQgKS
	 753Y/Q+3PSAgsHD26or+aZH0qkc5TUH/qynhF3UyPwIU/xszRCq0VgRJjku6aHVmYE
	 OXSid5hrvavgA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0BF40408DB;
	Mon, 31 Aug 2026 21:38:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Adryell
 Ramalho <lucasadramalho@gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: translate
 stable-api-nonsense.rst
In-Reply-To: <20260823-ptbr-stable-api-nonsense-v3-1-58c9beebf9bd@gmail.com>
References: <20260823-ptbr-stable-api-nonsense-v3-1-58c9beebf9bd@gmail.com>
Date: Mon, 31 Aug 2026 15:38:01 -0600
Message-ID: <875x0qgedi.fsf@trenco.lwn.net>
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
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
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
>  .../pt_BR/process/stable-api-nonsense.rst          | 207 +++++++++++++++++++++
>  2 files changed, 208 insertions(+)

This one adds a build error:

  Documentation/translations/pt_BR/process/stable-api-nonsense.rst:76: ERROR: Unexpected indentation. [docutils]

Please always build the docs after making changes.

Thanks,

jon
