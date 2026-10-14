Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2247F2EE;
	Wed, 14 Oct 2026 11:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978214; cv=none; b=V2pAWGmZBr7VdyjG1izQMvRQgYLNnH8wQMXFX42N5EW5XhV80UIrarrasHWAdRWxhvvKdcpuzH1tHPA3UyqjpQTxeTbR0YVuUq8YN1fCpg/fH5a4z/YzLCMTrikyy7Wl9U6wUKmxiVn21K5s1I2wBmyU3B4DV7966y0EBHV6+9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978214; c=relaxed/simple;
	bh=C8l97/ooK6A1mRsesTllR4nTFsd99v824XAHYc1YRUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N772mOPwWFX1PA0tUFuB5NvJyGGYbQB3pM2+MPo5TyVb7rQJaZ1Nk4qdZrfgl7el9IO/dOUYTuKhdw6u2BCAV/N5axpNNwV9R4Gv6GiJQ1eyBbcGXt5h2kw/NpPTh6R928yeMObjjOF39zqdg7xV5VBA4wbHAtnsWNEWRLr2OWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiIDMyuu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiIDMyuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107FF1F000FF;
	Wed, 14 Oct 2026 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791978213;
	bh=7oE0XxvFFkBqtgQsaiPOqdldOyCWgA2hMmJ36+85B9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aiIDMyuu2uTFb+/QG9m1mRRuoZMFfp8wK/yD0aWrXZtz/m8gUdxid1LCT45bGtgcC
	 kcHil6ABQRer3XoYwDdDF587yQWKO8Xh6w7NKDHwGq5GCFrECU0rY26LMCbPrVnbmK
	 VGg+l47UfD0ugPbwF4is1B73xBK3P7cmfTG9GidqI9k3oM0MAXso2dONNHrZiRFch0
	 xUbHIGQH+7Y6fG5xsa40IYxMEPXCc0fmW85boXwYAvR19Py5WPNLb3Za42fAV/6uV1
	 oY/ysmAdu8vHUmn67M46Xh7MQAZsXo/TYozkssVQlyDZ+MbzC5HdM86WmzFUC2hqF3
	 mV4Z3U3Jd07Xw==
Date: Wed, 14 Oct 2026 13:43:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Message-ID: <20261014-humorous-cryptic-llama-cf6a6c@quoll>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014074516.240247-2-inochiama@gmail.com>

On Wed, Oct 14, 2026 at 03:45:13PM +0800, Inochi Amaoto wrote:
> Sophgo SG2044 uses eFuses used to store factory-programmed data
> such as ROM patch, public keys and other factory information.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml

Filename should match compatible.

> 
> diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> new file mode 100644
> index 000000000000..d4bffe2724ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SoC eFuse-based NVMEM
> +
> +description:
> +  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
> +  public key and other factory information.
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,sg2044-efuse
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Why is this flexible?

Best regards,
Krzysztof

