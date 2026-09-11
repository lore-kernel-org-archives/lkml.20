Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C429CB52;
	Fri, 11 Sep 2026 04:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102604; cv=none; b=XQwQEtmdEZte7O/289eJgAjDGvIGUW4uyRYZiVM9oCTJvRVsxdTCBnu/TrR2jXNGEpSYIJq+l7rQs6smOQ09LKZAAzGAqIIyZOghgXvN0oQtlXWCJsc8+p5Y3QnKdW0CMGbSGZLVBryjMJ8oOxKvdNYuudq+oeFgy9+X1XloNy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102604; c=relaxed/simple;
	bh=5wUT9/yVzaXzqnptBTsbIQrOCupjDg0CdAE0/AjMBUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qre8hG6wF3YNsNdz230MJ13jV83iQQ4oYG/aQwJUFCQchV0teLd3LWHJagiHyg57HH9Z9J+rfAPh3/rGB9L4puE2ZQZpgcwvGYwgkNN8CbketjdjgimcydChwtL9xkdKuTYYAlsIZQY8zeSryyqQsGXpSekE+3X/UGbpRNOmtiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4ynQ1f+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4ynQ1f+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7991F000FF;
	Fri, 11 Sep 2026 04:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102603;
	bh=lj6aVxoJqLc06NcA5pIhaMgG7TQ1dAPLKwXjdyvmoRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4ynQ1f+NBZB+/x5fIFn0JhStv2FNKuVRvxxN89UnSLHuXbh3z+p7YLdk2f7oSVNN
	 QtYPhEcrGhKHLJVFeYBkqWbn9AGZM4I5BGcxHfKT9arPcCCPESU4sS9CFrniRVPhni
	 pxa1HLnclRoJ9FLpLhzPSbQLK4OJOWoFD7omGy19QWG6RbzUaqLwkeUyeY4v/PGEIU
	 8Gj42ftabL94aDj/2G0265fmSbZmkd7JKM1zUW+f3IWReJR3Dez5ZyI/H0FVBe81we
	 e1NGlyDbCMvowdYId1WQWBXMZUIUs5HpkO/enUUXEn1f+p6BtYTvTEGhCDjlZ7dVJH
	 HmGJXaVjnbYwQ==
Date: Fri, 11 Sep 2026 06:56:36 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH 00/34] arm64: dts: qcom: Move PCIe phy/GPIOs to root port
 nodes and fix wake-gpios polarity
Message-ID: <3ebciwlwpjfidjgbep6rmle4m65zyn4tkbvfbxd2xabhe64bzx@ac3mkmtoatem>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 06:58:49PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe wake is active low signal as per the PCIe base spec, Several Qualcomm
> platform devicetrees incorrectly describe wake-gpios as GPIO_ACTIVE_HIGH.
> 
> The PCIe PHY references and PERST/WAKE GPIO properties are defined on a
> per-root-port basis and do not belong to the PCIe controller (RC)
> node. Keeping these properties at the controller level makes the
> description less accurate and prevents clean per-port customization.
> 
> This series moves the PHY references (phys, phy-names) from the PCIe
> controller node to the corresponding root port nodes (pcie@0), namely
> pcie0_port0, pcie1_port0, and pcie2_port0. Labels are added to these
> port nodes to enable board-level overrides where required.
> 
> Additionally, the PERST and WAKE GPIO properties are relocated from
> controller-level board overrides to their respective root port nodes
> in the board DTS files. As part of this change, 'perst-gpios' is renamed
> to 'reset-gpios' to align with the binding used in the PCIe root port
> context.
> 

Please split Root Port binding rework and WAKE# polarity fix to separate series.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
