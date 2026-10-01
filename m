Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4419B4A3870;
	Thu,  1 Oct 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843386; cv=none; b=EaUgcPKBXroDc/fgbBu3FsvGp1Ozkixdo1Xt7U1I0YmTpHFuSUsZC65XpBEhn4mcYoXL6xv8vJ5D0gEhyjlWaNIq5smzBeKidqjZlOWg/pSCidob5oxJeGWetQ6xYYvMLbpdfGHWC52wo03oB6kBg0v26mipobfoLmJADwLoCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843386; c=relaxed/simple;
	bh=ZC0i9BiI37b05XU83pr1MEqy8F41BhPAAITXvFIFeKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q50JQy9e355J/yajeyFVxSHp4j8oCcAvzKXhSI4LMbBTJxnBE82L1Km7zjAWxuElB8Csc9/6HK2q8Z7lXRJgQq6YH/ndB74XJlDx5lcriAiXUMRuZiWxsz/jNH6HwY3v95ut3c7aSUOiSn5yLSIXWlvhhG4FMdNb7HFtdPH/DFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQC+pGGe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQC+pGGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA7F1F000FF;
	Thu,  1 Oct 2026 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843383;
	bh=nwMNSKoTapihAr8TD2umYmMz2HSPYncaB9xWRndoeqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQC+pGGe3U2NqqMxaKqYBy1DmlhWkzdT/RFvXPa7deMijp9JkwyD/lSZo12ZsnU4N
	 ZRDMODresF6CiLl8w5FvxMemnuPVYJWzIMAN/+M9asvkHTOUDBu+putkwFUkliYoUR
	 W2GiTgU5mH/xzBAbnlhSM57CUnTdre3EMuubL+yDY2KfKiNRw8bK+1Zb5sSywUaheW
	 oX58e1tlCVS/YsNiKF2SfvUGb4uNUDb+8xBRITEsDFVulN0JK+Sa+6wpyFJ3CNXEpb
	 aITm7F6bAdlP1K6zRU/Om8zP/6ogVHSpdaDOQVrGgXjmCX/inzQavDXaZJF3r9VLdh
	 97cP+chwarFLw==
Date: Thu, 1 Oct 2026 10:29:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add qcom,x1p42100-camss
Message-ID: <20261001-spiffy-cherry-uakari-d1dfcd@quoll>
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
 <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>

On Wed, Sep 30, 2026 at 02:57:16PM +0800, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
>  1 file changed, 263 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

