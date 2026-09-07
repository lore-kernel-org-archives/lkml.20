Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9253375C3;
	Mon,  7 Sep 2026 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766775; cv=none; b=JydkDxI2QPhhPoVjnAdc3JAYU7jxEkOhln1vjeW/tjlIhU8UTKynbIvMtNVUgQdvaMpheTXrDVrKNhiSucJ4I2JHGJkmf+nihoO3v650Iad41dkUkFPmdWpnvtg0nHEWj4zgwsMGTYaLHoh+jX5CdhhU2oSjaRnRY0YveLuPoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766775; c=relaxed/simple;
	bh=2jUeLOPYpbHYTFBtyKH9alUtkaXMXVqYiHLUHxDkJK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yhwd6qPAhtN5yHQ7QmToykwMnnlkf7cJhATY4eRDouGX8Lk2HXYqm7xinbVv9MxuUdW3H80gBmIX7UWvckJ094mXOn7rpVQ6UNOD8moGv/dYhwID5nFH+dS3RZ1+OX45fEnUrEwsQkiVSQZi3RhhTCRUrodlJy8KXrTKaHIXieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n21QY4fK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n21QY4fK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A286F1F00A3A;
	Mon,  7 Sep 2026 07:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766774;
	bh=Lqb7O/xgArFhbuT2l7tCRuiWSY7vb0n3vYqqKV7eQQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n21QY4fKs43oTf108gS6eGxoflN6Gv7srLEleF/hy7K5ydvd02xRPe8e/h+BxEz5k
	 ljRJTNcq7cG3YdfO+aALCis8gxd77trzUFfP1b68J9sMpj5VoKzIHlwcQXTHov9MCE
	 G324o026UqEnNwh65s8o502HmN1TnfXC0xa2PCcV1NpdO7H0xsP5Pr1PW6z/dzfu51
	 arubJuSLR5bKgpE5wuk66fyX742SHZvjti9iYexSyvqqyNwMQc/6x9NYCiuC7bg8jz
	 lZj7AJmCWZC3ZK1JxV6IkaBPQZL8a0ceMrTaPUq+n1SLrEpbaXIFTgl83YrbA/V/U1
	 Eh1/OHRryU8zQ==
Date: Mon, 7 Sep 2026 09:39:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
Message-ID: <ty4nwjn72q7iilztwihisg3hf6tiva7jpbudzhlyfawupwpouq@2sp5agbce3cd>
References: <20260903-vdev_next-20260902_new_post-v3-1-108223cbcc10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903-vdev_next-20260902_new_post-v3-1-108223cbcc10@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 10:56:00AM +0530, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> Maili reuses the Hawi QMP PCIe PHY hardware, so the compatibles use
> the two-item fallback format with Hawi as the fallback:
> 
>   qcom,maili-qmp-gen3x2-pcie-phy -> qcom,hawi-qmp-gen3x2-pcie-phy
>   qcom,maili-qmp-gen4x1-pcie-phy -> qcom,hawi-qmp-gen4x1-pcie-phy
> 
> Since the allOf conditions use 'contains:' to match against the
> compatible array, and Maili nodes always carry the Hawi fallback
> string as the second compatible.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
