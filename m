Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383124E021E;
	Wed, 14 Oct 2026 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997496; cv=none; b=Z7IRRtF4TKMsAuwzIKoQo265H2p3cHtsC1jX7ISOkKJXRVAZXvCfvwh5Z/OGV/pEkapAr924VRi2k3jqxUTbCIoE0zLRZqskXmltwuEnwf1UGsohRtWC49KxP/dEMDvUdLbicuT8SqjWGeTM/bT7R/nfLUhWf0oBpvMNFGKxCvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997496; c=relaxed/simple;
	bh=3jb2boGuaaGeg3KOFfbz5MaXkmJy8PjgFOTO3y/NYjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ck7EySZ+BHc3ErP+lcFurzsH6tV5GG6txPh0GZLdjE/OcfneYxK/ArbcBddLDdGZfRU844hTgnRicJhfFLa4KnYLnH+qcxTYfM2inroVSS+bdCPGqUfipGmOEv4+ytkr/UGWAFpY9Cow0mBF/45nCgW5jB1BB83TyDcsFTphIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qv06QBle; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qv06QBle"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3A5F6408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791997494; bh=RCjxRI/1UucUHvaeIcUViXUqt5p8iwVPM2SzBLBHxOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qv06QBleGDAIMEstOLuVTvUNPvAoaZhcuiqKiPrg04DAM3o0TmiEB89KwASpFbZge
	 kEoC0jy1t+h16V4ahw1xi9W+hOooLwfUIJVod4Za5E6+N69nL+NfQTCgRLAWKoZ/OJ
	 Gb/CapkaBBp1Az4RsLAxlMw6IhkVuWtgsjyse7sPHVqp8AN6wF6mmnZ0NKcqUrAA3z
	 2HjSYpKLNwFAxmUbYJegpuEYN31OTm0dJ/NNZGv2MF5BsUJCHPLf2wN9X8VeXWWJ9v
	 5C2L7hfF9GEXsBjddW/70CZ1RvUy0vTfEoLC49zX94saqLwU+Ra/o68d1jJKd2IsQq
	 bmOThBNvn6Grw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3A5F6408FF;
	Wed, 14 Oct 2026 17:04:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH] docs: kernel-parameters: don't mix cmdline options &
 build options
In-Reply-To: <20261003213508.96424-1-rdunlap@infradead.org>
References: <20261003213508.96424-1-rdunlap@infradead.org>
Date: Wed, 14 Oct 2026 11:04:53 -0600
Message-ID: <87bj8ww6ve.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Some kernel command line descriptions mix, mingle, or conflate an
> optional part of the command line with the build options that are
> applicable to those command line options.
>
> Specifically, a few command line options that use "KMG" to specify
> a memory size mix that string with build options like "X86,EARLY".
> These should be separate fields although they are both enclosed in
> square brackets, so separate the conflated fields.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: x86@kernel.org
>
>  Documentation/admin-guide/kernel-parameters.txt |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- linux-next-20260930.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20260930/Documentation/admin-guide/kernel-parameters.txt
> @@ -4080,8 +4080,8 @@ Kernel parameters
>  			like Grub2, otherwise '$' and the following number
>  			will be eaten.
>  
> -	memmap=nn[KMG]!ss[KMG,EARLY]
> -			[KNL,X86] Mark specific memory as protected.
> +	memmap=nn[KMG]!ss[KMG]
> +			[KNL,X86,EARLY] Mark specific memory as protected.
>  			Region of memory to be used, from ss to ss+nn.
>  			The memory region may be marked as e820 type 12 (0xc)
>  			and is NVDIMM or ADR memory.
> @@ -4371,11 +4371,11 @@ Kernel parameters
>  			Enable printing debug information related to MTRR
>  			registers at boot time.
>  
> -	mtrr_chunk_size=nn[KMG,X86,EARLY]
> +	mtrr_chunk_size=nn[KMG]		[X86,EARLY]
>  			used for mtrr cleanup. It is largest continuous chunk
>  			that could hold holes aka. UC entries.
>  
> -	mtrr_gran_size=nn[KMG,X86,EARLY]
> +	mtrr_gran_size=nn[KMG]		[X86,EARLY]
>  			Used for mtrr cleanup. It is granularity of mtrr block.

Applied, thanks.

jon
