Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3A4B404F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573584; cv=none; b=Y1QL/OdaxbJsoOfW+q0pG+67lJOpiE4s9Jnise+oAqpf7P+rd7ybKTlUEj6KjaO+pEtpYgHNO6etteUsFqg3g4/XabOeJX4SRv0ICprebj47ZB6fuDmXs0g9NLz/Ga2OREo3r/me/3f9obK7YiSjgQp9Xf1qVq/J/pK+YWaxPGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573584; c=relaxed/simple;
	bh=qyb/JgG7jTmjTI+0TtTkSecHpUEe735gt865TUpArto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dy/vV7FMsvDRKbRMBPAyxT3IEVxaSH7qpb/Jp7/t/DjwSkY2VWzu8QsXlnsvmslAA7zjhTHVk3gSsxMn/DYE9HacNOCSrusIBFr9jJs/XOBluDB81NjudO3F8KHqc82M0+b2Y8rooPd/B2wcf3p3CO53ulInruOrCSSCW8XkvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N+JDA2Hw; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N+JDA2Hw"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7f4df360cc9so1921342a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573580; x=1790178380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywuPLGHx4cop8zcpq78iy9WlAZMhM/qcq7SzGt37JLo=;
        b=BRphPSaKn6t73XkoZ+lV2c0tenIj4QKsHt04iUNjvjkir8AuKxnmGvJYjUECWohxo/
         UyRwnRZJTJ+IkCMMbKf98iPSLsnUjBQDI5tI5Tr2bH9L0bRBoY3Z0wv8Kee6LGpt9C2L
         dh+YV2QNeVmKillb6URfKLO2vs3UvGCK/lUGdB5/mdrSEKEmsmHxgy1QLRnVaVZ0jB1X
         kDcLgH/kr7HIS7sjZtwI9oj1x6muglxI42w8qeD9QakJGFZUBCIo7vjkoXdUeKoe1qBl
         iI9l7QCTSExowUNBBwIAYjQzL378SOBKsYFu4uZ1mthfatWjaRPRA3PVlGfJHjlurbqn
         7rPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6qu0tp2Q4PsLuYRsvPLyov70uFKXSQiJZ8QKpXEOdCM0UTaiBEQ9AbcOKWgBxLXBZWpBt/FDd1hoUP+I=@vger.kernel.org
X-Gm-Message-State: AFuF++mHg1L2lxqzCOAKBrwAM+pWJnOIfa4aI7SPMIy23cRU7bCtN5ne
	zFZ1220TH6BU0zrXTHJ2RItIXlfoxCBsct3CRs1QDS3zLP1hkAnLF1oFGrw6vlwaVf+mnxMfxIm
	gK24Df85B/p8cuqw3/V7B71ZQ43sEqHSfqOxo6pc0+dbJsmA6xBX9LMzs0adiaMO9JGv/qCSmql
	Zisuxt6q402nmx2nrCyz3H6gyRZS6TYVl36on9YPEuVKSCatZtksJIBbkNCNeMLZkacf4+SenRP
	ALs4x8VzdS67BL5
X-Gm-Gg: AYBFou0hXn7e9Bvi5ZPnJBb4r4mRRkfRr5gsVIUYkhm2Y6FORzn7MfoHvKZ+6c3Z99L
	fINmrWgfgZ/JWZfEg535JGOw84MLhY/OJYGiWMnw0wdyob8dRSvfMl7tPJGE/wINyEjVS0TmOOb
	j/6IdD0zRCH4V+pEpRnIVL18toRa1gk3nRo6PAwVt1Fhql28MHmxbvH91tvQKmuceKHBmsOMkq8
	DJAdWWCIymK2sDp4LdQr/hJsuc3K6ErD7Zj5cjhtIqHzv28+ySabepE27Rpki/cW9tm2GVSlN8O
	S6SdTTV0KlB6C3rDAKaE4wmVBxK/qEWJI1IlJ5QNAl6EYfXLiN609N6H/xezqUxGIGHXOlwVmmn
	k2YkExvTvk164UYo9PUMl6Eq5qcpMZQhBUjH5liRetecpSl3I2nM9cfIMVt5zkXAzNnt+ba7eVS
	vM88gBJQ1DS4Zrel3wxQk1IcZshXL6jknJ
X-Received: by 2002:a05:6830:84a3:b0:7f4:d6ff:230f with SMTP id 46e09a7af769-80c48be1dc3mr102695a34.0.1789573580321;
        Wed, 16 Sep 2026 08:46:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c43e5d5e1sm62835a34.1.2026.09.16.08.46.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:46:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3a49dccdb24so34073511fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789573578; x=1790178378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywuPLGHx4cop8zcpq78iy9WlAZMhM/qcq7SzGt37JLo=;
        b=N+JDA2HwfwHNGT9FdsZipxIbo13aGUL/DYtsKmbGwyIXKaZZLNj1g6hIlspfUcdj+A
         CphzeY/2dUXiiMhSIJlno2oYm6ltWehqtxdjqiwaTCn+6EQi1wWI/ozk1w5RfdR9Iz3X
         fQD3ethQ1s4vl+WEyYylVkvJ/wvRhZaz9cdjI=
X-Forwarded-Encrypted: i=1; AKwUvBwAqN0BeAktpBAoSBIotITaBwR4uP4xRub/VWnNO8zI8WE5MSp2RS5AKNan8GrF7V1Lleon3ngsrhXGD5M=@vger.kernel.org
X-Received: by 2002:a05:6512:3a96:b0:5b8:9f19:7364 with SMTP id 2adb3069b0e04-5b8b664d7d0mr906752e87.32.1789573578148;
        Wed, 16 Sep 2026 08:46:18 -0700 (PDT)
X-Received: by 2002:a05:6512:3a96:b0:5b8:9f19:7364 with SMTP id
 2adb3069b0e04-5b8b664d7d0mr906738e87.32.1789573577574; Wed, 16 Sep 2026
 08:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788414671.git.zack.rusin@broadcom.com> <03e5c9855e9578b00abf8da69764f1b468597218.1788414671.git.zack.rusin@broadcom.com>
 <4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj> <CABQX2QNc1GP5ZgizK=9+6XN9Ow4dsUKaFD51oGke=OP6hxCyYw@mail.gmail.com>
In-Reply-To: <CABQX2QNc1GP5ZgizK=9+6XN9Ow4dsUKaFD51oGke=OP6hxCyYw@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 16 Sep 2026 11:46:02 -0400
X-Gm-Features: AcwNN1XauT4DI8kJvb2ZsRlgCwi33Fix1zpJ7UXepYXRuYiki9XQ5pm-upBHmuM
Message-ID: <CABQX2QOLRgNwGH4y7Fjshp=rNd=X0FetdY2Mj49TFRq=UiqpKg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] x86/vmware: Add the vmware_record_panic_msg sysctl
To: Joel Granados <joel.granados@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	Petr Mladek <pmladek@suse.com>, Baoquan He <baoquan.he@linux.dev>, 
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
	linux-doc@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000732270065b9b9156"

--000000000000732270065b9b9156
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:44=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> On Thu, Sep 10, 2026 at 4:32=E2=80=AFAM Joel Granados <joel.granados@kern=
el.org> wrote:
> >
> > On Tue, Sep 08, 2026 at 02:07:14PM -0400, Zack Rusin wrote:
> > > Full panic text is useful on ordinary guests. Encrypted guests should
> > > export it only when an administrator opts in. Reporting a crash does =
not
> > > require transferring the log.
> > >
> > > Enable panic recording by default for ordinary VMware guests and disa=
ble
> > > it when guest memory encryption is active. Expose the policy as the
> > > boolean kernel.vmware_record_panic_msg sysctl and document that it
> > > controls only the vmware.log transfer.
> > >
> > > Register the sysctl only after the panic buffer and dumper are ready,=
 and
> > > only when sysctl support is built. A registration failure leaves the
> > > internal default in force.
> > >
> > > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > > ---
> > >  Documentation/admin-guide/sysctl/kernel.rst | 14 +++++++++++++
> > >  arch/x86/kernel/cpu/vmware.c                | 23 +++++++++++++++++++=
++
> > >  2 files changed, 37 insertions(+)
> > >
> > > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentat=
ion/admin-guide/sysctl/kernel.rst
> > > index b6328cd0f43e..4577e935ddcf 100644
> > > --- a/Documentation/admin-guide/sysctl/kernel.rst
> > > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> > > @@ -1690,6 +1690,20 @@ entry will default to 2 instead of 0.
> > >  =3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >
> > > +vmware_record_panic_msg
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +
> > > +Controls whether panic kmsg data is written to the host's ``vmware.l=
og``.
> > > +This setting does not control the separate VMware guest-crash event.
> > > +
> > > +=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +0 Do not write panic kmsg data to ``vmware.log``. This is the
> > > +  default for encrypted guests.
> > > +1 Write panic kmsg data to ``vmware.log``. This is the default for
> > > +  ordinary guests.
> > > +=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This seems like it can be represented in a boolean value. Any reason wh=
y
> > you did not use proc_dobool for your handler? Would it make sense to
> > have vmware_record_panic_msg as a boolean?
>
> Thank you for taking a look! This follows the existing Hyper-V
> implementation of hyperv_record_panic_msg, which uses an int and
> proc_dointvec_minmax with 0/1 bounds. I thought that consistency
> across the codebase was more important even though I agree that bool
> and proc_dobool() would be a better fit.

I've been thinking about it and the more I look at this code the more
I feel like respinning v2 and changing vmware_record_panic_msg to
bool. Because kernel.hyperv.record_panic_msg is already in, I'm
worried that if I'll do someone might object based on the fact that
the same option for hyperv behaves differenty introducing a subtle
inconsistency. Any strong opinions on that before I go ahead and make
that change?

z

--000000000000732270065b9b9156
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIEqB
E+GP3GBha+VExQ8G2Mg5Uh7VVyhEuHjWuSlNiQWpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkxNjE1NDYxOFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAKuTc5XRk9N5KvAo8BSyfA1z2ZRDOQP9D3/YaQ6W
jWaxMEOI0SXsNBAUsw7aOK455W5VxxuEmnk416xb5BVo3VgQWSg0C716sRExYUJU+JyIXtZYXMuw
R16+JfXtq0RYuB2Sw1T5JcJuV2/1pTRxtOCbt2GZbiQq905+5MmlqbIcXHgzuU1f7eKkLuiLUZpd
5WD8OcNVc7efQJh92lZP+FhYIe/0+jMKJOSWFqrYI4iJn0hyrCRZUcHBQlmUwNMDSsfLRP43+hW+
wHnZW5R2XeVaKyvBusBZVoPkXdsamuuY3PaA1Aw7u9eT2tThTI44VaXJt6kFrtES2X6LKmx/XTw=
--000000000000732270065b9b9156--
