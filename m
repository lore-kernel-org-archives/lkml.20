Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875C45C6F7;
	Tue, 15 Sep 2026 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456590; cv=none; b=BO8/IJngqxMTtl3qtJwfivYtfuZ0EIXvhZ7yOfwAwEZV9U8VlQGr2mY+Lswo8Km3toJZ/ePlIgmW3hOS6Im6XfqN3ASTbz8+AYCFYu5Z51Sj1Da3QWblWrDc+1tJqj0NNpX/Fdg/KRKaDEslZIC7vloyb8EyYPO0SEwK0LbDQaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456590; c=relaxed/simple;
	bh=V1kmHOJki9alp2OBx0peN5hukaFubGq7YXi8nhjFjCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8bWO0oOdmmqa9Bhw2wKXM/EcOxKxMhIk41VlI3nsrfAYrM3CS1FlE0VoA4Kkwv0tDePjlPNOYwbjwlGo0213h3084C8qn5Xjjc5TGU0f3lx0SV2xs7LU13xYV66GinpYNgPVL7FV2HPsYwCQoZH3ioNtHWAg1ueLJTu/pyAgK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZLxlXiz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZLxlXiz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3BD1F000FF;
	Tue, 15 Sep 2026 07:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789456586;
	bh=tWfA343OstnM3of1trrb+AhFBh5urC80jccPLVT22zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZLxlXizWTsCkbrgzu45C2MkmVgb0qLQQ0V7dkPT2d2Yc9/d4612dP9+yMmCObtQq
	 +vWTavoyWwai4aslXe5XYBJMVEWuC/4FRvLzJCBcnBUWvzGzqhc6OnFmckEjiIFgLs
	 qqqhRC1O3z5+UK0jiP6dCpEsS7cJUhhFUvenN+EQFenRI8yIcmuCZ5XRw4owd+sLOK
	 pGb9LC7IhTIkTB5N8CsZ3gdzYx7K7y12vMlibRbqnCvNHCHqNeaJkyDDGH3ZkSTMzv
	 hVH4ddjyiPfCE4ru9ZTYeNMbIzexr5NPL1inZyZUyRGsyCEsZ0VWjOA93wyjlio0Zr
	 FJD8xX/o0779g==
Date: Tue, 15 Sep 2026 09:16:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus,common: Extend clocks and
 power domains
Message-ID: <20260915-meek-secret-nyala-d472b2@quoll>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
 <20260914-add_iris_for_maili-v1-1-09df2b54c317@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-add_iris_for_maili-v1-1-09df2b54c317@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 09:00:24PM +0800, Wangao Wang wrote:
> Upcoming SoC platforms require more clocks, power domain entries, and
> IOMMU mappings than the current limits allow. Relax the common schema
> constraints to accommodate these platforms:
> 
> - clocks/clock-names: increase maxItems from 7 to 8
> - power-domains/power-domain-names: increase maxItems from 4 to 5
> - non-pixel context bank: add minItems and increase iommus maxItems to 3

Don't repeat the diff.

> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

This makes no sense on its own. There is no user of this bigger
constraints for clocks.

Best regards,
Krzysztof

