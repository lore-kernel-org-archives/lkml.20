Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636266;
	b=g6TxAx6+87cvikpFsKlEk77pVvZhlqqgAkF4EwHjihT7rNAQC2ypMlAlFQMRZy7lKvnU
	 eJjI3oRgNvyJeknc9TmWMwxagUc49blZSLg3roWpAHllARQbhWdoW5KTLqe9fIHx39ps8
	 w24M43oKdjVT2qvqaXDw9+qXLCatRS6mBrrfgD7QdC5Cx3sFqqybNGpCwbIpFAmWGTIuN
	 2rC5ll7VABxGUBp2KswSp7GfLQXJwjrE3Mb3Ck34+Is/NcYGN0QXeZnsMwVN/102C2QBe
	 sEBNOFeGCfXFppwM5LOpso0QvKkArUYorKb4gqfXucl2WusVLjUkYOLb0J/DXIH2EWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636266;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=XWF5uHPA88/+w2HDYYKdk4HuFgr86poO/Zjn39tb9Z4=;
	b=kXwKM3a+mCM5xg8JQNImhumv45NgxVfesoP7RQJaeJ+pz7QqYkz0k4hHD1MVTB1EebEJ
	 odj5NqSYKXdoJNq/P0x6BMHaTLLYBMKlzwVbc+vY59zu4kRc/gf3LooUDePJIKrx/6zB5
	 rLlGrHDztqf4egrapUg/X4F8uEtpPvtNKgtaINKQEWWrvNHEKaEsRxkhUsARc4hBX9Ecx
	 bby3qOMn/wkwT2GCDqmhVyxKSdtM7uvOVdXBCukwq5PFmfH0ZSduZ+L2nEMtRb4yRIMhn
	 uzg3IkoB7IC+FWez4HQX+77EQIslaOI2aTRp10rxOANDFzxJP4lDqXlSkulDWxW2bWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=cSBxcLfx;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7203606AB88;
	Mon,  2 Nov 2026 16:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7203606AB88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=cSBxcLfx
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2543240430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793636265; bh=XWF5uHPA88/+w2HDYYKdk4HuFgr86poO/Zjn39tb9Z4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cSBxcLfx2PpW6Lc9wYM44MxwAQt/+q8ee+BnVZRQKFRLR2kiYzBY8G/id7yXPHDuY
	 oIDf5urt5YudmbiAa7YK0P4t+TornWeQYFba2JD9X5aFUcJGYelK6WrlVtnoE70jYp
	 WqHGb6z/Z1P1xDSCZukG2cttt+PKNoHLH+n3rz3sVpazHmYO8hi1sjOa8056QzPM8D
	 nOPkkFFJzv+8HwI/LqyfTfTNfAsKSImDZMjigJuA1uvfjwhMtlU6iykBR72pG0/d4x
	 23kCfMzhIcBg6IdvWLqlXax9RxSFOo9BofSrt+Eo6Ef/1pHmlXhv4UccNtA0g+0xzS
	 5QPR9R52gTdzg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2543240430;
	Mon,  2 Nov 2026 16:17:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>, danielmaraboo@gmail.com
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Ribeiro
 <ic.gabrielribeiro@gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate
 programming-language.rst
In-Reply-To: <20261022154840.119951-1-ic.gabrielribeiro@gmail.com>
References: <20261022154840.119951-1-ic.gabrielribeiro@gmail.com>
Date: Mon, 02 Nov 2026 09:17:44 -0700
Message-ID: <87tslzcimv.fsf@trenco.lwn.net>
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

Gabriel Ribeiro <ic.gabrielribeiro@gmail.com> writes:

> Translate the programming language guide and link it from the pt_BR
> process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Use translation-specific labels for the page and all citations.
> - Drop the obsolete Assisted-by trailer.
>
>  .../translations/pt_BR/process/index.rst      |  1 +
>  .../pt_BR/process/programming-language.rst    | 64 +++++++++++++++++++
>  2 files changed, 65 insertions(+)

Applied, thanks.

jon
