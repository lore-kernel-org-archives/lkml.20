Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7B51CF58;
	Fri, 18 Sep 2026 18:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756984; cv=none; b=kbqtpO+p2+t9KSQeHkV0itW2wvguEMsdEaa7Gl61fDJRv9ZQ9OMkiUTq9hv3NhAt9KB6YNNg2tr6MxacanCFz4aMGhdbkLoQ5GwlrLSit/zC6AddppLpZqpI9cSdIk0xAKWsQsYyUp4syA/c3LuwGmbwssTLg0f74GZ5iMNK9vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756984; c=relaxed/simple;
	bh=IGGl2On31DIm00pR26QsQ15ce2i/uQ+7sLiscGg7yrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuIBbfKeLUsZCWpi0qU2S8yjpYAKGasFQalTJsXPkIEer43InvW80V1XfDWPsMV5Z/pZV8txUAEhNU8PWPL26QN7+o6vuvufySJEpEF6bHtNNWsG5iyG31vS2NSz06DjZhehEGIZyrLB8dTQNo6ZEhYpkk+iGLenGyJ2J/gUx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWkvT9Ht; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWkvT9Ht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C17F1F000FF;
	Fri, 18 Sep 2026 18:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756977;
	bh=Ij3/p0dhbAUiVjyYTDfkDCSx8NXCa/WOMpRl+VoVpxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWkvT9Htb1/VrVpaMsiU4UOOK0PQWV5wnQX3psqVI9gxTN0+dVXGLEog6wMQXekS4
	 w+is54urG2RnpZ6bWzR9KBvS3VMmVwy4iyps7T6AOdQhTUebNcT92lJ6QZg5n18OIl
	 oV/IiOuzYTvqzIYDXASXEZB4Yf1FvSQTsqxjxsJ325i1BAvjI4vmxHncoW3Ksdl4jI
	 cq70e3N99vvoo8Cl79VA7ld9J4ODbVbdSKJ9SwS60/BmmIWxtkA/M7KcilFDKygsjW
	 YoHyFjGYrsUynpzgfJRlHVQXr3IVnw38Lr1sOndN/RO1ccsUA4TDw6IX+/gWb1x9nc
	 yBH6IFHFcb+mA==
Date: Fri, 18 Sep 2026 13:42:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simeon Marijon <simeon.marijon@foss.st.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: add binding for STM32MPX TAMP
 backup registers
Message-ID: <178975697493.1358225.12539962963666785405.robh@kernel.org>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
 <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>


On Thu, 10 Sep 2026 16:11:22 +0200, Patrice Chotard wrote:
> From: Simeon Marijon <simeon.marijon@foss.st.com>
> 
> Adds the binding documentation for TAMP backup registers.
> The backup registers is a part of the TAMP device of STM32 MPU.
> 
> Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/nvmem/st,stm32-tamp-nvram.yaml        | 57 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 64 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

