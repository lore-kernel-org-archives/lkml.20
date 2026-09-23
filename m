Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303DB44F56F;
	Wed, 23 Sep 2026 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195716; cv=none; b=E4Ea7DwWg4YrQJ1LqKcyC3mf1BDvOYe2gBghJmk9pLRYgPMSO+CS6aD4RZYloW+UcbllVaPf1e7raK8ovl46kjUHwPPgW/db078SARgXruccJTPwyEIjdPrdTPZgLvwU/EsG8Gyrdv3sLmTI/VjueHdW+7PNlpri1AC5jaqf85Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195716; c=relaxed/simple;
	bh=R28eoADJYrUGqzRe6fw7DC/AK+sn6SrqdLji3vk2qY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSKpYNV8F9MczKmtQccEZkLC2M8wtgAr/N3G4gAI+E1NAVXm6WLoTKW6CWmmG1I9in7Xop9xRoKutuXFXQSBQIlyMsIJ4lNNJBjVSDRxoU5ZeqCO21eA19J/WwEIlwevTk0hOPGZoRXKmQUDK+NkeUMIlcwTm7ocwz7IAP2KIfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gm9pJzT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gm9pJzT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762CB1F00893;
	Wed, 23 Sep 2026 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195713;
	bh=T1k9Cc/Sw8N1ua3Pm3RCgtLTIt+A5ISNV70edTDVtP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Gm9pJzT7mXoLkqF6tO0Nbe5fKlj9CAtAl87BbFQrxIJBYYEGogwjAKnu1EiugrZca
	 JuVIGl/M3OzmErjZAlcx1QMJWsZs7XZaJmhVmJfP2NckU5QCAR15MRRnQa7ijUOPlR
	 XGDVWbb17yBwszX6yWFErN+NUTDdGcDL/dn3466piUcD7C1ovruvBfQvNApDuE7Uvx
	 3nrw/MuKBOGWzdFAifnptur3AInLn7M6JdfWDEIiQ87JkmCVBDgZZXsVRxAqWRp95W
	 hhaiFOFrz1qpw1e0JK++d3NFBR+pe0mBSW8VUXKALKjlO6jzfD/WgX1Iy4y+1UtDfr
	 H7H4pl7Y0IjTQ==
Message-ID: <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
Date: Wed, 23 Sep 2026 22:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
To: Joshua Yeong <joshua.yeong@starfivetech.com>, broonie@kernel.org,
 lgirdwood@gmail.com, rahul@summations.net, anup@brainfault.org,
 lftan.linux@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 09:00, Joshua Yeong wrote:
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    voltage-service {

There is no such service. Don't invent names. See DT spec.

> +        compatible = "riscv,rpmi-mpxy-voltage";
> +        mboxes = <&rpmi_shmem_mbox 0x7>;
> +        riscv,sbi-mpxy-channel-id = <0x1004>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
> new file mode 100644
> index 000000000000..6334ebd31dc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/riscv,rpmi-voltage.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI voltage service group based regulator controller
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines voltage service group for accessing
> +  and controlling the voltage domains managed by a platform
> +  microcontroller. The supervisor software can access RPMI voltage
> +  service group via SBI MPXY channel or some dedicated supervisor-mode
> +  RPMI transport.
> +
> +  The voltage domains are discovered at runtime from the platform
> +  microcontroller, which reports the name, the level format, the supported
> +  levels and the always-on capability of each one, so none of that is
> +  described here.
> +
> +  A consumer names a domain in one of two ways. The first is through a
> +  "<name>-supply" phandle to a child of the optional "regulators" container,
> +  whose "reg" is the domain's RPMI DOMAIN_ID. The second needs no child with
> +  "#voltage-domain-cells" on the provider, a consumer lists
> +  "voltage-domains = <&provider DOMAIN_ID>" and names each entry in
> +  "voltage-domain-names", the way it names a voltage power domain. Both
> +  properties belong to the consumer, so a consumer binding describes them
> +  itself:

And where do you explain what is that "voltage domain" and why it is
completely different than everything else we have?

No, don't come up with your own naming for standard things.


Best regards,
Krzysztof
