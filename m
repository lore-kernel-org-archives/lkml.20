Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227180;
	b=PAcS2PeF2NKML0LBjHHpSCXA/e33PnGVOb8pGM0Wpo4ABtBqlcyAsir5wFxa6gZDBd5S
	 GhADZVSjZXhpYy7bj6Cn56BVd9BpBlN0p0e5qDfkv8xgYR75EJ37Yimv1MOiVyRDqfnI8
	 TG9/0rPH4xWRWCYqupK+tmE0sl313zoXQuedQcacyw+h9zNp4HC8lGoHftJAyeAgOQkSb
	 WguYVIQy6EYN2UGahXLd/Ox3txTHBXS00EqcCmJdj0IFH179lTiI8158bQXAAT+Bd1gWt
	 B26Iun8n1ojm6g36RcQqztN3uaCT6x0oUu1ot4WKaEvPFPmFwgv+cxlOToWvYZ4ePLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227180;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+5RXFrprDX6bYA9uikypLOOJeAzhlU0oKTvBTPFxlAo=;
	b=dg52JJBuPPuSR2K/5MYTn7Dj7SKiiqKetG7TEZFBT6i96k9a3m110PHWgRwWk6zIFg3D
	 jeglS3P5pcUYeTMTWsLpBCv0k0ddU/8if9a3mMPKYnMor5qVMYodN0pVSbkixfUFol88k
	 yA9pDLJetlhSQtLtUSuW/uL/VIL1r93szPsGy07wiIxIPVZdEO1TOuDu9nVGFB/c/yHTe
	 AlhEOubnPoJh6KY1i815jS1bMdeoddNw9YYH2h19HRmf7aXLB72QGqRCqPQ4VGozmLdYK
	 t63gyfjDioHnbwDU+ma3pwXO+i9vQrkMu55+3D2nhkjqIpeQ9sK2SisRsc6k3sB7hLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WpnMokxA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EDB606A31C;
	Mon,  9 Nov 2026 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WpnMokxA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A629F1F008A1;
	Mon,  9 Nov 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227179;
	bh=+5RXFrprDX6bYA9uikypLOOJeAzhlU0oKTvBTPFxlAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WpnMokxAAWsX3nLHIFakp0L01J/+UsB6nujtp9RSRqsNc2vncK8X6H51UOZTbTsHn
	 ce9sNPVjF3aUUdDRbt79I5i8sCuTLiQvDC0jTPg3APMNOpJQytl6Sx7SYLEJxiAbkA
	 a88Tet/lE6v7s99DL6mHGFRBSLmzI/+T+gc/3UM6adQIlMIbSXki3ZS8i7OpUltmSK
	 pzdbPQU1613DTIrI2G4p11t4iVCsZDbPgk8pbcth6Jn/WVMMnf9s4m4Ukb2n2dOT9v
	 wLE9hvsa5GoR6Y/EzrgLxS5cFINdzJXl7b/h6tlJ1wOzDkgjmxCdbzAHOEs35EA2++
	 uJeIDeB5JCGDA==
Date: Mon, 9 Nov 2026 13:26:16 +0100
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
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Joonhoe Kim <26rote@gmail.com>
Subject: Re: [PATCH v5 2/3] drm/msm/dpu: Attach CORE and INT2 power domains
 on Kaanapali
Message-ID: <20261109-industrious-impetuous-slug-a8e4ce@quoll>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>
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
In-Reply-To: <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 04:36:36PM +0800, Yongxing Mou wrote:
> Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
> power-domain core only auto-attaches a single domain; with multiple
> domains the device is left unattached, so both domains must be attached
> explicitly.
> 
> The DPU OPP table also needs to continue controlling the MMCX
> performance state. Mark CORE as the required OPP domain so its vote is
> propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
> own and is attached as a regular runtime-PM supplier.
> 
> Platforms with a single power domain remain unaffected and continue to
> use the existing automatic attachment.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Joonhoe Kim <26rote@gmail.com>

Where? No tests were at v3 and v4.

Best regards,
Krzysztof

