Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80837F312;
	Wed,  2 Sep 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331610; cv=none; b=mSFILD9SXyaGVVLwsIVXX/HBBCmr0AuykWTmU9bFCkE+mhCdCliPvXxw24szT/5Uiof25EeWzfLemgxL8iITiyMlPy7GV3caxdf8UnMYCw42zC9YZRA1hyvgJrBSa5M1VLldxMYENfjSWR1tLdbQr/ffK7zyjDjtLRsbEog6IcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331610; c=relaxed/simple;
	bh=FKelUfL9fRuTEH3axzUM+504eed/YOB1I9JoS2mtsnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nfg0w3AEyStjBtnmauRW9ehAln9YjV/a0jOCS3/yyb8wKnupQg5akcyh1IRvtI8CqzU689VaI8qouP4Xt8jEwwq/CZoMRf/RCXmqnPPSksc0Ua6Tf3Ede/LCg58dT/jbQx2SKJUvF259y+EOsCrqoa3ozxl6/RkdGXSGTFH71JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ovzwl3Vr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ovzwl3Vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08FC1F000E9;
	Wed,  2 Sep 2026 06:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788331609;
	bh=B7UPSLc11oKfyrOgLlliKH9fMg05j0h2vVmhD/w231c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ovzwl3VrOuy3uhuXQ2RZbSDLYYTe1Ii9BoP5dQVJhvgTn1GSz3xT2hmg8zJATCtDi
	 uX0jyf6AVYDRVOBUprOfJtgQ995c024rYYE23SMdUgO4sf/iLWqk1p+juyNZtLrXtt
	 G7+ajEU4XYF3il3uI55Vge18AwIf/u5OrEBml0DDlKlXB8pImMxN62hMuffRU7Udl5
	 bfh/9S5/oIHLsvDbbFFlYbNnlzajMxGmpL0snqPYOAE/s7sWBi7g87WmZ+n5abIN02
	 bPRhnpRJ95k6LrkfesAgVFFpmxsALnr5Kv9I7KjzC8x61muqGTPa4NEibKacBEaKM3
	 3ces20pbfOz/g==
Date: Wed, 2 Sep 2026 08:46:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Congcong Yao <congcong.yao@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Zhengnan Chen <zhengnan.chen@mediatek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Message-ID: <20260902-calm-vivacious-mouse-a7eaac@quoll>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
 <20260831-8189-smi-support-v4-1-8ae66dd3eeed@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-8189-smi-support-v4-1-8ae66dd3eeed@mediatek.com>

On Mon, Aug 31, 2026 at 02:52:06PM +0800, Congcong Yao wrote:
> From: Zhengnan Chen <zhengnan.chen@mediatek.com>
> 
> Add the SMI LARB, common and sub-common binding descriptions for
> MT8189.
> 
> MT8189 adds an SMI sub-common block. Document this topology in
> mediatek,smi-common.yaml.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
> Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
> ---
>  .../memory-controllers/mediatek,smi-common.yaml     | 21 ++++++++++++++++++++-
>  .../memory-controllers/mediatek,smi-larb.yaml       |  3 +++
> 2 files changed, 23 insertions(+), 1 deletion(-)

Just to get it out of DT Patchwork:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

