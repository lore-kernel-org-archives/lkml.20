Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.83.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384159;
	b=eXt1oOcRkHo+31jNfrYl8vSdy3S+ffSZQkT5ep2kviNWmPhpp2zfPqErAOD/wYK64f6F
	 IAL4IWr7AGzi6xnDE6m+CaFWLArGCPfGv5oHgzSoOZPeSsCMihLiutrW6er5RMYICM61f
	 geNlkKHTc1VYyzJQDabbQbM0v1HocrNqK1q5l7eoTccGAy3ja9E2ALIzePmjlfpIj0i0A
	 +Y6TvVgPHVjYcLVLp/wtA47/8nl33ks6kwodZySENWo1BJxKwMdQ9mjTVi2Ym3sxkm4k7
	 PwEEXGvCGxya7DmfD42JJP68nlBotayzZCiFMIjxPcDhRjmrNk6MI1TIP95bI0sHzuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384159;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=Yuxn6nAj6P3P6ckbI3C72QXKUgrDwijmCt+4xPmcvBg=;
	b=ST+aAoWdDYvGSvpXWPxd+J8u+YNwcJFlgJSrP9XwF7KBCxXNhVrg7tvPzFX1vk6mvnVL
	 h8a0a4w+SRkdzCdaoDuy8q5sBwl8b5vfkJETPFVTcgTaG3Q8na0yPMjTFXS029mIuSek2
	 IewUlrhU9/s+iX5jOO89470qAF4qN8k0oN1cfMcRrfPMZFxaCln+uEcJCA8f5E3WoxTGG
	 e4nITx3zPJa9VziJHv9gpeRw+FMzSp6chyBhYMS8YcOeP8YD9ituHBc23A/6t1kTip/aR
	 D6tj73fEoY6jrI5uHzMHUNRng2iyc60koO6m0+CIJT0JwQQNCyNwprVymu2+U2qvb8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hCIlTlgF;
	arc=none smtp.remote-ip=156.224.83.160
Received: from mail-m83160.xmail.ntesmail.com (mail-m83160.xmail.ntesmail.com [156.224.83.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD350606A31C;
	Wed, 11 Nov 2026 08:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD350606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hCIlTlgF
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54484c7da;
	Wed, 11 Nov 2026 16:02:32 +0800 (GMT+08:00)
Message-ID: <ea8fa04c-4a8c-4c55-b4fa-f37d74267e93@rock-chips.com>
Date: Wed, 11 Nov 2026 16:02:30 +0800
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
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Simon Xue <xxm@rock-chips.com>, "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, aiyengar1990@gmail.com,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <7e053777-31ee-4127-af53-0820e852d375@rock-chips.com>
 <10924894.NyiUUSuA9g@diego>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <10924894.NyiUUSuA9g@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c9a1463a03a4kunm2b6e8798a32d5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGk1DQlYYHUNKTR9OSU
	5PH0pWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hCIlTlgFF/kKTXUuZVx/XhX8o7QJdJ+96qL0DuZYrqBXvyGZPtEdoBeK+UO2IOftGEVA1yGcuB+UBEdSIvIcdwHKA4SjzmpOygnm9r+Dem6PagJBcf0HDmlACy3u6ESAGYis6gwxdbHTUhLuAuu4JaNmq1l/tS+DGnRhn5VOxMI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Yuxn6nAj6P3P6ckbI3C72QXKUgrDwijmCt+4xPmcvBg=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko

在 2026/11/10 星期二 16:49, Heiko Stübner 写道:
> Am Dienstag, 10. November 2026, 09:40:44 Mitteleuropäische Normalzeit schrieb Shawn Lin:
>> Cc: Simon and Finley
>>
>> 在 2026/11/10 星期二 15:11, Arun Iyengar via B4 Relay 写道:
>>> The MMU-600 in front of the PCIe controllers of the Rockchip RK3588
>>> (mmu600_pcie) is enabled for every RK3588 board, but its node describes
>>> neither the power domain it lives in (RK3588_PD_PCIE) nor its clock
>>> (ACLK_MMU_PCIE). Both are held by any enabled PCIe controller, which is
>>> why nobody noticed: on a board that enables no PCIe controller in that
>>> domain (an Orange Pi 5 with its M.2 slot in SATA mode, or any RK3588
>>> board without PCIe), genpd powers the domain off and the clock framework
>>> gates the clock as unused after boot, while arm-smmu-v3 stays bound.
>>> At reboot, arm_smmu_device_shutdown() then writes CR0 and polls CR0ACK on
>>> the dead block, the interconnect stalls, "reboot: Restarting system" is
>>> never reached and the board only comes back ~90 s later when the
>>> watchdog fires.
> 
> We have a work-around for that in some boards, manually disabling the
> smmu until now. As the SMMU is part of the SoC and always present
> the general DT practice is to have it always enabled, as it does not
> depend on the actual board design.
> 
> Hence we end up in the situation described above.
> 

I notice that mmu600_php is disabled in rk3588-base.dtsi. If describing
the SMMU that way is incorrect, should we enable mmu600_php as well? I'm
asking because I see a different picture in the RK3588 TRM: both
mmu600_php and mmu600_pcie reside under PD_PHP, not PD_PCIE. Therefore,
even without any PCIe controller enabled, PD_PHP should remain powered
on (it is never added in rk3588-base.dtsi, so it should be outside the
kernel’s scope). How does the original problem occur in that case?

> So this series fixes the actual underlying problem, making these
> workarounds unnecessary in the future :-)
> 
> 
> So definitly thanks a lot
> Heiko
> 
> 
> 

