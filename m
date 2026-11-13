Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794550339;
	b=t3psckJkwVCX1VQWMKGkADslbRjb/yfN4fa7qbDaK7wrxIzu8ZQgqmk+jiXTKA/rXCCc
	 +NGJ9jaEjc4JqZEeiBnME5lLly3O3mpiWBIgIcrlaBnteczkGgyV5xxD/vii3SVL6Nukl
	 5OgAhBuk+kRq6LwcK+KAJYs/HYOhOjLUWqAqZRRVm7Cn2TKwMnO1HKKjZm1fVDiiR0OSn
	 BbvADOoxZPE47ycCeYg721DxMXvSn6j+6I5z1JRvkSmxbgaA5Uhk7og64YUbrOqwrXAQw
	 qaweE5vLTr5fFBVqEKZRPEiI8FSQ2uZHTjm8zOkttYSe68fBbaCe5pV+qV9JdotaMmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=;
	b=OS1TQ/6TIMGQLW+BeDmwvRSSjnDka9TllPChdjx6UtkOO4xFbzoDWpgx0u0a8iJE/eKS
	 jOhQnCmuotMK1hzLpgy70nMrbd/92cphNlVmciZdesUEU+8Cj+mCkMgPbz1OLWbuXDdsX
	 OWX5NGnWEHT5a6+918NKkDSvj3dC/Rct39bDT9kBNvoIht+q4GM+4OsGlgExmblTNjUij
	 2xhd8Z3vCeDHmjWx/+Up5oN+H0q7xbza3svAFfmrpB+MnsVGWLaYRF3o410Z2Hd9e37Og
	 9RXU7pcC2ooy/mCOhF1GVH2Sv/jsBzY/m89PfVzNv8+CPCOpCNkdMhWTtxveL4XF7Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/0eFjpv";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/0eFjpv
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365d725440so9919281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794550338; cv=none;
        d=google.com; s=arc-20260327;
        b=m1beRI5UIrq1D+xTT8VabL/Grm+P0uHtWk6WA9LsyFiVK9aRkKa0DPyXuovVb2OH1E
         ddAFpjRLVfeP0ckqMGKx47ZusWknezzo0wERZOq+kO1xAWqygM5UMsTRqH2EatbDJvs2
         4uSBduIIZpkp/h0zfX6kc2SpfU/8bQgU0+6E2gOatRh5oUPEHGh27KXPEiJcL9iBifkq
         j2Iu82BvSR7eksjxkM3YMsWuUIKHFRaeW5zfe+ba5wGnIbA0S1zGuOmEGYtQpCY5cPuX
         tq2FMrh9R+pQQSrNt5wCQzEFDV1BjSCzu2SjhgirtTz0yI1kUGnkVddlJmJRGX3I1zIU
         m6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=;
        fh=Gfe1bcLT5zenkEaOr58AK6d/CIlzDBg1ThIji4UQ49Y=;
        b=cxH/X7xivbx+dqkpFgxu9qPUQ1LyJNKFe68bGd6SRP9UfOFLcACjNEyHZ+NUfZhiTd
         QP/ujweczN5ep7ouOOVY2yt2iMUH6dupoEgwPfVGI3+nlSytvQMvpUwQldSam/bBqSYL
         V8GcCdAmXrUMGqsJfiYw50OXFYcOQ6ONeJpIsENKCn3FlUDR0b7FpQGWYCQStrHNrlEd
         Njyha9IBW/LdoVbX+dTzp1Nl5Mpq/7KwWglQPlA3J4z5X7hXJcUA0hIhOjJoksNdfOPL
         XT6SjN9vHBzOAr95QEPbiwElFXoyJT3yCXwhQMMhaoC3zTgcVforkFURwt+6nU6A62FB
         ME4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794550338; x=1795155138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=;
        b=K/0eFjpvzXRSCb2fpPDOu+bop1EryR1QDD6CFRfcHjjvXvNaImzDm4ccf4bbCLuJcz
         MihCQ2X0ovfL/OwDMjc6hOAHxZwnjN4shUIlADoEINN++alojAZmVG7sUBKi432CsJvX
         HO6MJwbdVzA8TfKzh9tTWES7zHdre47xug8SgpfQ1+Bp06/SK3CKZ5w6OVPOZxUP5BnO
         LtwomroZYTbzGohnPpRd9z7avb+4YRqP6Tw/gu8Cqb6u4HfRqQJVskqqZ301aABS1ANf
         JZdDm83iIiSCv87druGLHzoLt6w+OeONzwrP2si/6XXaaGDdYEOvNCk5e7tkGByswr5x
         pn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550338; x=1795155138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wix08yJ27yJSgUGKEpKBIXQFAmhik0Hn4X6nmBhrer0=;
        b=oSNk5JnDvNJGy7k2q3zb18zYVaAc7DXFrLhwGwevWlyFFc3F/dVjrIR1NQnNJzM8l7
         GPlLrlre/YjrcLN6SilInwsedU9d886IuBk+KL3KqBpDG+p1Xu1NAX4QlOtkbi9B+Ijp
         rzc5E/KhV/LxxSO6+2XCHbo3mmfJ0pVHWQoi+H2f0ilX5A+HlEaoJcMM2q5aoqshB2yc
         so+6yu+rJ3chGfyqtU23zzREfzXrOxY4iRmNZ2MJtHQUATpxsBGTHPOajpzBDWbr58V4
         qYgKO3LpfexJrYvliViJD+j4jAPQu7VSARIR877+JporenFqal2GxDOdF9xV1LaDAdpU
         +MeA==
X-Forwarded-Encrypted: i=1; AL+hErGfE3cj47zuQEU5xR0DssT7kGQr0UnNXExjMLEtYdjqGQDm4BaGs2jmvhOuvlmYF/cmV7B1dyWNU3V/8cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SRCt75XVAgQHHGN4G9T2iaTu1PHNI+LRIceGA3SVJRiMhoMKZ
	k2/2NYNo0R//dhacMV5B1THSIaLatUEH6UWCUzH3dO+d20MdyoPSDj9dRMRBWp+arwfYyYywmUH
	9kQweqnhsfFHphkcDXElO8KOseayoDbn0DmLlmhlYYQ==
X-Gm-Gg: AYBFou1gIz9nSSK0s9Oug1/i5ZsVrrpYOMMLwo/o398LNAcqCMK1ghi26eSkHUHQ5y8
	fN7Xhmd3qcCqfJRJodhKLy9OCi3W8ZqdOqkfE5Yb0fo5u5GfE6Tx7t3HvfSvGT36zDQoppaacJb
	DRNX9/xi9uxPI6S6mXxq33uJ98f1XrEzsrujr8mJkjEZ6CyGm5tT5OUaCOW0RQ45EdY4oEmO2Ov
	jwHiBi5QnxADh92EIzRNNLsa0rqsSOgyQf6Dk1sZs1F+3+BNKMUwQ3bi5Oj1crKLGiOM0VjeTr7
	A+PxXrFB3YeYRdSZUyYPLCKz79pr5ijtA6KESnPHsBrvUQQ1oITMRJg6uQKmx6VhmvF5YvDPEDn
	e7BmvPe+K80t7c1VcViikZEho0Xb+IsPOjTRpELataVL93ESDCg5O7Wead/Fvr+7ro4Zs
X-Received: by 2002:a05:622a:1813:b0:536:43ea:f876 with SMTP id
 d75a77b69052e-55ac4391cd0mr29866681cf.5.1794550337807; Thu, 12 Nov 2026
 22:12:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
 <20261112-vt8500-timer-updates-v6-4-fd1cea645d1f@gmail.com> <468e51cb-5852-4c8a-938d-bda2aca8c83e@roeck-us.net>
In-Reply-To: <468e51cb-5852-4c8a-938d-bda2aca8c83e@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 10:12:06 +0400
X-Gm-Features: AclHuK_xoF4t3_XsXjyB9Y-lmiPCHjRTiY27rZQBkq_kf73XFRERFEk1oNbXQx4
Message-ID: <CABjd4Yz_GNpXoUa5YTRJLvy6bLWDP+Qtc4Oges=mX4pjC-fBdg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] watchdog: vt8500: Add a restart handler
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 4:44=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/12/26 10:55, Alexey Charkov wrote:
> > Reset the SoC through the watchdog when the machine's own restart hook
> > leaves it running: the PMSR write in vt8500_restart() has no effect on
> > WM8950, so a reboot there ends in "Reboot failed -- System halted"
> > unless a watchdog armed from userspace happens to fire.
> >
> > Arm the match a millisecond ahead of the current count, which leaves
> > ample margin for the register writes to land.
> >
> > Register at priority 128, the default for restart handlers and also the
> > priority of the ARM machine restart hook. That hook is registered first=
,
> > from setup_arch(), and handlers of equal priority run in registration
> > order, so this one runs right after it and only matters where the hook
> > fails to reset the SoC.
>
> This isn't really the idea of restart handlers. The sequence should be we=
ll
> defined. That is what the priorities are for. Why not give it a slightly
> lower priority ?

My thinking was along the lines of "I don't care who of you guys does
the job, as long as it's done". But now that you've pointed it out, a
watchdog reset is probably more rude than some other method, and also
requires waiting for the timer to expire, so I'll probably switch it
to 0 to make the "safety net" connotation explicit.

> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >   drivers/watchdog/vt8500-wdt.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wd=
t.c
> > index e0f838fd1d50..0ce1e2b06410 100644
> > --- a/drivers/watchdog/vt8500-wdt.c
> > +++ b/drivers/watchdog/vt8500-wdt.c
> > @@ -25,6 +25,9 @@
> >
> >   #define VT8500_WDT_DEFAULT_TIMEOUT  30      /* seconds */
> >
> > +/* How far ahead of the current count to arm the match for a restart *=
/
> > +#define VT8500_WDT_RESTART_TICKS     (VT8500_TIMER_HZ / 1000)        /=
* 1 ms */
> > +
> >   static bool nowayout =3D WATCHDOG_NOWAYOUT;
> >   module_param(nowayout, bool, 0);
> >   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (=
default=3D"
> > @@ -75,9 +78,18 @@ static int vt8500_watchdog_stop(struct watchdog_devi=
ce *wdd)
> >       return 0;
> >   }
> >
> > +static int vt8500_watchdog_restart(struct watchdog_device *wdd,
> > +                                unsigned long action, void *data)
> > +{
> > +     struct vt8500_wdt_info *info =3D watchdog_get_drvdata(wdd);
> > +
> > +     return vt8500_watchdog_arm(info, VT8500_WDT_RESTART_TICKS);
>
> This sets a 1-ms timer and doesn't wait for it to fire, so the next
> restart handler (if it exists) will be called. That seems odd,
> and may introduce unexpected behavior. Is this intentional ? If so,
> it should be explained.

Not intentional, thanks for pointing it out. I'll add a wait in the
next version.

Thank you for the review!

Best regards,
Alexey
