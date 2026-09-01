Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D023C3789;
	Tue,  1 Sep 2026 12:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266304; cv=none; b=pPEzc2SO84fbrl9I9/EU2WFjBN5CdzJ3TvUGqBkzapQBOWM7A2Ml8+6TQTrkfDhZQtF784C73kxfoL3e8/gr9mkmJOgbyu5MeXENgYqPyGvjexkn489o02mXMtr2gvj0Bv8ZbUv/o4og0MMtep0GY2x6PyLXcUk2XfvdTGIksEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266304; c=relaxed/simple;
	bh=Q5TkhrfZaKmpqdMsb6gk+JKzRFg5ICoOJppUWIvbmss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOSZwHBDlXVmrfyEsc2sKHjeAHoPcORCLxWPWE04l2h4/n6QJ3RlrUn8zJ/sRL3GbOJvbw0zf6tq2bhRXN/Q22hIICM0mpN5JFoPXqkQoHGdHrJzKqKTTxadQtTwGy/Ae3usEUIxQ0xtScJLdwSa0T4bSn03E41IgYG6pUZ1t0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Om+/qkcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Om+/qkcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1CA1F00A3D;
	Tue,  1 Sep 2026 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788266303;
	bh=VeNGPjKZBwOymK8viHv5YP5uFkAwxTsnF5fOnCaEBp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Om+/qkcle2hsEcibWMtideHU/g+6AD5l2d+o94kh9jtBZJgoqo4rsAYyCa68Xe2Tk
	 eTa0wpqF4AcXfUIyO1NfiZFy14Me/dyMnY0zm42sOK9WAt6Cnl5u9GNH8ILe4HwAl/
	 9LDBqRqqSKm2hkzKH2CrfimZCwbh96e0/vcCdVq7CXqxFwzbY5hjLntmCPbryqvKAM
	 Kja/5PhDfrYFNgYGHy8vDTw2kqSS+x4CIsXNk4UJynGlRrcZx3EHSDdxz51fgNg534
	 dLjSfJ/d6CKPT6xqdnDwnKUTRphP2mjYhJ27I5BQyAhOeib17BZtVjW5Ja70sqTepg
	 vj6ZWq8gBrzpA==
Date: Tue, 1 Sep 2026 14:38:02 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/5] phy: core: Define TBT phy_mode
Message-ID: <qbzp7sohhokldn5vt5cika77rkqnvqvwadx4bcpyqagyts2cn2@xsdp3gnqiqkk>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-2-aec9d2cb31f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820-topic-usb4phy-v4-2-aec9d2cb31f6@oss.qualcomm.com>

On Thu, Aug 20, 2026 at 04:24:11PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
> configuration. Define a new phy_mode for them.
> 
> Currently, USB4 and TBT3 are defined as submodes, because they're quite
> distinct, most visibly in the electrical/analog aspects (slightly
> different frequencies, timings, etc.). This results in a need to make
> the PHY aware of the actual mode needed (at least in the Qualcomm
> implementation, but I believe that'll be a general need).
> 
> Newer versions of TBT are basically supersets of USB4 with higher
> host-side requirements, so these are not defined. This can always be
> changed as necessary.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
