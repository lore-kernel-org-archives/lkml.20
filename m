Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA49450412
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767499; cv=none; b=OUevyiyrAdNE5V/d+QL5uiFvHwELsWADdP7CNaXiuIBtnZVZrL41ioUtVBYHg3RrafCr1pYbXXeHbmXPXbSo8fo1NcxN2sL1hQsOhCRct0lqGNNk2EFzLLGbh/bHG6tFoRPNqUUGYVHLdj5T/HSTjZ8pKoe8fTQXSY/AKQ0MxuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767499; c=relaxed/simple;
	bh=poceB6zKoYQu2FsWNzDmrgG3238OZ8RROO5Gpc1RH5Y=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Cc; b=mnB59AYfOI1L2/Fgc2ABvTaCMZLwzmqKgUIAiEgZCx68TNifQDsq9pPMK5F/QekFX7oh8kzz42a0ZyD/AlIYCAeWXKog2Sv8qId6TZP900y4MsHZvQuBIwmuGozR08t4RxQmKumLg6PhzAzrYs+7+kcUssw0cvWaXTJun/Cz2YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOJ7klXv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOJ7klXv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so28260465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767494; x=1791372294; darn=vger.kernel.org;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poceB6zKoYQu2FsWNzDmrgG3238OZ8RROO5Gpc1RH5Y=;
        b=iOJ7klXv3A5wy5m2b5K38Pa1IoXSzcyv6XZmgtoDkKETifN3ukEcVNNJSmQbvnjUXo
         0NufnfzepqEUvUI//pAO0zFiBJduntesl9v3P8bICfVtclhjLfOO0tPH2SJg/79stKIf
         iyP7YHtHVwBRAgfN+Rpme27lJ1MB5KjCEKAxGIWl1ETYyd9dciRuJ1rjEZXM2dBj+S72
         4CLoNkZVnoPsJIh1bTuEanZ3Or4AtlpxxLO+9iaeHA/ennOjUnCRkamrcdnS0uVWiwRR
         vGOTLDnyPaJ/M+uTjEUQqpzXMZGblOzFtH6it/8SnGiZ+SXueGFLrzFlrAzrXeQQZWmr
         WLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767494; x=1791372294;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poceB6zKoYQu2FsWNzDmrgG3238OZ8RROO5Gpc1RH5Y=;
        b=OU+NH3CEn0I1LTobY2F1BBQ8AN03LlxwvdsMvUOHJo13bCyYGTq7ZhL2I4dVuCsKoB
         Dp1OWpuOCVaN9oV0/7toa9iMXtANXsv4J1hxX3tUGbInKpnw7juvQDWudf1ybPFAwCzv
         7TeaRu/l5SOwLJnGD9CMAg6bSFwnlyjo4HNMjrmAbynk4jB7P5kfXqsw3+Nh7I6MAppy
         KhYZSLScRNLIURdhwSvpomH0fJ0FcEXP5G4LCRx6C/vXiY8+KIplp28vnsX1EiI6OGFU
         6LPSh3UN40d0Nf3mk1tL2pykFNQw0s/d3/r19j9eK4uRhn9KKfEZzWCM4xgS9cluDOY1
         Z5fw==
X-Forwarded-Encrypted: i=1; AKwUvBySZwyqale8sMEsdfbOUAwsQvFS2A1S6Jv2n+e2PMf1bKdLwRKOJDnR451+0PYEvO+5zgAtcSXhFCBCyqk=@vger.kernel.org
X-Gm-Message-State: AFuF++k1taRhLLil7F6eNnaKBAZkWWlgYAMhAbCm42QqAauULRG7HvWC
	fiW5f71MDY+/tmnrxcdv9/O5Q4Xb8tqHcVX+Wcx5put0tfkeLvhSslp5
X-Gm-Gg: AYBFou3lmai+RqymEEMgvUwyfkeuqLJKmnrdO983lZ6rjol7gtlOpOVdZUFbjY1ymxJ
	K7rJ7o6ysGDjdY7dRosmQYumecj0EMPijaf3zlUcJAXRX6byVa6IKdDpVGkKA4jn3s/75gJbndm
	zqYRdHbX237g4PHRmyahU0uLGB7UzigLiroOao+dpU3dPYCCAUDfM2r7kMZZrR75Dgeez8wbaX+
	n4v5FNTIMwGdomb/G8G9XFyBpWdl+n+4ULqsAVIbiH3X3GAt+LOKSWzRR+oseSVCNfJGXnayKgV
	V2BlrXX8HO0kcNkQilw3WTuVj/nbWLZdHqRI2IZ6DrK89WR+ins9nWAlyiviPjkETo1ubPUiwNz
	HoOjqsub2wGXd0n39vL7jng16QB2To4ds0qug+3sdr+SyvDY8HmA/TFQGJfp9R3rRW11qvJTRVl
	7+j7Wf1CIpLZ8ugSY9cqyahEy7muCoaU+t38NPwYN5FaM+cF5K6s+B/mWVh0MxvVOZRnGTcfq6v
	JP8hieF1sOV7f9Rg/SWUTKgLVKw8DQ1
X-Received: by 2002:a05:600c:3b0c:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-4a01aff4fb5mr16519855e9.27.1790767494156;
        Wed, 30 Sep 2026 04:24:54 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01cd002bcsm3626105e9.4.2026.09.30.04.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:24:53 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject:
 Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
Date: Wed, 30 Sep 2026 14:24:51 +0300
Message-ID: <179076749140.3134070.3869742286743401078@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>,
 Jason Li <jason.li@cortina-access.com>

On Wed, Sep 30, 2026 at 01:08:07PM +0200, Arnd Bergmann wrote:
> On Wed, Sep 30, 2026, at 12:57, Linus Walleij wrote:
>> Look at this in your Linux tree:
>> git log -p b61c8bf4694b5115766849378dcb8787ff54e65e
>>
>> This is essentially a resurrection of that driver.
>
> Jason actually came back this summer to try again, see
> https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-1-jason.li@cortina-access.com/

Thanks, I was not aware of either. Comparing the two, it is the same
IP: the offsets of CFG, RX_SAMPLE, TX_DAT, RX_DAT, INFO, IE and INT
and the bit layout of CFG, INFO and the interrupt registers are
identical. The Cortina Access version additionally has a flow control
register at 0x04, RT_TUNE at 0x0c, STATUS at 0x2c and three more
interrupt causes (break, RX underrun, TX overrun).

>> Anyways, clearly this driver is not just for CS75xx so name it
>> cortina-uart.c simply, and update symbols accordingly. Kconfig
>> should be SERIAL_CORTINA etc.
>
> I think we clearly want a driver that works for both the Cortina
> Systems CS75xx and the Cortina Access CA82xx, hopefully that
> would also support the ones inbetween (CS80xx, CA81xx).

Agreed. For v2 I will rename it to drivers/tty/serial/cortina-uart.c
with SERIAL_CORTINA and SERIAL_CORTINA_CONSOLE, and name the binding
so that it can take the other parts. I would keep SoC specific
compatibles ("cortina,cs7542-uart", later e.g.
"cortina-access,ca8289-uart"), so that the flow control and the extra
interrupt causes can be enabled per compatible.

I can only test on the CS7542. Jason, would you be fine with adding
the CA82xx on top of this driver instead of a separate one? I am happy
to add the compatible and the bits you need if you can test them.

Thanks,
Fil

