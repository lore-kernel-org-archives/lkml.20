Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AF13EC81F;
	Tue, 29 Sep 2026 03:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651793; cv=none; b=bMfxq5nNcoUXDQAz3YuY0VKD0aZVtYRQ2BzoIw/7IrlR0x8NJK+eqBxy0pZOhRZiEyiKEblGzHc6bfWr5YPkAXErEz3xO9pbhpSLgbylgoZQCD/GEv8Ua8ltlP1JZ8zsE4xMvOkSlWMHulHnKEmOWja8Uj7CY6L/1VSxfcrHVI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651793; c=relaxed/simple;
	bh=gFnD220BeNKBUWaKsKf6HZQ/7TAwWBF1QceriBjugew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgHNJ0xPm81Q/L5f1Kg3DHAg4lSH+fIv1r6sLXRYwXDR2AvSx1K9TR6sW5dOWm4YYjqQC+g0A4XuAqYYT3vYi+oesDkFrLzoRDdVR/8sYSxoVNHE4K3wX4r8+UYBfgy9Ihz/gmETYb4EcQjpNAJJ0Ua5P/21IpdAzHaHPPPLF5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8Spwgqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8Spwgqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E7C1F0089D;
	Tue, 29 Sep 2026 03:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651788;
	bh=CRx6iCjOhvZ36aSsrBvUPVXU+lZVA+MgilIpEDBTfA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P8SpwgqxG4Ehec4N04CHAoeUu+dV644wnUf2oQ5yIR8nB6zm/uA8P2sAIXEiyfWHk
	 eevHODvcboKoxfJo6RfhXPhyyKQivRs41IuQqkZcGMaU4fGa/61WfOSTvOYyy3z4Z9
	 tm5IGKSkTnsQWDujf678BU6Hx9SD8laKuNcAZUr5YLq+f9+JDtInN4JMmiRdnL+i9R
	 XEwtoVM64ngFiUmr6rlzdUD1LakPQKf91xRNhgKIi1hhNGNsM7Ps/T4ACAnOabEoGv
	 yrPuTjexWVQEpsHF3+KWN+9ufyDbLdD8phjvwSizMXH+2I1tXSpkIveqQEjoZXxwFy
	 iWRgcG+gPtQMg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Snyders <robin@snyders.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: describe download mode register
Date: Mon, 28 Sep 2026 22:15:16 -0500
Message-ID: <179065170945.2673486.4604711400290292347.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-submit-sm8150-dload-v2-1-fb688ac4896b@snyders.xyz>
References: <20260811-submit-sm8150-dload-v2-1-fb688ac4896b@snyders.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Aug 2026 23:39:12 +0200, Robin Snyders wrote:
> The SM8150 SCM node does not describe the TCSR download-mode register.
> Without it, the SCM driver falls back to a firmware call and the
> mode cookie may remain set across a warm reset, causing the next boot to
> enter the Qualcomm crashdump transport.
> 
> Describe the TCSR window and point qcom,dload-mode at offset 0x13000,
> matching the layout used by SM8250 and other related Qualcomm platforms.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150: describe download mode register
      commit: ab6a07a8de6f4df3eecb733d0620019734592f31

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
