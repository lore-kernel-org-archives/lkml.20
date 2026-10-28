Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188990;
	b=QrUfBcnj/F4rJABX9HbHNpK5IMDQnv5t+m4fwnrUodCYZX8OsyL5H+TTGmHEqZad6akT
	 A6QNIq0W4hFQpSwrPQzUp9+F0uWo8QzrWntZDpji2TZC06RBsApwDmpiWCkqLybfUYZfQ
	 InEWXnBInmuvJJrWK3zSQVH8yG4exfIVLMBOQVQugVF8nJq1a0FzgsjyVNRsUPTDoE1D7
	 ew82Fgic0lN93PCP5K/1DYP8k7ValbHPUC9Ubq37XEFIJibb7XRgeHRpVMXvoCd9HU0qf
	 aACEy5a/hwD7VVeCJlsrV3s+CH4qfiiI2Yl7bmzBqItpnRhy6lkad9nM3xgCl/svLIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188990;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=oTom+0b40aSVseYvM7/6/kLn17Rmjwu1HG57A+qIpec=;
	b=yX6ETGAdRS4JqQYs0fSEiiNs3M8hmcYUxQDVaIuM6c6qFG6tGR2QwTg933Lmc1ouqmfS
	 ndI/A6Xx3t580CtVYBNXCNx6rMYTgdYEuGBUlV9A3B1qqZM731/W/zWbQxoI417eGcQa/
	 lg0wUqKYmdxufJfNW/sqTtYpldqlr4xlbBx9nHGDuzmjG5isVRpodDZG055e9j3iG4i2o
	 0C/SB9M0Gr3/AWjrfiOh5s9jc5FT15/avBVa0jMYblZNdw62Mftixo0okiBFddWwALG+/
	 2qahtyH39Z8zBDi0I7/2fio4giycJJftLp89XfFZ7kb5fGdPX76GIbLNG46tGJXuY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TcdHefzh;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3740B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3740B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TcdHefzh
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso638905a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188989; x=1793793789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTom+0b40aSVseYvM7/6/kLn17Rmjwu1HG57A+qIpec=;
        b=ymZpsFJpJ7vwRHqXXCfJyBE4Hq9n5uK6nn8HQjhOM5Nfu6V+ytFlTQmrix038P35uc
         VrW71/Jn+JMcgvyWQN2aRodz89M3xsG3HXsgxh1NQVj63Ms/DA1qsjUrbzuBLZGbV0kI
         O914wPEcxgmGYvf9cf+vZKF29kS3pNi0EliGuYzWyRwS6/xYLqnxSuq6e9GEDZAbsdda
         BDzON6cRqNhCS8xhUkFVDdUA2EPtO1SR6tKhu+Om3iGztp337EGvJo+jNYNNNuRmgQJF
         N48Z6exX8F+5j2kT/jDnHFKEcIesYJZyKHtf/yCCCroZsOlZQhuVnPSuVmj0wDcK9iV1
         ngqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7H4rhP8hHPaua9Z74YZievgLpB6KSLhof63VeveX7K7vNQSou57LZ70fkC+/QYWU14KHxnAtVpIeCV/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJetbHv8XS0LRZkNRD2EfkT6YAy+b/Jw33Tj5gtvKwk6V8PEdYV
	VD8vXMyRWNMaNS4QuAjnbvNJ7TEfkMD99jdBhIts62SkuYtVXqPtf4br4uNnUMc1seEPd+k0fQO
	KNivaORN9C9N19RutlD9mcB55kIzADTcx+BCbyjA+cbqLnDlyh/rbd1we3XH3jHhM18+5n5olWU
	Ut9kV77pbZTgdnljdZi4uCVTD0pu1aJenR+q+vlQtoKlOzFxstO8LLWy82izF1qPpjo5I1dNWN+
	U7esfC264JsKXe9
X-Gm-Gg: AYBFou2v6MbUopTx7y51gA2ausqYRKpLlxAJYdzGe/NcibboOZLXGjYdGR9X/20grLF
	txZP/s3ZDbIAkKjqGe61oxVa0o4rFE1N8JGh9W5m3cWOONx6ivY2BWgkgsjxwjeT9M1AfFG9Jqn
	ulMgjlhWzRiz9rF+6gyeeF3mWQvojNrlI0jDr54u9aDPniNTqehSVCIN1CmdIA0U/1Rv5VvelTM
	XW0m+gJIPN0fohZJytYo9Svy+IghJY7hpvTyxPdXyckdyGBzc5moUTXmtj3YSf4ZDV7aTbRmQCQ
	tQMhz4Xv2xhKf49+1k7Cv/+0k+I+RAcilW/ND84eeMQ5VxCxPk5eSqb1lwGKANkXFQtVoygoEm1
	kyoYNXmTSGqRxFfnrOiBxETWdT+ULIRJ4jzLHvSmaioj3XRUFvxKnlwjahYt2tyuqGQltyxWqon
	Ew8VSryriQw5zoJ+TYYI+xREl8qPeA9ZbC
X-Received: by 2002:a17:90a:ec90:b0:3ae:2961:14db with SMTP id 98e67ed59e1d1-3ae580af9aamr1582440a91.21.1793188989307;
        Wed, 28 Oct 2026 05:03:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae57b4c0d8sm775970a91.3.2026.10.28.05.03.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:03:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab3650ca2cso4118491fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793188987; x=1793793787; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTom+0b40aSVseYvM7/6/kLn17Rmjwu1HG57A+qIpec=;
        b=TcdHefzh4Twf/NZslzgM0e6hhIxHCYSTkXiGN/t5PwC3uq1plIM7ttdlSoccR5J6zX
         XBb9hEiq0t04fhgZJibf95rFh+5gmqUH1YbR8YcEO2Pfzto1Qda+Yis84UmIiVlz4XZE
         BlM3JKzknOWhb3xjufuXTE87nKAQ4NytZ3UA8=
X-Forwarded-Encrypted: i=1; AKwUvBzDlT8KZ9op9qjso7SPSqR9olM4gB/sV7KxcYy1H9uhWpFlzk+RuTZol8UnauZ1ojJPfaeFlElRGBmD7Xo=@vger.kernel.org
X-Received: by 2002:a05:651c:2101:b0:3ab:47e4:9a9c with SMTP id 38308e7fff4ca-3ac9ce3407dmr4767721fa.3.1793188986817;
        Wed, 28 Oct 2026 05:03:06 -0700 (PDT)
X-Received: by 2002:a05:651c:2101:b0:3ab:47e4:9a9c with SMTP id
 38308e7fff4ca-3ac9ce3407dmr4767351fa.3.1793188986322; Wed, 28 Oct 2026
 05:03:06 -0700 (PDT)
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
 <CABQX2QMNetg9iYRRsQmeM3+1tnC94ccWM=450wMZL_sUbqAJtA@mail.gmail.com> <20261028060042.GCauGPirK7ePNeTGF0@fat_crate.local>
In-Reply-To: <20261028060042.GCauGPirK7ePNeTGF0@fat_crate.local>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 28 Oct 2026 08:02:52 -0400
X-Gm-Features: AclHuK8GKefxAuouxabHPgUXz1TuCwIBoofaMi9ek3JpE85x7Tutg-n7QSry9co
Message-ID: <CABQX2QP=cpMfFTdmxdQr6uVnJSF5uVQj7F6bdGwpdb1BT_UtJQ@mail.gmail.com>
Subject: Re: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall arguments
To: Borislav Petkov <bp@alien8.de>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000991365065ee55896"

--000000000000991365065ee55896
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:01=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Oct 20, 2026 at 11:34:23PM -0400, Zack Rusin wrote:
> > Gentle ping on this one. It's a stable fix for the i386 high-bandwidth
> > hypercalls (vmwgfx uses them), Maaz reviewed it, and it still applies
> > cleanly to v7.3. The hypercall cleanup series I'm about to post moves
> > this assembly out of line and is based on it, so it would help to know
> > whether it's queued or needs changes.
>
> Sashiko complains about some pre-existing issues:
>
> https://sashiko.dev/#/patchset/4ab10678a8f50053934b62b56af81f881c1d3798.1=
788414669.git.zack.rusin%40broadcom.com
>
> Please address them: if valid, you should see about fixing them, if not,
> explain why they don't need to be fixed.

I haven't seen this. I need to update my kernel setup to fetch those
muted Sashiko reports. Anyway, both are valid but they're preexisting
issues in vmwgfx. I was planning to rip out most of that code in
vmwgfx but I can provide fixes for these two. We could land them via
your tree if you need them as a prerequisite for landing the above,
I'll just make sure nothing touches that code via the drm tree while
the changes are staged in yours. Or I can send out the vmwgfx fixes to
dri-devel and land them in parallel via the regular drm tree. Let me
know what you prefer.

z

--000000000000991365065ee55896
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBFt
ESD21beC83Gb0OReQ1IePOf2bAibVghchBQwPU3TMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAyODEyMDMwN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAEXZB4tRhPKV5CXI1idgRkejQHr+LjxREK/qzBGC
+/8PDd7XJy5osqg0Gy2iSMXvsW99ulrzC0kjnY4NA8hWlPYPk/bZRq+npGKi1bVS5L4PiUL2g8bT
NV0uRX47ff1LkuXM4W1EfQvn1E0MZRdP/9zk1DDhDIIp25hAVaAvDECeghDLmqPVFEg00QDFSSYi
HssbPGn8vcZpo2pQxr4b2W3g1yHY5cg9uq8k2m0LeA+2Sv5J8+5QYrm8pjNV+dKCcwQf6kNU+ozF
8WqXvRVfj27y3QpvOUrYg0yDjm56Zn/2OgXJ4YFnIuN9M55DIVxroduOAGdELkD1dTp8U9I35BY=
--000000000000991365065ee55896--
