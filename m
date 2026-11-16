Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820235;
	b=kdGz3t6AOcn47tBlZSUZx7Z1D2z+iy8gvkHwynlrCmXbprwlcsUI3KIn/9V2nNp0gD2Q
	 6OEt9J27McmPBtc8zKDprdU0b52+Ze9yW6SnfhLXQyv8u4YpagebaTHVcYCIae0s7itxB
	 0fzpHgqVUmA/BVWidUnWzcq28VLzQeGlVsPAWJC1M+gXyZwf8qxltjF7YpZ8e7EKwsS9F
	 IKNNmDni+/IUcUF/kNb2xO63iveFXbZ5YK6lED51SEV+AYDrGn7fE5ADjAy/3YHf31Hsy
	 RWAKVlWM0eXfoo7oUMuaYT4acAPIPI4xPysiGgRx0qWUflrzAXi3UAAVAX5CLnfeO6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820235;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=TO/b7VVT2ovstRNnAf6gSRP8hkVlWIvonCQ5/J0g7Dc=;
	b=Dy8ZiVeOMUDaw4EfiQbTuIk3p0jtr/AB1XIbJr42GQY5Tf75Qr/hAD3sShIs5YT36IeH
	 Bl3JcbEZ5oNzrn0W85tTQ1kCFMJF8g3u2QOd/t7rnUOXTBdQNPLtQaRDEcwPDKmxC1Gzf
	 aP0g4nLk/5b7PDWEn8dMVQmpQOngnhxglynDIUS4hcLo/jYfMUjE2dKg0SVjQu2BEzaok
	 u2qaI4QXhWGj3CI6gYsv3SJtc50p05fBMBSKjgg8E3qHEVlY9sQBE0/bLVw6Kh8mlrSb0
	 d1aE9rn9Eq9TZqKoEBwE45rpvpPRNpCNJpZHDdwo8XKJO0CcRxhrCUmTmnaVlAenSDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Z9JJ2dPo;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA7606A31C;
	Mon, 16 Nov 2026 09:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Z9JJ2dPo
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E353D4091D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794820227; bh=TO/b7VVT2ovstRNnAf6gSRP8hkVlWIvonCQ5/J0g7Dc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z9JJ2dPo84mmE7nw0htYbfPkUWsCopWyN0GA496NWzfsJrKgtq0Q5oGVM2wO0pLd/
	 s9kDmBdRHCx0v08ZFrayrF52zGWr3yx7x1dkNrovX5HvH7Bha0wCdaSL08lzEKtS7w
	 4hY17D5TG0UA9TAJuYCTwITz7HMb8o2lHZK+q4gZ3ZDdQ8WxVI63zbpJfZTkeV+y7j
	 /ZEUoN1DkSu2RF6D6xrezoPzmHKKgjBkWXDrGlgrdZgisCbSbI4GApVnpEAP52kaXR
	 /Ns4yTwoUBpeGGRDobAXNkHQD9VSp1UEmLcbpYTUJmwXtPkjVa/9GLYH3VI8CDgYCZ
	 gTi0wVY8ts2Hg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E353D4091D;
	Mon, 16 Nov 2026 09:10:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: doc-guide: add hint to review patch
In-Reply-To: <20261116082209.1100175-2-manuelebnerli@mailbox.org>
References: <20261116082209.1100175-2-manuelebnerli@mailbox.org>
Date: Mon, 16 Nov 2026 02:10:23 -0700
Message-ID: <87ik1x3zwg.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> For the case of a duplicate patch, review the other patch instead of
> sending own patch.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/doc-guide/contributing.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
> index 46a44b39d6..ee2f896a21 100644
> --- a/Documentation/doc-guide/contributing.rst
> +++ b/Documentation/doc-guide/contributing.rst
> @@ -129,7 +129,9 @@ looked like this::
>  The entire process only took a few minutes.  Of course, I then found that
>  somebody else had fixed it in a separate tree, highlighting another lesson:
>  always check linux-next to see if a problem has been fixed before you dig
> -into it.
> +into it.  If the other patch isn't applied yet it's good to give it a
> +'Reviewed-by:' tag to help it get applied.  This way your effort is not in
> +vain.

Should we perhaps be explicit and say that the person involved should
actually review the patch?

jon
