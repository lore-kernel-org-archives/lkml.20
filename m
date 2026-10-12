Received: from mail-m49217.qiye.163.com (mail-m49217.qiye.163.com [45.254.49.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC5438038;
	Mon, 12 Oct 2026 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788427; cv=none; b=ILkNF92Bwv6s9oq2KkoVGGp26Yn1J3qAw0jUK3iS7aNgSeJ0rlqk9G2LgkllTxeSJ0pbxmPJZY70HOF5PKB6FNwsxQ4/tkGwOv5YQWRlaz2JsgsaIWjvqVvdBG/J9hME0pu0/D6eRrT4PTqV26ANHBR/8Hjvtztb7lRtUq3Mg8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788427; c=relaxed/simple;
	bh=yte1LFU6QRbZw+AlAuNBiwPEpuNE4gOaEBRka16fryA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UZDB1W3RZLifU/UbyJJ6qn+PhGnPO1HM7llT5SHVbY1LcOee+ItVE5PaAy4Dg+h/6zOb+GHbAsnBlT3j47WjySC1wXO+W2kmx+en/TAl8+P44cI98AAuDzpF1t6INGkttu0s+u6NvJOf0Qy60UMd6z5CeJwMQAxMXOQd1LYqIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=dcu/8Cbe; arc=none smtp.client-ip=45.254.49.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="dcu/8Cbe"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50b00267e;
	Mon, 12 Oct 2026 14:55:04 +0800 (GMT+08:00)
Message-ID: <5c8a2985-e1aa-4062-bca8-fb05809b0d3c@rock-chips.com>
Date: Mon, 12 Oct 2026 14:55:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, heiko@sntech.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Radxa E54C
To: Chukun Pan <amadeus@jmu.edu.cn>
References: <4903cefa-4926-4bae-93e9-1165bb9ae646@rock-chips.com>
 <20261012064010.1837103-1-amadeus@jmu.edu.cn>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261012064010.1837103-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa12ee4bb9903a4kunm5e92b5b71addac
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxlOVh8aTk1JT0IaGUsaSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dcu/8CbeQxrj27k75dgmHMQK6ZG4pjwsRnfgVTy3VCZnsY8P+MDVlGNRuoNvTij7L2dO5fIOYhNEptPmKWbplAQGYt3St/9nEpH4XpkDG9TgqtyYd0ditS0+jwqoM4+h2f2afFrULgkuZqTjvgtqXrQko6tLcWoL8JYuUpGgOaU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=d8fEydYQ9ABesQI0CRxDNvPg0eyljVYmUDFMToCw+i0=;
	h=date:mime-version:subject:message-id:from;

Hi Chukun

在 2026/10/12 星期一 14:40, Chukun Pan 写道:
> Hi,
> 
>> I was checking all PCIe part of rockchip dts files and wondered why it's
>> marked as an always-on regulator. But if it's actually not, it'd be
>> better to improve it later. That would make reset rootport mechanism
>> work better.
> 
> Please refer to page 21 of the schematic[1]. The 3V3_PCIE regulator
> is enabled by the PMIC and cannot be controlled by the kernel. So I
> think it's correct to mark it as always-on.
> 
> [1] https://dl.radxa.com/e/e54c/hw/radxa_e54c_v1.2_schematic.pdf
> 

Thank you for providing the schematic. It does appear to be in an
uncontrolled state. Theoretically, PCIe control timing requires a
controllable power supply. The current design may cause trouble
enumerating certain devices due to always-on power. Unfortunately, this
board already has always-on power, so let's just leave it as is.

> Thanks,
> Chukun
> 

