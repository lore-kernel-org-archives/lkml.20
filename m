Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8088D548575;
	Tue, 22 Sep 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082926; cv=none; b=fKu5BcmZFrYos7d1XJs4Ba77AucDGOQ+V4DTmNSQeXfX2FDClRRbh98NXTqVo4o5FkFzNVVyn1TwaxiHOx/pByVUyi2m9MmxF/AcTvjTOrMWdrR0JcFS21KhcdVvn97adMbjOoe2IKIJSwBgp/Bij6cIspzw5yALL8geg9KTbQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082926; c=relaxed/simple;
	bh=fAfooiMjSiosKY29Z+1N7buwVfnIs/hM0E9viUjLAwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz1z7Susj4+8BNrUdYYFjvNGN6qLzyagv3YOpJLNIhwc9C0QPTSz+kA82gOgfuYqkfZmUVmvNaFjPMACfkYW2HW3MuoWQF8RosOtL30x12FQe5q31RHcu2UAnFj8JVVZhQUpQK2792sYeox+5QEFdnuVV2oJBMErc5lLycG2q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdtNwO08; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdtNwO08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2371F000FF;
	Tue, 22 Sep 2026 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082925;
	bh=RDmILnS69iCDqBGrV+DzvEqx/4VWsco+asG5Xcvrajc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZdtNwO08OPlHYOCw0qsQ1DkoJVljhe6kQ2vGsP5S6G9dMJa31CAGgEsp1oecXHqIV
	 H1nQUBrMrNnJYMRg65OdsvVQn0NhwWpqiaL+D1LxW3ef0CUoMC3owIgcrlRQEt57NV
	 hd7Q+rNVRggaVGqXDdsseEJZWxE2uDRH9B4kcSi6GODs1rqi57IHM0g7ysr8ZyG4GB
	 9PhUrGYFciY4GLLFpcVMxJDd3y0PByS/Yfhk1iEYkFzAmvJSJ4s7UiDFCXPIRWRuk3
	 iwgXvO0QuGy71UV9Am/zPtcAk9QnbcTQzxzaw/vR5s5mT7eVlrhiJ+rRw8TYgPu3U9
	 /H5ZrrM1vcSOA==
Date: Tue, 22 Sep 2026 15:15:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <6h6rw73eu7jd57g3v2v233ostssqtngojqyx3fwfzkjswa3ybt@t3dkzk2zwig4>
References: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
 <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>

On Thu, Sep 17, 2026 at 12:58:39AM +0100, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

If you are planning for a cleanup series, please drop 'inline' keyword from
'mipi_csi2phy_device_regs()'.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
