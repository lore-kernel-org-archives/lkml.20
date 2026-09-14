Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65C2E6CA6;
	Mon, 14 Sep 2026 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380863; cv=none; b=LZr7HZLabiHE5yQHtApFRpLjfINEiEzNuOeIEDE7T+zjAJObllOdC3KPtODKlzJQpjOp+2TdzoKn4o32VW6+Vp9riqh29oO9aHYzIVBmD35fikHXeOHLa6h7Fa6bB+KXzC4StqZNt5ySXoJ/U5ov9E6bC6s+FCNgG+EEn59mw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380863; c=relaxed/simple;
	bh=rmC4/YcEq5olwYAkjh+h4YWndqEVCVaCPUGICgBvd/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vc1u8W3lOy6QiRB3uZ5OZg0b1FZVtANVtflb4cPObISAy8A2ax0H4I2umfJ8z9QseqwtCL28LG08gx7EpJY/tRUJbRGTFQj+1DTktRWDHCF512DBxKWlxOf6szOucMx32XiqCmRRl0dG3id8FmKnXRte8aFyhHVs/BymCS5Ox/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5NLQ/Od; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5NLQ/Od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9BB1F000FF;
	Mon, 14 Sep 2026 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789380856;
	bh=50Ab5hgRM3J+T1RQ+KqVdIaeqjJu0Jhurl0zuN8lli4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a5NLQ/Od9aoxLSn7RFt6Rh4GdF+QEP9wSGi7MiaVvDuVs1p0VVbK1KLEAnGmeDHeI
	 y+RZXoaGQt/Jied7/1sMcrVfyv92ByAWk9d1v06Pqs7YjR7TMHeBiUv9FUyWZvLEBh
	 20wT0IvMCpbm/U6v1ptX9x69kRMWA+4YNav8yH2uz6dXRmUsou2RhLp65dgNGw1gI/
	 MgmsPMnN3VnmRS54wtnztO7i9bysAs6R0EF6kuGj0hB3oTk83+tQVYsVg20btgIMbB
	 ps+dFjQ9LXFjzy1XwlKRf3wkNVU9bQGFbgw+YEX6G9HFQYk5GJijzyqOHSTH9aOTuK
	 UcRzxTkGAOfeg==
Date: Mon, 14 Sep 2026 12:14:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
	Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD
 Technology Co., Ltd.
Message-ID: <20260914-venerable-accelerated-seagull-acdb8d@quoll>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
 <20260913-nt36672a-panels-v1-1-ce097402c6ea@minlexx.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913-nt36672a-panels-v1-1-ce097402c6ea@minlexx.ru>

On Sun, Sep 13, 2026 at 08:36:33AM +0300, Alexey Minnekhanov wrote:
> Add prefix for Shenzhen TXD Technology Co., Ltd., manufacturer of
> medium sized LCD and camera modules for mobile phones, tablets and
> automotive.
> 
> [1] https://en.txdkj.com/
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ba20029693734..86c502d8d1d5f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1771,6 +1771,8 @@ patternProperties:
>      description: Turing Machines, Inc.
>    "^tuxedo,.*":
>      description: TUXEDO Computers GmbH
> +  "^txd,.*":

So prefix is "txdkj"

Best regards,
Krzysztof

