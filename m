Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0104A263C;
	Fri,  9 Oct 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542813; cv=none; b=dLvebTD88OYl58Wa8s0WWZPDM4maY2Is+MHmsUtq63ZYi4/IAfSltFBUrQZEsYbAKBoYiAtO2Z9J7fFSdFpvZcHeoSFY/CFCYEUBzlPkXYBXapTRm70RyqjlHbvZVAsLf43voJzKYYoEkxsq4/ipcX1GFvKhsa76Nt0c/h/TQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542813; c=relaxed/simple;
	bh=geEj6oUy9oWTxU63O8lyQlV+RgiZcSHq7Pv08J/4QLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGERs8sWjgHVmacyhvtfFS69ogeA+ZaK+6YZadsjZidIlEitxGl7VYpRk4r00CUeGjqmZwrXdJXEyE9bZdosQGW5D0xllAZYVFV3LRspMt5qjr2cq7jZII19phGn7KmbI41JakC5iyGfehXK52ur12j5RJL9cejaEsxay2qVhBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuz5Tvlb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuz5Tvlb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9C61F000FF;
	Fri,  9 Oct 2026 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791542809;
	bh=D4VZ9Ff8LBrsg/53hzMoxps71appB2WZY3xaRMhG9vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fuz5Tvlb8UTBEbjKN1/rBTvcPNVx4RzadYQqWpdSlGVN/l0m9k78cqKj5z2LQ6mIA
	 CZIURwN1mP3gSrs9Gbo1Yh7/MQzXUnfZ7jx9ZlrF64SBzFVuWUl7FewDrsLcNoj9HK
	 xyS5qNkOZ2BSVtibc80+0Ttj+vfOFIF3HTmHNeofAN7DR0cAly/QWqDjmEQyQ6soFU
	 k2m3ngcCQkFzw9Le9i6bkOZdanVJeEzlj1GqUYpto4BjkfMONiHeGBWIbpkmJMmpDJ
	 Tiy/8aXgPx+f4c00u6PpIRqJAUYrwdwF6w12Zy8QIaRYz3q6zOsGv74K51pM0/x0Hk
	 bASXNR86Yd+gg==
Date: Fri, 9 Oct 2026 12:46:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document Adreno 753 GPU/GMU
Message-ID: <20261009-loud-calm-collie-b57e25@quoll>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-2-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-nord-gpu1-v1-2-a06a6c57bde7@oss.qualcomm.com>

On Fri, Oct 09, 2026 at 02:36:36AM +0530, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to the
> A7xx Gen3 family. It is very similar to A750 and has the same register
> layout.
> 
> Document the qcom,adreno-43051701 GPU compatible and add a separate
> constraint block for the qcom,adreno-gmu-753.1 GMU describing its
> registers and clocks.
> 
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 33 ++++++++++++++++++++++
>  .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
>  2 files changed, 34 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

