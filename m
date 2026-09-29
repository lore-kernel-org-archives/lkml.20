Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AAD3E51E4;
	Tue, 29 Sep 2026 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651767; cv=none; b=eQv8BfNcDG/UqNhnibICkCpZiMjjuhF/8mY+LA8rSiBoORoHjhdveu1IHEcpm+If/QQdPs02RXWDhGDU3ZZnaMQ7eqSuQVBJILBSgoAshhr+e4Fx3YL8GCJkR3cvmdt2Ml5C+ACU0iK9bKM5yjlcjxAunA1dPZeJUpofaIT4sRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651767; c=relaxed/simple;
	bh=OJZorswHHH3AF9JU4MV+rCt/xNnEsa9glNlgQPcmLWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezrXTUf+z5fZG2STml/GwV0g6k/BaStET35FGxq1c/S86B0thUI+tNcztg0K+RVYBXDxeAX/QT7cIcp+RCbWeGx5yrZzy6xD6zw3wDk8fSrZI8VaiqiElSxO5oRu9O4Rs3CrWtUa6X1MwlIdJ+Jg/v47EHi+NefDT35v6vmBeEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIYRpeM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIYRpeM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E941F0089A;
	Tue, 29 Sep 2026 03:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651761;
	bh=sVBC35+dW/4W2Ayh+q718HWo5RlghaYXefSmKmtKZHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VIYRpeM9ZHAsl8ULsryoxNLSMPfTpFKCxN7jQUxZWkC3l4HQKpxMMG+HEvcLcR9r1
	 GOL5c6VDNETM3Py+jB2RK8iwSRBJoQwSPl/OQDGeeJdCVn38ivoqOU0CAiioRhOLp2
	 mV80GhF7SFmBCH0Ko+qFgU236bB6RC2My9Zzynvl2euc11K3T9i8d7ekp2sWjujOXq
	 JcIH6XNNspIczRlOHj3gslTbJYKY+NqDfH8EtOeWfZVkmUUK+1fZ40I3JcxRu+q+iO
	 mR14dcl9IE+D+qVYuDzkRfTM0F9UKD5pQIjzOv5Wrg/g6z7Yjk0jhVm+4XGfd84I1r
	 JuSHGXhncF+CQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mani@kernel.org
Subject: Re: (subset) [PATCH v2 00/18] arm64: dts: qcom: Fix wake-gpios polarity
Date: Mon, 28 Sep 2026 22:14:55 -0500
Message-ID: <179065171016.2673486.551421881319651180.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Sep 2026 17:24:08 +0530, Krishna Chaitanya Chundru wrote:
> PCIe wake is active low signal as per the PCIe base spec, Several Qualcomm
> platform devicetrees incorrectly describe wake-gpios as GPIO_ACTIVE_HIGH.
> 
> This  series fixes the wake-gpios polarity by using GPIO_ACTIVE_LOW
> instead of GPIO_ACTIVE_HIGH.
> 
> Tested on Talos Ride & lemans evk platform.
> 
> [...]

Applied, thanks!

[15/18] arm64: dts: qcom: lemans: Fix PCIe WAKE# GPIO polarity
        commit: cd8d4803bba672a4d03ce508fc9d2c459eb85c55
[16/18] arm64: dts: qcom: talos: Fix PCIe WAKE# GPIO polarity
        commit: e622c5d6553b8a83af04115c87f006406baf2675
[17/18] arm64: dts: qcom: sa8540p-ride: Fix PCIe WAKE# GPIO polarity
        commit: 450a0bfdb1b66da50ef98eefe1ff45b7be21e9a7
[18/18] arm64: dts: qcom: kodiak: Fix PCIe WAKE# GPIO polarity
        commit: b2b980536b5a4a5420175dfbef7f481408761b7b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
