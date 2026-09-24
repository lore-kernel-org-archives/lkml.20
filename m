Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D6747CA71;
	Thu, 24 Sep 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255188; cv=none; b=hMAgp3c8usBcybAiruT5/kBH0ygoa4XSMpQY5vElIw4FLLPTcvuRwd3F5LQBxOz6bAd61HVt8Lb24m3ma4vLP2j+gFu5EpyAwdqrB0puIP6le3zz5mQcnOf/kKwKFq7+Z8a3sM9JXZr0HoA+WJF76mREm/ssNMv+CTB/S7QJfUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255188; c=relaxed/simple;
	bh=3731u2RBUTuGm+q+HvMce6CqS+kRS4tgVsCv0aobxEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/2NWNZEeT2DPaRB+MtRTuEMqjM/oir3M1uhGyw8YjVpVtX/bfjSfqT94QSIH0Wk/Kk5CYilZHu/AqkZv9459AySFxiBhTF8Bb9KpPfYl/wgotS1nd8l8p8NbTDGeCt0e7KcL9X8GJLYNqNWF6S/8ukQkWXPignsT233wZhGZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fh8FB7BZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fh8FB7BZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606501F000FF;
	Thu, 24 Sep 2026 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255186;
	bh=A4NEQfNdKec21BuqvBtzbEuEBUBylBkbc04lyRdOg4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fh8FB7BZK1Mwhp7vGuKSugjgp7p5dIuUylZ+b0u/OGWU6LlyzI42I7N9PKE6leqF8
	 3IkeDc59JVH0CfzwePwABcGjclUC4Ic0jW/hqpYQ5lNsO1w66RFMWYV4RJh5qXoNgN
	 BFQS29jS7uNJJmNLIiOffdiJRvNsYEHIvKpprYBS5JpVGNovsvr9Bp4jWn1d5IQnUI
	 W6jgmWdF7ya10Ill0UXR9nuRXzP5F3zzA0y7agV31AxJzyvnQxlf7Rfpy/FqdbwAyZ
	 a+G1+XNRo++XTG10d6Z12WsBdXLu0ZaR+X+rWgsp/+CTzjEMpEE48bGnovXBGMRDp6
	 gHKbAHAmyuKsQ==
Date: Thu, 24 Sep 2026 15:06:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	abel.vesa@linaro.org, abel.vesa@oss.qualcomm.com, johan@kernel.org, 
	konradybcio@kernel.org, kirill@korins.ky
Subject: Re: [PATCH v7 1/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Message-ID: <20260924-tangerine-alpaca-of-defiance-044d83@quoll>
References: <20260920184148.31541-1-mstoretv@cern.ch>
 <20260920184148.31541-2-mstoretv@cern.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920184148.31541-2-mstoretv@cern.ch>

On Sun, Sep 20, 2026 at 08:41:02PM +0200, Maxim Storetvedt wrote:
> Add the Samsung Galaxy Book4 Edge compatibility bindings
> 
> Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
> ---

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

