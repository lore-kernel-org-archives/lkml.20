Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961013803CC;
	Mon,  7 Sep 2026 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769280; cv=none; b=WsFO8xECikbujg8zEVZVBSqIDbJDw9miHyKArvi2beIdCAimrLaAmIox9DANdW+VkSibeNHOTWV+Oc6XaLX5A39tXx/A7M26uOGATj9Td5IpIgiwjwFDXgcbf26vJ58Q8YGRqdfZI7tcMLx9AM0S8KbVe3wGhIXrTKbxOMsg+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769280; c=relaxed/simple;
	bh=EtQbyHNtFwRBDJ5DR94m+gFhR2kj0w8+aBLhFk7nAcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abzoFfaI0aFbiBWDsl3Rvk8HIZ6WJn8I96NdlER0IPXjqFwFHj3tRxQ+hOZmTIoyGkWVbj6rzstszyQdxsd2iiPJ45JF1RknL/Sq/5k7gL9YVGkYi9RQmG26BYbvavMipn5a35Yla5BtlW0JIrnY3rBpDeaRjZrjaS+s5wPV8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGo9lLmy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGo9lLmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5323B1F00A3A;
	Mon,  7 Sep 2026 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788769278;
	bh=XhQ8q1GW1JD9svGl3jm3Smsd4n0YqkISROWUF60PrpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WGo9lLmyEdKB+YoCMh3HeOOzS8e4hcAJ32ahG3kvfFpYg2G+tEsJDQEz2d/a7ygwx
	 rnyO7L0aLKEyEEL4pUWOa5ZSy7Igo1smC9oeLTOL/jWt0qc0Nj8pK974PcpilzTn1q
	 DYMt77UKMB69SdgBKrCXNPSiDAljPpXbONW325GXIjhJxTYI/bX6rx8sDgM/HEUlAo
	 hstULHAzuWRJ0yn4bwuYONBDq4wrRHLQDMb2dTyS96KIMUMW5XFn+HosfV7WKYzloo
	 QfLkEfsRmm9Toh5IrHI4uRbCpz5Qtk3KE/Bm7Kv8NgiLKHq97w3rZd81VotLpZUW1s
	 lF8xVFggR7KTg==
Date: Mon, 7 Sep 2026 10:21:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
Message-ID: <20260907-uppish-aggressive-moose-a096d5@quoll>
References: <20260903-vdev_next-20260902_new_post-v3-1-108223cbcc10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903-vdev_next-20260902_new_post-v3-1-108223cbcc10@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 10:56:00AM +0530, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> Maili reuses the Hawi QMP PCIe PHY hardware, so the compatibles use
> the two-item fallback format with Hawi as the fallback:
> 
>   qcom,maili-qmp-gen3x2-pcie-phy -> qcom,hawi-qmp-gen3x2-pcie-phy
>   qcom,maili-qmp-gen4x1-pcie-phy -> qcom,hawi-qmp-gen4x1-pcie-phy
> 
> Since the allOf conditions use 'contains:' to match against the
> compatible array, and Maili nodes always carry the Hawi fallback
> string as the second compatible.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

