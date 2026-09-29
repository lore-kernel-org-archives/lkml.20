Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1341A91B;
	Tue, 29 Sep 2026 03:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651761; cv=none; b=PprNCjZr3K/0Zh4CDAq/kejx0xDmCNrH/udUyKc4UOuBooz9w4MhgFVK8eMnL7we78ZWDSbkVChrU65k2UMJmxG+gTl4D6WgbHS04xkxOrO9Exv+Cvnwy6Rr7POzkV75/Er7c41eL6nD+fZg5wbmWjjIIXIJiO70CY8A/sm9XzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651761; c=relaxed/simple;
	bh=Fx1ohycEndk+RiPMSH8I7s2rXBEIc5lzkMWiPY24+SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QrynvA9edK7+BqqsjDqlQNB02k5q3zE6WHWp+2z1dnuoq979SBHOuQDoiwBKEWjOIvbjMBH1Gqh49QEEtL/6acv6ZXSTmkbPXaXnvbNmPdhdHgmBLQQ7d+xCWbO3sLUCX7Vs5Ap84/yLssoslltulH3KI3Q+Qxxt1SXZ4jIi3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMtayaRd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMtayaRd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EF01F0089C;
	Tue, 29 Sep 2026 03:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651756;
	bh=JK5oaGHzQSwb4x1mQBZMc9n+VUjjIc6ZMsu0aJKvYZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YMtayaRd8kqjG3ZJPxa/HzHNyTPJuOnWsWvw/DTFb1d723dc9Duye2oy4mPdoL24k
	 F6TBI13iT0k61B3stOUxSNVoJCB7o6luVggyWNEDcz5IQDLbA4IWufVjf1YE6x5TXc
	 NEG4yxBd5fiAXIJRXJmhgUwDGZ9pL+paAThLxLfeeD2ZBXEC9eAg6EX63lMMbDwsYB
	 D5CL/ONFmri9btB8HOI9DIBRn7tMs8sXqxyMw5UMaEkLxlL2YOL7E2JydApjnaSkyT
	 FSNjGVf94dpZgxnAX7BAU+U5ZjAOHdTq8ZVMbDqKhub+2N7SpKqCzhZroytAbOo257
	 vHJjT/K+z3MQw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v11 0/3] Add support to read the watchdog bootstatus from IMEM
Date: Mon, 28 Sep 2026 22:14:51 -0500
Message-ID: <179065170911.2673486.17100075980992917828.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jul 2026 21:17:34 +0530, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
> 
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: ipq5424: Add the IMEM node
      commit: 6baef5b6e13d74ddda929d3a9c40b855622205a1
[3/3] arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM
      commit: 68a2de06e17d12b3b552f2106fa21f5007abc7e5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
