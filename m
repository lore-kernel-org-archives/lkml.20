Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2203CE0B4;
	Thu, 10 Sep 2026 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029889; cv=none; b=dE2Kq7OQGdqo9TPgANfTrmqqINuPZdv0H5cECsgjMMj4nkRm5brKn3NFviup4ymTF395qLsXCNSJJ63AmMQO/XFd/HrNPzsZwhZDghff8uaN6uHBF4uSegCERKKVmxVws2V53AgCetCOSr6cwFOgOZvbALZJqFIidnKx4SOAmNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029889; c=relaxed/simple;
	bh=6steEaS+aSY98rjuCle32JR/iEK4/3aZjQXaMN98YL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pf8Q+GD6GElXc8KCSQMnPTDRmvEA2m7svWsYLsfW83QU3/We+o2f5yxs9I2xuCf79fAeVcRPUKssbgNAcqiVdW93O24Wwz58hqfkgjCkuKY3jJrmCu0vnKVk+HyTudAh/am58Hu1nvogJr9G6s9Kg7DoH5gSrgYA/whnSK/rtVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orqnU6VV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orqnU6VV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB4C1F000FF;
	Thu, 10 Sep 2026 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029888;
	bh=Z6byc5daEPIFpWPF0nVQCstwhnFg/6jrnpDZCl6MYkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=orqnU6VV4icNRRtzJ/FJcCepKryxrvY/QYdmWEcZXQ79iSyDpdnIvtPv2FuWOSyyB
	 AxdSpxKrX1xjIeRX7l6ehjP/l0E8mua6D9w0Hf7MZ1D9wm569p2fJbnQHgr87wNjIS
	 Fjcu6EAV0W4gMJQYplo94xNSzowXWOmK8CNvBEi/8w6tD4UpR28rh7f9kK0IKQUOqv
	 N3Nm955PlQnKPZaCkJJcEYMxAdafV6Sv9xhUcq45CeFJWi+dzOt9OseI+yAstOIESf
	 nynUUAtyHyys6p5hl3WEPx2+wowGQ4IUwkSbbmRIgGNDFQS0s9ns0bujqb8ELq9WKY
	 qc8ILTBSiCS0Q==
Date: Thu, 10 Sep 2026 10:44:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 02/13] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Message-ID: <20260910-zippy-abiding-anteater-a5f1bb@quoll>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-2-067f2ecc4630@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-2-067f2ecc4630@linaro.org>

On Sun, Sep 06, 2026 at 03:20:47PM +0100, Bryan O'Donoghue wrote:
> The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
> described as standalone phy nodes carrying their own supplies, in which
> case the CAMSS node has none. Make the supplies optional; existing DTS
> remain valid.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

