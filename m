Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D182F44064C;
	Wed,  9 Sep 2026 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940411; cv=none; b=OhOVliJC0Uzy7h+uvtzbWrgeAMA6p0aA/KudtqiV7g1z/v/cHbCozXP6mSe2MDGWs/kPkyKZsRZzFsUz7l6igdNQ/KFQz6PjTcCnoKgDkhwaZu2i0l18PbFLA/pWJt+7d7/paU3HhEf34ncoK3P1AKmw6/9mOvv22jOMZf+XG0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940411; c=relaxed/simple;
	bh=x9KYylfx4n9GNizv7ZL5K18ekt43EBNRaBZCXK11Z7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVRdkpThks84Y0Eb4S8VbRwYdDVDoEqoFPnxs6d5RH3bvMsJXqTgI4g2Lth77Ei5E5bBixd6R+xnCgQJxenS3hrsOARX5yEGLWp4UtlPmUFYupP+nMHQbNP0Iv7+U0H+lTdisPDkYlnH+TiNR6KFgLkHJ00Y0a1aNNo0EdxhHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvV12oRV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvV12oRV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5051F00A3A;
	Wed,  9 Sep 2026 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940410;
	bh=k4/z6hakxh5vmgNRTILsfazf4icJ9zP2XEDjXIs2/n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JvV12oRVOWEaeLiGcKYwlGj1CDH08BRqSpRtxxCmGH9lthABYlGG4G1nuRVP/Jirm
	 km1qq6gsWiHYzuZm+Uh+X3W2nuAmXX54AUVReNWHQbI4mUM5KGNEZRKMb9KRVFOwNn
	 6vYvZwqLtpTswU6hk4NoVKutQlvJc61UQc3SzT+UCYWfmi/25LCce2JesbojclFf7E
	 YrPzUEkurJEazcyOxxgH+FiG4iBSUXaIU+TQ3mG/D7M+Y8EQiMq5fVA1UecM1l7z1L
	 p0R8EES4/heYrjnymzFQjqVIF15QWkC9Ld2MSsV6NflQrjhH5xmXSmMdv+j+6x0Ybz
	 g5beNiwYWEiqQ==
Date: Wed, 9 Sep 2026 09:53:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Lenovo Ideapad Slim 5
 variants
Message-ID: <20260909-brass-sloth-of-election-8b14f5@quoll>
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-1-7ccffbe6bc4a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-x1-ideapad-slim5x-v1-1-7ccffbe6bc4a@oldschoolsolutions.biz>

On Sun, Sep 06, 2026 at 02:22:36PM +0200, Jens Glathe wrote:
> Document the Lenovo IdeaPad Slim 5x 14Q8X9 (machine type 83HL),
> a Snapdragon X Plus X1P42100 (Purwa) clamshell.
> 
> The chassis is sold with either an LCD panel that needs a PWM
> backlight or an OLED panel that does not, so give each SKU its
> own compatible. Also add a generic "lenovo,ideapad-5" fallback
> for drivers that match a whole family, such as the QSEECOM
> allowlist.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

