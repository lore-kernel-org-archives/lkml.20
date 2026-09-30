Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD9493D21;
	Wed, 30 Sep 2026 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764740; cv=none; b=IQxcIlwEITmri3UhRzkfIIihqWrVDUmnEui0iUx3hzOqjdKETExm9L3FDCuelOZA2w8af51ygdk9B4t+/V+y1qjqdWrOMPl+PuVYt7rG3xYCtTwoj9NDrrWgfvWjXNGogsGtGWZiXNPgR26UsjBL6861A4I2ZHjSNHhpW3cFpx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764740; c=relaxed/simple;
	bh=GV3O/rmVPZO8fyMq9CIMpuM4SABQNGqfp5sQwjDvsjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6WzbQmgurcMutbeJdCQYVPrPd5gtTc/I6RK9/7gS+gb+gGeWz0Uq7b7sHkGn+b0qPOtMNkR31qJ+ITol1UL+RZ6VxCzts4XlFReK+98ZbdTDfs47I3rnPUi29wqXlclShZqSzQBD3/lex2p/6c/aH98X0XgnazGfv3jYNebydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iyj8/IOt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iyj8/IOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1551F000FF;
	Wed, 30 Sep 2026 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764730;
	bh=Q42sMmac7vKYGCVFrMdhSVkWOijsRMSMvzwOYZNiU4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iyj8/IOthcCiozVPuAmYxSU+qxe9W3l7Rnu2ibWzZySm0kt6WYVvXmGGRZJn/mxSk
	 2Uj3+6OOvaA/FpyxtiBudhFjCbFkOuL5/2/7nVCaBFei/pJ553tE6EQ7tNX+xnr05f
	 uwrzIkdTn4tvZHbrmM4k6bS1nJuvfNygSm7j5IMNdRYH2j8UMwj+Z6eOdaFTbJCgiy
	 7fYP6qGK9og+2MXyk8PSjx2rvyergNkpOZ86+dPZ8FuCRfI+eXw9ns4JOw4a+fcrKN
	 LyUtKtJR6ZFs/bOHMR9DuWiK77xEQKrLNahF87S4noE0xE7jFTJyHdlOjhVJs5H73O
	 x1INh5aIyGlxg==
Date: Wed, 30 Sep 2026 12:38:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sue Wang <suwangquanta@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, 
	Steward.Shih@quantatw.com, Martin.Peng@quantatw.com, Fred.Zhang@quantatw.com, 
	p.k.lee@quantatw.com
Subject: Re: [PATCH v14 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Message-ID: <20260930-curious-narwhal-of-calibration-62442d@quoll>
References: <20260929075106.74731-1-suwangquanta@gmail.com>
 <20260929075106.74731-2-suwangquanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929075106.74731-2-suwangquanta@gmail.com>

On Tue, Sep 29, 2026 at 03:51:05PM +0800, Sue Wang wrote:
> Document the new compatibles used on Meta Ventura.
> 
> Signed-off-by: Sue Wang <suwangquanta@gmail.com>

Please respect our time. Actually other contributors time as well.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

