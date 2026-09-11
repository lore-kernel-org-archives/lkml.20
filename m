Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD0432306;
	Fri, 11 Sep 2026 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122329; cv=none; b=DT4P5/iPtECFGDkoQwrJxRlIFx/aqElQpKmwuNumD6tH64XK6vmLjpuFbsSqtwNomzK9hGQZ5eZ551KTnHevLADFr9KN3Bdq1qbSzrjYOSD7NYBfHg4qj10vPGyh0zyJFWM+9cwo4ZGa2HxKRth7c0hRgiSyZwgr0z2Ozryyj1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122329; c=relaxed/simple;
	bh=VAHHEi44hWhmgNpPtfdgb5lqlUPNHNRkIiHvEshMy78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNvWj5m8dBcbPcKJIJFgLsmBxhubXUywpUseK9Bi8CLnx04ICBW/KvnIwjPHjjm5lmXJpYct2u8J+Qs757RnzGg4RHcm8/+X8CByjZ5/fLMDolu3mb+Qo4mT0uoLI2+KPbAZzm+oZp4nd9tpq71JpMbReD7hbeQe0kqmWm7iHIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+wdE86r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+wdE86r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5421F000FF;
	Fri, 11 Sep 2026 10:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122328;
	bh=PanDWesqwm0V5uWshLOly/oOrpvVr7MVZTr/OZ6PxpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j+wdE86rqReZlMfvbO1Hzv/eSVw7BFOd0TFvL7pOVUHvxH5bizZUqz7pAzJ5xslqv
	 fL9aR0ZUaYkEG5c5Hy4AObD5aqxrXmmz69mQ2oAr2gudPgw9dL7MArOf3tKMZzHsv/
	 3Cr88AQVL0pBApm2vYr5vPiehkAIXbcwEsolLm3JArdkHht0fUfr3vCznNURMJIKb0
	 TXMdAmtUynyHDGvT9h1lYQXc/UjXlKuNStiXONNaGwQaidTRJIg0lWf2T8JrPXO3aG
	 N/FznK5+yDzdJ1qRpRNHf7nqP4WNDzgdRWswnBzIabs4DnevuQ7xR6du464tK+fxQV
	 XY6kKWiJgYdEw==
Date: Fri, 11 Sep 2026 12:25:21 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] Subject: arm64: dts: qcom: Add t-power-on-us
 property for PCIe root ports
Message-ID: <u3g3hfxtdmczveh4cb3cxcgwoneniybf2qqduipffvzv2kcu5m@cnygstygdove>
References: <20260911-t_pwr_on-v1-0-a482d185f1f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-t_pwr_on-v1-0-a482d185f1f9@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 12:18:51PM +0530, Krishna Chaitanya Chundru wrote:
> The Qualcomm PCIe host controller driver added support for parsing the
> -power-on-us property[1] from each Root Port node and programming it as
> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
> this, T_POWER_ON was expected to be programmed correctly in hardware or
> by the bootloader, but not all targets support this, which can lead to an
> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
> behavior.
> 
> This series adds the t-power-on-us = <80>; property to the PCIe root
> port node(s) on the following targets, so the controller programs the
> correct T_POWER_ON value instead of relying on the (currently incorrect)
> hardware default:
> 
> - kodiak
> - lemans
> - monaco
> - hamoa
> - glymur
> - talos
> - sm8750
> - kaanapali
> 
> [1] https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com/
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
