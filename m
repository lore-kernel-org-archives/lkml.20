Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02F9397943
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450978; cv=none; b=sa1OD+afeXYSlV2jZLySc34785EBDpg5fjf/GNUrS6Rb24OpDA4a4jt2HFu/BVq+OazRJEBtqeAf7FjwsbnuuynSGq9TLRk/mygdK7UPsIvsZDri5BfYTc9dGNhiZQJf0z4ZDhWTjzVHtgXS8OoAOkDEnBXa7yfBK5/YYr5yf78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450978; c=relaxed/simple;
	bh=1ebgJkP09GKvWRwvK5F2YFranzNOE8JKc24FCxtrAac=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gbQ3QeHwxSU25H4pJ7Ma4sfWOd0DM8f7iLcC5wjnVgMdYvb8Emg3sUq927/EAcL8TQygLTDuDP56wWM2zWTrd/+HiHqMtGxni4DlUivT9Gv5YcpZAhugdPG5vk1ve16H/5gAo8CrpoO/LLycJhM1HMA+FZ4MzwYoNSo7tnL1QTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNVA/a8q; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNVA/a8q"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0abca97c0so989809a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450976; x=1791055776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=SNVA/a8qgKUb3gTUOZ71bLh9aF+GX/IvEj7/+R7clocKI6ceYsIqQxLVlGEEAXwKty
         O3r8ieBNfrCcDAha9sevmHF/A/xdcGeaZFZ1MBPOkQS+lOC562MAXY4fp1Gl/HoLADSj
         MUL3qzcxewg17wzMeXAl8PlDRRYUNLwHLWODcEvyM5avk9Vwag0V4EEQrUkXzIXehbcq
         fHay8THxNPJiVl3V+EKUrgQd+Bd0D2kKVLiFXPunkjZCca0ClkHU4VQwn16ETrVwwdFS
         lDw9Y1LerOfh8LwqR2TuTjoHN8FNemW3e33YaAtNKHKynBmLFQ5Tpjw5O9qJ3bo29i/O
         8Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450976; x=1791055776;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=K6sh+pvyveUkI7O33Dt8XC/cACOR1Y58BFisAQVtwsKyKnr5auF/Htqah+PSH13DC3
         Jy8H+7ynRj6YDf6ZYoLvCgejv+O+uXuJIxxFFgNR77jaDsBzCGO2UNPNYFbB6NVvCU1a
         bmuUVG46yDJ+iklTQjyOIYMAO9rQfi9qEYm3BeCstSeB9H4+Rdkk/tptkGt3i8uJhy7U
         mEc4TEkXU/eT6MakWY2lsxDmhNwJsN/3YDymywPs1Y/eLxfKIbeReSGR1bJqnVZrnoxc
         WYdtr0QWSM0bQghvQejiox9IzrqGR8QwkMNVgwMPZAo5Jx2Of/iRG0YFdmBQ+4fF3c92
         3ndA==
X-Forwarded-Encrypted: i=1; AKwUvByJHXCU38PPSY/xJBDAoX1iSIVyGaHCIyisl8LL+yGKgHIopkXwS/cPdkjlnzZu+e9BUiYtJJoRxvo8PFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlL5c76gJK9VG/kQPLU31vxudhVNWjLGw9J92ERq1iv6ex98sr
	7ewoP+ilOY/q1oZh3DV48JAs0/CV7S/PMAxBIvBXnfN9EV/6TbT4Mzt4
X-Gm-Gg: AYBFou1rQ5JQuiQj7tV1bO8snbsBhJzPnErQBJJFKy1iK/JbK6mDL9aSWuzP5oh8n2w
	tqeT8SPoDYgE9tZcofdYlnguXHWipQkWhJrA1bk3m+JWS4yHcQUkLzYQoMnmHfBMjju3+c5/Nvm
	FopYaAxQw1CBOSqe4562YDJlgYB8kRR23PieMyrFrVQPklYFpZ5R3brbZP6rJJFkuxa36RTzPHa
	nyNPXAdroT+v7qcwoc4DPSHYVetEBaH8fGRyo4+chC6bhns3rkT2ijgZSngjZFtkdmBvvdf0s59
	SO69I8WWf8oVAf2hNiS4FyNw2dTTiDcC9wWjfvFb11f1IYxhpJduTeE4nsW6Qc2F7H/hcwStFTT
	3taa3hxgQGcgdVIpOs45WvBxjmGbpsEBmzp/yNu7AZWWocsrqFso21PCGo1D/2i76mddkCrZRlh
	v/M6WYg1BGjPhgqaCo01EK3udHlt3lrUW/cCeotn4IZhT+DX/fqXK1Tq2bM7baoDedVSX6Kf11/
	XwZm0dkWOX3laidSIy2Z1iTT7pWRelzjVLSp7U4s5U=
X-Received: by 2002:a17:90a:e7d2:b0:3a0:eb54:2e60 with SMTP id 98e67ed59e1d1-3a0eb543751mr1574379a91.31.1790450976021;
        Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm3564492a91.3.2026.09.26.12.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:29:35 -0700 (PDT)
Message-ID: <df064f9e-ad54-43fb-9b25-9e2869506732@gmail.com>
Date: Sun, 27 Sep 2026 04:29:26 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Linus Walleij <linusw@kernel.org>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi,
 alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com,
 alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch,
 arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
 david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com,
 festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com,
 imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com,
 kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/09/25 22:30, Linus Walleij wrote:
> All right, now we're talking! Could you test and review this patch:
> https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/

Thanks! I'll take a closer look at the patch and the discussion thread.

> I do avoid touching the v7m path and it worked last time I tested
> it  (on an STM32) but I'd like to see your take on it, AFAICT generic
> entry is not really possible (easily) on v7m because of the
> pendable service call mechanism but maybe we can think of a
> really complicated solution? ;)

I have experience wrestling with a PendSV-related problem in an RTOS kernel,
so I believe I can contribute to that part!

Best regards,
Yoshifumi SHU
