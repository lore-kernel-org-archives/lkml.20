Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754153769E7;
	Fri, 16 Oct 2026 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165613; cv=none; b=nyMRvpnDrqCn79VvxZ5+hfEL3XM+dWU9z/H/LOgdU/QGhcYoWirgIMkFK+lPP8ZR0RccBDF5GHcTSdfct01ys6xgF4n76lyU6D/QBOf3kc1c4vEXNl0vAciwBNb+q7NXx9LeO4dS3sSJKRLhEERE5/w5CAj8ghGt8Un8fU4UXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165613; c=relaxed/simple;
	bh=39d/ZxYD0bbaGA0M0Iy3I0tQEqqeeJZ5A8f9xu4V1FM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GDvBReJ50N+bJmPgzGXCbsUJWG/P675DfYxPd3iVtVCx+atTfojB7X6Wbg0zp+wkcIsuJ1mMVttjWCl05ffyWznNGw/JOemgWiXI0riDY998KJmVYh9v8yGo315Zl2GGH8VlhWTanqh3jSkaU/P0EeyEWRbqFkFmgGAhfIGNgpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6k7Rj1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6k7Rj1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD1C1F000C4;
	Fri, 16 Oct 2026 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792165612;
	bh=If7ZWty3DdHB9qswMusYmZ+neRbnI323tcCym/gq4kg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=I6k7Rj1HIU+J8R6x3LyV2dDi24lLIQMFpaXflXjPt/NczPRwr6Ub/kwTYoXMNTKUP
	 Y7bWnmMqFhmtDcrTP7ZzuXD1hgCbI3vDam6P5ZPQHrtSubIDh4TjIC+7xnfD4E//xm
	 1hvWjan2A3duqeUrTJNpFufbq7PRb9gRdPhNkS3oZBTwEpo+lLS3gcy1tK7/GywzFQ
	 qnDXGXwb44WkZSzYCV36fas1gbNqJzDvL36Dm5dgreHV3QQ2ejkUu06BR6VcF4/JLV
	 tovTYXlCaFR4riy+ccNn1oaChlP+/CZUZtHteAZmzAfKxP9zXOBtq3psEsIwAO9XaD
	 EzbiyXW2hbAxg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 2/2] phy: qcom: qmp-usb: Add support for SA8255P
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sriram Dash <quic_sriramd@quicinc.com>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
In-Reply-To: <20261002-phy-qcom-qmp-usb-8255-v6-2-bb7dfc5636b4@kernel.org>
References: <20261002-phy-qcom-qmp-usb-8255-v6-0-bb7dfc5636b4@kernel.org>
 <20261002-phy-qcom-qmp-usb-8255-v6-2-bb7dfc5636b4@kernel.org>
Date: Fri, 16 Oct 2026 21:16:42 +0530
Message-Id: <179216560275.106618.16177081518764116321.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=mani@kernel.org;
 h=from:subject:message-id; bh=39d/ZxYD0bbaGA0M0Iy3I0tQEqqeeJZ5A8f9xu4V1FM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq0kbmvMusR9n0mghwLveYw1lbJdBCT8O6y5M3Z
 sih39C4KYuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatJG5gAKCRBVnxHm/pHO
 9WLyCACf7YRv/dpx+v20K+xr+u8B/wC2DANLyWkHq16GwjKPIIns3VXzBmOQzaleVRzhBaCqf4J
 IJYuUintNq+8qW5anoq5Lo6oNKE016IFYirC0NIe1zI4SZ0QX4c3ycIgD5sS1YO05JyV+Pw9o04
 RX65ulZR+KZ5HIev5UgDrACGTomThhZxt5ShKhTZZzitqn4wdGxC4zBlc6h7jR0hmQ4Pd9WyOAv
 auXPJ9+8a27m+JZnvejoLomZrVslsIsdh44DMwDkqLTaCFdzRjc4xGXhs6WKUACFrVAj3NQX+KN
 dYNYlVpcwHQwfoskMX6ru0Jg2Sw1z3/NTC2CGfBLLu6Z3K5P
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-02 11:39 +0200, Mattijs Korpershoek wrote:
> From: Sriram Dash <quic_sriramd@quicinc.com>
> 
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
> whereas power domain "transfer" controls clocks and interconnects.
> 
> In this variant, two disjoint sets of resources are modeled against
> the power domain suppliers which can be turned on/off to achieve modeled
> device states. Two modeled low power states d1 and d3 are supported.
> 
> transition: d0 <--> d3  :: both core and transfer suppliers
> transition: d0 <--> d1  :: only transfer supplier
> 
> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

Same comment as the other series.

- Mani

