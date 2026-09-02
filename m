Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4648F3769EC;
	Wed,  2 Sep 2026 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337921; cv=none; b=RgiZBd7hBiDv4apwQLT5VURVh3G2cUtikJfzXpLdnYXsFst7QW+z/3qW70/NkzgicUtPqCSUVVDnw4+lHqUm3BdDoS7eWIaP6xgUxaUDXZyX7Syf7qFhnmg1Ws2BIk7aq9vbuKVMGMN30viOzZaqJ3Lu7STAkIdGnhAcK7120g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337921; c=relaxed/simple;
	bh=Xx4b1O5+3PJca6oF04vzkrNOv2G9NhfLmnOqetgImUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjOGgMmLPoav4uUzHIg7BHovpLfjXzWmgV8sHvqtH7cA7T3evEq0h1I9ON2WWl937LvMETfvg0B8f3/iubrzJI0IW2dCglLEIe3E6lZmfd9GNARKDK4gmbAmnx0A6dWL0gsNYyjc/HSl1XioIee4mP48AqxcSSWL9WXrjfq8Dso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laV5BRAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laV5BRAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177DF1F000E9;
	Wed,  2 Sep 2026 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337919;
	bh=T9ZeE0QirpKgRV9SeRBgkpSXIWcYubZd5IIxv6IS8j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=laV5BRAu/DmrwvRGKyDQv+QGUMHyNrZ02642iUfk3zRlTSdvtuk5BfxAWneFTSoJm
	 5+NSPxJZrYr1V+uqk/967KS+FxpbamxfiOcUFnd3VBjaHZ/jdkacoNs3UTGhURIM5O
	 ugDduvlI5D7DB261AKAjDXqbSLSmm9feDToKJfr3KH2wsOr6k4atVNcKXWaM8F7pJz
	 4TKRyAmcclZ5zi3GVdIjzwyPQO0HE6Yc6hLH+/eCj1iWt2FLqKwiPk73x7ARSRzh+2
	 waXvuRs55afUvFbFV3Mi0lO9qD80pUhgmXnW6Rwif6dA4i6F3G+5ZYdRShC4ebo5Ic
	 pZno37jntPdBg==
Date: Wed, 2 Sep 2026 10:31:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
Message-ID: <20260902-artichoke-gopher-of-serenity-85d259@quoll>
References: <20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org>
 <20260831-phy-qcom-snps-femto-v2-8255-v2-1-dc6197ffde1b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-phy-qcom-snps-femto-v2-8255-v2-1-dc6197ffde1b@kernel.org>

On Mon, Aug 31, 2026 at 11:31:21AM +0200, Mattijs Korpershoek wrote:
> SA8255p platform abstracts resources such as resets, clocks and
> regulators in firmware. The SCMI firmware exposes multiple protocols to
> control such resources which are identified by protocol_id.
> 
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

