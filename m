Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2826A360EF5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802549; cv=pass; b=TgDj7czyXB4BBa2DiKQsk2tA4PzHABbhu0d/cJtRAoEpAJIWFWFDnp513HPCElH419y3zRdsXThP/QKDbFewqH8TuZMsSXNUSLtV4RAtfH/9VYCimXmPCJEddn0wZ2R9EE5JBtAWouWCN6OhHNSnlhKlfP3CW+wmSqWozNWZGGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802549; c=relaxed/simple;
	bh=l1EXipAKmMkC4QwXJ8OoHPfFNSosRCN5cyKya011Gw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ymla2l9/4KmcUQvWUs5C/uZYkrtQOpnfQUN5AZ0T6EndDsIiko6+v9fMVdtxjhjx+ClIaSnL2RlTaIWn7z2jqP4RymHD3qZRMDf4KFd66rir2tpdQi5iObDTLNRzGqEhrHVkijbW7i9HOp+5rY90/zGgCGqE4q2H7B65Ymht+X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYX9L2CP; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYX9L2CP"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35834f72d94so2930609eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802547; cv=none;
        d=google.com; s=arc-20260327;
        b=Vt7Uj2UP1xchCL/lYBHPdPTxPd/5Tv9x3LVMSaQxeUWgUGRQGX8NETDJ0vpaLx7ie/
         Xl3mpof71JGSI4LB0e4PCb/6DS1J+M5uZdeo1ZscRi1T9X3g7gBE5g8ST80eF3cjDIUm
         NNf0Hlz26v7g10VLxAjhYKvpz3zfmw+3yq/tGVGPUKSpe7lyWoAEJ3DVv9yZgQE18Wyj
         wZfGzo0xWH4o4E4oDm7XYRka4tns8vEPtsxhx8/I/H20FxXEjvgdQbUIlXDVsADTHrhm
         W7iAfpcvEwr3J1KuE4OXAdmj+7FC8UEa4ot1CvgyMeutNVp6neqT4QRU1HJ0wwOP+0mq
         uamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        fh=ShyICoVGLgIGR3ylZ0llfIQwdFeepaYCgtjkLZGrd08=;
        b=SGT7AKYAWLEONRf9uxCOMWLNyUYjC8Z2FnUb6LXwcmliRurgmuJQu1UAeE0EbC15Gu
         yvd25BTi6BzvtVsPAqFbOZm1c2zQMvCDgYyRvorstXEjeUP4QuspzJE51yNx7fYUs3kC
         Dum5PiYX6w7TWTTbKiUIZ/LA5cVjQN8cIj24L8EmeoZ0UcZ8J4Wvxm7ztWKuFg2yGv7r
         u/yLwJKfJy4ve7QzTbMUn3TZNmj2XVtm6jG17c6bl/P8E3Jgy6uhadgEKebLermbEZjq
         B+xVLALqWqC7OlguLT8yvqnz8sf49cn4sabQ2yMc62TFR+9P6hweg8ysx6URDCwQ/K1V
         6VUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791802547; x=1792407347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        b=JYX9L2CPwELErdnA2VR9OlUD1AcDPj2aoEDCkMXfTAvCz18j2lgC+sjlHvnXOeTyYL
         zf552/7Z58k6fEPTryNlTjpIYM8WOAbYmmVvWWn5euNzQvNq1cwZo6FbMfRiDPuQMUa3
         IOjeecMdHuouzpxIGddmb8WRfAoCIDw/G4U6Az9rpODAqW6fghbK4sQoib3WtX5Swuau
         xlMr0jESpTTtVDhr7B/oltKVA48Jsz35qtF+GLUJ8oNTmW/W0UXr3vKvxfRnXSx8rADp
         qukLI+YZWa+OP/8RKPgfMUcDtWxBAa6V4OlgmJ0IXmkBzwAdm07jZ+LPIjV5fVewlivK
         372g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802547; x=1792407347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        b=1KmcrkHapd59PrNTMU7ruh69+VbIJkriLUWzGHQFzLaH6P9PRhAtUhQbf0vqv9c8jJ
         NwZnV+iNBgVMOqJxE3qgalMLwPGp+4EUJallyDWMeeQLpwOPMW8QqBf5uSGqOEECqEfY
         Pso6/lAFCnNx4CmWRez5Hbs1BWlaU0hOoqQt9stfwxUrwyUODrEmfLXyCJ8xrfmG8yVa
         zeX052qw3sw0WlMVUcpRMD08sGx1HxFBtwDIGGJ6k5yP15YFY5UnPQGiiRbvMlSZxp2J
         OYbxxg6NjPulkc+zF5SVT1mHCDfEAPO2wlbr6M10aVMkwhNkoTaqYWHAemBXBDT34afU
         3pWQ==
X-Forwarded-Encrypted: i=1; AKwUvByxR0ynjRAKHm8dZErMVOzLEEBpdxPyGksLSW2DAAXSaNFiSNrSuZ9Twkfrj1SN0e6K4vg+rNbGFDgFtZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrRz2vH6JFqr3aIAuIa0RTsWVGIzicJSG9QAvkezQgrrkOvAHN
	8JG3YRoWyKYiCoLVE5ttssFdFQ+MqUejmH5HJT5AChnP/rrBfQDqSuuMMFrkRXZhobxX0OBVdGR
	Co+Fj+sluSJQjIkTUXIC7oycMHTptugE=
X-Gm-Gg: AYBFou1kIOA+WpzFN2WIenPkuZrYgkCXdDRGH39MqeIfFjbLdAbB0ydh+W+mQLZWyww
	wKXOEPn1ZKtZYwFAzHinlQ1+Z4pzapRPbLBfZTR+G7RDczmgBIXwo556vSKnjEpGEGL81B/ZRjg
	XQjuJyJ24kFtU8MytPCio2R0dfg3O41b/JRsjHgGLR4o0c3W3wmSz0IiqDVN3FegSFUAxWdDIO+
	d4s9WXm7DbfISm/7lA6+ugM1hyI6mZ0LdWlO/X25Vsc6e8LfVCYqvFF/LqhTlbz8MRzMuwyLWF4
	KTQHRqoVCD9F7KhR2wAWi0ZvDRGJnhfUNxx2W4EsRplN/HzdvGi+Q6iPwMdtc4eP4p6TXWf9xGN
	qTanXJmWKZBSFwG4bwR61Ew9N
X-Received: by 2002:a05:693c:820e:b0:351:5b99:5f35 with SMTP id
 5a478bee46e88-3537df50ea8mr13679930eec.6.1791802547178; Mon, 12 Oct 2026
 03:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com>
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 13:55:33 +0300
X-Gm-Features: AclHuK9-WY5HBOzJjdXhPqCGEm0X08eS8KVRxjYfB0CV_-KCl6-E-4-979CzLCw
Message-ID: <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:45=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add nodes for recently supported device (ALS, LED controllers, haptics)
> along with minor tweaks and fixups.
>
> ---
> Changes in v2:
> - added USB configuration update commit
> - added p895 power LED trigger update commit
> ---
>
> Svyatoslav Ryhel (9):
>   ARM: tegra: lg-x3: Adjust WiFi node
>   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
>   ARM: tegra: lg-x3: Lower supported suspend mode
>   ARM: tegra: lg-x3: Add light sensor node
>   ARM: tegra: lg-x3: Add flash LEDs controller node
>   ARM: tegra: lg-x3: Add haptic engine node
>   ARM: tegra: lg-x3: Add backlight LED controller node
>   ARM: tegra: lg-x3: Update USB configuration
>   ARM: tegra: p895: Update power LED trigger
>
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
>  3 files changed, 127 insertions(+), 10 deletions(-)
>
> --
> 2.53.0
>

Hello Thierry!
May you please pick this patch set if you are ok with it?
Thank you!
