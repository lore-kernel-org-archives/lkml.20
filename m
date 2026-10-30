Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356596;
	b=TDbYx9GtlfASF2+EofBCyLyqtmLE9cFSkmfyFrN74T8miZ2tIiSRJUrczcgi/TR3lNTu
	 +s8+rMlzz3LsE+tvgPy+ANaebuTPQROQ5dOdOAlzHs/OKDS19gy21nrO8gkl5lBQMpUPJ
	 NbrD63g47BG466W+ve4kwJfh/D6leB+/tFAkvBXdHPAk2sL1nBpiq2sha3N2i7+dH9IIH
	 hD+xEm4zYiGLC1EGLy7DUiimMqEgv9+8stsXJ031EweRtDqswCw+D8x1P1yL1BANjjsBm
	 Iz9PCQ+TvX5KNsJtoWQ13yeA38E/0c1fi82XhqkJuKQkWzsBR496FPRM/uZr7wIpe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356596;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ym1ftl8ZLfhIHC5FSGgH9Ss/vD0MXLQhwQfZKPhrOTM=;
	b=BIEjFqwdLB821cXziqCtfoChh+kN42c/DaCMTSOOPABWjvXadyZ1J7ObRmDzrulqbdLx
	 aVm5Nhi7KSVGwfhBY6fkCXolMb+SL28RRTwud4BsUmQc1J3GWjrr+FtKh58cmCDkK7QjV
	 2YGfmpJH9fhfIUpi9ery+9r+l5S38hi4WPDArt34vwmDxbrCAp5UxctASxq2wAPNjN82z
	 taq6W8Hmb22wPJYXPdl0T1Woq9TYFasinSB5ZdfRf/UrS8isMO1FOHrkrH2lkmv5mjz7O
	 OqGjzid7OVhl8FyqC3IKXjFX4Hlh+fnGzKHu+S22e0lDTLpqHP+/GFtLL8kWmpez/Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFy02yPZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A999606A326;
	Fri, 30 Oct 2026 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFy02yPZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231511F0093A;
	Fri, 30 Oct 2026 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356596;
	bh=Ym1ftl8ZLfhIHC5FSGgH9Ss/vD0MXLQhwQfZKPhrOTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JFy02yPZiVT4P2DwhA1lk5ltPgfB9mAMXQHEbwYTUsu1Oiwxt+8ByBoENCyHkQZX/
	 7pt7bqiNNqwxxEKJO+NqZLgWytHiwM+vu3Cx2IukoJ9Yrv1etPfjIZmDwYr44e9Nxt
	 qkymnLk2lduRXV/8OAsmZlSKrPUpfe0Xr5VKfxHPsYyApbt4eB2i1Ut5gP/4pSBeJs
	 2aa+mzKrY0dOIsBJkTLlauIbM67oSSnKMT3VOJeZcLePojMHXqr8MqKmEuE/Otgdi5
	 oqr/aKBM6cVe8O0jY54moSOVdJQnhKOFrtlRPiZ9tJT/00l1ZUKvmed+LSugTZ9ZG7
	 t77Njmd1ZN5rQ==
Date: Fri, 30 Oct 2026 11:36:32 +0100
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
Subject: Re: [PATCH v3 1/5] dt-bindings: display/msm: dp-controller: Document
 Kaanapali
Message-ID: <20261030-solemn-scorpion-of-biology-ac6f3d@quoll>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-1-b5ae8e6083c3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022-kaanapali_dp-v3-1-b5ae8e6083c3@oss.qualcomm.com>

On Thu, Oct 22, 2026 at 03:19:42PM +0530, Balaji Kalkonda wrote:
> Document the DisplayPort controller on Qualcomm Kaanapali.
> 
> Kaanapali uses its own DP compatible string and has a resource
> layout with five register ranges and six clocks. Add SoC-specific
> constraints for those resource counts.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 2 ++
>  .../devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml       | 7 +++++++
>  2 files changed, 9 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

