Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3103CF210;
	Fri,  4 Sep 2026 22:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559300; cv=none; b=RlJDe8BnH8bos9NGbJkNHvVUyuO37fZsavut5IPwCdyetcti9D/r4xfcYJokVpfsAHPw4T94G8BIfJfYtgEABdC+2wpWigUgvEW/yOEhCMnw4B88vB7GmHS2TqYdTs89EL4KHSoP1yptjmw43sjcf7QzDNlyOGcozmRkjCFst5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559300; c=relaxed/simple;
	bh=v1XuRjqLHV7YZa19Y/k8ZEWM9PqviSOQ/a3sMcOz4Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KesDVL1HHqQYyS7Da/OAn8OFwQbjsDKirFDpBZoXoB6AGdsnnf1o2ZpYwH3GGurRc0rkWGUrqNf8WIA6PHV8r/g+6/wEOAiDkyCcXLsG41LIhXUsCIMmCM0CvHf5Rw/uqHWrold5epR9BAZjwqDANQ9iZTcqMMGpLBhu5OKMs4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EGpq9Xqc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EGpq9Xqc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=QYmTyuFnsvf/PDZH49hxKDG2N4Q+xKDVO4XincLWpPI=; b=EGpq9XqcYC/kEAyuH5I0xiCrDd
	HSuP1N0pQ1PsXHzhhEUQWHZs6dE2cDGlQkE8c2bsTkjXjqYisPtCnrZoECQXupDB4a6R5VaNTI7tU
	KJwqYgTgkgmCmvKrtufI3eXSbNSe2CIfV+WLXzfWXWnBgqRkooB9gPjNTifmyZbcctEMhCpf5f55z
	D5F7zWWkbkVi44NHdb/ixLw0rtW0hJWCq4fdMI1SpVq5FK8qrOpJvwAiM1zBUuaYUYywPq8qO53Fi
	F9i5rGDUnXnh2Kd4xFrq6Jw5PKUZn3tFF25i2idFEkdAb/jYUpxi/tiERW5rY+KMbUqdxMLtWphxM
	6WccDs1A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bya-00000003MbT-273E;
	Fri, 04 Sep 2026 22:01:36 +0000
Message-ID: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
Date: Fri, 4 Sep 2026 15:01:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
 <20260904105114.29474-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260904105114.29474-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 3:51 AM, Hemanth Selam wrote:
> Correct "initalised" to "initialized", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Yes, it's misspelled here. But please be aware of this (from
Documentation/doc-guide/contributing.rst):

Please note that some things are *not* typos and should not be "fixed":

 - Both American and British English spellings are allowed within the
   kernel documentation.  There is no need to fix one by replacing it with
   the other.

 - The question of whether a period should be followed by one or two spaces
   is not to be debated in the context of kernel documentation.  Other
   areas of rational disagreement, such as the "Oxford comma", are also
   off-topic here.



> ---
>  Documentation/arch/arm64/booting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 13ef311dace8..0d5f8709a5f5 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -588,7 +588,7 @@ following manner:
>  
>  - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
>    property in their cpu node.  This property identifies a
> -  naturally-aligned 64-bit zero-initalised memory location.
> +  naturally-aligned 64-bit zero-initialized memory location.
>  
>    These CPUs should spin outside of the kernel in a reserved area of
>    memory (communicated to the kernel by a /memreserve/ region in the

thanks.
-- 
~Randy

