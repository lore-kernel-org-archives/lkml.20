Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0275E526A9C;
	Wed,  9 Sep 2026 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972725; cv=none; b=kxNafySjZ/l5lAjaVtMAtYiBaU1gk1i3IzbFCCkIS+fAXZo/GxFkftNePHxwRx6cVEtjFoFxsEgIB7A2mI0VZbyyxWnhEG7n/Q3NaC8UdY6KbG1aDDhkG+USZK4NHflg0EM2pd+zUXBzI918jIoFlEYamT2BxFkS9Olnjq3ybXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972725; c=relaxed/simple;
	bh=77U0sNB5KVlqdmLgJrpu4tHO39n35SBjSp/QWT3jEL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5aKrYD7CECeuSrHvabugVXmmfQf5sI8Zzq49NEvCErcEPic/We6WchOxEW4QQ/ze1LZ3vzJR57jtCOnFXaV6yEIHVnNbIECcVri8kiA2IS6kNw9YJiwgkhdO4hZ/C0bUffO/T9WukH/SqUdTDOhthRCvK8sVVH5qDabTCy4ka4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfC+MCc0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfC+MCc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573181F000FF;
	Wed,  9 Sep 2026 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972723;
	bh=HgC9sEOwgkiHFo9nm8IwcHna7p/hR9fCjHKYivIfM14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CfC+MCc0nrX7sMf/aBoff2VzQK24psnb39s3VkoDRq+ZhH3P6alsK7j92SN649FA2
	 tUPITzXgmaBspYY1PWbUV0Xe+VvZbGNMPtCQMuPYziiEtX6wORnCfKwQUu3mfaqvNC
	 xVjLr2LssKMqtTMNkIc8gK+Ls02og5sFm/2iZVlAr686Dwx/qUGgseOBLqXw2RRMFo
	 Y+A6ZRAKwJJAwo9StOnlUkdJLHDJ5Du4eSU5yr0OBveWL3Wwr/JBHZiM47stWgtTQ+
	 x9tv2u5sEyTUYm2gHMCBe9ere+sf4Ji91HsSBzcj8YAl8glI4XJJ+raDv2lGkpojQu
	 X1hp2a542rnZg==
Date: Wed, 9 Sep 2026 18:51:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: Document MT8195 and MT8196
 DisplayPort PHYs
Message-ID: <flb6ugxd5ssocnrxqs7vtjfvtjschvscoputms6bruw2uelpf3@xp2eumt5pwmk>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:34PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the DisplayPort and Embedded DisplayPort
> PHYs found in the MediaTek MT8195 SoC (and variants of) and for
> the Embedded DisplayPort found in the MT8196 SoC (and variants).
> 
> This PHY supports varying impedance calibrations for the various
> signals to reach an optimal EYE signal pattern for any specific
> board(s), especially useful for very high bitrates such as HBR3
> and higher, depending on board design.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
