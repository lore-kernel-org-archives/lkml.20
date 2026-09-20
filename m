Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D289172630;
	Sun, 20 Sep 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928719; cv=none; b=oHIXiLAqlMj7J/rPXpJpHiyopYYwkZ4KTYErFO/AdZKUbhQMAE9xHFuAP0KrKkhFMnic9GrVU86xZ4uyloJsoCNNFIj+nJIZ3JJz2iTigfPUpAKZeJ3/q10mGhMTHmWaj5k/7YrHgnAmYKXkCRSwdcmf6QtPxQUIiaIWuybVu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928719; c=relaxed/simple;
	bh=+1iJeGaDr2o55Ycpv+iGH/E7dYFtDyibM+2fMf/P/rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhvP6kK83DYBRRLtV5BbUyGxLMZxgA1Vdtul6z2K6J3SXT1AclUOq8aDCyK3ZuY/F0KJacttmMt2SGptX0s2B2n2UM7qWgOSXsRQvYHtkHBjMQX4NDhPeXXHE7ldLNNph6cRIeDh2dJzGOWtRNN4slng8HYRDRwpFNSOiMgFCTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9V7CC/C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9V7CC/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB351F000FF;
	Sun, 20 Sep 2026 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789928718;
	bh=HyOsQWlx9wOPikLvlGoUZKXFqWOe7s/HotIfPZuLNMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9V7CC/CwGt//6juokjMbcKK8cPY1+gZVqM8m/L1Mq2QIvJFTCOZSlnLgr7EqiWYq
	 h7iTOKd7ZyYiWgfBXFslK1xIkQOatthzOr9a4yihBOgHWkFIs/ylj67pAXdxjdHmGp
	 xMnAG3e4ml8I0+RP9w8+lycYvpcophCNKOpzABtLqXMdESh2oERd7yjSi8y5ssa5p2
	 DHcqu3qykSeteXL7fsJGI3GPcelUqY0n068pQv2Hetp6T5uEGSiSrCGktGjcltZ68n
	 xVIDK+czfKPD916PNCfkDcPYVgJKEDjCg/kkIIv0Ege79AHlVNLVu1n2aBEPX8BhBW
	 CLt9xrcO5c/pA==
Date: Sun, 20 Sep 2026 20:25:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10
 V1.2
Message-ID: <20260920-terrific-resolute-bullmastiff-7e3913@quoll>
References: <20260919134125.59419-1-founder@crepuse.com>
 <20260919134125.59419-2-founder@crepuse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919134125.59419-2-founder@crepuse.com>

On Sat, Sep 19, 2026 at 01:41:31PM +0000, Mizuno Miotsuki wrote:
> Add a board compatible for revision 1.2 of the DFRobot UNIHIKER M10.
> Other PCB revisions are intentionally not covered.
> 
> Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

