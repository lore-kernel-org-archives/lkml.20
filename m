Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778135;
	b=iSDLHhGBqi/8WvoUJ1BwzlId3oPUO/5pGFv2J4vrl9ZfaZ7I25Kj+HzXYiwE852IBKFF
	 JnMGkncYdv+dVsb/w9BBjgCxSm0QuZlYAcvBkaFkIK0bol2hwUPDq7EYYoGWltJj328NH
	 u6Yo9OtM9MCEADbzfyHu93YRPYWTqfAt2IS73dA8MAwQIvwCCYEt6LLDrTJkVLk4Eskc3
	 tys3cqHbsV9jwy/iUvs4wkH/qSqTwxLrlyyErKbGhYetYP7sU9obv6CvdEH0tfH3unCaC
	 fLt9WzpC01GCgkNCZPxeU87RnsWCqW+MzDak3HXl97RplUKdACpY6pgEXK98mwwQZvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778135;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uYTTF5jDNkxMCVJ9mrlfykfmfKah1Cd8hTMk87yFHBg=;
	b=fKSY/B3reTYktrycqv48D2jn1GTKxP3Fp9oqr/hDWe2EnkVQgVEDQt26d5CiRgsVzfjA
	 NR0TJ8mSyn6hmGFrkT7vDZI07hA1YuCavws3vQSFxkC+Qw8cfJzOVT1zzOlMnHPm1jBjK
	 JDXYBZouobE6o9d+/cIXRJ4PAIwbf66ApOH5BwT3D1taRRwdwq/cwjHqk9kmVukX8R4yW
	 8UMbO7cFdPQOSCK4zjMqJKRCbeG6Mlnd8O7wuQnISbBrIID0ctTyKPkccNkeXEqWblBOK
	 lcHOXdxQsMaLWAEwNvkwQMYN2ikmHp/4v++igZA8+FZ+XuXEjirmd3Ui8ifLusq636Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFx+HjPs;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D236D606A31B;
	Fri, 23 Oct 2026 17:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D236D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFx+HjPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uYTTF5jDNkxMCVJ9mrlfykfmfKah1Cd8hTMk87yFHBg=; b=FFx+HjPsKWG+EePtFOBKnIR9Hs
	GiPfrM6SAXY2vTtQro2pSZDw/MGSKa/4imbtPz8BzVcylikXV2VXIuNwXOoVNMkufpXfFQbD/4Ah3
	fSKZ0uUV8cUm7TXyZ7RLnpCVkY8tTajyQXzjilHkO4Y0EkuEzhAiaz+11DIDHgPbTuG3/fTtQRJVy
	s1T02id+dNFvi99iSrYWeRc8QXq+I+yf4Fnffy7Tck+NG1U+X5eq4MT9cyJDUvnkNOaZZy1lbqJTe
	rBnqniYL30xcHkkDHQElLV8g+PQYcUDj7+YrHkYhlz6nCrB4Kts94DwZ3Q1UdNPoLhS4aLmzYZN5K
	WmduT+gQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJUG-0000000Glen-1HOa;
	Fri, 23 Oct 2026 17:55:28 +0000
Message-ID: <26adbb3d-bbd8-442c-aed6-80cf091888b0@infradead.org>
Date: Fri, 23 Oct 2026 10:55:26 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] binfmt_misc: fix typo in "auxiliary vector"
To: atanaskunchev@proton.me, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/23/26 10:50 AM, Atanas Kunchev via B4 Relay wrote:
> From: Atanas Kunchev <atanaskunchev@proton.me>
> 
> Fix "auxilary" -> "auxiliary".
> 
> Signed-off-by: Atanas Kunchev <atanaskunchev@proton.me>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> Fix a spelling mistake in the binfmt_misc documentation.
> ---
>  Documentation/admin-guide/binfmt-misc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
> index 9e84b877d06d..e37668371453 100644
> --- a/Documentation/admin-guide/binfmt-misc.rst
> +++ b/Documentation/admin-guide/binfmt-misc.rst
> @@ -73,7 +73,7 @@ Here is what the fields mean:
>  	    Legacy behavior of binfmt_misc is to pass the full path
>              of the binary to the interpreter as an argument. When this flag is
>              included, binfmt_misc will open the file for reading and pass its
> -            descriptor into the auxilary vector with the key "AT_EXECFD", thus
> +            descriptor into the auxiliary vector with the key "AT_EXECFD", thus
>              allowing the interpreter to execute non-readable binaries. This
>              feature should be used with care - the interpreter has to be trusted
>              not to emit the contents of the non-readable binary.
> 
> ---
> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> change-id: 20261023-binfmt-typo-bf80308e23a0
> 
> Best regards,

-- 
~Randy
