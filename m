Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F7E3CB2F8;
	Tue,  1 Sep 2026 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268317; cv=none; b=F9RxHlmmWgEhmLPxf8GxPdj/EttgKk8+a4feJBxdnHtUZh+DKvCeaQRi9mXX2PKQEC9Ci/qTasUhn9KH6vFe+1VwNQNySLrRfsImyp2Pdl1FSP54H8DtdN+KzTB983kRqfad4WY7fCoP7NiaZkIGuExb1ZzLxO33ly6E453Rj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268317; c=relaxed/simple;
	bh=phsM/yfv4EwXb7wY5vlQFSEYk5LkP/zAE4QDjzmAL7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI/0uPMOTt2eJwKll1scq2ocuFziyaqoMYVvtM1hR5zKdDvPv185ZQuuv2c/XwRF+P51UbI2Eu8UH0YP8C0YuILq6rvU91rtqjI98y39G+qrD7xdu1vZWimV2CFhtP64zyR8oJWyQ54Gq13x7HMRCkzwWpb5J1+6X60o7PPROcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iX9d1BPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iX9d1BPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B961F000E9;
	Tue,  1 Sep 2026 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268315;
	bh=84DA78nCb8/YfyuoiXwo4GACV9/6L1RAMEbU/Sql6a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iX9d1BPnkv0eLulEkTIePn22YHRVxyCh7GeSCVkbPQsfu0mkG9Jhor85JYaNxFOdr
	 apkciV1ShA6PDrCmSngG6bGDedqPVRk45EInJv/y74p+06cltEAS802w6/DweeUWbw
	 6xRTq0J3kkCWkLOVsOfdFLgGhM7ntPAx0JvztfBFygPvjRkVHsCnhnyaYH4PXfyat5
	 REgr0AzhgyqkJTRq8zVYNYL/S30xoqdpfHumOQZgdqaEMcdq5VryDmwJ2j7kZiKcCu
	 Os/eqaDH6D68ZMH/IkqEir/woAmhNq+6c2gepRWGe/bRiWyvBiecrYyxGuHIZfrE0/
	 2f0IDip+I7S3Q==
Date: Tue, 1 Sep 2026 15:11:41 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY
 description for USB4
Message-ID: <tpnyev4byegefqswj3dh7v67loiwwpzfswo6us4xqcsyjfsqyh@35o6qljqiwqw>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-5-aec9d2cb31f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820-topic-usb4phy-v4-5-aec9d2cb31f6@oss.qualcomm.com>

On Thu, Aug 20, 2026 at 04:24:14PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
> successfully. Describe that.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
