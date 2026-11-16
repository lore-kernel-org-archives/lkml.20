Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825570;
	b=2CV0wXnGXTwr/xcM+MBumDfONJCNXaNzBZmaWXvv1XYHCMq0zIpNXv1YC7gunFQBXyF6
	 9TmSBD882w+dMh5S9SBqhhIhIm1ZnbZOq/6kiGDDnQOTkiUktCVxBZUFX0gT6agQozZfp
	 7j0Rc5JmdtM+o9w6wHNsWdORtM3XPJOs+cwgOulP9riEJDbeeMaS6DrgjYrG0fyUkKwwl
	 5KsOEbEZailXGdSVL02yi6Fyznb9i2KLgzAjVkGvvvphcZCFaOnEQT1/zv6z0A1zSNvld
	 SAvDEwRPAHuibTbE4Soe6ex6cqDEGvpU1fcBKfI+YL/z5psl57EDpBA+r5jGg2yfqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825570;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TMelqXmuFWpq266Nr/pmiKLHwnbkJ+vOhcI3eV5hwDA=;
	b=jVtCLN/QNjhie8oB6Q/rGNJvJvqb3Av1oXrDQZ4h9BLyNMUgBRb0nlOYLHtjs8rhIlS0
	 QoYjufPYL2cg8naojquJAvtDmAsS44DRBLneBWwj4zqXcSzzFGUBHJllI8jD5MldHFNoz
	 2g1JqsRR1+3YsdlF5K3IE8KT06zzdW+WmmrZZy/Ddu1LlDIwhHyI5T7v/5uSbmhoFeIrg
	 aB42YFVTbIV6OoxCM7clGzMwfzqxY4OTouWgdcZAuKJGs4hruCyrATaCDteCh/xuTYZka
	 YTRHoiS9CvZvvENA2upRmbOclxpNGXuGaAwFSO/nSBnPE0z3nG2b1xEVVLtPCwu5KIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfPaonkH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9792B606A31C;
	Mon, 16 Nov 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfPaonkH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A2B1F000C4;
	Mon, 16 Nov 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825570;
	bh=TMelqXmuFWpq266Nr/pmiKLHwnbkJ+vOhcI3eV5hwDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jfPaonkHOoYzcERjBg2syjUH1ZjbOZW510AZoG3aEu9g6XfzbK7P33m9ATRC31esW
	 Xdy9/p9SL1vp5YScPnoZkhd8sVwgcnULVsMki3bbR4zQefs8PpiDZuz0ZqhCOt6RWp
	 ENGj+45YyD6EKciWwBHU0oBFk9rPTStNk4HVH9AirjxPTr0eor9hBctsI1seXZ2+Zu
	 4/mfcU4KVWiVz273BitBNYXa7+D314Sy8pztPLGBhohMUyVcesjgCXt9TlGh1Wzrwk
	 Dn8KStfHUrWAEq6iE0wEG8R/m9M+PT2AOFE6fVlIk7R74aliyfOqErZCgZ0efGghdr
	 fWDFAvIqvWOTw==
Date: Mon, 16 Nov 2026 11:39:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Abel Vesa <abelvesa@kernel.org>, Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Danila Tikhonov <danila@mainlining.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Message-ID: <20261116-flexible-uppish-uakari-3f1b07@quoll>
References: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
 <20261113-msm_gdsc2-v6-1-17adbce47220@oss.qualcomm.com>
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
In-Reply-To: <20261113-msm_gdsc2-v6-1-17adbce47220@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 04:28:51PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
> MDSS hardware and most of the DPU, while INT2 GDSC supplies the
> VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
> remain inaccessible.
> 
> Describe CORE and INT2 as power domains of the DPU device, matching
> the hardware partitioning. INT2 only supplies DPU-local source pipes,
> while CORE also remains attached to the parent MDSS device because it
> supplies shared MDSS hardware. DPU performance-state votes on CORE are
> propagated through the genpd hierarchy to its parent MMCX domain.
> 
> Keep the widest valid constraints in dpu-common.yaml, including the
> power-domain-names definition, and narrow them in the platform-specific
> bindings. Require two domains and their names for Kaanapali, while
> retaining the existing single-domain constraint for all other DPU
> platforms.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

