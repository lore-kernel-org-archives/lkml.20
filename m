Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6826B742;
	Fri, 28 Aug 2026 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908428; cv=none; b=jpsY28P6NK2nAL5s3QqSchuNbfcWWau+of3JFYnWochNcXeh6msI2fJgWpIRcNtI1zv2Z2QJax72goKAo5TDVheOc3cPQ5WVEDPtvtDN0wX+00Db7Dic9RpZ1alvUYllKxQ6D7Tqo76VenB7cNDcBoGcxvBDRxmoMcNwbxAcSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908428; c=relaxed/simple;
	bh=7vqB5kVCtlgGODPknu1efKSqxOo5/8MQttYHRS2tvFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t75Ut4c1qh/VBF37OdEtdKFELyxazB9DyHqmg5aUjpynAbzqmDaC4KD4PiHtYvrdyuLY9mzJ6Y4QlvczZ5s1gxArdNcsblD5nXGevlF5JZpr8ryuO9cg9fmF/sxKf2X48NWbtnKqsXyhJF082UxFhkQ4zE+to5Hz41wCYlQndvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSbNOk/M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSbNOk/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC3A1F00A3D;
	Fri, 28 Aug 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787908427;
	bh=7vqB5kVCtlgGODPknu1efKSqxOo5/8MQttYHRS2tvFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BSbNOk/MIr0IH/xOkK7Ij3mfjoZ4sX5NoqRZW6BxD9va/h+OWqGlsaHFGxWXaavdx
	 nUPCl3mZ6/8YJphIM94WEjlrMrI/jysRtQxojDB66jkOl1QNf7l/zmg7RMm5qBTktl
	 LhJXUcDCm1U3I5m0sprYPg65cCJ2I99JUiA73oEpH/bUvWHrwk+H+YJ6v+nt/b7/nE
	 MdRo8hcD/WsmnS1Frrj1GzTmpsxJhu1nmZch+F785y2zE8TNIwezHuUNOp3Pxo8pDg
	 UwnhzkwVazIHURtAa3RDQf9okldqQmCh7DNYEQPMj6IGSE5TaSjt+100EMC97wTbzl
	 QOiNHEbbFDrRQ==
Date: Fri, 28 Aug 2026 11:13:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 3/9] dt-bindings: usb: generic-ehci: Document
 access-controllers property
Message-ID: <20260828-puzzling-shapeless-gaur-f0d737@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-4-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-4-marex@nabladev.com>

On Sat, Aug 22, 2026 at 09:46:36AM +0200, Marek Vasut wrote:
> Document the access-controllers for EHCI USB controllers in case
> access checks need to be performed to use them.

Please mention in the commit msg which compatible/device from this
schema actually uses such access controllers. I see your work is for
STM, but there is no STM compatible in generic-ehci/ohci.

Also, please send USB patches separately from DTS and other subsystems,
because Greg takes entire set.

Best regards,
Krzysztof

