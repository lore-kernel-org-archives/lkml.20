Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1242FD1B3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112126; cv=none; b=YhmzRalQbIjy2iphHilUv5vstouYAlRH43ZsVNh2ZnbAw68SjCb5lxxH3p9MA4ImHJJtqaFu0WAMmloxC3Whnn9xwSG74WVijWTO56e4YQB03EmSBtrQqo+mt3cVlfxPW9kCg1DGfW2e+OufmD6Qh2gvSSNoZnfoMWFq6uDJ5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112126; c=relaxed/simple;
	bh=hh8xym4JQgXHNzgZxH22Nfrp1ofGYWiJboNIC3qrWEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/vQPZtdPvohrX/oV+UG/+CWOMufmdSPY1k5s2aikcwRB8ZwYIYm/gmTtBEbBcNoQPk93araSOKhcktG3paRgwFzQjcf3v9z3jWT6Hr+VApjicqj52HJS1kyI4BM0yAcZ4tYceyYpZgTzah3bo8mr150p0FU0OM8LKfZVPvlKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffr9yJa4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffr9yJa4"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89edb9bc666so682764b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112124; x=1792716924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=;
        b=ffr9yJa4Ylyc5r1jcrxJTU8I3u1E/Mt4QU9l3pMIVXMIkrcXG+aPiERrOutIXp/+wB
         21TAs/yestfK88VmOm01QZk8prwgTo9yZbFpWpTs2VbLyjqgFh008C6yV/YLnGjiALzC
         nhPnAX34291O3WL8L+/5x5vsjDb2cyrZWmUZ4b6YRk2ulNp8GzdyU1PbRIGdsFZg2jmE
         B4Ge9qxO+igLHzXM57gb1L75aJCPUUllcpZfCMrnetO4wpzLzc6LWtetkqzFMpOR/Yhh
         5Sb+MnldKquKkLN3WjC1Z2he85WasGZjD1wk8z7xxf5iF86dxB5ToM6JGP2I7IRX+a2t
         CA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112124; x=1792716924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=;
        b=bOkduF/nah+/QZpsUUXXOvwxRPmhHAjphwknK87BlPWZgRmVc6s6eruw7ft8ETAcxd
         DWR4tfN3RR12lFBggB+cyoMFRWBGIBHMy6Ep8j3tQGP8VXnk99PahyKrIN5GSa7xWxAI
         WjaDYTIc+JmgrPKhA4cjmN4nCB57539fXN023txkxx9z1QxUERf+B+NkSHtZ6LUHGrYq
         m3gbacM1Vo81jlJto1+0BhxdrOmI1CTImbBhjj6BnSuiDNR4n/klZn5VUuKArhTA8d9p
         1EGBSJNVEOqJlA2CEO65edaYhV+GiqyB66/z3mqynrJHevdMrFiPmvdSeErh2TfemNGD
         SKqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwLeSItkF9u2UXRlhzmG6bIVCYg3SBw2mH6HJCarHn4dcanyGSN+iXoiqPQ0JDGHD50KtoGs0QBFDStPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1DuiVpn6zo5F8dhYtWh0VLd2hZ7ECWwjDc0IiCMof+EjC/xGq
	Kg1EbN0uYJK4jdye5THbkUFFiDwF9LAdw5lkGtZgt2MeShxWGW7+2Gfn
X-Gm-Gg: AYBFou36p4mxdHqJlOzYKlM/APkHR0K5k5X/4bZ+ssF3bDgakoy2kx/3DbjMGqKhlFs
	7SRbvxnfs+BkBKFGhPwuJvyPAy/UxNxBcyJmwkTuXFt6S+OZlwXru83ojsR3eIIWHHzZKatHJZG
	ZKSJqcmq9M11HL9bwMcqvB7d4XbiDPNTibu7OrWzvKa1LKRTtBkR6O6Z+8NGgneLFPSlqvAj87m
	j6THNE1bXWxDWNB45cUQ3N5tAeStZYqIs6ZmcZlC+E/BXPoQDKOF9j7GRGAeqosavptT2t9dUVY
	yp41ic1LE5s7YRioqCYUHQXgW0S1HEkvr6fnz67SZda+jkSujZJJ9MvoToLDjPwRXk83hYGfCw3
	vOeoamhGelLJtPaPl88xCIbdoW6lEJhCMoj4qhP537ybMyauiQnA+Rwnsjn8edRZ44eRwD43xAG
	QmZ4Lm1xI9thYkUaTGxhC6OnzVCxtv1kEDKfJL5irekjsqtTp5tMCpw9rZlquGrPYD9sf6OoeAR
	TIrmbaGOLv8MemUQ1lgsdveIIM6cj2cOgLLbUS+ZrEdYg==
X-Received: by 2002:a05:6a00:f04:b0:892:a8f1:c53d with SMTP id d2e1a72fcca58-897c76e25a4mr19506420b3a.22.1792112124477;
        Thu, 15 Oct 2026 17:55:24 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58416a5fsm311339b3a.60.2026.10.15.17.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:55:22 -0700 (PDT)
Message-ID: <b30445d5-c5be-485d-a935-8b574a7aedea@gmail.com>
Date: Fri, 16 Oct 2026 08:55:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261001075101.489660-1-zychennvt@gmail.com>
 <20261001075101.489660-3-zychennvt@gmail.com>
 <as9ZVx9TV5NpW1cK@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <as9ZVx9TV5NpW1cK@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andi,

Thanks for your review.

I reviewed the Sashiko AI report and will address two findings in v12:
- Disable the dedicated IRQ during transfer state initialization to
prevent the IRQ handler from accessing partially initialized state.
- Clear the wake-up control register if `enable_irq_wake()` fails.

For the other findings, I have provided the relevant hardware and
driver design rationale in my inline replies.

I will send v12 with these changes.

Thanks,
Zi-Yu

Andi Shyti 於 2026/10/14 下午 06:29 寫道:
> Hi Zi-Yi,
> 
> On Thu, Oct 01, 2026 at 03:51:00PM +0800, Zi-Yu Chen wrote:
>> Add I2C support for Nuvoton MA35D1 SoC.
>> The controller supports standard, fast and fast-plus modes,
>> and provides controller/target functionality.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> 
> to me the patch is fine. Sashiko has pointed out a few things
> that require device knowledge. Are those concerns valid?
> 
> Thanks,
> Andi

