Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097D744CF40;
	Mon,  7 Sep 2026 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779754; cv=none; b=CJ9W1rCJqTuEDlSybOjUJKIk1HT3UmY1W9sySiEiDGxzO7uC+jnn/TQmJeHfYbVhJVNihTM+7dqQrnxPp7gVl/a0z7IXjMiN9c4dkD85RIx66UdQre3pDSwj2Yj9paGSHO4KbPzKVfvX4iqzPeGKhJajgmrgk3le97VhJemg6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779754; c=relaxed/simple;
	bh=h+2s+Xw/h9/je+iABWJCZDtu0+WoHElWKFdKIZs7low=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvZZaStvQYlfGyYtkwmaASeabeDTF15Dn5C4x43IRffiW5MauB7PSeUTnjDZUzh4cmIKshRiUVz2oZ9X9VOlh408TNIoL9z/JSaoeHjSnr04Z48M/8VzdBi7bpt4v1S86BAWLGiDleTcFqXqyJcuu740/JxbG++tU4b66XCAJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmJ4K1ai; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmJ4K1ai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F031F00A3A;
	Mon,  7 Sep 2026 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788779752;
	bh=jRla1z+WYCdfeApqJTPNn3t2SfBB6tcNgfV7C84Hzhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YmJ4K1aiRhIV31XeZXsOupoj7L8JIdHZSSTxTtffcaF5sF1yZRycMMxYBZ9DC8sNR
	 psO00+u1vn4gQvPP4H9ZV508o9wHTtaohmSQhsIErD3Xu6AX05CibGCAWzyVSRHAAj
	 e+rVnIUXk3wRwScSqCNLEQhDWFbYG8BGC5zCVyoz+XXOoEAk7vlJfcUDq6//6HI0BT
	 PQl7hBRQJ1lKjg6olL7WFxCUsINmQh3yIn6+e16rfzevAmdS3tIePMjdroQlpqu3p1
	 VtrqNDFq89hOQC03BiTXiM2LF+jbQ/ieomamL2zcXEj9S44FMdyzOFhZITjE6bJWzw
	 xo0u3Z5aB3fRw==
Date: Mon, 7 Sep 2026 13:15:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 04/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Refactor init regs table definitions
Message-ID: <6ewdlgcazt3ucqlxgqwwtcp2gvhcreoh5tk3vs5pbulrv5t2ih@uccgtpzvizyy>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:21PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Refactor the IPQ5018/IPQ5332 UNIPHY PCIe init data by introducing a
> helper macro for register/value entries and converting open-coded struct
> initializers to the compact form.
> 
> Also remove an unused include, drop unused macro register definitions,
> and rename the IPQ5332-specific PHY CFG register macros to make their
> combo PCIe/USB3 scope explicit.
> 

These should be part of a separate change. A patch should only do one thing, not
multiple.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
