Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794549683;
	b=BbN4269XXCIzIvVDHeet2+WeVA/Cenf/df8u2BEg/L3bfkmbVyLJ45Ov7ncmkYkEnkbk
	 BEKakPES+vc6HLqsvqAyGssDE1vFYukTO65Zrq9LRZfHjwnD5VMf0gDY0v0KkfLQdzLva
	 RcibenuVUMVhXG4PVSWjD4cLahsDZcfr1w5YRRlGMg2oqagyfcBGjKk5MWnpX8SedaOws
	 McjsDuzBRuNNBlLL6yr8WqoLoruB1W67sJIndry6YKLXqHb1RVwpUwk4m8ZTyI3CAw7bT
	 OH019/ZDWX0BlCgc03QFLKSBJE4/XyG3EekbDnBbJNqx0qjOJhDiO6LOR61WIbvJyBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0wsol+Mni3pVGty65QPaUG6kYkYqkEsMrdRPAXbVUGE=;
	b=cIIIaDqNHOkF0N7ffAq82+kED/szru20xW8sN7QguKrzSVdmKGXyox5i6/vIxQMWCx3z
	 qx9acsxDc60NrhwzURiQbKkILUDao8q6bPJPfVghauCH5Z61LB3pU/drS7M3lOXonrdJL
	 RX/FsFD0OW3CCX+CvQry/Lr81fUF7ap4HvAdBJehnux7MMLZpSu9LUSpWaNbZQnJm2CLm
	 oEdxhaf3eQPClOs2MvaHJVvoW5VYvL9uQ/pGdODY42z1LGC8nFdI1z085TOfQLJG7DPmL
	 UZKrOOBcKwz2eXyQ9VXtvCdM7GgV1Wgkdh+bpV5pOb2hlJ5u+CSUhcbiytU40JX61TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JV5Ui/fM";
	arc=fail smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD690606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD690606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JV5Ui/fM
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d63f60bcso7213467b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794549682; cv=none;
        d=google.com; s=arc-20260327;
        b=iWcLmAtK9Xf6pbxBv3qfQoV5LOw1XRGWVKx0cbJDdpy0u0/3oaLJJVoEwk+XZ5GTs5
         DL+5PUw2OG9q6tqHzaZraeUnkfYwSbM8CsE56DCuuuRHtXp42Jvt1WYtHVLbpEVTTkG4
         bmb+hfJFYN2MKmC0sk6cbJxIBvGW5exXT0yy8N4CFR4AaoWkoirDVez40EMCgmRBB1xf
         Ixhho4wQbnebq9OShCrKGZYfBp/knmsLHV9GUDvByJDV0ClQpT2xQE2tIcuR7d0HUUIF
         K5usYOPwEUAvxvdi5vK5LNcugsssh05TGxy15nAcQFyNLK8duSv43RMVC0s0DnBa2ZdY
         QcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0wsol+Mni3pVGty65QPaUG6kYkYqkEsMrdRPAXbVUGE=;
        fh=LrYP87V+N0nYjfxLd3JsjEe0PQxZw+r5s1vQvd1SiFY=;
        b=cAb8h05fgQKcB08yu8mx1HsJBbIj8zCGr4BiMul09JISk86NPcDD8F9bti16P9jdj3
         Z5PCKAAL8lGXtASb1shd065DoygGTrqeyHXcAPze+EFzDodkhV4XHMMhjnYkj/isYriz
         FAhtyT8QK250kHpcbTKV+vFcb1L5f1PvuBMzK5Syv2zZZWUXN8mzhNbphFwcOoT8pmLh
         8Jl5AaQNOVoxr4Ca5h+kpQ6KeUscO1xlTLX9opwmL1K8Lubwo0UZeXL0j3yKgHt/elNH
         wmqK0owtY0kGZ/jTAjH7Pl+gMecMoPYBq2yvlo9khyw+4r0ABrfpGfDSXOBDX7V2OSFj
         8+Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794549682; x=1795154482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0wsol+Mni3pVGty65QPaUG6kYkYqkEsMrdRPAXbVUGE=;
        b=JV5Ui/fMb+EZK4MuX+mzfFOxOk/sGuf81ovXRjwIHWbo0As8IxrbfzlA7h8E7MigVw
         /mGg5KoBLHCj94pd/RG+xDAi/p9HhMw/tFGLHAWKAl2zvtMQ2PJiUTYdfpAIXuDs5We4
         WUQR3EuUT1Iz/duhfVt3OKnSLhXWTbZe0L24JB7FgijjzrrkXv/AUaXzd4OPZ5ynSflZ
         DOzwuXiAf2/xLdHl1cqcCSEvanP+9bkPHc8mSk8VsRNGhOPJ4W89p3yCh1dtlpO6pGLq
         g8Cj1rLjfrBKcG/l8bOnYSikb+DNbR19rNmT6q8ywRboFTHJZM31A3RCtEkvcBiu3cld
         YDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549682; x=1795154482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wsol+Mni3pVGty65QPaUG6kYkYqkEsMrdRPAXbVUGE=;
        b=PK6aT4a9/QCxsk6dmG6dr88dX2KmU20DMsurBtjIICv5vJs5ZiDZGYP7ZPDn4E3lBG
         m2nNGYosggnjLtudRHebrf1U3cg1uHUtKSV1nlYVk1MwBYIA21IfiNPNe2kHdXaU2MiG
         zViCO9C0RLmjozxgrMErvddqfWKQQVFmOExcN6wfFVDqPYd4GeNcHmwMvF43E/7ezi1n
         zNfnZzRSraJul4HXyPUupHEKE+j2MVEe5aBCLQVj+XBojlAYmoaZA9SvJ+9g6Euy/fpu
         Ir/JDUKDTB1y7pk8FqZkmlgb0GpJZ2lblZzAp8aZ5tHwN1MjxSuYJOT/bRE/B2IzAn6I
         rZxA==
X-Forwarded-Encrypted: i=1; AL+hErGlfftsWKQFFQqmj0JCGqNKAYgpjEo0AujPlULNXL8arYH0hQDE8TyFU9F4ux+e/8usj35/fWZATtmm1eM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X0kCWc9d7J01WWpDsjdloTNEA2KJ0upSM647olgsu52RjLAjv
	lsZXpNWC17XydKm9syQdee+eMF+uQKy8RhLcmasrANh9EMwgXzmoDfGHcXINNDcQryV1LTvyEZ3
	KjDRKMe+Aq5UguroaKi5nOIZO3qcmVVk=
X-Gm-Gg: AYBFou0B1sybBsMwB8O9W3HD0AN7StPnfKU83YrdXK+Wco/HSIwe3dbi6quELxB1bjI
	Gvc01fGMjwOWMsq52Atfh8KJzNNETgSe+dXiSELIwxvFZdInb9egaHAZ1R+ad7HUiwQB6dz4hIQ
	QN2fgDH6rSJ+Pu45ldfWKEfzBMyKe0sXMV+1xhkxd7c9MUKjCyMEDwsQC512qQcjb+N5YS5k0HM
	6k5iPpiEmW87e36nrL3/AHT4aPHbCjY7yx6lKe1q6ZB1os7I9hKGsIzhk2Xzvm0WlGfUxcLb4SM
	DLZL1A1sS3HjZk7EXYxDT+zGW0saiixLPaTFQ+pHzs+ZfYeum1yGwoHXIvaShbfrMlSZZewXUUK
	m5cj6Fs8H/C07/yrCHSmodwp6el/OHi0z0qzuSjQRR8Y98e3RRBnWN2Mww1LQzkw5EeQ/KQ==
X-Received: by 2002:a05:690e:484f:b0:67c:1557:7b69 with SMTP id
 956f58d0204a3-67d896b2da0mr743837d50.58.1794549681857; Thu, 12 Nov 2026
 22:01:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
 <CAPb1+K2BxnfQ7VUQ15td5f9pVhn-ARSM9EjfOU8WuW72o+cvPg@mail.gmail.com>
 <2f722967b6db0692d4dd4164aff39b62@gmail.com> <CAPb1+K1J2F-=cJF_+Z+RkA+9uLD8-15m3hDv71DSPG47XLJttw@mail.gmail.com>
 <CAPb1+K1pr7wtp-CCE4x4i4HzVkGfpiyXRBdqWJ-fmJpx_-pfqA@mail.gmail.com>
 <CAPb1+K1mmyvipXSx96-j-+zgxeTztLNfYYTuERw0Ykf5WDv9sg@mail.gmail.com>
 <CAPb1+K2NSGzvp5b8_CfRrDK2trD74+pCi_a+OYV4cza++DP=8w@mail.gmail.com> <5252f18157db7e26e27dd3ae2acb5b39@gmail.com>
In-Reply-To: <5252f18157db7e26e27dd3ae2acb5b39@gmail.com>
From: Gideon Heinz <gideonheinz02@gmail.com>
Date: Fri, 13 Nov 2026 07:01:08 +0100
X-Gm-Features: AclHuK_hQ0eMyCKYBJK8TqPVDkMz_GToazsA-5wv3SadGkydCXgL8Hl4QXBPYv4
Message-ID: <CAPb1+K0_UXcaZWvfmhEt4B1AxH71D8hgaEyF0juoA=cU2aT7Hg@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] HID: logitech-hidpp: G920 force-feedback fixes,
 rework, and cleanups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, Edwin Velds <e.velds@gmail.com>, 
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks! Yes, please add my Tested-by to the input core patch and to
the hid-logitech-hidpp series patches when you respin (without 22/33).

Tested-by: Gideon Heinz gideonheinz02@gmail.com

I will keep running this combination on my G920 and report if anything show=
s up.

Thanks,
Gideon


On Fri, Nov 13, 2026 at 6:39=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Gideon,
>
> On Thu, Nov 12, 2026 at 03:50:37PM +0100, Gideon Heinz wrote:
> > Hi Dmitry,
> >
> > One more result, this time the combination you asked for: your input
> > core patch in the kernel, plus the v2 series without patch 22/33 as
> > the driver.
> >
> > Setup: CachyOS 7.3.4 kernel with only your "Input: destroy
> > force-feedback device on input unregistration" patch built in. On top
> > of that, hid-logitech-hidpp built out of tree against the 7.3.4
> > headers from your v2 base (630059a5a632) with patches 1-21 and 23-33
> > (7.3.4 already has a different G920 init fix, so I could not apply the
> > series to the in-tree driver directly).
> >
> > Same reproduction: fftest holding the G920 event node at the effect
> > prompt, rmmod hid_logitech_hidpp, then exiting fftest. Result: rmmod
> > returns in 98 ms, there are no "Failed to send command to device!"
> > lines at all, no hung task warning, and fftest exits normally with the
> > machine staying up. For comparison, your input patch with the stock
> > 7.3.4 driver took about 3 minutes and printed 12 failures, as in my
> > previous mail.
> >
> > If you would like me to add a Tested-by for the combination (input
> > patch + series without 22/33), please say so.
>
> Thank you again for all the thorough testing and for verifying both the
> input core patch and the updated hid-logitech-hidpp series!
>
> I have added your Tested-by to the input core patch and will merge it
> through the input tree myself. I will also give Benjamin and Jiri a
> chance to take a look at the hid-logitech-hidpp series, and with your
> permission I will add your Tested-by to those patches as well if I need
> to respin them (and drop patch 22/33 in favor of the input core change).
>
> Thanks.
>
> --
> Dmitry
