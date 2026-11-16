Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830762;
	b=Th1iB1njTjKf752YUkU3RQF0a3/UuVoA3eOGIvCwOZWepDkvpLF/7vnZyu8MTVCPvHuo
	 hiMA0mBrR5VfH0YzCvfaJCh7bFXBy/9Qn10V1H3SKJtjiH34sUXPrMPHGNlV8IsJT8WKK
	 sSXtVI0lLPZwcbghADMLllZQwj6bNV5hiTMyXKIWwqqW/10Bu8Wt4b325AXkh00mpf1/N
	 IsoVygMmum/D4aP3CbdVTXRt8up28ogoXXgNcH1FVtuLixxb2Y2OKCmISUgw5QcEwFQ8g
	 dJOuCJIUiVKsGTPr6iMVmrElQcYB5Ta3FlgCkawd+cm8amnKHhrknqwlQ/OUsPy85QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830762;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NvzKt0ABqG9czfX7CCvo3D1asfWGOA5KuXZFSV0WPCo=;
	b=CGtXDuceUaU114gbAwmJHm9TT0U+8UAxtX/TT0bsuy3nEyO21JiCuv+H7dMltHlKHL7w
	 /D+O/XoqqMK3+aWVq0SGaqm8btiNC2JAmkzDvu2yOowUERQloVRpCSeX7Yj/2ccTWfwTc
	 wQf3pvXEtszP8tePAYhrG3bJJZSE5pcl9/1Dj9b5uyrlOiuoZecTphrESQeGuNEX1TFzh
	 NRnLPIm8CgFzamIhfWTVGhPRMnPVaUpLjOIS4VRDwlfBSYxDQMq5fLFzOdaNDq9Gh5XdE
	 iZvCFOcmQ3/HtN43NVIRlD1hvbKT8Uq5keJDs1VB7MN4EWfFtjS9T41ZkaXow3hK58A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gq0ZgjZX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56052606A323;
	Mon, 16 Nov 2026 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gq0ZgjZX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8FE1F000C4;
	Mon, 16 Nov 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830761;
	bh=NvzKt0ABqG9czfX7CCvo3D1asfWGOA5KuXZFSV0WPCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gq0ZgjZXMXmWGTeDHa0/IfFWDr/tAYv2vQqhdEtIDdXLzXi58xq+03HRF5FAg8B5p
	 E2kjKiRHq4NJ6dA4P9UKTUyvgvM4wv7bWq61jsziLfpSiWz3fJ0i2iTZzQIqUE2dNa
	 0kZDs9luJvX66qVN6GCgLtjs7usFZGeQFXzWvNZRiZHIpIxERre0BSr7+fb7eSG3BT
	 Rr8cXP3yGJeCJ/RBumUbI45Lw8bNfysejg619nd7Y+rN6EuqBOTQxLRJY2jkEN4JqN
	 0YEWi8JutYVa8yughDBF/O5svzGj76oeDUgU08BNXCx5hVCYrZWjlVUkRPbXcWNnZO
	 yQ5UFfjmt5nPQ==
Date: Mon, 16 Nov 2026 13:05:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Mina Hui-Min Chou <minachou@andestech.com>, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, randolph@andestech.com, cyyang772@andestech.com, 
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema
 for generic LLC support
Message-ID: <20261116-crazy-adventurous-cockatrice-61c62b@quoll>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-13-minachou@andestech.com>
 <20261113-emporium-provolone-0e7b0e39c97a@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-emporium-provolone-0e7b0e39c97a@spud>

On Fri, Nov 13, 2026 at 02:05:29PM +0000, Conor Dooley wrote:
> On Fri, Nov 13, 2026 at 03:11:36PM +0800, Mina Hui-Min Chou wrote:
> > The last level cache controller of Andes cores is not specific to
> > AX45MP. Other Andes cores, such as the A27L2, use the same controller
> > with the same register interface, but the binding only accepts
> > andestech,ax45mp-cache. Add andestech,llcache for them, and describe
> > the binding as an Andes last level cache rather than an AX45MP L2
> > cache.
> > 
> > The cache-level, cache-sets and cache-size constraints describe the
> > AX45MP L2 cache, so apply them to andestech,ax45mp-cache only. The LLC
> > of other Andes cores can be level 3 and have other geometries, so
> > allow cache-level 3 and require cache-sets only for AX45MP. Match
> > renesas,r9a07g043f-ax45mp-cache explicitly instead of through the else
> > branch, which would otherwise also apply to andestech,llcache.
> > 
> > Also add an example for andestech,llcache, and add myself as a
> > maintainer of the binding.
> > 
> > Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> > ---
> >  .../cache/andestech,ax45mp-cache.yaml         | 71 ++++++++++++++-----
> >  1 file changed, 54 insertions(+), 17 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > index b135ffa4ab6b..da9688cc95f7 100644
> > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> > @@ -5,14 +5,15 @@
> >  $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Andestech AX45MP L2 Cache Controller
> > +title: Andestech Last Level Cache Controller
> >  
> >  maintainers:
> >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +  - Mina Hui-Min Chou <minachou@andestech.com>
> >  
> >  description:
> > -  A level-2 cache (L2C) is used to improve the system performance by providing
> > -  a large amount of cache line entries and reasonable access delays. The L2C
> > +  A last level cache (LLC) is used to improve the system performance by providing
> > +  a large amount of cache line entries and reasonable access delays. The LLC
> >    is shared between cores, and a non-inclusive non-exclusive policy is used.
> >  
> >  select:
> > @@ -21,18 +22,23 @@ select:
> >        contains:
> >          enum:
> >            - andestech,ax45mp-cache
> > +          - andestech,llcache
> >  
> >    required:
> >      - compatible
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - andestech,qilai-ax45mp-cache
> > -          - renesas,r9a07g043f-ax45mp-cache
> > -      - const: andestech,ax45mp-cache
> > -      - const: cache
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - andestech,qilai-ax45mp-cache
> > +              - renesas,r9a07g043f-ax45mp-cache
> > +          - const: andestech,ax45mp-cache
> > +          - const: cache

Illogical split of patches. If this was to stay, then THIS commit is the
reason to rename so rename would happen here, not in some time in the
future. Same for everything you do.

Organize your patches correctly, not doing things half-baked... but
anyway do not rename files just because you added one compatible.


> > +      - items:
> > +          - const: andestech,llcache
> > +          - const: cache
> 
> Device specific compatibles are mandatory. I would accept this patch
> with a
>           - not: {}
>             description: Need a SoC specific compatible
> like the safexcel eip binding.

But why all others cannot use ax45mp as fallback? Is this really a
generic block among multiple generations of SoCs?

What sort of arguments from contributors are to support that?


> 
> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
> 
> >  
> >    reg:
> >      maxItems: 1
> > @@ -44,13 +50,11 @@ properties:
> >      const: 64
> >  
> >    cache-level:
> > -    const: 2
> > +    enum: [2, 3]
> >  
> > -  cache-sets:
> > -    enum: [1024, 2048]
> > +  cache-sets: true
> >  
> > -  cache-size:
> > -    enum: [131072, 262144, 524288, 1048576, 2097152]
> > +  cache-size: true


See writing bindings. Widest constraints stay here.

Best regards,
Krzysztof

