Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F30486B8F;
	Thu, 10 Sep 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055748; cv=none; b=Pb4FBJW5TRLaZGLVNFuWzLxD/wFOYqTMap7ssBvBSGeVy8ZpNTtcHVpC9wNp6uyQO+ODR/aWCxMxy0S2Cn8OeBgMgS5ctJ1hQJVh+8Jyl8x/AXBWm76jevDByhFsKzh2L9fXAXAcvZ9xpG0dM+KwPxRz8vXq/w85KkBiZWBbmO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055748; c=relaxed/simple;
	bh=ciVCjD0nAjPEsPqrLiFJtQJgCxwjLwR7cnFGlamgydk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMD5lPWNsy9PthRkaYCJ1zK1vjl3LpujqqKv9LjMJ/54j30VuCyUbEydlvBVVH6laOy0EnMJL9wJ/K1ggBfW5rUz5VnDpyYDsb9S0HxM9a+O1ZhGdi/iD/fej2AQR6xMiWT/viLL8z5xmYA/M1uB6yWF8k78Hxs9xh5E35Fdz58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5Cn8kaW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5Cn8kaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7AC1F00893;
	Thu, 10 Sep 2026 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789055745;
	bh=bKshaFwruqjQK9EWEG5Mo3nqXakrva70yXuhtDwvIa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d5Cn8kaW0O6xNYglXyTa93E79fJAGksLcKApVxsoZYHkchgMiaxhmCzfcfJOQF4UC
	 H+RBpHkMpApf5Jmv9w9QkchuuiRj3WFTWZHlWNk1pE5gacOGOdGxO980iUwa/rVQD/
	 gc+MxkDmrk8AuVDYIiB6guV2NMdpZG+bA5xa0XG1BG2CIpI0OU5Tg+OUiZ2JGOHHjx
	 DwqpMPC0hGR20Ifa0gLAy8B21pnUgzG8PcoL65zYqsZ5WKBSlVrE7q/tkuy71laCuS
	 jT4HdEOI/gfTpPB1KX8i6SalvLkIqwm3rUmVTAaiOZ2u9GudELkA3pHO2YE4Euw4af
	 zxbZjk42/dv6g==
Date: Thu, 10 Sep 2026 17:55:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 3/5] phy: snps-eusb2: Set phy type to EUSB2
Message-ID: <thiiul7sbjzwo6i3znf4qmer466elq6j4hivjf4cuyj46rhoij@ctkodmuebrg5>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-3-820cf5377a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-3-820cf5377a70@oss.qualcomm.com>

On Sat, Sep 05, 2026 at 08:59:07PM +0530, Krishna Kurapati wrote:
> USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
> connected to it. Set the phy type to EUSB2 to let the controller know
> the phy type when queried during its probe.
> 
> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
