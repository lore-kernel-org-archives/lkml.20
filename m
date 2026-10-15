Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200C635DA47;
	Thu, 15 Oct 2026 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035272; cv=none; b=QROvHABWRmNH1oZc1Re1RkHqjWYXvfpOQkWDLN37OFem6FTailFaMw0Eib/4w2e5FBxhikzcNIO1aOaDCeoEjuCgQeuXBoLMsDtKRsqxDhDOCfFECoYRosKaSk870JagL0Ev6XDW1VjgF5ObFhUOBh4/z30DnW6oX30rhBYFj6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035272; c=relaxed/simple;
	bh=NPXoHdl83YNdJghIkMd+7alkLCqLwsJm38ON+wtt+BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VShoZv6H4OlDvLoDdlwoNY3t1yF+mC4m1/DlV0i8MwhrwU2r3bOBFr7UuyegYG4GV7ANtfgQ1KA0QFtHbiE9ScOPJoW1qV+9oUflCp6zGmfhZDD2L6AkiQ1HX7chpc7qorkj2wFPlCgCfuZkl+zt6pkuQprvWMwjlwl7kgvQ6gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J69FCf6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J69FCf6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6602D1F000C4;
	Thu, 15 Oct 2026 03:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792035270;
	bh=mLZvjkQ5wbLsImtUSoNNbcwXqxUYYu3z6bQHkKbMyKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J69FCf6s/lMXzhw1fZECBVybwxZCiYRHOVKZyDkhdFgd7SDivy6+hq64KfJb7aQRS
	 wj3au+LRaUaCokao2X7HEJVzP+BHeD/sADO7QXK7qphQIh7nN9KxSLuziliRrU0/uy
	 PrZsJXx6kVT0/RsfrEpp0XFwhgQKH/3/19PCHm8y0UV/qhGv1pVWnLWQq0QyScsXb2
	 SGBh5uGOTwPdhnlLWXhb97TfB8Tkk3PdcD1q7pz1W8aYm/4H/p+YtpTj8CjYngLDs/
	 B4BymwQzrmbRe+fE+ilWlpceKmQ5p3yT9qhSBdPOlMOVWkV9VOnSdo3I+Am9kPyzYQ
	 Vw6fDfJ8fdojw==
Date: Wed, 14 Oct 2026 22:34:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v9 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Message-ID: <179203526747.529061.2803933772293996844.robh@kernel.org>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-1-f3022e28f2fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-1-f3022e28f2fd@oss.qualcomm.com>


On Tue, 13 Oct 2026 11:21:24 +0530, Harendra Gautam wrote:
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
> 
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,shikra-qaif-cpu.yaml       | 290 +++++++++++++++++++++
>  1 file changed, 290 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

