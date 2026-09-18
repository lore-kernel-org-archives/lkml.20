Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFA6519907;
	Fri, 18 Sep 2026 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749689; cv=none; b=Ips0DYISfJlFxYC7w6a1R7Doa7NHgVLq8C2hKjq8YdVdz/d5HZFurAGxgYB/up6MIevXy1WgKXAox2UDsgTNZCiJIMgh2DBWmhWqC1vUC8c7XS1FqUsYh/UbS3jL0pHuFyM1Y7avl6BFlQsWBu1CfhFiWr8SMIUT9uS0ZbiHQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749689; c=relaxed/simple;
	bh=nLpGmFvOGhrcVxd42GzwwZGnbPpVwFeU5iBCxwqjFno=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kB1xjfQpJiOCklUf4I/t39pUOL88q38Dr/hByCHn9EjlT2TqRwr9KfcDDdWH6a6lhoQAu3bUoA3B6y2RnN/9eQGwpEsQxW0CYVGthzGy9G9WVM5yT8sEphKnxiSVgGERLAKDhbtZMJTcOYGH14eKyRJyRyILOgLz9BP4YYi0K9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEo0+okI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEo0+okI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411D11F0089E;
	Fri, 18 Sep 2026 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749683;
	bh=DQy8xfZJcmUaC/sKAyK859rqQKwFupUHwsfmyZlgdFc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OEo0+okI5XcqwI7OPvVyb04axh12q/YgirvHHyZhdrOHHlMN3pRThmNJt1gNb82GL
	 bbirWLJom6ekRGcmWqJ0ik1qrR/PSsLegVa1bzJpXPetm0mvqlqNcpufHfZonkJ+FB
	 hZlSi+1q85yngvgIr71qtauAYMTzTT3JKZX2vq6LmV+Hprwd4ERU/iBFufGAq2WOyr
	 rSumUc/kFtT9UO+yLUuYd/NgkG5STHQ1z8JCDxbIDUddMY6Er3Yn4O+4mNNMM0g99g
	 M2idOF6R94a36QilG7HHBbsdLd3ob0JMYPV30520lOXWCMlwbQ46w5a8JRobePsoKP
	 NrD3HWScOx9QA==
Date: Fri, 18 Sep 2026 11:41:22 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-2-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
 <20260918-add_iris_for_hawi-v1-2-ac60fd15c98b@oss.qualcomm.com>
Message-Id: <178974865004.291453.1481546992616254827.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec


On Fri, 18 Sep 2026 12:28:41 +0800, Wangao Wang wrote:
> Add a devicetree binding for the Iris5 video encoder and decoder block
> found on the Qualcomm Hawi SoC.
> 
> Compared to the Iris4 generation, this block has
> - additional power domains for internal NoC(cx & mm).
> - additional clock for internal NoC(cx_iface).
> - additional power domain and clock for apv codec.
> - different reset lines.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 262 +++++++++++++++++++++
>  1 file changed, 262 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,hawi-iris.example.dtb: video-codec@2000000 (qcom,hawi-iris): non-pixel:iommu-ranges: [[838860800, 3451912192]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml
Documentation/devicetree/bindings/media/qcom,hawi-iris.example.dtb: video-codec@2000000 (qcom,hawi-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'memory-region', 'non-pixel', 'pixel' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260918-add_iris_for_hawi-v1-2-ac60fd15c98b@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

