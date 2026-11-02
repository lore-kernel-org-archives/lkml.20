Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619177;
	b=ahKgJbf40QrHDsKrET/HKU1w6FcSw463jrikAu14Q0BxtIqPt/UDAlDWPm4T34BcuduW
	 XLuw8zpfnVWVksFJwg5YWyXwlMMnQvUuFJSJCN3WOQ0I/wPfL21aGQVaTT0wp5rmwOy5t
	 Un644tzDEflomYFZ3BkT6J4ff5RyEIIrkWPJ6YN1ji+MBWDddxMsje3VzORQdmmE96zMJ
	 KNUrKqzYHk9OHtEroCigu2+/7cb2oUGNPRlVI/uffrY7G7mnNe+189r77b0URCAFnfOxZ
	 r2CUVtj2f5UMampbfDAVef6VMohWuo7gnizUzYYHl8QMFx1IkOztaJ+O6CVz2Vb/EZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619177;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XfJpU24NB6L3WzchK489NcFec+igVtMIzGuaUsha6Ls=;
	b=WiN60LU76MAJr+NzWXd3T4bazlY9ho91ST5e1Rvkghsc21PYvGmoF5Sju9mbX18uhNBK
	 T/LnqBdR/G0FZIyMFRHF3J4/kV7QxqAD6rg1XNHF8Igv5n3pdawiafq1CYHhVRiJ2pRSZ
	 XcZbbGxxO/xKasocbkox+3zdW9ZH4h5h37bTqqINOh/qQ5B7vs2dD/75Ik5N4uXyzzMOp
	 ERTyPdjQm7ha2EFlMntV0K/TRyglXaCB8kTiamcJ72/oaQLLIaGAyPozPyPHLOy8QVFEc
	 d0v8lmwkZ6rLGs8RRho6n1mTSVBKpbS8iKCfOlwAy7zO0qtuFdjyk6EbIGjozwWop+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOtAbMoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D9606A327;
	Mon,  2 Nov 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOtAbMoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9770D1F00A16;
	Mon,  2 Nov 2026 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619176;
	bh=XfJpU24NB6L3WzchK489NcFec+igVtMIzGuaUsha6Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IOtAbMoqAvtp86YSSc7kpLmsuK28FJr7RyvWW2IF9vFgeH6EJZucGWV79+D+TpCVm
	 OhHy0Y/V8U5fX6Y+SRAkegK4GvHbZ5wBycGsTFml0HYbMZxnWWOebr1KpS4tsiF1yQ
	 jfJF/fODV4xEYoixBpK47NWNrzmN9RXdZe5gjZkgQa/xJSxeA2xMHCkueLYhA4yqQa
	 gxfBkvDJQp8bcwG2H+ErDj1yctHZAIGkU+hI3kK9M05N8eoSQUMpI7hPCsM/WeDSCZ
	 SdZ18aHK9H9jEW2CK/9YQ4GELGF5/8xrR8qEgH4u5bcL9hJtOJLS9MS1j9gLHyt7gP
	 RYQVYhpvdE3AA==
Date: Mon, 2 Nov 2026 12:32:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: dpu: Document SM7250
Message-ID: <20261102-placid-soft-bee-b5b848@quoll>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-2-159f403ec405@brar.si>
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
In-Reply-To: <20261031-dpu-sm7250-v1-2-159f403ec405@brar.si>

On Sat, Oct 31, 2026 at 01:23:38PM +0530, Ishu Brar wrote:
> The SM7250 DPU node has the same register regions (mdp, vbif) and the
> same four clocks (iface, bus, core, vsync) as the SM8150 and SM8250
> ones, so add its compatible to the existing qcom,sm8150-dpu.yaml
> instead of creating a new schema. qcom,sm7150-dpu.yaml is not a fit, it
> describes six clocks including rot and lut.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

