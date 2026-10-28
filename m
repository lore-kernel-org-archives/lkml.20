Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183898;
	b=xepC/ZB6o27/jx0M6FH0T2/HTWDS/tuqzTySN4t0OPr+buSBeaosVnUxQgHnmfJD9KEr
	 PnhEcQXXL4+Ek+lco9vbuAhFaIKgJUtsY5yon5uPF65paEAo2OqzZr7FVhMyuO/oK/Ayj
	 UAcPWOKWzlM9iAad9yJ79Ws8FWifmTcxydsKwGPeMTqwZyKcMDZQs5WNFqMLXSbAG9FDP
	 Q6WSUC1ZZxfGdhAmvtw67XnZEkzhlVlGNtvNDf9eSJVuxpFZ0HlU8azHOVx81sDF0AEEa
	 hseGHu9zqhyuy/G7odHEZQaKk/Vu92RFNOlXk7hsfhrwjCNbXrXNt/Rq7LazxvFfB7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
	b=El/2LqCaoXvliKUJFj9YK8eK5GO7pYzQv4K8sdawW3cHxu2IQuMnyuztTP+D7WAAUVu/
	 MgnByvPWCUKtEurciX8hpZR2Cj7H5YWy1g/OWctjRcah+L+lWLUs3nMqI5ajuMJeiQtqA
	 rmVZUq+ZGQlR7lrpiJM2FWOKgKG/2C8Li72LXoab+SWN9TqhJP+JfizIvyabvEPmrhCkP
	 8pvpf80ZZjH3YJLTNRmriR40jlprEQbbeZNviVIrAPYF/A6SjaqcDhPi9krkwlf6AL/sZ
	 +jETlxHCF9SwMEgjYdP0yWuv0lwA2/pd5lSJJlud53HZUzJsxEnhO81lCHyzNkrinLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGbSsJuD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08882606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08882606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGbSsJuD
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4550d8ab15so100034366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183896; cv=none;
        d=google.com; s=arc-20260327;
        b=CD4cpH06LqNCMW9uFuJQ/Mxghi9ZzHHviCPAfNrvIZ2VkP4/JpnN/m1nwfP3tyH2BT
         YSgSAtZwmHa1Dx3fNELnES7W1A+4vQPhXJzY274mX5+Tb4OCuRyirrvd7dW2RBGV+705
         0yM3Y5sswZ5SxHan+lfUuxxT8loQHYAHd31leSZ2eElhPkFRtFTZbtuP2B1yZXbevemB
         xTCdW/Sozd+HsKso+4o+nthIasZPYrTnCbhQkR4VlvdghWIry8+ikSYCTLirI8u6oI+0
         P3cQ1sQQSiXJSyfyzVVSaQOqHNwV+kQnURveONdwhyNy73NkrrxyXcxVbgmjZXndiyCg
         XAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
        fh=4tiCTT/TZ12nJcnEakm1r8EpDRdsypPceY7etls8D0Q=;
        b=f0mHL36to6kw0hQIikxOmvam333L68+YpPseUXHz7x+6UV92GU3g1R/8ovt+KvY+Z7
         13/bpA//lTte9jc37rkVluJaDS9c/jfvIdWlPP/F5U29j6VMN7+ZQ48yJ1i07IvWYRDt
         eALWMiawbziMpdSMTC2G81tEHr9+od6sAWUu1czBOc8eiZs8j0MyQprvHx2z9BBKWIzG
         axATvW0IGivdvUTm9395AqAH2j9u26/gkvaSS3hYleiEocpv6x365vF36tTAKTn+dj+T
         wi1seblgWzLWySsYciOx2aGZZHqYwUisyrKakSCqpnlN5Aezyp89x1d7ufQlzzuNaePh
         6DBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183896; x=1793788696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
        b=CGbSsJuDFpm9cR/AinbpH4d6OnVs5671xl8yLP9EAX2fch6hUrzB32MgfiVv2Lq75z
         Cqzt2QW0zRHlpT/2hxtKY/nyELVgsw2awEpz6oZkUVpnn8RJAuznWgworfKq8bXVyxMt
         hKvl/y6GTfrXDJpIijuKrwl/CzAj1cnMj232QEj1CVfmYSrlxHOjI+snCe1JZd0orsuC
         dy2tuIbWA2suu2/kNYNcF27rKdalm9neTWF/t90O2Jos+ed14MXtgX4jKBnmgNCo4w5p
         lxzINgDIF4x+NI+1bsFWJYSp6CreQY6q3iKSGvGkT4DB25OiV+dYveecdPnX2yPSQ6/n
         itWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183896; x=1793788696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGvNJU0xYjBPfEidzCdNCr0rCPA+a8oBaQszJZJKH+M=;
        b=qZKtBB5t4rA/uWvh7O2ILGedelYC+wavhcYcSBslJP25gSydix4sz8ewPCP6+OsZlQ
         dCjWrfmFQ16UyAyvz/R97D11gQQdyY+oz0+E6T5pZ0NjkkfsSBtabyZwlGylt2fo3Aq5
         ktFmqkWQW9hWSdEn6Gc9ptHtjfEps/wKDUiX3ayM22NE6+wxgypo4Kga1uc8ykFIbMj0
         L+/lWyf8C80kTl320iuZYhdatstoLVyrRGI2qJadd087gYdvkO8of2CMl7pCQObqe1JH
         RlzocYfQjSo4SYBDbug4KJf9/0SScI3uYg8EkwJS/qNWBDW1xSalTCSODNXIlammlk0N
         wCgw==
X-Forwarded-Encrypted: i=1; AKwUvByaBHudGDgVq4A5JZMkvE1xslpP1tg07IKO3VUJgjoXl/gRGvMcHoMUnnweTF2yvaCwvPc+L82Uxcf3Hbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzgUgCcMkIrgkjjd7MxRhUvvyBE9Oat8dNMatvv5v9SzjlLHxt
	NZeXIej4/o+F+8SL94pPO6MGHdUh5lc0XaiUiKMZqI1ITrguWXGxSHi1OKayTh6rgbixgvlV1vx
	cDtAnL3QH6HgBtrXyxS3sMrUok2vq+PY=
X-Gm-Gg: AYBFou2rL90/AqN1S9xidUoM9zihH1UMxJ9bRh40kTh58a9pxJFBzABo7hwD8HsrOpa
	FNPxVj0Kg+zEplAW/ur3Zuoxth2x3cOkaIH9f1c10h3RmCEOgsZCs2N+gWZaL7m44M4TEuwLlbZ
	l3yk3fwioVsbfs61EpYrU7zRLVYJoGSvl8a3Qu0+Zl7hzG8D5ZtWh3u95no/we/FAhPHQgPBF31
	uNkIaDxaiyYMDBlBZvkG3HCIyz5+RUkf5lW9NKEFN82ttng/qu5e/6MUGXFI/xW9zVdSvK4/R1G
	MCwijQW4aSRPytIpJ9PblZ8akOCV5Wb09Gyov+hJ87e9YLzs/o8znB2SPdA4tinE1I3TLo94MIp
	npjrzB/ZJZttkuFnCKVBadf4iHivFFICDZyUwFINElO2DjC27pPJVT1g4XSRCRmZwCGdx
X-Received: by 2002:a17:907:1b15:b0:c37:c0dd:6642 with SMTP id
 a640c23a62f3a-c49bdf39b8emr148047866b.37.1793183896319; Wed, 28 Oct 2026
 03:38:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026125751.1700779-1-stjepan.poljak@gmail.com> <87pkwv385p.wl-tiwai@suse.de>
In-Reply-To: <87pkwv385p.wl-tiwai@suse.de>
From: Stjepan Poljak <stjepan.poljak@gmail.com>
Date: Wed, 28 Oct 2026 11:38:04 +0100
X-Gm-Features: AclHuK_PuamjIiFfAzndUS8tRuWw0N7bi55u4XT3JCo3FvrjTK2Q_qFdFwSq2b0
Message-ID: <CAKVkeTxg4LWANUmqa4rzC-w8Ai62vcxeSU1FCAWSyA76iyK8yg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is stuck
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Clemens Ladisch <clemens@ladisch.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:38=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> This doesn't look like a problem to be worked around in the USB audio
> driver side, but better to be addressed in the USB core, IMO.
>
> Please try that, or ask USB guys.  If they find this should be rather
> fixed in that way, I can reconsider and review again.

Hi Takashi,

Thanks for your time, and agreed. The host should have seen the
disconnect and on xHCI it does. The Pi uses the downstream dwc_otg
host driver, so I'll first check whether mainline dwc2 has the same
problem and take it to the Raspberry Pi kernel or to linux-usb
depending on that.

Sorry for the noise: I sent a v2 yesterday, fixing the review bot's
findings, before I had seen your reply. Please disregard it.

Regards,
Stjepan
