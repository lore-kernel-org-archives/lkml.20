Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9251FCB5;
	Mon,  7 Sep 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799698; cv=none; b=mB988pNq6Oh38Xo4uwqtipO/N4xvIFElQ8jxYqx4D/zqOLeIxKXM0vZTS1Lj2vfxpq/Qu5d6oUWZPw04+3xf49EqRCHZTTu7whH4LMBII4pii1/Czaq0x2G4nMdYBk0cA8ZSPlptCzx88rBEbTgN59x+aSiOG7eAJ5bBKp1spcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799698; c=relaxed/simple;
	bh=9h3D8zBguySEa97LjsknrKJLGuN7bv6lQetDSegGjzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KqTkwgaIzPwC4M1cJzPooG8nyM99bkvXdxMgBLfUUUWA5yKtd83aD1O5xup/eskXklpEH06MUzD2viTU3MYqMukaPtfRb8nHv0srx9CeAXKgsMAQ3KKOH3u5CMOCEgp3kwHHwf+qLtLAdlwNFlj/LtGDVYHZpKcoj62I9771e5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hNcaMqCY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hNcaMqCY"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B8234408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799695; bh=KqUPWT0l/DhB3R6MJPh01/NhBmfVIiKXwx2T/4oFhBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hNcaMqCYzWet6qL0Y+QkN227L6S2mf6Nnd1Wdtlv4zL/fjKZ19kpLQpVYSB/fFJme
	 QvPJr6Yd0dj9vr6HgpoMgFF5GSjyesM67oJzpC1FLY9GhW95Zdc95kx0yEhamU7WaX
	 XL8i2NkZjmzJqWGFYxzGHElYFblv78U9SzXittfxK+Ed0RKE/iXB+nFD8mtAEZd2BM
	 MYZGf5azos1DFwF+FXf9uXPbpEb5qRrpzO30GANJLem+Dus/aMBoTeS0uw5DowmqMb
	 EbNlsFCV06UWBqlljAOXVoguJU/7x7tGzmU5mUfSAlwE3/zXsVIm2xDI++2vCm0fS8
	 iRA7Y0OH2KsPg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B8234408FF;
	Mon,  7 Sep 2026 16:48:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Giovanna Macedo Cox <giovannamccds@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Giovanna Macedo Cox
 <giovannamccds@gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate
 coding-assistants.rst
In-Reply-To: <20260902005603.18836-1-giovannamccds@gmail.com>
References: <20260902005603.18836-1-giovannamccds@gmail.com>
Date: Mon, 07 Sep 2026 10:48:14 -0600
Message-ID: <874ig1ovn5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Giovanna Macedo Cox <giovannamccds@gmail.com> writes:

> Translate coding-assistants.rst into Brazilian Portuguese
> and add it to the pt_BR process documentation index.
>
> Assisted-by: LLM 
> Signed-off-by: Giovanna Macedo Cox <giovannamccds@gmail.com>
> ---
> Changes in v2:
> - Change trailer Assisted-by for the new pattern
> - Fix translation errors
> - Link to V1: https://lore.kernel.org/r/20260830234515.63131-1-giovannamccds@gmail.com/
>
>  .../pt_BR/process/coding-assistants.rst       | 60 +++++++++++++++++++
>  .../translations/pt_BR/process/index.rst      |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/coding-assistants.rst

Applied, thanks.

jon
