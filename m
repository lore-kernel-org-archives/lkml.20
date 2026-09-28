Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E153D8914;
	Mon, 28 Sep 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592619; cv=none; b=V18tmroOI4T6gnK2L4EU24uUnisUujvXoSKMTLyeauTDmSFOMkzTVpMagYUfLElIG5zhFpqSM0fK3EANnwYpuY3i5aaBHt/OJfyQvTKjTZfjQDn9zSjrjaTYVVdY38HKL32Aa31tsiyRlM1oHG4Kruj6x63Igz9ZuN9vmrGQqec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592619; c=relaxed/simple;
	bh=pL1NFWNI7YU03macZGmXzK0m3lga9z/i/o7EUV/tHEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIxWvXTUlOYNSAAlr3YxnB4DhWfemWQDKfsMnrS9sY+fxGQQ2OuZNctkGFPJUrWRbPzU7cWIRr6aQabIevWrGVUJb55JU7QmGxhC1kTIcwKUVTYd5Vhyqep+aZFID5EKOvmsTXn/+tGpFI0uFci3dhs4H7BiQLVLwfhkv2BmfPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCKRDguJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCKRDguJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28611F000FF;
	Mon, 28 Sep 2026 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790592617;
	bh=CtdavPOGSviHNmGrQaeOfPjQdW8FwvPfpg95uqntkTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WCKRDguJJKygJeZKvZu7XnlyuN+bCnNnldwgwYVMVvmk2hdtWpY8YjmABXOBkeNvG
	 2ol0HNGIeriKjJS1EUW4drfMavGtwRQgVKbdVwNrbzHsrMV0lfY016i4eDE2Y3sfud
	 XObPMF/VFhpBWAOKYr2y3QL2CI/aJ2/lXlsg4qjKm/XQLIS+PbMDtXm8CbCvt1ibow
	 /i4NDVoj4YVjAVqNqz3IEGLynQSVpMQ4fqewXffEhFCeqrO9Znw/7CWybsMYjLvdia
	 oQ+W7CIVESgO8xDRaJNQXHKcdUUa+nXGUB2i8OjgC4/lCyXA5pHg9/2Tn+DUC9ovHF
	 TYJ2I5kk3lTTQ==
Date: Mon, 28 Sep 2026 12:50:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/4] ASoC: dt-bindings: qcom,q6apm-dai: add
 memory-region and relax iommus
Message-ID: <20260928-cute-vengeful-pigeon-e4bbfa@quoll>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
 <20260923-vmid-v4-v6-3-3d61a0319b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923-vmid-v4-v6-3-3d61a0319b1c@oss.qualcomm.com>

On Wed, Sep 23, 2026 at 10:03:40PM +0530, Ajay Kumar Nandam wrote:
> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
> context and cannot use the SMMU. PCM buffers must live in reserved-memory
> carveouts that are SCM-assigned to the appropriate VMIDs.
> 
> Add a memory-region property (1-2 entries) for the control-path and
> data-path carveouts, and require q6apm-dais nodes to describe exactly
> one access path: iommus for SMMU-backed systems or memory-region for
> mDSP systems. Remove iommus from the common required list since mDSP
> platforms have neither IOMMU nor VMID DT properties.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6apm-dai.yaml       | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

