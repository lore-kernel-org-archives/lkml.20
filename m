Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215FD4772A1;
	Fri, 25 Sep 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342703; cv=none; b=fMMfENJjcW7eVdndaI2+tlj9slnNINTew6+Fuz+9FBr93NqQ2evBP7JbH7+eFR6Ma/D6uriSvzfKVqwIP/GqchgkOMFxabmv4AEXYz8zHlHUhJU3a1rZ+OCQgztCe6njzs3UDGjziUSm1EY77fI+ctHE/k1DWBxC1X/NoLHIA58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342703; c=relaxed/simple;
	bh=/fn5JF3HX8ZZOlVsWdEZcSzPrpbkbs+cFhXiyc+XrwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFiZ7VEevVhiqtCa4zd+JwwP7Pb3cEs9LzES4r+grQ6PB810GNZkAIUBc/hQ4ezcBK1LepXBvMRpUMxK+n4jVqyRRmABhnZIMq+NK88ikF1i2iyfp4nSE7BoZdmT0G2kRXIGkBc6MlKVwTbXRNH8J8aNxd7y5fmmJEC7NgjcNvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSoaOEXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSoaOEXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1A11F000FF;
	Fri, 25 Sep 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790342690;
	bh=JcvwxJfj+wQCvTyKCuDmOvkUWIndsvAdclXPqwL6QjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GSoaOEXqNZo5+lFu4BWpMyM+JE4KVsAWFxigirREnjn9EsPKMGSXqy6zl+1JRw4dm
	 3U0v1lVUBRas/uYlViba9t+pwZ7GuOvS/CJJXOpFmu1sberKqQygJmySBYCf3ycyp4
	 WvXUDgAxGmgJLJYcldjLPV2k9kmJsPLnVrhrQE5Rgxx1pd1IXH2Ld4PbCi05X3sEMk
	 z7+1KJsjNpR9btN0PPFvJBbcDgR8JadJYt+p7Lus/nPk+0oR55RlDDn0uG8WYtWyj8
	 o6VxOCBheopmhNVFgCDB/Jgjw8GuX14GXG+SzVRHn/ShaPfg2sA9qGq8yuX3XzRRBd
	 tHA2EHtPG0A8A==
Date: Fri, 25 Sep 2026 15:24:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
Message-ID: <20260925-inventive-crystal-firefly-0deffe@quoll>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
 <20260921113914.779393-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921113914.779393-2-l.scorcia@gmail.com>

On Mon, Sep 21, 2026 at 01:38:55PM +0200, Luca Leonardo Scorcia wrote:
> MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
> one can be routed to a DPI display while the other is wired to the HDMI
> block. They are not compatible with any other device, so add a new
> compatible to describe them in the device tree.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

