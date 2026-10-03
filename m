Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874BB222597;
	Sat,  3 Oct 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037862; cv=none; b=tnrMv4bu02fzUdxfJzErZ6c+eLPgsvOvkqgF7JdtzWY5edeeFOe8LDSsfzn/t9CP70fvuzOCDlq+m5GOZh7cV1Yd5KTFerFFSSS65yj0f4zBOaMLwdtZIg2lQCtQFp21iPb3IlOM+LZdQNw+tADsMZGkPlblhNlaX4rmpJS380E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037862; c=relaxed/simple;
	bh=Rs7mtk85A1rYDMna1vyvGPOpfMl1yhR9iAWcnF+xIGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICXciQvxlFAF2uoaxM3k7bYWMPWnGqqh+DT+K/v8kII+OA+ztEGQWgyewixaYRilYjnBewWqRFDyKJPQXT6Wanh5aHauaQSLbMMQiw29znaa4toHfD11wXoeIr78NN1rHyehbtoyfVy/BMOzmVOshpKtluyNkgwhAFE8R0+V1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqB7mFwQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqB7mFwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7533F1F0089B;
	Sat,  3 Oct 2026 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791037860;
	bh=Me3Hmt0mYOqijhffZ3rQ4gyjzDJfW3Y10n8MJDHGznQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VqB7mFwQP6v8BUcCFe5XCPzC+hk06m6nxAxdzVFNqtp1hALgN//FRL4/OeHyBsmk8
	 cG4aOT9KaD4e9Fk7Fk7Xl8we7sLjPEKA65YSX/QVCXp8U3wsNMGTb8Ei2V6kWpF3ET
	 xaOu8q141E9ALO+2/AffHhF3/ACZNa8TiX8OeHmzW8sUBL+fcdxXZh+rVs9cbcE+1P
	 lN5vBEtkAaJApMM9QRUPREqGSJsDmD/yi71sSWKiCRwMAGO3mhOeSw7pcoPm7NAZso
	 Be3cpljXQ+2NjSz4Eg4EDIGucFlEeRO7Z6AW2WgINS+Fu9mFXlEQsO/NeXAdSr2egl
	 qDdMFPI+VxIVw==
Date: Sat, 3 Oct 2026 16:30:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <20261003-elegant-dolphin-of-gallantry-bfbfaf@quoll>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-2-642f9ac5e699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001-kaanapali-iris-v4-2-642f9ac5e699@oss.qualcomm.com>

On Thu, Oct 01, 2026 at 08:47:22PM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> Update maxitems constraints for clocks, power-domains, and non-pixel
> IOMMUs in the common venus schema to accommodate additional bindings in
> kaanapali. Kaanapali platform-specific schema defines fixed constraints
> for these properties, so the common schema now serves as an upper bound.
> As a result, add explicit maxitems constraints for the non-pixel IOMMUs
> in the qcom,sm8550-iris and qcom,sm8750-iris schemas to preserve their
> respective fixed constraints.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 227 +++++++++++++++++++++

This patchset has multiple dependencies and pieces of the binding are
not even in the next from Friday, so it will have to wait. I had
impression the non-pixel bindings were picked up, but apparently not.

Honestly, amount of patches built on top of other patches on top of
other patches and depending on dtschema is not making any of this easy
for review.  I know it is not your fault, we talked, thus I do not
complain. Just heads up why this will wait with review.

>  .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
>  .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
>  .../bindings/media/qcom,venus-common.yaml          |  11 +-
>  4 files changed, 245 insertions(+), 5 deletions(-)

Best regards,
Krzysztof

