Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8A348C7C;
	Sun, 13 Sep 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290236; cv=none; b=sNCExle9lb++GmpSkPXATrRnEvpJtbYPLQGw0pWBzt+gj9lVHEccHyR4M2EEKOvj96lN8AM8pckqn2wn3K1KfbLegwbc/phnBPB4nJloEADxvsJp4RUVZ6/vJw2Tx5r6gBzgfV4H2cJk3O09vgsX7fd62ogfj9vQ7vGOkQ4yf8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290236; c=relaxed/simple;
	bh=s7FNHjOA38LQ1O46rmec34YUBzRGFpAorX8iHulUSLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDE2CHk9JFJjEZ4rKhlYSQktTWJwzQEm8l3SXIKWUiYe7GfxVTFofOJNf23Zx0VD9jdldI0tT8KmHpKU3tnOViruEUjYNtFirqsLHWxyPbPeNRJYu0lKuCzkF2fROYPW2yx4+HY8SFYbX109d1i1n+t/ZqJkDlXbVakZRxgPEBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA8LP5ll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA8LP5ll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE8C1F000FF;
	Sun, 13 Sep 2026 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789290235;
	bh=HOCVCoUbZ3n/ApxFbJdyqu/tiiYlAtevu9P9fyqmEWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DA8LP5lleW298yNT/I3q4vqLVtG60kVYWFGIdHbGeitPHZw3N5aKTd5JB7sIfLcjd
	 23xpU5kKtO2bqa3Ln4h+0HEQUHddp8GSNcvJ7kvJ9n+TiCkKQmKdLrkuWRU+LduKiN
	 0/P4yuP1kiB1cmlamRZbZQme2JRS7tIKOU+1wrPhzCRtpLfJh/28vGKBk3drZPkHlR
	 jqjza0d7Hs/rVd7dLsmqmDPuvVeAMHLze7SEp+fOJJvTly682/m6scTeR5d/V3GYNt
	 YJ5A0ytlK0m1B6rCm1CrazlfXBX8yMXN04s39tCVkE8LpMcFplVkQ6JMAlpx1FPeXb
	 ci2rgPu86TapQ==
Date: Sun, 13 Sep 2026 11:03:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: soc: amlogic: Add compatible to
 support more SoCs
Message-ID: <20260913-resilient-terrier-of-sympathy-e50c85@quoll>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
 <20260911-more-socs-to-support-clk_measure-v1-1-940e269aa52f@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-1-940e269aa52f@amlogic.com>

On Fri, Sep 11, 2026 at 04:28:28PM +0800, Chuan Liu wrote:
> Add clk-measure compatible for amlogic A5, A4, S7, S7D, S6 and A9 SoCs.
> 
> Although the clk-measure IP itself has little hardware difference across
> SoCs, the clock inputs connected to the clk-measure block vary between
> SoCs. Therefore, it is difficult to fall back to the configuration used
> by previous SoCs.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> index b1200e6940ac..125be01e3b2c 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> @@ -26,6 +26,12 @@ properties:
>        - amlogic,s4-clk-measure
>        - amlogic,a1-clk-measure
>        - amlogic,t7-clk-measure
> +      - amlogic,a5-clk-measure

Why is a5 after a1? Are you all adding here to the end of the list all
the time?

Best regards,
Krzysztof

