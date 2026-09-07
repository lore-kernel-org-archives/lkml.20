Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC838E5D7;
	Mon,  7 Sep 2026 06:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761371; cv=none; b=JydJD3cgvYeULQjYSgrbtI4a4b+hvF9vHz6oqG0PbgHDljrey7aTUK29O0hVWNo6zFmxO5DWdhXurbgP1uTX9pLLePjpjl/veN9mSnsQOeT8o3qmsK6KuedRYjMAFQlwRg28bO1x1gtYZiDsoqgw86JJDo9XSrOxp5pH0VfdUcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761371; c=relaxed/simple;
	bh=9nO4WS3fEiBgG1Qiw8gJT7pcYglX1bWzAHr7cEKeHVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liyfOl80aSz6mt52wn263sn0dOIAwfsUBU3/HtxXsmCqQris1fEDmU3HPmdkdSMUX2gGd2SrCxUZFL2Y0UDzn+Yg5Vpgptr5XxxTFvBthqwfnjDmbd/fZVamBfSeiThmwpQ5opa9/WdmHPwYPQs512h7gcGoH5n60sAedyJP8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxJVmaxX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxJVmaxX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7EE1F00A3E;
	Mon,  7 Sep 2026 06:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788761369;
	bh=MU8vTnQ4SCG40k3kEVDcMjU9vE6Mm32ui6oD0ivsqAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TxJVmaxXf2/z7qqsQQ66XgHCtelNQqPDkAdBTJK1oBJM6KcFZfUqh8XvDytAy6GDh
	 4t5KvbQnQ/1vz/nTLJRVdBpMtcH6lGLx+hXmjaAMJ/KyB6ABqapuVYEX1GPfMPA+Av
	 OE3DJBwaT1WeG8gWjmnt7LQFsW3T1d0PFnCZYN8Ti+n6RS4/GtHB0N73Wh26H3a9by
	 ZSXY6OjlwfXvS35EVkX8IU5qqd+dw4VADEYbD2yQHUEIYddnFJq+yoa89kyjg93MUB
	 N8QwKL2DoT+sCpR8Z4LZg8L/YryBSWthu/pfd+dd4py+tPujqSicVAyfTLlFGc4u5e
	 kfUSnR3JMkh7A==
Date: Mon, 7 Sep 2026 08:09:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leng Honglin <lenghonglin@axera-tech.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Zhicheng <shizhicheng@axera-tech.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, hlleng233@gmail.com
Subject: Re: [PATCH v2 2/6] dt-bindings: arm: add Axera AX650 SoC and AX650
 Demo board
Message-ID: <20260907-portable-moth-of-passion-ecb1bf@quoll>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
 <20260901-ax650-v1-v2-2-993bea305476@axera-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-ax650-v1-v2-2-993bea305476@axera-tech.com>

On Tue, Sep 01, 2026 at 05:19:29PM +0800, Leng Honglin wrote:
> Add devicetree bindings for the Axera AX650 SoC and AX650 Demo board.
> 
> Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
> ---
>  Documentation/devicetree/bindings/arm/axera.yaml | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

No replies to my comment on patch #1, so dropping this from DT Patchwork.

Best regards,
Krzysztof

