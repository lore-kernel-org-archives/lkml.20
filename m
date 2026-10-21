Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600628;
	b=qoY6XZEU0bXIpaoq0AyTieSYtMV5KVdkfOB014qbNVQtOFRV5oviy0qvBUxIVWZO5oeh
	 f0DX0C15BDcBcQ5JKWGQRnINsujSGHIybCFkIJeYJrY97IOUd2thue9pkkyG63wTuUwvU
	 3Z6WECN1DxSpLD/yjDrKg11DBiGgF94swdstRM0g/9k9T4ZYup7FCf6Hdghoxz7y33Xw5
	 8M3m40dMyCFAjlMNEdbTxEJwlqpMUP3h1D04lX7mIIU0b884+X/ysR9KYBtXNYs8JtUmr
	 20HMt7HpxiIsPsKLDw+dkCk/R9gz38AEI+gVo4JcVWRDLZf6WsQPBlN8xSU30aLmNtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600628;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=r/EfQ/MDX8Ow3YiiykRfv96ZUvWfAFLHvcKeZLHSFs8=;
	b=SPPZTYekhD9FLP/Q75YbEsepx4gMy8/Heyr2yXgjXBkVvdLExYVIE3dXgifkCFa2bFEx
	 FHOYiZVBW4/XpMvSsDtz835nTqLYyCniqqh1TGCa1upJlwi3FiTGJ4qwxZGP0EqOVpVOp
	 LlR7XyB7K/vDsGbm3ESWoseQtD56+IEvJa3kk96JI1CxHvROszUWpOrABZx9qZ+nVxTHE
	 BOi7j4Zoi6M8HKMR8qAyUDc1vTInmbLcbitLUk1wGaHEMTKbuz0KS6OanHV7z6Dc8OYyF
	 h536b06aw9UT1FNXhLbqwzNcZZg+q4szo1zI2u0btgI1AASXEjBizkVC+dZV0q6j8MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GbBrQaSk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615C606A323;
	Wed, 21 Oct 2026 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GbBrQaSk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA971F000C3;
	Wed, 21 Oct 2026 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792600622;
	bh=r/EfQ/MDX8Ow3YiiykRfv96ZUvWfAFLHvcKeZLHSFs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GbBrQaSk2pLlyVTrh8fMqNtwAHJka/NgivKKfP05Zydfb+ZmUXRmYUCgyEFMeDCrz
	 D7g9OhVAGUcUOcCkDWwXcrwlQS15v96tC96v1K85QhTshWlGEpEIBBOwtEhYKqdnSY
	 5ppC0R+OTSbwH1L6ODm171mY2xJtpTYLS8ehQ/34=
Date: Wed, 21 Oct 2026 12:37:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261021-wonderful-seriema-of-defense-afee8d@lemur>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021-origami-groundhog-of-radiance-78baf9@lemur>
 <9aa3e170-3d03-456b-ba2d-f329b93ff071@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9aa3e170-3d03-456b-ba2d-f329b93ff071@kernel.org>

On Wed, Oct 21, 2026 at 05:49:04PM +0200, Krzysztof Kozlowski wrote:
> > Specifically, I am working on a service that eager-builds git bundles for all
> > submitted patch series -- the goal is to make it simple for CI systems to
> > fetch patch submissions as bundles that are already applicable against
> > mainline. Knowing which tree and commit the series is based on is really
> > helpful when figuring this out.
> 
> This has limitations you will not be able to solve.

Oh, I am painfully aware of this -- but hopefully we'll hit most of the
standard cases. The upside of us doing it is that we have All The Objects (as
long as they have been pushed to our repos or the repos we mirror), so we
should be able to figure out the ancestry, hopefully. The base-tree info is
mostly useful for us to figure out the contributor's intent.

The service is still early in design stages and won't really be available for
a while yet -- but hopefully once it is, the other CI systems will be able to
benefit from us pre-solving the applicability so everyone doesn't have to do
it over and over on their own.

-K
