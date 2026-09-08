Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C852959C976
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891314; cv=pass; b=AlJQIBGXb8oH5ryXlLY02I77G68P9NJbZuhssAdyWtd2wBzAtmSJFcRzuFQcCxT1nAfrNUbYHxmLQlShRS3FOvNU43H5D7ScP4MC2j2KgM6imn8QfueE5U3FTNOqu88XhON+QEO+mWxP6DdqSLXLWSIFBpzTZGzExITbklFbT0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891314; c=relaxed/simple;
	bh=I1JWkwexAdECXk7Ri9fH4s02sP9GMsE/7YOTlpBK2Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2b57KwdBM4K62ia7n9N6ILnkIb+a0iJTUdo/G8GB5FQGmOfVaXTL8LmuV/u5MtRaX3m4oVaCvCQ0wG4wKEnG+FgvlRRzj78bM3fLK1h2cjUCQ56QSS89XnxGoXzHb0etFHx4MtUzu/O3wRf3NvLe52UBTiqGQpb6qOBI59vEhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSvEsi04; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSvEsi04"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cbff85fa9so56849306d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788891311; cv=none;
        d=google.com; s=arc-20260327;
        b=BZn3nQluAYbQ6DAAIfKtHz/RkGQLG0n7gmIhrQXjKarRQKm6UFPMIFqWW1t5boEw9a
         pPSbvTfSigBIwCewISA+9W4RmCqofTOn4B//C2YuqIJuKgoyp1f2AzfZX1HnAwwp0lht
         /4JB4Q1Vy1GJ7O/vX/09tUNA5IBWHjs9DNUKeD1F2VOOd6C8cnpya33LoZmzprm8PBTp
         Pl/o15RJpqNYsx4eDh+v1raiWfjvtutjTWat7VOISxHAk8E7oe6y/x8x9mZaYu/Nm6xb
         A0QcH19LkzG5onJwN8zNMQ2b+ry2Zx3Y8+qgLHOwObdcY3qGb+Vgu5gaQXKxTjFz5Ooc
         0Qtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MP3apYl6WaB7KiBrxFylQ3CL+F1Ox3GURYmefi8a5u4=;
        fh=AklA9GtLxqTsqTPyCw5FugqXR3wF8EVQr5agOkUzreU=;
        b=abHW76HtgVWQoBGCnWgFVGdq7uacnA6K1QFHwjKSr/8hgWYAQoTKXYqyH2wFX9yh/X
         HLybmnaVGvr2Ye/tCVBa846s/CijL/26nKmiio8o515S0uzh786wnSWv/h7WcVmgrdBi
         U5rexmq0Io3ZpDRLNwL8HrvcH3HtcOWL1OcN02QOpY8szdcgPjoUKR28MJglwezrvMK/
         QqaaBPpwqRmQFkDWsZXnvZJEUrgEP+GwBQOd1LJHzKIcvrDfea3oks/LCU8I8x8fOevn
         qBbyi3EyuYNf2CQpTr5/3kzlNZtnveUgQOvaCFFVbYjcP7IpXAO2IECpg4UZCACXVXwy
         f3ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788891311; x=1789496111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MP3apYl6WaB7KiBrxFylQ3CL+F1Ox3GURYmefi8a5u4=;
        b=PSvEsi044/VNrr+XO80eXovPHgKTD4gk4DP0jsH5y066JJbWAbjYw/ytoLwzIAgwzn
         +WjzQjjQlimRn6hvbI/9BnueMc6LTpiC4I6ScDju9Ytji4d8N4TgXZJnXRXTAETG3Def
         oLwLSC8lL29A4EqBtaNs2akAoS0H26mP8VU03BPDvP0Bmvd1bIO3AMjzrar/XfntgzBl
         ynU4cPXcqer8s56en5zhmhc2Fusw1dXYiw7TcpHaF7IgocQTdMz3LUpvwsVlLefqofmC
         6AEGk+kk54oSF3JiD4KN6ZoVWucF1NKrJGPRie/qGusYuisSdcXJ1ekqBKwAQqc0kfFn
         pAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891311; x=1789496111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MP3apYl6WaB7KiBrxFylQ3CL+F1Ox3GURYmefi8a5u4=;
        b=rhqNtUnrvvwV0X+7BIrXFgUPvOdsdxROmb2sh7Y1vmsC2m95Ag4HvcdSJPP8TXib5f
         a2rWs7wIPzF7q7X7igstJVABvLt2SM+I2XIfUYnZMzBXSQyQeX8GiUEWBjEnHjCBEMXp
         7/jiLj7DwE4lg+crf24KkDLWibIE0W/f2AhFWOypyGcdqTVgycT2y6vd/UYIjCM3J6Ec
         b2ErpyD6UpSLuPpVUn6qsrC+1dqSazdiN3U2KpQJrQKg6TXCqN8K7dH8ZNagqrvuhJv+
         5VQxPjJOMio/RELpPBayJegLIzySl7fufpUpogouVPFOMMQM89qZ6I5W+1FzZZYcRqnA
         Hiiw==
X-Forwarded-Encrypted: i=1; AKwUvBzE31PssR0QuGayyKgyjSg/vzN/C3TWtOOt6JFzdFPdqpsktJqAACGPj49Qo72OqKSPKranY4G62LHjBMg=@vger.kernel.org
X-Gm-Message-State: AFuF++lNbZ01YFyXyw3k5rF/icT5NgK3ljJa8ix/oHB7f2jN08tg5b+h
	zRhswHaxfYSoHUfaML6SppxhyuMv2xef+OjY6M/BQnvJvzVZjdPV32hgvpZEbC8DYMxgSgOK0wn
	vf7WzNP9FQTsqXIdPxGuohP8x5cIWIdS550QI
X-Gm-Gg: AYBFou3nWyFZL51MRsmDv7MEttSK9koalINWq7ZRp8crMHiRISdCX0uOC/XlrfYsSAO
	hfr7YBbmd+D1vIoL5iPDhnFzj6996jIcpvOYx8Sz2GKQcsT0QqEVLdnA50wYlcPyxntrxm0hNu/
	mT6HXgFs6uKgUJxn7rf0GoAOyViadKj6dyfxow+19CQEgsBa8T/oEqwt0KEIL0nZ0KWiP7S+4i5
	mJD9Dl9SzC3A24DacQI7LgefQH8bxyJ/3n7fOqRz2TgXa/ucedKl5QRHe8AgS9ehNBMaDJJmyhZ
	9AqO6eNIgyZYHGpKiWOez+Bv4LlwGLgFQbBPx9hMwq3X5MJv/u9S6/4=
X-Received: by 2002:a05:6214:6354:b0:90e:8a84:f5b8 with SMTP id
 6a1803df08f44-9103efac50fmr274978446d6.28.1788891311145; Tue, 08 Sep 2026
 11:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANRwn3RFVDy+y-fpLkb1mfjiKyQgp1Jg0tyBTO+G0xem2s1jkQ@mail.gmail.com>
 <20260904020235.8227-1-98lawweijie@gmail.com>
In-Reply-To: <20260904020235.8227-1-98lawweijie@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Tue, 8 Sep 2026 11:14:59 -0700
X-Gm-Features: AcwNN1UywzU7cqy163imiuwCDI-OJo3UKdSrETVCLN-wYAoD9DpBSTsnKrDgB1Y
Message-ID: <CANRwn3RqPvR7g3riuKSg11TCm+Yt9MTd6r0tF4tqSK3rcRp_gA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
To: Wei Jie LAW <98lawweijie@gmail.com>
Cc: bentiss@kernel.org, jason.gerecke@wacom.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ping.cheng@wacom.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 7:02=E2=80=AFPM Wei Jie LAW <98lawweijie@gmail.com> =
wrote:
>
>
> On Thu, Sep 3, 2026 at 3:36 PM Jason Gerecke <killertofu@gmail.com> wrote=
:
> >
> > I'm still finding the above paragraph kinda hard to understand. What
> > do you think of something like the following instead?
>
> Your version is definitely easier to understand. I'm good with it!
>
> > Other than the above language issue:
> > Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com
>
> Thanks. Should I submit a v4 patch with your "Reviewed-by" and the
> updated language, or is leaving it as-is (here) just fine?
>
> Regards,
> Wei Jie

I suspect Benjamin would prefer a v4 with my Reviewed-by attached so
that he doesn't have to make the edits himself.

Thanks for your work on this!

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
