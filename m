Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C74973A6;
	Mon, 28 Sep 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590014; cv=none; b=jqMAY0tqE4YuKj2SmvMgJkxvm+6X881z6jiv6iDmwWtblcupckIFeA0mJseRR7BYIpfRzpL7YvoJ3LaA8Rj5fP1MVoDjfS4EXFeOKJqcQtCYgT+L15g9ylwZcSV6P+4c7QdTRDpEGovitRgXvIbir33U8APsyb7nCQ8Yae0aWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590014; c=relaxed/simple;
	bh=ZNiQMKzD20c7tYDIYfLFYchfKYaDqyMONY7jgfWoQEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kE12C9V+oFw3JgrRRXaOrRoReA2JaI+ZWLNp2snwc+ekasQSV9AagCw6apQ7/IQjTTcF4tUiN2mqd84tKZy2MFku1ET0kZN8i3TVh1FTFJF0RWERkLH8jckDGGxyTfFEf/8sj4cx2jqhgtYJx3QIFOZ6AHx+w4+utyWOjBslD34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK8ZdW0H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK8ZdW0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8951F000FF;
	Mon, 28 Sep 2026 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790590012;
	bh=UY1wjgZ4YiqD21QdMzkmZKSJfV0/BKUbYwAG+89x5Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eK8ZdW0HqolkZgbsMuilZA2XTsjObF22Z6lYhcg7CF+qlYTXXMOcyHtS+3QWRY/RZ
	 qL2UT9z5xp4Hpc9y2L/iP5itRjbGOr0xfx6embSs8bRKBlNx0yKF51fIKHx1FJ1kRF
	 8IzOjNlYZP/aAe4Xx8CFsx/Pd9kcOgzBKROfULvb0F9DaUQ70QpSoqRkTh6B4FC6cc
	 GbdSLNeUrgd7K4o5kPlRhxd1o2THKiCdnfsyN2vuI5GHSuELVRaom9s7F6vbNsiLNK
	 CYf2uB4NbjkB5VeZwMI3F2gzzWBpospe620FyH/K6C8AQ26AgI2wFuPPo9Xv/SC9n0
	 6HUbByFZJpadQ==
Date: Mon, 28 Sep 2026 12:06:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 18/27] dt-bindings: gpu: panthor: Document AW
 assignment DT property
Message-ID: <20260928-adorable-gazelle-of-variation-e5b714@quoll>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-19-karunika.choo@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922204535.2850094-19-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:45:12PM +0100, Karunika Choo wrote:
> Introduce arm,access-window-mask property to allow partitions to define
> the assigned access windows at probe time.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  .../bindings/gpu/arm,mali-gen5-am-arbitration.yaml     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml
> index 9ea2b4bb9a344..4e7933829e2be 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml
> @@ -52,6 +52,15 @@ patternProperties:
>            Hardware partition control index. Must identify a partition present on
>            the GPU and be unique among this device's partition nodes.
>  
> +      arm,access-window-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 0xffff
> +        default: 0
> +        description:
> +          Initial access window assignment mask. Bit N selects global
> +          access window ID N. Masks must be disjoint across partitions.
> +          If omitted, no access windows are assigned by default.

You just added this file!

Please read writing bindings document. The bindings MUST BE complete.

Best regards,
Krzysztof

