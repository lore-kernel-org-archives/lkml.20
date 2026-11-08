Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794172089;
	b=p9pNxRfU3zky6Dbn6//0W1wy2POjkqL+XG8fm5QVH1Ncq/vz2pRXY+aAiPlzxzse3FxG
	 8ngjg9ocrVnTV1W3BWJxaNB3lEwKuL5th5M67kYMfMQIipvqlXd4na9mdAkRi1y8+HL6I
	 ChWmb6n1mth6SsH3FkswV3ho8MyA3SvyguE4vBTIHkO4olcmciZL1KdWG/+0PbtUlZFud
	 6uGDqRR3K5kGZ+Li9t0qn0C+QZKBm6n/U7bKVHdeXivOB7igrOS0cbiZejKBoarmILMx3
	 +NBvlt2Zn0MvWDv9y2rBOyuaPIf8CBzdrjq4khGdjrfGEYky9I3ozUk57dKhRApRaAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
	b=Kfq53GnvlkfKnEXgA5UugM6qI3YkaxOzmKCKWe9chtXsTxuupnH5BOD8C+/cmz5h4pkq
	 ohLrXYiEk0FG3lVZZ07RvRO5Qs/8WIe1H3kaONrpx8w+lemVYgmroMe06+Fkv0xyQBSO2
	 XlzB18JflZDGc5GpmRyTFlTKITF6PuRSmmQ/oughdnPTfB8EUmlzg/fHLlk90HmJk/OLg
	 5lr/Gux6HPdeDbJsJKHpsyy+34Uv526LT6I3ao4AIGlW5F+OsEi5GUNv4uIFPb/TJ+Axi
	 h5de847OBQbZSEmoCZzl5bHN8KxMeXBFVEJ17CEqjFfDoJZSoztfBZ8UYWnSGOa2hsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=sHCr7ys8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FEA606A334
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FEA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=sHCr7ys8
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c246c0c60so310523d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172088; cv=none;
        d=google.com; s=arc-20260327;
        b=R5sJDRStgwrI3uXlJ0Oe+Jcmq0GTDU3UyLWJJ4mtmaDx/eyJqDv9avUyQK6PPfEvfj
         +BU5t3Mg4L3aht/maGgqXBxRdyliA3yZU8OzWgRWDgbIQJUG/TTZeC/sViATcxLCdrvj
         x7gwLsiczRG5jOjskexCa0K+Mk7Lu4mla8a6u0Os88mqgNkUs2ToY3X9q2muSRJCa7DC
         Ya2rXHWWxkbLF7iHELpyLieGn/ovyiHRfW8mJ8WrOiwG0URfqT5p2SNyGsfE63lsWR8j
         6xwtMQ5fh/n+tVdWvbw7PHJlGhrCiA7cinHyXSomtvnwiCUNp30qmbjpgCCSFu0XmLAa
         nJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        fh=/XNCSXq/UesyDkhDs/M5fIptsc1KU0PF+tuf7i5/2c8=;
        b=sFyfgyg4XWmQwkeTsjgZ9IzJfkmXcmCTfcFU9cABC75ssyiwbITyOa81WXJqXQvQCX
         h55LTcVL5i8AWWauUUKyyvZiroE8GoS+45u6d+Z1PotkzzJoqJ8Pu71jBtIjILeX7yhQ
         S88R7eO96gkghkPd0Rajn+to1MHvn53hihSW3bzERwoD0JnjNevxEQVRxlpO6VAbwBQ7
         w4w+oxmqBKX0+fP1lG3CThOSYjg5x2oKESKmbkSztskhPjOeEn6O4KQpDN+bmL9y+5p/
         a2tYKLkVpTZqEjb04MReRSL87m/eC6JySAtCBHVpGUUSAIO8+yZpdNWEx5CcwbElk5+k
         F/Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172088; x=1794776888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        b=sHCr7ys8bNxUaNsy+bUcoVeFML1dbnDW2w+esIPjXGCAWDbekntbuCZmOXJdfZDpOE
         j/6JTt8w/B7tGmi0lCs2djCp2qXoxDaRRmam//5cOdpqkHTeIDr2h6qKGDGhT3JMXge6
         seVklIruMWETKxT1xvP+o52n1+TZm/WHjI9Cb0uZZYBUAag61hqA1gbT6Xs1BZbBV9KJ
         Fazm//EF8BTNNaSnIm47n6vXZFxTa1i3vf+uFY8qVgTkN1LzNs53nKiFOv0vj1AEttZC
         VwI8vzuDA1+Qo4Fc3Ynw2gV2cC96Uk3LCFIyZeSodsXc/Mf8y/1x9PvB/mINIzic79Z4
         sLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172088; x=1794776888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        b=ThZ/OpDbsNO48deXmIksgiF2jUzpz0qZ3bIJaqUHyjFCCs44uwHXykVaAzPwBZH0O3
         D2IGtOLrmuNC+Rv2QevCtTs6u5l6io/QaMvm6sEvSJuUGTmOAhdowZfmd7qqdvkqKcxJ
         2BiOsO+wkpD2Jw36DGJH9xmGVmNB03aipcLZLHBiMYIvQi6WSuZz315aDenUVvO/g/4E
         ijIZFvTExewQkUzVm4d2KIXuzyMZK47NKmI9ZlB19zqgG1SSpDiK2Qo0hOh71YGTVGuQ
         Bm75JmuDBA6CCLObzjcsYXjTy9YsSRlEuJUg5UK+NKYBkJS0hS0v8UBIMDPx5afneNYS
         APbg==
X-Forwarded-Encrypted: i=1; AL+hErEMb/pyUPrmuhy1Ei3NOQhCa4qb6M9qN4LGcQDBSTe7aG+2XVUdua96zrdpwlHCAgNGmJNcqE/0zsfwmBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z97wfSKWos+97/euX9FvX5yhzHDgAHhEPx6xHQKr/XvxxskQjhu
	OL06YoSQEY/TMwXYgRyi4F/MgR1yRtZEamcx+uPoEpo3pA3+3AAOu8wt8e9e0/uVMjfHInkq13P
	IzeluY/LyLFzYx16FHiCJMzZb+c8GHI4=
X-Gm-Gg: AYBFou1+/KeFZsGW0SVWKU/wt71TDA7XcGM1mgpVvhHQ5jM0AVm+bgGJNKZAuBjZQ1F
	wMD9SsKCt/5Lcn6pdg28f3x4wczMqJvwq6i6X808tQVpRM7vFeSrOV7SzODqIJYOx4NkEjURLOY
	zyN68BU+zBFtS/ld9qd6AeYdad59MjGaooVUEAOvb83c2W2+s89BTqqjhegHQCWV15cbUBy+F54
	v34J2+vcu6nJG55QCV3axvo1SF+ERrtlS4Nb8S1QBjidsjUglOG482AVw4ZmDu2ljmn74UgyTZy
	9ayTf+rULaacPO5nCFUOwXKCXVjyR7Vh+UzdsNNh5sxWR+y4ybYL80ONby4bDAQtISLpdJuud3L
	LXmuykKuG+LRfFls3i6CYmkZ+Vq5pCIr5w1Qd3HWEWGx8cF5AIVR8HIoFZ10tFICH7YBqMhGwaR
	qIaR6FGvK8vXZP7tM=
X-Received: by 2002:a05:690e:bc7:b0:677:df02:fce with SMTP id
 956f58d0204a3-67c3d7cc43cmr1612153d50.5.1794172088171; Sun, 08 Nov 2026
 13:08:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at> <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:07:57 +0100
X-Gm-Features: AclHuK_oGazsWw9BXqhuCXk0AQ3FrnvIBj2gHr_VP-7Spxdsvm38LfrWlZ3lq_0
Message-ID: <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:19=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The S4 CPU sensor reads its calibration through the secure monitor and
> otherwise matches the T7 setup, including the separate bus and
> functional clocks, so reuse the T7 data for it. The driver already
> enables every clock the device tree lists.
>
> Without the calibration the driver reported about -144 degrees Celsius
> on an S905W2 board; with it the readings are plausible and CPU
> throttling engages.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
