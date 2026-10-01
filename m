Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D98A51FCB9;
	Thu,  1 Oct 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865574; cv=none; b=uXI/Fcr4pZv1mfJJeaipl5OMuRauhHNHNsV3V1nK9qz6TzFJPy/QcTLg3PLyhOFHzlb/TepwXN2nLTHbAV/QpkU86x4n+X4v1kIrAvR2VE3xtqPatZNJJHPnOvyXUlEa/SUYyNEzNrD8cikyfyVG2aTNYa5N0kP19lQSnU6hWs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865574; c=relaxed/simple;
	bh=7h9hKvesZmlqcadSmk4Q0egzCWpD8hQda/fMKgmmXEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RlZqWcwwFKEPYBwR+dUgAXsJeAxVY9b1A2Om+LHr3SXAsjYrKRHsREq22ABYYFt/qK8bDku1x9WtHsVHKzhBAJ0VRmrnWpRl2idJnv6pVe8lj4WADb9fz+KogdxJndBtFgQNfyuw0trykmRLB/jmLBhiyc4WUOEcs3nZF5692xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpV6WjgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpV6WjgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423541F0089C;
	Thu,  1 Oct 2026 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865568;
	bh=/W3cVoNdz2l6010A7FgcRlkl5IhugN/iIeQjbdTNQ78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jpV6WjgZFq4BOECdnx+AJMncJxgHuf84odp5PmW/cxTVeB/JWesDFJb8d5/Du/ccL
	 /BnVuGc7zS2rhYzpS7FV5QNtqcvQlPavP7Q5XOXunRi5h9eiLrB30p2b6XySX2LBMx
	 OsYhwDTjUDTwRVYnEn701EUP7DxH5Aj4M338uAZmRxa0ImgSReEkTTSWqCDv812JDY
	 8mj6cIIxl4eE4gCJ0jtSwkaWCB2FCdppw/7sXPq+kpCMIk8oeP8l4PY7GYICMPay8O
	 Cd1mdFDTjF4Dh9fcCnvD61tCMPaWNbotev/J1wMJeuhg/8pUJ2XVdLymXgFvQbD4cv
	 qpotkIgZrfzVA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: Support Retroid Pocket QCS8550 Devices
Date: Thu,  1 Oct 2026 09:39:11 -0500
Message-ID: <179086553002.3495936.2976297736260325000.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 29 Aug 2026 14:35:30 -0500, Aaron Kling wrote:
> This specifically includes:
> * Nova
> * RP6
> 
> Retroid Pocket is effectively a sister company/brand to AYN. They are
> both under Moorechip and all hardware designs are handled by Moorechip.
> Thus the electrical designs are largely shared within a SoC generation.
> Hence these include the AYN QCS8550 common dtsi. As such, this series
> depends on the AYN QCS8550 series [0].
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: Add Retroid Pocket Nova
      commit: d4b2991e1d1985e0d502539a6c9ad670f209a885

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
