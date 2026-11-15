Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757376;
	b=vLY5K+UCUAfXeOq6KgAApeRQarUIoQIkgQfzoLSXar9AHx6VPGjHYXw374ljsI0ghIVT
	 55y8Q7g35NmFta+g17X4Xmi3GaB/wktNZw7YDUY15Bv1XJRKmLUjy1zUrd36BKrwGU7G/
	 pZnu1r8oqRJvUO29iMpg8KFUUzyw4RPAk2Bi4E8uOPVddOt0ifYOV6J8NYqYdZLOOG23j
	 NL75zkseFLvi5ta4To37+A4UfQm2yXxIXAYmh4s6qS93I90FACBQJr2fnelkcG/SB1crb
	 ZbmRLLU/emV8YmQL/sAZVsS++YUXbecrnvFiy0MzUBo2/AkZhlqvlFaPv/hJOuJutiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=aqeGITPxpcHpkId0HH9peiiOdA9mpAaQxrSJsRn67Ek=;
	b=C9PVIDgh22zQmX3ceK0+TNAZwJPpayMlcA98wZb0+HGjCEIbMWm8U8wCcTOKviyawkP9
	 N9+YkcbGFRDKLdp5axgV4C80AXTs0gaRDWHdpKOw93727nopdYKTkbuoJuw72A5Hlx7Ga
	 +xwD7JgSL3zMHuZGbTz7pG/k9YdNd97dcxgg5IvDiTd2CxqVvrDGX85BEF44WueixFlaT
	 RCvjwBgBLyb0rClzpvDVbr6IN8IyG97wwAou8CA9GJm8dlV8plUphd/oEZaDPlf4AOcxT
	 CxAW0RkLNaNEI5e2LwOAEX3NnUFsmJE8Ebx4cWwZmK0GZn/TDWpKkhX0rx0zmBYtVXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RVZ4xz7V;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF6A606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF6A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RVZ4xz7V
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3791619605cso5243793eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794757374; x=1795362174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqeGITPxpcHpkId0HH9peiiOdA9mpAaQxrSJsRn67Ek=;
        b=RVZ4xz7VwgdjyDQ7h+ObpA+VorY79ve6v1/hnkcVvxC/D/6sEwHi/zQWbH24Egg+gL
         GaK151jv9jIB9fhsITqc/V37B3oBgHFvq9/vaVey2FsJJh+bqyMIsJIt1NR/WWw46uRc
         teQ52j63Z8B0irzlyv3UA+f8qLe7fBQVzL+ElKrutmZnbvAIZkUkXzQTrzIqq/4hCrj9
         L7Y3CsP6qS4KK33mlaXFbBiuf+dHcwOD2Lp7RXc7XrMYmNNJBi2pdesYP3w7FksbDpIQ
         wb7atQYCEhvaOumKBjv88Ywlop+8zAy0hhFyn9CkLGC4bhg4oJylsZtb5KztMn5lqK8Z
         /TkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757374; x=1795362174;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqeGITPxpcHpkId0HH9peiiOdA9mpAaQxrSJsRn67Ek=;
        b=MQRxPx1HOGmbXZqlt4b8KzSP+vD5Lr/K9+szNG2a9PqRQhoyimtQoW99CDQCPklKcz
         G2jjrwjldywDDf9w3Ik3wEruD5NApwB/HL7QdsAR1TCPTMg2tnjOAMKMbzkEVt7Mimmu
         Uv+i9JcG+dIWOQjPrZ9oZNHEZbEoQANoqwKT2SJMBMeHs2dZV5bLIrzi91Q/w0cVr4XW
         FNgqWh+d/D33nUhFhF4lHQOAqgwKCtPnXdkoTrjhq4qffFxpzPNeILVS/pZik3Ww1U1e
         9jaltJMqkauLbu3T/jZ5ccmUKBBNIZzZSy9VIx34WJOJp0/4lDwum+xF5OSbBHJ8ryqk
         CQPQ==
X-Gm-Message-State: APuU4Z/qyUt9dlPtj4PQhciAbstZywjpFea56vBTByFmwsbMzLl26eaN
	RM5YUPEWwIQOAtauqNA5lEbwAsd5F+ZZf96t5R802nyBp4UPn0Ye6azwvdvg91hnWwk=
X-Gm-Gg: AYBFou1AUQ7M4QIdeQjQ6wWUXEHtkK6a8usIp0xGlzn4BnTPcwkRJcGHpuu9iGnV5ux
	OfpqLOwG2+Yp7Q7J9QyiztRZm0EqrMBqNkUC/1YngqomNbP8IFIcEZur0DGNotArV4+TbSGVg7M
	SYRAo3XUkb5p9LOjYt5+ZlVdr6vG3ACSLQHWQHfZROisSIJWqJol10SLEavyuhv12PnmetCcjf/
	gj2Uo8YkRNsxRUnmxABlGRf1hPz05J4Iejh7FtP15h+OKYGaygAFwEy6AeP5RGJb/rm0ijgBdk1
	NLtYbBwL2R+fcF6dWTKvcRv2QtpU2H7azgly1+0BZ3qSEg3vtoQXutZ8nDAi81UpDtvojryT2J8
	mCxNb2RLmWaR18aW7sXgRNLcV1zNVjYCtJJ7K14w4bNqei+BmNf96d3/rceIvB+0nUtP+BTWpm1
	uoEpA1uovp4eo/wbE/42cx7cXtZQSTt5bqHYNoXc7igzF6RNJj3KByo+vbqiW3zIzyGqieX2GhA
	W+OVWRaltw+gmecUMUzfnijStguGJKGhbc2BDxJh3c/B6ylruizByvgNzINgHn0CKCdXTnPuyEe
	Ju9g1mdsRHEE6SNeEmx5bprDBtR6ByuIUR6aUSLdm3VHGFr4xXbFFraRgzS+B2aRW0a46zIjWL0
	9Wd28h8oexMXu6K6iS6QHeK19/wgm/iv02Q==
X-Received: by 2002:a05:7300:6da8:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-37965abb5bbmr10280527eec.9.1794757373805;
        Sun, 15 Nov 2026 07:42:53 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm25665134eec.12.2026.11.15.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:42:53 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: tom.leiming@gmail.com, linux-block@vger.kernel.org, 
 shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261115003349683IFDCSTYhPzQtBozUiO8qN@zte.com.cn>
References: <20261115003349683IFDCSTYhPzQtBozUiO8qN@zte.com.cn>
Subject: Re: [PATCH] ublk: validate all parameters for zoned devices
Message-Id: <179475737299.32615.7778013887179668898.b4-ty@b4>
Date: Sun, 15 Nov 2026 08:42:52 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 15 Nov 2026 00:33:49 +0800, shao.mingyin@zte.com.cn wrote:
> ublk_validate_params() returns as soon as zoned parameters are valid,
> skipping the subsequent DMA alignment, segment and integrity checks.
> SET_PARAMS therefore accepts combinations that it rejects for a
> non-zoned device, including integrity parameters without UBLK_F_INTEGRITY.
> Invalid parameters may reach disk creation or advertise an integrity
> format that the server cannot access.
> 
> [...]

Applied, thanks!

[1/1] ublk: validate all parameters for zoned devices
      commit: 78c4f290e2637f8039e2124a174a24a341b38b1e

Best regards,
-- 
Jens Axboe



