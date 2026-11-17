Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929363;
	b=Tq9DI89M8ILayjIZmbEjHeTW35bqxkATnP58Wd/LbjcnVSa/kEYWb+DJMvtgZ147znlo
	 NzmJj0fjXyxYQE/Q7kJJipXkLVPYVlZZQr0iD74M7gHj/1R4bQMbiGA5PVuZqwkgGJ8hg
	 bpO6Ie5uXdmEJTqBpJTAJVvhGXt1vFyGvcWN1T5q9ZXO4xR5KrUBuy6MGbe7AfkzOBoxs
	 R/tH0vbZ4Ol4SnGFElWQfgoEANtVxepfkdQjN7iW47QezE5a2QfnoarJyqAzXhay7TbHm
	 oN2g/cZAO2vb3oLhW9FGjcMm3+hn6Q1biWbA45jwi4llo1tGOsnM3zvTmlHo/Eb2q6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929363;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=c//08oLKUN6xm/CkkXLDy4uHaJyXCwLvzOGPbWmpfA8=;
	b=eg2rOOlBs0WuW9+xFmdl5VzwUQek4t0qVAGPqXL3k5YEtDWhnBKPrCdM4UkJeZNkGzAp
	 EgfJQguN2qh/fuIILKiJg/d7aVQPoVFojd46NR4m7HWLEpVRQ4p1EibolF/Ta8f7Qsile
	 jU4+Xa/U1P9I/jpi9VWKB6h26PGHChrk8rN79oo34qA8MzEh6YtZJiCaFTCdA9fT1NY/O
	 sMafeQd4XLUl5sdUdayxUIlDEgelFEAN69Qn1BeNYSClkDy5cevO75Rw49DrAo2LdFYd4
	 g71/mGUfFpfZYTub+ImoHIGBc1NTqpGH7Gnw48gp5om2fenCMxahpdJBJS75v6ofX7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dWLNG3VB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6704606A31C;
	Tue, 17 Nov 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dWLNG3VB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032A71F000C5;
	Tue, 17 Nov 2026 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794929363;
	bh=c//08oLKUN6xm/CkkXLDy4uHaJyXCwLvzOGPbWmpfA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dWLNG3VBH/rjT0MadYldbEJ8vI+clvBLuAl6iln/qcJzPYZZklcHHR6hNhhhQoprM
	 H9r/T88RcASKYqGW9iWbNP3l8djY/qg7VGKNVvwD9uxcCuzND6Co5wwQLW8x657H+7
	 YikxN/Gdnn/l+U42kz3SqoZNkGdJQoDThUxjgqpg3vz6i+X5t82MTSDHKu3ywD09Lm
	 u6/7Hz5va1MNBL4cBCRssuC1ZkAIN7avPD8vNZtkFl/bdyiimjLvs3F58ukBf9E+yS
	 gKFGZeFpb6rWn/eRl2ZHijEtPg21cXM58iI5XO37GrkahcptsRTkLyKSkIF1IUH5j2
	 jdluo2JSMBMJA==
Message-ID: <ef5c8902-2a55-4879-8deb-5109f7bd3cd2@kernel.org>
Date: Tue, 17 Nov 2026 15:29:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
 <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/17/26 6:04 AM, Hongmei Xu wrote:
> Add the byte-mask property to the fixed-cell binding. This allows
> selecting non-contiguous physical bytes from an NVMEM region to form
> a logical cell value.
> 
> Some SoCs (e.g. Qualcomm efuse controllers) store a logical value such
> as a MAC address across non-contiguous physical bytes, with one or more
> bytes in between reserved or unused. byte-mask lets the DT describe this
> directly in the fixed-cell binding without requiring a device-specific
> provider for a common pattern.

Pl take a look at layouts, which does exactly what you are trying to do.

--srini

> 
> Bit N set in byte-mask means physical byte N relative to the cell's
> base offset is included in the output; selected bytes are packed into
> the output buffer in ascending byte order. The number of set bits must
> not exceed the cell's logical size given by reg. byte-mask and bits are
> mutually exclusive. Cells using byte-mask are read-only.
> 
> Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
> ---
>  .../bindings/nvmem/layouts/fixed-cell.yaml          | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> index 38e3ad50ff4f..46e1101ee98a 100644
> --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> @@ -34,6 +34,20 @@ properties:
>          description:
>            Size in bit within the address range specified by reg.
>  
> +  byte-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    description: >
> +      Bitmask selecting which physical bytes within the NVMEM device region
> +      contribute to this cell's output. Bit N set means physical byte N
> +      relative to the cell's base offset is included; selected bytes are
> +      packed into the output buffer in ascending byte order. Byte positions
> +      are relative to the cell's base offset and limited to a 32-byte window.
> +      The highest set bit must not reference a byte beyond the device size.
> +      The number of set bits must not exceed the cell's logical size given by
> +      reg. Cannot be used together with bits. Cells using byte-mask are
> +      read-only; write operations are not supported.
> +
>  allOf:
>    - if:
>        properties:
> @@ -48,6 +62,13 @@ allOf:
>            const: 1
>        required:
>          - "#nvmem-cell-cells"
> +  - if:
> +      required: [ byte-mask ]
> +    then:
> +      properties:
> +        bits: false
> +      description:
> +        byte-mask and bits are mutually exclusive.
>  
>  required:
>    - reg
> 

