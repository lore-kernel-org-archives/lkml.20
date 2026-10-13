Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D18A3AFCE4;
	Tue, 13 Oct 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881291; cv=none; b=uTgSrvxchiy7hWO2um9GyiTe9xQPNA6q9HkpsB2ReqkETuTBo0j4q5qQD44CM73D6RNntRR3qapdIP3FsGLeegd6kZt5UF8ob9pSarsyncndnAiLHxaneNGJDIvf0s8TMumUzjwuJH9APoTmjd/j5kfh/EvdbFwSD/nMAG2ih58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881291; c=relaxed/simple;
	bh=9nk4ucsQx4frcMM1bkEbGa/sDGCJmR689R2WQ//AXkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KslUfCV0js7hQxA1uDiUtSHruPtekktfIOJcKQ262epO3+mREQ6XCGOT4194D2C9t+gBEF9naXjKiCvAkNh69xzYv7ddKguJSdqc4MFi19PHbYmsc01rlDtb1Plfj/t08D8Zzi8qjVIoXbF2em3Ij//ECHIt/Gz9G0o8xL/Lt/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHbVJfjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHbVJfjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227BF1F000FF;
	Tue, 13 Oct 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791881290;
	bh=F2rK+drwDeSxyN8ny18ofHQWTkBYjp74CzzmzODAL4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SHbVJfjg2bgSFzJly48JojF5qxD+CKOEDXscma8WDUgAjuU1nCfRsleU5yMoZc+Fp
	 P1VczgGgyLA2b4F2VGO9sQTe0615B2JTukdBjFHBcf1rEMsoF30rzuNWLurJfgQQu3
	 d5+RqvRaInR2z47lQ1GuANHAGtqIzi7CHd8/FFIqU9XpcWakUFWNzLlVCM64pJ/Gph
	 dWUXZo0HE0Cyq3Sg0MyGWyEzG2mPfmgLbnkmEtU5bBxnaWslvC5N4NSPKkigXx104+
	 FAMLslp8qB5ATeemLaB7YfFg/kOQUBWNMkSWw1qA+Zwy94AmY1DKyG81YzBjWZZxmk
	 /8+nNJ/xXpCPQ==
Date: Tue, 13 Oct 2026 10:48:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 03/13] dt-bindings: display/msm: Document Nord MDSS
Message-ID: <20261013-vigilant-penguin-of-glory-b2d055@quoll>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-3-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-3-a2ab9af954d2@oss.qualcomm.com>

On Mon, Oct 12, 2026 at 07:02:13PM +0530, Nabige Aala wrote:
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dpu

Where are the bindings for qcom,nord-dpu?

Best regards,
Krzysztof

