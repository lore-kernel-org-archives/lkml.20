Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7648C41F;
	Mon, 12 Oct 2026 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808906; cv=none; b=lszUVutBSHmEyCrYGd41MsItPq0Paz/9v8Op2C3smS/J1CYsrflfKZS72hyQha0hxngu1C22whtLU94zRvEBNXWVCaaj85y4Q08rGmn2WuoTXN5c1/1Gg7HEmtZgE/w16s4Q7tkhcYq5+t7iZBZMsImAkTvheCK4eX0fN6Wc2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808906; c=relaxed/simple;
	bh=fxGts0h3lPwgxIm/J6XQcO6wAo8VSeqCqw8rlO74twE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll17EXs7UMzOy3U76SzC/mRi3zK4Ze2hHpPJzT2nOmrxCgGQzj/cjYW41Ki//f0SdmWLe9CRW/1DZu7ACsfNbkHPJRw5+H2ndRWiZrpj/m2a57ESGnkhBiouU6sKSlj8mYoVhoXNOav30YEHbn3qk1qbTzC/tzIBQDm87MUzA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md3nnFvu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md3nnFvu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CBE1F0089B;
	Mon, 12 Oct 2026 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791808904;
	bh=nGDcRZy0rJgKXjAumMH7a8HmA75kBF1KHXLjncOR+yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Md3nnFvuwEUdEnPU0Iv7ebdOhmUZQ2a0aK+tJ0GuFHJzqDSvnNB0a+ps22iYAHB5+
	 mGauxKcugLax7Kq3PI5lx+hcZ6Hgs0c/VkWEoFw/7vPBRRGR6NVJLE4rjA3Pi2F3Nw
	 fHmAEWYi1tUk1B1KRhsn+SvkFmo643MkoopsuNSNe6jXlYmx9YdjZz3BiE3MBkhaQw
	 RWN36cM6xLXkjMLtBpwtu81u7FaXBZtPq8R1qxnU2Gi2S4ybqW14mqTp++hebZYmM/
	 UylYK5kVXGTyxxjSkjMX/S4UOjGn9cH1y+eZoI+vEsSmm8UKrGCyE0+dvx4iIIlNgo
	 9WXAdZ82Kq0QQ==
Date: Mon, 12 Oct 2026 18:11:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Stanislaw Pal <kuncy7@gmail.com>
Subject: Re: [PATCH v4 07/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Assert reset on clock enable failure
Message-ID: <aszVcN6LYhjMPUwq@debian>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
 <20260908-ipq5018-usb3-v4-7-b789702f0695@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-ipq5018-usb3-v4-7-b789702f0695@outlook.com>

On Tue, Sep 08, 2026 at 01:41:00PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> When the PHY fails the enable clocks, it leaves the PHY out of reset.
> Fix this by asserting the reset before returning the error.
> 
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
