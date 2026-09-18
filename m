Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFDC4A092A;
	Fri, 18 Sep 2026 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727096; cv=none; b=L+ervhIrji2xjYx5B1XRnAJhK2PYST8MUZ035Ua3nwRy/at5FMj81CZkHAE53uAVQFIkrcRWnZbj+ghDmrMQwNS1xBBUYGLqTkwu2VVrGoAPwrdQrgQc3g41uPOglq0xKRyPOLUTmNd8RGQPb2M0qCsRlgTsp2R0gstWsYWfR/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727096; c=relaxed/simple;
	bh=TACcGONVyWsdNuUVJKGcMuPVKsl2HdDfRIWkjb6gR3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrJFwpcmv4X+wnMxYHBGuz1g5PAnqAtSQkN0+g7QiJwp+Ofdb4LAtTqSDb3l3XFrlspI18LJIoJoo+BYlY40UF+xSRtEnw1uDKEUYNN9Li8B3fD5UMAmQe8eYQuzuqSFu6kFYp1ramjiu2pBUoOsqt0/LTI161u7/7yIqGcW108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e41UwT5x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e41UwT5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502F01F000FF;
	Fri, 18 Sep 2026 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789727095;
	bh=qF3nv3klH9Dbqycz2ZuFf8Ygc6MN3E6c1b20mBZp/Mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e41UwT5xKpy94j5nRvZBelhv3nIY9X4GO6OW2zZidTWCQZN7pM84h7dqecqkZMDf8
	 NxXLdg4DCS+q8cB+CuGzRTFgLJo9bjv0RlCIyjx0n/CAd6rC1olyg2DJRKaUTzgVpc
	 Cxro++1TJRSBGUsRsd0c+08z3zm7x8r2XOBSwxRf6sLhnXp599kNFNcjzI61iBbPnx
	 iX0HoNe55nYaT7UUd3dpAo7tpFbFZJxC8y27bzwdNPE8I+MqgPCbsQ3L82JcCuZolG
	 +gQyhNp5IzICepiXOmQPOhaNtHAzwg9ZBqKaQN7fWIqgcoN7FV3r8wewo2qGc39y8I
	 a0gfSdi1TQl4g==
Date: Fri, 18 Sep 2026 12:24:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-phy: Document
 the Nord eUSB2 PHY
Message-ID: <20260918-cheerful-independent-saluki-208ce3@quoll>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
 <20260916-nord-usb-phy-v2-1-2c8461bb30e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916-nord-usb-phy-v2-1-2c8461bb30e6@oss.qualcomm.com>

On Wed, Sep 16, 2026 at 08:30:51PM +0200, Bartosz Golaszewski wrote:
> Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
> It is compatible with the sm8550 eUSB2 PHY.
> 
> While at it: On Nord SoC there are three eUSB2 PHYs but only two QUSB2PHY
> block resets: the HS-only USB20 tile has no dedicated PHY reset and is
> instead reset as a whole through the controller's own USB20_PRIM_BCR.
> 
> Make the 'resets' property optional.

So this is a correct explanation for Nord, but you do much more than
explained here. You make it optional for Eliza, Milos and every other
device but use "Nord" as an argument. It's wrong argument. Eliza is
different than Nord. This either needs proper explanation or a fix - you
need constraints per variants (allOf:if:then).

Best regards,
Krzysztof

