Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877517;
	b=LZ8vNagJl7VRFLKw3yKGipSkzi1QlhQPkjBuOi263qsNnc7EQNCRHyGU1zwOpxIyc2O9
	 /Y9ngSYOKovdnttwGrRLykcEYaoUBfyXvckagkssPzp0Z2bgBP3TaJVO3F3pUCX53PER6
	 OUPIf7a3X1agPslCxpLYL2hUNaAKy72ENwB2rCTH+CzcjW/lyWFMdQ9e8UqNX5ebadzX8
	 A1QjfwLlGiSUHIIGhgvnl2qrQAij5bpb3boKUqVoGJ392d41jZ5B5cSZH6CjQcmkgM4eV
	 PGw0sL1gcbw8ae2gwdgBuwfyHvjrJFi2YCBMrfkYs7dVda0UjDz5lbMM40sIK6U6hwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877517;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=t2JM5GCECTkMdM3S+MJpk56aIu7bFWfVAUq5lccAk5o=;
	b=gUv1KGmksTXS+nyaT//GQOP9H6rbdg4iZxfE1NOG7nobu9/QcgzsDE+bMzs4OmKK13KZ
	 KcfbTBTFsgLlzZNhdnLj0Lw3qSinPE1cuV4yuN03QDL8Om9WWs9L2ii0sHZxZcoVbQVaD
	 3qkc1Ni/i6FTjLEpIfvuMfiHbprtqVx10qCGcp4pmPboQDPZnxuq3CfXkTFaDvdDJF6uD
	 vC1Uc/zGM8iIGfzWeUl1ngU28btIXubP2xhldYOjjdgalPDb0iMDwDGCF9z+R3F7V2dOo
	 0GiQkQL4kiLkVBOFG3T9G+9tnl0TcD2Z6gQBN+vGlLAuvYUEf0JUa9RWwO0BEoWy/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A4lKAN/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73E606A330;
	Tue, 17 Nov 2026 01:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4lKAN/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657631F000C4;
	Tue, 17 Nov 2026 01:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877516;
	bh=t2JM5GCECTkMdM3S+MJpk56aIu7bFWfVAUq5lccAk5o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=A4lKAN/LGZVzhwYKQJM0fKcJSTSH2zx+1uuV7kQ6ytSoWP+Jmkfit3Pb6fluFP6HO
	 URy5FutMhwT5baHbX6qPXZ/RnDrns1hsLogu2WnGXfcytun5cRponp4d7thBkZRKNz
	 EFqR5LaIg4trtKcu96bxLRZECESKL486UeIKE1MfbYpTuG13qCQPm5I6XtWoBYq+eP
	 ilW+UVj2y2oft1VQs1dnEJmraf/dmbkwTZoKzSb7od431g3qKLD1rWcVVPP3mmffm/
	 LdJ/FKclruaPYhQ05rh4hUX242OFm86UYI0+Hhd2p1ABFBdtQQduv2YHQA5WKdcRdQ
	 yr909Z5YJGuQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: Correct white-space style
Date: Mon, 16 Nov 2026 19:04:48 -0600
Message-ID: <179487749339.432567.6694138389097894424.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Nov 2026 19:54:27 +0100, Krzysztof Kozlowski wrote:
> Correct minor style issues around white-spaces (e.g. double space before
> '=', missing space before bracket, spaces used for indentation) to fix
> dt-style-check warnings like:
> 
>   monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: Correct white-space style
      commit: c4ec9fced70f2445d11cf77dbb04f5c01d0cf9ae
[2/2] arm64: dts: qcom: qcs8550-ayntec: Use hyphens for nodenames
      commit: dc607958bc6a13a212a947cd3a29acc704b8c446

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
