Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D874485CCA;
	Thu,  3 Sep 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439150; cv=none; b=rIgn+yItH38MxXg0JJ0R9FcXVmSQCpEM7oIL1zzcHTYUGB4bX3T9B11iOtK6Lo1WIfXjOk8fcWzDYV7jJWv2pWJyuvl4oPSizld24jCHdLP1TOZ8vCUMnSV+I1pcMmXRD4FARuAZnRrgF0VtM5U0bFJpedu3RIvgEFa9Ctac67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439150; c=relaxed/simple;
	bh=1bKZ7CyUodmmMnbiOXYVATCoCjTPuTDEONjy1Pg4HFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0NpqQzzN4Mv1f0YoyBMWIInUgwrr4fRUpDauSmvzA6tr3cOf6BRDJYk1yOHiilHLDijbzcbKgadaldlLfhcup8kZurkB8pp9BD7EBFRSSCpvabQO0/9RNvagFJpryBHTX1xF3FdxZsxUl/B24m/wXBFqiy+eVYN7vPrxMCQ4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gd0fP+Fr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gd0fP+Fr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EEA1F000E9;
	Thu,  3 Sep 2026 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788439148;
	bh=a88oaMPdFcI/yDDJp6S+ycZVQY3NXBbhhuZ7cepLWEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gd0fP+FrBOuDWBABAR4QXGuGsaiDFdjsG7oo5klw7sjSz0ah3CcBVR0vQquw5oOnO
	 TLF6g1KF4tF3LAS/VvmO9H0zjWiepY1Ga/5ihZkMoxJrMkSsfRzK8omzEcRRX8jICo
	 ojR7HDtOcR8dVtM3sEXYaIWTXFJCP12/fTzoFfPiHNGYhSbESVlLL83ot0ax3MYXoA
	 /mSdVhXNpUTSTOgJjusohKDl1zTffFzoXzJ+u2AAPvx5B+OaQJ4MhCprUDy22o0TLw
	 Ne3tE0F2Ba7Iqc2TtlittI8MU+madugrNVIcv9+Ari7Wn9DaKhK7Fxnua6xz7kya0Q
	 yPEVTS7/es/uw==
Date: Thu, 3 Sep 2026 14:39:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leng Honglin <lenghonglin@axera-tech.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Zhicheng <shizhicheng@axera-tech.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, hlleng233@gmail.com
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: add Axera
Message-ID: <20260903-impossible-normal-termite-b7f9b8@quoll>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
 <20260901-ax650-v1-v2-1-993bea305476@axera-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-ax650-v1-v2-1-993bea305476@axera-tech.com>

On Tue, Sep 01, 2026 at 05:19:28PM +0800, Leng Honglin wrote:
> Add the Axera Semiconductor vendor prefix for devicetree bindings.
> 
> For more information, visit the official Axera Semiconductor website:
> Chinese site: https://www.axera-tech.com/
> English site: https://www.axera-tech.com/en
> 
> Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7..1dbafe682724 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -219,6 +219,8 @@ patternProperties:
>      description: Shanghai Awinic Technology Co., Ltd.
>    "^axentia,.*":
>      description: Axentia Technologies AB
> +  "^axera,.*":

So how did you implement own comment?

Best regards,
Krzysztof

