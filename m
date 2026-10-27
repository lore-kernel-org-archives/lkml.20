Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089379;
	b=fb4wLpBlEg8oZbmwDzrrezKENUSiqM/JR00NOcdn1LCicmbgVROe/sZlfDo4XxJJpJTW
	 MfyuM/cUGaeUgrkMC26VganZQcAC8qzPIlsq23PeDtSixotndoAO8r3/yxFJc79HDFD9A
	 drn0lj9G208KSoYCdiscksVeLIyH61P8YHRbelcon60F78bjIlnpcvrhXkvDS2WN65Yfz
	 sKyUcupXByhfFrMEpSb4oUQ5TyjYzWn4JxJr8u9FSuJZQ0352i08+yZAmbPW3vxHu0vVi
	 NhmOr765HGbPn6qWL0JijN/8B+IaqZvEmyiQ/K+nqqTQCKXuGsaAqtWi1c18rrNmroA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089379;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HN3oMF8cJPwybmrjw5tSyGJtcKHnWqq7m1Qy21DYQdw=;
	b=cwNyqiZSIBzmhvTqGEph59kT/2D2Br47hLVQIs6nk2BfhBaZksvDXk77vOqsg8fCO176
	 VTCcXUrIm2gzg85We+3HCttne3SwgRncLvVq7n+P/ZsoS8KZzpvYKIL6LkeRIhGoSnZEg
	 L3DaMIJMGo4kYo8t593oT9qH1LVUisfqxNUwIXt2XM00nQNbofCetkRpq+SEGdOGfYyfe
	 1xRxBMWL7FFO/bgGFvtJ39qVz//NjhyPtqUEXmhGkUhwCKWQQEknwn4Vsff4fTy0fsP9I
	 gnN/BYu6vLHx85pAvvyfuBz+nALCVqcrGmRuMQtwjMyi7gCQnXZeiZpdvnZaFOM9Rvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d03RdPm1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049FF606A31A;
	Tue, 27 Oct 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d03RdPm1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859C91F01825;
	Tue, 27 Oct 2026 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793089378;
	bh=HN3oMF8cJPwybmrjw5tSyGJtcKHnWqq7m1Qy21DYQdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d03RdPm1npwDQLuRyWCdS++TzwQ1lL/HCNxMslqwUs+5E9OEGYftuw3F8k1Pq1I7G
	 2IebY/MPn7Hz7YQPHi6YN8efmjPWzHXFSpsveHY+lmWUirVue0g68KK91oVpLRXpEI
	 amzm7e3GnM37Fw+OJnQQyw0D1KPjm84wjHlAsUly3xw86+Gg6gWBgjP2WIE/Hkuv6d
	 em259XGhuLErjEyWiGKrjHhJXikKh26mENioLxLtZZKMdmJzUOzw0Flu7syjBQ0OQ2
	 3J/OqTZ0wBFI+e/pSaPg7nwSRkFBGxfV9ZJ5kvug/nDO2/NJtWvihDt3xENC4L+/i2
	 E5cAqKPyP75Sw==
Date: Tue, 27 Oct 2026 09:22:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacob Pyke <jacob@pyk.ee>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, teguh@sobir.in, 
	Andrew.liu@moorechip.net
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Retroid Pocket
 IL97680A panels
Message-ID: <20261027-inventive-hidden-ostrich-66dfac@quoll>
References: <20261025133741.100490-1-jacob@pyk.ee>
 <20261025133741.100490-2-jacob@pyk.ee>
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
In-Reply-To: <20261025133741.100490-2-jacob@pyk.ee>

On Sun, Oct 25, 2026 at 11:37:40PM +1000, Jacob Pyke wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Document the Ilitek IL97680A panels in the Retroid Pocket Nova and the
> bottom display of the Retroid Pocket Duo. Both are 1280x960 MIPI DSI
> command-mode panels, with different supply configurations.
> 
> Link: https://github.com/RetroidPocket/linux/commit/9bfe85be2179d03338d09b8900f3b1916999ef15

Please do not reference random 3rd party repositories for no reason.

> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Assisted-by: LLM

Drop tag

> Signed-off-by: Jacob Pyke <jacob@pyk.ee>
> ---
>  .../display/panel/ilitek,il97680a.yaml        | 121 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..70a1bdccef75ea3ee6335304ede771ff711991de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,il97680a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek IL97680A based DSI panels
> +
> +maintainers:
> +  - Teguh Sobirin <teguh@sobir.in>
> +  - Jacob Pyke <jacob@pyk.ee>
> +
> +description:
> +  The Ilitek IL97680A is a DSI display driver IC driving the 1280x960
> +  command mode panels of the RetroidPocket handhelds.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: retroidpocket,rpnova-panel
> +    then:
> +      required:
> +        - vdd18-supply
> +        - vdd28-supply
> +    else:
> +      properties:
> +        vdd18-supply: false
> +        vdd28-supply: false

Keep the entire allOf just before additionalProperties: block.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - retroidpocket,rpduo-panel-bottom
> +      - retroidpocket,rpnova-panel

I would expect IL97680A fallback compatible.

> +
> +  reg:
> +    maxItems: 1

Best regards,
Krzysztof

