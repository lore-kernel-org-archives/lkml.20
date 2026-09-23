Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD385803B5;
	Wed, 23 Sep 2026 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202029; cv=none; b=P1R1110WQ/V9a27pGrn4ohRWufup112EcuA3Dd8nBDT9bxLGI2CGRgw95Hbr/JHOyTr3ADaGYMJ7x7yrrPDbAN3v5O1wzHSFt4U0Ng4I/JkSNtvJB5kUJF9Ued7SgDgiITad8eAjHRlGE0byIX1BY2ujr3TyFAFbA4kns+p77u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202029; c=relaxed/simple;
	bh=VBvfXh3OxMhQW5PWLmlpZPwJ4vBj4cbCsArxC5qvYJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgLhzUzAbzUA4IR9gS59XDa+nZ5uSEDFf002SnDS6Ihwwm6atJyx+sINnOCYX3aVKuppd6UKU5zYWY88tgz2anoFTK0JQLwwaOjP3NjnbStJAfJwjNYw6NNp/Ust5Eb4iDYrU7MkEBtxa0/t+OJcB9SsD8G+GbAdKFLpHjHKxlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LooVIZ2L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LooVIZ2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5481A1F00893;
	Wed, 23 Sep 2026 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790202013;
	bh=QDPrmyLrRC7daQOOq+rbB5JDMdcA8I3KXkszgjVkMNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LooVIZ2L0gRVeCHY7mRkk0oVu8r18qAfjqzDHPD6U/caXwOcV5X2ZrfgFuokvnQMP
	 H7mkgshyzeXKLrM3hzkX69hWsNom+u6uNrTL6mh6DOalJd4Qcm2bdUKSVW6+ZxL9xy
	 1mh1D/6jhZO/a36NRMcdm9cwzL1EuhlpMUu4J7djITuIhsNzYL3xU0o0+3rfvbws3q
	 BATg4O5+W64ld8bLEVwWu2ACcQgOnSrCkDUk/OWBoy5hT5GahANPrVOC1vjCqITOe2
	 p/cvxsFodGvv9XJtxrorcQJ8+6i/Cu2YRx+O8iGVOcWRTlo6gZ0wdRq6JxMklli6XZ
	 qnlMJFxiuKj7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8650: add support from Valve Deckard headset
Date: Wed, 23 Sep 2026 17:20:00 -0500
Message-ID: <179020199810.520949.2159939294654871577.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Sep 2026 14:16:31 +0200, Neil Armstrong wrote:
> Document and add initial DeviceTree for the Valve "Steam Frame"
> codename Deckard. The Steam Frame is a virtual reality headset
> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
> 
> Product Website: [1]
> 
> Dependencies: None
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: document the Valve Deckard headset
      commit: 4fd9c69d68403e96f9e184d5b5d4ea187a632118
[2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree
      commit: 13e7bae9a442c8f3efcc3d773f9c8cb1a2c1f128

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
