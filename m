Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73996480327
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198293; cv=none; b=F7q1AZNQxdGgTR+ZzMMP9DvDEppyxJATiIu5CnlznUYcU/s5JNWuhWi2mjIFR7+FnFRKZOQR2FTtWSD5KW/4xB3Ir8MFg1QEh114b5pvd6GcDgWzKil0WVdr2LIEWg9lxt7uVUE6evzwGWTisbCPsbIl6fjvFL8+lON1D5pIWcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198293; c=relaxed/simple;
	bh=OJz59BymLPH2X07/HNaEsZOAqsWDBphkuaZ4veb3x5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WyfsTSnI9PJGxCwlQ25WIJny5b7whuLrX9QmP5hS59rROC2vKgievUBwZpKRJjoZEpeFqxEoySScag+s7++jLwnhInylzDCzklEbgRGYlhVdYZCzoHJMt/5VWyvsYlhPMaDTShdQAdIbVyS7xKFJqj8XeQsuflzi0mvr7Q76k4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso53369a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198289; x=1788803089;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOcXlRKPdGaWyLXZRmYh2gsjN3nZXYDCKL0Pm8ihJIM=;
        b=bOP2AXd19j/UcfvWqEllpun++mp/Ng3RWf3T4nVvbDLBVz6J7c3AE9JwFzpbLJAuo2
         HvPHqxmSSo098tyN+9SalJz+BmMe/YNTtZ0h/fOYyrgkJW8nLJ5NomrdcYnZphWSKvPy
         /AP09toQLDacWOcWSOuJqKCL9cEGlnA7ZSt/rI6sOoc9YfOgS5hGwXEtKOHRmVHsY3Z1
         cvBbRbqXNDycO+NHBdGEM3RRiZXcIrWh1YcNyDMP/YWFqmInf7TIL1IjvE7r4NSpZ3nG
         PzvbTIjRcMt8/fYjWODoS4pS/G0qEqXooTe41sL1yT+KioUjuH08hbMYNBLoavFNYQR9
         XRRA==
X-Forwarded-Encrypted: i=1; AKwUvBxCIpX0PvJHNlG37i5uBQDTdiPDUhQSRkj01cpajGAsUOEvE6gjM1xkgvq9n1xbq4k6g3o8VlVBPvRmgmc=@vger.kernel.org
X-Gm-Message-State: AFuF++kW61h8NN6FGzH+pyP/0lY2mDxz3bsDY3gEZwp1iDYarbL90H40
	xwpy9/qsWvWZSAtTi6FwYVTelWOQhgYsmjdYJ9qdtJKoRm9vJO78aHjrA2At23ucgt0=
X-Gm-Gg: AYBFou3Isw1HSYqDN2y47UOcj4y0oe468TgGieLpSS/RT/UlBEV9Crq/VF5QdMFtI96
	7rlsKGQLFh6TI/8Em2vkvb+F4YoCO7+bwWGOIAmrYzIUbHbBS7W9Ts3NbjzrX/27pmZq8tyXDVq
	pUy2eMK53NeTr1VN+ryZM5G8VJLfbGev4nb6ijka0uWPmf24ioKUCLcHDT6N/3U7hVxFDm6Y7H4
	wWtez63F2HYUx12jEwfWVuhHMTMEJNHBYh7GpbMMoxWg79YpooHyq2zSaxuN2tpkzQ/oxR8WmoC
	WqZzgPLw80SOg3/L0K7tIvcda7FxbnESG6Hqx9Lqnj7hIsIxxE7Zol+pIcfJ3IoC210PIlDnkpd
	i2a8C9t62isgByhDy6ePb9nX/n6tV6dMHE2nILgoJfToPl1CgbHYZDRqEY6hMGgaO0xaaVWlWn1
	C2lNxVsIxLVu9OULgUY+rdVYAzGLZTr/XZkiIKz1fOrbNfcIU1UsiTCjaZ0g==
X-Received: by 2002:a17:90b:1d83:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-396d1023217mr36121504a91.14.1788198289340;
        Mon, 31 Aug 2026 10:44:49 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d7bb7c5sm664546a91.14.2026.08.31.10.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:44:48 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
In-Reply-To: <E27F05E3-DE4F-4C77-95E3-1701B3410E93@goldelico.com>
References: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
 <20260828230445.3c2510b9@kemnade.info>
 <E27F05E3-DE4F-4C77-95E3-1701B3410E93@goldelico.com>
Date: Mon, 31 Aug 2026 10:44:48 -0700
Message-ID: <7hzey26v73.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"H. Nikolaus Schaller" <hns@goldelico.com> writes:

>> Am 28.08.2026 um 23:04 schrieb Andreas Kemnade <andreas@kemnade.info>:
>> 
>> On Fri, 28 Aug 2026 20:47:45 +0200
>> "Markus Schneider-Pargmann (TI)" <msp@baylibre.com> wrote:
>> 
>>> Registering clocksource/clockevent for the older platforms breaks
>>> booting them. The older platforms have their own implementation in early
>>> boot that is used to register clocksource/clockevent in
>>> timer-ti-dm-systimer.c.
>>> 
>>> With am654, the timer is much more complex with more dependencies so
>>> doing this in early boot with the other driver is very difficult and
>>> gets ugly. Instead it is implemented in the platform driver for am654.
>>> However the old platforms may not register clocksource/clockevent in
>>> this driver as that would break the boot.
>>> 
>>> Add a system_timer_capable flag that is only set for am654-timer that
>>> gates the clocksource/clockevent registration.
>>> 
>>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@goldelico.com
>>> Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource support")
>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> 
>> Tested-by: Andreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04
>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OMAP3 OpenPandora
>

Tested-by: Kevin Hilman <khilman@baylibre.com> # OMAP3 Beagle XM

