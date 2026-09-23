Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B741D21F;
	Wed, 23 Sep 2026 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165533; cv=none; b=i/OEp6RhqDY9K3S/idf2lelLlbgWfMuXi/MbCtfTszygAMhGKEV2DJmgmzR5+HQkbXv32trcCvZi7PbyDlaJCAGYrH2/1LSuBv+A9lqnNM3Be8RzOhFB9jyAyKMkHk/6GG9Nz99ON4jdppN0fP8kE/Do1D/Vg5pd5TwIgFn5ATs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165533; c=relaxed/simple;
	bh=CYG/0fYzKV8qzJuIlZfqkOK9j7caVkqzNOakMxaoICE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=URG2Xbc0yPtfTRNGFjicnMnV49nd+cAfEpISL0mQ1rh7js+LnmQD/GoMw8tYksIlZak2W1IO5V+ehQgYL8mAXsWFn1gxvrlqC1X8Y/1x1mYmgvr3qW+wPryhE/kTW1HtHo5exeRuV9hQk/n3XgkVpNAE7CEKa7HplOlshBOTgyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqKlbvkV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqKlbvkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EE31F000FF;
	Wed, 23 Sep 2026 12:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165529;
	bh=Ng4E0mEDl3duqEGvV4q0LHbIsFM1nGnhyPheGKd2WB4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=lqKlbvkVtXgY9mbmV0jwc4tUURq1Hb2FXPTBeigYd8NBcgnRi97xTLGHxsjD0E7p6
	 GsfoKczYXezM/4XsJzUmg5rjn7XisSPODyBfSAK/bPWxScR3IzSU6e3kA4/RkIxYk9
	 BqTVHzBTcL8cTDNnIlMSdRznrGtk1g8KIQeRbPlXLhA0LZMo6uiSV9TaEdEeopxUdX
	 dFhH1N83+w0HRQ8ggc3zrBUkRTHWJNuGgorAUxfG2rigZ3linfeaqEHg+6M++ocZH3
	 2C6voQFw+JdV/X5aagtuTnXMza+KsZmkhfz3ho0DVkLuH1tV3jh2Rxj576rVX+bRmf
	 UHbaWExJQbxwg==
Date: Wed, 23 Sep 2026 07:12:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-1-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
 <20260923-add_iris_for_maili-v2-1-7223738e330d@oss.qualcomm.com>
Message-Id: <179016528390.6797.14062203016834624867.robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits


On Wed, 23 Sep 2026 10:41:11 +0800, Wangao Wang wrote:
> Upcoming Soc's Iris4/5 video codec requires more clocks, power domain
> entries and IOMMU mappings than the current limits allow. Relax the
> common schema constraints to accommodate it.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,sm8550-iris.example.dtb: video-codec@aa00000 (qcom,sm8550-iris): non-pixel:iommu-ranges: [[629145600, 3128950784]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
Documentation/devicetree/bindings/media/qcom,sm8550-iris.example.dtb: video-codec@aa00000 (qcom,sm8550-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'non-pixel', 'pixel' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
Documentation/devicetree/bindings/media/qcom,sm8750-iris.example.dtb: video-codec@aa00000 (qcom,sm8750-iris): non-pixel:iommu-ranges: [[629145600, 3128950784]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml
Documentation/devicetree/bindings/media/qcom,sm8750-iris.example.dtb: video-codec@aa00000 (qcom,sm8750-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'interrupts', 'memory-region', 'non-pixel', 'pixel', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260923-add_iris_for_maili-v2-1-7223738e330d@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

