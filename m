Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1245369D59;
	Mon, 12 Oct 2026 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808777; cv=none; b=mIiXkCdmBndaD3OUhEQKWjOpMAb5BhGrGB6hOtYy4EZdGgvN5PokUentLUbdc+3lhAx5WksgWgowEd+I1AZTrIIN7ZqiNFxkRpKFiM9euEXSqCElwN2bZYbIDGsXBs0RLB/YAWZAqj3UQ/HxgeNMDmHkn+j8ak4LetVjyRWsu/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808777; c=relaxed/simple;
	bh=7Ojysbvjco71LXYqhBicyNHuRX3Aqb7UTlShGiLj3LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwNK9CzCrXJRB/XHRI/elNkaW0Nfcwp/JebSo+eZHdhS1GMTtZKH9sFeffkEh6mYBGf1db6Vh3CkJjae0os8vaQYCjwMmpWyN9X24VkoNzFANlbipom2xXTlS7DscmQOB2E+CrtLMerfbDCa5phGaai3wbEK+y4WUsYmsUTea2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPP1U/mT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPP1U/mT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4561F0089C;
	Mon, 12 Oct 2026 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791808776;
	bh=+8h/AHoWPWviayb7H/NMPPtHlPsxAB3U8GOZbBbXXNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPP1U/mTmN8UKwn+38RDxf8JCQ16nATIqjda6mnBzRzxCmJ6lo9yqUsDjBhDKdjV2
	 mYWsLGVIpI/Sa9txNN7ayoE/34sAMq3hoXUDxmS5wIrjoT747+pArAHD4Y8A8Xac7A
	 6RF/PMshdFjMXX0dKvp6lx3rq4mvVy3wPalm1d7so1gySqHcUeh74eqBt/AbNrt2Lo
	 Ru/KjWjYJ2OuHpgRiqRxy9lhQvpfeQY+EQfhksvCLrTxV5rbZ33oXjsf6OtZIh5o0I
	 /mDuFQoj50KUhzCpUYbQ4jWJbYpNc0iDH67ZWgVoljArOSYCA+5AfatJg5zsgCGZGl
	 /eFW+xz///Suw==
Date: Mon, 12 Oct 2026 18:09:24 +0530
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
Subject: Re: [PATCH v4 04/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Drop
 unused phy_to_dw_phy macro
Message-ID: <aszU9ejoC2Wf_9ET@debian>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
 <20260908-ipq5018-usb3-v4-4-b789702f0695@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-ipq5018-usb3-v4-4-b789702f0695@outlook.com>

On Tue, Sep 08, 2026 at 01:40:57PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Remove the unused phy_to_dw_phy() helper macro which is not referenced
> anywhere in the driver.
> 
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
