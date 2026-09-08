Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48094EE842
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862439; cv=pass; b=qfFy1/Y4gY2vOFlG4s/IAhGpb1vKxbJ+2Y3jMypjN1KLCuFV5dux1nVUHHIar8eG1oCh8iW9q/p4p7sTU88FZUfP/NiG/Fw1TX2RjuKFJ8n5ybcq4IbAXLQ8teqXPCK/8+pv7ikehdd39n+rpnWL4U85BD7bsrKxQg/dsAjzw10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862439; c=relaxed/simple;
	bh=kWGLXFyPHplqccz5poLz3IbI50NU/JwnfhfqrKLhw3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pe9+d3J3qi7oJN8PxaeUNrT8owtZs3q6ZARs6RPHGz/u/kPO3kzhcuxAVdEgPPTjgOdU34xdFu9EvG3gj1YS+hruV3wKq5a/8Q4ZfZEXvaZR5sVu6FUluLnyzhhIjfgftPacF8bS2ke/cMrfDg5TcRnbZpuAWwkmBv7ZlGbewzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcXma+F2; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcXma+F2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-85590c5aeabso2923839b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788862437; cv=none;
        d=google.com; s=arc-20260327;
        b=jb/XRRMziXrnwgffyF6rcB64JmLUdzB7cEx1lp/tifIvWiQhB9Gs8u1DrtSb88SJCi
         1CkasjPK2ATk6fOM0G1O0M/JiengjYr8M58+WgIkEZ/Kbpj8yHK55cdiMAAmG9stP/10
         m46WMXhGaF4BUnR7CXvI6LKOJ8QCj6IPlkeXCY5NwtHWh/M4xpoEP/St+iBezSrD0LGp
         e0Fl73t15EFpLosPBbCCQ9euw/19mevze3HXVLvF05q9qQ3+jBGd6ERPwC7cmisRuU+j
         pVDEmZKdIWf/iAr8pAb7nfIDZEBNwdsMtUWE3H9/JGnHq/nO96dD8Uv+LYBGDSmdFkUq
         VFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oLrwfLp8ACywcK6OZDMAVfDPAmy/xkA/7NJ1Wh6BTDY=;
        fh=CugBW3TF3Zm5pwYylgDtgH2Cc4PaueRhjx/4dXaNiA8=;
        b=NjfPBsdjztrDTGxz+kn1DY5AIDMiLLCt/GbwUnLKGrdDQLVQZntiSyStdF+xgcWC7e
         hqTlFz7WjcsicdpF/VX8/ND45ELUr+6xSLxcJTeijcf4h+57Low5AtDYU4cY7bTePiti
         lrXVVoiCZmyQHabwi3qCaVwrFtuIWqwzCwhI/dTmhfHkbikhDCG8kS+OKyzddxxfLmUc
         TZTUSqlqvOl8dMR5uoDkXsAmfDUOBir1HwdPHn8FfVM/uxc04k0ZJ6lBDVLALqgYF3RY
         Teyc0Gi1LmqvxCYG+ViKQdgx2WXr01ZGLPcJsYvotmcnQMIxu/F6D9c3CO3X80D1P283
         uQlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788862437; x=1789467237; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLrwfLp8ACywcK6OZDMAVfDPAmy/xkA/7NJ1Wh6BTDY=;
        b=KcXma+F29IwmkuBQapQkmDnhdA073mi7hJKEUKUC2FKwsLT898hxV9lOHtUrk5iHui
         KkrEi7S2mQ1XYrc4rL+ceO+SUVS0XNIURjyIKZCO6/z7kOZis4jamUb2Gib0a9ltpY6a
         R87H5A3ecQj2V9fG3mg0RU8jRZrhi6+4yr4JQImMLLRR3Rk+EcGbN4vnGL3TxUmuTGYh
         ueKGLTQ39CaZ1L4AlEM6hrMpgHMeT6x6WGJWBTuwkIgU0SYqmTP+UDBXNE3L6lH+GVOC
         qd3r+GRr6A0zGtoQQUb4nhBLZKWSTVjedNUQ3EyrVqdUDVpw1a+A6xVuAocJD4Vh2ALO
         F7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862437; x=1789467237;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oLrwfLp8ACywcK6OZDMAVfDPAmy/xkA/7NJ1Wh6BTDY=;
        b=G7PDbEkuliLthtzehj28iSEnnQONxLVbK4ylze21Bz7dcZYRoGW4kooPNk10r0m/Mo
         saDKH/VY+xbvoPcedZ6vmnCsTz64yLMP4DVyKXsS6oeREPCOEjYADHFD2XiH9i3jnooE
         SRcSaXxPQ3CTgzBKUfdSp31bhf+ZorDXIPrCy48of/wQ/pmCbH1SusE1daGsM64oeXwA
         tmr34D5eD8H/TvoRGDRr9T/cDv5hA+i/Vh3kdxLnj/c0I/2rffNPlw9hlvTHB3T/uYHx
         QPa+lD6HMzD5FTJHI4DtH7fKUkBCQshh/EFUXRz+jA+bz4dbz/324jbAlB11Xz0A/9DS
         kI2A==
X-Forwarded-Encrypted: i=1; AKwUvBwHKfkHPO+w/QrMTmuZhfNXFsE6Jos58i+Uo+xO3902mGJHp/XsIbsE1t1KdMt9I0h6zOeTHSpnXgLGf6c=@vger.kernel.org
X-Gm-Message-State: AFuF++m775KwulaAwSXNXwIUeAZfcffxQi9SC1VGZiSeeunzKF57CrB/
	4N7qdOfGdO+d0SP0Qhimpfde8sm334cnMCl63clKcYTbh2tM7JKIaxUV6royiQz0GdpwOqUtgqZ
	HSj2dhdefj2oeac8wJOPFEaTh3Jysyps=
X-Gm-Gg: AYBFou1Jc/TSzF2VOFSNFFfU3Syyda5LADpZY4O1ZTlkrFMDCEyC1zolus0fTRDtQPy
	RW2RI69Ah/QjicktBmSmT8hWY+7kCIwurwVwGehjGfvWsAA/LYKe3/0GlCX4N/B84xzbigsf3BX
	lkIDa4RTVEH856P6aGCcVvyM9RjuTKDukkLDQ+QuWHrnKjTM3tO7g0rD9SE+MspPZ/IMK/EMPvF
	F/IpSMEgA9ebNMuCqalIBHwyI6oauyx8XdyhuDbNJru5UKVrItPMjY7bhHhbBLV/GgGn4CJ4i8/
	6GkWgO4/pBe6kvOGhMgoqZ5l8HVAqFgTCtgJ4Ps+BinnSey4EUDnBJviMUcsbJpYK7koyfJGps2
	ad7iOyRUd1fEYSxvSnkqkvfCF8Wcx4VxZ9DVD4Hin3ShMICfqsXPrJvy0VtEn/WypvDo=
X-Received: by 2002:a05:6a21:b97:b0:3da:15a9:a18e with SMTP id
 adf61e73a8af0-3da3a0cc429mr41624097637.23.1788862437122; Tue, 08 Sep 2026
 03:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc> <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc>
In-Reply-To: <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 17:13:45 +0700
X-Gm-Features: AcwNN1VMBv-YMtUDD27KP8tWOFfyKDv8HAQFtZgWktZVu5_za_i0rbJmn6ycjPA
Message-ID: <CAABR9nG49YgFejWRAkJrCcXF8p03A=HwWhbetmoHSjk_L3h9Gg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: fec: free the PPS interrupt before
 tearing down the PHC and netdev
To: Shengzhuo Wei <me@cherr.cc>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Troy Kisky <troy.kisky@boundarydevices.com>, 
	Fugang Duan <fugang.duan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Simon Horman <horms@kernel.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -861,6 +865,12 @@ void fec_ptp_stop(struct platform_device *pdev)
>
>         cancel_delayed_work_sync(&fep->time_keep);
>         hrtimer_cancel(&fep->perout_timer);
> +
> +       if (fep->pps_irq >= 0) {
> +               devm_free_irq(&pdev->dev, fep->pps_irq, ndev);
> +               fep->pps_irq = -1;
> +       }
> +

I noticed that fec_ptp_stop(pdev) is called only from the failed_init
error path in fec_probe():

failed_init:
fec_ptp_stop(pdev);
failed_reset:
...
failed_ioremap:
free_netdev(ndev);

There are several other error paths below failed_init that eventually
reach free_netdev(ndev) without calling fec_ptp_stop().

Since fec_ptp_stop() is currently responsible for calling
devm_free_irq(&pdev->dev, fep->pps_irq, ndev),
could this result in a use-after-free if the PPS IRQ has already been
registered and one of these lower error paths is taken?

Would it make more sense to handle the PPS IRQ cleanup separately on
these error paths, or,
use a devm-based approach so that the IRQ lifetime is managed automatically?
