Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2263E50C282;
	Mon,  7 Sep 2026 16:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799842; cv=none; b=dusVONfFxeVlm6aVQ3uVLvY16uzrZG0sdNGPhiHL8fMZLfIajeaZbOhX3u5SKTsZEjwM0Z0lBWJ97yF6Q2BcGyu6aAkiYU6n7wc5gwCBTTRDXUekAPeJ6lItVu4rB4qF0LvfVLdSgF3q1sJcIwaFfMrHHKPOmWdCI5vKSw9GfSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799842; c=relaxed/simple;
	bh=AhS7DBUBM2JpQ0ZSK/KgGW8TiGC1GtzN3kaWmjBdriQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pv8GP6mZ3ylOn5RBT8maWAvgjFts+GC4wXXAt46fJa+18GpZCnGbDnPPvOiHSzA1ZRYE6hxQK/f3nLfrap0Fq8JdEWH0fHUYzZnxCfNZ7pe+eahdZ+Bu+QZXHRkZo10QWLRsZe7eQ6QcmUgYPCtI3OTsVWtomA5bDAYY9w9E7Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nPkkXaBA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nPkkXaBA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B4A7408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799840; bh=+TkTgOY2vQDc/zs3+6sQy7bH4PicsW2ptz0bAFTR0nE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nPkkXaBAi9pZMc1vo+NAXotLdvMbU5Usoundzq+bb6NpSw6ypcjyCfG5OfMU8MRqn
	 oqp1CsWDDe13LiD2GKDJCx80wcGZxA45cW+Z/RtLhcwD8/KZ36vEHgXDYPnFKm1bUZ
	 Shv2Nbk00UgZlCQw+7ulXcPbfTnH0EN6wMh5Gk1SvsesGKE4Rn7SISgQYK5IsNXxK1
	 FGyNm1kvkiQ7nnjoUQvxIBtAkf3IRaJ1Bjx1OYUEgJkv3SNpCIOcnt3CoqLY4vHNmE
	 KrvULwJhnZy/Kxt0KT3yGgkF8aYoqDd7xR1NWT9O4+Egy0Ng181c23lPcKWdSqD+8A
	 wrOznwtz0X0/g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8B4A7408FF;
	Mon,  7 Sep 2026 16:50:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Adryell
 Ramalho <lucasadramalho@gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate
 volatile-considered-harmful.rst
In-Reply-To: <20260830205912.478358-1-lucasadramalho@gmail.com>
References: <20260830205912.478358-1-lucasadramalho@gmail.com>
Date: Mon, 07 Sep 2026 10:50:39 -0600
Message-ID: <87zextngyo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lucas Adryell Ramalho <lucasadramalho@gmail.com> writes:

> Translate volatile-considered-harmful.rst into Brazilian Portuguese and
> add it to the pt_BR process documentation index.
>
> Assisted-by: ChatGPT:GPT-5.5
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |   1 +
>  .../process/volatile-considered-harmful.rst   | 130 ++++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/volatile-considered-harmful.rst

Applied, thanks.

jon
