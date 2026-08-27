Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5544238423A;
	Thu, 27 Aug 2026 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847403; cv=none; b=Bw3fUJev5+0OKH1Fyje/T5IOBvcsdpIdwPaDiaMbx9hZbfBACWaJ4USSe24kd7y/jcN04BGJyzHq60mK8K3JmLhRuaSE9ScQa9mhcAdQn8qJOnhjh+trSYbG9fHkg6rAldeoJoTe/ovXrl7K/R68hl+lcYqGA7ehrZWDCMjO/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847403; c=relaxed/simple;
	bh=Y89/CiBHbHBD9Ia28ifkGEUp2oqsQl4zmuxmQjWTimg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8Abas4xjryRDxeOMCtP6Z6JBbc6wdJK24Y44DR5TGWQ2JEfZVbTsm95BmsLUGZp9t9kqRm91Xtyv1es0FbwC2G56p/srJMLL83myG4tU/fXxhCinzUEv6537BYtOYHKxe3FMBa+gJdD3xHp4S2bfL5n45vwTIT9JLRmjyYvuIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZLTvTKV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZLTvTKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588A41F000E9;
	Thu, 27 Aug 2026 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787847402;
	bh=ICFnTYRS7s0OrNF+UlxpgEZVwggu1x23aonWDAOIy30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oZLTvTKVh0ryslM2uHLc5UUJ+i+wFQHdBHG3enmsirsX00mIRPMPcG1HcmmJDPfh6
	 324w7+u0jLRPTBsZO7OApM+CRZKOGJjZPRQsCKh3O/tC18cc0FNnL/az59Kd2DjebX
	 pXriDpMt885numb9rjthDKIamxtaooUxAKhMqYqNKmtuB8ZblUcPiQIi6baG0USE+L
	 QfCk/FnayvhDokIe3Nfj1z67okVoY5xfnoy1fSfDAmTcgmBIK2mOaThNEPZkjUvV5j
	 JoOQQTfGzQu/+JHIr1ji8pGyesamRN5K1Ny2F5l1tsWTpDJZBkL6oImlDF90iIgKAm
	 J2G+KVt1xgzpQ==
Date: Thu, 27 Aug 2026 21:46:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Igor Paunovic <royalnet026@gmail.com>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Message-ID: <apBi5sGBpPfwTW4G@vaman>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>

On 13-08-26, 22:52, Sebastian Reichel wrote:
> Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> if the configuration changes or cable orientation changes. This is a
> problem, as the consumer device will run into undefined behavior.
> 
> With the new PHY notifier API introduced in this patch, the consumer
> driver can hook into reset events coming from a PHY device to handle the
> PHY going down gracefully.

Hmmm how will phy get notified for these events. Typically there is a
separate hotplug mechanism to take care of cable changes.

Looking at implementation of this, It seems to me there is checked on
power-on, so maybe notifier maynot be right one... ?

-- 
~Vinod
