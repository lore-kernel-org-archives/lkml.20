Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E8C3B2FCA;
	Sat, 17 Oct 2026 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255363; cv=none; b=GfefOH0cnLoTqSlo0Fh1S6XETs4MKardHyiYaqyjWCPzkgE4qJjACLQBMb3q13Or7COo1jJHNbJhT3pIT6RcsyXndLs/VrfIQM/2UlfLhf1LKfnEkCM7P+JFmnzViFCa5UqmNyhdQXSim+kw3bWSE9yRGcNmjipUBhfCkvTLzwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255363; c=relaxed/simple;
	bh=S69hL+L1V4g8udcDm1QVLk500CmPRKrHrAg6g9DaKCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WK/JQ2ShY7W0FRFj/o4EsScmTqM6Syb/xwDoSS8td68gW/SwjhPDeNyzQO1pXcApfJwTNh9QRhREHVyU1eat9xHaeh2o5LnqiNiwodwhMbxyDFfodNQD7uGSNbLFbv+cr8NFtYJgDKQRQDCXpOkSUU/DEEViSmPtOdzj6Y4bs/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MURcNqE1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MURcNqE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280561F000C4;
	Sat, 17 Oct 2026 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792255362;
	bh=Dp+xWq2eEsv1m0He3+VqRksxCmCEv66m1b2LKY7pLX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MURcNqE1hNqkHH1CxzzDisdzt8ZCGGglaQPyeJYbNU2CWmW1KHl3H0IDmYsysqFUw
	 rPy2/t4wV6QnBzggIgueqEPLfIfvtsCp4MEnRn0cO8zP/bW6muFLzBPNQ+aUjq3Roz
	 X/+Iufi3TDS6Ri4+5Z+euYNPyX2HcaI//LsSAQANyhvPyb3eWW2qSO0quqMh8ofCl3
	 1rWGsoIRghFM3QFY9HYRfLZFbBzXze/LygWU+je8H3tdQQiwC5XPWcKCEkBS58cDGj
	 FgXzgc+DiiuwSiiZfzEBNEObTzQYh0xrCdzgEVssq5JwzfjIBlfr5C2idXu/wDZvxt
	 p/MMRwnjQTaHg==
Date: Sat, 17 Oct 2026 18:42:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Yongxing Mou <yongxing.mou@oss.qualcomm.com>, 
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>, Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: dp-controller: Document
 Kaanapali
Message-ID: <20261017-uptight-bullmastiff-from-pluto-6f9ace@quoll>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-1-c15cb83d9140@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-kaanapali_dp-v2-1-c15cb83d9140@oss.qualcomm.com>

On Thu, Oct 15, 2026 at 03:24:32PM +0530, Balaji Kalkonda wrote:
> Document the DisplayPort controller on Qualcomm Kaanapali.
> 
> Kaanapali uses its own DP compatible string and has a resource
> layout with five register ranges and six clocks. Add SoC-specific
> constraints for those resource counts.

Valid Sashiko comments.

Best regards,
Krzysztof

