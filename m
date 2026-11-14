Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794688756;
	b=Nm3akBGntWk/pXY81Pwc6AVPUH7DvPSQ+LCwrD91utLBUbWTYn9XEQoJcxp2WqklK5rF
	 pwWOqFku9nKLQYd1HLWG0as8nVR7TNF0r8BcfsouYqY7WQDrMRXhT6n1T6fiO9xvG5RU7
	 9aTpBjnwytVMEN6aiAO3GaW6mbIPFWYoF6bQysOplmpPGOYmvTw6/ihEUkGBLH39fUg8B
	 c6ybx8Ru0qiWg1oJIWOMLU8xPyWyqQkBmO6zUghgshx965HN7dj6Aq7i/c2St4g1x3iSt
	 DuvR4yjtt7n9cmekDtqiqXPjKh2Mx6xmDPLtjXLSkxjfqVojIdblwSMoJelEFO3PnEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794688756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
	b=bQs17qYL/v4ZkFzYs20N5YnxUtjZiPtbh1yfWJ/YLykGq5v2CTnJYZE9y3wS7xLasxTZ
	 645dCvnyISfQ+CVc+Aou9bDZ2Xq2J7ef/MZU2/8LYrDZSnzQKplYn5x6LyBhjeTg3Dvjz
	 Ws4z2fIc+ykg9zF7uTWynF4y4r0HwGMTIMldPKGtw4091Y0rDiLr3sFaem7ogk9TCy16/
	 z6SQSYXoKkPNM/DnuDPjCRyGqIE67diG154QhgYluJw6b8q1zhUpHDo8SMDJee49z5pZv
	 kN/p8v/DomiCChEoO+JOuZQcVt3huE6rtXy0dvBdn4f79JNz6g4cSY/UVr4Cy8I27NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8ukABJa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE98606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE98606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8ukABJa
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so415376566b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794688754; cv=none;
        d=google.com; s=arc-20260327;
        b=sfkANHdg8Kd7ZFRcMaFwqyGL5SCK1pMOT+swiXvbSlK26WuSw5qHA6/127qevAHOlM
         IMw721JmbyFVWq/eeIhBtXq2pyQR+uvhZZZx1VVpewpI823S+aJBxeQRDVhLBvuCMv0/
         cnv8suAatoTp/BiUXxzs2aW3Bf2tnzqOfncameyzI4JkmD4htr4ZZCLJm7QEDMu5xPum
         PeePRjrOOECrCboSlcjzDMBO9xHfZY44Du7NsFfdbrNQ1cV2o8kfd9NSqimzyUTGh4jj
         snuwZUlofbPMBuH449FSERR7dPkMo159iAG2Mx9j8Qd2aME55LLuN5K0EIV1CWNyChok
         Jx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
        fh=E2fgB3AqRFqP/9wms9TMmuxKUhzNHBiYnix/y+hu/Ow=;
        b=jzdsSgTdckGRajj6jmLuGpIYFU+047VEd0So45WMmO302e1mrwIt6AhPRb1dOWMesv
         sC/JjFsMqyIqN1q/t/xIPPOUQDOC+m6djNuqCgrNc95aa2XdtocAO3njpWKObvGsc1YY
         V7FfQRup/fUsuS0L47eAHmdMVipABpwzvYub0iOAJ9xnCm9xYTUDUhw2hxjraXO1mqoq
         uualHC4S+MCwlyy1ahDPhoW4YF8tC/gu9IM7TaMsFAmnunsUvlD9/MPSRHqOn40u2meX
         fqhivfJ1VDlFQ6Z6vMTd3i0Pd1kbseEyLu4FF1zKS6m537apFJG6EUHlMSG165JtJGz0
         D8mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794688754; x=1795293554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
        b=F8ukABJaAnd8b+MXpOMreIzMQptBsKsYhAk9Y4lf8cTBtHtLyeZeiKclCWIICnOJbb
         bo37qHCDZJUkIWp13k4pc9zzqltHAsPv8x/02P5QUmP6/kgtZ4LC3EhsjWofjWGnNcfX
         zMSlCnY8qPxU8cVQ1fRI7mLiwsn8W0HJS916VvgscSpmcERNl6jBER0i0a0TA1fa21P6
         /aG8CfNL01raiT+8RxCrzhp3+eCXP/jnE6C8fiSDrV+l+nQd8kPM+QQeQ1AU8tDxOA/k
         +fdoYz1m64Mf8faPDyccVDv/ywENForLLzswzpDCO7I1P1DxfoU8HD1C24CjxfLqCeUB
         SvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794688754; x=1795293554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
        b=ZJGU84d6E/sromfhQsJzWJhuP8TQQ3CVLeK6ZRqn2cRG9V/XTKmCH02y7TuP/3PaI+
         ZuJjHlZiJjQBdI4LhTzwTrjeZcdAXQ+Uh6118RfeCL1sXw7Wp1CBVJFxqZKC/1/gX4K7
         t9LveDJTgRJHsDeSF3j/h38T+V7l5EbFv1B2MdE3rhvSi00YAd83PHtsxT+FG5Q6vCKR
         n2WgQ2uHNthueIoPK7OwHzpmSOSFlZGjZArgd/zO8wds81Kj8GIymu0sNR0URNg9nZYJ
         m/n/u5o44WPXhvmpc+PGdGwMoX46t7MFaxrKeT5ZMf+gPByhPPhdyEVmPRuZj6lpOjJE
         3EDA==
X-Forwarded-Encrypted: i=1; AL+hErGmpvzxNfReegA1Lc8ex3APVghVerXzlVn8U/MfUsCnsZtclITOMkvznN/5zT8mdUjCAsfad/Z0NTS3VN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5tmx2CHvWeoyUkO4g73NGgUdDsHK+j7Yjd8S2EG10LjEPYiNS
	cT7xQ+qnjT3RD5kd8D6a1ryRE4Q3CxoMKdvpaYQMq8Xxq1VqAOC0K86g9ywFXLlcZMw3t8XKDRG
	XwSExcQj4HaK/VdxT5hdFHPnHdqMkMxA=
X-Gm-Gg: AYBFou1u2uEfd+314NJWMMeqM+/o602di+ziLw1oRwny2kUGB4wD6tAQNvSM1qEWYhH
	fdalGT3l4yqLz9vEC+Fsnkrs7DBW55BWvqPS/hG9odj+oCMAXSPcUaLgmq74KV7QW8a+ltp4eFC
	C5ULT14HpC1DrwvS6f5Xdma72Vno4CpFRxhaWYIgak0+6TaqMJx1IYbJqD47JGDtZ6Lc1IjirXr
	w8fNSHbajVSv7BMdlj3nz0XrJ39ynYfqzUXIclimTOoHiOjTuaA4IdvJsVsvST7+iU3TFoDkbAP
	qxIRktaXRqEUvo51bFXJ18khteEs/6aBmkXQj7LRRoDg1uzQCIzdfRJgKDUudMvvVKT5GpxmOLJ
	E2cNvu7jdSPxnly65HTkBN4caVVstsd07P3Zp
X-Received: by 2002:a17:907:8e08:b0:c50:4d71:a85d with SMTP id
 a640c23a62f3a-c509641ab20mr445443566b.32.1794688754274; Sat, 14 Nov 2026
 12:39:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <avbP8aF77eg1iCPR@analog.com>
In-Reply-To: <avbP8aF77eg1iCPR@analog.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:39:01 -0300
X-Gm-Features: AclHuK9BY69kDDjUdmT7GeWf1Q2o8MI9AUV-rzgv2jbiwBRGrXdhb9u9CoLm1Ew
Message-ID: <CAJq09z6Juk0Disr-AKCV2pwP0UFghWMKdcMry2g47hfKahbYVw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/10] net: dsa: realtek: rtl8365mb: DCB
 ingress QoS offload
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Thu, Nov 12, 2026 at 09:37:43AM +0100, Oleksij Rempel wrote:
> > Add ingress QoS offload for the RTL8365MB switch through the dcbnl app
> > interface: a per-port default priority, PCP trust and DSCP trust. The
> > mapping helpers go to net/core/ieee8021q_helpers.c so other drivers
> > can share them.
> >
> > Two changes are visible to users. The driver now rejects a devicetree
> > port that the chip does not have. With a default priority set, an
> > untagged frame that leaves a VLAN-tagged port carries that priority as
> > its PCP.
> >
> > Tested on an RTL8365MB-VC with eight queues.
> >
> > ETS scheduling and CPU-tag pre-classification will follow in separate
> > series.
> >
> > v1:
> > https://lore.kernel.org/r/20261002115850.962676-1-o.rempel@pengutronix.=
de
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>
> Notwithstanding my other comment, the whole thing looks good! So for the
> series:
>
> Reviewed-by: Alvin =C5=A0ipraga <alvin.sipraga@analog.com>

Great series!

Best regards,

Luiz
