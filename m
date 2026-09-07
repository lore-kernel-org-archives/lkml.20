Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E437C0F8;
	Mon,  7 Sep 2026 17:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801622; cv=none; b=WxGsbe1OUOex9Lw5Euo4ddKOnN96uQHDhzguH7UI5fQtMS8s+KJEvd5LbXlSxr9k2t5nKZzmiGQHI0X+GGg+qQX1DqGrx2TS4Nzwu64i26w+9vBvwrqH+3VCOhM+NSnLSrZp388yjre5QcxPwYhQo/WaD6d9mUmwNwHT4ygfb7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801622; c=relaxed/simple;
	bh=BISwuPj5+X/ReVljgBOUZggnnuBBhj12WS3jwYi6xnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQtfTrEKb8izAzJ24Ms01wyGuNP/JWTDpVZfnzXauoRBELhcv8VjqGaUFg8zlEReha3Fu59A8aymlMn89yM5rD+Ap4GRxT++l4t9Ehhdd3l4YxRJ5j8NfQtsz0hUfChY7w/n6FHQEl3N7mEgt4SDymEl/B6wK2LzhV1NbYcsZxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e5UX5puf; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e5UX5puf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jdfg7obfW7JkQiBKarLyFeZzGv6IWCWDHOBGhZOM7dQ=; b=e5UX5pufGvR8DwqgaAhDj4fhBA
	W7Znwrd5dI8du+62prUWlp5a0onJAiwmVZjUu9fecClhl63y+QUoIn8ufndGKHVNKltCid/oixJNd
	oEmP+XM4AIv2S4rf3GJw3WaNF+KRMQztRaMR2LyqWz4uHG8b3milNbCaQtezkSy5opuxZ01sNawrO
	3kXRS7y1754zapArLxLRapFAdyWWcz/zADr7iy1vltB17HOux840zA7Mj1nJjZOT4Q+c6HYCdjnrX
	Pj4kncaqd43eiSRrBsNmS3sxZEswSWBPc90QkzcssdhboMeSEkvcaMvlmBGPRb9kKn3+hMrpJqds+
	sPL/iYYA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d10-00000007TKJ-1lZZ;
	Mon, 07 Sep 2026 17:20:18 +0000
Message-ID: <cc61467a-761c-4f50-8355-f78360f9d1e8@infradead.org>
Date: Mon, 7 Sep 2026 10:20:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: arm64: Fix typo "initalised" in booting.rst
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Weijie Yuan <wy@wyuan.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907114146.39715-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260907114146.39715-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/7/26 4:41 AM, Hemanth Selam wrote:
> Add the missing "i" to "initalised" in the description of the
> spin-table cpu-release-addr property.
> 
> The British spelling is deliberate.  doc-guide/contributing.rst asks
> that both American and British spellings be left alone, so only the typo
> is corrected, not the dialect.  checkpatch.pl suggests "initialized"
> here because scripts/spelling.txt maps this entry to the American form;
> that is addressed separately.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> 
> Notes:
>     Changes since v2:
>      - the guidance lives in doc-guide/contributing.rst, not
>        doc-guide/checkpatch.rst as v2 claimed (Weijie Yuan)
>      - drop the v1 narrative and the redundant "only the documentation text
>        changes" line
>     
>     Changes since v1:
>      - keep "initialised" rather than switching the file to "initialized",
>        so the British spelling is preserved (Randy Dunlap)
> 
>  Documentation/arch/arm64/booting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 13ef311dace8..891fd22f7229 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -588,7 +588,7 @@ following manner:
>  
>  - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
>    property in their cpu node.  This property identifies a
> -  naturally-aligned 64-bit zero-initalised memory location.
> +  naturally-aligned 64-bit zero-initialised memory location.
>  
>    These CPUs should spin outside of the kernel in a reserved area of
>    memory (communicated to the kernel by a /memreserve/ region in the

-- 
~Randy
