Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971907;
	b=Vxl5d4BTIRd+EgBmuAiQMZLtB1YeLXbH7uuvmKSrEUn5pyZkGf2C4v9zTw/jAHafJybx
	 Q/IlMFM62RwXKjKAmL6gCQ9l29lCxgbReTLrLHNZ7KTbiUQ6llKGPC0zai7xvuL97oJwK
	 sMz/q1tPS12E61o/7rNQVVBXTYVbIF7RcNooDg0LMvPqMTJye56Ie4cXvFDnxDnpofocD
	 5zKC8gkbpxjX3K/0ijmb6A3ERxdDqTtLk2lGrB7JQeoy6O2EqbO0RtvgMZTZJcBEQ3f6O
	 kZB8C78kh/RQPtrWbrL9bhsTTIQFZlaX5FTZk8jQbjIFgvvgmOFQCJwbu3qMeZhEOIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971907;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R8rMwsrJHNL/+3u/N0G/CyMp16Ktaf0LF98kTeJKMTs=;
	b=NWpdRr/BWVJlaeXS89d7FmLpwpl0nqZxwNSqsns71WF4Goby302t+au4QgIDkt3Ws+h/
	 eb+4NUs7e9R38yaeWf+MCSINDTNsCz1Q7vaEzpjsFc4Eiay0/P+30qlgXnxzcEpBayzGx
	 fpkGzp38j0tBRW3rJIOnIWqTEWHWycYTrLX8/jX2sj9mJ0gRZtdyVB/3pIqhykS4nzL0q
	 FfWftvEu2uQMB6RzGz12DNEQFyiDXAr9K/mCQw8P6koO+7eQNDFSbShumZ2WSIIOokpgl
	 XOA4bJv6YWFuWGwyzQfQE6bg7cgfcReRhCAdxKaZcqo2NbhP9zzpwOThb3tvPZ3O2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LKfWDmcH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C225606A326;
	Fri,  6 Nov 2026 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LKfWDmcH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AE31F008A5;
	Fri,  6 Nov 2026 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971907;
	bh=R8rMwsrJHNL/+3u/N0G/CyMp16Ktaf0LF98kTeJKMTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LKfWDmcH/FkmPnZBAs7buzyQvLzjg0/OES9gHQJ4rOg4E/LdoSNY5QEl//FEJpwoh
	 nZqqkwofPgcPz5E4kDPhothwP8DuYSuKIlYoPshRngScTSF/t+3QnqRgTVq62tHsRf
	 1YdUup0QjQ6oJTmD0hHlR73faHcLUfxPqUFVTdcAIMi+FSJvmxoDv4G0L8JPnQ8GjT
	 bpaq5RQGC9+BpuOWmbjABePfn7V1/TRUKT3XYls/xB4Fd2DYucM2SKcT/GgSwo3XXC
	 OwlxhTDw66NbkJvhRBJpL4UCmTsVBza0vkuEKHzv2fMoHFF5fGfCFe+JWLmqvoj1Rf
	 FK2KcFXVk/Smw==
Date: Fri, 6 Nov 2026 07:31:43 -0600
From: Rob Herring <robh@kernel.org>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, loic.poulain@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <20261106133143.GA2705755-robh@kernel.org>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
 <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 10:25:15AM +0200, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domains, IOMMU stream, and interconnect path.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 0000000000000..86b17575600c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,193 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +  The encoder is a standalone hardware IP within the camera subsystem that
> +  performs JPEG compression in memory-to-memory fashion.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-jpeg-enc
> +      - qcom,sm8250-jpeg-enc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: config
> +      - const: cpas
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src

These 2 don't sound like clocks that are part of this block. And 'src' 
sounds like the parent clock? Use assigned-clocks for parent clocks (or 
just retrieve the parent from the clk api).

> +      - const: core

I would expect the main clock for the block to come first in the list, 
not last.

Rob
