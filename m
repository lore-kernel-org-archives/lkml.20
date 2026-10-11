Received: from mail-m118102.qiye.163.com (mail-m118102.qiye.163.com [115.236.118.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AD2EA749;
	Sun, 11 Oct 2026 03:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791689820; cv=none; b=Vsb7tdJO4vMEyqCGlWHg1g3nYteEvg9miqnCiZEHoRg5NEggVjC9U6EazJ8euxn5vpobtn9o3esVBsfcYUPjcoHIF3d42r2XLJ2jBH60Qi2JklLk86U6WJC7yZmvfWeDqbZaJoLyG6plDzZ9htA8LDrTe1GhrdrAfsz6T08oY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791689820; c=relaxed/simple;
	bh=XtgjrnT4ht7EQi1cG+vxpVgVdF+Q879BQNlK4XK5ajs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NtrEWtyY/80754UKJz/7lCo7xIUXEH0QY0tGQ8Wr/eH04v+NEGME57k3VvHa8URvZFiYAkqzNb/5z6i9zhGq4teaXec+9eyzi1fHdyaVsoA5COJ4hTJdcm9NFYRKsw60tyXVg9NhsA5zS+3DFmMm54mbQxTM0TcFlsyixUbTer4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=JLDjmmg9; arc=none smtp.client-ip=115.236.118.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="JLDjmmg9"
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5098b255b;
	Sun, 11 Oct 2026 11:31:43 +0800 (GMT+08:00)
Message-ID: <9a8c6a76-8972-4b1e-8384-842668621fce@rock-chips.com>
Date: Sun, 11 Oct 2026 11:31:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
To: Bob Hui <bg9oxa@163.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com>
 <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1290431dd03a4kunmba7fbebefd914
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ01MGlZNTh4YTk8dSx
	pMT0pWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JLDjmmg9o/8Q7fsHV8WerOkHOQUPDsyvEAY2gbZWMRzcj3vXOEmlcrFuksiFJFLnnS4u4x6+qZ14dWnHXOG6S32X8B/R6lwVM2PbK8QxGEgkofJF3YXBXCmgmzvzq0SdLx2vT9GYHjRdij3uSLz1Oc/TQhwPihFjKeSl6l9zx8c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=yCpg2ESHQC0kLKSunXHQ5tFhB92LVhJUQ3PXxAQdGmo=;
	h=date:mime-version:subject:message-id:from;

Hi Bob

在 2026/10/07 星期三 13:18, Bob Hui 写道:
> Add a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S based card
> computer. The board comes in 4, 8 and 16 GiB LPDDR4X variants with
> 32 GB, 64 GB or 128 GB of eMMC; this was tested on the 16 GiB/128 GB
> one.
> 

...

> +
> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};
> +};

Is there any reason that you marked it as always-on?


