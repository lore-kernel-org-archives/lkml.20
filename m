Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ABC4C9E13;
	Mon, 21 Sep 2026 17:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013027; cv=none; b=LpK+6cba4mwfeGIEHZfFVXvMQeP+FMwFGSaprc12A+emX1liAA76NGQLQiwyM1jRmHo3l63gJcUDnwS71BNkSjZm/5FmFMLlL0W3+DgyFzF/1ovV5VvicS2Crya2dQDxTAhqmzKSjP8gBI1SwcdWojcBaRflmt+OcFJI0Ql64WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013027; c=relaxed/simple;
	bh=zv9+IM1nkDhJZKWTYE6MoczP8torGbhtT+W/OGBz3fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaCn42OaIM/9G/S5aI40YlhiPCZpudKS5OerlybEiqVmgCS8WujEL5LTXweZKEmU3BkMma53x/tdzcYRuB7r+2ts7Q2XqXHx8VqqjbXYCgPWcjsE05PppgLABYQz/Pd7z22EC3ta1UW1MySHje5PXyK88nyp+D6xPEnbbnEbI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBpzUZN7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBpzUZN7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371171F000FF;
	Mon, 21 Sep 2026 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790013026;
	bh=DdVJRtwgnD+M+9vdvF7iO9rluJxy9K38LfMx/0iiTzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HBpzUZN76BzwmpKSlLhXFSjiXiaWJCBMla1I7pmOVNg69rNVYg9SWn2DX+KI13BfH
	 ujbuJVFUBgmkXSyGbUvecio5EyPqK+0YBAqCi9IAacKpcsjR7Ct7rFnuKIST5Nv3TY
	 8Q0IGjuw8MEaDdGfTS/nGswa8K79It2XumBT+oFA2d14ZZKz60saEA5fAukpGQqJ62
	 wfHn8tbi5nK7fzOvGU510AW6+FtAGB3UqqXUMkOze3Ph2uUfKLURcIj3LBCNmybe8p
	 wwsW9HkWP89c+Bk0apdbXFwKu1ur4ss+6odjBuQMvQD0zRS5DD8rNYafgC9SNBD4Cc
	 zUei97DHnl/tA==
Date: Mon, 21 Sep 2026 12:50:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Mosberger <davidm@egauge.net>, Peng Fan <peng.fan@nxp.com>,
	Alexey Charkov <alchark@flipper.net>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
	Roger Quadros <rogerq@kernel.org>, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH] dt-bindings: usb: Use consistent indentation in the
 example
Message-ID: <179001302419.1076243.10882515734847470478.robh@kernel.org>
References: <20260913123243.100040-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123243.100040-2-krzysztof.kozlowski@oss.qualcomm.com>


On Sun, 13 Sep 2026 14:32:44 +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +-
>  .../bindings/usb/corechips,sl6341.yaml        | 20 +++++++-------
>  .../bindings/usb/maxim,max3421.yaml           | 12 ++++-----
>  .../devicetree/bindings/usb/nxp,ptn5110.yaml  |  8 +++---
>  .../bindings/usb/realtek,rts5411.yaml         |  2 +-
>  .../devicetree/bindings/usb/ti,j721e-usb.yaml | 26 +++++++++----------
>  .../devicetree/bindings/usb/ti,usb8041.yaml   |  4 +--
>  7 files changed, 37 insertions(+), 37 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

