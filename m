Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8247F793;
	Thu, 24 Sep 2026 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254928; cv=none; b=F6GvSs/gOd04mpLMoaGw4j5HnDwO+VO/ZUKeWEU/bAzaL90cL5ThJbk343tXmNe8rLuUirqYDGKUiQeAgAHm6WzX5pFsJ2G/GIEAuO4qX7OysREHlmt6rGmMfrNANMi0LkvjRw3KiOnUeYrRLwbzHDZuqA9R/dl51HSQcIr20cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254928; c=relaxed/simple;
	bh=fH1YlHdpVzJOv1MKPYJD038MGT4z5fvT8UETPtmncrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpCsDM908qhTKG2PgjSbZWoOnYSY59L2oReZcM4WpOi9N+KqAPp25MSN/Y3Pxhnv04G86SmV+ocE3VZoqfkMe1rfbvDY2vUTO1sGtYOFuRy4KN+oBUWMb0yigNiAIHGHN//DiG6+wbLGfzk8vrpr+gpoOc6gU34mr7cCnR/Ni6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONQNKred; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONQNKred"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213AA1F000FF;
	Thu, 24 Sep 2026 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790254926;
	bh=wSmjG+8ya7+DkDDhvWJ91+gvE0FCwI8vKpS9WlMFCkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ONQNKredBEDe/8UuXV9lszmQ4agu7kTAXy7lqmtEtEMYEnHCvguflvKtlJkaljGd7
	 gDKJleE90UOzklXylWPjrVvMYEQWpy1U2L/mmHavW2ei9lmeyv9TgS7YJzLNmbmMte
	 pz2EJluuKS9reRJmUiKtmftckrUgMnlPHtUrrxxcJBTCwaDZeHJSYXNuNL6LFilAuT
	 wtgJJLnm8KFisFiQ7Vh4cgiNytQxRyAEiWudCR9pJml4S/sqiopl/qBLGZAzvmA5G4
	 sfGu9zt78mBU34LhAGswRmF4OWA6pTzEZJ2fPCTmAnLgYkyuffNJlUS0rNpNFJMtPk
	 tvNH4vFd6/2uw==
Date: Thu, 24 Sep 2026 15:01:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,pmic-types: make example use
 generic VBUS property
Message-ID: <20260924-snow-goose-of-mathematics-290582@quoll>
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>

On Sun, Sep 20, 2026 at 05:37:57PM +0300, Dmitry Baryshkov wrote:
> The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
> device-specific VBUS") switched the schema to use generic vbus-supply
> property, however the example continued to use the old, deprecated one.
> Update example to use the expected style of specifying the VBUS.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

The other one has a valid Sashiko comment.

Best regards,
Krzysztof

