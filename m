Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793844812;
	b=31CRQ6+R5kIUSgjABOAdYSUfIU/V/rTBcW/5cmcCp6rFmcVLkH6034/7aw6AW6TKPYeT
	 fQcTg2lyM/7HJ+T9zCKS2VJqHI/DmU7DKRMAB95I7uiT86HWCvLc8J8f5blEMUkC4XeSE
	 alFprmtE90qOSyiUdO8xNf4YayMrg+SJPr4+mqT1tSGB6b+GBGBo68n5Vx3NIDK5O12B0
	 wCRxoVsgQApaFCNqmigox5RuRPK5ghi2/wXHAshWYhZY/YhZ0P0Lgvb2AdGIuKYdEduS5
	 WFwo1xMuyXSXRLdEKmNUrY9KHrW47trppX/GOZSQNv5YH87glTTUtkLK4jw7u/AaOww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
	b=B3jGEmphb7AgkDzrWhg4m2ClHySQkr5MY8juAb5jRFX5cEFvNAmnaRJ66nFASLBjsXWj
	 mUFgAu6cIwV6qizuCrL0H3jbgV5Hmc77udPNwlbIE9wPo9y8+m5EtxyCcn6s7ffVBRZh3
	 NVVgOWDmqIInf7Po7e3y9MS6qpVpHayDFElAoqAd6Ze9DiHM+MpoVIBoAhAMtQm82fmq6
	 SCzFgA7n6kHcjWFP7F3v55OR5g+Knx3lJkE4nNA3cImYdyhEdRmWPJzQHUqD3WiYvvPUH
	 uO3sE2Uv18yF0+77oAxDjRz9Ain+xLWyLmr+8FYugk5GjJhPCrKo4IR6yuxnwJvE0ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110F606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6110F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso5978a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793844806; cv=none;
        d=google.com; s=arc-20260327;
        b=dIqYGePYe5TRnQyAwhXVMutp9OVLOPiFE22JaPZsmL/PDrhOtbHVvU+Dfprln3kFfc
         /nQpxs94FpVTRGRV+etzu7mPk77F9sVi/Jfyz50HAINDpzUPOzRYgfli+0UzOijZFtih
         scdHh9btAiturfSt3S5mQPYBr4uXnPC5SlvVpxtwdrgcDCVMuoWUlda6CfH2ymMh2IZF
         dSevqj0o/r3rXyPqMK3nZVsRp5l/iqsweArS0PA7U5aDZRmjpINUWKtXt50mWHnA3tg1
         awiBWLfC8xyZwTGCVlPrpgJEDYzug3hmH4DaOvJ1jJA1aI+k8axkYqiH/O8Tepejr0Vu
         +u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        fh=sLvPcaxS1i1r+ats7wVAe5ngh5C/+d2JBJg+FhJavxU=;
        b=c+ONWnbmogG8Xe84199W6/h7sBx0JK/HHFZV4BKKLc+AY9ktCcmCQhM02BzgSe7ow2
         MauRdzg+Ac/oYdcmtwNqB3+gzpj6uQ8Jx8Y3ehtaWAqV6bHvcoffDJYN+svBsrljSJSx
         4gtf717vCoj5mNx7paGimZUr5lDDpoj+5lZmK2q6OjRrTZW9kAovQciDLaeZ+1tkoj6f
         BiIerC4pS8uDdc4rrqxlmD5hw53v1nAPO+MUID1B9tP5yXnjNaxAXal261e3roQ8HBmO
         lHCS3ZxpolDat4gx0/RJCy0BaMScNwm678eu+ou96Xj97haUJzNmHp79YOPBtly4u6Dm
         EIAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793844806; x=1794449606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        b=e54vUMq3VJQg+XBl/xCM483M32/b4tOTj2yEbVLqfjK3dNUY/Mc6rXpZ76/jR2LPQk
         +Wy9VOwrhxjo4L2MnkX2IlFBmLRwbJr2p0RGTnW2JAb5Kj8gHxrNJrzjreEVNyHqXvh8
         8mYGJ1MunF3zziLGlUy8UGiA/Ej/jRtKSK6hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844806; x=1794449606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        b=lZqqX7fjBfL0rrt0XWKCg1aS34blIGVTogJrgSYHXQR/NsJCRp/z6m5oRVJcz2jJvk
         sRN2YtLkHvoiheOh60d74cMFx8wHFOrghmv+TUtgRoTHEf0mmHuU56U0xORp2ZlfMLJ1
         dOR6dqT34v5Eg1KxMUtxze5nx/oe1Ti9fYDot4zxSIxKbc0VIoqx/smpGa7sjRKaruR2
         SIl9v85NJdkTVMqEGk6S0CtOFIAHMDJ9lIEwkPNv+oGMrfRaoJejvHwVO/VW5agGw8qF
         ispDq9tYyzkP63hm744hpvMtacNdxV2EugjvVH64SsHGscPZrB9bCjYrVDJCpSom0XBV
         PKVw==
X-Forwarded-Encrypted: i=1; AKwUvBxTTfgT41qVWRuqrkFic1JRHSJH4uNkVdorp3rtCfS6MpkOLaeZTQn1giG4FXGY2QzxVCXSaHyR3opzRtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B/l4Z/fj3E3yO1Xi3bOAXhJF9G9BvIrE73n3u9HqMDxz8vBUu
	CsG1obMHcMwAROm1o1kRr/h7INmKOWF6TvwQOtKDAPwpePenf3Qxfr0dUUHdWiT7hB45M9xpZPW
	0DryBHAoMSAEoru0DdnjvqPRpvuTSMTLeBXZ/NM7/
X-Gm-Gg: AYBFou1YdjUWL4r1cm2G/uLNxwwOcEcUbCfuG8tPbvP7bq878wXo8cgMqytyNaQ39Qt
	IwsRDG07xNZR92kNpM7Ki/N5oKJZZ+ctF/EXUVdoMogeT1w/FVwS4vK1S7TIqr00C0mLIJLMwwL
	/uoxQ4KP2qUfFq2+p1WhGa0FQpgY3qn9wXmQKot6IDIJ/YMOM75CmKp1SbZFAPuWVarIr3C93cN
	+JICg7dmVhQLMvOheNITdciYZVX21x40yS/iKkCTH0sZDB+CoL71w53y9QTNrub/uhSiNTLor9i
	FWoGeYw3aGk0W2NZs9g8mIUVVk+O4XcQUl+CXQ4wcUIwDoUIsaP6p2imrF0S092VUGWgOWgur7E
	TzmKm6zIOt5PfiMrjwtAw06d0mZp0chgsZnTTTqOdYhkEL2hbUxlvB9xcim/tGe7lgF9GcI0wLh
	RkznWmr+X0hRmREby+NAudHg==
X-Received: by 2002:a05:6402:7cf:b0:6b5:65ef:440e with SMTP id
 4fb4d7f45d1cf-6b57cdd26d9mr21493a12.12.1793844805321; Wed, 04 Nov 2026
 18:13:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 4 Nov 2026 18:13:12 -0800
X-Gm-Features: AclHuK-125zaIgRXhhjwYItELasBysm9j_wuLFip_xcu42o_jtzCl0wz_NYTSuw
Message-ID: <CAODwPW992ncQNo1yxrOrAKKZ62TB_U1eYWstZuTKDKqFCFGRSA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] watchdog: arm_smc_wdt: allow a list of SMC
 function ids
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Marek Vasut <marex@nabladev.com>, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> DT folks, is there a way to keep the list in arm,smc-id that you would
> be fine with?

Perhaps this is a bit of a hack, but you're in an unintended situation
that wasn't supposed to happen to begin with so I feel it might be
appropriate if it avoids adding a whole new mechanism to the driver:
What happens if you simply define two watchdog nodes in your DTS, one
for each SMC ID? Both of them would independently try to probe, one of
them would die from getting an SMC_UNK, and the other would continue
working to pet your watchdog?

This driver started as encoding the SMC ID in the DTS and that kinda
seems to be the standard for drivers interacting with non-standard
SMCs, so I would prefer to stick to that rather than hardcoding IDs in
the C source (if we do that for each board it may end up being a long
list eventually =E2=80=94 I think one of the reasons the device tree was
originally adopted was to avoid things like that). I would be fine
with the array solution but I don't know about the validation checker
and whether people care about reusing the same prop name with
different types. (FWIW, in the device tree a 32-bit integer is
basically a 1-element array anyway, so we might just say it's always
an array and for SCMI only one element is allowed.)
