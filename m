Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554703FE37B;
	Sat,  3 Oct 2026 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020207; cv=none; b=mt05lGTTjsvjNzNjDPoiONy8kdyMPd/qUrg7UA+66bEbGY02OgVPyX+aYqSl5Evi4RG9YhInvxGtsLbVGlcjxtsDeQl6oR5AbNWZrP324aW2dV5GF4eTS4CPMGljwiEsJINjIwKxNkVXvBYUQ/iKP2f4dxHEboGLkwYOHDflJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020207; c=relaxed/simple;
	bh=IAzQ6YyJaFUbvFuAdsvS0c4z4t6nqvju//dDcrqXvYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b6QVrhuARdPYjm+oY8gNHbNjgH7s9em0ziKLREIws1gk1nLhxt+HzpoeOWvfrbUSXTCVG2wGlbffuAtjeVbXQeExshJ2cZx3LZUuAKqMR6G6wcCZuNK1q2PrBKzeiXMMWLzqvsavjNJJ1D9y07RsxigWWcVGb+xlDmefi+X0kaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJVt/tm5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJVt/tm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865411F0089B;
	Sat,  3 Oct 2026 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791020202;
	bh=sp6YDd78O/820ItCyYBtjYCAruI3E5mR39oKNIwVpgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eJVt/tm5zzliv5fQfmpC/C8fZR6Rgx/PyUWwtkjDpzTyxO3e2BJLg8cYr+xwhtlrx
	 NDZM/pGdpdslda30APqNy0X/GsS0gzZwFmQZbc7oZP1fSSOiYCLZiL5M5YnNnaW4iL
	 B5mx+c6UI6OquA2kHW5XFjdL1aNxZyhp28mQHBVt3gC0oj/jJTwYmzDEH7O8FIoxH9
	 LPSBkU3xaRQAf6UL2P1TEgvHcaiuHC/lG+bpl2MjVPo5WjIMDgTxfRYc6tztvEvDU7
	 RTzlLjXwAUjL3aVP+M5E/FgZbI3821vsgu6nqN/AmpVK4YVcqSkvZ3WaRuwk3OiKDb
	 MUnIA98scj5lQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260917-vdev_next-20260916_dt-v4-1-e2f22f67646e@oss.qualcomm.com>
References: <20260917-vdev_next-20260916_dt-v4-1-e2f22f67646e@oss.qualcomm.com>
Subject: Re: [PATCH v4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
Message-Id: <179102019925.199361.12695470504373601173.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 11:36:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 17 Sep 2026 16:32:35 +0530, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> Maili reuses the Hawi QMP PCIe PHY hardware, so the compatibles use
> the two-item fallback format with Hawi as the fallback:
> 
>   qcom,maili-qmp-gen3x2-pcie-phy -> qcom,hawi-qmp-gen3x2-pcie-phy
>   qcom,maili-qmp-gen4x1-pcie-phy -> qcom,hawi-qmp-gen4x1-pcie-phy
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili PCIe PHY compatibles
      commit: 926da02a917dec4b5188b76118318b471f14dbe0

Best regards,
-- 
~Vinod


