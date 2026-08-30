Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D73B5301;
	Sun, 30 Aug 2026 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114213; cv=none; b=ViTvSLGj7tlygeAfQUOmPyCQaFE7JRQJQNdl+n48inIApzdyktYZqmkIgCM1x8j78n8njKAcEBofgKh00wAUoQ5DWkwtqelr65qOjqRskrX5VK3GJPy4kmmHe/i2omHDn4F6efxab231cMK0CJm5qKxlfkasPHbXfkL2uKj5odw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114213; c=relaxed/simple;
	bh=Po6qdR440nBTQVfMsjgXPs9gdyPKRFNwTqZicg8+EsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4QRKlxamasu2rRp1KukEqKWQJonIdxfxeyWyP9bOq5son48aUO2qkv4cVyoVBpZ/GSo+QgVatoD1lRoZwQEWMD2pm35bTQPMU/yv39QH026oMXvj8UA3wv+Q55T3eyLqj4YykXJuIDony4UwOFYprjt0N0p8T5fGAJORoyHrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bir8J05h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bir8J05h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901301F000E9;
	Sun, 30 Aug 2026 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788114211;
	bh=3NwtxMdVLXV7pOrXg7WQoQ0mLkKEix6X3kh3oz6VoyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bir8J05h9hC1+qeYRcYYkFjr5NTjqitQwYbPgHuDz3nCkv07Be0FZMf55j82As4au
	 eCn/s/9/bAJUiyuqLhY1ehRb11yL6KIptIdCgBRWHY/yUnP1F5fadZImpFLcGSedyI
	 fyVZC8QcRuKr49rLwecWrlhIZbPgk6C6nBVyMHxKKzjanCJTrka9zgBBDJtbUJS2Sw
	 XlMzjkGoq1givp+uuFjUcl1LyvG82q23nsS8hZqfaNG11gCGkQiOZHMCaflpsC7cOM
	 RM+1VmL/jMCN1d6exr1RXef3BTxpJJhBOsxowi30S11ky6C9fsJOEKBCL2AH2XpkK8
	 3ubJr1C5/oHsA==
Date: Sun, 30 Aug 2026 13:23:30 -0500
From: Rob Herring <robh@kernel.org>
To: Jan-Michael Brummer <jan.brummer@tabos.org>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tian.shu.qiu@intel.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: ak7375: Add AK7377
Message-ID: <20260830182330.GA113479-robh@kernel.org>
References: <20260829052514.18178-1-jan.brummer@tabos.org>
 <20260829052514.18178-2-jan.brummer@tabos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829052514.18178-2-jan.brummer@tabos.org>

On Sat, Aug 29, 2026 at 07:25:12AM +0200, Jan-Michael Brummer wrote:
> The AK7377 is register compatible with the AK7375 and is driven by the
> same driver.

If so and there is no driver change, then you are missing a fallback 
compatible as sashiko points out.

> 
> Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
> ---
>  .../devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
> index fe312cc..c040757 100644
> --- a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - asahi-kasei,ak7345
>        - asahi-kasei,ak7375
> +      - asahi-kasei,ak7377
>  
>    reg:
>      maxItems: 1
