Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053E38E8DC;
	Sun, 13 Sep 2026 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296994; cv=none; b=uAhoc7TdTZzu9SkY6Ncr2BDp8qMweb1T71a5KJWmaA7RW8dxs/drGcZ34sTz8Lv/W9a0qJ/G2Ai8zK+9zE7q3VeFIrjhN2byNNhY//+lc0XWvqlPNkygzA7zt8vdxaHJSD01tS4Y9B2bvD8dKX3rwXeCtfNlCrNDIGG2KFhHIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296994; c=relaxed/simple;
	bh=w0+vx0Sj8S6W6pg52I2p+ExSIeDkDb7UZw/OkH/ADL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Du0Lc4LFJJS/yje2xCbX3uOvsOgHjUAPyGsVHN6ewPCcjCDpsfJTJJLqe/m96DmVU2oTv9RBJuakzyngcBSVKsX8prrnI0ps1qBd6YP7Nb3OAZ1Qn77rRAHtxdMPuJR+IbvWJIq2GEMcSnawWzX17wg6dpbB+NwTAX8RDHHA1SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2NSBs74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2NSBs74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9289E1F00893;
	Sun, 13 Sep 2026 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789296992;
	bh=P47HMdyxZh8fOVPmCb3YhWLwvJQp/EXFkFViv6/tHH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=o2NSBs74XiBFBetQcFBoJSo4xbzO50BciS55DZmkXAkU5MT79xS4bW/Kqh8oBch+I
	 WXGQMppP0/ndi7jCVJpTh/y4/npfwW90if7quPrFYlFMadC7hUrqlzmW9mcxl7cAAK
	 nMsxY9OYzZePyTbqdz564lU2jCu7PoQavYnDE0mo7ZyYOpB0BG9GSagMz+/VdqqpvN
	 ppteqRNtHOJUDctzd669tnZhZ8QL15kvuRcVawoe+R/kCpLS1C4GfPhczclNQ2tpY8
	 fRFMAnUY0FEK/jvJO0nuZAgvm2B2hchA+VBJABLYUlH/gtkDXWU8nFYIspAceQxGyq
	 mNTRpIXUZGIdQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] phy: qcom: Introduce USB support for Maili
Message-Id: <178929698718.215437.1349034028800179890.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 17 Aug 2026 23:16:04 -0700, Jingyi Wang wrote:
> Add USB PHY support for the Maili SoC. It documents the QMP USB3-DP combo
> PHY and M31 eUSB2 PHY bindings and uses Hawi and SM8750 as respective
> fallbacks.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Maili
      commit: c071d59419633460761cfaa41120296051cd7ed1
[2/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Maili QMP Phy
      commit: 08354e2cb4c673af1d60f4ed10c88402daa65cb1

Best regards,
-- 
~Vinod


