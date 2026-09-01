Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7E47607D;
	Tue,  1 Sep 2026 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251579; cv=none; b=uqwIN8QDM1YPYISyrDP3Cj1q571dcb9neQ4jehq67Y0Syn6a08smLJnXieDwVGokhsKHGEZPIgmLWH7JYPhLtYGP11fxCjS6Y6Jj/dIa+GAV4VsRnda/SlFQPv9PQ/1XfBMGkz/C7Ci0gF5N9Q76tP2Q5F0tt/ZmJirTsWKV11I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251579; c=relaxed/simple;
	bh=EgjDhgFyMni25klrKO9jIuwouO4j7guTLuXxIqA2XF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyxPdEMaWQaoL6BoDS2EP7+x9ORVp7rAA3Z2LGxStp3qsKwiMxTpOIwViVGPQ77rfQ81t2iPQGh7x3EycfXhgzCy2en81vvjngySKmk1Uu/nfBzWx25bF8D4wqn78jkdspKdAWiaxAMCNoX/cRNnNPZtfs50TAQHKMfRyj4vePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/lXPJpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/lXPJpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709CA1F0155A;
	Tue,  1 Sep 2026 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788251577;
	bh=tVqAdRiwsscVg9/5BdwHOi7+Rnmf/8eb7NqTymDseoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G/lXPJppa0wK33NEpx1p4XsCwCAXAbZGZSfEk23nBBZU/KU/Bn//gPsf/4gvZhsdH
	 goqo6HAk8HKuzmk1ulmZuHDaDzg43YEtuJcRE71rvuLBU6DjMtQGKWYUZ7OH8pBbon
	 cvukd1/RZC9ZmyXKEbDXlSgxKKVU+y0Z3nPYhVlAGagQ2stCwg4iWy2NnoN1kdNFsY
	 xtF9PNBIWNRJyyNd0nsFFJ0wPYLF5GjPMBLDfH20Coz5K9eqCCnOwudhfCZddNQgmT
	 F0hNjW0lvuCfOeKxu84kzZplHI8yd72pXbDVSKQF7XCfl9Qfn466H12KGQh+x3En12
	 sL8QNWzB9tc1A==
Date: Tue, 1 Sep 2026 10:32:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
Message-ID: <20260901-auspicious-shaggy-crocodile-ae1eda@quoll>
References: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>

On Mon, Aug 31, 2026 at 11:55:01AM +0530, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
> architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.

What exactly did you reuse? I don't see a fallback.

Best regards,
Krzysztof

