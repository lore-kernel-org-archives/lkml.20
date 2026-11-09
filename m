Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227655;
	b=pM/jTaywKy9doQPdHPERYFqSw8PdS1Qt1FdT4ytmoCscbkeZvexPXkqSA8h19fMSzB89
	 vvMcFJF0RinhwPCo65KBk3PccFIhiIc6+wDlXx7UELoXJHUKmymTMyGXWv67EIOF7kirL
	 x9bSE3re6nM/qnXeIApgsNC31hChFXEi+XHCHZQDx/aDILK60J0jQr6fLsvAx4vjgBy/Q
	 Pj5vYesu5lrweZk87Ols6q6Rnl8cqNYMvLbr7pdnN4ckvRxrt2R+9OObDdwtuwuu+KIWH
	 sxkUSyc4O0Y4IgB1gM8d0f0PRZIdnczn0AD7oFwyaT3hBdy+yjW4KoozkbB/gY+xREg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227655;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xmIlBDozjkzvMSaRaAhvn1n0LrMtmUjIl/UdI6mSxd4=;
	b=2S7Fm+4k3KNV2xJ4nUDaUqsGeL52mp7CQFiiHilvbtqAn0LqZfJPx1vEZLzKeDyL9fWd
	 +mJDRYo57FXU9ec5xiQTvsa8MJR+JMUP+HaTuuyUbUCrL55NjadqGNfOrn8ALhg4PCibp
	 QG/Ms1FcGnVPG6tszrRUJreS+fJgHZzm+diW8zoGXIxtgoJYL4plG+ZdvD4sUTEn4daaP
	 k0db0f+eQSJyChLDculmPFhp6xGavtIRSEiU+hGXsjOXhKcYGvXNyXPHz2fWmhL6r438w
	 D75AaJATZuMip4GMiU/T/jUxDmsLUKcsiBfhbPdi8k3Pv3svCTO5Tgn3MH3b7pTZLvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MX92hfP+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DBC606D812;
	Mon,  9 Nov 2026 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MX92hfP+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900C71F0089F;
	Mon,  9 Nov 2026 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227655;
	bh=xmIlBDozjkzvMSaRaAhvn1n0LrMtmUjIl/UdI6mSxd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MX92hfP+u9/kEx1sCzTzk1GwJfIsGDdDn/Z18+KCuTtS4D1f7L59KYixVJsTf8YGe
	 Xgdbk3ZnRGJVeiRWL+skXE0p88m/KkLgi2h3j92wTLg+U/jeIPZYQUa1RzXGd+Wbkl
	 iGKByy7xnfQAJDUAT+1KVZmiY3LYfsLRZ5n10ncHDNyCkWEDM5J55Z8fTxmgLKyAip
	 1fYcFwgStjWNHbSY2B5eb90zM8Z2gYPLsuh0SoPZ+aNvgN6atxVw42FUr6nM7vsZ1B
	 V55/yxomUz2BYHHUdMFzbRlaBuoaDhmm69tjY5V0zvAe3/R7CkEPrS7MWuIYgafuch
	 w+/JuHdH+FpaQ==
Date: Mon, 9 Nov 2026 13:34:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: display: panel: s6e3ha8: Adjust to
 reflect the DDIC and panel used
Message-ID: <20261109-tall-lyrical-stingray-1caaac@quoll>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-1-87dd4ec4f7cc@ixit.cz>
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
In-Reply-To: <20261108-crosshatch-panel-v3-1-87dd4ec4f7cc@ixit.cz>

On Sun, Nov 08, 2026 at 12:32:22PM +0000, David Heidelberg wrote:
> S6E3HA8 is the DDIC, while the panel used on the Samsung Galaxy S9 is
> the Samsung AMB577PX01. Introduce a compatible reflecting that, adjust
> the example, and deprecate the DDIC-only samsung,s6e3ha8 compatible.

Again: why deprecating?

> 
> We're going to introduce another panel with different sequence, so keep
> calling original panel sequence just by the DDIC name is confusing.
> While we at it, we can cleanly fix reversed GPIO polarity.
> 
> Update the polarity to better match newly introduced compatibles with
> fixed logic.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3ha8.yaml         | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> index 00ce5a4e1c6be..ca250b1b91712 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> @@ -1,28 +1,35 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/display/panel/samsung,s6e3ha8.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Samsung s6e3ha8 AMOLED DSI panel
>  
> -description: The s6e3ha8 is a 1440x2960 DPI display panel from Samsung Mobile
> -  Displays (SMD).
> +description: |
> +  The s6e3ha8 is a display driver IC used in 1440x2960 AMOLED panels from
> +  Samsung Mobile Displays (SMD).
> +
> +  Known panels:
> +    - AMB577PX01, 5.77", Samsung Galaxy S9 (samsung,s6e3ha8-amb577px01)
>  
>  maintainers:
>    - Dzmitry Sankouski <dsankouski@gmail.com>
>  
>  allOf:
>    - $ref: panel-common.yaml#
>  
>  properties:
>    compatible:
> -    const: samsung,s6e3ha8
> +    oneOf:
> +      - const: samsung,s6e3ha8-amb577px01

So the panel bindings use compatible of format DDIC-panel? Are you sure
you keep it unified with existing approach?

Best regards,
Krzysztof

