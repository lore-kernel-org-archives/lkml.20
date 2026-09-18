Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC76547042;
	Fri, 18 Sep 2026 22:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769036; cv=none; b=TOdZavNtPyLL5VA3qNiCbwnHBPZ4ttbXmMpdprIAs8vOafTaCq/S0Jgmf2N/dc2oAI8VTkANHEfwOcfdg0/vmHwZjux5qt5HtwjNs3c6A+fQJaMZoI0m/8cahNyAprdyqnXgulLGdFUb+Wjzs3Kbwt0R7NGzKI5esD8ov7Apgyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769036; c=relaxed/simple;
	bh=a5ZA28Wo/e1KY5iIik8qJeNJCEYhqfBWqbto+5L+tJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6VeHErpkc+oruKa9i+kHo/adUdloM90wAAc1MMtk46/+6yBdCYP5AsfwTAtWk2jj2ZCTPa26F/ccWmJPghwXTWCkJJAb7+OTJ8XGvQJog9xNXJb/lT1ReJsSGO1UoidHIXuIOzG0SPPmo2hOWDv2o8BlvJIIkP56xtTdiwe60E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlyFgRTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlyFgRTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DFD1F000FF;
	Fri, 18 Sep 2026 22:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769035;
	bh=+AjKvC/qtXiZOeRMzHNlAY6klIi7dBjz9BNC4tf+Y94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BlyFgRTL5rlcxLWISARQLyIH+q/LaOJ0wamQtdobz3xwd24todGKWtQCGQUzQ3fU/
	 eKdzNlzbk/PsEToZjsSzk9dH3GHUg3CKiG8hXJ//0eIwJsKqqHSSRQ0s3pVhtTE9SO
	 2mvWAkTJm9N2L+aProXHc3jO/bStI9EQbvFGzE9F+tSnj8ClrDP2i/lCd3cmGyi+OP
	 mLar3u5p1sOcL6kMFBaAJnO4vVrVcKf0qkyqJAQ0auM+MlM9VZwic7N6oeP+w5cObV
	 fvyb4FqmkI4rqQSKty5d32xaVi7zmEr6DHacBHgf5Yg5t4nLKX8quQE9guLyMWjEFx
	 xA87sLUfd4MUA==
Date: Fri, 18 Sep 2026 17:03:53 -0500
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
Subject: Re: [PATCH 7/9] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add MIPS P8700 gf compatible
Message-ID: <20260918220353.GA2420517-robh@kernel.org>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-7-3267f14ebce1@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-p8700-dts-v1-7-3267f14ebce1@htecgroup.com>

On Mon, Sep 14, 2026 at 03:55:55PM +0200, Aleksa Paunovic wrote:
> Add a new compatible for the MIPS P8700 ACLINT SSWI, with the "gf"
> vendor prefix. The original compatible is left as is.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> index d02c6886283af790d75357f77a714558f68bb7d1..6c79d7b7058a64bb39141d565f0a6304365991f2 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> @@ -30,6 +30,9 @@ properties:
>            - const: thead,c900-aclint-sswi
>        - items:
>            - const: mips,p8700-aclint-sswi
> +      - items:
> +          - const: gf,mips-p8700-aclint-sswi
> +          - const: mips,p8700-aclint-sswi

No, we don't do new compatibles just because the company governance 
changed. That would be an absolute mess. Once you have an identifier for 
specific h/w, it never changes.

Up to you if new compatibles that are part of p8700 use 'mips' for 
consistency or 'gf' to be current.

Rob
