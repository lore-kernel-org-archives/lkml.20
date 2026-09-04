Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418A738DC6B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549393; cv=pass; b=WMhJc4ZT8GGhk2egb3QkPrJLycRwWAbGH50TAzYEbZkqWznkesD5KyOqdkJTUOCguuvKfP7YJsr5VHrIUzZC2vUac7n5+lZgyBsJbHBSkMStbrubOmNlgEZoGxmrBqJLfeiSFPbthZwuVHifgpyJavZq5CyrF4zZlSqMFtd/5Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549393; c=relaxed/simple;
	bh=dSLn5HQBim03v9tLWNUdygFPDDMFDP1Cu81FBMYgWlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flymp1p07gPYI5gFX+mNgVA5voVWQhtOQSUuvQDnTvW2nubEjk0yX2xAww8G30ed75Kiau9ia98Oyd8Uaq0yhCzNiJuOCXB0iZXQmPFhZkxGVv8vM9Bd9K5CONX685bjYo9bpPb4Ey/uXRIZq/z6/H6S8+TJdBNoaIghc2gRoq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgvCyWFg; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgvCyWFg"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so2105338a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788549388; cv=none;
        d=google.com; s=arc-20260327;
        b=f9ekf7KZqB+S1m2Sb2xHEcJpkzrLWM2GVtra3jzHnzGxlvJAHxXej2TRf4bVYYRr1d
         5ygmMlfhNvQH6K7ZC1oEa/Z88grNoYd+PFE4qCQyc9J3pYE2O/hYSFrqLDSh43QJpHoW
         Ysw0LlxZwX19d5GB39zx/cbUhDj/ODer2YLryuo1nB5lDXVIi8IK027fPhwMpPtRBWOY
         yKwIVXZFEU456QNblmH3Gujup+bzsxEKGuZXpANfhSAdj+ji0jSfaCSBoDNx/A99FCe5
         dCOAnC+FJvnwq7U+YEpT+Mb8P0NGPeizvMawwpuuJRiH5RGpn/oUqC+a6WO8wThz0rCq
         YxsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZCnu/IOFqlzFGy1VhMJGeYJiUaF7CCozjN+EPzxcJ4o=;
        fh=aXa0p4s0mfL0fhP6FVyp6R7AuTSBOLJg5QcZTPD8QcU=;
        b=HawnVE1ymTKDmWAwijxG02TnecYC0X8dRgtkf7O91ZTsEwOd7G1bKbRqODwn11Xmhs
         miLby0otQdOuN9XNEqAK0dB16dILP0GlRRnCrDWOcAR1fyWPIKULY6KCDMyYNAAQOTbH
         hW9i6GoV6Ai9E7WCR4GDUWhH4x6eLG328N/iRnPtAqgboYGB+HZ0c0j34kYN2DWOSoKL
         QfdM/j2+rHVfGIQR0NSlV/rHYGzP4nOkPBZ7KrKEt4AhoGsHMBDDCrkORUAE2fW9hUA/
         W4ZBW0CovnEfcWkUxrU65gun8uYXSuchPCwTpi70sPuWTt3YcqNQNsQJRrnnkF6V9u1z
         mFrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788549388; x=1789154188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZCnu/IOFqlzFGy1VhMJGeYJiUaF7CCozjN+EPzxcJ4o=;
        b=QgvCyWFgyNmROL83YCJLzqwTBjvqoW08p6BDRXpR1/Wh+6eGxue6Y5JE103P3rkSRU
         421GIpzimmQwBi5YOnGSlZTN5RS9/tORuuHXv6MtyticGdqLCG60C3lvy251jwYOZw3y
         UqhaHIh7rOWlGy+JLPP21QWVRXn3ostiASYswG1LajMle4ZVz1qbD0K1cOLCkA2Nefj8
         qVvItzSOEUhB027EIc+dMpEs4Pu87e/faPwBO1l60Q7UoJ66I3nwoWJB3Eg7pX/qyCFf
         yMYOyYCuFftH6n+ATI+4PzUI0J4Z8F19GdLtU4rPDAf+MBk62zPS5SOIvHxGVw5NJDq1
         QhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549388; x=1789154188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCnu/IOFqlzFGy1VhMJGeYJiUaF7CCozjN+EPzxcJ4o=;
        b=ga/IUldhNJ7q7bHBWdqJj+JVdJ8TrjA8Nxni57sNl8JPpV6w+L4N5z0Gwm0b8jfJw+
         sP/Vl2v4qiO/u9HvqqNZGWrULp6XjC3dhnYSoK+EiXtiFjkgCKtT82a096A71o6nyteh
         /9lGMKCJsTBIgnWPn6ypvXmAy/TzyQoXNlXIsDOgrBsgTq1/Dyi/TWnoKyriZLG0OAh5
         NpSJSkIB+Io/DahIXHC0QHY8P0XY3Snb99zQRLlP6yDM2M/4dlyQMtpywo5r9+YODN5u
         UBP28xTDeUFz/tHP/brElejSQqSQHD32f1wvX+M3HU+3Gbj6wXQxblf8sfAgSt+FIsFB
         6Hgg==
X-Forwarded-Encrypted: i=1; AKwUvBweJbYuA71J6cN6JmM4tlGxdR/aIGLrutO0nWa1U4kdegakJkf+bXCKIjih4QLHRAs/nYlDkTtkh9HaBf0=@vger.kernel.org
X-Gm-Message-State: AFuF++mP954hes+kE+gQ/in/hRxQKe4XGy0f/2qVSr/LVYqo+vkLUu13
	fVEDjVg8ODr+z3Xn2Km+FBht3fLPl/iTqYKTbZtfjM01VotbGPw3RDodGevbEjrj8S2xRE3psW8
	LH+ArTaXwB3/ioayDEWz2IxzBr66lSXIg6UnR
X-Gm-Gg: AYBFou3bI+IjT9DvBeS7dnPB8OPnleYcLdDXhFXPKkh9NIXWDpMxZ0+p4K755GS6HbM
	r0OmRfT1UoG8AX2SKqHsp0A3054vRTydzKLwT63w2ipcjPpU5nfCgW/Mpdkn1CzUazOKo1zX0RD
	KG4qfmRkna/DQgfaLDwkrh89SYDvMbx50buwd7LBCnsK2PO6redrgG7giELrdJLcGBt/KT9EKrt
	q67EVJ/CL/0XiZzyYk4JRj6uOhuVtp7aS7hh6dWV/wUjbojL7tIVGQyCFEOi1j9yB7I3iHk8HfY
	5+qr6mCm7X/w9gPAvaXix25Hk5mIqvs1UI0hPCo/J7eNLxaJQZcGfkNx9CfO9YaK6QUeExur/CB
	aRijWufDrgCT/1gXXjHzjZPJIvMnDpr7DOfEUIxXQqVGM66Y0d9jsRHdVTe9tKIkEW7YRzjTC4Q
	IYHBHr2CKq/sWU0BkDygOAv5Nm3mRC0GH6IM+pGcArSAetTla9lEj1om0=
X-Received: by 2002:a05:6402:3719:b0:6a6:32f5:556f with SMTP id
 4fb4d7f45d1cf-6a7e8e92ad8mr3257058a12.17.1788549387316; Fri, 04 Sep 2026
 12:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815190724.16943-1-rosenp@gmail.com> <12f4b21bb334a49c88bf28428b92589adecfa53a.camel@sipsolutions.net>
In-Reply-To: <12f4b21bb334a49c88bf28428b92589adecfa53a.camel@sipsolutions.net>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Sep 2026 12:16:15 -0700
X-Gm-Features: AcwNN1Uebinon_dT-DPRW-qSB2zh1md1DuwOs37F8oXGrEfMC9-efp4_3gEtAIk
Message-ID: <CAKxU2N9ZPRSotiPhayrQFyzbf=sPcU7X3o6ozRECOibhCj_kbA@mail.gmail.com>
Subject: Re: [PATCHv2 wireless] mac80211: stop tpt LED trigger timer before
 freeing trigger
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, 
	"John W. Linville" <linville@tuxdriver.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:41=E2=80=AFAM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Sat, 2026-08-15 at 12:07 -0700, Rosen Penev wrote:
> > On a hot unplug, the device is torn down
> > through ieee80211_unregister_hw() without ever going through
> > ieee80211_do_stop(), so the timer is never stopped.
>
> I don't buy this.
>
> Also, missed wifi: prefix.
>
> Please don't just feed me LLM garbage. Do you have a crash reported on
> this?
Not formally no. However I am able to reliably panic the kernel. After
this patch I can't.

Some output:

[20004.982362] Call Trace:
[20004.982365]  <IRQ>
[20004.982369]  led_trigger_blink+0x55/0x90
[20004.982375]  ? __pfx_tpt_trig_timer+0x10/0x10 [mac80211
9e1764ff5588e2fa1476cc1f40fb40aa15fcf740]
[20004.982444]  ? __pfx_tpt_trig_timer+0x10/0x10 [mac80211
9e1764ff5588e2fa1476cc1f40fb40aa15fcf740]
[20004.982500]  call_timer_fn+0x2a/0x130
[20004.982505]  __run_timers+0x27c/0x340
[20004.982511]  run_timer_softirq+0x86/0xf0
[20004.982513]  ? irqtime_account_irq+0x30/0xc0
[20004.982519]  handle_softirqs+0xe3/0x2b0
[20004.982523]  ? srso_alias_return_thunk+0x5/0xfbef5
[20004.982528]  __irq_exit_rcu+0xb0/0x100
[20004.982530]  sysvec_apic_timer_interrupt+0x71/0x90
[20004.982535]  </IRQ>
[20004.982536]  <TASK>

I can do so with a USB wifi adapter using the rt2x00 driver but not
the mt76 driver. I kept pointing the LLM at rt2x00 but it always
determined rt2x00 to be fine and the issue being here.
>
> johannes
