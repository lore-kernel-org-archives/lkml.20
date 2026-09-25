Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5EE1DD9AC;
	Fri, 25 Sep 2026 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302007; cv=none; b=HWgGE4xtf80En75Zk2XewmsqllzwYDSq7gdh5DwWS6S21Ddj+qwWMNO8vyjgwqYHeTsTmgxKzYAo9/aHSH/Y0lS9BZB5GqzZ31F2S1WYvzPFOy1baOide1b7gttsKrehDAwG6hN3gzHV9tzYWOpESAQ40ZUAVabrlLw/aTrMz8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302007; c=relaxed/simple;
	bh=Rj8y3NCRMx8S+UueQvwjOWziMwJcD0xSl7wjJrxIUYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qu2p5/1178jo365qnrcJVOXcHWGrljvk1BoNVi9WBA4NtGGnxUwxRZ4bVOCOipmPQPPmIig0Ta8TFjGFsUwI9hzXuQEQ8ojlwdm5XRomyQM/WGZNLAbs3VamwdzLsZs/LatKUdXmQNvigrDHOlwZtcykteu4JYXy8BeUubc4358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlGqJ06E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlGqJ06E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722021F00893;
	Fri, 25 Sep 2026 02:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302005;
	bh=QAcfoC5vPRTcoy7KnzAM1JpySkhErexEmjBytmg+P9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SlGqJ06EnMHa07zJKLq9aivwch5dOeYnXEkvPNjIScF1Ps1YsBuO3VnwbCRnmKALT
	 zMmi51eaVknddfqT9ktq/vf8tWVgZOzvecFKLCpUtWXOGpKPhexFoq55x91DclR83r
	 9QqXdOiiaryHQ0OcnyE2/80y39u35tuR9Qgyg7266QiM6i8AI8bv6rZORaYzKgVjjR
	 Gzb7AMSf7OMBj3SM1AXFNSpFjWvMTPoI4WE8GfHsjoU3Ej/dzg8IgeYx+lvhMJ4Z6M
	 L2V/P8tH7PtNPmDY0WynbousuI8FsW1XsDKX0/RV2Fnh9OPQwbEntiRoW8eXaZTJef
	 uaAZd+y+CNteA==
Date: Thu, 24 Sep 2026 21:06:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: cci: Allow syscon fallback
Message-ID: <179030200273.2924748.18078290960566396129.robh@kernel.org>
References: <20260921232827.3138193-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232827.3138193-1-robh@kernel.org>


On Mon, 21 Sep 2026 18:28:26 -0500, Rob Herring (Arm) wrote:
> Allow ARM CCI-400 slave interface nodes to use a syscon fallback
> compatible. The MT7622 DTS uses the fallback on cci_control2 while
> keeping arm,cci-400-ctrl-if as the primary compatible.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/arm,cci-400.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Applied, thanks!

