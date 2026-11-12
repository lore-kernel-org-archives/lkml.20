Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473301;
	b=MlLWxnSmrIP5MM584+KuhkyqcsU37fHQw6D0KzEl5ipIDAivCCg+okhlbYZW2S7q3fCP
	 83fslyxwdnd8+j3VQrfBL4NU3HRZoE0rIUGeOMpNmgEJQc6bXm1kPJ4P1PZAfJtbQb6Mg
	 cXwvjqVC4IXHZBfdsJV+r7a27qaL5BswWOm4JxQkyF0f+XAThrsIhzZKfHNFkqZhydscq
	 hrOjlLKVItebm1CqOu24sGJwhHKz5CbfLm+5JM4NcgHfPJI0PMgJAO0oiibyZLICfvcJY
	 8s4IopgzbyZU1PNmqZ70fKo/KjUhH7H9ZmIoMNSVHYc+Le96WkouyjOxmnoGViWNCFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473301;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=YW52iYa3PS22kVrKBhZRqo+7XMDGvxdxdBLom1iDW5U=;
	b=icc3vlK8lJ62ca8T3AB0cMwAAjf7FkZ0QovVU/VHKRxvoM5fHtqdtlRWQMZ/KvZ88ioP
	 CriOJL1SweBRIESStwQjuxcV1Lv+81iM4GzVNRXB4hmE4aAUmKf830wjmzA+zhMjJG5EX
	 hOqckV3lcc5RR0Z2Pv60dYKzaxSlVRpcpnMGCyG++TUY6Jo1s5ZQmLf1jqvd+vXm0DyPv
	 1iSVozMiq2ABc8HFy8Ogc8dBP4G6A+Wtfx8TYzznHNF4z6bYlCMRZCRE4OBy1FKSyOx/4
	 bk8/V5YzlXOJGAoRSkcIz5WjXJ18RBSCTYnNxxc7e+MmDbdyDs/dDyW4gppMAmEaFDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=HTjyU8HA;
	arc=none smtp.remote-ip=103.209.128.105
Received: from mail-m128105.netease.com (mail-m128105.netease.com [103.209.128.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94FA606A31C;
	Thu, 12 Nov 2026 08:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=HTjyU8HA
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 546f2be92;
	Thu, 12 Nov 2026 16:48:08 +0800 (GMT+08:00)
Message-ID: <051621ab-a8b5-4120-afde-fbeeae48690d@rock-chips.com>
Date: Thu, 12 Nov 2026 16:48:06 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 kernel@collabora.com, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1cef161e603a7kunm25f03da89714c0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBofVkIeGUgfSEJJQx9KHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HTjyU8HAzlfGIH2zaWksvL0FatkZsBVvluGDZ0gXv7vdsLYvXtsI1AWIvGnpoKDX4/o3OOAfMNjPJk2bzP/cP7pzvx9KI8SL489WjcGeQL4HNW+4jNEWl43izC+LKg0zo4Ip/zGfA514bSOwoCB604D0QANS08DlCPVPFi8nZk4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=YW52iYa3PS22kVrKBhZRqo+7XMDGvxdxdBLom1iDW5U=;
	h=date:mime-version:subject:message-id:from;

Hi Sebastian,

On 10/22/2026 2:05 AM, Sebastian Reichel wrote:
> The recent Rockchip platform have a combined PHY, which does USB3 and
> DisplayPort as well as muxing the lines in arbitrary order. Changing its
> enabled functionality requires a PHY reset and as the PHY provides a
> clock to the DWC3 controller, this can result in an SError. Apart from
> that the PHY might not start up correctly when the DWC3 PIPE interface
> is running. This series prepares a Rockchip specific DWC3 glue driver to
> help out with these problems. To become useful more patches are needed
> on the Rockchip USBDP PHY side, which are send separately.
> 
> This was split from the USBDP cleanup series. v17 has a dependency on
> the patches that have been merged to phy's for-next branch. There are
> some additional Rockchip USBDP phy fixes, which depend on this series
> (which is effectively also a fix).
> 

I'm not sure whether this is the right thing to do, but I tried applying
all the v18 patches on top of v14 patch1–patch27, and tested Type-C DP
on the RK3576 EVB1 board. And it seems to work fine.

Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi
