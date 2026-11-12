Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482012;
	b=cBvGHw8gZB6cHNNiE/l9q0moQ3oQD4Hs368Xlh/BYbL0UiMDp8EvwGYPR81hLAZQ3y7v
	 wQJCUIbeMBw0XJRBpZRmZFHTLR8nMdtT0naKT5rUzQBzCYt1wPunTYiRQmp77ncyqeR6R
	 p70L+zymcRQTeUHyTovfb0oSQ/ytlh2IJSraEbOhnwa14Vy3fDUAviOvGZH4XcCcyPycG
	 kYk8+FqSd8HElHy1fOvo1Lt4tJo6hp13oozho819NNLYsolBbMqwM61KdH7URX66GgwOf
	 W7PqHgc6QZo430arROrzVBOq8sodmuduZINZVgqumH9OidmjvKzsPvxQ1bs9gbXLxKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482012;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YUt79C6HsUz91WOz1S5CLRRoLkvdudsBsQ/mV3JOvoE=;
	b=YJJzYPTUazccp5aXVYIJFS1n6xpJYNIzVYiMZneydKR3VpcgAr3Qvvkd+IVmlNqPcHFD
	 XvDKaD4GD0RrPrQBlwgmSrs101qhAu19nlFAZR++sfT9aXpje5wjn1nO1Eb/3M5OyAz66
	 9wp11ILeyIJgn2Jooidep3V4L0+qI2MNzeD/Yybr0cAdSgtbPiF6jqELkxXmxqeSGoWX1
	 Cvp8mXmyAsMRP4Ua83BvWGSFE5zuP6zrXxZ+sfn+RK/2R3S/6nmYB5gr4L5EPHNpEJ65J
	 WtyPStu1IeHuRSuF95SSnlpQ3Vw4+C62kiQO5C77tKXkAGlW/OJnj+WrDz6Dcqii0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HmebXykq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34CC606A31C;
	Thu, 12 Nov 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HmebXykq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53FD1F00A05;
	Thu, 12 Nov 2026 11:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482012;
	bh=YUt79C6HsUz91WOz1S5CLRRoLkvdudsBsQ/mV3JOvoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HmebXykqayv+n+a6SRF5GOasVUHmGgLAzZRnAiDodP/oKaixv8v3kYiUv6bYaNdpY
	 H2WXSC5zpdjDgqv5LRbp4oqQbWH1UpkZ9B6nrcY1w2wxUcqJexoju25D20QZ7xaQ2p
	 HoLZusWfcPqTwOsKDjYM51rO/guPiFxf/hOn98PmTQu9tfYbh6UD38sE6GZB/c8TBk
	 3A4fU18SvWiu+u4MtwqLmRaXKfxhL5WntWq6qzHhVHVhoXLfwNQXJ6lJO6T1+CPOy9
	 FjpAoAiQ8L2g23JsFiQ8s6DClYHnrcBMH52xGjZUOv1/XONgGTDcU9w7gbUca2QljL
	 GziYz4kyYdxHA==
Date: Thu, 12 Nov 2026 12:13:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: display/msm: Add SM7250 MDSS
Message-ID: <20261112-gifted-feathered-ermine-443bae@quoll>
References: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
 <20261112-dpu-sm7250-v2-4-8e925a3a8a7d@brar.si>
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
In-Reply-To: <20261112-dpu-sm7250-v2-4-8e925a3a8a7d@brar.si>

On Thu, Nov 12, 2026 at 10:06:32AM +0530, Ishu Brar wrote:
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
> +            operating-points-v2 = <&dsi_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +            phys = <&dsi0_phy>;
> +            phy-names = "dsi";
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dsi0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf1_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dsi0_out: endpoint {

You need endpoint here. A change requiring this is on the lists.

> +                    };
> +                };
> +            };
> +
> +            dsi_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-187500000 {
> +                    opp-hz = /bits/ 64 <187500000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-300000000 {
> +                    opp-hz = /bits/ 64 <300000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-358000000 {
> +                    opp-hz = /bits/ 64 <358000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +            };
> +        };
> +
> +        dsi0_phy: phy@ae94400 {
> +            compatible = "qcom,dsi-phy-7nm";
> +            reg = <0x0ae94400 0x200>,
> +                  <0x0ae94600 0x280>,
> +                  <0x0ae94900 0x260>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&rpmhcc RPMH_CXO_CLK>;
> +            clock-names = "iface", "ref";
> +            vdds-supply = <&vreg_dsi_phy>;
> +        };
> +
> +        dsi@ae96000 {
> +            compatible = "qcom,sm7250-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae96000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <5>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
> +                     <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +                     <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
> +                     <&dispcc DISP_CC_MDSS_ESC1_CLK>,
> +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +                              <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +
> +            operating-points-v2 = <&dsi_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +            phys = <&dsi1_phy>;
> +            phy-names = "dsi";
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dsi1_in: endpoint {
> +                        remote-endpoint = <&dpu_intf2_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dsi1_out: endpoint {

Here as well.

With these two fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

