Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6017A314
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850560; cv=pass; b=u8lsXEU+tmc1A5gWrbVVGI80RHqS6uFb3sYH1z7RorTaDK0W78QbqlkYCQ6Vv70Fi0Zvm0D89p4LpcPoLUqSRES3oJYfIw+IJE55ZFcThoeljDfhj3hcxG3cjaGRGkuZcJr+oZqTBZUpcNptrcgw8eChM79h+/zhZcmuv9Qhk8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850560; c=relaxed/simple;
	bh=pHxN670nTvs1SKv0ysH9qz0K2rs/uzf0jySAKyVqBoQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U95k9gjaFwTmregkp7IGoJzOphEgnq9u7lVDbRhcuSSWBTDG4KRP3eXp5nZE8OPQBsmTAN+uE4kdnQ3ALWgQUODSyHrG+41/heLPMwmcC5OIg4BuRd6F479FU6voZTaAKnSMiIrijVd7CWn39oas45/JpJNoxkrPkrr4EAIWeYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=kLcxJ/Mv; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="kLcxJ/Mv"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a771ad2a9aso35063641fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791850554; cv=none;
        d=google.com; s=arc-20260327;
        b=XoViok2I5WAA9eOy5XPQ7XirlUnCLP58Y/DJIpN3MlN5aa7wCoycVJyR97Tj+VkLYy
         cTtxLNiTb9fG1/IABSNlFcCtNMLxwlmw2648WlD0IjZ6xi9NuR+J1Gnh7bQ8xPQJX9+7
         lox0BKywcTlQYD+5sI7pieNrYSSEdFjUiRGtpvlwngACVtYewD0kqrSSw/vDvl/XrI4G
         bhON0aSkP0wx6MdvzC2uksYVh/X/5L9v2D2MKLvcFjMGMvEbKF7Lq6Mw0hcSM22xepan
         h3Zgjw+KbfZzNp1YfDgZKb2yJhiB0j/Wv3fwpJCMtMkkW6IMOH22BPbkePsTO1Ht7611
         hYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=pHxN670nTvs1SKv0ysH9qz0K2rs/uzf0jySAKyVqBoQ=;
        fh=K7uWEyOn2mdQU/CPps7vnkaGZbomTwTYOkDV4SJt1QU=;
        b=De61Orv/3g1EiYCsp+ZuvCt/B1mYoh3hjXWVO0lJE+VuEDs2HEmGAD/zOuoSXNd4y2
         rAytHnMiTxTmKrHS3OiLYXkYlpYoiXWGsENM9QHMEacUm+OmkLoCHbwxVV6vVSZpAqLz
         oY7pK3y1J9yHuVQmuM6tUt8rSvmSvaNpBC5I5XL/Y08r+Kp9wVgw6DXgl4pVhdwy++Uc
         CYCuR3Bpu7q/Y74Tnx3ss/CHsiYhH/vcmatkpogua1rR6MEZxeJ2wRrgVsK0P3i3Gb2D
         1JKyGfQ04kF9rVKM+n0+aiKf+2k6cveYFkffkfQZNA7MaMeKdmXZr4/5yxDvLfIMOhUf
         NRWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1791850554; x=1792455354; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHxN670nTvs1SKv0ysH9qz0K2rs/uzf0jySAKyVqBoQ=;
        b=kLcxJ/Mv4cqfhx696LTAHTGIRpIUqhvCwaTJdOlmnuUi9nsDnQAVcZ5QY25TZ86kYr
         3ofI3GHcibTrWYCPbCt5nv573UbeBqcqz/I2nfADiattlrMSXJWW16IOtP71I28GnVIp
         u0WDImTRN1zRaQ+ttAxsouq/CEcW9MWbQ5DCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791850554; x=1792455354;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pHxN670nTvs1SKv0ysH9qz0K2rs/uzf0jySAKyVqBoQ=;
        b=OGaZlcVHyKrbMaFXQB+uBWyl513EQS0D1kUBbJI9n/qXl+aPXhDiK4Y/Min0Cfkcga
         vFCPQFbppUEjf8VBlbtP78w9sWdO6HeKiyRzIFJbCxWE5VSxC9/tNqSd0WvdMJ4Gt6EG
         pXov3WjzcVcQc6iKNM1l0SWI/5n/Fkc4xgiaoSLNFZBhm1qHJ+QJfKau0O3CZl4e81NO
         zdgZO7NmvcOXsVmOUPrYUq8jESHGG1DPvZVCn68c9SEQILMtJU/V8zspqwiHmENGu1q1
         +bKXWRsgxwgSCdgq3WS/51jZypl45e7PmppK4hfyFhd/vNK8QoZw/p/PS114HOAZBNDF
         9RcA==
X-Forwarded-Encrypted: i=1; AKwUvByHGMDoBH+o2PIxuEqbouLNOBLaIckf5X3kvprcq38oPK+yKMgpMshs/0APxWLbfxTOGGWKLMIQy1frHMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Nvba4N2x3lNwlU8v4nV+MXDuEWbDW7+VF1MwZe6L2FA/gKVQ
	bHNACmxvrXA2xgby5XdZm7rMsTLCkwDKmTC99AIKbQt0tBHVJlKUCWOn7JDAqCtRQZwul4y1Z6A
	BUaoeKhFFBprqyVIMSYGAtg71/XjVkG+zYFEoMPKh1A==
X-Gm-Gg: AYBFou2K3arEF8Zyek6mt230n3vBqwoTozGmS4U0nzQJCi+dCItDR8r9CmUEV7kEpD9
	NoNmjvzlSeVrmOWgVZxNFkNc7dfiJoVppHN6arphOQ8ls96OeZbK/kLWocTADRhmDvj8bWgQndA
	vjcxwKh5zEJPgKPypoTIWULnRkCXf7h/NMfKEsIo4p5OW33HKKsw5T8hGukYPqbWItuECy+pAHA
	/R/sQVv8a4S2bzf/epsndY3CrIVEr3D75lbbzbcOFmdi1Yv/M4zC4Xm1EiSXPrP3M2L9RAlmYsb
	VT7dLmkFMuRlzP+AMqvL1UZssCmuReiJHsx86tIOPPjwWNGUCgQ7XMu0r/bpjj8ChZlK2pVvjKG
	sRwWBLqqCe73bW3KJp3wAknRsysriGmye
X-Received: by 2002:a2e:be88:0:b0:3a6:62bb:906e with SMTP id
 38308e7fff4ca-3a9c2b34d90mr26665431fa.20.1791850554283; Mon, 12 Oct 2026
 17:15:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 12 Oct 2026 17:15:53 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 13 Oct 2026 02:15:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 13 Oct 2026 00:15:20 +0000
In-Reply-To: <1fc8c339df1944afa6186197337edda3@realtek.com>
References: <20261010-rtl8xxxu-usb-dma-v1-0-e670d9c08fdf@khu.ac.kr>
 <20261010-rtl8xxxu-usb-dma-v1-1-e670d9c08fdf@khu.ac.kr> <1fc8c339df1944afa6186197337edda3@realtek.com>
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Mon, 12 Oct 2026 17:15:53 -0700
X-Gm-Features: AclHuK-y2NnSiDu1NX9MesgaAauRNR31ntVb3h9H4LXcDaqAPNJtZ-xqh-GtBjA
Message-ID: <CAH1Bc_yOhZ9oqreJOLKb5RDFEW=0Zid=h4xu9oTR51RDwj_bww@mail.gmail.com>
Subject: Re: [PATCH rtw-next] wifi: rtl8xxxu: isolate the USB register buffer
 from CPU state
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, Kalle Valo <kvalo@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

> Cool. How did you dig that?

I was repeatedly power-cycling the AP to test recovery of a persistent
queue in my project. After fixing a separate NetworkManager issue,
some reconnect failures remained, so I started looking at the driver.

I was testing with four Raspberry Pis, and different units would hit
the same failure across runs. On a failing unit, RF_MODE was corrupted,
and restoring its initialized value brought reception back.

I narrowed it down to register corruption during scanning, then traced
the register access path. That led me to usb_buf sharing a cache line
with the mutex's waiter state, which can change while a USB transfer
is in progress.

With the buffer allocated separately, repeated scans no longer
corrupted the register values, and ping traffic kept receiving replies.

Wooseok
