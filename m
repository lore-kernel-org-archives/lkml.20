Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498D42CAFC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232180; cv=pass; b=CppHg537DUm/FWLfPytQ9knvwxrqiSg8NnV3qf8EZFg9M2XKINo208YaPI5hqqYsfVGzEdStqNKqOE06NUErV50eH3vKSvDpnszq5jmXPiuHiKhxccIBH6/3pRGj4UCB9h2SocOl6knmpgLDCBjxpmZsfsI9iHfbKQzY6sEBfJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232180; c=relaxed/simple;
	bh=HIAZJiHtWz9+gMtzrM8NAa6vkGAgKVgfGJCpQqDbBwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJEHNmnxru2Kfl41xWUABK7zTUDzpLa7XUx3jlH48ro5o9Zblj9A/X54N8BnZ2tGsslGIcmXHCrHWTYvktGHUPGFCaYOlE14kCkKUWkXp8G2i17TiW72AXd9YratOHcRQF9rH6nT9U/Pv4ylihKIitxrqf60/GbtOdgInpwZLEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mH405kOj; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mH405kOj"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52faa58bff5so144781cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788232177; cv=none;
        d=google.com; s=arc-20260327;
        b=iilZ1EMhf/k6V3Yh0fBL7vzS7JI0cGEniaAoyhy0NLn+1YcC+eN8zfIK49q9Y5+TId
         9WMOjaEvZ8QCInsANqBCUKZBZBTmCwvjh3AiuE6syb6s09Z2Gme3LIFsXSCxWyPP2L5R
         ixRrUyDn/7ooRzAsA7nNiVC+NkZCB3eWi4P25BYe++Ra72AFi04//8yKPorl1/dZs9ge
         oyZ9NGsszKmWKfajX7uDwYlVfHmxj1YpmsxVHlkwPHtxeR9M4Qf+inUKlnOXbFb+vrA/
         qq/0tmusOZyW7M434KT3+ReG4Iu9WpnLGv7YRwd/AhOyw1LYz/AHFoAs1PjG61O4OQDf
         BMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9vK9K2uO+ydqxGT6ll2fvxAZEy1YLj18ZKGE/a2jP08=;
        fh=+M7TxIaNgJWzElIhy2ALtc6RTkcWKtkOHMO3qgAyYBY=;
        b=eMZ1zJfFAIRzhbp5ElLKIPm+OFOrORurfbC3iYKKAdMmoCdc1U04b7T589N8LXBAlA
         MLvFhM/f/HFp+WMmI8M05DB/s/musllhSigaGNNjFBMQAbOcADkiFTnrbvgS0INZBYh2
         DOeqRiwsbwYoS748n5FW5DAMNBwOCeeIfL1YgBya1XMSxUEll/7mI/R49I3Syy45+8TY
         6bV49dMI5QDcGF3P1bZzIQbe3bECW5h5KmPXuuo/rPY2i/CG+QYbXcPYChQ0sk6uuH4D
         eUzE7x9v9lS0wZIoBhuLcjqtK399/yU6ffz+nH1nzAunQ6w9Q2yhl/edyigSJZOcwJMS
         0O8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788232177; x=1788836977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9vK9K2uO+ydqxGT6ll2fvxAZEy1YLj18ZKGE/a2jP08=;
        b=mH405kOjdL0gM1r8biyQcm643qo4ohVqvRmJQLKeVhkYw2ai/SuIXQD6Vsl3v5lIwp
         LpRWBS1PZkVj7WntC2KZTOdOKlR2zW074eKD7CzaXeG+/XThuFV8pQ0Z53aO6b7nlQvO
         QNPWzGzDXLgEbu3eClLjmAzhGvCPi0zlG89ANIRKpFEMndLrhbTNy8nrgFJTUocP+XOp
         3+GaQbGWx1s/lmMAmhayzlleJnQ2vfvPmvdnHIj6t2Pn7BkcMS1XnBmNkNO1wdoX5xuw
         U7aHfB0DWmy3Ppc1ELfSt18dLmsFbJDBcSKxRDA5QY7+Bjepq7RSdnqhsI4dcIgzmU+R
         lI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788232177; x=1788836977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vK9K2uO+ydqxGT6ll2fvxAZEy1YLj18ZKGE/a2jP08=;
        b=WabIzR6jdokl6l0ykXK8N4CYj8YMLjYL5PDemTpnrhWGdSjRrhWiCGUPS1Zq1H7Z68
         PzwDDv1GJRikrAvOh1JpvcE6m0cuewcoqIsTRfjE0eEwFjHt5+ONEwj6o+4UlsuP5A64
         boyYwMCPAPbAGnRYDXytIfM6Y9Q+Iq5sgumuK7+fc3CBnhmzk5A7Je/w3PK/XWWPwDQW
         qyNOkntCFzxDqEJR8zzLYVNI+0KQjqNJYa5dwrg3KtlqbA70hMXaln3a1o8c2XDSVUln
         Mg7KXvGKtpI5iKXxk8iCO+2Ms0pwDNPwRLD+GWIlExHbsjkacPKsDgCTeOLor1yDqUpk
         Uv2A==
X-Forwarded-Encrypted: i=1; AHgh+RpFyNB/xi7aw9aWZNj/DehK45szUT5wsHg2cAtT8qrOWwHg+Lmj1jPCKllaOB6wUYoDNBzJy2yScgmUEjU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqWG5w9K7eKi2F/YzeMHS8q+Rh4PwuB28bzDFGlqxhP9DbksQ+
	Ea/y+WVmKd+A3m57XSqHLZkmb5KeiZehXex43VDzcVQDOv1jl5ekEl+j9+sshWJYFxlYIYg4EL5
	nJwBiPs/VviYXhB0CtcGzz/c8Jp5J5nyiR8VuNcYr
X-Gm-Gg: AR+sD13MyRZIqThkRYFoHgjtety84eL3CmP7HjtAeutGVvsP2wvSSv5g/Du2wfPng22
	s3yw+C90r6C3iRoSJuTNYwCb8BBlAqQpI2xsL8DyLj6DJGZe83HhBUC6OcDzex0C7cVqTiRWlgY
	e6tbveMhPLokdxFPRWFobqZ/7gd3GeEfusunL3xdTDrMS7lNt8ZxhcgNf4N1pQVLkAIXG2xuX5o
	JeSM3J0Gazr0ubAJ/SsR8DGoo8Z9bbtWEgXn4/OtW37NAoFV6sDxpqf+veQaOSmFZ4OGep92CVs
	WCsRWZHD5NmQKe6UmKosSKcSV+W6842R6g7oPaE9TVA=
X-Received: by 2002:a05:622a:11c6:b0:519:b655:235 with SMTP id
 d75a77b69052e-530274757acmr5868131cf.3.1788232176425; Mon, 31 Aug 2026
 20:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816161216.984580-1-avagin@google.com> <20260829180205.16dc4d5ed20150b79533f3c2@linux-foundation.org>
In-Reply-To: <20260829180205.16dc4d5ed20150b79533f3c2@linux-foundation.org>
From: Andrei Vagin <avagin@google.com>
Date: Mon, 31 Aug 2026 20:09:25 -0700
X-Gm-Features: AcwNN1Wh2sszCICdjIl_gd4o3uM6FwIu7k2r-iSFzyxyJ-uR0ZAHOEk8WlZuwtw
Message-ID: <CAEWA0a5ysb2LVovme7BSdoZQq8ZMZaSsXJALc8bZyD1Rgzuc3A@mail.gmail.com>
Subject: Re: [PATCH] proc: Report SIGEV_NONE in /proc/pid/timers if target
 task has died
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 6:02=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sun, 16 Aug 2026 16:12:15 +0000 Andrei Vagin <avagin@google.com> wrote=
:
>
> > When a posix timer is created targeting a specific thread (using
> > SIGEV_SIGNAL | SIGEV_THREAD_ID), it takes a reference to the target
> > struct pid in timer->it_pid. If the target thread subsequently
> > terminates, its numeric tid is freed and can be recycled for an
> > unrelated task. However, the timer holds its reference to the original
> > struct pid.
> >
> > show_timer() in /proc/[pid]/timers previously called pid_nr_ns()
> > directly on timer->it_pid without checking whether any task remained
> > attached to that struct pid. As a result:
> > 1. It reported the stale tid, which could mistakenly refer to a recycle=
d
> >    pid.
> > 2. In the kernel, expired signals for dead target threads are dropped b=
y
> >    posixtimer_send_sigqueue() because posixtimer_get_target() returns
> >    NULL, so the timer functionally acts as SIGEV_NONE.
> > 3. Checkpoint/restore tools (CRIU) parsing /proc/[pid]/timers would try
> >    to restore a timer with SIGEV_SIGNAL | SIGEV_THREAD_ID targeting a
> >    non-existent or unrelated thread.
>
> This sounds like a somewhat significant issue for CRIU but that's just
> me wildly guessing.
>
> > Check pid_has_task(timer->it_pid, timer->it_pid_type) in show_timer().
> > If the target task has died, override notify to SIGEV_NONE and report
> > PID 0 (e.g., 'notify: none/pid.0').
>
> No Fixes: and no cc:stable?  Maybe my guess was wrong?

I was not sure this "qualifies" as a regression, as this behavior has
existed since /proc/[pid]/timers was introduced more than 10 years ago.

In CRIU, we already have a workaround checking whether the process has a
thread with the specified TID. The only edge case this workaround cannot
handle is if the original thread dies and a new thread is later created
reusing that same recycled TID. This is a reason why this kernel change
is required.

The proper "fixes" tag is:
Fixes: 57b8015e07a7 ("posix-timers: Show sigevent info in proc file")

Thanks,
Andrei
