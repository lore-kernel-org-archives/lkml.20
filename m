Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689547CC9E;
	Wed,  9 Sep 2026 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942763; cv=none; b=BG2BMGYX1gW5nDZj9w19OxEaoXtfJ05M8xsM8qRJLBjbPt5pi7IZTU74WVtKNPs+rbONa70rZjkPlwZgFkptUCCaIYHnxnfI5DThJNVXIcm84dB2do8wBHOvKYm26/f52qizxligNLFuPLRiJ7wMYTlSv8CEeJZrSvoL8i0Cnh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942763; c=relaxed/simple;
	bh=PbrSTUeA5A4YRdcY8/mSRh4QQHjBNa9pRrAO3qY5eG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzC7xZV5fYlMCktGZX62kV1afUZePrP10dwfYn8O9u4GqZ4+rVfd52hPyEwlzrELrRknIyCshZ+TJXrnuuNDzneI32j06hzggXgZM8INwzffSamqdfeOcv4bT1OtwbB8UQHCaOEnfoYsxkNIucHgAFqZtRmLhZs1OnQqb/2Bytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsGcn7sY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsGcn7sY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A793F1F00A3A;
	Wed,  9 Sep 2026 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942762;
	bh=58EOD7l2qHE4wo91y89rSgzwAVP6VfLV2rivV/mwtnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsGcn7sYULHd2mcLbyjwpT3LIq0q4Ly0IxF2GVkacWdp25tdv+mGcpYRhpB9b3RF6
	 PftG00HGRHpsifnw6g5l83/NkOvQTHQU+hBWfxU5bZFPm35kooW6gH39gvp98mq64p
	 peeyLmPelCLv5E9IqPU6Oo0vfhlpikra1NvNFnNNKeIEatOhm7aGBWeRbCFtCrJPrd
	 UOQZxvzk3s+olK3OxQRk9c78bindNkxZ0sJkxePam8HON1PDwYmt2vBY9q87J9YNEc
	 GWPrZEPPfglxp0/bFGJED/97vFrQLXHZa/HCuxCm+R5W09sPtVb5O3uQ6w8/X4IJmt
	 7xTrRRT3UPMgA==
Date: Wed, 9 Sep 2026 10:32:33 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Add ASPEED USB3 PHY driver
Message-ID: <eizuwdemgc535gutiq3drpnxkqlw2c4a5bgjmjnnoe52lrbpqa@3p3mzanalcce>
References: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
 <20260701-upstream_usb3phy-v3-3-00e12315b6f9@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-upstream_usb3phy-v3-3-00e12315b6f9@aspeedtech.com>

On Wed, Jul 01, 2026 at 02:58:19PM +0800, Ryan Chen wrote:
> Add maintainer entry for ASPEED USB3 PHY driver.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
