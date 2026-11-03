Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793739561;
	b=Xx01os1B0T70933q8jyd4aDBsfxZz8RH1NFlDDDJBZSqoi66zF5jPHc9fNmUOdQIZjlK
	 u2AMNRzb2gmYvaT8gduaOOzPb38/nNqtF4eeRNWlT02e16pGPpa1kiGl3O3mZsLXiKpS6
	 ZAFUPhjX53MtLx2zt4jeOahBiTGtBK7MDm7/9pT4C7irqKxoirrTy5ygUp5e0+R2bMbpm
	 B1Z2HoRWk9YkG3btoVbSjFyeVpzMDyXnUSsnrrh5mB/ohu69HEG4gezKEMHY5DgEgo/qg
	 ck4ejEFRNEuYLSoacNRMwPswKn95LCgwPycoiEXHYiPvGvyg36hq55tDjA82st4fuCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N522AsLlTU0HGBzik0UilBrcnusjUUdJmnwssk6MniI=;
	b=YicvOkh9JAJ63C8UkDSzTt7e5KeFuiB5B7BeoTMetLUM3s7uX7VDFTULWedpJkyBR60z
	 CqYUNmY6e4rujzk42OJcEeZA8dN+WcT3Lz0txv644or1lEVtlUJH0+GBU+2yDr1bCLjs0
	 834EGSbW0weS5BeG4QesOALAeoeHZ90uE61+ueHYLHgfK5PeCcHzBKNjaHEYoCYGO6IJT
	 NSa47mE7MfY/UwhavTr4W1+397d/3+n/VopMOacXEyRLoJm59sHCDzRwy6JcW0XpmedhL
	 Q4wqbfIiL5vtHEl24NIR1VVMBpNvW4qiPv21OadqmnAT429jkD00fH+zP/flmLykQIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=THi0BWIs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8C606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A8C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=THi0BWIs
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so12107f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793739559; cv=none;
        d=google.com; s=arc-20260327;
        b=c6bJvuqXinEvDEZSLDRAxIDD7f3OHy4R11NvsdahgQQacsbSO/lfwWeFPmWEgTc6sB
         StS04v+4SC5kAroCgbZNegrQQr/uASezcM10OM3IJiAdMP/rehBkpkwdXW7gwwTqWwRc
         V/6nac3M03dsrLQdcuVTaJyqfCM+x8nlUL2g61CMif4YgEX6mezhNSTbJvDi32WqkVLG
         voIML6OERdiBSOJpqX0k6svyeHs/zbbp4zKFEDL/lPuB1F8k1qvAqGblRZncG1Ll/YTO
         hc5qngBJtiWPHAKxC2KkZ498QFUlSUQxYZcTwRxuQahggvpPMWq23Hm2MTvs3YOZxz4S
         XXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N522AsLlTU0HGBzik0UilBrcnusjUUdJmnwssk6MniI=;
        fh=WNzRN6SOADjOKMICbFVPwiagVuc7XwcxKVdG50YJ76Q=;
        b=rgA3S+w/Al7cKcbOTHE8n3HTlqSzqmyJkxGyjBIUzFzZeEC0N8Piiy9ewqmDXlI0B0
         gwikonsXuDrJasF9/bgOlBtbpQ+aoYbczXklyng4aPGjtq3SW7RlgMF7YhzC2AfdAp9K
         xixJ3Uqm9XiDyqHPngbXPmmQswrrsBZKqn1v20NHV2X5p5wulHbkSCQq371Cna/BHeCv
         1okxwCqKvZ+K/clzs6iDVxN+ucFMIEHfZqR6SQlVkuhNAV1tA0J0Ub+aUnakmSQRBbKQ
         Unut0G6DKkBmsX3W3gte+aXfDRiB8Rs4njmeICCBZrAMaHAad86Z2rV/EHl3w99Kdm7p
         q2SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739559; x=1794344359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N522AsLlTU0HGBzik0UilBrcnusjUUdJmnwssk6MniI=;
        b=THi0BWIsCExT4wh6LsS6cx1+vPSDqDkZmIBdH9DbjexIlCwaHwpfZVUkj+k3owPTaP
         vCyBjnI/lLtQyNsrYwNp2tQOap3v2P05t/l5bnUqtsefDs/Tx8Y1mnOsF0lP6YCnste5
         0IEy+gaKAG+hmVB3cbpsE6dDo8jAxd51p9+LQSGjv7EI57J5LoGGSyY3s+x/M6RBlGWK
         yxSc2h8xZiWHnMUcsSspguOUiuLrcMXUChC/7k2ENnQ2DH6VSFetSIxlkf3edwhqebJg
         XLe8JlE7mclF1eJaSipzq/f2W1Ff51HDozw/0woNPPsTYBgaFBcevuuZNrpl2qMIeGTH
         vWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739559; x=1794344359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N522AsLlTU0HGBzik0UilBrcnusjUUdJmnwssk6MniI=;
        b=ApXtUXYWOxyKC3z2IaHlRNiYHhn83ig3MemnYEZNWY+X+pCvdrlkWXl854ImZcqPUZ
         I32wal/a7AYmsO6GDinCTcu1psg5Bul0QkgljQVIUXIT10m/ddGaEayvwLEZ1ECP8D6e
         38F9YLsWakqJCUaAAwZZFd5wrESXpEONW0VBEConqZE0wsav6yB0XTRtalM/Ja0dadwr
         rTXzlawnYrnlJCGNg4FOgGA3dj+rqRyLRhsjQyKqJjYV+Pa4RzQvbYkbZ4LJ8Y2ZrJBl
         FWh0divN7JeFH4FTpUuOm6vvA7Dc7e5CtDACxRy7XtjGD+VqD9Vfz/lkEMwwYql1Pp3t
         7WXQ==
X-Forwarded-Encrypted: i=1; AKwUvBylfzu+K/Nm3z2WOtP/xWZNKh/vZpiy+x+qrjcB5EJDBv6390kiehdyzxxiidVaOe2boDCswrOxOWN155Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gdKIID/51Ef5aQGEaVe3PBpu5nte7CsBePPi1BrFGBBE+jMvV
	4P4XURKMLkD9TOpzilwgIvYCPyBASAxIxLhIzwhjzMTq53J5Y1m92sQ9BNWaqM7VDSv1uP4+xBJ
	p6zQfAk7cV5I4kEOfxIBGchVeKljCTDc=
X-Gm-Gg: AYBFou22ZGz4c4/kg9Ikir0L8SpAEKUDfu0ru5UScBsdCQAs/Hua3r45NE182CNuxL0
	UuM2kfdhBuuk6tJwKqYEZOkZwtvnUH/9dP5lcGdm7S9eO+fuwddRElUKWY29wXTWATswyAhliTA
	ndXxWp8FN2y4Xznc8fhrNLQwZd5qtdTHxEnkMoVo+ezKUecRRRJ+sKiY9Wh/pLEc7NtJ6VDLMPy
	sou5us3SJjOPKA7cJ2NZWBA8eiK0mKSeOsX9QF27AAnvG5wmkStz5sxaM6Un4HbDXlibIaDiOJj
	SnSuU5mZC3SNdndEoSO9abqdlrY3Cf6SPK5mO+Auw9sWJCa1myhlHt2KCnqGUa1dO3GyrmoWKbv
	wZLGrLWDQ1PMf5Xdo14IwvFmNMIiShKGshsNNxeM=
X-Received: by 2002:a05:6000:1449:b0:48d:ff71:dd9d with SMTP id
 ffacd0b85a97d-48e6e2ef786mr30220280f8f.23.1793739558923; Tue, 03 Nov 2026
 12:59:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAGxFSwnBDM93ouN6Aq2ppm5zF1h19XE6NJ92NT2UEhMP1P4xEg@mail.gmail.com>
 <CADnq5_PyctWJK2k4-CutYFNPkuMprmZE98d2JjodBQkTLGJhDA@mail.gmail.com>
In-Reply-To: <CADnq5_PyctWJK2k4-CutYFNPkuMprmZE98d2JjodBQkTLGJhDA@mail.gmail.com>
From: Arnaud BERTRAND <arnaud078@gmail.com>
Date: Tue, 3 Nov 2026 21:59:06 +0100
X-Gm-Features: AclHuK9LGpsbyCsaaCaEXiY3-KA_CdLHeIgy5ZFJMBas5Xa9tgkDNg4pPpu0HGs
Message-ID: <CAGxFSw=PgG+hewz5eNcDDma57+oJE2qd25mZByyJ+4dFhsGpYw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: add firmware file fallback for APU VBIOS discovery
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Oz Tiram <oz@shift-computing.de>, airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Mon. Nov  2. 2026 at 14:58, Alex Deucher <alexdeucher@gmail.com> wrote=
 :
>
> >On Mon, Nov 2, 2026 at 3:07=E2=80=AFAM Arnaud BERTRAND <arnaud078@gmail.=
com> wrote:
> >
> > Hello,
> >
> > I have two dGPUs : a Radeon RX 6800
> > XT and a Radeon RX 6800. They both report the same PCI identity
> > 1002:73bf and each has a different VBIOS.
> > I hit the same VFCT bus-number mismatch on 7.2.10, but with a different
> > outcome: on my machine the device-identity fallback actively breaks the=
 second
> > dGPU.
> > I patched my kernel to remove the fallback, but I would like to have a
> > better solution for my use case.
> > Would it be possible to apply the patch only to APUs ? That would keep
> > Oz's APU case working but a dGPU with a stale bus number would fall
> > through to its own ROM, which is the source that is
> > guaranteed to match the card in the slot.
> > I can provide more details if needed, I am out of my depth here.
>
> Should be fixed with this patch series:
> https://patchwork.freedesktop.org/series/176969/
This patch series applied on top of kernel 7.3.0 indeed fixed the
issue for me. Thanks Alex and Mario for the swift answers.
>
> Alex
>
> > Thanks
> > Arnaud
