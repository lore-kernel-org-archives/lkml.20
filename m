Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295ED4AF9F1;
	Tue, 15 Sep 2026 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509480; cv=none; b=SequHTJhGVum8SCQSmJJ1c7i2IbwrvR4IYyFP50l+5wEPnZbUuFoedla8uNWXWh5oVMzG2G7tiWjJ3V2h/AA0RmpT2/GNrBQpedO7bilAyN5uR03EjZxgYMg/XfyiWfZweStA574LtgEJaswkrM+b/20WLjn1AaCBCEtWJuATjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509480; c=relaxed/simple;
	bh=yPy7BjhV6cGC93sUA+Ili2G6XwUmycDh4mVtFme0ZJM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nofLp5GdT9fnGYNSJlIzyEUleCkhRWB74L6p8jNif1ZxkGUwow0efMNgP7hOipPa63Ko0YG/J5kzqaykWdd68u6bkF9dFxfx0Np9SoOvTYQNR1A5bh6P74Y9Zi7BlZ5BMwT/VCN/+iSF1jHJUPmuGxFNwTdiBln96HcvSERN3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGTHSEWA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGTHSEWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AA81F000FF;
	Tue, 15 Sep 2026 21:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789509478;
	bh=HeK0Zl+oIscV8guaYAWxUoysqKv/uRYunOKktwVvfP0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=AGTHSEWAxCcbOOlf1sICHdepQ3rvuASBNfybEhZ3SGV7u0oGD9m/mZFRnQlVGmNYL
	 gQ6WVvLxutjWdzeReYtB2a5/s0Lz5PtdK2jQxzgKeeR5y03CXzfx5objl4I1LRGtLJ
	 rQxdDU2Y4pidGOFJ9MNkIDZ3fYDniN8Fq9u9oEReJcsp/VYeAW0TPvvO5VKjyHuz9Z
	 pWz5l6wgfowrnrjyfLKlsnh0tB1HN7d1hCy+IMqdRpewyUMIOyg6aQ/Hwxnq0iQTIG
	 oijhZUZvRlfuzIMgzAlxE4brHRyCzP9L8zlCwp9ZkK19fmk4RHrQ5qIi0QoW5EJLHD
	 2GdCoMq3xutmg==
Date: Tue, 15 Sep 2026 16:57:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
In-Reply-To: <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
Message-Id: <178950938963.3847606.3090142150815454220.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller


On Tue, 15 Sep 2026 22:20:24 +0200, Richard Leitner wrote:
> Add bindings for the Vision Components MIPI Camera Module Controller.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  .../vision-components,mipi-module-controller.yaml  | 92 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 99 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.example.dts:32.23-47.19: Warning (unit_address_vs_reg): /example-0/i2c/controller@10/i2c@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.example.dtb: controller@10 (vision-components,mipi-module-controller): Unevaluated properties are not allowed ('i2c@0' was unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/vision-components,mipi-module-controller.yaml
Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.example.dtb: camera@60 (ovti,ov9281): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov9282.yaml
Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.example.dtb: camera@60 (ovti,ov9281): 'port' is a required property
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov9282.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

