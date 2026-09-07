Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1195468C09
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776654; cv=pass; b=ej07jx0xQFtA4Itct2KlgZtw9JeFF8jcK6McbxrX3oFPJO8rU1rO6JzdKm1v48Ulhjl3kYMgU3Cq94CsX5kJZmth63qyaoH4d1bxG7JUlf+6lwSwrzBUSf+VyHqrgM3CvyLXZVEqJ3lt0c6vWdlhdNWBPWx42k3FlLOMEAWgeWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776654; c=relaxed/simple;
	bh=h/kK0qgc3s1x1TQMI8jdSnMsN0cifMF6ehU9jP5s5Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAvmDQMCS2yI9+geUhbERBFYPhbcaLgG1xn/ATUmXD5+yA3jQWugeoblbXEE9k3JkQOJJczu2X0xwUQuNvpYRUg5jQW2yJkLLSTKN7C1cUBU+ULVdSdNOiDCUmS4bcXQ/M27cq+OLuRKzCbWCRbOcp5vwpefk+tcBWszFvq7iYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wgr03dRc; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wgr03dRc"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b523efb0bfso1995901e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776650; cv=none;
        d=google.com; s=arc-20260327;
        b=jFQls4HkKctQ81C0eTSYqDMiNSzus29jtgWCMZgTZvSMMfQbzVq+l1rcW5+zPLHkfC
         ovC+5cLH1kd2vXVmX6cerlkVGxymM/JWnD3264iO5pberIUXdaVFIbFcIaH17uz/Sihv
         YwgXQq5+0HGufBj3cHYPYQF2Jj/TIRr5eV8MQWo5tK7u5P/k9XwguVwGQpMX/oxTk9rf
         v1dq6m+T4xVFs5jBSWuV4amNiwOz5sLuI7+fJg+zglnmNfYNYsWgwCX5rj6U8n6K8KWY
         8z8aiwhHBarua+hg1HA7KoM3TCKbUH4wBGISsXICF1fOx787BF8jZXBCB/TBtqarmh10
         YowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sze87sDIvAPUcCAz3NKWqlz/aBkj79Wm0YpeNvsJ+BU=;
        fh=UKWG6yt/n+K0ZbHieH7t9i7fAWn00HyH4DP3CwThHUE=;
        b=k1LJWEp5Z3GxatS1BkVC0BILCAb42kTAb5+tUvvFyxrMn65DUoe054SaE3d47LHftr
         EVmiHVh/RkZH08wz+NfS7xyA4nSApd14OcRcjr9vxIJreZ3WpJwIHRsj9GpfImGdbsxH
         qE6Yf7ZUsjIo2qN76sOmOkD1m7i5kb89oK3/XuHQOsFznnoDI9WoVrIbz7pRdOzQbN2t
         ipRH/m/uyNg6Jc6ot57CqiT1hmAu5x8LAcfIccN++UltyDp5oekbdRJXAwYEJlxGTHfn
         +DnY9MIY4AGIv5qC0En3gXstHYlA9YAYaOAfdnZPHrbirJIGzDbdXW4vRthvVmh4U5Xx
         T8CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776650; x=1789381450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sze87sDIvAPUcCAz3NKWqlz/aBkj79Wm0YpeNvsJ+BU=;
        b=Wgr03dRcOSIBMO/sLdJQl/nJrsMIGnH67SaaVAfPca/7ZU7/8/RHqil7B/lTwDlN1f
         MZGGpGcxo1RbE+yAWILAwtt6ZI0FRZiUblL6qY7/PPTUJLE817FBSPQhnxV/sH7Qggkw
         tPKXn0+84//AF7Ljl0+4X9/8Kvk1tWEEuh54u7HVnVa2WYDk6pnj/p04TddlZNMDh35I
         4UWMlAWe1Tq5hmn5fem/TNXltRoqRoaSxpOLf15Zyc0F2dhkX+x2dBTVhppS7YwSoXZl
         cGonFPp4pnBAZ3/aC1EwtbkimnweLeg048pORJLLUpPmU4GQED2A02Lu2gDLGGqG85IV
         OVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776650; x=1789381450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sze87sDIvAPUcCAz3NKWqlz/aBkj79Wm0YpeNvsJ+BU=;
        b=UqEj7sbjUnpjO1B9blEt4syR4454VAP5HXrMA0183WSxlSNL7HBsqN+ddANwayBYvD
         U2QBW8fwu2DxAZzprbcYUFz/QT3lvI27nXViCKj9I3mRc5wFfZCQ3Fzuy222gyOP8lVs
         Hg5hUCERhal5Q/seEFlyBOwsqbicdI34A4oSYEbtrv8vmp/y2H1FAduH7AcXz4sdOW+h
         JH89E0M3WCa7afPn87UGrz9zqV4xyCFGDNcQhg33HdWHljSAhmDvl4oBSFa2WXmmERj9
         Aih+C5PC0nXOdrUaFxlUycWA6PhKJ5l26JdnFUw5vWaZ7N/tK5PypoBzscMrB8ju/dr/
         onwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcktsNai2+H9oQLjKJLq7fvpFf+CYw0/Bo/iirswLa4cmHasUhWaMrVJYF06+DbIpgHW4tMLhPHwZbyL0=@vger.kernel.org
X-Gm-Message-State: AFuF++mJKO9UXsKPIHTolmHJaOK6n+EeYurZ+UygSO01vDiYNJbZrurn
	4HCAfINhcwVRUEciADkIRtL1F7SgPzDPmeO+Xdpkxunx9yqKgu5mKzpI5i6EEVLLU9Gc9GxSFKF
	a0Ksqd/2gfXtU0ShAGjKrqvh6SbTRtHUJZwE=
X-Gm-Gg: AYBFou1LLVZuitFTrV/33MUt26rd6vPyFqOis+z7k5qTdk8OpN5xmsZuJmElDyDMSvY
	7ET+bgjRjSgDTok0zD6FAnoDd0fqollItgVWlmusdoIQ3VKM0ulujRNA7QYuVbDzXj0HK1Kxb8+
	m2Hi3Y2w9sMA93O1wTIxIDsnx+70MqIA79lQBOR7kSvrRO+tPVARqxJu7M1XFdCH982s+ukRrsH
	IsEJ5+tOR7tGHbdXdSGgrnZ9HJoghQLQmEDY/zVMW1G//wBZIejrsbOlaChITxu45LaKA9qpnug
	1oLG0pluBi1QaLLqOlEfPCoAA2rKWVXQnAA4F1nzAu0wcfluFfmyCeWmFhKenimcb9bNL9SoJER
	sEVtNgdZecw6nxyNk8zEwV92ciXzbHY9f
X-Received: by 2002:a05:6512:3da3:b0:5b6:424:2b07 with SMTP id
 2adb3069b0e04-5b616f544damr5671815e87.32.1788776649388; Mon, 07 Sep 2026
 03:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724044854.33274-1-kr494167@gmail.com> <ap6IbbFqQsBvVSm9@monoceros>
In-Reply-To: <ap6IbbFqQsBvVSm9@monoceros>
From: Surendra Singh <kr494167@gmail.com>
Date: Mon, 7 Sep 2026 15:53:58 +0530
X-Gm-Features: AcwNN1VZPpr0mAZsujEXg1kHRGcC9qS8uQ3m7ACzH5KEHhyJBpaqpcIVWIJYEmw
Message-ID: <CANA_=K2DuzL4h37KTEh15BAtANk_c8tc6h9DqNnJu0e649b4Jg@mail.gmail.com>
Subject: Re: [PATCH] pwm: ipq: prevent potential 32-bit integer overflow in
 hi_div calculation
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: george.moussalem@outlook.com, quic_devipriy@quicinc.com, 
	andersson@kernel.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

Thanks for applying the patch!

I noticed this during code review while comparing how effective_div
was calculated vs hi_div in ipq_pwm_get_state().

It can trigger easily on hardware whenever long periods or low clock
frequencies are configured. Specifically, when (hi_dur * (pre_div +
1)) exceeds UINT_MAX (0xffffffff), 32-bit multiplication overflows
before assignment to the 64-bit hi_div variable, resulting in an
incorrect/truncated duty_cycle being reported via pwm_get_state() to
userspace.

Sending it for 7.2 / current cycle as a bug fix would be great.

Thanks,
Surendra Singh Chouhan

On Mon, 7 Sept 2026 at 15:21, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> w=
rote:
>
> Hello,
>
> On Fri, Jul 24, 2026 at 10:18:54AM +0530, kr494167@gmail.com wrote:
> > From: Surendra Singh Chouhan <kr494167@gmail.com>
> >
> > In ipq_pwm_get_state(), hi_div was calculated as:
> >   hi_div =3D hi_dur * (pre_div + 1);
> >
> > hi_dur and (pre_div + 1) are both unsigned int (32-bit) values.
> > Evaluating their multiplication using 32-bit arithmetic before assignin=
g to
> > the 64-bit u64 hi_div variable can overflow 32-bit unsigned math.
> >
> > While effective_div explicitly uses (u64)(pwm_div + 1) * (pre_div + 1) =
to
> > prevent overflow, hi_div was missing the (u64) cast.
> >
> > Fix this by casting hi_dur to (u64) before multiplication, matching the
> > precision used for effective_div.
> >
> > Fixes: c436e3e9c265 ("pwm: Driver for qualcomm ipq6018 pwm block")
> > Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
>
> Applied to
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fo=
r-next
>
> . Did you find this issue by code review or does it trigger easily? If
> the latter you might be able to convince me to send this patch to Linus
> before 7.3.
>
> Best regards
> Uwe
