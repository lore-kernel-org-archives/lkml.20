Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26824B2CAD;
	Wed, 16 Sep 2026 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597934; cv=none; b=s5/tLrGJaALn8N4xCRezIuQHKkVeOzkDTjw2aBOFyjYGb+DPDsMQjfGpToTwUh7Yz/eowHUsQ5yaiJG3l168VWHiljL7dp8wauDI6qXz8pDMOOUzvNlEfVVYo8/CSumth2O2uzNg11m+kEzZ5K2PMsKkEHfdouZPsM1fkvc0eCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597934; c=relaxed/simple;
	bh=Ri8OZ9L9TbrU3JLNP6df1O6k6JpjgPJOHI50wO6kgiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMHz/CSqMjrBaFcx8NkzwBGUOGtUsEMdZ32FJ/1UkfsEGxZBXrMq2Vwi06TbsrSVSKFc04SpHbVMDoVhhmUz58TRqcKCyon1r3PCWWxl50d4jeX8k3jyxBcgyAAk5JZyXt70bBZuBLQFcsV5jSNd08C3IKtTGotD/uJl6iuA0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJfz90Zv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJfz90Zv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE4D1F00893;
	Wed, 16 Sep 2026 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789597924;
	bh=2Rv0BD+/AKO3/iNSLjXRiHO51w3/ltaIzJWWs9UlstI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jJfz90Zv5Qj6zlSXdURfQ0HYxDs/f/xDh5yWkByM2v5AL6dDbbDjQqWrEZnOjYGy6
	 yF7iq4dsCDM1qIGvENRebSm8G11ubMHGLWov6d+G7/Px4gSCW47KTvCGmx+JmCXBe/
	 WhXSIEv4461j4pHmRIujRB/coL7P9kjfcE43hRo6JXH6icUVxh9j9lkyWw0LyKA4/R
	 nCXFqa5pHyDDReSbc5+oFXRVey3WE3N0ns0t17vuAf5u3gs0BTXR95ozHg/Wm2clKg
	 XGGkWTRLAOdHcC/Ajj0Ij4UkxwIiuauoqhZOHFfRkFjNG9LVcFg8mlcwSODA8s1Xg/
	 /l802Ul44ckJQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: hamoa-crd: Introduce thermistor-based CPU throttling
Date: Wed, 16 Sep 2026 17:31:52 -0500
Message-ID: <178959783404.1336377.3122643078079842539.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
References: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 05 Sep 2026 03:05:02 +0000, Bjorn Andersson wrote:
> The Hamoa CRD has multiple thermistors throughout the board to allow
> measuring the temperature across different parts of the system. In line
> with other platforms these are wired to the PMIC ADC and thermal monitor
> blocks.
> 
> While "limits" hardware management provides rapid throttling of the
> CPU cores, software needs to throttle the system e.g. during prolonged
> CPU usage. Wire up the 7 thermistors found in the CRD as thermal zones
> and throttle the CPU based on the "keyboard hotspot" thermistor.
> 
> [...]

Applied, thanks!

[3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor
      commit: 897cf6d54f366885e190e75b3a221e7b3ae35065

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
