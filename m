Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564526;
	b=v7HOJme+wYrvRtcAVGgApIfo8uIVWIWvfeXx2L1wpevaDQAwQdi86nto9OY0V8MwfT/G
	 pYV+Ro2heaH/O4wJNf/k0jlaW8/i544btY9Sw93C2qRCf9AE1kO+GnOb8J5EzGRD6Q7OM
	 wlhA/+IelBBUfIRQ8ndM5WPVXQsLFxcw48fAOdhL60IpxFhzbvirxRmUtB1vqbVoZRFK+
	 JuVYgs2wE/CQha8QzSexmXhiH6PbiMkgDZmqeqnfWYNOhXtlPQSfZQzUekLwwUA0bfd8q
	 iaWycHgGcvn67lWnVJhD22H992JOumGAJoOIEk09m/cBGTfWQjB5ys+3rpzY4+gv9qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564526;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HbTVUVEbLhywMzK9PXNy1WS+vvBCdaRF5sXrgbJlc3Y=;
	b=AmCTKXyUi84p0VPlR8Tg6zpeD57w8O+Z9jMPEZZvXiY2IFZew+pGMZvN7bRAhs6k5Hp3
	 F/afB1ErnJVCA93EwUkNQotQHoF1bUDGgv6tTwC4Dayrktn7+EuBszyzHAHY4z1RFlL8N
	 TvuU77JaXHyUWa4UOLTVIQIo/dWtiF9nxMrCpOl2XIyQpKr7U4FOO85JfsvdPHEZF2CC+
	 IMnNGsnH0MLBtW603hGq1RHZZIaG+9RrVGx+PPLSahK7Ph5gV6H2kRTt7POdnI1LZ7b7u
	 K2+EfEOVDtvhuyVxXPGQaNrJpgMbQd/uFMtMhV1Aq6E0k+/IwPtenCT10ABUkLfyjQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLCKxYxG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FDD606A31C;
	Fri, 13 Nov 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLCKxYxG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8591F000C4;
	Fri, 13 Nov 2026 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564526;
	bh=HbTVUVEbLhywMzK9PXNy1WS+vvBCdaRF5sXrgbJlc3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bLCKxYxGCLmTJtkAVIq+poDgVQngn+bZy2ekBhpmFEhtu3JB9S898WIvaKmDyUgMu
	 DpgNATQE5Vo/WKcrOJIj9Sf1wr/lmIjFNf+PFlTiWs+UzkOXW9PQdejlejvL6KdwWo
	 9/YBGZSKsonURZjIib6bzNdbjXvWm6VrGdkLRfAVJkljkmyqQZ8wfqzdaAT3EzJkJc
	 uZ4JZbBzDYCq9e0pEBuZK1X4BRkl1c8rqNafBGfiPH1/esYNxBnrmjfqUyOiDsMTrs
	 8nZqcBOtdAD/oNfvvPIb1zJCDzC1L3jq62X8yHJkiRTj1QWLzmCCaGbf1bI3VQgdqa
	 Qd8W/1v1gvqdQ==
Date: Fri, 13 Nov 2026 11:08:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord
 bus clock
Message-ID: <20261113-bold-weightless-dragon-1a2ada@quoll>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
 <20261112-qcom-nord-ahb2phy-clk-v2-2-30ad3d947217@oss.qualcomm.com>
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
In-Reply-To: <20261112-qcom-nord-ahb2phy-clk-v2-2-30ad3d947217@oss.qualcomm.com>

On Thu, Nov 12, 2026 at 04:36:39PM +0100, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
> bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
> second "bus" clock for the AHB2PHY bridge, require it for
> qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
> "ref" clock. Since the Nord PHY needs the second bus clock, it's not
> really compatible with sm8550 so drop the fall-back. This is fine as no
> DT source uses it yet.
> 
> Fixes: 4d1f3875f328 ("dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> [Bartosz: don't use the "qcom,sm8550-snps-eusb2-phy" fallback]
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 24 +++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> index 931cd0e7d297e..fbea2129939f9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> @@ -19,13 +19,13 @@ properties:
>            - enum:
>                - qcom,eliza-snps-eusb2-phy
>                - qcom,milos-snps-eusb2-phy
> -              - qcom,nord-snps-eusb2-phy
>                - qcom,sar2130p-snps-eusb2-phy
>                - qcom,sdx75-snps-eusb2-phy
>                - qcom,sm8650-snps-eusb2-phy
>                - qcom,x1e80100-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy

>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: qcom,nord-snps-eusb2-phy

These two should be an enum (and enum entries alphabetically sorted).

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

