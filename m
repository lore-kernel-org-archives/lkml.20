Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC23F20E8;
	Tue, 29 Sep 2026 03:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651790; cv=none; b=uj8dSg5YJsqzc9qdmz5Ai8PXHZYvki5ueoqG/xaNKeRNuv0vepr2pz7kGGONRa1ydbvS6IZfQA1c7vHIZq6D/uKq2jsfsy4A+TnLKv7bgNDfoSef1w1BOH/IW6B3/uSgdhaMFvyWi5eb2m1ftTIyZLJJbiyEMUrRab31rGCgS9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651790; c=relaxed/simple;
	bh=b5RJ9sSRvN8nN6kM7idvsBgWlwAFW0tRfpe2+ixWxLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f6crI+x8+c/ViwoT64lvMfS8mFRIrLkMTCc6wpcU14FeuWpQlJI7UyLpRXUQvUp9S1ZPmzhSwXSeW9hZTorvJCAhPHRfFIXfWk/2C6FnxpgVb8SQBXZrCpEYTMWHUewtCVbmzUKXKGv9agAnKWi1XO1DWwl5d6bM/YzZ23VCHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxR/+LNM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxR/+LNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6681F00893;
	Tue, 29 Sep 2026 03:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651780;
	bh=Bs6ATfsBCrf3p90aWKR9HsITJdWOgHW1hvwEyCOXOcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LxR/+LNMidOYwTotQglBPeoZsoWwW6HNZ6dTj1eOKlWt3F4xgIEQ+V6r08xaAwSRj
	 UoTneGJvFDLpJwGiGRGAgNrYQCAbo/MgeHLQtJLBEWwCJnaRtczNREVxT1MVBs32in
	 JnrX98cNTCxUQTogsf2rW0tPeQO7KIz8cMV8YmTdmE8qKDSXn/6C0gxdZd+9kwqgjP
	 DyGZU8ytoakaH5IsuYbEeOwyr6csl0h9iwcjsegfoFowch7HJI5fMkojgb4swb6tll
	 80D2Yhv3lqRgnJin+Q4ioAAM30GBj6tFPSb4Fd10aue4uJwZpVclOstmfS+3dHTxXD
	 4upOcbeaZTi7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Yijie Yang <quic_yijiyang@quicinc.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] Fix regulator voting for the Qualcomm SGMII SerDes PHY
Date: Mon, 28 Sep 2026 22:15:11 -0500
Message-ID: <179065170929.2673486.4107059427681942662.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Aug 2026 00:57:56 +0530, Mohd Ayaan Anwar wrote:
> This is a long overdue v2 of the original patch series which tried to
> address a SerDes power-up failure observed on the QCS8300 Ride board
> using the phy-qcom-sgmii-eth driver. After going through a rabbit hole
> of hardware schematics and power data, I now have a fuller picture of
> this IP.
> 
> The Qualcomm SGMII SerDes PHY (used in Lemans and Monaco SoCs) is
> powered by two voltage rails. The schematics call them vdda-0p9 and
> vdda-1p2, so that's what we follow in the series. Additionally, the
> 0.9V regulator draws a peak current of 46 mA and the 1.2V regulator
> draws a peak current of 15 mA.
> 
> [...]

Applied, thanks!

[3/6] arm64: dts: qcom: lemans-evk: fix SerDes PHY regulator supplies
      commit: 457cf65a7997e398d8d6cef08601b4ea61b58e38
[4/6] arm64: dts: qcom: lemans-ride-common: fix SerDes PHY regulator supplies
      commit: 0d567fb7def9564d15c334ec0fa5f5f6a0114ffa
[5/6] arm64: dts: qcom: monaco-evk: fix SerDes PHY regulator supplies
      commit: de7bc562fc363421902db7bdda8e347cc78a5173
[6/6] arm64: dts: qcom: qcs8300-ride: fix SerDes PHY regulator supplies
      commit: e55080f068f3f6b733235fd7618c12e61744244b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
