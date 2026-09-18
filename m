Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A32F7EF2;
	Fri, 18 Sep 2026 01:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696207; cv=none; b=aOCCni7MP3Yp6Zo5GHQKA/XKSs4wvFNMc8+/XpYmd5HtgP6D3iGB74v/pm5/n4X2r4kFmdzIdRRjszwE2oONucI++vaZdwqX/h6oySgNheAYCjja0BfwYv82siw/18OU/2y4Rgnz5nOYKhsIM2yVjkTwrdpRJ30j5LXkwi9tWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696207; c=relaxed/simple;
	bh=1rWSrOJFXhSNckNQHskwWsAqQPahOr3k7hmiaLkgjVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ct0EuoyMuReLA3y5hhJJLECGCRoM7U17Acjn1EMuP/ZZlViCKMMTG7h2wjwZ2i4v85mVolL4ac3Fp4Igh6fGIjme2wuKklA7cDqFs8jB2u09XRNGYA27r/JhNXNnHDDMPZpE1RR2lX8xkxSiMZMUEQAmfcu6wVba0vvY3dk1PIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcBXDfFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcBXDfFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119EE1F0089C;
	Fri, 18 Sep 2026 01:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696199;
	bh=IwTMpGPl6hX5qtbuIoB+Tp1nOI7fnUx8936+g94Tn40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KcBXDfFSLMXG2uKAY3a6rjWxYn5FQLYat9OiHfPulX5hgVojVh5fPKykfxWg9Uodr
	 I+H27+D+RKc+1ArAXQo+ujPY3h5l1Bil8HtHcTCyBwPB7azjZAZQ0KWPCFV07Bn+Ux
	 W2Sm2XcewVYQRem3Bl028k/1wIhI70bILjPssoxWiU78dUtoilYupe/NhhMOF4hU6J
	 6C56paIjB38B8+nPINdIF6k0+uHGuB9AEOku4sJ84K0SYMFsYwH8lDkPz63W9ocprm
	 9yl9Np0Cnk3kLsyKmhwHFRlGezEJdlHu4bYIOr0BzyfF99WbCCo7dGzELlyzwQ6qdO
	 Da+8AtwDd9dKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Mika Westerberg <westeri@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] USB4 mode programming for QMMPHY on X1E
Date: Thu, 17 Sep 2026 20:49:48 -0500
Message-ID: <178969618813.1582337.148852121014416119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


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

[5/5] arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4
      commit: 1360126eeb38872b68f5b89d793bd28e328224fd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
