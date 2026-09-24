Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB834825B9;
	Thu, 24 Sep 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255752; cv=none; b=tXwMvSIyt0XCfzLLz7EqcY9U/hFGGYDDM8ap4f/l4V8KvVeoQ4q5hOV+kX/tn7BosFJ1cSS2A8UIi0nqtcInHp/yUoJtRjDGrkrVK3KBE8TnXKixmwZRWAyY1PpiniGOqghL44vrEf9e9aeNDsqyR6DHQ+7Wx04ECzyI/8MfzYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255752; c=relaxed/simple;
	bh=lbrItzVA4bp1fgKgg0QejZBF2JzYbnWSqrdz3LbXqs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXWbPSa5xkjA2y5aper7FGOKdqYLjQv+eB2Yty55HX/AGqfYJPqnEjIfEwlIV3mPQsKNH52L6DlRDZ3PQbsdObfJpXv2/H8u+zXdT0qtN8jLERBDHkcXIv0j2S2PJuqH/0mMDYeuhBYgLEn3bxKikBIgK0g78kKWRp9NEd9yvpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4ydg2YJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4ydg2YJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C96C1F000FF;
	Thu, 24 Sep 2026 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255750;
	bh=hMidZAi/lkVTYdE4CaWIwRpCbA7uNkOiClBSJMQKjbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h4ydg2YJoRFeMuS1nHBcEzHcYbknpqacxVnxqqGZm+gINrHzxk4X9IAEAK5GGYScG
	 JHkpTgleM376u/iC9M714sJeuedOnIzFubzF8W6yhEMZ+OKFmtPVpXsAUcdM6MGL+v
	 eVJcINuBcp816bJhfOVDo/Bl36+3Mpz3dBRlL4ucJdcX7nYfVGhToAuz2b3vneq6r5
	 DH7+WHVy7FVHanWgJjLUzG4aePGwtmC66fj+eDecVdsdVkL7nyhyIvRympFXzHgDIt
	 r/47Zaf4H9VCxAF65nmGmneJkpFjPLYb5TV/IkSGCCsj1qlirNBlMgb6/KkFSzcEKY
	 392RPHFezEKZA==
Date: Thu, 24 Sep 2026 15:15:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Message-ID: <20260924-great-aloof-pheasant-cdac27@quoll>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
 <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>

On Mon, Sep 21, 2026 at 02:26:42AM +0200, Nicolo Giuliani wrote:
> The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
> separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
> SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
> PCIe. It serves the front panel ports through a Marvell 88E6193X switch.
> 
> Document the compatible string of the NPU board, with the CN9130 SoC
> compatibles as fallbacks.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> ---
>  Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 7 +++++++
> 1 file changed, 7 insertions(+)
> 

I don't know which fallbacks are right, why cn9130 sometimes has,
sometimes does not, I guess Marvell maintainers will sort it out:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

