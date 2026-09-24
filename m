Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4E03E3176;
	Thu, 24 Sep 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254632; cv=none; b=IA6wVkeqa1RtqX3KkzJu1pUWfFtN9shGOQ20CDN6W3h4zOcYpHrMCC6w4SB6KmsLF1jyTh1E4gPM7712HwBmTOn+RcEn1c80HoIuz6vW/noj45PdGbe46kCuDXfJ5vH65KpLzdMJw+xBUb0SO39tJLeR+WQ11gzrs395xSX/R0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254632; c=relaxed/simple;
	bh=YaM6Cv+7sTXQwGC1riqjikJ8mRUvTbb/943K3J9NrAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gy9VnwtvFHUY9mG6LtGwL9LrnetOwz17D7AhztKblZidSO/32YDcx7850k5p2DHHKtbC31L6vORVdSE9oNWc1ZGSXZWzULh0HBBqEgk0gY56kOeIaumvYeLvkXaE0HEMRwpIWdTiwADXqtA3hjrF6jY76MmMAlY7IdrgwxEsw38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7joRz8k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7joRz8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833721F000FF;
	Thu, 24 Sep 2026 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790254630;
	bh=ZUlQozRRVxIy7X3DmStVniHwMEag07GaVK8WjeTWxaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L7joRz8keKhlVO2OyuUWnvkJSz9Jl0fpRMsvh6pWMjYrDWi+LfLyr6uIPjFyklQvk
	 DgUF4f3/pVyA4wcME4cJuRKqI0Hy2vjGIoPhqH5nLVZ8SGTW4luIQl3BsZ4HXICzSU
	 CV9UJfXLec0FnESyT5OdxY2dyK2PmHz42/lkz1K0h0cPVEckK2ArFeDdkHI0folmXZ
	 lC38qX46t1aOBmpRHoBbie6tIeyoO5iEy9Um8uczsFzSgjQI0XTN0yAXPtw0FpavxL
	 RgpFM/LlZNqMZY8tVgvV81CdUZslJAXUmDr4+fskf3cv6POsAG6XqxeNaHIFhdNjjI
	 NWmnGci9DEwrw==
Date: Thu, 24 Sep 2026 14:57:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: soc: amlogic: Add clk-measure
 compatible to support more SoCs
Message-ID: <20260924-rugged-devious-fennec-f3742c@quoll>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
 <20260920-more-socs-to-support-clk_measure-v2-2-224382a429e8@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-2-224382a429e8@amlogic.com>

On Sun, Sep 20, 2026 at 06:25:04PM +0800, Chuan Liu wrote:
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

