Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEED254B03;
	Sat, 26 Sep 2026 04:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395840; cv=none; b=j9hu0kcTjfd03FapsFXjPO21fdEyQ+sRE4BCpGYLRsFeyFUbbMs4AqKRsmnViC0qabVgz3Iotxj0QcqJbGYYqkxaEL45rMxjYTmDJvNgG+iRA/1rtB/9bD6jU8Xgofl7Qpp+Ye7UvUPNM9riePJnx8cF5ombJ5nqClYjrwTWMUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395840; c=relaxed/simple;
	bh=1xKGE9t1GaJWOEmaQ3/3NMGj22MQg2TYukxCpPtmXZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iawfh2gf3o7CzpGICn2MBOC7djDLkQiLM0UST4z2jkssAaEunPH6hmTVMUta/nc7Yvich4UJm1wel1taU1hTOVjqTJC6/JyX/LHKrM+MEytVamYHU33v8wRSbCtDZZdzy9pYN30Tx7SKA9ACEoAmjsUlBB1Sx+QBiZtThuRWbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb1X/hiO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb1X/hiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FC21F000FF;
	Sat, 26 Sep 2026 04:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395839;
	bh=zHnANxNG9dMQBtJ/mshlG1MygeNIbtgRmVltQ972YrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bb1X/hiOxHw1uvCg6ghPzXAKXXqXViNCBG+FEqhewcJhb74QmTQEU0YNRa8RgV1ah
	 IUVtjL/neZNwFvZPDuHoPd3ZL+aMBpiYv+fFK61nn/gdw7pZOfsyqT6wmA4mI0p8dN
	 e7jNUQMd9PzAohJqClAiCqolfhBouqKktYCDSwmo6j3NaVpVZfh+j3fFyXI8NsB7+B
	 bxFdaWD+j4sitQwHumZ7JigiKJP+TXMlVs1J1Ci5hLC8EpI9p41MSNG8g94nyoF8VD
	 uGx1V/l0TLwPfJjImOMTBG2peB6CbjuDoL1C/CorOpWEkbqqo7AsA4ew6R1r0xaZbL
	 9JWGpmMVI/c9A==
Date: Sat, 26 Sep 2026 06:10:19 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 14/16] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Message-ID: <d3smhq5cy4tqigiwwnyc2o2phgqzfthlq3og2642s7axdt25v4@oawozf76va37>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-14-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-14-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:50:01PM +0200, Sebastian Reichel wrote:
> Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
> with the existing helper macro.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
