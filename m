Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8984F5187EB;
	Fri, 18 Sep 2026 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749686; cv=none; b=ZgNBpvkwpfdmWYwQMslokecON2N9rNi8R7IYlae8euEfNO+0AJKtCntcEVL62QbotslH75qJKtuPdFvHZxLokaQ4ZZ52eNvL4rAKVyhoOZs3J6sJVM763gw0iar2VYSRW8YadR4aAVVYGV2a82AU3hugAUjwHpSwD5gMSf54T9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749686; c=relaxed/simple;
	bh=4RloXI9MwBLbkIsa5xfHbhUxUKoOhgvJ9Woqo5A5AOU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tZkKtpct2ZDVo8gPQPQA/I4IZ/tK/QudT1FZDXprFU9wnC/2zl7oR5TUqEgsv3DWagHOCun0wWeozEVYYslPssnkYpbDHK7l1K4L2QjGleyS55C8NHhqJgj28U0GMlLuCd/bYL3KNCChiQlnDVu1YoaXzXS/R5o2OYq6FFXp0W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYjqYTVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYjqYTVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D23F1F00898;
	Fri, 18 Sep 2026 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749682;
	bh=5O5H/6gCgyAd9CwdY7SShygtNyXdOgdSx01FBNicM9I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=gYjqYTVEEMN2sakWqtf5kvBPykQHxgvoN4kv/6dx9NnJS4P2lFM0WZk7eItTUqnwk
	 jIRXppcVebBscVUSTZZnjZHA+bxD53EV17DQWekFZPiTDS01Q2ti9pgwF0f5x4hCpq
	 kutR4tEM5jmIhZOKXwnpxUEoT4G9g3vsSJA5K5BGwaMMPT+MP2gEjOBMxFYWNdN7SS
	 1pNq6Vngb6VqFxE8QqZbpuqKM4njrisbnzA/j5zMZjobeJn8BD0ohkZ7jERhGoKiCH
	 yKIPiRuUTvSdtoPCrbqtmVZUCvPYu7Wj3TSYgLNKw0uJzssBjOE+kMsWA7s86axm2a
	 UWiJAWtBu6HKg==
Date: Fri, 18 Sep 2026 11:41:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-1-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
 <20260918-add_iris_for_hawi-v1-1-ac60fd15c98b@oss.qualcomm.com>
Message-Id: <178974864869.291097.14646474032150425870.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits for Hawi


On Fri, 18 Sep 2026 12:28:40 +0800, Wangao Wang wrote:
> The Hawi Soc Iris5 video codec requires more clocks, power domain
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

See https://patchwork.kernel.org/project/devicetree/patch/20260918-add_iris_for_hawi-v1-1-ac60fd15c98b@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

