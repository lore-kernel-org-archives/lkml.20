Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA7A282F3E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746959; cv=pass; b=DIuyrCwIIylnKBwvcLqdFs2/z4PiDa1KD2Ke6Ih5ZjVrjt0nNwMD5LJPO/vjIhIQUFhkNEZ/PNiSTfp50SiJ1SWza6fz802ebxqifV+9+mwhhV1BWfVLuE1YHNRtO3VbgRJVPrbVmXiwP3hzsVBMb4Rt+qszwcCRFGW34dBUPa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746959; c=relaxed/simple;
	bh=8S72JqxkYPUq9z1NSraK1E2YCrYZXXPbtGqTQ8XXHWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skTDG/cedVEgmbLvGWhuE9FXGlzhZR+MgU5OR4hU+PFjh+RGcaauCgqzhcV+XsBUYnrE75LRQWeqmFK2Ei0ImXrZ4jGdNetsPk+TvRBgZpJK++zGEWMc6gMVegxeD6tKkA+dAhSmDcL7B0dSMwxSnoLam+YR3j8B6TwUDc8OsnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WndSt6tQ; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WndSt6tQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2943198a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788746957; cv=none;
        d=google.com; s=arc-20260327;
        b=r1jnWIhk4WkllR99zDN/O8w6s1F1aKoyvM46Jez6ArOSPnomfwgVQ2MjaFouP+ZLVs
         JXQ9GlSflWsomRZ/xkRTSCxv5PT1kfB7qCM89PjAj3noK4Jg8Opl6RsIjSmraxVMzU2M
         9fq1gB8zJ/+Xve+s26np/dnWSFrg9SFLqbYzGDW6IjOxwexQFWHsuXAZv7RA3m5CakKs
         Wkmoc6nUfGau1F91LxsNZNvrh68WLidAa1lvQr1EG5pmdClCOGnQaeV23AqrZ4yPSkfL
         xupOoPEiXLPe+Aj3TuBIgqf9sX+xNj6GnKVWRowGNGh9VxsUI+i1IT1/sCF8o6lMDWNE
         1D5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=41ZPJes78E5JqYoluCCQhPdQKZKpfLEU7Pxen/KxT9c=;
        fh=xsu12U63xjAjBjxWI0U43T2pvqZFUQWvq98lJvKaRKs=;
        b=LR6hrYTXPlSIM0vnYxjbnY+b8HELmSUWyROoSxHadxMJUVVCd/OtrwPFgLPQCcO6qu
         3vkDiFh44U1JZxkFc1pL3Koh6YsKfZYEI2nl1tO2y5WTqPV2uy7ZVWFmi4TbsmDAcjqM
         D24L3xSczIGa6Es5tXnj8KxJHk43Wnruh8IArCCWB+2PLJZZyEIwvSdPuLkqPj7YWA3U
         kK2oNuBbxnHg17mxJ9tfiboemy9ELhZEMmcgH+gE4ydz5vsSSGTlpEd7zKjsHAnihY/D
         M4Xz2+xUtLemJ2BGQhaUG0lnXBx81L6D/moLQV6f0ut6C6NWrWQBNHhVBC+SA7kVPARw
         X+cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788746957; x=1789351757; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41ZPJes78E5JqYoluCCQhPdQKZKpfLEU7Pxen/KxT9c=;
        b=WndSt6tQJQ2c0Ehdw3NdNaUy1FFbMSYn1EsD8Z52tfpoj3pMVFyRmlP6yg59H8GAkh
         +Sk03o5+ftbULYpEbc3i61bnUKIyCJPa4fMB+twTBpH0GDKePBaCgVOKxyjJfFvYkbOW
         xZbFozSqClOQA4nHVnlx/OXdtZn+cgv3PxTSxUD/g+tPbJOXkAK4YwDCqKRk4Kx/sw4l
         dMOajq8HuqCmCmjDSeSprfp7NP+/UNf7bFAknrITjbYaPtQfzMc/9oPHu9zfECCID0Ul
         26EwFtrAV2GM/c1k1PEkxn9QBtMfHDQKggrLCLn//lu69+5LC9bM+F4iLTmNZw5FY52r
         FOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746957; x=1789351757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=41ZPJes78E5JqYoluCCQhPdQKZKpfLEU7Pxen/KxT9c=;
        b=ATFLMaqkaZUwqH+Ah2jud8dBQHbR5lEF6jN8j4YpdZY8s9heeNahi7zu/sdlEPqsgJ
         XVLPcVK3BveHkSYRQC6tJLDudAV5HG/5e21ge8nIEB+2PyyuoOk5LHKYmhRMcB6I1ci3
         PtahzTXFN+YEG9auMH4vne0rff4GYbDMSkfgVmmftKtkZ1JpRMb5pfD7GZ5Z48jgNWiu
         qgLRVc4bPeblaRuYnMbGvyx0pc7Rl+xCOtw7+w+lRIOzfJB8Sxm16Li4kdq9fEmrOOat
         gRn/EYNW2DBiPTHrEiFi1MOMLtZpfDN7frYPcbsywrOglvjl44+S6DY6gmYD5dNZeMWN
         mswQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr25oOAaTY9extcR9FgZX1SI3rqbNYwHMPnaeE7Q05/a+MDftVGLIAIsyYFlH3PH0MAng0KXz5Kz2aDdw=@vger.kernel.org
X-Gm-Message-State: AFuF++mwQdzlrU1umgttk/3y3QS/+DdhKZtiGXTJDkbp6STxwSILqdus
	/17GPAyoBwOuSLot/sbYQB7bPH6O5x1mdEW6JBoas0JhIqI0rfGjcT5Um+B1Hokeeo3FnzMK4lO
	5iZmhdMqFzmEZV4nFLAZC6sD+5dTtXjSII37L
X-Gm-Gg: AYBFou29foS2pMVtKHIG85wbBlzfnk12kYMVMykEB2o5tkZ61FdW0rRxC+6/xkGFZ04
	K2emGXfbkVIAcM9t6yTH3qOOBug2a+/enMn6H5kQS3yO8mtlGpCIHYWYOoHYThsNEKboUu7gEp1
	TBYGZDBJ7X5PeLEDNv4YSAv6dLgOc2LLlL3nGF6rnfE3U0OYYr6n2YuLZzFX231PqwAk2/RrRh1
	6MHOfnIsO55hyX4q8ehdPnxKx1iMBXpaY9lMn9DIbk34rUZ/5Zo31pbdeJiiG9jPS/0LQ/vO5AI
	b0suOf2FuqUtfEdzDHkxisHyU3hdxSNaRryZqTXhKlWgtouIstvVzxgA/t4JbGIz7WS8i7PpKSz
	X8qK1fr6r72Y1/vcURwfuPY+FPaNeDMkZNrDGNc3F1g8KE26iV1x0/YB9
X-Received: by 2002:a05:6a20:9c11:b0:3d2:3e73:29eb with SMTP id
 adf61e73a8af0-3da39bb596fmr30384101637.1.1788746957096; Sun, 06 Sep 2026
 19:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904105542.70540-1-phucduc.bui@gmail.com> <20260906131711.247708-1-horms@kernel.org>
In-Reply-To: <20260906131711.247708-1-horms@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 09:09:05 +0700
X-Gm-Features: AcwNN1UpBlL5kLepkt3Zyceqrsy2K24obNL5eruf5Z7G_SgnSgff3Tb-QiV2bYg
Message-ID: <CAABR9nFYrmteCtb6E_txg13U31Bf50p0PUBvaOXi3gmT7Z+0RQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
To: Simon Horman <horms@kernel.org>
Cc: wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, 
	swboyd@chromium.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > -             if (irq < 0)
> > +             if (irq < 0 && irq != -ENXIO)
> > +                     return irq;
>
> [Severity: High]
> Does this direct return bypass the error handling cleanup at the end of
> fec_probe()?
>
> By returning directly instead of jumping to the failed_irq label, the driver
> bypasses fec_ptp_stop(). This leaves the fep->time_keep delayed work
> (scheduled earlier in fec_ptp_init()) active.
>
> It also bypasses free_netdev(ndev), which leaks the net_device structure.
>
> When the driver core cleans up devres allocations on probe failure, it unmaps
> fep->hwp. If the un-canceled delayed work subsequently fires, will it attempt
> to access the unmapped memory at fep->hwp and cause a kernel panic?
>


Yes, this was my mistake.

It should be:
+ ret = irq;
+ goto failed_irq;

instead of :
+ return irq;.

I will fix this in the next version.



> [Severity: High]
> Does this error return leave the devm-managed IRQ active while propagating an
> error back to the probe function?
>
> If ptp_clock_register() fails, fec_ptp_init() returns an error which
> propagates to fec_probe(), causing it to jump to failed_reset.
>
> The error path in fec_probe() manually frees ndev via free_netdev(ndev).
>
> However, the PPS interrupt was registered just prior using devm_request_irq(),
> so it remains active until fec_probe() returns and devres tears it down.
>
> If the PPS interrupt fires between the manual free of ndev and the devres
> cleanup, will fec_pps_interrupt() cast dev_id to ndev and attempt to
> dereference the already-freed ndev structure, causing a use-after-free crash?


This is a pre-existing issue:
https://lore.kernel.org/all/CAABR9nEkci1OFoHx2qmJWvKabUN=JSu5AcPynQ-tH02wxHEmOA@mail.gmail.com/

Previously, I suggested using request_irq() and free_irq() manually,
but that would add more code.
Another option is to replace alloc_etherdev_mqs() with
devm_alloc_etherdev_mqs(). With the LIFO cleanup order,
devm_request_irq() will be cleaned up before free_netdev(res->ndev),
which should resolve the issue.

Since this is a long-standing, pre-existing issue, I think it would be
better to handle it in a separate patch.
