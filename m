Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630B3D73;
	Mon, 28 Sep 2026 01:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560582; cv=none; b=mvopIjtg/ABNYuf5dmZk4Iw1lwaCPekSm0kyn7/s4I8fT6R+/t220gDqC3/HviiNHaBof6Rjowe0LXppiMGWKh9PNKub9O0kh2weWP5qvj/TkJS5UjIUbVl2FMkbuH+ZBi+nQ6yfjlZnnhuzeKbCI9YvNUGXMyUyxXQijDORcoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560582; c=relaxed/simple;
	bh=1opog5b4nL/1TMqDnfOk+LIeXsm62gAgFpFnjIvA+nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVoU51U8uvYWC7Wbwm4l/6gOQO0cz75G6ATZtQJ/rpDsC0WQWavWzByGaGVowr6Tfmbxb+4otuPZ8fba7eG8+esCztW/56nyhfUmCGkzWtxFHmnrcDwrpNYLphNFbwksFwH5qXhMEmeXOOH04g2WwhGb3N+mqlYQvome5wqAPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b08eEc5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b08eEc5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC561F000FF;
	Mon, 28 Sep 2026 01:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790560581;
	bh=s7veClUan6GojRS671GF1v6fbPbyqagKvEo/cBScepY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b08eEc5/ICvihqIekPvSIQkPPt5qgiHQvYUFQGIX0FUm1ehV1TcTfHinYiKZ9hXyJ
	 DDI/M1apztYg5UOFivlGD/GCtFQYSeJeTzP0J2aymWuKZcTrAVBPzCbHd37xJhbtIG
	 TiujBnCSHMosaXc3IDA8o8xZqaSgzbZo1c05HfKAfHBDQyGPT+LVW/P8PcV0zRTaG4
	 XtFz3agWWHXeQu/ScvNZk1IQPgtxMgFpND2YNTy8lrrgnhRSlSZKPZfmSrehvi7Ogi
	 w5sO6uVu6zGGcFh4hMjBmPqrh0C8nKpPIWkX59OVTK4g7DvRWvb+uCMDFI+dy3ej+2
	 TXj0N/bxhKxHQ==
Date: Sun, 27 Sep 2026 20:56:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN support
Message-ID: <arnJDVmtFk3JoT87@zenbook>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>

On Tue, Sep 15, 2026 at 09:56:27AM +0800, Shawn Guo wrote:
> This series enables PCIe on the Qualcomm Nord SoC and brings up the WLAN
> modules on the two reference boards.
> 
> Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
> multi-PHY.  The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
> selected by firmware through a TCSR register that the PHY driver reads at
> probe time, so the DT only describes the PHY ports and hands the driver
> the TCSR handle.  Patch 1 adds the PHY, the four controllers and the PCIe
> SMMU; patches 2 and 3 enable them on the IQ10 Robotics Reference Design
> and the Ride Embedded board respectively, along with the per-port PERST#
> and WAKE# lines.
> 
> Patches 4 and 5 add the WCN7850 WLAN module sitting on PCIe2 on both
> boards.  The two boards power the module differently: the Ride Embedded
> connectivity adapter card derives the core rails from the module DBUs
> gated by PWR_CORE and PWR_CTRL1, whereas the RRD generates them with
> discrete on-board bucks behind a single core power enable.  Both are
> described as they are wired.
> 
> This depends on the Nord Gen5x16 multi-PHY driver support [1], without
> which the PHY does not probe.
> 
> Dependencies:
> - PCIe and PHY: https://lore.kernel.org/all/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com/

This doesn't look like it will be merged, please retest and resubmit
once the dependencies has been accepted.

Thanks,
Bjorn

> - DTS prerequisite: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Add missing leading zero for pcie_smmu reg property
> - Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/
> 
> Krishna Chaitanya Chundru (3):
>   arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
>   arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
>   arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
> 
> Shawn Guo (1):
>   arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
> 
> Yu Zhang(Yuriy) (1):
>   arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
> 
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 151 +++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts         | 158 +++
>  arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
>  4 files changed, 1528 insertions(+), 4 deletions(-)
> 
> -- 
> 2.43.0
> 
