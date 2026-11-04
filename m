Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776093;
	b=blXyHoLDo7ZSC2X26w+bkzulpcXp6O4xBjZxUyebjsh3V17+rlVWmGOUj90Lqyidf1u1
	 ojPX2nwhgkXZoeZdQ7GD+JriqBvlWq3pckQkgFQwyPHRSHLol9wOJKwwgDlb4Sb/VF17o
	 Z12gchgM6hDOabAIZ6wQ8FGyjuDZEIxszk8H0c+ikyCEjYTBm5k39GLmc8ze0YzrHrNoF
	 SEG0VjoZ4RSHr8gXhqyszE32QjneQ+wOXrFKrwUaMkU5CVY7MO0vdNfZaMnqu7tE+7aGi
	 uHChwrYMqm/JGsyN+hKfUuIL6r0+tVZlTuYuiJKVWUi1VgUgAuQ23PmZ+uoiF7aoPuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776093;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vXoloEh6FJGNcPwlC3Osvgak4yvUbh+FGNfQQluoHvM=;
	b=YLWaDvTRYkcmEkew+OmXAJkOH/BRkyn3nwQUlqr4Mgd3oUighX0FqzE5K60y1GQg57BN
	 cVUHLWXhNEU7Ldb3z0tnU0QFE+6i5xbRquaYHAXymxUjgej45j7UVu4IQ0d4mj91PWo6O
	 2f1hiNjrjWZBIJSDXNJBf5BK4/hwfq8YxvTEOJhKiNqqafnCPTkz32z2NZepkKla+qP9d
	 sip4wfdESdUV7rjLUdxtxg4SHYwFOF+isCQBtgnU4iCdq8LYPTo8OjUNpknp+HQwrLHPK
	 q1z0YDThy1mpXYo8oyjnN0Ans4+PwrsEz78oWpr5fgCE/yPQtbnr5B70Gfq20/sTOww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADSfcTJV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CDB606A31B;
	Wed,  4 Nov 2026 07:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADSfcTJV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EC91F000C1;
	Wed,  4 Nov 2026 07:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776092;
	bh=vXoloEh6FJGNcPwlC3Osvgak4yvUbh+FGNfQQluoHvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ADSfcTJVFSuqx/1GtkR4HF4surfKM+BvmtmCBD0bSmQBdAC1iILVEQ7ypiyKzIs+M
	 2atdyy8NssQ4VpGMvGTQ2/G5ait7EFXpCUJpWSzTqKZrM81l3DqIEydZUeW8VaRuMX
	 y4oUmMKm1qHz9wNpuXS8euqJ4bvhwJaGjQmC1ZrECnhxdhrfa/a5rpXL2AWghH+p/n
	 wOjxryImZywVvWjbD0KKcl6AgMFKO0SaY8H7Y8Yb840NFiFMnmHw8doEEbJTk/NoMP
	 okNAiG2A71lg2+nxThtU3CJxZG74jpmfaMbxusccqVjwv1bb8uvTDZGPCRqdN+Cl6i
	 l8dYknklWUWmg==
Message-ID: <8942bbed-cd53-44a4-8559-c18fb2073bb2@kernel.org>
Date: Wed, 4 Nov 2026 08:08:04 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] phy: qcom-mipi-csi2: Add sc7280 D-PHY provider
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 gjorgji.rosikopulos@oss.qualcomm.com,
 hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
 jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
 <20261103214105.3605181-6-anusha.nandi@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261103214105.3605181-6-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2026 22:41, Anusha Arun Nandi wrote:
> Add the SC7280 CSIPHY to the generic MIPI CSI2 PHY driver, 
> bound to a new "qcom,sc7280-csi2-phy" compatible
> and reusing the existing D-PHY 2-phase hw ops
> (phy_qcom_mipi_csi2_ops_3ph_1_0). The lane_regs_sc7280[] init
> sequence is the CSIPHY 5nm 2-phase 2.5Gbps 4-lane D-PHY register
> set ported from the legacy in-tree camss-csiphy-3ph-1-0.c table,
> with the entries that table left as do-not-program placeholders
> simply omitted here rather than carried as a new marker. The
> soc_cfg declares the core/timer clocks (matching x1e80100's and
> sa8775p's clock-names convention for this pair) and the
> vdda-phy/vdda-pll supplies.
> 
> Like x1e80100 and SA8775P, SC7280's CSIPHY core clock is OPP-scaled
> against the sensor's link frequency via the shared csiphy_opp_table
> in kodiak.dtsi, so opp_clk_name is set to "core" here too. SC7280's
> CSIPHY has a single power-domain, the Titan Top GDSC, matching
> camss.c's sc7280_resources.pd_name = "top" and kodiak.dtsi's
> existing camss node; it is not OPP-scaled, only kept enabled.
> 
> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>

Where/When? Please provide lore links and proper changelog.

...

> +
> +static const char * const sc7280_clks[] = {
> +	"core",
> +	"timer",
> +};

What is the point of this array for each variant if all devices have the
same names? IOW, what is the point of patch #2?

Best regards,
Krzysztof
