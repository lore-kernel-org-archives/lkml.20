Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B3C2D9ECB;
	Wed,  9 Sep 2026 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966624; cv=none; b=ut8/iDXY5JGZwATU8XVkhVjFm4VLrPbqfksCpEGaTHsuwp0r4CwzFnUBsRbnmIm3ur+RVumqw87QCgrtmvcdGYe/qqPV/0096dtJPelrdszWcquPOaHvr23Mlq8AduU292Kg0FKdNZW93fA3HZRtlRBwh17ghx9J1oEOtakzs4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966624; c=relaxed/simple;
	bh=mJlypGRAe7m7icickoj35ifcSu4c0qkz1Tj1hrrS5Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO4orInU3HL7hnSPtCGUUDKwfi/F3ob341qR1mcbGl8LGgfrqj0lkEgooA29cr40LyMuwUe3FxNxLzoc1BcyX1O0kmBm7V2MkIZpxVBRhgPYz9s+kijvTiI6YuHQS5zVUgiztY8MFJEZ3A2Gmv5Oz0MHDFQPUIOfJ7xiKbm0bNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0eUjy9U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0eUjy9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182901F00A3A;
	Wed,  9 Sep 2026 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966622;
	bh=Ps4txA8yulxz+H1CKcCcyIHdAlFgi+8pO1Fx1PzdrZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0eUjy9U1WelmB5b8fbXhgJZ7f4PHeAMYS1RMPk1Djb2tBXQxprgaRbBJC/JE4BEG
	 MLuXVb1TDVAHoN9VloKqWH1KXnFM9384urAMajSDTJsSx/LLzCI+D9ZY5cf7JYzHa8
	 6GuqgNOPOKNSdEZK58ST5n9oof8BJWYxwaAR3SdWyzaiFtM/0qh2vg/cZ/3mky7f0E
	 fExYtiqcbzxkqa5+S2buBB/Y3QvRKOz/8NZHHNbzKmQalyjVPn1J+rEIXHhshXK6Xg
	 wP5zkz+M8NKvvwPO35n5d9xE8Gk9FQHX6aQ1iy1SFCXYJcFBdzsyquebQCc86O+YkG
	 HjFjG5VDpe0rg==
Date: Wed, 9 Sep 2026 17:10:12 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
Message-ID: <h3b5r5wm5pey65jauir32ciw3lskbrlbcuyqa2xwaxqx2q3kz5@nxqjientp4dq>
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>

On Wed, Jul 01, 2026 at 05:36:49PM +0200, Louis-Alexis Eyraud wrote:
> Add a compatible string for the MediaTek MT8189 SoC, that integrates a
> MediaTek generic T-PHY version 3.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
