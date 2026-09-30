Received: from mail-m1973178.qiye.163.com (mail-m1973178.qiye.163.com [220.197.31.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2440C3A6B6A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761297; cv=none; b=pgckAHa0DkwEbBh/eI7vLWazbKNpHE0Sqg0RoGaTU9imo/cJiOdM14Br6IdkeK+YYslMoXzSyqv0ruAxM2pfv+Wsfx6gbMg3h0WNEgmc+o44u3NEZwhDna12KBhPnaD7nf2n6nxCboqXEhHkFpXocDZC60uzJEKmfKPgz+lx8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761297; c=relaxed/simple;
	bh=PSihbL/lcZUPJdCQfl7pomOe6VI9SjXYK9snyO423vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzE/4x0p7lcu1CDyL7JyNqyGQQyZOBkFEuBuY9rD+zpjg6z+1/ECAe7tKXOzZPHczQmdQQbI2EgBZrEGHwiVq/a8gIqZLKobo6/PYDvPJAgRV6EggADfRaqS+l9+4H6BaDBEFysSvbIPcQrvTms2+pBVVQP5sJj57CzdWsezReU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UCx+q7fR; arc=none smtp.client-ip=220.197.31.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UCx+q7fR"
Received: from [172.16.12.11] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4fa2030e0;
	Wed, 30 Sep 2026 17:36:17 +0800 (GMT+08:00)
Message-ID: <6fa1e90e-49e9-495b-8b17-6ac54f441313@rock-chips.com>
Date: Wed, 30 Sep 2026 17:36:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] mailbox: arm_mhuv3: Keep the combined IRQ
 enabled during system suspend
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260930033657.312266-1-finley.xiao@rock-chips.com>
 <20260930033657.312266-2-finley.xiao@rock-chips.com>
 <20260930-excellent-hallowed-cheetah-bfcde2@sudeepholla>
From: Finley Xiao <finley.xiao@rock-chips.com>
In-Reply-To: <20260930-excellent-hallowed-cheetah-bfcde2@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0f1ac052403a8kunma654f6034a9696
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGRpDVh1LH0pNQ0xDSxpNTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=UCx+q7fRLDQVKoSoSo69UcDEYNN+b6D8WvTCx7ZyOUnsq5EdR/tgyg1Ek8/IkINWvlXbx8uVYhJTvrXfgt0MS5PLGtY4yfbYEveJm62UnNSPBG8gbuQz9XSf72plzNjyeIKfJL/av0ywhcTMt6EHV7b+dwjyMm13bFWe2PaoWk0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=n9B3SR19oJ4S3wTqH54qXg87P04aoYoMU+dhTQW4GQY=;
	h=date:mime-version:subject:message-id:from;


在 2026/9/30 16:50, Sudeep Holla 写道:
> On Wed, Sep 30, 2026 at 11:36:57AM +0800, Finley Xiao wrote:
>> When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
>> SCMI clock and power-domain operations still need to work in the noirq
>> phase of system suspend: genpd may power off a device's parent domain
>> from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
>> scmi_power_state_set() and waits for the firmware reply via the mailbox
>> RX IRQ.
>>
>> However, dpm_suspend_noirq() calls suspend_device_irqs() before running
>> the suspend_noirq callbacks, so the combined interrupts are already
>> masked at that point and the SCMI transfer times out while waiting for
>> the reply.
>>
>> Both the PBX and MBX combined interrupts are requested as threaded
>> IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
>> that firmware replies are delivered, and the PBX combined IRQ, used
>> for txdone by IRQ when not in polling mode, needs the same treatment.
>>
>> IRQ threads are not frozen during system suspend, so with
>> IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
>> noirq phase.
>>
>> Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
>> SCMI remains functional throughout the suspend/resume cycle.
>>
> Looks good to me. Just to confirm, the expectation is to just have the
> IRQs functional during suspend/resume cycle only and *not to wake up* the
> system right ? If you need wakeup, you need to do more work.

Yes, exactly. We just need the IRQs functional during the suspend/resume
cycle (for SCMI traffic in the noirq phase), not to wake up the system.

Thanks for the review.

>
> For this change,
>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
>
> Jassi,
>
> Please pick this up for next cycle when you are at it. Thanks!
>
-- 
Best regards,

底层平台中心 肖锋（Finley Xiao）
************************************************************************************
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.
福建省福州市铜盘路软件大道89号软件园A区21号楼 350003
No.21 Building, A District, Fuzhou Software Park, Fuzhou, Fujian 350003, P.R. China
Tel: 0591-83991906-8602 Mobile: 18506057603
************************************************************************************

