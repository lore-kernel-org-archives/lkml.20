Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B886351C10;
	Sat, 26 Sep 2026 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395181; cv=none; b=OL2LZTgpKikURg5Z5/Fc8+dYZ8s3WxTvOI87zYlzdmrjoXAB+U4aJNTSeqQu1vx0vjXtDyQ9d8tvrybTiGpaJnhxILkxAnBzL8ys6505wtgTn90d2ucBIyg0UxeLXqap1MGREAoN0irdhBYdfbPtdJ8XAsh2YrAUetln/NjhFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395181; c=relaxed/simple;
	bh=qZ8G3OxOijEou3BNA4OquH3NgHCr1W3bpSpnwOLbMEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VujcGNOJmI9PA6Gfi79PGvCMn2qJ1esL8bdqH5ypGuoArxH++n4YlySauaWnXbsa2rGOXjbj9aQFWMmdwtpYXSJ04WOZBoK/MvjL1coSmOpJkffWn9kPU256/f9J1RnrpGGyHjalRniNexBJHwfT1tgKFLa4X8fOjIc5k9e/zkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gj5JZL8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gj5JZL8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A97E1F000FF;
	Sat, 26 Sep 2026 03:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395179;
	bh=E+/HZW4AA3+lIDQSaEdclnyFxECpeXstgqxYAcfIyeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gj5JZL8dQ+wEO/rWjeBuJyOqI7jk0tWLdmCCiz8dr+2t1BWTG8xUT1XNzPL5K7Ev9
	 a5YYxWvHXOMisgFhoKouDLvv2Z/Jf8Da52yFy6pe2pek9UMcawRCrFuwzVyEeBGOhr
	 /6cvdWQ2v8LnmnAh/sGDINtHT9ympljNPzALwyRAfmIMsikLPVtaj27Ur111KgZpB4
	 UnsyZ4PJ2dCa1k2LUzsdUdYbIRpN/hXSq5ft3c8/x8ymnDWSlZH6ZLSBesn/f2WSsU
	 Vajc1xRUdNTiu57bSeyv1T+mJElaEE/9mcgzFwzh/dDSx6c/iQQNhEkXsQ+r3ihuSJ
	 1PUE3xssxw8cA==
Date: Sat, 26 Sep 2026 05:59:24 +0200
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
Subject: Re: [PATCH v15 08/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Message-ID: <xueefi6x3e552eaj4fsrcq4q5apyfx5wxmbpn747qck655qrtd@qsftv6cr3kpz>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-8-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-8-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:55PM +0200, Sebastian Reichel wrote:
> From: Frank Wang <frank.wang@rock-chips.com>
> 
> Move SSC modulation deviation into private config of clock
> 
>  - 24M: 0x00d4[5:0] = 0x30
>  - 26M: 0x00d4[5:0] = 0x33
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> [Taken over from rockchip's kernel tree; register 0x00d4 is not
> described in the TRM]
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
