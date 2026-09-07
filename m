Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF83E63AC;
	Mon,  7 Sep 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796240; cv=none; b=umUbwdkT5zNLdw3VrG/+Ixn1DDwaNq308IbCLiQJTXNxRIzF27jZimZT/kRGwdobnqqAuundMaFqiWgrv3/nGDwj5wohTK+fdCn0kkerTWCvCz1t6kanbn8yKcLSrswKaSEUk7lL3M/HgISU34Ph1g+baFTZ8BZ4Luzy+DVfJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796240; c=relaxed/simple;
	bh=aG2rMOM1XxiDNehbsPsNtAooRQwheKHc1N6JUlHOaFI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KszJiads55K/4e0uPnm0hx/imqKalgLej+U1eExofWADiGD/Og7Yis+ntFbOu5JXQAm+Je9houP2fw6ieQ8B47Ryk6wYPwBcHc1ttlE5QmYZHGdsyNogLJHBmNQJCLVBN1EM8llsErawcnesvYj+PJtIEA7kEL8LA2KrBZQFmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=j/SUtY7x; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="j/SUtY7x"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4796408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788796238; bh=XugLOgcVgDkmW8tiB321i8byCAHZEnxCKFe5ocFS6S4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j/SUtY7xAziND2uWoZB1em5zFCTH1gZOqM9wsZHANQkox+ZNlOtRl36dtuUNIYlYP
	 6cdV0cjferRxQ/Uqw0UHWf2UhUwZkDxhsINH3UEhZI2glkShlXPZH/Gee+sgb8fWHt
	 +bF1VizmnkGZnJRvJ4mFVAsnOMtEAirl+dSaVeMwrQJrj4NuKCzfec8Uf1UgIfkJWQ
	 6FIXI0RIpw40JuLxTSGLTbvRw04p/lIWgEbGHeOTH2ClwtIiN5/tf0L5AOLonzMq9z
	 Eo9OEWplV+XCNq+doe2oCnWd7Gyfg15qM8v8vOEaa6jYcrKFCuhs8waOpPLfZ5guYr
	 7RkN9kV2JHd0g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B4796408FF;
	Mon,  7 Sep 2026 15:50:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] Documentation: reset: Use fwnode_reset_simple_xlate()
 in the kernel-doc directive
In-Reply-To: <20260905085211.40286-1-kmehltretter@gmail.com>
References: <20260905085211.40286-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 09:50:37 -0600
Message-ID: <87mrttvz5e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> reset.rst asks drivers/reset/core.c for of_reset_simple_xlate(). Commit
> 9035073d0ef1 ("reset: convert reset core to using firmware nodes")
> replaced it with fwnode_reset_simple_xlate(). Since then the directive
> finds nothing for it and the default translation helper is missing from
> the rendered controller API section.
>
> Use the current name.
>
> Fixes: 9035073d0ef1 ("reset: convert reset core to using firmware nodes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/driver-api/reset.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
> index 7a6571849664..932699c57d1e 100644
> --- a/Documentation/driver-api/reset.rst
> +++ b/Documentation/driver-api/reset.rst
> @@ -213,7 +213,7 @@ devm_reset_controller_register().
>     :internal:
>  
>  .. kernel-doc:: drivers/reset/core.c
> -   :functions: of_reset_simple_xlate
> +   :functions: fwnode_reset_simple_xlate
>                 reset_controller_register

Applied, thanks.

jon
