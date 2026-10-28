Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191276;
	b=UeYHTnYq3g1heoJzkQE2eZpUrQhA6RCkCQ5ILPSFonDfrTnHCBExkRHMrfJM/VuVXCVB
	 3TlUuHvpvqV7Ha4jup5QhE/eLLu9wpUi9Agq/N9Cau2P/9JEe/+dPSe2q+pB9TOFXVOWM
	 2F+aLKDc3jhMcxqCeATYhpDVRji3t/JPPCZepLjDBtmDq9c9WVH3u218XzrTWDfyzq4oa
	 ndHOmTvNJtniNZFKlBcPh1Bdj7Giyo0MNd4AwkfIAClRgOLFVZb+KFFI24CuKKTkv8nm2
	 blO0QoWVysdOAC4AcrTU366iygWn/Q47ddcvPQP6TVdGNZbscTU/BHEuaJrzhAQ9HKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191276;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=XqEif3piaAVVGKhsVuWJJP+kJnsbd4iwKquVjNCjgzc=;
	b=2llHPuqf/KDqlUtfBpr+9XcmXdeH6tjouRYk3V9QlGLKnP2bxfP8XR7eec+vMS/7AuCO
	 /daSOcPMajI0Yy6SAeISLbH07b6JReJwncdYwUXUAFpvHn6u6mZjG08UjKg2tJTxOmiWy
	 FKVy8oTFV+VNIUUv1OSy/fN/we7xpG7Q6CJh+8Dm6+Bfb6Cc3YldSr0v3LPP7kzJawPA/
	 HUGfEb2dE6jjBXq+vfRT04ax90bD9EhHaltJQccaITc9lQDfci3FPZZ1hu2c8oDiBD8y+
	 jdRzGgt+IUoSau3ZgPeeOwrJlrqVoDnoSeA1tit4SoMULjSyUFVAGaVmZePjC06Hk9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KUGiFG5D;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A5606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E5A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KUGiFG5D
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so416072a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191275; x=1793796075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqEif3piaAVVGKhsVuWJJP+kJnsbd4iwKquVjNCjgzc=;
        b=jKkI2z/C4rpqvfaKgpkmT9WxTmqj9hJaUr/JPh7HctFOYnmlslvI5n2d2duAbmMPxP
         bRRcd6QGvd0XyFmyc3FPZWAH0UjbUMv4NQdLkmpDtLgFQ5GT4DQaelYYVxKg9zFsezjT
         6KboXMRS0I+1sRKPPzfKjg2Ad0KOd4dmUmMTqd6j3NfBfhp0Dypi/3zppFswrVS4XlOo
         4moH29EhM7I/PVfR570lDKnsOXoujHGJhA/iAucFbt9ezeckzfTFMwPhBOTRaX5UmP3m
         7PkrKpgE6o8a3TPB3p848Ll4+vwm0vFFF5DI8+Zz2cKpiI9svRi4ya3WHUcdcnCSoDfU
         07ow==
X-Forwarded-Encrypted: i=1; AKwUvBzQuQIhy7bDIzP/gySPo3W/i9GsmVRXXsT6QZefRXiCJqVcm45uDK8xyUdfwhq+dUkjUWJHJIQ7ZQTYenM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKjEI0R2m4CXU6/Nrt9goinoWL/52sti2nU1+Uh5J5Y9SjDeNC
	KHkoj5wMJgqxPF5NmNDDaIy7GVmg0z365JRwFexF8sXNblXJQN/C5K/2Ja41BxMiprh2n5p9/Lu
	xnSrOJohxdnWPZRwObVoohLdQHPzNpyEqU0ZMQEUr+aJXMRa+vK5cm+MO5mHMy99rthBItfkeZY
	KPJ+CE+d817BknkfpsGuZDzxswIOE29rtHPpFy6jBqTR8d5/I7dvS+8H21KUrOkBOzO0nhI5hu9
	QDBaVt3j9tpI/qZ
X-Gm-Gg: AYBFou1MhAS55vgulGCI18TTHlDet3ATLaJK+vKJzLUmmEILlXc5poXlvTShdJOHA4S
	Tlo+u9zt/4eS4Nf/XOZjtB/2liNejta3uV0BrbekTCdXDSH+kfhxJgb3F8T+IfRza+HghAtRMXX
	+f3ihDz3ZBPNP8odWsvQf6ubPezT59iA0dsyQ62U6HzNPF0QB/LoSQxyoAolher8m2QQFAfuHii
	WmPR4GXtivHPv/L11378vMLU5baVSwd+bGvF0xA46kAPdBZIPEcT4cQZLpq445KSEDUPR5fKa0L
	+D6a18mh5jrpgocv/I5C8Ifj54vCZaG5wNFC814ZVm7cEIh9Cm71MfgXQqFor3bPPbbcWPAnvVn
	3KJcnXFHR02pDY5BSWAVHVySkQfBdOE2Xy21T5Uf8MUtpdssPs6Y4m4ZGye6eQPJCdfeQimDr3l
	TKdULvTPCD9ADirCdqpyBJlL7/ty0uCDdd
X-Received: by 2002:a17:90b:53ce:b0:3ad:a17d:f46c with SMTP id 98e67ed59e1d1-3ae5823cec2mr1520914a91.62.1793191275309;
        Wed, 28 Oct 2026 05:41:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5ac3b58bsm1462617a91.7.2026.10.28.05.41.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:41:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3a767a22ca6so4472041fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793191273; x=1793796073; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqEif3piaAVVGKhsVuWJJP+kJnsbd4iwKquVjNCjgzc=;
        b=KUGiFG5Dn1q3g1MnS9v2hRZEnrZOhPuI1WYpVMci4Aq1JcV53siQvaaCbZRRI+HiYS
         CePIE1BbQnbGIp1UbnD8Y5yYYe0shY6Qnhnn0wha0p7Ltn0AgvPn6L6SqSrMnRGk2ChQ
         uiX3i9j/74DKnGv3MI3PNxaG9zStgY/BpddxI=
X-Forwarded-Encrypted: i=1; AKwUvBzIyCgbedyIHolPZyQtQ5bcPdE3mJjilgYjySiJZyCpTB0gqo8N0376cUe5sRHaP+kwGzpqmhH2LHP3NVI=@vger.kernel.org
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id 38308e7fff4ca-3ac9cf82d06mr5144391fa.20.1793191273075;
        Wed, 28 Oct 2026 05:41:13 -0700 (PDT)
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3ac9cf82d06mr5144181fa.20.1793191272523; Wed, 28 Oct 2026
 05:41:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
 <20261028082724.GE2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261028082724.GE2668804@noisy.programming.kicks-ass.net>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 28 Oct 2026 08:41:00 -0400
X-Gm-Features: AclHuK8ut6bSnBp6Y6V2DclJ4JCRJx1r3_APd5D4CA092zg18Y7LFlwv6-znOuE
Message-ID: <CABQX2QPwkot4tf23dt-Fv08a+15OUN8Z1hYLHGMa7Z7KjUq_DQ@mail.gmail.com>
Subject: Re: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall arguments
To: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e02ee7065ee5e06a"

--000000000000e02ee7065ee5e06a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:27=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Sep 03, 2026 at 12:07:20PM -0400, Zack Rusin wrote:
> > The high-bandwidth hypercall helpers push %ebp before loading the in6
> > operand into it. On i386 without frame pointers, both GCC and Clang can
> > address the memory-constrained operand relative to %esp. The push then
> > moves the stack and the helpers load the wrong value.
> >
> > Typical i386 configurations use the frame-pointer unwinder and happen t=
o
> > address the operand through %ebp. However, UNWINDER_GUESS is available
> > with EXPERT and permits the affected frame-pointer-disabled configurati=
on.
> > vmwgfx is also available on i386 and calls both helpers.
> >
> > Stage in6 through %eax before changing either stack register, then save
> > %ebp and copy the staged value into it. Load the VMware magic immediate=
ly
> > before the string I/O instruction. Mark %eax early-clobber so it cannot
> > also provide in6 or an address register for it. Use the same sequence o=
n
> > x86-64, where the full-width register preserves in6.
> >
> > Fixes: 34bf25e820ae ("x86/vmware: Introduce VMware hypercall API")
> > Cc: stable@vger.kernel.org # 6.11+
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > ---
>
> So I despise all these hypercalls that muck about with the [BS]P
> registers. The Intel function call convention is much older than any of
> them and yet they chose to violate it.

Personally I reserve my "despise" for more important things in life,
like celery or subscription services but I understand the sentiment. I
don't think anyone's here writing love sonnets about this convention.
I ranted about this internally in an old man yelling at a sun type of
way because existing hosts and guests depend on this layout so
"fixing" it would imply adding a new convention and still having to
support and fix bugs in this one.

> This is both vmware and hyperv.
>
> If if were just me I'd have nak'ed the lot. But alas.
>
> At least ARM64 people are (afaik) holding up and telling hyperv its
> their problem.

Our arm64 conventions don't have this issue ([BS]P just goes through
x6 there) our x86 low-bandwidth helpers also don't have it. I have a
possible path to fixing this in the kernel (we can't do anything about
our hypervisor but you don't care about that) by completely removing
the high-bandwidth vmware hypercalls from the kernel but it's a large
project and wouldn't help stable.

z

--000000000000e02ee7065ee5e06a
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIM+z
NPBPuBFFd6i7wJ4pqvIbwpCRs0OTNhI/N38Kc/sMMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAyODEyNDExM1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHLcF7Impa0aub9NE+1czJ8EIpd1QM2h4aU0XrVh
eaY/LN/iUnhxo7bqGWPIEcTxDu/C+YxzQHWLqsHGFM+gU+WJjiTW9xah4moyyVwx3AaCZaieLkoH
9NbFHN7T+OE0PP8SSYfLfic5Ye60j+bsw8sCrZHbxN+ngu7ohKi6UjvAlr+BxrzkqBKNLaKDoM/h
XDK+CFuMvU4klHpFQsDLrt8fQmext9+jDp+A8Yjrq3yqGMGCSN2cnJYxcYvgB9o5n2qq308iLfqb
CCj8FIzuaGyYkN0PTmiPFYFcAK8O8XiScP+I8k/dxRo6OGqBRgnZKb6HJC8VZQluSdRpHIHvIA4=
--000000000000e02ee7065ee5e06a--
