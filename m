Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC122FD696;
	Mon, 21 Sep 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004062; cv=none; b=TwBp8bit+aDt1nIVZD+y2jsH61IKe8ZnVvi/dhpXexzw85/dx2s+cI2J0+3WUK5pSYpJjULn51J4wL3BmrWFbFa2Kg9eafvlGoAb6jzx+jY2NRnc4rxwpj6N/gQ4+QX88QdAHb8NEQtd9vx6NEy0GmyDmLteWzSHJU/pc4lXroE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004062; c=relaxed/simple;
	bh=YGYSZXZAOKyI+SQaZzhWKnu+5MVOSTM6FqMOOPMWjOI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fC9inm6InUFhrjEvv36B9KU4E5f9lYvrUXRJeabOyOSnNl/hG10vS2K2sbLQ1kgCkaXq4yDyODBeIgjOEIz+1JOkDWPG5q0TH9bgLLVnmuGrH59UoGKBHV2Ulkg7zP/uzp2Absv7ZXbUn7OCMUFM/Yt8kwSkccJcI3we87dWkiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBxIhJsP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBxIhJsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BD81F000FF;
	Mon, 21 Sep 2026 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004060;
	bh=sYN6gB7Ijq5F3mQPt8j/w5U9BHlrr8gpwOqMcp1ScAg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OBxIhJsPI6FsskimLCHHwrb8YKf6UPRxsiFCq59DToJg9t5AnuMw/QWSc+aBld6qV
	 NB3NNeRcUt3wKYVht8mQrwSIZ7/mOEejWEpr1fF/Dwd3BpiED8bv/PAPMsLaXsNGJl
	 q2NGUlDPTERSUs4uxPzUsiSo/mS/VKDXMhwjsqHr7hWE48gYYswEiAI8J5HyCcHPA0
	 EPSKVPrlwvmniMaY3C8eAC48YqmZNW9dFf1Lrsc/M2n4fFGXj3kV2L62rgB4CPVW//
	 4lFlmRyZkfTB24GFesazvM4qSuSQ8ITvwJTIy8phGp6Q5YPcDWnSUIR3Tfkim3WJvW
	 aGFFPbZg+71jA==
Date: Mon, 21 Sep 2026 10:20:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: sumit.garg@kernel.org, linux-arm-kernel@lists.infradead.org, 
 akpm@linux-foundation.org, mark.rutland@arm.com, 
 linux-kernel@vger.kernel.org, sudeep.holla@kernel.org, 
 thierry.reding@kernel.org, david@kernel.org, rppt@kernel.org, 
 jenswi@kernel.org, linux-mm@kvack.org, danielmentz@google.com, 
 catalin.marinas@arm.com, op-tee@lists.trustedfirmware.org, 
 devicetree@vger.kernel.org, will@kernel.org, ardb@kernel.org
To: Vincent Donnefort <vdonnefort@google.com>
In-Reply-To: <20260921110050.3977591-8-vdonnefort@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <20260921110050.3977591-8-vdonnefort@google.com>
Message-Id: <179000402021.412547.18161897733601725746.robh@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: reserved-memory: Add Arm FF-A lend
 pool


On Mon, 21 Sep 2026 12:00:49 +0100, Vincent Donnefort wrote:
> Add bindings for the "arm,ffa-lend-pool" reserved-memory CMA pool.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  .../reserved-memory/arm,ffa-lend-pool.yaml    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.example.dtb: ffa-lend-pool (arm,ffa-lend-pool): {'compatible': ['arm,ffa-lend-pool'], 'reusable': True, 'size': 67108864, '$nodename': ['ffa-lend-pool']} is valid under each of {'if': {'required': ['iommu-addresses']}, 'then': {'required': ['reg']}}, {'required': ['size']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/arm,ffa-lend-pool.yaml
Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.example.dtb: ffa-lend-pool (arm,ffa-lend-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
	from schema $id: http://devicetree.org/schemas/reserved-memory/arm,ffa-lend-pool.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260921110050.3977591-8-vdonnefort@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

