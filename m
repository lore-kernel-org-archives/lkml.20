Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BD3C2B8F;
	Tue, 29 Sep 2026 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650765; cv=none; b=OrmMmLuLJj9tUokGZVqlWwc3gGYVLTl8PPg2NaVm4RgJYCV9eX1hJjrw+ZxYBDNY8hWRT0rBwMiZc4NRoMwolfCKFXGqOYKAp4Dibl+wcP1WH91PcCIrJbeKE/N+nx7RZZkJKeuFCd63i8etitTRdjsynRV28SAbIM7+KaFzCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650765; c=relaxed/simple;
	bh=wLckDscphnGkh0WFF1ytv7QkveXFxmU6gRikvjheuik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFnjckY6lbqaIuQuEFuevtYEeG/YMM2OAdtWflpS+8uDETjsp0M9fW9paa8eu4CNUw8/+mWMCACz3B1zT6c2kpsVSf7ON6W7wE4OJkD2Ok0ytxWF6r0h8UKv4DapzH9nNPDHd19cVTlbZ6e2KD74n16jG+vJlDKeprOnsJpIun4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZvdQBkU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZvdQBkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABD31F000FF;
	Tue, 29 Sep 2026 02:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790650763;
	bh=45G97lMmELMR3HYz20XZUa8kHahrLVd6UZEJZLiYSeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZvdQBkUK0GdtfivQYf2Be4sU71zPoxxz8iKyNjp5m5RHr9ssojPZEfEZkiPYzzTP
	 0tkB64ZQ9h9dERtePq3iUylPyoN2ecGHVSHErItDG+rArHuw2/L0kBvaIK+AB5uuLH
	 uYDU9HCBBqBNdWTktFG929kAaW58D2SROM+ksixaCTNv3O4rtgo9gvpPdCrk+PDhJD
	 vDlUNHvjC4yW4iJ9zDtE5FvqYrmkCrjk9XMmB6uAtZRqKaztNUoGv1oGMxgfJ9AZqO
	 eF9j0/uD6NYu+Fm6YFhZDM8flgiDlCa4ziaMCrmHxOTuDqA5fLlffv63CFi4O1l7Bs
	 b6wDBv0h0hOnw==
Date: Mon, 28 Sep 2026 21:59:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Acayan <mailingradian@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] dt-bindings: soc: google: Add modemsmem
Message-ID: <arsoHnkYnxMIP2ZM@zenbook>
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-1-a3634b553841@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-modemsmem-v1-1-a3634b553841@ixit.cz>

On Sun, Sep 06, 2026 at 02:41:12AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The modem firmware on Google Pixel 3 - 5a devices expects the application
> processor to publish SoC platform information in a vendor-defined SMEM
> item before the modem boots.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/soc/google/google,modemsmem.yaml      | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/google/google,modemsmem.yaml b/Documentation/devicetree/bindings/soc/google/google,modemsmem.yaml
> new file mode 100644
> index 0000000000000..a5214a8093ba0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/google/google,modemsmem.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/google/google,modemsmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Modem Shared Memory
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The modem firmware on Google Pixel devices (Pixel 3 through Pixel 5a)
> +  expects the application processor to publish SoC information (platform
> +  type and revision) in a vendor-defined Qualcomm Shared Memory (SMEM)
> +  item before the modem boots.
> +
> +properties:
> +  compatible:
> +    const: google,modemsmem

To me it is seems node represents the attribute of the modem remoteproc
requiring this information to be populated before its started, rather
than a thing of its own.

How about representing this as a property of the modem remoteproc node
instead (perhaps "google,require-socinfo"?) and then put the conditional
snippet in the remoteproc driver?


I'm not particularly fond of the additional codepath in the remoteproc
drivers, but I think the DeviceTree representation would be more
appropriate - and the driver changes are reasonably isolated.

> +
> +  qcom,smem-id:

Let's just hard code this in the implementation until there's a need for
this to change.

Regards,
Bjorn

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Identifier of the SMEM item the SoC information is written to. Google
> +      firmware uses the first vendor-reserved item.
> +
> +required:
> +  - compatible
> +  - qcom,smem-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    modemsmem {
> +        compatible = "google,modemsmem";
> +        qcom,smem-id = <134>;
> +    };
> 
> -- 
> 2.55.0
> 
> 
