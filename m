Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E28A3D1CA5;
	Mon, 31 Aug 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167352; cv=none; b=lABqNV0Pf0/17fk1HLkwS07wk6/91abhp7sTYGdCvzr4KV1y9GrZO8Ew05uEC3rBFBy6iG8K+YnyTSwkzJE0PphMST/STACcfLvfh2CR0A49YFQ8USt+0ZI6t6drSjoohdz9h17QaEqyfI+hXDY64V2YtB2iELF+vz/2b5JOTz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167352; c=relaxed/simple;
	bh=B7yLvJ7nF9L4ciwYpkegErA9NxyDgX/Bjx+UmxWaMvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usDGlysKLMEUb8Crxwah1viAxaD9cS7b64EUK0uBkTgU/AKXxLdkZ667ZGkbTdutzm6BTEYNSG4uhjKOaOMlceTlK/DwMXP+SeahF7aejATxf6V62V0z3bfVG8wqPFRdTP5AqMCLVnb+2ILYQp07/cZjo+wQ/BaqtGs7yWznrDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDSWrV/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDSWrV/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A4C1F000E9;
	Mon, 31 Aug 2026 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788167350;
	bh=d0LPw+diZjgwDP8dQ4iaBdDId3T37U1dzAHC5CQ3Vlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IDSWrV/8PBxawvcghOJBDWoTurZ+JnEyfHz7DWv2qCi2MtWo+Afp9G0qGQyiNIWvt
	 rSJcGVPJ8ZFgDsunFzquT7AmcExhFhh8RqGit2RU3hdMaIyY3UpyKfl3Tzo0bE3GIu
	 ztl3HhrjPnfvUi5QRTU6hVR6fOoD2xi/tP504BZOLihoozrDNcaEB5R9/4F2yX8SKb
	 69XHPUiK0tzSlz1KHGf+rx4oCHZRMhcyv5apDzDpGTLMuSMXkiWmYTxAyBqh73jPhT
	 I13kGFprIFhm94YV2x980+jn524NeGkTqmo+xPTlr9FKo9LrWTbgALSSPSc2vAhLoK
	 t2/sbPoIndcIA==
Date: Mon, 31 Aug 2026 11:09:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
Message-ID: <20260831-jolly-jellyfish-of-admiration-18c5c7@quoll>
References: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>

On Sun, Aug 30, 2026 at 11:47:19AM +0800, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

