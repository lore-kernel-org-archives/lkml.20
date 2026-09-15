Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C666374E6D;
	Tue, 15 Sep 2026 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457630; cv=none; b=px182ZFk7pyomwCuj6y6JdxUTamZMLwH9ergMe96D3wKFZB7d4AJjqd1O2vUOoWzy/9gd5LrxWeFzyh7tRdWlZTl45ZgcHZ41ySrAqAfqSTS03Upi/r+eFYOHclZUi9v9xpn6dJbESgvwICtGhYpVgR0/XNFoIXhHWozUyuP4dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457630; c=relaxed/simple;
	bh=088kb9nc5A3Gq69SW1czJbSfvuN74/Ty0116Tk+GSrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0EWGqEyIB1f7WdAueq9CsgIACOF4f4JSOr4YL1ZFbA8UjByb3NxMasllSFAEu49vfDE8spGu/+/Mo634zcFKDNCraMla6n75fDiFOmZ8pcMX5ir1uQsJwNJONflIftlfGirsm/WJ02NcrtP+G9hQKOF8tCURiByAbm/AA5yyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVkyQkLM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVkyQkLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADDF1F00893;
	Tue, 15 Sep 2026 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789457629;
	bh=IYrygcN/fKEZ7Dz1Tm1KMKWzP8xVJKijwot8Fek0umo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QVkyQkLML0XYRwSCHDHWRhByNLpehK8nhlmsfS9cA0rzBruiyUEmHKY1RL4XzzCFM
	 PQjp85W/qirqTtrSVi7N4IBFLv84lGMgjx2ULavwNjUssWI4Cg8oT1ylWsZFlufI15
	 oOz6eXa2K604QXpENZwfXfGd3qBGsR/OX9Xu3MiK/HTwErwTWx/Of9Ewkvu9k2IAu+
	 PwkmxzSsjDoYj4nwD29Co2r8aUscWJGl8AknRTS5bCoi6CRhx6u4sc8639mlAgAQPh
	 YEQw1tFQyUSmvoOagCgkt5FNmZN1VEVv8GIOH4/n9EoXpMagdOdl5PqJ5XzYIG/wYc
	 ZFuqQFn6irrmA==
Date: Tue, 15 Sep 2026 09:33:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: media: qcom,maili-iris: Add maili video
 codec binding
Message-ID: <20260915-brass-fossa-from-pluto-858e2b@quoll>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
 <20260914-add_iris_for_maili-v1-2-09df2b54c317@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-add_iris_for_maili-v1-2-09df2b54c317@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 09:00:25PM +0800, Wangao Wang wrote:
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> +

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> +description:
> +  The Iris video processing unit on Qualcomm Maili SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,maili-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 8
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: iface1
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +      - const: vcodec_bse

bse? What does vcodec stand for? Isn't Iris a vcodec?

> +      - const: vcodec_vpp0

cpp?

> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  power-domains:
> +    maxItems: 5
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +      - const: vpp0
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: bus0
> +      - const: bus1
> +      - const: core
> +      - const: vcodec0_core
> +
> +  iommus:
> +    maxItems: 4
> +
> +  dma-coherent: true
> +
> +  memory-region:
> +    minItems: 1

Why is this flexible?

> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region
> +
> +  operating-points-v2: true

Best regards,
Krzysztof

