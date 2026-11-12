Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474028;
	b=ia7PHps21wakxZScSPu2JBvi6rQeMPbtlZPEayUUTXnlP21vz0QO14f3e99pdSQ2YmZF
	 sijcr9p3rukVjxfTHmzkuK5WX3x8HtfNDCV3jsGvfxQrTYdirVyDW2Y2w760OeN3RFH4w
	 gYqda/SOD27T2vIUzCP1f/n7W+8NEPWTGT9piMHAOKWBkThtQJ9MI2FL8MgTh6+yrlk6T
	 L/6LOodify35zbO63FahL6p/Jr68var6+YPfFZh3LfXOS4P2I2b5TLd5PfXoulXJmqAEg
	 lXfveUtmhun/wKdIhRPTxMEd4V/2f/ZJXTgbA3f90yv3oulrS5vXDJHgGTsG7Joja2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MDCejDW8VBxWNNPFAIfF39q0jltnN04sCRzvotswVSc=;
	b=KhC26RMQlknju2jb0wWhoF/wh91t1qwCEnIxFwGIgJ2W93eUSAgzV+V8f/VqViut5JV5
	 2S+jupHwVjeseyNDKrWeO0YoN8ofF0oJ4pK/vhXeSAdiPmoLU7S811dmWDCSJ2PMdMtiA
	 tV/VIeoGCx2xyjlHDXOBgDWlf3jfs81lg175ybnu9Wz31xTuknyOOfaUhsM7jnpyhUvXd
	 rX8cePeDoZjXE7R2TCcN2wi++smT6u021t3/2/UsSiiT6Hx5zrJWyh7fYY3CzBDl5+J1a
	 uOVxEjgIRUL6h7HdxAsV+80XLK7FyGMZhkOoykjFPAoMeTe86n0D3RbZ23KZ56Cy1xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkxPwo4U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4947606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4947606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkxPwo4U
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab30d04674so2120571fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:00:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474026; cv=none;
        d=google.com; s=arc-20260327;
        b=RgrC10q+GCjm7jIVhk86jC7nqivwvhIlVAuOetIaeySeuqLx+lS4CiaKf4RIT+Xcdp
         9SQFKLn5P+Le4td7ID+/HBFqfccApyioIderQFt5BgeGNfiEYHz7gKaw0TMpYJtm/asu
         6tHcZ+YR7fWDH4/ve+gi0jmoi8Kz4CheuD2Sq/TnaBl0ZICdpHHLBJd1iiXRPTvMwrWb
         yhMEUPAyDJ1qoN9bhVOv78xTt9tdwlZ+Q7RHuwrL6rbxPojApT7MqoM7WkiHc1DOA+C0
         5vRHfBJzqzjkdlcq+3Tzz+VZB5fxv8pu3/1DRU8/M+ZYUe07ZZd1DWL22LUphzGQrr5G
         2eNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MDCejDW8VBxWNNPFAIfF39q0jltnN04sCRzvotswVSc=;
        fh=C9zK0fc644WUVIpprHakTce2Weqdu8nDlw+2OK/roW8=;
        b=nOPcOg+5ybNk8ofNJf5EMXmdVh//VTAynb1LhqnwKvOU1Ffn2CLBemqyC11KbGh/SY
         YPCec6TeheCPpJgSiv+TPtoELmujCG+s0b5txfvdrSqpGDLuXuI3ThKIOuvA7J44iREa
         33ZN93KBK6TF7epj+UViQQzFbxSeruJHqrCs20dP5UX6oYIrDtBwmdrLjFtyqjF1sHUO
         0zy2PcP8Y5XrPTkpO3fLJDR1Weqc2c2cteB3I5OgoMB+SPOT8I6TaurJUZS7yQw8McgN
         gLfS3CCo5g8ybNLCC4T7p+miNb8DxGhpj9LdiFqWQN5mCZqmn5yPDDM5Na9Ws4C+zW6d
         xWaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474026; x=1795078826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDCejDW8VBxWNNPFAIfF39q0jltnN04sCRzvotswVSc=;
        b=AkxPwo4UuvS8Fx3lKXS3acYjGFs3MoZbrWOg9QuGvCP9brgnlVOKm22vtGKmYXzlk/
         ZNkafoCJyRM0UfvHLil42Lvr2GEjep4oX8zR3S22ID5KKsL2bre1R3k1mxmvPj0Dm1Kf
         un/tDjSprT/xwYUWIoh2ThkQ7lQNzu4cgzcNoDs8xJ8UkmUFPmlM8scxu7yjNQ6m6Zsx
         gpoNv75Rla/J8/Ik9NVI3JsAGiROHf93tJp20uA79HJJ7xak01ga7+DWTUhkK+z8212y
         qazeHq81hwYnOk8UGeKY5C63lHfdxAvC/YpiAYDsAuHWPx8sqkBS70/b+KXaqTSSWahN
         JLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474026; x=1795078826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDCejDW8VBxWNNPFAIfF39q0jltnN04sCRzvotswVSc=;
        b=woE/2QgjkDM5LuQhTO1TBpPd0zh6CEnM0g4FCRJ1tVjK6xFdx/ZgYhTMfBdeNnfg/P
         Ph7ZxB/3k7R0JFy9LeH5abXbp+80jHhJtaiUL4yEFapG/MtU/BAgkoSM7izvJdfZBH5N
         umqVjn/+SLsW1UtJ/G7j32GDDZMTIfZNnZ/Hpnsztw0ZEqasHvbqFopTSMsGvpdnDspu
         ckQ38dL4px6HgWlVleEhBy7tBsBRB5L7w6Vpvc7un05wW20nOkwxF95cYEad4FT/ab2B
         q7bh5kNnJQ59qL3lsKflUAbjuo/5COar8q1wLUsTDLG/e4xmVWJZ767P+C9hJHMwvnGX
         AB+w==
X-Forwarded-Encrypted: i=1; AL+hErGM1IATWtk10hoFZ3lBvgW7vkZBUsqlp0kCFh1DIFHj+kCMaZDk8NreoNTDgBPuChiIxCXc4z2G8q35X8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z906sL8pIvp09HOIafeN/1ANeDf34xYUZqbLuf/3FPU8PlEwlcW
	h5cIu0ZqPupKQlcVlqYUD4MF2v7jXN3SmZTVKRFiulB3LX9VO+sm29FQoLb1T1nWFROLI2bEgCQ
	wyW/iC1h20GgQNojV+LAAXBrTl3V1Vc4=
X-Gm-Gg: AYBFou3+bZTxn5owOb3AZ4J6IGx79oSfC72eFr0JDNQlE13ZPFsM1KPNuSUeXDjzIZY
	MbNkgW4lUKTXoG8lMncbdqMWC9GUlg6bdCBImoal0NwN54rQcyELDgnnGOURuzKqfGLKS+8Y5oj
	MqUkWsUOnOw5MH5QhWISdTHwXveqXnkVXayjfjNrpc0uU1R/ffjFKD0kDwCWajAf+Qb8JAVajuc
	+s6mNlUawkQEmuO0Igpmv9/3LXSMaryK8kNAGBXzkJnZYQKNJoxx9+L7vS1TCV3RacflevTqkUL
	SO7LMi2bV5v+u42hFPQsZMY4HWiNwgUzL5snAbGiszXmlqPK5zVl2XVou3r7TzVMtY0bBGTQzKp
	FuG98OZYNH1ejMGTj6aDlFwp7np04KUjBE7aSKo0rcY4y2KbZekgt5JmRnbD1f4fWGNLAa19Vac
	VW1rOfPLm6oeURsG68
X-Received: by 2002:a05:6512:3e01:b0:5c0:b5c:4084 with SMTP id
 2adb3069b0e04-5c15d54dd2bmr1732485e87.1.1794474025804; Thu, 12 Nov 2026
 01:00:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-rtc-minute-alarm-v1-1-be9d7c5227a1@gmail.com> <20261110074853cc5a8882@mail.local>
In-Reply-To: <20261110074853cc5a8882@mail.local>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 01:00:14 -0800
X-Gm-Features: AclHuK9eG45v9F6I7GV15HBzJqSwgKITGyUk_trjz8yzMuRHSrXtJn6NP2-qWxI
Message-ID: <CAEy9hNWaUB2rFwXFP=pmLv_Gj4Umz2CsDpN7ESJimOsVq2RzLg@mail.gmail.com>
Subject: Re: [PATCH] rtc: Don't lose a minute-resolution alarm that rounds
 down into the past
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

> This is the expected behaviour, userspace has to handle the error
> properly: the alarm can't be set, set it for a later time or stop there
> and don't suspend.

OK. One detail: userspace gets no error in this case.
rtc_timer_enqueue() turns the -ETIME from __rtc_set_alarm() into an
immediate expiry and returns 0, so RTC_WKALM_SET and the wakealarm
sysfs file succeed. What userspace gets is an RTC_AF event right away
and a disabled alarm from RTC_WKALM_RD.

I checked that on the HYM8563 without my patch: RTC_WKALM_SET for 15 s
ahead in the current minute returned 0 in 5 of 5 tries. rtcwake only
checks that return value, so "rtcwake -m freeze -s 15" suspended with
no alarm armed and did not wake up.

> Never round up, you are going to miss deadlines.

Understood, please drop the patch. I'll fix rtcwake instead: read the
alarm back after setting it and not suspend when it has already
expired.

Would you also want rtc_set_alarm() to return -ETIME when the rounding
moves an alarm that is still in the future into the past? If the
immediate RTC_AF is the intended signal, I'll leave the kernel as it
is.

Thanks,
Arun

On Mon, Nov 9, 2026 at 11:48=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 10/11/2026 07:13:47+0000, Arun Iyengar via B4 Relay wrote:
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > For an RTC with RTC_FEATURE_ALARM_RES_MINUTE, rtc_set_alarm() rounds th=
e
> > alarm down to the start of its minute, so that it never fires late. Whe=
n
> > the alarm is less than a minute away and in the same minute as the
> > current time, the rounded time is already in the past.
> > rtc_timer_enqueue() then gets -ETIME from __rtc_set_alarm() and expires
> > the timer from the irq work right away, and the hardware alarm is never
> > armed.
>
> This is the expected behaviour, userspace has to handle the error
> properly: the alarm can't be set, set it for a later time or stop there
> and don't suspend.
>
> >
> > That loses every short wake alarm. With a HYM8563, which has minute
> > resolution, "rtcwake -m freeze -s 15" sets an alarm that expires in
> > software before the system suspends, so nothing wakes it: with the
> > alarm set at 17:55:00 for 17:55:17, /proc/driver/rtc reads back
> > "alrm_time: 17:55:00, alarm_IRQ: no", and the system stays in
> > suspend-to-idle until something else wakes it.
> >
> > Round the alarm up to the next minute when rounding down would put an
> > alarm that is still in the future into the past. It then fires at most
> > 59 seconds late instead of never. Alarms that are already in the past,
> > or that round down to a time still in the future, are handled as before=
.
>
> Never round up, you are going to miss deadlines.
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
