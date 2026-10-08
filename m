Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F33C0606;
	Thu,  8 Oct 2026 20:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490283; cv=none; b=NAXR6sy9CSJVL90VZD4DIt8ldBeTWyhLIhRF9egiNYj3St68GKtfmh+7Xo0lSA+5ZJXZFcBmjCIlgD7cUQYFbo1rAITJJy2nCBJoM28vAghEjjkHfulxG4MQtyDuIDUyW0HZ95Qex4ymHGeDuSVxgSuFmxs/uMOKpMmfvhpirms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490283; c=relaxed/simple;
	bh=Fqac6B6i0wOrRaOqzkGSdcQjoypumpHGRuH+WAF10J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6ESW2q6FkuF1uOuej8ExdFO1gpcs+rauoSVuaHDdeIEhJUyeaF2Y3kZFhCUGsm3ffUrP+Z+IZIgnkJZ+RNcq7Rt0IG8Zh+VBWhGacTCR5WE//XNI3LjtBzoilOvVTo6DGq3VX0QcvNp/l1eEugvR/I/74I2pbNT4T0gim08gso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cC49oUNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC49oUNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7631F000FF;
	Thu,  8 Oct 2026 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791490282;
	bh=Io0VdTzspOUoQfmXiS6pO+3XlynAY1HrDJDwAjTi+Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cC49oUNf+J5PrD+quAF7zq+i8lJrcNqZTViFFWBMyp4Qsgi5PmKXIGn007XN6nuFk
	 YWmksK85DaJWUfOc8GgbAYSOTbHvJ448qz5fMTK3elE9k7ZPFMGED31GsBL58KPNut
	 gPZaoq6ta6TX9rmO51UOvSKOvmDuqsXv+RCcO+59/7z+MiHz4UvFinj/hLq9oe2FVv
	 9QvrgUV4st+kqyfz/Dp/wr01MAUaDRBL1JvBF0vWJ8fE+Ifm5KialNmvTWfpRU0EYF
	 IF3XBI0VimagcNcTOYx5c1CkZHMNWNaZjxWROjapPbU5KwR9Yl7deOolwZ17Qwg+XD
	 FABUhxrW1ny/Q==
Date: Thu, 8 Oct 2026 15:11:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and
 mboxes constraints
Message-ID: <179149027928.982727.4439836373000201333.robh@kernel.org>
References: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>


On Fri, 02 Oct 2026 08:30:12 +0200, Krzysztof Kozlowski wrote:
> minItems does not impose any limit on actual maximum number of items in
> a list, thus it needs maxItems.  maxItems on the other hand does imply
> minItems.  Add missing upper bound on 'reg' and 'mboxes'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

