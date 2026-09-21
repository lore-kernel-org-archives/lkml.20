Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A94FC8C3;
	Mon, 21 Sep 2026 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014888; cv=none; b=S70tb1zsdoDFuO8pHF0AaMPmZoQbvw0WfNDSMe5rRQTOZJasVW1lP6AzcNovWH2pJv4K5l8Kd4ioaUUQ4OlPZdcz7rYLf98zByoLxUFY4HQSV679tFEhRxmx5/C8vhB8SLeTFiUbsBxwexaAFZRd+8OZzk6+n0cJDpfAbGcdDMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014888; c=relaxed/simple;
	bh=EAJQC+IYtHdQknctogpIMvNJuntkCbGPkAMHSTp8xaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnggUoEt81LVgr1feDDJZdchFVB3s6oVtH/I6qrA9dLqdARogLXEHPPWrujZUvcNMjW9jii0/P/ZW+GVEi8aaTE1IimsMn5CMNL+xffVeUZHkVpd3FltNgW5lFqhYfFl5EK/NgRnaRbwPgjKPgHtaBAa8h8ykcOUYFUk6jKb5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQFJu4MO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQFJu4MO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1251D1F000FF;
	Mon, 21 Sep 2026 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790014887;
	bh=PbwTZfAx3l/XvruYhKqHu9GpG2SrIjnLF1liXGZZY/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQFJu4MOu03tBUbtwAkXf5AudkPj0Di0xkdBC+pdpRKIGAUaMAHYmLigFFkCyyZ0X
	 fzD69WbfKBHz+fwVBuzBdx2iQ/MajDSgbE9UdPQXqVF5mw8CmbHnGxsQZEpky7DG6Z
	 Dl+zZ++/XEGi3/JSEbDdAQ9GzoeQSx9eBowHuaVUAYCBN0NX7zXJ8xdDq+yTtZ2RsY
	 1IN2rbamhWnSUIzfp70KVyluYT9au4DS+B2zCK144rUx449cPyeq971b+WVekotNrP
	 +WesAGBwFUPOyo9wLr8DTdaME3WtCjUCrlnR/B4uWWwvSwvVENNihD44oobA6EoSCo
	 12s4PO9AGhvVg==
Date: Mon, 21 Sep 2026 13:21:25 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 6/9] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20260921182125.GA1219949-robh@kernel.org>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-6-3267f14ebce1@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-p8700-dts-v1-6-3267f14ebce1@htecgroup.com>

On Mon, Sep 14, 2026 at 03:55:54PM +0200, Aleksa Paunovic wrote:
> Document the MIPS P8700 ACLINT MTIMER.
> Extend support for both mtimecmp and mtime registers
> within the ACLINT MTIMER, identified via reg-names.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 43 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> index cf7c82e980f674afcf59fc726742dc4f49c1a820..35e02da675becb3c8bb187b8e1e623994d52df8c 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> @@ -17,18 +17,20 @@ properties:
>                - sophgo,sg2042-aclint-mtimer
>                - sophgo,sg2044-aclint-mtimer
>            - const: thead,c900-aclint-mtimer
> +      - items:
> +          - const: gf,mips-p8700-aclint-mtimer
>        - items:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
>  
>    reg:
> -    items:
> -      - description: MTIMECMP Registers
> +    minItems: 1
> +    maxItems: 2
>  
>    reg-names:
> -    items:
> -      - const: mtimecmp
> +    minItems: 1
> +    maxItems: 2
>  
>    interrupts-extended:
>      minItems: 1
> @@ -42,6 +44,28 @@ required:
>    - reg-names
>    - interrupts-extended
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: gf,mips-p8700-aclint-mtimer
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          items:
> +            - const: mtime
> +            - const: mtimecmp

New entries go at the end. And then you can define 'mtime' at the top 
level with this just being 'minItems: 2'.

Rob
