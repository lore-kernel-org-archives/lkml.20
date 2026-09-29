Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282813AB277;
	Tue, 29 Sep 2026 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667972; cv=none; b=FGx5VlWSczCpZGot//TxnJTOyvY/4NYKsp1UUfzVj2qWgESaO246kL/BL7UquQAvHXFCrznvtpl5swR879okkjw7c7bz/VIMJCj91SrwYLNfCogBQ3i+IFS/RX6nTqAIyw7EA5t3Wp3yiJKYrk9PJxeO+4MJdfL00CCqA75ShtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667972; c=relaxed/simple;
	bh=YEQSBFPF+jkSL86FhqCVUNWjwTjEpeE/2q0fxSefwNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXKnbKcXsBe7NTy+5bUbgf9Te5FDdeGyd9IhMM+RHI/gsnevQFdNORif69Zg23afCekLILBtm0PHTq3x5ljI2MFhvMK4v75fHe+MbOO99KZyEg0ypLrE/k9IUve9RbX7EQXED8ujPFWuvc5Cf+9gkSXSJEye//73jy5LPlrEYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPB/y1lW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPB/y1lW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA6A1F00898;
	Tue, 29 Sep 2026 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790667970;
	bh=EIHkUIYifOHwbWldjH0tGVUqDKZQiGqLC0z1iDVXIxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hPB/y1lW95b+WWL0a1F2vXtqQY+zkP0BP1jQQMSWPftm6hFxBFi4y23QPhjIioMWm
	 iGmtj8IPPnbtkTHsPdkR3kWUYftxGO3tfuelZQ94v6IIppKvUnCNfokbVb7/VfFosT
	 o3GydFgsN/fV4rmqP/db3QvFVa2q4tfBao2KrrB+mYhktQ3zBvdb6gAn6Ipkl6ytXN
	 BAx40hZn8Xaqtsibldcn4kFWkMXKtEdVtvbX6uI8XN+I1LKIJF28ot1GG3+bbFFS5V
	 bL8BLgRp8St005piiHIeibktVtPaKQVOJ7uO0UOK4r1YiWgohS+PmGepWYBCoJRVMM
	 QDQikM+dT862w==
Date: Tue, 29 Sep 2026 09:46:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Petr Vorel <petr.vorel@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
Message-ID: <20260929-spirited-umber-hedgehog-300ebd@quoll>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-9-08d5c7bf72fc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-crosshatch-panel-v2-9-08d5c7bf72fc@ixit.cz>

On Thu, Sep 24, 2026 at 04:01:37PM +0200, David Heidelberg wrote:
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMB577PX01), which we have no way to detect.
> 
> New compatible allows without breaking ABI fixing the inverted reset.

No, this is wrong. You just broke all the users of this DTS.

> 
> Assisted-by: LLM
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

NAK

Best regards,
Krzysztof

