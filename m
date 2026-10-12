Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FFD3BFAEA;
	Mon, 12 Oct 2026 06:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787408; cv=none; b=cE+tu52YdJQh3Xryr8TCccmmKdvTHjU7CTqIlB/rNjopFKnKFAeGoGEotNc7g0heeEzBKMqnQ/C+4B5NbiWpUFpW/tED3kJiHGojYnkn5RO3zqON1Tub61O5qZ3Ipg+sKMUJ9MulTgv44Gy7N1wpodSHuUYfAqoWMaPj6wtiJr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787408; c=relaxed/simple;
	bh=9RM345X0RD6b9EwL7lpb6nYtbMPbSbkw+UseM4ftYrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9IvXasuiCJyhcSioy3UNnSv/FK5rXkym57DYuDivLJ6Hsatn5FK2c78DmqPK/GGbKpJR0OBxjw0WDg4VZpkaSngZQFKb6zOqGBYVPMBVND2Hwr1Er9JEVNVjpF4RWknmIDSQeL6Vbil7GYp5XRj88zS+4ncWSKHjJ63rHZ3lPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPlEDgfr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPlEDgfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940931F0089B;
	Mon, 12 Oct 2026 06:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791787407;
	bh=TyV2Bq43Wm2rxT+bE3tLJ32jLGwD2lcUogYKBq5cy/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XPlEDgfrGsawaCitpHCKcfoiGlP7rKo81yQcvdQfpYzFZNdj7ko5+T/GJKwG2i8qF
	 i8LbUS1pNSmP6xRSZBZGkHD807B0T2qgXLxk5km7LuC+6axQ0O/X9T0GX/N1PfBOzV
	 GW/WoFKhJ5KvIkXbb6zUDpQw1FCs25qXRjoXjlINNL5FWYa2KhlT3jdhbrBe4K+xL3
	 ossYs4IQnsR15l1F3pH6pLuFmfMhntlptxRcGcQQpAdBXuOIbI8LXaBphhnnNX0Tyd
	 m7czfXKv6BiIHjFH76RuMB4DVwZPmwm82USl6oU3An7nwnm8GaAB3Z1DHZLBOI0twz
	 G/n/h+SPzQTnA==
Date: Mon, 12 Oct 2026 08:43:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix
 for Teclast
Message-ID: <20261012-worthy-terrific-sunfish-3acbab@quoll>
References: <20261001022415.913959-1-iuncuim@gmail.com>
 <20261001022415.913959-2-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001022415.913959-2-iuncuim@gmail.com>

On Thu, Oct 01, 2026 at 10:24:12AM +0800, Mikhail Kalashnikov wrote:
> Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
> so that board compatible strings can use it.
> 
> Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

