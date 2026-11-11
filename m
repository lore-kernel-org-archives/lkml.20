Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381369;
	b=GhWbgb5Dff1b030tnMdpFyfnm5G7E9HyExcOWJ/WobI2k++IVDdrP+rLNM5iSAAU2aAR
	 PsDGsA/kDyLEbSTRlNH0dAOOJWewQIwqODWdZ2vWsStzP3HfL5Ke8v5puSirW6+VFnNJT
	 8fzqAvWtnAlS6yl2+C1cxluqryOUjzzcV68Gm9ElOrDaOL6puWUxWj4CzTi2K6ENR+8pX
	 5joXw0oy5ZJkBwiXkYv9y4iIQjmVCorGizDmC3ZE5nqRAdKGQ1C09022mt2sdBxFIEivb
	 wqJ0VuJNAhlwOgtSpneSVmIDp31m3ZMQ3A1beIJBGWW3VbeA/egDVomYjYvLNsfpe4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
	b=HR+OrBgjrLswgmrjFEBixTFt/iFRbs2LFyH0Cxwua4htrfUsfz6GjGqjJrJZYDc1ZlZR
	 UuoP38ieJ6IvF5rzvlEu107B6gGQuxvmWO0NZ5ZErhSIMWKlsTjmaX43iAF80p9crVNbF
	 SwOIfTKqP+cN1upG7ofq1ruM2yhtd25Dw6RTk/RPtn5uj6JbGAQdn2QI3x2x5Tw67RmLf
	 LYEzCzmyFELP9dF+ODj8aP8hICv25cEn9vxtvLf3awguywaGpcg8WgHHfzcXnhdyU1EUA
	 wqTdcKp8YL3g0dDqjcl0fGZFp1+hvwD12d0TH711qXaBaGQA3aobx0DIsgyISZ963rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=pAiwqPtb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26278606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26278606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=pAiwqPtb
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67bf3c6654fso3272713d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381368; cv=none;
        d=google.com; s=arc-20260327;
        b=khfAQ+gvEGHxhMSgQj7ERTP2HtxwCXrkWeafCw7feo0RrgxAlzQ2ZnWrGAzdlDTC25
         66eCYkGmpZPr7J7jr7B0cNqR82DfmDGWvs9o6Ose09Y5AUvlFqPC5YOK9XTxSkkjBWa2
         xc4fjdhvzCdEz5o+LZsMuPyNE2ac+Oxemg6LtBJVw62G8qcusCYzzVoy7Bdu06rliFXQ
         KbL6OZffjn5PhTBv67VTlWayeHRf7k59ALvvGjwyWAKqpfu1lGBKmRVDM5/7f51mjxUm
         KSyjyugBk/3HeQ3+lCWi9W1WKPkHzl2khOAcfDHillTRCdJv66jZe1a4SFRTQnHk2xU5
         Vsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        fh=8Efjijl7Q5yb+IDe4eC+1eyjWhwJWyeBLmWYNmhxy7w=;
        b=SASC4JjFRlmIZKV5Q/y0qNxakjto8bx/GhX+6iJhvjO6BcWs0kKgNKcesCVTdPVZP/
         4NrozGvsVAq025VcbM7hGCaa2C4+j7oLBgrXpdBN/geNdnJx3ufutkTah6SDuj97YgIF
         1OaHXryuc6ZKuRy1Oh6Ua9boRTCu3ORznEXyjIhLg4GcKDSpGjnBJU4sQ5LaI0GYVF8d
         IewIV+8wDnYo4mtU6WMgLQCyg8crpTkusSa/E0uwzIEJKPTarxAXPsPDDIrUE1oRqGrx
         VDguSn/uoPrkfX+ggl05zCfkmS4+blqg/wk/jWvPrt5ugph1rkXr0Y47XFEuJ5GP1ilX
         W16Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794381368; x=1794986168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=pAiwqPtbWeaRH/ZqGVLMtQHwvrxsDdIZe9E35wf1oi/7nOx7xeahW0IAJRLJYHR7ia
         Wx1Wg3BuG1Ku46S+uDvtGxCs22uEQs8H/6bzvaGSMBwHf+dOq6ybmI1eUEU1YgfqN3ad
         /j6cBxti7HsCNg9WA5QfxwHUvXCnlQTCf20NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381368; x=1794986168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=BtMM0PUnK4l8kzpyxD74CUkEnA1Qtx4I0uocD+Rzal3d4EsTc6+ci3Eq+T2l5ND7/x
         6e9uAX+Xlw8u/txTLMMtDfVVFaNuo9vkjjAvCFWmx9dFT1d6M8YNRwsI3wWPOJ2VeFtu
         iLRTtKbHnAVq+v8mzCoJUrZJwPAX6WWRjNgS3ruPcwozw1kdF7Qgn2k9lYh2mRwTnlLk
         jpD/ixEGGnjPD0wi5VL8IrHpLF5e5WrDigrEgTdZcwLYtVu0+VlLbMVzy3FOMwjZPtO1
         dG7J52XAzWk/mcFzfn+9UIO18WXWy5I1InVbZZfgqDnQpdFjkcKMYYiK3j2EdqP8Oo/f
         //BA==
X-Forwarded-Encrypted: i=1; AL+hErEQnFsrcDs2gDEGFFnLtAiJVdoVHWUAVL6OLpihMWcrbWK6xEBUcUuxFMT94EN8V47v4L/pFVmnqlRp5Gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2srIZIq+oDR7YxeBbjPBHtlXwQIdhycRQSzi/uSlrxpgT0+C4
	+LOdU25tlWvJ9uHZbYNimNAM9TLlc7jjKYVAOlxcbziu7trNySt7LpdZH7gIFwfJ6DNWETf3kdi
	lNxf0HHO9X2XYAvpOjmhlJN+2amh/ULbI3/xRTw/xqw==
X-Gm-Gg: AYBFou0G+PQlQSQ+KWi3F0UwO7TZ1G6dsSsbiIIzvLKqVC9Qnkgu1o+RANW0GimKKq6
	i01+o1RbMzO58eUjxxQri5AxGj132kdahpspCOsB2dZXRVWjGarejkegC4PEznRdS5kv21FYtay
	EPcBibbmk659csuyroZYkBZCgfeEUeSgXP8Yss453htXqAgNgN4htFeH41CsFzOGWgqlvV0nHIN
	zm2waOS0vC3i5a3phZcvvpd72+UOUPH8xR/jI1RZZEL83qtinJWEzq5oTmNCnTBfjgIn8dWL2DX
	5qC9A6xq/uyRH67NGh3jFNVzqxxXhFr+/NRmSEO0lrflz4JjvcAsHl9WaAmDOjbPSlUcud5ASes
	Uv+Chvji0AiJLfh5MeFZYK9y5aMFU+YZ09zLWoo0NqgRWc7s2xsb5hgbxIYy7SnApfKw=
X-Received: by 2002:a05:690e:1504:b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67c67f7bcdemr1039946d50.75.1794381368118; Tue, 10 Nov 2026
 23:16:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com> <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
In-Reply-To: <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 11 Nov 2026 08:15:57 +0100
X-Gm-Features: AclHuK_y6USQFhQ1AriRJr3BWyE_Wi1fKklRA36_ipXu6i6f67Qj9RIWxt--J7M
Message-ID: <CABGWkvor=2AWC06iRvONAAPu6b8SS-JnJYmeALCYg_r4bh3wtQ@mail.gmail.com>
Subject: Re: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ulf Hansson <ulfh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, coresight@lists.linaro.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Tue, Nov 10, 2026 at 10:12=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/30/26 18:19, Dario Binacchi wrote:
> > Hi Ulf,
> >
> > on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
> > c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
> > watchdog resets the board, right after:
> >
> >   [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs
> >
> > On a good boot the next message comes ~11 ms later.
> >
> > About 1 boot out of 3 stalls or hangs. With cpuidle.off=3D1, or
> > with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
> > earlier in the boot sequence") reverted, 10 out of 10 boots are fine.
>
> Hmmm, nothing happened here. Might have fallen through the cracks, so
> maybe this mail will get thing rolling. If not, I'd suggest you submit a
> revert.
>
> Or was there progress or even a fix and I just missed it?

Sorry for not following up. I can't reproduce it anymore with
current mainline (b3dfbde62cf1, v7.4-rc2+) on my current setup, and
I'm not sure what changed. I'll keep an eye on it in my next tests
and report back if it shows up again.

#regzbot inconclusive: can't reproduce anymore

Grazie e ciao,
Dario

>
> Ciao, Thorsten
>
> > I haven't dug into it much. The stall seems to be in
> > pl330_driver_init(), so my guess is that it is related to the AMBA bus
> > reading the ID registers of the CoreSight ETMs while a CPU is already
> > in cpu_pd_wait, but I may well be wrong.
> >
> > Any idea?
> >
> > #regzbot introduced: 65705b18162b
> >
> > Thanks,
> > Dario
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
