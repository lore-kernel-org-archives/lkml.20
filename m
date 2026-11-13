Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570146;
	b=ZzP8TAC6Tyv8WGzhjvMybPxP8zT60Qijxj6Y2KK0EXS9/s7PagkOeX5leVct8RZUNR+O
	 v10BmNhrslOhmS2ktatvhdEuNuIGBNj0JDlWzETQz9Gu4Cv4RoyS2ffGxK1rWEfaJENqe
	 T9BK+4xyTtKvcVNL8IxpOphcPrm8MHuEv27ZH1iziRthpC5mCk9NjIrNsEDwmTtAKmt0+
	 cX5WU6QkyW63rW0ccQELIGhpYHWA64wnTabLWUpXi0d0IcUcwmrEmcVaUfe9Eg1lavpHI
	 Xzaw7k9Q/B6zZyjsZM3Z16+tlIhnQUQar2po9KJZSf1oeFsGwwQHulfi8twa3BXcrNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570146;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/rJSjK/GGp52EewAII6DhWU/WqkSsjwUmQ8sgmlOduk=;
	b=e9+1PGwMUI6SCURDbZdm1MUAju+ZbcZ42NN19XiV9xTyEliIdKxftiOvvv/Adcc0cl3q
	 zFxpKgOWFtUiAcnPlKtcwzk5uKiokQbxNc2vS7VSUvws7R3M9hzdPIeRi4E/zGF8Z7/3V
	 kU/qMZ+DiWD5SMV1T1IdxDlTMUmRFeJ2yOYft7RqZkVkO52NeGZ6rwgxsDqRa1xomUits
	 UimxbPq5Crbe+Yfc6bFDiU8yQJNyGiC1+BjW4seJkMIlWhWe/1S3AW0iriKeNCjRVWLV+
	 K94Bt9jWcva/xKCyqXCDA2nZOSf1JGz1PbZzSPU9YhtYKJ38x+KskWZmO3u8SfXbJQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAx2Abfm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B22606A88D;
	Fri, 13 Nov 2026 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAx2Abfm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792661F000C5;
	Fri, 13 Nov 2026 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794570146;
	bh=/rJSjK/GGp52EewAII6DhWU/WqkSsjwUmQ8sgmlOduk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAx2AbfmbHXvjJyDY4x/xm1epLVEdK95o8n2snYs5px4o1OKF5OMVPa+Kc02xvMuh
	 piSRAnGWONJhi206xuJKYm/rf3U9sNcR8hK+IjqxFMSmtdmNSWkU7lXZOf0pyyoMcX
	 dlWAwST/oZkq0dN7avMdygaSfQ6Z6J2CR51H9YAO24kuj0dNCIzc6nYSICyHnTtz3P
	 fH4cMsRo+BAaIttJ7rGNDS+g36czZf4DoKHSVbgFGIkURYr/3RUUFR4jW+CXQL4hrA
	 srND1GnI1Wc8JXlVmtfah/SEBs22JAfwAWZvcXjS5t3q3GDt54rCimNvUD/C0itViG
	 mG9CrxyPYPv8w==
Date: Fri, 13 Nov 2026 12:42:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon compatible
Message-ID: <20261113-intelligent-mahogany-starling-51ae7d@quoll>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>

On Thu, Nov 12, 2026 at 02:26:40PM -0600, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles. Add
> "qcom,msm8996-saw3" compatible to the MSM8996 SAW3 syscon block.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

