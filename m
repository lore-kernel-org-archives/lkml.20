Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635983;
	b=rQLP3Ry8jWnuQGLAzT99ap8L9DD6KmBtHz6l+zIb/1KxkFdnAcKNWdb4TfUa/ilnOLSm
	 a/bJUwfnytRE2+s5NCimoqDrRxppx8HCInZH2by2pArkncIu0eXyJGwHeClXgP5JNxRwk
	 rl3L+NMqQ5plhC6/XCuEV+RHnSdTEfHJv39LNwHOmt0X+VhD9NvvXKBUg7to/z/Z8Lxc4
	 SPE89Wdt1W89ncPn0dptK4z6tVdrHzsDRj+dS5yxlBOZA4XRRatDD0qjYXtyRFlQCMU0c
	 D3vBza8Vmq5tIjXIs7lI9sHfLPnFfd9nme+N/Qpb+mRjI4XWrvunAKH3YQYCQkcnXuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635983;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=AkkqOJ23j/1w9aDcgkUObIGtTrhMiGUiSVpJap6HkIo=;
	b=k4Kv6pPEHHy3ALLyrikU0uR6xTEUDWvBqR7gmju81QiTlTcnYgYCKEgNZPP4hRBrPH97
	 xhj34WCOphiPvo4HaGOUEG5vkLsZtjn0nwGF4JrToZ0acWgpbEolS+Y5JYcc78qbY7KZh
	 pSJWNYZldoedco+cPVAQWEi78SSTHt/egTe0lwUsRn6t8ayuquDIc5b8sE9cmtDxtiLQO
	 UDUHpVFoRItUCEmOgmmIhJ23ooYBSAoaFpcQ3k6rTKUXFTEG6uExrtuQBbNhqnHTdXRQU
	 VEUpvo7ajEiLwa17fK2tsC7aV96IXIC0PvjfLV58LshMqoXHBS6akjLrhXUQmtnlFpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hLSFEKNp;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB471606A90C;
	Mon,  2 Nov 2026 16:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB471606A90C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hLSFEKNp
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EC7A640430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793635982; bh=AkkqOJ23j/1w9aDcgkUObIGtTrhMiGUiSVpJap6HkIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hLSFEKNpfg/XZfeCCVabwTQY4KLKJZpZnQMd0k8s0ZmJXqkulDhzQsOZN1r3zsA/h
	 BZjjkR3F/UmzE4Bl4RiJANXHV95ZYme5S8CgBOVhj6VUXJ18evdyi8aB1XiE9IMZIn
	 3TXB2h2GpYVuV/05iNUnthJNjOIox8kINMUWHcEXnvjsc74cycEBTxf8ZcvwfWF3MU
	 VD1guXy43nB978u4gj3/5tgHG8YljzYIBeXrMwp8hAFBUNsoOboggIg21W5T242RK3
	 4e/sG9XhaA+2dDyGxshco46r9512ysh8V1aHE1J3hx18PKfmqPEARjSRIzBjmkDE00
	 MK8wcjKlDBUFw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EC7A640430;
	Mon,  2 Nov 2026 16:13:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Atanas Kunchev via B4 Relay
 <devnull+atanaskunchev.proton.me@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Kees
 Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Atanas Kunchev <atanaskunchev@proton.me>
Subject: Re: [PATCH] binfmt_misc: fix typo in "auxiliary vector"
In-Reply-To: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
References: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
Date: Mon, 02 Nov 2026 09:13:01 -0700
Message-ID: <87y0bbciuq.fsf@trenco.lwn.net>
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

Atanas Kunchev via B4 Relay <devnull+atanaskunchev.proton.me@kernel.org>
writes:

> From: Atanas Kunchev <atanaskunchev@proton.me>
>
> Fix "auxilary" -> "auxiliary".
>
> Signed-off-by: Atanas Kunchev <atanaskunchev@proton.me>
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

Applied, thanks.

jon
