Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D43BB4A;
	Tue, 15 Sep 2026 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500846; cv=none; b=EQh/o7jWlPZfPZ6Mrhd+uHtiirwCPpH7xT+hBcCxHeYoddcQn6HCWb4BbqccT6mFomX1vW1GHoHr5IsDiHcWVSAfO5QIVIyc5WSkKyAxyx17n9jok7DNQQh9YXXuNjjjeNumkSwEkkiLd95LbH/IIzZvNWKS8Vidnyx/+v88WcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500846; c=relaxed/simple;
	bh=M0fn0wDeDj0PYctfUQQ6Zg5NN2QyXOiqYRG6KHup8hY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ix3kfpSgLfLrRFpmB9DzOC9AAy+I71E4ofA4luTIfd06qSmDsu3AdXjGLe8qraS9zasd7ryBmBrF5CwDW3WeWDTU/+/GKdHbAFWaiuVU+baJzeK8Bo0ZCxtHbnGY6FgBMoZHv2q9GcpBMEvcowLvPvzvzwyvS5lcuNwTIDfOOtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6qz05IS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6qz05IS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD041F000FF;
	Tue, 15 Sep 2026 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789500845;
	bh=L71WPmZxDx8wZZPJ5Om9wyHwxrzK8OZGBKGYPFDIuq8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=N6qz05ISzNbqHKxG7rvjtaQSslj++v/BoZ7Q0j8MsuuiM+88E4SzEY+zv5Uff8jZq
	 3zyvRREGfxevKWnjBaT6LCgcFk54wQhh+UBLD8mmrg6TysDAWI/pMHdGRi+aTwdDDW
	 Ga8PIRrk5vx9RTXEZ/KjK6U/R2WPNS2MQ9GPSHcf2gHr/NP5PUZlEaMaBxi6uxlxqC
	 +S814POFlQv7maeE15HF7XbEc37aTW5CEfXcD6H5Oupx33Ge0ulCOLR8t7iDd5TnKW
	 RsOFjguGc+e6+ZsEimsyLLDGuaTYiZg2Xf+21IazwTSB91ehCsl15rXndHPb/LAldf
	 VR2owqU1a6d4A==
Date: Tue, 15 Sep 2026 14:34:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, freedreno@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
Message-Id: <178947727730.1548829.13172666413996021793.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU


On Tue, 15 Sep 2026 17:27:48 +0800, Yongxing Mou wrote:
> Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
> of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
> that powers the rest of the MDSS hardware.
> 
> Describe INT2 GDSC as an additional power domain of the DPU device
> rather than of the whole MDSS, since it only supplies DPU-local
> source pipes. Restrict the schema change to the Kaanapali DPU
> compatible via an if/then, so other platforms sharing
> qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
> existing single power-domain constraint.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml: allOf:0:then:properties:power-domain-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'mmcx'}, {'const': 'int2'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml: allOf:0:then:properties:power-domain-names: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 2
	[{'const': 'mmcx'}, {'const': 'int2'}] is too long
	[{'const': 'mmcx'}, {'const': 'int2'}] is too short
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: display-controller@9801000 (qcom,kaanapali-dpu): power-domains: [[4294967295, 6]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: display-controller@9801000 (qcom,kaanapali-dpu): power-domains: [[4294967295, 6]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: display-controller@9801000 (qcom,kaanapali-dpu): 'power-domain-names' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

