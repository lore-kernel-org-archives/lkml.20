Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD0440A0F;
	Mon,  7 Sep 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783726; cv=none; b=ZG5I17EBSOA5FqoNafOdt75LvbS1XuxnKtgZ7lEz54PXgEDINfETIu5axjoODfB2NYap5qHx4zZI22mrVzR139m0rw70W4Rcy4Vq+TLifrGKDnZCmBymu6k+2wcghDMsPftH9HnLe1vG6ADrQ4r5l4OZbB0smGxOaOwacr1yFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783726; c=relaxed/simple;
	bh=qDnMEAWOKW9jufidJgQLa/RqSOYYfw1M7rAq1pL6kc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI6qkLs2ZrfmoPnN85RBaOnJbapGyAo+BA7xYguwIC2hy8+miT01/siD7ADni7a/bnYLZ2pe43DEBdxhzQ7/QCXte1Pr9/gtevAOLPRwmtYB/2KcLP25zJUm4DaN7IfStWs8FJ2o396+8+c1zSuvLVOm9JOu1XJA0HrkLtmcWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6AvZgN3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6AvZgN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A621F00A3A;
	Mon,  7 Sep 2026 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783724;
	bh=Z5dMsJgOkpAowt+uKcJuy46JvhgdZiO/LaIkQAC/NDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a6AvZgN3ZlIdJ+lAGWpZ241rFPEhbbMAseDVBKov1HaC9IJUo8xpJtOwtwBpPYUB5
	 BWnORYSW+go5KZGDzwDlfnt80FQo2dGOcUjkbpnlMgFB7Fk5y4KCDDBCDGLdY0Avfv
	 z1w3dB80h6lNYelEEqQ7jVw0iWusZfn9leLFBEGjkvGQofWtJu+qx4Edv8MxWZu1B8
	 0S0ygfedvP7zX6h7EqOuCU0lgKLMTWI0l4xfHjfYHJmN3m78iKWOKPhuw/Ja96Vuka
	 ABmVflTy6nuxBgyMMoQQy5qdVhkYMUII1LrmEsn7Isz+r9j715rR/R/DBb2+d5w9Sr
	 639H3L7g3lTaQ==
Date: Mon, 7 Sep 2026 14:21:54 +0200
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
Subject: Re: [PATCH v3 06/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Improve error handling in power_on
Message-ID: <wb2tff2ljszeqld5yvxmurggp5fdh7vdmvij4vi5f7a7qld4jy@chyv3hpxj5h2>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:23PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 

Subject should clearly mention that this patch is adding the missing PHY assert
in err paths.

> When the PHY fails the enable clocks, it leaves the PHY out of reset.

s/the/to

> Fix this by asserting the reset before returning the error.
> 
> In addition, language correct the error messages.
> 

Again, don't sneak changes in.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
