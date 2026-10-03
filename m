Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EED3EAC98;
	Sat,  3 Oct 2026 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020217; cv=none; b=nDTHgdI18n6FoOxhHc6DB59EgmBM0s22Wz1M8Jg9oV8acaZuEBY5v0O+wnM4n5a4mUNnmUH9w9atgia4kGy51LI9swXjsjzqKO25zp5RCFunNMiiS27W6s8Wo4Gks/X1iMm6FeVNPnXtadrV66U3hdB/St0D/X58se1tOCVxIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020217; c=relaxed/simple;
	bh=o+c6WxeGT51EAq5PQhI5P3PaH+zI9YAQoIt3ziTiQnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UOUkRB7ewmZYWW8ChXHZNeNkgTQ9hRyJecQh29xjQfQQpLIpXQybztXRggama4DoDAkvNbwTU88cOhfTZYspNT3kyDTfLH7trMoEDG6tevNZzaucmDH3FPjXJ7UV/sa+pZEClA91htdg9kof2Nccs4fPfxff8UZZVGsSXLjd9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwGhAKLF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwGhAKLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712071F0089B;
	Sat,  3 Oct 2026 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791020212;
	bh=9rhRbAKRd8QTnsTQCApOaG9M18WsJMAAMTO/MZrrxYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bwGhAKLFcOssrHdXZXLoDrru0tqsnEbiGpFDae3MVW2eop9vEkhy9gBMsb0udXVrA
	 kii3oRjvUYFrilgqJ3f8mnPCcErFcmupiXgwf+ETXWc6KNG2QF6ki6lf1keyD/rdh9
	 Bsk26U4SrortqzjWyNJ/+Mz8SyqgJccjnOM3QH5Phkd08J2n5m4Lj2vVWTrpKDRs9z
	 thpFGJp3SLVDwFo8c3Mce9knMRB3FswgV/Vc0bZIVAKA5cPI0oEIb+uGaWOYg2YCrV
	 csfgjRfGdgQ5e8CBE+cjMNQeLR1ruCfuAcykXPn/HvF+9H8+F2nCQ5qmgRbenIr5Ks
	 j9XzMR/0UgEXw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] phy: qcom: Add USB PHY support for Nord SoC
Message-Id: <179102020808.199361.16211288333861014170.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 11:36:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 21 Sep 2026 13:47:04 +0200, Bartosz Golaszewski wrote:
> The series documents Nord in qcom,snps-eusb2-phy and
> qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
> Nord SoC support.
> 
> 

Applied, thanks!

[1/3] dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
      commit: 4d1f3875f32894c4082b79540fe3d77cede6d260
[2/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY
      commit: 674e602140a19a63c406e1096d0aeb76e8e16af9
[3/3] phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord
      commit: bb0417288ea40a5f57676529cae95f3c20bd697c

Best regards,
-- 
~Vinod


