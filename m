Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099C3148CF;
	Fri, 11 Sep 2026 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103890; cv=none; b=I1Yx3oTLkEo3XraFiyWfwHNayGmOHvRXUNvV4fjzgbeXQhcphPjBwckjQykAsDVvzCe4HMgeUF39OIl9zkn2d5eqMIV6Gu9tadSt9YsQuiTvhuNVCrXNqz5aLAcs7A5QFjKTgqVA1HYtFcDIrvsmpWw2t5s0spOq+3csh4+WdIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103890; c=relaxed/simple;
	bh=PaQGdR+4ueOckN2zzFQjRzOVfl+CvCik/pVLzq4WP5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AM2pwypE1fUtsCsSm2RQkv/HrscJn3DpiZJ+OlJocMFBLtDLMVHOkJ9sGx1qVk2EVOrTTUGUivfuklMIlpbyUT40C++Wi7ScT/jEnXXdoQRFgw5DZEB7RlCcUfiBEddoezTdX+R+aBPO3+yJJBr044Vu9vnTmwkIuDWkC21ZhOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqvcKu/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqvcKu/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C881F000FF;
	Fri, 11 Sep 2026 05:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103889;
	bh=brPo4LHaJaLSQ5NoCpOmZMudeFP07TbwWeUS06ea0xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aqvcKu/50z0Q96RozxSVN2FCdJdj60wTAr+738VbyA9chsWD71lUxzKnIs+yoGY7S
	 lEWPR/C7GNFg0HSkz8sLhVy1OiVP6ONFn13ib8TbMVnWooQ+p8iSvpLP7HPu2LQ0Ao
	 q1hOxnrFscLx1AXpKtk88OpR8hFFc1nrfhhMp5Tzpy3FuLjCrQMPVUpvcEQ/lvjbtH
	 vtjBbWr99tOWxAToIVCJsWuiIduPaPmKfM4SSmd6WDu2tgu0B0YxSd1ivFCAryqHsX
	 jlzL5ItD249IblNuD1iFSky513g56hkWiQHujSEmwKf+lCKcDiluSw6XSjxIJxI01m
	 pY0oEvzAZJ23A==
Date: Fri, 11 Sep 2026 07:17:59 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 06/12] phy: phy-mtk-dp: Support set_lanes in configure
 and properly cleanup
Message-ID: <d3qbwzwoqshalixhg2t32zuecstiy6uingyc4b4r6wmwcg6ggj@z2movep2kk52>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-7-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-7-angelogioacchino.delregno@collabora.com>

On Thu, Sep 10, 2026 at 11:20:32AM +0200, AngeloGioacchino Del Regno wrote:
> Add support for enabling a specifically requested number of lanes
> in the .configure() callback and disable all lanes in power off
> and reset callbacks for proper hardware cleanup.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
