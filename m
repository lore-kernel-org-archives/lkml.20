Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D268B34DCF3;
	Fri,  9 Oct 2026 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528277; cv=none; b=ZDe0bzutNQQpizz9VgHnBFSnmv/j7HfeTuuL0iP68SKiJ7fYgyK2fQcP24Tu3B1K256pdzKxsc31q8gD9ae1jRb6sN+GaTIimlMayQdBQ5nhf4KQJPe05onI0OLbXfhM5b701kqq6NwhhaZp7nXAE99XYOM5NSYWDpfJoZdNWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528277; c=relaxed/simple;
	bh=JDqfwe9oKTRBzv0i9bsRfzdbjdQTUkGlvfDEJZbyWjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPIfELgfwQfGyzXoNbzZP340WAKOqA3K+ghCxbhp+aqOzLaQSLb4g9PfvHKO+If2+GTnT+y2Bz+DjRXnT3fqTZch+rWCvwxYxZpZb/X81ByAaoi5dnK1/mbOewKq8Ff5dovyfPtmrTNjHKLS6dZCtZwYYUmWFlzkD74a7rHeCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLJaRrYB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLJaRrYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB011F000FF;
	Fri,  9 Oct 2026 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528276;
	bh=0Um36Bmls59wwIHRJ0FX6eqoGiQdL5ajLwlxHe/J5vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gLJaRrYBsgbS3cgcpCHV2bSajDEmMCgWMFM4iI9mozcu8iPbXmiMakcLJba5VgxQN
	 5TAttX01Qd6DPF3sOPoOjRi0trTjaGmFnAZGxjSooJ2g7ljvM/5xZLb47E5XJXlf9Q
	 yC3mIqkKcTVXRW6ixQNB2CL3NN1mkmdi4psKBqflINO6+XrVfSZZ8UcghDK64ESfQY
	 G0dfXYSOPI8zH9pFvHfd9kYMSpVSkcLNN58aznF7g2nhgXWRgvgu2Dd3fEZrQkGGUF
	 wEXa2tGYoTpqZvJIprV/jIEPtfyzGb/HnD7HhHBTlmTly+Rx6T2MfPyGvBL5wRVkSe
	 RhxVXQG9TmwNw==
Date: Fri, 9 Oct 2026 08:44:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: SID: Add binding for R40 SID
 controller
Message-ID: <20261009-juicy-wolverine-of-atheism-3b0d8b@quoll>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
 <20261003012534.418820-4-otavio@ossystems.com.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003012534.418820-4-otavio@ossystems.com.br>

On Fri, Oct 02, 2026 at 10:25:35PM -0300, Otavio Salvador wrote:
> The Allwinner R40 SID exposes its 2Kbit eFuse at offset 0x200 of the
> controller, readable directly from MMIO like on the A64. Add the R40
> compatible with the A64 one as fallback, as done for the A100, H616 and
> A523.
> 
> On an A40i, all 64 eFuse words read through the MMIO window match the
> words read through the SID_PRCTL/SID_RDKEY registers, so the R40 does
> not need the register-based readout of the H3.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> index f67470b8a2ed2..a4960b0ef8cbe 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: allwinner,sun50i-a64-sid
>        - items:
>            - enum:
> +              - allwinner,sun8i-r40-sid

Assumming this enum is kept in natural sort order:

>                - allwinner,sun50i-a100-sid


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

