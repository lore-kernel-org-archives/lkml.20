Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801315;
	b=PBxj05w97k3e5LqQR/6nU07j35hoFILEdHM32zM2BVAS8sleCVC38eortamBmYhkz/pR
	 B6XOBaVf1Y8P4e7fL+YzJ1EkSO5uGq0Et6BbWWoD6ufZqp8c/q4aIMV+ykxnDiHRevm3M
	 gYq9xTcsb7Bb0Sfv9thucHk7+JruV72I7fgjf0DTzPdOtq9xVr+Lwr+RTMbKwnqf/Gvj4
	 kkuaR/drHIQieDblgFwlglwdeNsI8ULxrSnc0RWIcob5N7Wd8q9iQif/aBnlFc8qy7RQK
	 Q5EfOCxkYeWrK2wNMSCbMqF+VmDcDc/fiBcnRupIbeJQtcu3LIgkuxRWvHjmkBOdmcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801315;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=s6X2gYN7fkTtxsBcmhfLRe2w6HM2vKpv8k1R0jXNwjU=;
	b=O0fotPn7mQsQ+JnhNNRxwhfJNgs12a8zckzpBmHeUTgearbn0bt2U0oi0Gh/OQmKlXZV
	 5nkW8zCDnQqba+9+SGv12OtMKLskSMJEfHpaUqSBkPiKhBYpQNMEtoqyNpRNHrvitRvL8
	 KBR0ukosayXa6sUh01I2FsizpxHwjyoXdMqwQA6CvTTXQ4HcUvEHAgXTGqHfcuA3FwHQh
	 strQs6BSOM1AomsAyXFdW9Q8XO5uWTPMW2lNwVzGPxE7shfUH0rf19YihcwgjZc3uHa0S
	 aPaywtHeDjt+A6LunTQE6Xxx86UtqWL96kyrnM+3VbLrOCj4McI9aBKEKPar7OEaSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONXl4iDR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2A0606A32C;
	Wed,  4 Nov 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONXl4iDR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5261F00919;
	Wed,  4 Nov 2026 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801314;
	bh=s6X2gYN7fkTtxsBcmhfLRe2w6HM2vKpv8k1R0jXNwjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ONXl4iDRXEBp71XgwO/J/f6bQy6nlJqupV/W9bk3s8uYOyPLUrAVQshBXJ5D7Bw+h
	 K/JT7oyU2YuHqH8cPtcQeISCxN0r1ZUd9SC0YiO244jyYwG02a8iZL/ZUuhPKVhlsG
	 QCF0O2Djjf2ZtLnBwOn0m1t9pillIzeVLt3dfnwXMwUB+tmlOMUnzr865/RzsWdlon
	 UxRLkJKfZx42J5D03EDHVh0zpTkoh2585WIsQsopd9rRQ4PBUH9dNUCTTOTjlqGv66
	 1K2iijMfxKAQ77/YMl+F+4UbLG6gTAUifoOv9zRg/a2lmPSPKP8W+G66aOOzaQcGeQ
	 qaYdkYKhWKvnQ==
Date: Wed, 4 Nov 2026 15:08:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
Message-ID: <20261104-rebel-kind-rook-abaab1@quoll>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-2-vamshigajjela@google.com>
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
In-Reply-To: <20261103042608.387626-2-vamshigajjela@google.com>

On Tue, Nov 03, 2026 at 09:56:05AM +0530, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
> Limited.

There are multiple smartdv companies with different domains, so I guess
you want smartdv-ips? Or maybe all companies are the same?

Best regards,
Krzysztof

