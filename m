Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410F396B84
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620833; cv=none; b=ZTgw1gA30YgB/sauEUwxM0Y6eJ4ouYaE86D71Tcw9XoC/BRYmXjEi6cCntxslAp5bk3rboauKU4aIA52VTg/zrI+nFUZYtBOBgITfoyJ4pGSIItbN3HiU0pEbpP8GEmcEu0MNUDfRpROQls3tf47WnrF2G7CAaDz2Auvos+udN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620833; c=relaxed/simple;
	bh=ZIcxZ7eL4XyxAXZn0ewJ3naPeY8Pds8upTB6kp+qZ0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKP/9nvVnKw2CR95XCRSZxE6QcUQXPu8lJJq2VGlvg6svn25R/+PNDSliGGsB9YaIeCeJjmg0ZFWC9r2gH2+PVpiuAKpPNXkmV/d+xQGvLgfYkV/vpiMeLy/uBWQHAnDa9pW5EMaUscDKMMFo9Uk1opMIFJ1dyuNYSaGeZDZi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RGuZ+VmH; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RGuZ+VmH"
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-4877837890fso596216fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620830; x=1791225630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6naFbd9ghpOLf3vMz13o/tinkdhPrtPS5TCAi4OBxWI=;
        b=mQWkmc6jdl+ULd+9nOEN6rcVoKNNocZdhhsNasLNLYiqQwqKwBI6daj/nw9GIMnHef
         8Jzpg56cW0S7C6lRtFnP1Nk8VWmdLMI90wdWQsZlIvuAcUxbtgn9IfV40iB1RtkWvvPy
         HmBsEYqYOX1esWEaWSuTss6I2zYjmoC13/wJ41nlwIJW3+cglqqIIIywGXkkR61DxnJm
         iugf+PcXPWCxQ9CyXDOwHfhEufCyIEFukuc5Eju9t9+B4wboAMBpFtwoxP7F1GX+YXtO
         36yKvn4cQyNiH13wqGJw7B2ygd44S4crtzwBMIzLLc6qPuBpswWp0VCxsP3I+Q/SLXZW
         hcKw==
X-Forwarded-Encrypted: i=1; AKwUvByvkYq4OnL5Vig/wrTjVKW/hxaokgrTEy08EAik7Zo6O+kdBLmTvhf0QUEVHXjAe1AlbfucfUzfQlrrUME=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8kYRcwr7qS0ZQUsTZ1/1vAl3MxIRre5j3k8tLHXFPOE1bwG9Y
	hAiey6xHMMJJiEyV8BNVcOySehmRlt6vAOE8OECjjlt+GI08uGEdPyoFIzJnw4Ive8UKohRfxto
	pf0SeX9aC/j3AmEeQibxuzFz7g7RbpyxqZCH0nnRTRGIutpuWpPp+/lVGdco07EEyPuw3km6IeP
	ndiH/GfmvQHNyVBmMFqqvfhz9Y78k3u10YigtGzrnlaZNMXQuHc+ngMcUfIacS6F6XL+zPozwQe
	2ZpaCKpcE2IIIpk
X-Gm-Gg: AYBFou2JNvvt0qfLKx7QZRmC5Pkm+3Y6wjwpiR15n5B7ds9riJ7bEicbAfA3Ecfl9oW
	282Zkb6HATqd/XN7e/UvXWIthPz12cCi6q9qSjpbK25AX2A/X4RWJqjm4jdYwMO8mwv9noLNmPv
	LUu5vg2HPgMgZ/Cq65KiYPc4Z+AniCtHHTdbMk1pC0SaasxQiEXveKYvg3muN0TLUZnXhfdaMMp
	eQzV8y9Y0uPPCt7R/2ZI1MAytuPE1DdtFDH2dyNPCvHgJs7oZhyMTWpuMmR9JgijWJ/qF0sE6pK
	yLt14okJSzGJlgZepck3xxFnEf9galPuePyhKAcDa+CQkMapcz0SGjnHQWAdR4CvFGh7ZMlnUeF
	NCRK7VwjGMsTvbzWHs7ceO3y4LTcuifHV91ZRM8Z6hRo8LRN/6k5q+2xf/KpQ8VbTnC9rdM28+0
	xI2EP9AKpr/Q8VzNOg85voTrZMqZKrm6on
X-Received: by 2002:a05:6870:90cf:b0:48f:e0e5:a1e8 with SMTP id 586e51a60fabf-491eb86a6d0mr12508303fac.45.1790620829733;
        Mon, 28 Sep 2026 11:40:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4997d2a6720sm9845fac.9.2026.09.28.11.40.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:40:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3a5b062d0dbso1705281fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790620827; x=1791225627; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6naFbd9ghpOLf3vMz13o/tinkdhPrtPS5TCAi4OBxWI=;
        b=RGuZ+VmHPbKJYNItHXedx1irtD7H0gB7rjR4QUyhbv1hc6v5ZwPpmmWRhQ7Eraee1U
         SReI4eAYbw5k0QwekU2nydU+iusTn0jTzT0rMHvOH+LHdrh5bD6x7Iq0+nSyl0uaCos2
         a2GdElgw9hnX8fofwvnWNXxxqSmkMWblsddhI=
X-Forwarded-Encrypted: i=1; AKwUvBw1Ofj/vUIsyRT5RVbzkoSeFzzP4zMxvMu0CjBZtjLQBC5bz8EZYItwDSc0TZEQvyFpT6hhsRyvdPmod0U=@vger.kernel.org
X-Received: by 2002:a05:651c:18c6:b0:3a6:5fab:f4c8 with SMTP id 38308e7fff4ca-3a76479b9fcmr534741fa.21.1790620826589;
        Mon, 28 Sep 2026 11:40:26 -0700 (PDT)
X-Received: by 2002:a05:651c:18c6:b0:3a6:5fab:f4c8 with SMTP id
 38308e7fff4ca-3a76479b9fcmr534701fa.21.1790620826067; Mon, 28 Sep 2026
 11:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790014793.git.zack.rusin@broadcom.com> <9ef573cdbbf5e659eea16fa23afeaf2488049198.1790014793.git.zack.rusin@broadcom.com>
 <20260928180829.3A3461F000FF@smtp.kernel.org>
In-Reply-To: <20260928180829.3A3461F000FF@smtp.kernel.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 28 Sep 2026 14:40:12 -0400
X-Gm-Features: AclHuK9rgQQeHz19PVz8BmJKDUJ1fDkrmkQ8Mwi1v0UIsBqIb-VqjZZNOA_FQDw
Message-ID: <CABQX2QNHSjP+FFppUR1ohthwvCjWNA2ozOuZtnwwdNu7WGaV0g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] crash: Notify pre-kdump callbacks before switching kernels
To: sashiko-reviews@lists.linux.dev
Cc: Petr Mladek <pmladek@suse.com>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Kees Cook <kees@kernel.org>, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Ian Forbes <ian.forbes@broadcom.com>, Borislav Petkov <bp@alien8.de>, 
	Joel Granados <joel.granados@kernel.org>, 
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Bo Gan <bo.gan@broadcom.com>, virtualization@lists.linux.dev, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Maaz Mombasawala <maaz.mombasawala@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Eugenio Perez <eperezma@redhat.com>, kexec@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005264ac065c8f6648"

--0000000000005264ac065c8f6648
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] panic: Pre-kdump callbacks always receive NULL message in defa=
ult config

fwiw, this report seems invalid to me.

> commit 8884313d127ae4b9734baebea7b4ba8dd25b38a5
> Author: Zack Rusin <zack.rusin@broadcom.com>
>
> crash: Notify pre-kdump callbacks before switching kernels
>
> Fatal x86 oopses can call crash_kexec() without reaching panic(). Run the
> pre-kdump chain from __crash_kexec() as well, after finding a loaded imag=
e
> under the kexec lock and capturing the original registers.
>
> Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
>
> >     the shared guard skips callbacks already invoked by panic().
>
> [Severity: Medium]
> Is this statement accurate?
>
> During a standard panic-triggered kdump with crash_kexec_post_notifiers=
=3D0
> (the default configuration), vpanic() calls __crash_kexec(NULL) before it
> formats the panic message and calls its own explicit
> panic_notify_pre_kdump(buf).
>
> Because __crash_kexec(NULL) runs first, won't the new
> panic_notify_pre_kdump(NULL) call consume the once-per-boot atomic guard,
> rather than being skipped by it?

Yes, and that's intended. By default the crash-core call runs first
and the late call in vpanic() is skipped. With
crash_kexec_post_notifiers=3D1 the order is reversed. vpanic() runs the
list with buf, and the crash-core call is skipped. The changelog
sentence only describes the second case.

> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > index 2b36aa9fade06..5d9fe9e00f39f 100644
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> [ ... ]
> > @@ -139,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
> >                       struct pt_regs fixed_regs;
> >
> >                       crash_setup_regs(&fixed_regs, regs);
> > +                     panic_notify_pre_kdump(NULL);
>
> [Severity: Medium]
> Will this cause pre-kdump notifiers to receive a NULL message pointer ins=
tead
> of the expected panic message?
>
> If a system panic occurs and kexec is configured with the default setting=
 of
> crash_kexec_post_notifiers=3D0, vpanic() triggers __crash_kexec(NULL) bef=
ore
> reaching its own explicit panic_notify_pre_kdump(buf):
>
> kernel/panic.c:vpanic() {
>     ...
>     if (!_crash_kexec_post_notifiers)
>         __crash_kexec(NULL);
>     ...
>     panic_notify_pre_kdump(buf);
> }
>
> When this happens, __crash_kexec() will invoke panic_notify_pre_kdump() w=
ith
> a NULL message pointer. This permanently consumes the once-per-boot guard=
,
> and any callback relying on the documented msg parameter will experience
> data loss or potential NULL dereferences, violating the API contract that
> promises the panic message during a panic.

afaict Sashiko gets tripped up here by the doc from the previous
email. Nothing in this series dereferences the msg. The only callback
is the VMware logger in patch 4, which ignores the argument. It reads
the printk buffer, where vpanic() has already written the panic line.

If there's an interest in fixing this false-positive in code for
Sashiko (or if there are other issues that would make me respin v3)
I'd just change the doc added in the first change in this series like
this:
- * @msg: Panic message, or NULL for direct crash-kexec entry
+ * @msg: Optional panic message; callbacks must tolerate NULL
which, I think, would fix Sashiko here.

z

--0000000000005264ac065c8f6648
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIPhI
gaXowkjjU9UqGixDN9KfNAZpSsFV1cvMkPQZAQKnMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkyODE4NDAyN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAE2fXP6+i9snr0KeYAmumbv7tf6GzCpwG80Ov0Jp
X4LlWsNF/0+91ppcfLAjweuQOWRObLmMW5yd5EY1OJt3oiyF5TSJzlRQ0iCcZsD74+dhjKZoUWNe
68SDFq8Pi/HyZ4vghLdmJGMCq40tZrwhwt611yaNw5KJ9Qei0CO8hP8xda4O5oC5Sc72v/spxSwD
3dLlKjSBZDvYlP643Z5nY8UqaR9jNh9R8Y9z0tlkZ1nG62c4vE7hovOkA89X91iVwc2kEmv7XUhg
Sf1pEWlBh6bgW9mxcXqu47QD78rP7gHvVWYEEAwnhI7Ei/6ExMYzE9lfFF7kn7GlzSiKDizEM2A=
--0000000000005264ac065c8f6648--
