Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A4045FFB7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995046; cv=pass; b=SBDCAMZm3w+N5xllV+7GRO6dLGeYAzrxtNUFACezMUHUrg+BtYY4qxVFs/YbWd2HisCAbKfS1MRIHUkebS7gwgNOb/3BxCnPdJTHBtIup8f2R0nPcmNm8r0uGEVNI6zLnaoBdDGTpW+jCc7A2GAhv9d6sgxT2lf7u+gxheaBBS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995046; c=relaxed/simple;
	bh=5+fRqqSG1cq8nqQQKGIiQ2SL34s8o1fvNH8jqcj0ows=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nl2AmskN8aiXuue/jfIyJ86hVKUf/rU+Oy7C0B840j+kiisvdbzE2lo5joAxunK7eb/jA8m9YP3b2YpKRKdhQFj3JOTziTlKxu8FNgQ9NTokn+sWulKvobROP7efca0E9YR09QRIennaZY25aGlw9LhL6tRYAPTKedzySuy0pYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7QMIca1; arc=pass smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7QMIca1"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6cfb1329979so907888eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791995044; cv=none;
        d=google.com; s=arc-20260327;
        b=PLC0Q5xz75S2UevGu8NcFnoJXaBPsVSmFCozGXcTREE9HuAE2zIiUUt7wcCzHzOxx2
         5kNMxV4kgVf0vlwNwH+l/WL1IVHgruYbCs2qPynIsXZxukWNrYF0MtIG2MoV+m7Jg7tM
         BBS++caSqE6pVMcCxD9OYKAfbmcylCmIqS8EE9yIn3YTiO/M0jahjg6iHglka0fYL+3A
         4mxkJieQImNLglBI2QM+jPM7IWxoRuk9afCjX2pemD4iDVFqrCA4MmP8BKaxILfKMnQD
         wJJ7Pg17S/AsjSmSuDeblo/CN3p0JyANmmmOrNS7aSQykbMaCPjxBxz+/nm1vusK03Yd
         O3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5+fRqqSG1cq8nqQQKGIiQ2SL34s8o1fvNH8jqcj0ows=;
        fh=NpSkWkqf2igVtC+ykQSgp1DhZ02rkQGU6XFn9kOVj7E=;
        b=Ql7BbcbHMtBabTmIfW1xysTHlQ8+gsaNzvGieV2XlNy2yl818tBOqCl5n+U35VK7jD
         +pLiXjDPM2uQPMMRfGJgPiljC68IsVmoyyBS3QZMFYB9ECUduPzgBiSJ3qmkSImF6113
         +KH5C9ceVL22IvVmLhFWuiOAyCbAU37JToROYQv6iLTZ1zarLpmyvqzHmFrzCbOuQKw6
         JbHhx8KGUbdu5LOh9sPw7JQMcpBvf2gGcFI135WSkJ/8HmyG/n4lGElxH+3xBTOSuVnx
         HoEu3L3dlK+zR3KxwW3HaOj5Uw9xGM5Kkf7xqtDkzepZcKf9eSEoayPDSxHS7OEcGXQJ
         Exxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995044; x=1792599844; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+fRqqSG1cq8nqQQKGIiQ2SL34s8o1fvNH8jqcj0ows=;
        b=T7QMIca1G7PY9cjd5FtkmIte3yqvB0+mW3dWTAoeY7bUaN9I6NQ+d5zQuKbIXwLgut
         sVNHo4Jqg/2S8lUTUrUwYcrQYVpWOakQTVt1YL6o4drzYDz5PVfNZXGwiCJcO4xy/p1i
         ZcAv7Qc6cjC1KzuNTMHvUBfnx3DAf+P3Em22YEYlXfgKHfji9yOtgW9zGdn2++Tgd1bI
         7+w51mSyY0PCS5Yy1p4M4Le8ppoA2XAK6VrADjo6YDOUp0CT8qYYFwQyGWOrgZo8F2cN
         3Oi1dZl1m3NuAzaLXe4udJvvYyxlMHCMdWbieMiiEX77LtrZq2xR+MrMHKIS34Talm7a
         NCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995044; x=1792599844;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5+fRqqSG1cq8nqQQKGIiQ2SL34s8o1fvNH8jqcj0ows=;
        b=dRLke29rgYBWEaB6v2s6KS1bVhJ7LgxlogBrmJiqB9snfhdsfzRFTER6BP/zpdyfsh
         mf6o0Vh4e8FJEAzaG0i4LN5SL3btaXsEn2aFWRchTg35snrPDlZwBbQXIOmXGzrJAUDk
         4kC8N9ncxOjUHn9CeRPvr+HlSlc1gygc2CvD/FFkzxr9zGkhHfwcKBtyyraFVYRDAfie
         +iRQE84NifvcFt7o9g3uCp0fGBKMOPqWtAw9NiHrqDwh4n4Bx02xMUBQKxee7eY355Rk
         YeFrHfJLMoQmZIS7YRLJAH17JT+RzxMjjZE5L42qnuqSby4PjsTc9S3JX/MzqVxa0fxV
         e+ew==
X-Forwarded-Encrypted: i=1; AKwUvByloLYDGwdQn6fUJj375vdSUaopZ+FzoNwcw8lww5iwPo+WwXxkDt5VIizBjKZp7lekcjJkDpBs8W2FDV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKls2FDvzqiV0MiejuWJ2NDF+XcCcwADnJcRQWq3TMIX10YGEt
	mL/EpS+VWVXDOKr8W/E31CvuXPvLWEpZ9fGiLjEMkiXIM/6BvIslzClt3Yv7J6xV4Z81KQo7asa
	KJtHk6Hwjuzv/JwHRIHv/NQ3/A8WCJ6Q=
X-Gm-Gg: AYBFou31ofttfkBxCN7f2sDcR4I0EaWZX42yPz91xYPRs19MutOvXaou1jA16CH87JT
	Q84ZBtIZzhCm7/trMNV1RegqV4q8FhBnyMJTEyBSilr5+flibENrNKefiV4torDqG0hZso0ZM+M
	ivvy/877FFdifRxynkvFhBjxLyLc0ZuziSVCvXVB5BHfpR6mLs/gwSqktN+w9RcnyXkBfpscSaj
	pH9BsnfDO7uUtNy54TA5xjGOURoPEk673M+muk6v5jKrts8zKic3jyihbVTC6nhFkSSMPEeC0FC
	o8UEXLtGUmujYYTmqn6wiX/c0Rm2VbO1diIN5jkYWbm2snwQYzIc0L5N3cui8PdKYhul28tAY6w
	5PDKLssGKhMzsAwLHLgZcpoiK
X-Received: by 2002:a05:6820:208d:b0:6ba:3635:7ffd with SMTP id
 006d021491bc7-6ef1210af6emr12357369eaf.64.1791995043687; Wed, 14 Oct 2026
 09:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012133728.77780-1-hjf3108@gmail.com> <20261013102305.GA58849@wp.pl>
 <CABOQOSU8KHVUrSc+qkCrpGK9zDBc3dNRqaRWKQ7ka=S6uLLbQA@mail.gmail.com> <20261014083131.GA62404@wp.pl>
In-Reply-To: <20261014083131.GA62404@wp.pl>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 15 Oct 2026 00:23:27 +0800
X-Gm-Features: AclHuK_XrchuzxF7lK_lujwgtTADAD9DglE-B4mjPzQOJpXnCJaeA3LspBR630A
Message-ID: <CABOQOSWNQCxEFo20FJefmk97z_zND4CDogh9xmLPTrU=-xaB0A@mail.gmail.com>
Subject: Re: [RFC PATCH] wifi: rt2x00: use VCO_IC 0x2 for RF3053 on 2.4 GHz
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 16:31, Stanislaw Gruszka <stf_xl@wp.pl> wrote:
> > > > RFC for this since I am not sure if it is a generic fix, since the
> > > > vendor driver also doesn't use VCO_IC=0x2.
>
> I looked at vendor driver it does not set VCO_IC=0x2 when switch
> a channel. However it does it after wake up from suspend:
> https://github.com/ashaffer/rt3573sta/blob/09b80e6290769c53736dc09c5ae9025e15bfbe69/chips/rt3593.c#L194
>
> This function: RT3593ReverseRFSleepModeSetup seams to be partially
> the same what NICInitRT3593RFRegisters does.
>
> Also NICInitRT3593RFRegisters it's different from
> rt2800_init_rfcsr_3593() i.e. it set RF_R02 before GPIO_SWITCH.
>
> Could you check if modifying rt2800_init_rfcsr_3593()
> to be more the same with both NICInitRT3593RFRegistersr and
> RT3593ReverseRFSleepModeSetup (regarding RF_R06 change)
> solve the problem?
It didn't solve the problem.

> > The adapter doesn't work on the lower channels in 2.4GHz,
> > channels 8 and below. This looked like an issue with
> > the PLL or something after debugging.
> >
> > By tuning to channels 1-12 and using the debugfs to dump the
> > RFCSR registers, RFCSR4 is always 0x7f on the failing channels
> > consistently. Since there is code to switch RFCSR6 based on
> > channel, I tried the same as the 5GHz code to switch RFCSR6=0x2
> > for lower channels and it worked on all the channels surprisingly.
> >
> > Due to the behaviour of RFCSR4, I think it is a VCO calibration
> > result since it seems to change after enabling the calibration.
> >
> > I could not find any mention of this issue elsewhere, and suspect
> > either this hardware has very few Linux users or my hardware
> > is special in some way, so I can't guarantee that setting
> > it to 0x2 will work with another device even if it is the
> > same WNDA4100 model and chipset, so some testing would
> > be appreciated.
> I do not have RT3573/RT3593 device by myself and ordinary users
> do not read linux-wireless mailing list, so we have rather little
> chance to get more test coverage here.
>
> Anyways, if init change that would make rt2800_init_rfcsr_3593()
> more like vendor driver do not fix the problem, it's ok to modify
> rt2800_config_channel_rf3053().
>
> If we want to be more safe with the change, we can limit it with
> rt2x00_rt_rev() using 'rev' of your tested device.
My concern is that it is just my specific device being at fault here.
It also seems to have an issue where the TX looks to be much weaker
than normal.
