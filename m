Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E381A683E;
	Sat, 26 Sep 2026 03:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393886; cv=none; b=YfmmFFXcB5QOIs1X1SUCpGKMp3fvOn9AcPCQAHrw6D6p3Mr/Q6E9UNX4KuVBC+0oABQCpq657lDsSrJLfLGfQPDAwchB0yfCpl8I4ofSZ7Q+5mrcQQ+uLX9FE0iV32TQ/mifEU5UhJZYoQCFqQcCHrT3SfgKBqhdpyApTiPcsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393886; c=relaxed/simple;
	bh=EH5fPjbVV3aqniZMYi2tcFuOt2ZdRX+5Hvam//qgVCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtzmpAlYg9v6DG3bVL+MALLLeFV+tNkpVDZOl0re/Hn9YYOIkvxsbzFLDxM8hj82PfcRw8UCwJvdOtujAEaFp0z/pgTZOxx/l0d5DXIZG3YiJQ5LGeuVbvJW+jsyPHhTSuf1+KV5rv9Zifgkrk0iamGiViNZxN+jwPsDFwMdzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hg/xWZ+O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hg/xWZ+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40641F000FF;
	Sat, 26 Sep 2026 03:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393885;
	bh=3LvRVZi/gGeHaFV3EytSFghp++iimgFUhDwJJVt4934=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hg/xWZ+Onm2ZkLe6P2ZAmpdXc3L+1SeTb3eJTAd7JckRZ/lyfqSO5HR+UU9QT0AB1
	 h69LkOoMXVopJp7HGwGFQyIkV36vKjA6kyvXsGOiWOnOvKB6Y0mMgJWhY1EQLjixgL
	 WSCFJuGWIgjOYU1SSoKNIOTpYKiw1bZ829DJtY23zsiPEFwmSGAbEkgQDvm3GxO+7y
	 MoSqyjHlQuVItzAkIdsqFdO7YeTzpAlJZt/Lydk1lSBjZBcJ7anQShxUCcZZ3klr4n
	 M5DXYHRL1aFUpQJyDRSMpncFyCTpVsT4KVG5CLgS5YGWz12ZCXd0S6+CSJtoHe1BLn
	 3n6db1Z1ULzRA==
Date: Sat, 26 Sep 2026 05:37:49 +0200
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
Subject: Re: [PATCH v15 07/16] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Message-ID: <ivamoiqpjjicp7cnff32o6yl64g5kugd7vdmubi2vr3eahuuik@g2pysc5iruuc>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-7-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-7-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:54PM +0200, Sebastian Reichel wrote:
> When a mode change is required rk_udphy_power_on() disables
> the clocks and then calls rk_udphy_setup(), which then enables
> all the clocks again before continuing with rk_udphy_init().
> 
> Considering that rk_udphy_init() does assert the reset lines,
> re-enabling the clocks is just delaying things. Avoid it by
> directly calling rk_udphy_init().
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
