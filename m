Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224B3E3D89;
	Sun, 13 Sep 2026 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297033; cv=none; b=bdZwsiV8DNfXLvIKtjRwiUyzoCCJmJ3ipQPgqKP2ADc39wHQAmLTp5BjCLSzWkl2WeJLb5wOrLvloEL0rHBmcdCHGDAjIvExdC2LPAsPf8H3fXYE1xXsoz5PD2ioWTcxLbIRxmykBgeEGees65j9HWOuHhEffmh24i8MBSt+fWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297033; c=relaxed/simple;
	bh=kudaW4VZiSGMzm2Iuqrdm8TC/9fFSVkzJmBmm4rWdYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lkDXCMhdj/284MkqofJACMsZeT9w84BXMmiYuzJ8tawD+Eq0I+M8i7d5CMz73AKoIHAwDaOVtsHjm4SQxbSNDUD3Tg1O3iNYOrQovIaGeEPVelNLT7Lbnam7wDtt1NQn73O7M0TJ+AkOoVSOsFVt75T9xvgP4bCyz/ZxrB2Zb8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzvG2/6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzvG2/6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E269D1F00893;
	Sun, 13 Sep 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297032;
	bh=B6375BuwSr0qxa/G7SGJaedwDML6AsX0Rg8JMlgWsS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gzvG2/6eKCfvrElOpzInuW5ph+jAAYwomkhFkF26qUCF/qdppGBLz3euECyRVXerl
	 oriUX5+3005jbf308kwmzHoLXVN6RFHu2c7cZZBSu0PQv1bodc3kdWK4LD9r1u6Dhd
	 fIlC7KOIJ01j/vmhoHaKArH4WER1RTJChIriYUn9w4QXTKyUFruXzGyVG0s3aqM2Yp
	 HE29l1epJa2DdUxoKfr2cWVx8H0x81arwzgoobDJS4XnOuktnuQ4O/urHHhQtD2Adw
	 UCLX1ljXBZssP9BmGgVUkOL6pDxOA0+kjJxP61MtiMR248hhnmjO2z89fShCGVONzL
	 RVRhJjnM2PmIw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] USB4 mode programming for QMMPHY on
 X1E
Message-Id: <178929702551.215437.16496561815731000218.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:27:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 08 Sep 2026 09:54:04 +0200, Konrad Dybcio wrote:
> The USB43DP QMP PHY, as the name suggests, supports USB4 in addition to
> DP/USB. This series provides the necessary plumbing to switch to that
> mode of operation on hamoa/purwa.
> 
> This is achieved by exposing a third `struct phy *` for the USB4 sub-
> PHY, which will be toggled by the USB4 router driver, living within the
> Thunderbolt framework, which will be posted separately.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4
      commit: 1b8595f4cc9f4029d11ea1957a4c9b4bce3f6872
[2/5] phy: core: Define TBT phy_mode
      commit: bc70554e6294d71fde45895223881a4ac3769630
[3/5] phy: qualcomm: qmp-combo: Add preliminary USB4 support
      commit: bb8955305318217526e6f9e93ee150888d91d4ea
[4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa
      commit: 0e1288af882068dbaf6e64808ba23c95a80dc916

Best regards,
-- 
~Vinod


