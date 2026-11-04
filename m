Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810805;
	b=gR4ZtgXkVn7TEeg43wdH9B7SdH7KZgucVtWA0qS2hXON7gdPs8j5q7SiBstHSaipY7Vs
	 Lz1wvP+Ka9t7YRyLpFVtQGXlRsjjmAeWB7BacRARjFEtV24Z4BXvh9M2g+yl2TFnJB6dS
	 WmYlM2SrhVJjV+F42vTNhPZgiOwVubrx7BP/V8sLb82RKCvcnyEE9KeelwNLElhyn2Vfo
	 YifqETGkItdqhq7QYAsdITKMJbU6Vw090TInlVNB/0C+qlEMhIoXz6tKRacMWSWKm5DbD
	 AZS2c1t01I5DpJZoM7IMkoWzdnfEu/q2z+pTYLncM7m5Zj/TcPEXZWxSmI/XRN7rJow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xW8Hgn0qnZIeMrCgDDMj8in7eDtwrUG9nG8ML12gUO0=;
	b=Q/GQ6yYXBEJhECVrJoelNn35k8IXnys6P5xXkC4RJOwFmdxim+dkHythMl7OqPp+g+EY
	 0c4hux830WM6tv0/i5bHq7mGm6MGE3lFDe5J4fc2B8K4u+aiZkNeq8tN8XnxRR206JRrm
	 rSr5V5XTp+w3vi0CcZwW3RscqB9SikBxbkhfWCLQ92cC2l866XLzrVTP2WWXNYmy/W6lz
	 viSc6ZbTyjuH7kx5VXysgYTI2xEx8CA7q+lF21XlCTZ4pR/5g5tkuiu04zmH8p9KiOhmc
	 C0+79cCGE3Pp7gNSNCdxmKVqPPAY5729b6UvBBQGpqNX2sPBpvcerK7i0wkP0fjErGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0e9JUYS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC97606D80A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC97606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0e9JUYS
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so8325955e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810803; cv=none;
        d=google.com; s=arc-20260327;
        b=NzrPpC3Cmg8PnnldQ0g3EJ7ZGGbhaVmwl2GDbixqNVI7qVHYvl0TKJkXByM76kdOS4
         FS/U/WDsC1jVrRjfvBQVWqlTrJwPb0bHi2ujeoZXqr5oGj/avMYWrhafBi/cqV7WYFBF
         Y39wN7skkRq8FiI+5qx0jXDKaG1Dwa87fXqrpW/bYj63k04cCRpyK0o8e6N84Wry/w/H
         ocD79FBkHEkIr7xQaPLOXi0TVzKUpMWsuV9ps2HmnDEBYGpfkUfpVTGT0kwobn/lK8xB
         z1TCZGOqyf5jDUTg9PNaQ8IwySpASxUB9zle9CMZofPWbc8C5EQHTB4Vt9Ue+yMKGkli
         R/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xW8Hgn0qnZIeMrCgDDMj8in7eDtwrUG9nG8ML12gUO0=;
        fh=ktZ1dMXAYn57H+GtCMJvCSzYVzJN6Mrwxo9vAii0AMM=;
        b=RRj9m+f95rhwbykSkjZwShEulqkihu70f7fIKcSQZLaKPUExQNwc9jCZuKoUSgd35l
         7WfYjjgoaqwmNaNT96tHjV8ODWWxhJUj2RHTSMdIxGqsx9zopbw8706xbwGmHrbOesHy
         oxPQbRfPhghv8/bKGEn8o+ICTCrRf+Zm+UEWSo8lI3RHjNa1KYFjxdFaYWxwNDxYUfu4
         Ar+xcE8IpdHMC37Z4yfCS3H0Q2WYG3owHPXcd9DRrt5t2EJBLGUhZ+lZtEahBfBEk+H2
         1pyaanj71PbwIsblZDXdyXCYJyXOeixOP7M1Nd5Vsxn/IPDagwOl0WSX8XcESe7P5B3r
         RzhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810803; x=1794415603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xW8Hgn0qnZIeMrCgDDMj8in7eDtwrUG9nG8ML12gUO0=;
        b=y0e9JUYSaUDBVvZ2e4FCtN4PphH4PhbUxTOvAqu1Yiwdw9J9JEw6UnDYeYAIMwHoTK
         q45hOs1zbGNPwzM7UlU4DiOgI74AA/XdJIvYogHT0fh5TuFGeS/LR//NOt77ARAngyAu
         WAann/dvzBCgMG6387hsiEo6pK+5LVVZfNQMSvVytJikApONJ/IL15cXX31eaVWe7AIv
         GAt4bl3SsPssyfcWFsBOdl1wE6a4OXeb2kaJ2DszQMhKhsXtRMdzxW9iEwuDg4EPXyxa
         bENBVm0zYvwx4MSWjeFlrTVgcVgxSFk/F2tH6ZdOOpiHJt0trZf/zdgME6VyJTj+OAkz
         F0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810803; x=1794415603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xW8Hgn0qnZIeMrCgDDMj8in7eDtwrUG9nG8ML12gUO0=;
        b=neixl161YASaakhqogmT5Rx2jHEbRDDIJWimrDeJLio9mW+tY+yT+Ydi1YbbxlreCn
         YDtYLxmz1+X4UXtA+Bc9Qv/zLfGbIdI8rZ+DQMktCj49I5iYwYc16oNtPE08a02Op/kl
         3Q3wfTzdwmF+Hjj5Jdp3g/ZMWCekULfWM82EJt120NaV1fk9OUdc4y/S878XJvrt13Kn
         YRAReQ5k+310dfxJXoxDSItsN5Tjc80Gxo1KrCcncjyeIx0jAIm74giivHWC67u4rAqu
         qMfPYON7457SG+7QWCp6GcAqf+X04R7JN7veki+2AnCMaVv87d695WEtScZl7mF0yAxN
         UOVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7P6gVyE5cUOziBmnOJNsIf11FUKnrCw5l0Jnkob6QWCVK6u1PCJUkxlFhc3kVvqTqN3QOnW9R5XLvRYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a7B3ib1tJMngFIktnv5IWAbCFmjUwNescnUDG0UP03SXQvCeI
	3sKiFtpOFew6I7Y1ORpiAHCwyjJ8jSe+ibuZ6bnr8qtl1uWNlpt0b+r5QEbH6yegpUkxTkpSuDI
	ZhVe3Yi+U2hLqKiPejOd4OiuYrxoOTR0=
X-Gm-Gg: AYBFou32+pCJSdXcssU1S9UfFJNExzO5nhQfPWUiEjtTiVfY+4XnPYAwp2ee5JyGpip
	ouPzMK6AQ+vm8HG8/gG29uaeEXPq8/NrD4IB3SvEIHd7R4tK+Lo3leHFCr6OFJ0Rmh1Fq9KX4Uw
	6aERETXZ+IFyvQrvdPcFG8fCVZswzhRhKWiqyX7rjeo3hjHj2MBq45I/79+Q25qXa5Syg89dDgG
	GjmTvAXPtNSPkbcyeH9Z0gzaytbJHtO3GjbOBPDkDoJdBKQtCmHfJh+pYrzOaBzumBQWBWrmAiE
	/0kHlbji70kDFO67yE1QTmFHK1tq9PKwSnr7Br6UAlztO9rgbKM/u0AonCM67y5YwVLYpX/i2HL
	+4vRGAzM31KXThW7ZKfLUePIV3gelCSyVmVFtrXend82bgAEHjHI9DxHFzlVUY9oFUT8=
X-Received: by 2002:a05:600c:83c5:b0:4a1:88de:9e8b with SMTP id
 5b1f17b1804b1-4ac17191074mr340156395e9.5.1793810803211; Wed, 04 Nov 2026
 08:46:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKx9m6PywVwkirvkAtz144c-yg71c2+OcNYOTM4Bjtd8dF2PaA@mail.gmail.com>
 <CAKx9m6OsGKGKGxPnjwy8U-bDyvXVEK-dVNmvP0ZqSL-t2Exsgg@mail.gmail.com>
 <anziUH_cC1LXoB1x@pie> <CAKx9m6OMQKufDpqGJewG1OyvZGBKGimSxxxGRDGWgFicSRoTGQ@mail.gmail.com>
 <apSDPwF49Z1Zd0kJ@pie>
In-Reply-To: <apSDPwF49Z1Zd0kJ@pie>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Wed, 4 Nov 2026 17:46:31 +0100
X-Gm-Features: AclHuK9_yja2JGAKkLua79AIy7He68jvu-sXCLEGjHXqKKP-0aST3GQ2LevbB2Y
Message-ID: <CAKx9m6MMTVg0WQXVwQurT+ZaPfmYkaXV8reOJzLuYR=gA4s+vA@mail.gmail.com>
Subject: Re: dwmac-motorcomm: RX dies after long s2idle, only wrapper
 SYS_RESET recovers
To: Yao Zi <me@ziyao.cc>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Answers are inline

Il giorno dom 30 ago 2026 alle ore 21:24 Yao Zi <me@ziyao.cc> ha scritto:
>
> Hi Giuseppe,
>
> Sorry for the late reply.
>

No worries.

[ CUT ]

> Sorry for not making me clear. I mean the state of OOB_WOL_CTRL right
> before motorcomm_resume() sets it would help, which would prove whether
> it's the case that some firmware or internal hardware logic
> automatically arms OOL WOL after suspend.

Sorry for the long silence, I struggled a bit to recollect data.

I built dwmac-motorcomm with a dev_info() dumping the wrapper registers
at four points: entry of the suspend callback, entry of
motorcomm_resume(), right after stmmac_pci_plat_resume() (i.e. just
before motorcomm_deassert_mdio_phy_reset() and motorcomm_init()), and
after motorcomm_init(). Ubuntu 7.0.0-42, real s2idle, four cycles in the
same boot: three came back fine, the fourth (31 minutes) broke RX.

                 OOB_WOL_CTRL  MGMT_INT_CTRL0  INT_MODERATION  EPHY_CTRL
  suspend entry  0x00000001    0x00000000      0x00c800c8      0x00000075
  resume entry   0x00000000    0x003f0000      0x00000000      0x00000001
  before init    0x00000000    0x003f0000      0x00000000      0x00000001
  after init     0x00000001    0x00000000      0x00c800c8      0x00000001

PMCSR already reads D0 at resume entry; SYS_RESET reads 0x80000001 at
all four points.

So yes, OOB WOL is armed when motorcomm_resume() runs, but on every
resume, not only the failing one: the whole wrapper comes back with what
look like its post-reset defaults (0x003f0000 is exactly what I read
right after a SYS_RESET in August). An earlier pm_test=devices cycle left
these registers intact, so the state loss only happens in a real s2idle.

The failing cycle is byte-identical to the three good ones at all four
points, including after init: the DIS write lands and the masks are
cleared, yet interrupts stay dead (MGMT_INT_CTRL0 then latches 0x11,
mmc_rx_framecount_gb grows while rx-0/tx-0 don't). So these registers
don't tell a good resume from a bad one.
That matches another result I owe you: on 1 Oct I put a naturally broken
controller through a second 60s s2idle before recovering it, and that
resume did not fix it, whereas the same resume does recover a controller
where I armed OOB WOL by hand on a healthy link. So the natural failure
doesn't look like "OOB WOL left armed"; something the resume path
doesn't touch stays wedged, and only SYS_RESET clears it.

I think that still argues for the patch: the device comes out of s2idle
in a reset-like state nobody commanded, and resume never performs the
explicit reset + init sequence that probe does. I'll send it as you
suggested, with the usleep_range() folded into motorcomm_reset(). With a
single natural failure captured so far I can't claim more than that it
recovers the stuck state; I'll keep the instrumented module loaded and
report back.

As before, the analysis was done with an AI assistant; all numbers come
from this machine.

Thanks,
Giuseppe
