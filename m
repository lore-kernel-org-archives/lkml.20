Received: from mail-m127112.qiye.163.com (mail-m127112.qiye.163.com [115.236.127.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09225B0AA;
	Sun, 11 Oct 2026 03:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791690601; cv=none; b=nPp+ipKX3BMFG51O6RhG8akjacYKOL95hX0BKd5ibQEb92N/bmMCSI1sW1TPvj5yJ0kXpEWdyQDZaQMzN8f2RhZBnpdZ0U1Eb6KkjIF8IJ49i9KVyVo/mzfpN0059/Z1tNXWWDLce2ZzQZrsjCgfRAWoXNls8mte4lbK7+4neJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791690601; c=relaxed/simple;
	bh=w+Q4QNaQtU5M2MvS+QMAeVo+QTEf9KrmD0WafBFtqQM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O8Ve6oRW8XFD0WhON1ZRWX+AyUAuac0mGPEJAmu/Rmb+ZmeD98QTVfxC7i37yKATQUEslovwiQREt6GH6yhh+2bry+22atpfdBzR4nmSd4btkNrkEGj78SVlgpEB3qKwPv1h6g1KU9zKN9HM3H5B9ChMA7yTx2lmtG569zSmTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SS8sBXux; arc=none smtp.client-ip=115.236.127.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SS8sBXux"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 509894f63;
	Sun, 11 Oct 2026 11:14:28 +0800 (GMT+08:00)
Message-ID: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
Date: Sun, 11 Oct 2026 11:14:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Radxa E54C
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
References: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
 <20260820100020.3370385-3-amadeus@jmu.edu.cn>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260820100020.3370385-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa128f466c803a4kunme554c163fbe0b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRkYVk0dHRgYSE5MGkkeGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SS8sBXuxdz2my2paSh1oyHFK2MqPW/SkrpaWpdTRGmV1NvKGXoZXlSeOQ/Bd5kv+xflRFmZd2ube+W/yo+MudCLmH+ME+jTgY8jCD4VpFtZL2AtA/I3mz/x8Nyf77PN3bfCQU9MctwsCUetZlef3VRw+R9k8b1wPbCt52lHmODs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DMFtoZqWRCnK6Yp6lCte4tFbFuG7YOga9wTlhoj+Iqk=;
	h=date:mime-version:subject:message-id:from;

Hi Chukun

在 2026/08/20 星期四 18:00, Chukun Pan 写道:
> The Radxa E54C is a high-performance network computer with
> the Rockchip RK3582 SoC. It has the following features:
> 

...

> +
> +	vcc3v3_pcie: regulator-3v3-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_sysin>;
> +	};
> +

I was checking all PCIe part of rockchip dts files and wondered why it's
marked as an always-on regulator. But if it's actually not, it'd be 
better to improve it later. That would make reset rootport mechanism
work better.
