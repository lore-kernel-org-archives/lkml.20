Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F6F36B05E;
	Tue, 29 Sep 2026 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651767; cv=none; b=nMWSfSbmumEUILMJtJYaVmQad+7mMXiJlHGbnZsDhAf5HeVFnI99jYvIvYG2q9Bh16Ku3HrxwSZEgmtN53VrSa+Q6OmWrAxSsy5N1ajj4tYfpNMykTSS1wilowYX6Vqf/KR6Jg6wd4HQiD5np3i78qGvPII8IEST96gIl8W+z/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651767; c=relaxed/simple;
	bh=hju7fmVr5beWL9ObBKJNEqiuBcMmD/ptzl58shw3Khs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVuoZCsUpSHuIDVzTh5Xe3e8vHd/XbjAV19OkG8xdQERJqhOmx0uFDqfW3KHlckLIag75KCdj+YXq0zX1upzhPmBfs0+bY9iHqAuJCmftOT8eunsWvgbsVsK0292NDFI+Nhnlidxd2iB1C4R5ewT4gucLkpBYu51Ze1X1+tXr7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Flmh+uta; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Flmh+uta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFE81F000FF;
	Tue, 29 Sep 2026 03:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651762;
	bh=oSqxqfkiwxkEV4R+J00FZMeBLNw7rApoXOP0iDd3K7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Flmh+utaCXb0pssTdDeyISnPHxdBMFZcXoi92ONaLDTLfgB4ItOqI7odOs8fo01uu
	 +1tCpVcx4pzxztt6nZ8G2ofOmAtzYiLcU10k9bOmyElVsHema/jFYwEjE28DqyFU3x
	 +vpx7zU2/2v7wnZqlUnygmID6ctm2A77esX/qD/QyRUc6BSRRwmwsFwVS61fTd2c7l
	 DCoibEXm3LggDuwaoM1hbo7spd8QiN9AHxkCeSiHNLLfVBedi7hfm4g6MFkRUf0Iw1
	 tUsJaITu1RZv0nf1CLK7p69W5kQu/GdCeW7li9t+A13kGObWvSlyd2KsFtwrITKK2+
	 2luJ6oTJZIUlw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/2] Add DT Support for USB on Shikra
Date: Mon, 28 Sep 2026 22:14:56 -0500
Message-ID: <179065170997.2673486.15416018784166510001.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
References: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Aug 2026 16:29:06 +0530, Krishna Kurapati wrote:
> Shikra has two USB controllers. Adding both USB controllers support
> in device mode in this series.
> 
> Changes in v7:
> - Rebased on top of latest for-next branch
> - Added Mani's tag from cover letter to both the induvidual patches.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: Enable USB controllers on Shikra platforms
      commit: 9b8dc188ffa62e053b0d0fc3ccca76cad62213b0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
