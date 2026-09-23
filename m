Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62164B7A4B;
	Wed, 23 Sep 2026 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165534; cv=none; b=uY734svlJzrMDrCtGDFE2IsZnoj0Jfgmc9MMHrK5R53QAUfsccm25eiocO3UtZbCAHernB1+FUWW6wNNspE5LN6ZIuP17MMoUICH3ct3jyZzzqreobpJP3PdJmYSwH8u/dIQLvvztQXdd4FcNTLfTloUQawk8eOgFSWw7XczkLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165534; c=relaxed/simple;
	bh=qP5nLCiyL+LDBce+0csdczrsnOiOa8GHCiW9gO/hZ30=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E70QuWuf7QsLKAXSQsCoLT0zeLe5Xx5ik8hpMXe2eGWdxzWsvnmvwKKhTc/fUMNrgwtF4f2w78cWa4cYCoodme6aXThq+pmaOzxYqdhv2L6fZ2S6ya1M9rL9exev+9Q+Gk8RiSTvXip3oDytwX2Itqh0tkBQvfIJ5JuLP5ruXJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNb0WAPg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNb0WAPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C731F00893;
	Wed, 23 Sep 2026 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165531;
	bh=ag2E0KcIkIu3YBF0LdAXG/4WqqJI7h8NuRROuYXLfBU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=mNb0WAPgTEhVNyvx2H0l7w5HtXcwY+U5/v/6zG0xFI2FFWOBAA6VN3Tx0RhIw5eiZ
	 wTG5TD3csXWfTHrdu5oIcDb8UV3mp39XnU+L7/xTYgYqKmKcZNqqMuVYNeOY6H249r
	 IVMrxzPmyU5rvzPNeSVStcSKqBmCQxxSFc6P+Qt1w1NCh509LhAt11XVmIE/KUfwd1
	 pi7EaItsXd+8fd7Va3Ge87lfsOfkiKL5EXSQtQm3epHPE/C0rQZhHTEUkx/ZifkHZ7
	 eRdeuT7kuzpplp/EWmhDIj+bPZEypvzu9JoIHbPOFhiMv0CzTxx2wwmta3kq+0G3Kz
	 jicd7vPAS3S1A==
Date: Wed, 23 Sep 2026 07:12:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-1-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-1-016ec3d24b79@oss.qualcomm.com>
Message-Id: <179016528651.6874.18426056443363781198.robh@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom,hawi-iris: Add Hawi
 video codec


On Wed, 23 Sep 2026 11:27:51 +0800, Wangao Wang wrote:
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
>  .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 +++++++++++++++++++++
>  1 file changed, 256 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,maili-iris.example.dtb: video-codec@2000000 (qcom,maili-iris): non-pixel:iommu-ranges: [[629145600, 3661627392]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,maili-iris.yaml
Documentation/devicetree/bindings/media/qcom,maili-iris.example.dtb: video-codec@2000000 (qcom,maili-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'memory-region', 'non-pixel', 'pixel' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,maili-iris.yaml
Documentation/devicetree/bindings/media/qcom,sm8550-iris.example.dtb: video-codec@aa00000 (qcom,sm8550-iris): non-pixel:iommu-ranges: [[629145600, 3128950784]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
Documentation/devicetree/bindings/media/qcom,sm8550-iris.example.dtb: video-codec@aa00000 (qcom,sm8550-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'non-pixel', 'pixel' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
Documentation/devicetree/bindings/media/qcom,hawi-iris.example.dtb: video-codec@2000000 (qcom,hawi-iris): non-pixel:iommu-ranges: [[838860800, 3451912192]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml
Documentation/devicetree/bindings/media/qcom,hawi-iris.example.dtb: video-codec@2000000 (qcom,hawi-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'memory-region', 'non-pixel', 'pixel' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml
Documentation/devicetree/bindings/media/qcom,sm8750-iris.example.dtb: video-codec@aa00000 (qcom,sm8750-iris): non-pixel:iommu-ranges: [[629145600, 3128950784]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml
Documentation/devicetree/bindings/media/qcom,sm8750-iris.example.dtb: video-codec@aa00000 (qcom,sm8750-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'interrupts', 'memory-region', 'non-pixel', 'pixel', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260923-add_iris_for_hawi-v2-1-016ec3d24b79@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

