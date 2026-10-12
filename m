Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC6D431A56;
	Mon, 12 Oct 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792625; cv=none; b=eW+4ngdsKqvkTcYp3Ur9adJg7oLq/XasquH+o5zjQjD5eueEB/Yey/uHGME3JyJ/qAB150JF3tnM/RB94xvJjo3Jdd7wdMm7J2u7D7bJg6Mtx15DtGKXMu8gsowtl2WMzdvBjD5t0I8CYzkMiy1h1+laQbuxvsH26AEGBsFA27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792625; c=relaxed/simple;
	bh=+VVo/JGBJ90aJN5ZdrAr9+J3UW3a8r4MnFeZa9+hYts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJzUltFAUCfuaJTLsvcDys9tZwke/qdRnNWIExLWt5IpdIkBatcJbmGmwv53xBUyJgvDjUsn3vxRm+pEYdzb4OdJjXhVNBc+C0P2KEAzNTU6KOPgUIFVuOWWbAb5rfu6unRqXxncgce36j7cRxE7VjtCMfsbAP/AYUts3/gRIRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh36JnY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh36JnY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ADF1F0089B;
	Mon, 12 Oct 2026 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792624;
	bh=QevQ6Tupp6Y5Q71lWFERf3zC8gS1eFojsFS0KOuxiFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dh36JnY3MrEljugYPHQ4jd4BIPja9n9k7ZVGK3AWn07KWrVB8fQM8wuvZWx32u3wE
	 +8goqAUnr/WuEsLk03lJ/U+/ip7dx2lKlGAMGapQ6c6wvIFu8/Kgg9dBqE3Q1JWujE
	 ZhSRokkDQ88G2LYd9tynhE8kPeexazdpEdpaxq+6Kci36AIOHLhwlDLLBz3qONQg7s
	 Gtyzct177n25BDDyCKYWsRR1hfW8bfZHTMHQ/vjFFr7c/u0UeiFCTVIx0bYMDrjhAZ
	 YjYKiaNqECpTwJR8Pgy3X/J5Xh5JvNqYyZX/+56C6Qmj1erbDlZuQQ9UPacl//Bnfr
	 Yfnyq0TB+Tzyw==
Date: Mon, 12 Oct 2026 13:40:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Andy Gross <agross@codeaurora.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY
 TEST_POWERDOWN bit
Message-ID: <asyVtSA2MRJkwxXC@debian>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 02:42:35PM +0300, Dmitry Baryshkov wrote:
> The SS PHY exit sequence tries to put the PHY into retention via the
> TEST_POWERDOWN bit of SS_PHY_CTRL, but defines that bit as BIT(27). In
> the DWC3 QSCRATCH SS_PHY_CTRL register TEST_POWERDOWN is bit 26 (see
> the downstream phy-msm-ssusb driver for the same IP generation), so the
> sequence pokes an unrelated bit and the PHY is never powered down.
> 
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
