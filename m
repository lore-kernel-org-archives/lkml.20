Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBC3A542B;
	Sat, 17 Oct 2026 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259274; cv=none; b=YCCURuiFcAMldu2Y6y335zCqgVuTd7rosm4nfHs53VHrz/HGr0AIYV2AoJ4xmho8wEGIsK5QBOn+jr8E+QGUyV/haRaT1/S9KF3iTXbRx/h4d9vR348/s049BR6K/el2Ux+WT+HMuqqO4aRv6xOckDoGTrd0Kwxnt+crop0hb8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259274; c=relaxed/simple;
	bh=sWSdK0WDJl2hDQpnLIMN9FslhGhwXYHe4md7O9vr+v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiGEkUzE9VTg3C1YIPutmiHVpOkfiYzxlRerHSQaZwMtzk4S3kJoyzuUdKrBUM+HSf9JolKD7MB/TrBi3BCQOaYdBsGdbftdNfMrIaAbWjxoW9KBhe3RNhfv0gGqXWbxGonfiKeryrI9MwJGq2ZP/MR7Rg2bv8LqiqhoBETPXVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGv3iQNt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGv3iQNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F1C1F000C4;
	Sat, 17 Oct 2026 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259273;
	bh=Y6wxuefu0HGgZzpl2asEyZMD0ztQpYnD4de3W/AFpWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AGv3iQNt7FUTHSsqJfqKTVAnVEHdNhpjoiq8FkaAz/62FZELr0jWeO5/qcFtMjENn
	 rFb1s7xF+gHfiXJANG2cSyWe3RKiBhm0b2qRIhM4x9TMpXTP47F1/DELrCJbfNEU/s
	 WpddNqtwJ8nqH82txBFhsAkIpDBXHjVpzDe/N/hXffIxcnAsNbM9ccrT9t8i+q/ahS
	 JtrPk89M2IrzsVyfc0Oc+fwwIuoRCWuZzHqFuYiNn2imvFhj/9ukCIWXFYVWs58QUE
	 lnnBJ1dR33Wv/dfN6+lBW2OptCyJY0AQHhp7oRGFnJ+IHmvmZ+LpdDW/FD8AfoAptt
	 zpiYKn/exylOA==
Date: Sat, 17 Oct 2026 19:47:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: msm: Document Adreno 620 and
 its GMU
Message-ID: <20261017-discreet-rugged-carp-f4cf39@quoll>
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
 <20261016-adreno-a620-v1-1-4a7ed6210d7d@brar.si>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-adreno-a620-v1-1-4a7ed6210d7d@brar.si>

On Fri, Oct 16, 2026 at 06:23:11PM +0530, Ishu Brar wrote:
> Add the Adreno 620 found in the Qualcomm SM7250 and its GMU. The GMU
> has the same registers, clocks, interrupts and power domains as the
> 650.2 one. As on the other A6xx parts, the GPU clocks are defined in
> the GMU node, so the GPU node has none.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 2 ++
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
>  2 files changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

