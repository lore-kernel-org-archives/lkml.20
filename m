Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4F259C80
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772433; cv=none; b=hriHaYhsKw7hCvufCbePLom9Y7bB5H/e4y9zrIid5NjGc2OKM/8eaQd4537sgDNqHzP0+XhRmXSuSpLuywu+W403/K8vJzGHBS/zhfoi9UgyxfKfjg+FyETEFgnOOUehrVgpymxarQ58ExjjW/+NqstEUO5qY4C3IrFOfc4s2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772433; c=relaxed/simple;
	bh=+zptAu7b/bzj0qaETP6oAudL+n8iVII+r75eqyO7Juo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptmRDIzLw0/Gt5Kj5EPahrn0+g/WpL9UvzmrPVPVlKikJoipazIVCinBqdqYu8UPxy3JluZ6ijsTwTpnB+phbMpDGnWWISO5Y8ianCkOMbNHBj3fXdUqBj0n97UiVaw6nXqF3RIQdU0k3IayPYkOsQ0Gqtyy9O3T3plJeFz0Zr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YdpeoYRh; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YdpeoYRh"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7ffa69b7462so321037a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789772431; x=1790377231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ni78//l7WgTQHVZlq1siWvd2Nmf3JPMtFkVCq3/JGuA=;
        b=gm44Aq90yW/tZdJkEDVLmGfVOrFks0YcUBf/BOEzLigsRnZ7iE9uwtWxXBlX4/ymSz
         N6B7kLmyOlfwMhnNu4sZHebVisQxd4/t9yLPGLGRgmd/QO3psrOIGvNX+QCaz4zaX9Mf
         8W7NxZhdME6xR+OtydBk7zKyKYPTO7kLM98rxvQ6Y6t4t7jFu+2UeiVz4tgzdfChbLeX
         G3pLx3a/5NmQOzdTxXN2Q3HjiCB0q9h4KvgChlMk4dlZQUjG/78K01fFtc01KKR56fgP
         nseiwFLjUSuLzPVshanTaFgflxFkpg9pOe0BiItcdqfFhyb0RrslTrgttsdBI6jdDzJF
         tt9w==
X-Forwarded-Encrypted: i=1; AKwUvBwTUJsnjWOYiVW7qnpBSYI7GihHGAVMsjZwInWOtJMh3qitMCx2x6U7w5RVVec0XCyEkjh/VJtjceIKrLs=@vger.kernel.org
X-Gm-Message-State: AFuF++kegojaQb5MU/YzIORTRSDJkxnSwrcVkN9zA7UF9Koz3hSc+AgD
	1Wky9Mc36X4cT73cxJTc28e4Fu6xEHK+F3IYnJ7/LR4281dYlnYUr9Ry+g3gGeHCkq/3wVhD4P1
	lmnReA5GYxB6ymxIs2bnsY98heiul/oCSuOMeesliQ2ZDQ+3qCQWov1mUhcFqVlBIow737xanm5
	y5THUiTWJcvy+yqDuBJ5ICXJGxBfrF0fhkXoyKZTJxCoYCa5cxQJMpLEDFmXRTZu+RxYDAK3SjF
	Dwwbcja3LEDG/8g
X-Gm-Gg: AYBFou0MjGcG2XMiHuoemAm7fCHLkpSCr4wCPWLaJCcLEQxCUTYXCeysQcxLNpj6hlW
	TPkKZZSD2BQDgYQ4IqH4MpiD2c47QbxtrkJOvmmRXvHZ44vtgX7/Q3D3wvVK+y8xNqwozvrIsBO
	b5xQR7clZTdl0V1XWI6mL+e1kVpRu+NWvVrSSpD0kgq2C2t1/lAiBI58WSLDvIoS1yC1vpqOWKn
	BMdLwoB4MaRZRIRV2kbwbmpKr3psuM0CaUka6VhxLcRh/4mYbow07i5pifBXlAcBx5qpkppXeMO
	MTWCLjU5W+ODaKsFfwUuhZw/lDxiwsch7PesCkxGI2KPL220Q+nGqCrLThqgSJLLo5B5nfUFmvt
	SOihMgGPzjelV+jCH9x94Z8BOcr1hhL4rUfRRd0ZxSabSwWjekvQDgDGDbViRiJrv1trdXXmNw9
	qPN6CJh2XgB/zE267o/ExxRV//SMQjVgn1
X-Received: by 2002:a05:6830:440f:b0:7fa:ac4f:790 with SMTP id 46e09a7af769-80de33e99ddmr4059403a34.28.1789772431181;
        Fri, 18 Sep 2026 16:00:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-8107b12c278sm438966a34.1.2026.09.18.16.00.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 16:00:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5b60bfcb6fcso726010e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789772429; x=1790377229; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni78//l7WgTQHVZlq1siWvd2Nmf3JPMtFkVCq3/JGuA=;
        b=YdpeoYRhfXUIPoIPZZHOswpvB6h3PtYsmvTQ8vXSFSKuIaA77AjoQ4IcMNtLp/XD4T
         O7oR3Uj94ej8fGiSs6+k1tFNKIvv7Rct8c6n2+087/N+vOjzhVaM4Lxojoq5AG/CpA70
         GJVEtJTd+amKrX1iUdSC+nJ5qEwr5NpgzqgZA=
X-Forwarded-Encrypted: i=1; AKwUvBwmTLK9au9FOLPz0/lZ6KLUKmsbW+EX555tqDFommEs+kXsY4PqOslclS9jl8GQonU6QV0FzBWajpXj7ok=@vger.kernel.org
X-Received: by 2002:a05:6512:159d:b0:5b6:4ad:77b3 with SMTP id 2adb3069b0e04-5b8c184fdb1mr1253430e87.27.1789772428877;
        Fri, 18 Sep 2026 16:00:28 -0700 (PDT)
X-Received: by 2002:a05:6512:159d:b0:5b6:4ad:77b3 with SMTP id
 2adb3069b0e04-5b8c184fdb1mr1253406e87.27.1789772428354; Fri, 18 Sep 2026
 16:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788414671.git.zack.rusin@broadcom.com> <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
 <aquttpMVKX8e6zGB@pathway.suse.cz> <CABQX2QPJVg-dZB9f4ydRU_5W7nyWwVCQtDoRGoe1+9cA7wyUDw@mail.gmail.com>
 <bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com>
In-Reply-To: <bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 18 Sep 2026 19:00:13 -0400
X-Gm-Features: AcwNN1W9lMhxZ0Ag7iI_GI8G3SXomYGHl4Cl2Mrq5Z0118EogNv41H5NqksNg5M
Message-ID: <CABQX2QMDNHcKotEa_t9Y37L+uHhV-CfqSR2vcRpNT1c2O9C_2Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by default
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Petr Mladek <pmladek@suse.com>, Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	Joel Granados <joel.granados@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>, 
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, Stephen Brennan <stephen.s.brennan@oracle.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e2993c065bc9dd61"

--000000000000e2993c065bc9dd61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:26=E2=80=AFAM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Hi Petr, Zack - thanks for CCing me!
> Some comments below:

Hi, Guilherme.

Thanks for looking at this and for adding Stephen. I'll keep you both copie=
d.

> On 18/09/2026 00:23, Zack Rusin wrote:
> >> [...]
> >> Maybe, we should start with something simple, and introduce
> >> one more panic notifier as a start. It might be called either:
> >>
> >>   + "panic_hypervisor_list" because "crash_kexec_post_notifiers =3D tr=
ue"
> >>     seems to be primary set on hypervisors.
> >>
> >> But I would rather make it more generic and call it
> >>
> >>   + panic_pre_crash_kexec or panic_pre_kdump because there might be
> >>     more notifiers which are either 100% safe and useful or are worth
> >>     the risk before calling crash dump.
> >>
> >> We could put there x86/vmware notifiers as a start. And we could later
> >> move there other important notifiers.
> >>
> >> How does that sound, please?
> >
>
> It's a good idea, IMO. We could start with this, Zach commented some
> implementation details below...and after it gets merged, we could move
> other hypervisors that currently set "crash_kexec_post_notifiers" to
> this list and eventually, unexport this symbol. We should avoid having
> code forcing this parameter, as Petr said, many notifiers are executed
> if that is set.

Agreed. The v2 I'm working on drops VMware's assignment to
crash_kexec_post_notifiers and leaves the existing setting unchanged.

> (I'm CCing Stephen Brennan here, I recall he had problems with this
> being auto-set, we talked about that in the panic notifiers big
> discussions in the past heh)
>
> The only thing I'd like to suggest: I think we should have a parameter
> that disables running this list, which would be the opposite of
> "crash_kexec_post_notifiers".
>
> I would implement it as something like: "postpone_pre_kexec_notifiers"
> or something like that. The parameter would basically "move" this list
> execution to the same time as the current notifiers, gating them to
> "crash_kexec_post_notifiers". This way, we'd allow users to debug kexec
> failures maybe related to the "early" notifiers. WDYT?

I'm happy to add that as a separate patch if Petr agrees. With it set,
the new list would follow ordinary panic-notifier ordering relative to
kdump: it would run before a successful transition only when
crash_kexec_post_notifiers is also set. If panic reaches the late
site, the list would remain eligible to run there. I'd keep that site
after sys_info() and before the kmsg dumpers so the log includes the
additional notifier and panic_print output available at that point.

I've called it panic_pre_kdump_postpone after the list, but I'm fine
with whatever name you and Petr prefer.

> > [...]
> > I think that without that default though, x86 oops_end() can enter
> > crash_kexec(regs) before reaching panic(), for example with
> > panic_on_oops=3D1. To cover that path too, I'd call the chain from
> > __crash_kexec() after the image check and register capture, under the
> > existing kexec lock. A second call in vpanic(), immediately before
> > kmsg_dump_desc(), would cover the fallback path. And I think a
> > set-once guard would prevent duplicate or recursive dispatch.
> >
>
> Regarding this, 2 things:
>
> a) I think you could change kexec_should_crash() to "return 0" also in
> case the new list is set to run, the same is done currently for
> "crash_kexec_post_notifiers". Makes sense?

I'd prefer to leave kexec_should_crash() unchanged. The direct oops
path supplies the exception registers to crash_kexec(regs), while
routing it through panic() would capture later state instead. In my
early v2 tests, the vmcores from the direct-oops path retain the
original fault registers in the crash notes. Some crash callers, for
example uv_nmi_kdump(), also bypass kexec_should_crash(). Calling the
chain from __crash_kexec() after register capture covers those paths
without changing their routing, and the shared once-only guard
prevents duplicate or recursive dispatch.

> b) Well, does this whole panic diag thing you're implementing here aims
> only at x86 guests ? Or would it be possible to run, for example, arm64
> guests? Asking this because in x86 and some other architectures (but not
> arm64[0]), it's possible to override machine_crash_shutdown() handler,
> and run things prior to a kexec. Take a look on how Hyper-V does that on
> arch/x86 - this could be just what you need, except if you plan to have
> it for all architectures heh

I'd like to support arm64 guests in the near future, but I figured
especially for review sake to limit our client in this series to x86.
So I prefer the common chain Petr proposed: as the thread you linked
shows, arm64 deliberately has no such override, and the chain gives
other clients a place to migrate away from forcing
crash_kexec_post_notifiers.

Would keeping the two call sites, with postponement in a separate
patch, work for you and Petr?

z

--000000000000e2993c065bc9dd61
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHOa
+0IiCwwqnpfl7/PL0BKXpAwBhOY+sEXiwrhDo2quMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkxODIzMDAyOVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBACRzkdS8PBtfkVAgw6esLlajTHbCJvKmZJkRVr58
TKwTOIDnizhMQX39ryHLEz+SD1ex6VhUZ3JiKyRUL1SJ7P4UVMLEIJcdr6WKlCjDYvghmJpxYTBS
tEL4YpMckbVF3ueneBELQ6o/FvKAZeB5wDLvfV88Pj4CHC5CbEMnvy9cIO7sugP6SY5OwMSFQwIB
WEHEFaFC8YuqXJokyOP2NTzPjRbUG7DBVMRnZC0BVS+3LSKsM+5Q+lDG2xUjlY0wg/BpHPk2SoSd
FPIpzt8SkrUErXBxGvoOMo9Kp8r9U8yDRO2moS2l0o7zLg7Ent/3yYT1uwTb/xy2hiHK1wAToAE=
--000000000000e2993c065bc9dd61--
