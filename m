Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804567;
	b=NDVJ7jE+6IcMxpdjfHF4MxjwvAhH+SIlZ3UBNNoPvBGOW3Khdl5wdBoahXZMhRjB+E5Z
	 5UBRvnnGdrOhNXwEwuX7xH8lnAJBFbmVCDKkVuJ2B0S1pdhecnkUCK/bF73sw8uGC0rng
	 m6OHsHzNZ6+UulDzZd0p722PTJwtEov8i4+qwgI6DG+N5qBgPrfjFa6XKKv44sq5D2qDy
	 kfZJi8mBA8M6QGieS95MDBdSADo+jkvWZbsRLKLJNykX3/Wh1lR2NT12H8MCcT/BF8Co3
	 uepIEagH5ArXQ5LIPd9fOkOYrq4zRiKjULNKUWuQzmAOQ0GbGSQzmAI0Nc84dLc1qbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+r4qanG5HFrQTkiMyL1knKm50Zsb7RunVimgg67J/4k=;
	b=bf4Vl2UOl/LhK05/POp5TcVi8BHBJY8HKpDUSO6O+uqWWJ39wGLsuROgGsWoGkyWV4Fs
	 xEDyVxgZUN7yP1+KOuUfWq52t+GkQJN7zSu1Fe6mL/JpIpX/aHS31lQ0QR48RZO0vYfyV
	 WcCJ+Wzcgu4DFRo2K7IHPbLHZKqdJXgfhqdOGHf7VIgZgBgWSXEnej3H/pIHaINkOrqlp
	 g7o3zxKgSYjZICwh4d0D87vbDsJPYmjtiF3dhYfB01Msy8Y8y3cJDxy6srB1kz+0HY2sg
	 bVdBTO/V0/1StRSbmD90qTxxYRJhjLXA7eRbOTgb1rsS2xp5Rw0B++yrDvlZ+aZkoAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJlMStIv;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD87606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJlMStIv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37628596783so5054517eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804566; x=1795409366; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+r4qanG5HFrQTkiMyL1knKm50Zsb7RunVimgg67J/4k=;
        b=jJlMStIv8CO/WWwH3KJUMlP+JqEIb5EABQ2CNUKnv+nIAQo5R82ulSn/HPthFhksLl
         T0GcMxMZnAANMIf/VY6cSW/O3lZ/iGdwoF0j95clk0+G/tS0tw3q02wTSD43zJothtAQ
         JfEBwRUZ6mPrLlAOrACebwzHmpU9l5dOwW1HqNxGA/lJcEyJR79JPsWQD6a0xNFqQB3X
         xUFmzg4vlhBYYjrRwgR/aCPOKquuPAEBnY5DooF6a0mRTzHjiAtoytANiZ/bygffHdqm
         se3c7qO6RR0bZuY8FJANMciFcQ/kVOt21VIHXY2AMU8j1j60eJW0fo8WmdSaMhXNfTQ/
         f9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804566; x=1795409366;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+r4qanG5HFrQTkiMyL1knKm50Zsb7RunVimgg67J/4k=;
        b=OR/StGFjKbDfuzV7Ia4+jGhQ3zYhDeqs4GvPVoHLTNYFxYa7a+TgngmyB1a93gfczl
         d8e/9TZpXuEotg269C7V8KS+/BtOPtuAXiTYzfvv38xEMLzVOxr1ATpZ64wa2vkYrQao
         f2FeMGn996ll3+AAeH73006B2rSviADFpC8/OhV6vfjQGX4eZQTtjStm8tkVbesdV7i5
         wSEjHYjsFSr/9NzqsPmNvs9V1hlBJchp0ZLgEq1G2c7Tpof+KUX7TfCOTxGwOT8gfQg+
         maxwK6fSDKpJGu7tRDvibNDpK47dOB8szCkZipV3dDgGWsDd0YweWA461xHVGNMmhMmA
         JSsw==
X-Forwarded-Encrypted: i=1; AL+hErEoTqtt2uN5+FlXyxWOG0K0BwM2n3F9N5gc/YxL/+FLhS4FJJKxJ6R6M+JXhmH96njJbSTBMvSxnc0ssvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z89uPahzpBkZ3FSOQKLlmovTfc/vKvq9GS/hbYjk1GDYL8rqcd/
	xLB1uozLfW90OkHG4gWfo8dwLaVj1JeyEQJ6v7PV/0Vzb0rTonrf932A
X-Gm-Gg: AYBFou0rnGpM6eVHz8vSSGTFwh9GvX1aRPj9/Arn92Ezd8FzEsKHxsyzpA/v3cyG/81
	wM2NgT9Ydt6VKyzczRLsyvn63e/yBDLLPoYfPQ1E0riAGWuzp0WIgC9/lG5S2YUCISA9/jMAaGt
	NSBEdWdvzcs8IRomU7O13zzLnunk27ji8nyu8D7DbwvmVdr3J36pBYd372aGxB9ncHiM8MFk9B6
	cA1OQIj0+n67L4yAWJbYeAAIyTA/3nOPGj2feL4tCehFh8wW6ykHUQmeDSwfqJCzZUfdDcQDkO5
	7QVVWYyELnihgO+RUNmyY51YtBa/OyM+0kzlSOP7IdL92tYzMiWVO4yGeCu3d7/2xH2+fu4g+cQ
	LrFDT8ZborZ6Z/zmSuU9J8EG7Mb4VDAiY98pNBG8KWIx/9ElSiLVzSIDn1EDlWgnbIT14fCGZYF
	134w26//DCJUP2Ghj5FmJNFaLq/H8ojodsa1MkO4kISaLPQUDPLN2UYhPFqcUxqGTeSqGvbEf8c
	zgzrb8whaFN4d6lHfbQALJPW8uqALkhsLA0NlZQj0d0mdlIsg8NtTQSYymZgWGirRO7+Zj/DSpX
	HgTBJmL9lK+nlrMlrEjDrmpEZn2H0b7ljoOsLt+KY4Rc+L4QengrMITgmfhiDtVeCjzl7WgKySa
	C4jpY
X-Received: by 2002:a05:693c:4003:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-3796696128emr9718335eec.23.1794804566027;
        Sun, 15 Nov 2026 20:49:26 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm45873114eec.8.2026.11.15.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:49:25 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Cercueil <paul@crapouillou.net>, Paul Burton <paulburton@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Christophe Leroy, David Heidelberg" <david@ixit.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Paul Boddie <paul@boddie.org.uk>,
 Olivier Louvignes <olivier@mgcrea.io>,
 "Zhou Yanjie" <zhouyanjie@wanyeetech.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 7/9] MIPS: Ingenic: Expand Kconfig for X1600, X2000,
 and X2600 SoCs
In-Reply-To:
 <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
Date: Sun, 15 Nov 2026 21:49:24 -0700
Message-ID: <179480456454.1427711.8965713943172137555@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 09:10:29AM +0100, H. Nikolaus Schaller wrote:
> +config MACH_X2600
> +	bool
> +	select MIPS_CPU_SCACHE
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> +	select SYS_HAS_CPU_MIPS32_R5

With only R5 here, a kernel for just the X2600 is built for MIPS32r5,
and it dies at the first interrupt return:

  Reserved instruction in kernel code[#1]:
  epc   : arch_local_irq_restore+0xc/0x18
  PrId  : 00132000 (Ingenic XBurst II)

RESTORE_SP_AND_RET uses eretnc on R5, which XBurst II doesn't have (it
predates R5.04). Zhou fixed this in 2020, using eretnc only on R6:
"MIPS: stackframe: Fix the problem caused by the eretnc instruction."
With it the same kernel boots. Since this patch makes an X2600 kernel
R5-only, I think Zhou's fix should come before it in the series.

Hunter
