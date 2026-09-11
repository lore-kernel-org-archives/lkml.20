Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726F03EFFC3;
	Fri, 11 Sep 2026 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115810; cv=none; b=aAFNZPQMgv4a00sgLDJ4ToceGLHdxXWc2Nl8/4sJHc8qp/2oEWXCLlhaQCarykr3A50y0DFBc/65kEyiGrZkbUfJEuY9Ip4F37d8EdR3TWnyl7n846o5EMqy71VrIpsmXebgwv9M9Z5U22Fr7Sf0S9tKd6GsG2zGPFgTGPNzEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115810; c=relaxed/simple;
	bh=ac/UXho56Q3YaxpXmd7TM5v7erW4vLhYjTAzIga1LFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebBUtwfFawqNIEONJACmahBKMrFb/xuO7SwO+WmbktBUbKNrhEGNw/FPtEy1UfGtgjoIL+IvhBH+SfFsH2/+38Vw+fWv3ar2mdCdeYVb26ejwi6hxn/lz00EPB15m9WricBNQgiePtQGdJCNUEm3bvhtlWBW96TGy27ADShonk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXabYVkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXabYVkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9201F000FF;
	Fri, 11 Sep 2026 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789115807;
	bh=vG9ckl+amOULFkJfxIKjmXT0X3mKOQi9U3WoU2ETxVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YXabYVkBhmeVT9S3RYesFSALzQ++YC3ZxyiyvyvMoy0Q4oORdvbsW4n+H9SwNZ8Co
	 rpSUaJ6EcPCjA7CUuvJ1XHB9gUR67QyET/3Qpdo9PPW9bBhok87brrIGUvP/dS5+Cd
	 cwuAYRNcUzzhXHv0pziM6Jnr/Ckq9PG+Ojyc9zq75EPoQ/9c4IAl/lg/LhDU1E4dBK
	 XERqzbpEvKh9Nil9IOC7Vosaci1P56cc1+b80DDkhckiy7bRrrYEqt1rnMmX7P3p2i
	 Jsjfdj4VIB/8gGfHP9TTwh21gFGIDD4exqA2e4EGe9WPNcxd2BMcfPIsrAUwE035fu
	 PtrBApivYFsNw==
Date: Fri, 11 Sep 2026 10:36:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Rao Mandadapu <quic_srivasam@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soundwire: qcom: add
 qcom,shikra-soundwire compatible
Message-ID: <20260911-pastel-quixotic-hedgehog-a2ae2b@quoll>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
 <20260910-shikra_soundwire_support-v2-1-f98c9a6ea1e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-shikra_soundwire_support-v2-1-f98c9a6ea1e1@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 11:50:14AM +0530, Mohammad Rafi Shaik wrote:
> Add qcom,shikra-soundwire as a standalone compatible for the Shikra SoC
> SoundWire controller.
> 
> On Shikra SoC, the SoundWire controller is assigned to an Execution
> Environment (EE), which determines which banked register window must be
> used for interrupt, FIFO, and status register access on SoundWire v2.0
> and later hardware.
> 
> Add a dedicated qcom,shikra-soundwire compatible so the driver can select
> the correct register layout for Shikra at probe time.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

