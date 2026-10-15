Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CF361951;
	Thu, 15 Oct 2026 03:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034324; cv=none; b=Yr7uVLuU+x60U+q9bisGX2hyS+7RSpEp01PsHoc4wXn0n8oZqh9yhkLinpaqQ7RCGeWEU9IC7IeL/EC36GbXge0xbV7dhFJDIEUJInbYra96Nv4yFMoVicNLUoUpsPcAmXeeAb3L49HkOsWmREd07T4c1MBFZHcL4ClTmPTCQ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034324; c=relaxed/simple;
	bh=RB0sdbyHzCsEbggSTL90d2N0cBjmR5w6aC6usqjhAkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmNA/7r8e2N0mO+Ts6Q6RljQPlTdTV8LlGUJZM4Jd5njT5u1kWdxhuE6sq0rWIAUNMv7WpprBsOKfK0lyAVThGQ4+bxqUOj9Whya1Sd78hfZ1jPodHSfVOeI1iYqneNP3rcQ4mdm3ZCIZDivqhF1wqslmwvq8t9XowGoAWIOY78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+hsN4rf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+hsN4rf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574F81F000C4;
	Thu, 15 Oct 2026 03:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034323;
	bh=LZVKc+6caUVGXbWmRc1BGSQfMdjPJx/u92KKue/4L+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X+hsN4rfXNmoAQmupZ/clTtVexjoColeGoBqluGDTY/1vJrm6Q+SdPegWKXoJ+qI9
	 lwbLBrS4lOGW+UmM0b9qUC2fhQp/IooyzkgpvF35/zhi55AA4FIHf5uy8d5dxwproA
	 xAcHffsezLSL/m1FgaIojlaJZSpE1G0TNANxyLhKhKyslJiENS9KInB5yjlbGg8YKI
	 ZuQH/VJEf9wemaRJr3xGU22mS+7hb86zw0fqNMwAnGlPQMqT6JwTnqoGqCmgl1C6uO
	 4qYTZHF19KvEkxuio7+QZNeXa0EZ656YJNZCb51kwv2QBBbUJokLWmJd1aRoEzEnkz
	 QA9LBGHbAew1w==
Date: Wed, 14 Oct 2026 22:18:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Ambarella
Message-ID: <179203431954.413357.2319787463189639286.robh@kernel.org>
References: <20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com>


On Wed, 14 Oct 2026 01:46:00 +0800, Long Zhao wrote:
> Document the Ambarella, Inc. vendor prefix so Ambarella DT bindings
> can be applied without waiting for the SoC series.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Long Zhao <longzhao@ambarella.com>
> Cc: Long Zhao <zl020895@163.com>
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

