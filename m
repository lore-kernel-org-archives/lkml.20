Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31343C05E;
	Fri, 11 Sep 2026 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116877; cv=none; b=qIEEOhP3O9h8RF2KwEcDJBI+D3AX0pEg7Jz/s3yMX4/+LMZ39XUvqOmNRopj5Z8UClg2UGLgHabDj/3A0It4no2nOYhiHIcRNzW0u2tnzjYfc2mMrrSKuV0800d4n5uyYb/u5ibewoE6qXQa12dGT7XM+9g7zJKnAXzWflzTIBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116877; c=relaxed/simple;
	bh=S+IOnRAzn0HEhRezQcZaqdQv+DKo9ccT7Vm1TjxraZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RemwSHB6PGEoynE81atKnTNEkdbPz9xkYmb8r5Q7Om0f3C/F15E0ui1tEHMoioFzvWsOgk+uROKm0JgBzJr1U+i6qvqdYaUA8NDDlWkLtPzUjqi/m/JiPYeDQHGohdBP1SYpku6WieLoO8dt1sDuAacKHr8SDom3Sn5Kh2BMe8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M17fYOsI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M17fYOsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB7D1F000FF;
	Fri, 11 Sep 2026 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116876;
	bh=axI769Vv5BFmqCI3h4IulKwS2TumJtNo7qBVNkXuts0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M17fYOsIiy4NHsMz2YWAngONoxDaCpU3rH6sufpQlRu7EcsTzEsVM3Vk/kq4JT9JU
	 w63xH64phVR+pdJxPBVKHmzOuXmlOyfZ4UWJE78otws0r85kr34WZiN4oHQ9VDYVJL
	 4nFNwNyZb4tPbhT2rLM+Vslqy2gcb9qPoWdEoZVB//YQ+L2EgALwy9s/EpKir2nYqW
	 dz0vY7SNfW+WKP/T8KhhmgaYaTOpOnEWLCfcx0PigSlcTZZiOHR++h2BUjCMxtl/mm
	 4zcVc1oB+5b8YZJi7pPAisey3mBjsbqajLtcuMkj8aSyNfRY2OXiaYnmKlMZrpvvMe
	 2//5U3s8MeIyg==
Date: Fri, 11 Sep 2026 10:54:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Luca Weiss <luca.weiss@fairphone.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K
 support
Message-ID: <20260911-hippogriff-of-amusing-atheism-ff8cec@quoll>
References: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
 <20260910-b4-dw9800k_cleanup-v1-3-608255ea61ab@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-b4-dw9800k_cleanup-v1-3-608255ea61ab@fairphone.com>

On Thu, Sep 10, 2026 at 04:54:18PM +0200, Griffin Kroah-Hartman wrote:
> Update the node for the DW9800K to have the correct attributes.
> 
> Now we correctly select SAC3 mode and other attributes with the newly
> updated device tree bindings.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index fa4566df0a71..cc99590afe3a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -744,8 +744,9 @@ camera_imx858_dw9800k: actuator@e {
>  		reg = <0x0e>;
>  		vdd-supply = <&vreg_afvdd_2p8>;
>  
> -		dongwoon,sac-mode = <1>;
> -		dongwoon,vcm-prescale = <16>;
> +		dongwoon,sac-mode = <3>;
> +		dongwoon,clock-presc = <0>;
> +		dongwoon,timing-control = <16>;

This breaks users of DTS without explanation why (impact). Was it
working or not? If yes, then why breaking users?

Best regards,
Krzysztof

