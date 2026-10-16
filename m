Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB9442FDF;
	Fri, 16 Oct 2026 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144218; cv=none; b=EVhsMj4rtGnWMlAaO7yUJ+2v1EzhdhZGswZk+rgeuW3SwjO09eevTH8q5qtsMiPf7pWfZF9n16M56vVxKTDjtb7V0Hy5izoRNq3yMxCSjQupn/IkoCRmRwMnPDVx5lAwUSfRKIrOkj5siVZ2w130PlkTMiK/Vue8VVyZw9ryhpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144218; c=relaxed/simple;
	bh=osl3ghB4d8zY2HK8xDSaBVFAhMO5e2+7C6eOp4TldX8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rGbm8PWno0inUbUfIrpxWDCCaNog67weFal+2R0yRswB9HSMYtAD4eBHro0MAjx4UAdJ+pLHqOLdarloKbPzdqeoV7sag3TjQXpAiwmM23VS1Mf9Tau9an2hcHb+rHrwaTqcKcFdb9/TXN++wPMckcV1H/JFjsPebAgHVlZ6fgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BygICGC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BygICGC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987FC1F000C4;
	Fri, 16 Oct 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792144217;
	bh=V6aTJ8QIFgvcB3e/79zrOO7eJ2u1s961DY47qK0V8iE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BygICGC2Z67hiTzpm/pdMXvMIgXGFGEP06d6qCZ9ylcnCJmz6GMcRLy0FnDLCGfEk
	 LfwAg8RuTYYHwXoAlxvscKskg1Or7i3Q5mX97hlvkhGT5m6EZo2fQfjjvglb5hqyxa
	 qG27EfiPawZvVRburGz8t/J2Lwd7JiYiQHEqUzlLs0wLvzaTzXC2n9EIEdWAipNbI5
	 objOUVaH3wtr5aoqHQtE3C/8VkD80hEphbX/PVhvg9JYXTQu0V5zJowVqMHqkXx24u
	 onAiqsXH4n1MCH8RIbnKwQPgSKLnQUfEQf2F5Kw2497zooQ5CLei3VCN+32lN4Yg/q
	 CBh1is2IJdCTw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] phy: qcom-snps-femto-v2: Add support for
 SA8255P
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sriram Dash <quic_sriramd@quicinc.com>
In-Reply-To: <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
 <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
Date: Fri, 16 Oct 2026 15:20:01 +0530
Message-Id: <179214420138.106618.10672928212252943043.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=mani@kernel.org;
 h=from:subject:message-id; bh=osl3ghB4d8zY2HK8xDSaBVFAhMO5e2+7C6eOp4TldX8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq0fNNaIWVmPyjpH/CFyBRgLTGNqRvrMEh5A6BY
 u8Sbl9XdYmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatHzTQAKCRBVnxHm/pHO
 9XaQB/9bZL4RsdsQ99uYzlA7jwW0SRXqnqYP7n3MATI6/rXxBKrAmGnamqm5VdRW/kVOqaOJnld
 7YJRGoJfkQmMLvmvMmzOnwP/ZcgDFtyFWaG3awnXpreGJ2Gcs6511crrYFbRbD0SgCr8Kd1p5kL
 0UHSmlIBdPn2DAE4CeE2xCSaLtQUW9s+48UcjIaFwyQMVV1RJvjjvHK+yErLEnG7d+EDNvVFMwF
 AU/qIceCsWar/6CE1820n8XF1c/bKGl/Pr/ItvaF5+PCzyQrjeBomkpuhFx1Ijlu3h6leHANj3W
 17Almgf9kTuu8wOhqd2P7jmJGOu/nkpXRa+gCV3e/AxGc/Oh
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-02 11:41 +0200, Mattijs Korpershoek wrote:
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

This is not consistent with other SCMI based drivers. Most of them are using
'power' and 'perf' power domains, not 'core', 'transfer'.

Why are these discrete powers domains be required? In my point of view, the PHY
should have only one power domain for controlling power and be done with it. If
you start having these fine grain controls over the resources from SCMI clients,
then it defeats the purpose of the SCMI based firmware abstraction design.

> In this variant, two disjoint sets of resources are modeled against
> the power domain suppliers which can be turned on/off to achieve modeled
> device states. Two modeled low power states d1 and d3 are supported.
> 
> transition: d0 <--> d3  :: both core and transfer suppliers
> transition: d0 <--> d1  :: only transfer supplier
> 

What are these transition levels and who defines these? We cannot have different
SCMI drivers inventing these kind of independent low power modes.

- Mani

