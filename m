Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF0541A4F8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502439; cv=pass; b=BGAS6vle1G4uI24gMqg70rV18gZBWx4WIfXtQ4axxHHsGDCZ58AvXfbhnE9GZN41AdJof5OXhvH1w4r3Q9fP+EY+3QyoNacfFuJ79p+3TZLov3ot9bEicQcbJ15bMqThSQtGaYkuFTf4/sAcRQygMIiRMXZsdR/wdvl/vVJ1OLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502439; c=relaxed/simple;
	bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wp3XKMoLxy68dKIo91dNU3tia+iA6e8wC2LjerjOm9Wm7wLtEFXFNLIX/OjS6+L/7fVLSlbr+uGdBKxEbYQdpLiaDiEKrDGu9QUsdKckJ6ihxzZZJL+nL0Eo5vMLJbDm/pzj6ZGqgv7OtiBi5ufl5Cfd1Ap6FV1Rjb7XNyNvBqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jdml6mr3; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jdml6mr3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso880718a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788502436; cv=none;
        d=google.com; s=arc-20260327;
        b=FzTmakv1amujJn0ht+gPZ57ZnH2C8HOcF+vaOhoY+N5ixhBoqxcgkbbA+cHIbKs2Zg
         YulSK58gpVzaYMJix1PHDcLmkdZuvSXecRNZuw6D3hYArt3J6kDC+V2muuKANuP/JDRX
         TptLkosAOFW9L6Ww0Ii7Ki0beaEDuiwqDkajZG+jbRA2cSbmUeSmD0t4sLAfvVcdKGUf
         fSDPprVqa39KD0FXEyNJKdl16PL4Tf2jIWqYr+v4EawA1GjFQnDfu4mnFE9KyhdZ6379
         CZXU0oIK4noRNqn46U5FbnTnd9NNHi3pYSA1g9o1TPL0MduybCyanOfKot+nYy39Igdh
         6ZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
        fh=V8YeQ8vtvZvP5yZufBjoC7dbaa5M0a7VfAp9QRiXDYM=;
        b=ZlIZZZA7QORg4Fps9feFnkP2duZIER/OeMU8OZELUKyM0LtNte1zzd3XJY5cT0xB49
         u8/qqNCE2qgQEEMYtjn3wnI/CfDZBOq8YUu0qepQaTIpMYWibBNmH2CT3KgV/PQj73+b
         EGk8WWo6GAep+UxORKxoVXvd+Qb+q5mBzGSwr0eP0ajc0KGIGIbs/HsL1DOOUucdJ+Xb
         4WRoPsvvm+9arrNNhIbxWhc0qy67hnV1vNospsOsq+TmhctxGPGQA1lF8B+ZTdgTQCrv
         bNv8A86LxS68O/Zw6scwsaT2kV5tQV6vAPdj7PLaGCD92sgRj6l6FpsAws4tcdIDMMv8
         umtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788502436; x=1789107236; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
        b=Jdml6mr3zaJdqdlBLmwY4XR3DyaMt6UVj+RrpvUccUAgAhxLkAJrowYyrxRQFhIoI4
         SFMo9P6pmG/zs5G0i4r06tFu7OzCsJNsjtIovofmLTCa1ETNmq1ySaCoppH9xw7+jRO5
         kpa+4BFPGENcquNHvcWbiFezTJ7t+UPQTVZ8szMSKH5imCpPBYDpGeJ8oC47XpX6Pc2l
         tOm73krqlGnR5/rddSkj8pDV59Ur+mb8k/X5yfB9bOLqjbCYAbPr8LlREHKCQPjWpHwI
         TaGy6n4nCeZ87ZF8OVjnT3VRS2LFuvBDh+W0zWOjb3AHCngRjwHDiGeXMuAzRIRJxfsy
         xEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502436; x=1789107236;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dOgcAQlgO1QoOYmAB+wFP5Ip8y+D8KPjRKJ5U4MjNU=;
        b=n/eFd94yRzuwyOoS0EKLSvjubAGlnv+idilf7yzXCMujj9dMAPwQm/SUNayB8t5r0N
         n1/87LeKRReA5mh39cYCrHwr/Rj/jun0YRpnpUv3hS3w26efeysA3VXbosLmcMjWhAKE
         nhr6JlpEPEEFRiwq2EyfafZTxvME4Eop5GTs2GW52pLkE1UcOOO9lmquGiJ4xzosn7W5
         cZ4OKJ22iwUYPelg+6hRIBmgJT9b7qkXg8jyH8QfKTxKKyE5dTSWeE+MI2PKypV47O0u
         sQKo1gVIYTklLeUBg6avAiHq/43pJEvVaIQ7FtQVra0z/m1JczcoVWf4hUitdBUFw61y
         oS/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHnwL8Fz4927EGbmj687AovW6fihiwoeWh34BZub1bqj1KYxDHK0QM2CfYb7PCxGc1DYjHWf9WzyQI0dY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTLGY/TKgdhaK33k0YPIHwU0BrDYDwwRGsw3+GQ9UVCXihjPsC
	MxvCoex9oQDSS2e2UXB6vhbQARzBNoZxVfF/G58AJVoacMKx/u3vj3kcwXGb2ViwKhuHFiSdI6G
	9h40fkC5lJi5ey5IhC8sVG7mBu/AhMhw=
X-Gm-Gg: AYBFou19CuZB+cOU43977IamdUXj4dvm74sTgPV1fLCGFrexCTJLxEorvCZcNFDS5is
	RNcDqatAwcEDfOGbTGkxE4YkNCScV/1M95S4hOVzzZwYRkqHgJATWtMW3csgQIAzSV/+1iBXDlW
	QO+phYlsdinH8fPkdO9Xqy9Rhb+trmXGSSRYeWvMmlOsQZhgvLjrk9YfWy9Uz9hg61omm03XJ9p
	cJiDF20DmOc+HyDeKZ6AAnMx0J9HwrtUB6UL+kZ2EZ9+r1Gerrv4lZy/i2Vei3duWavk0Onfmy1
	Jqzdty4nSnY0nlhmnudhOISBm45B/ZnuF3TbaNzXdZFTeRtaVBJ6W4eIBzKba+PuINDY6yHri2x
	6XlqrKLnNfTDaV6NO1qX3uEmBHAKKzBE=
X-Received: by 2002:a05:6402:46d0:b0:6a5:f44e:a009 with SMTP id
 4fb4d7f45d1cf-6a7e8d5a9f1mr1690015a12.7.1788502435914; Thu, 03 Sep 2026
 23:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
 <20260803-alpha-fp-exceptions-v1-3-c99d75608e60@gmail.com> <CA+=Fv5QUxT-T0XgXccAF=1_6Dz=nCpY=NQu=ruOrYjbB+q7YCA@mail.gmail.com>
In-Reply-To: <CA+=Fv5QUxT-T0XgXccAF=1_6Dz=nCpY=NQu=ruOrYjbB+q7YCA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 08:13:44 +0200
X-Gm-Features: AcwNN1VrnhEuSNjXaQkRHQ6SzaIw81uvdMaGdmatxDoxs1iIKPoZwAWCS6BhE2g
Message-ID: <CA+=Fv5S_ZrHedEVPR9Oet2Egg2hwy33pEqEXaQa0zGdQdNjWRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] alpha: determine tininess after rounding in the FP emulation
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, dalias@libc.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Adding Michael, Yoshinori, Rich and Adrian directly, although this
is an alpha series, patch 3/3 also touches the shared soft-fp code in
include/math-emu/ (op-common.h, soft-fp.h), which your architectures
build against too (confirmed by grepping arch/{powerpc,sh,sparc} for
includes of those headers; parisc/m68k/mips/x86 have their own
separate math-emu and aren't touched).
The new _FP_TININESS_AFTER_ROUNDING macro defaults to 0, so the
intent is no behavioural change on your side. The new guard it adds
in op-common.h is a regular runtime `if` rather than `#if` though, so
it still gets compiled against your macro instantiations even if it
should dead-code-eliminate at -O.
No action needed if it builds fine for you, just flagging since it's
tagged for stable. Let us know if it causes any problems, or feel
free to ack if you're happy with it.
I've reviewed and tested patch 3/3 on alpha already (Reviewed-by/
Tested-by posted).

Thanks,
Magnus
