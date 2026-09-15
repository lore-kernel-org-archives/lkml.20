Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920E48595B;
	Tue, 15 Sep 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469960; cv=none; b=Cwq9WB3GvqBnA7hBMtBN2uE7mUh7OzUiv/p38eoehgta286F/v1a7YK0nB5uD+dx5d7U9mYl0EvRGk63rPKl0Z5wbyybo8IGjEMDBTJ/0dNLEBRq219mvEY4VzVWcRGFXArVQFMI0kf9Ri+I7OT7109oZ952kcpqQ4ZeXbmd1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469960; c=relaxed/simple;
	bh=aF+/jWL7BrMSn9ocSSMuGUikdYyJj1a1xjF8QzCB+PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIWRLE/hI6+fpscZ9VJqJaU+9b2gid7SnqhG8ZYevzXSbnCHatKCkdxHrHHyjxiJhoVXCm7/Wu4qvEbmsIlAIPcxQj7ECEe1fld+c8N0FbzrVVa7n91ZalSK5GeprrCaR/yuX6q1Msci6Py4hclmeUXmO8k3b+4pz8RyEtAThJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBIRcoWg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBIRcoWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476631F000FF;
	Tue, 15 Sep 2026 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469959;
	bh=TZgoU/EkIjltIePN3q47HP94wUWzM3rxP491tzvod2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cBIRcoWgAGO+r9TOqkyi7ymLDmu9jNXISWmmt7PhheFUODl3NWT3HBnNMUW0ELorS
	 P6ewnyxugrAuiJ5hc024YELa/KzZIw3OBASpLtnePzPymssIWE+Cyrl2nPnFWhHT+g
	 HSsuXv68xCrm10267sNFPLeOnyl5EEUMbv62rg1lBVZ6yHsRUGaj2BdI34tkhhBrXC
	 +sR2zprnxpub91yc8h41AQsiHaMQRFyYQ7CUJTAsVIgUpe4gVd2SrDjRQjlnhWi0hP
	 EYSpR0yjpUto1z9zC55ns6Zhdpv9HCARb/q88DUeH9tq+rB4ymDjcKqoxy0PgVMred
	 tgVghI92fpNUw==
Date: Tue, 15 Sep 2026 12:59:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Add more compatible for
 Eliza EVKs and SoMs
Message-ID: <20260915-meek-beautiful-fulmar-ca97ad@quoll>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
 <20260914-dts-qcom-eliza-add-ufs-variant-v1-1-78b3249eae61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-1-78b3249eae61@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 01:44:48PM +0300, Abel Vesa wrote:
> There are currently two different Eliza CQS SoMs. One comes with eMMC
> and the other with UFS. So the Eliza CQS EVK can be connected to each
> one of these SoMs.
> 
> So document the eMMC and UFS compatibles for each type of board and SoM.
> 
> Neither the CQS SoMs nor their corresponding EVKs have been made publicly
> available. Therefore, replacing the generic compatible strings with
> storage-specific ones does not affect any user.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

