Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666680;
	b=kBJX9cMWIzPBSm96ao83NHbD3lNBf6koWXY8teAoz+PFgGPshVoRxp8AjUxKlim1GYCo
	 KLWpDXFFfw9X9WZq5DtC1HGiOInuSBgg+wSJfax2rnyI8YFxco9Pt4Qd7ykO5s+cjDeaw
	 nhwoIK6eDt5WS2rsM4Ci8qGDtVp0GDHOaO0xfUbUNzsIiWV/+J1NX95/R79yk73G+kaoE
	 c0z4aHeCNjTH9qe0idkxOaSeg0MPaMiaAo9LXa/UyVwbSl2U4sUm+XN1egboy3dHyi5UD
	 eiqbUvP+D5s5e8RW06iydOPy6CwcaPeIQbLv6HZKB0sM3srapq5jhA8IkD1fmZ7a1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666680;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=cZcCYOH7VoLC59gec1OLzj5cglCRJ0zulxxEIzuuknA=;
	b=0cCStUnaACczTox30P89P+cwT7Pnh2cjzycbxYER2ghMA97Yf2YT6jlU7pz5bQJukq/B
	 OXA+WGv9DFahEt0QhxAci+4aruWw3NjsdOmsjrDffgp+rPpKG52ZIEac9xrDZk7w2Pqot
	 285qfWFixoZs2rojZ3KnXkkWhcPYt3aluYutK4BRSWgjN9HdY5DPpZ/XUVJWvec7af/iR
	 mapOOEcdjFlR+PO8/558uV3vQ6qYBURU3v8OBHPz3A5SHTpf4PAL4oIrX3zcVYFFNUNvc
	 JTdq76Da4k5UI6ewyr7Z9Ih0sB+AAx3rRH8NvNYtWv9Hp2O9F5fHvxhHax0SjfcvW0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lxqgfva2;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807D3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lxqgfva2
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so687826a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666680; x=1793271480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZcCYOH7VoLC59gec1OLzj5cglCRJ0zulxxEIzuuknA=;
        b=vqzvNbH2GUEiseinaJ4FUpIocsJKCX2lT0z96+S1luAEqBKkV5SIphblV6lrCsgUdd
         W+A85FJVoZPQ/mqLwx+Vaw43bOrciKogRavdD7OaFvDXef/TKD4uaakQ0Aj1WHuliVXG
         ZLdNb6rOriveCpUjVAPwPsTM+QqqMM5P/F8/N1aU9w1nHUbiIpw4JIWPLlPiF52wXA7n
         ktcrtrsgP7GfMX0i58gHLOXRD5hRPk5tCYdmxtUf6cjPCSBqc0IeDzqw55SEjaWmIS24
         eKMO7csDX2tK/9ecCv/VecT+Anz2R9dKC7h3DSfIZysCKW/pWayhx449ADHomeAvKRkJ
         B+/g==
X-Forwarded-Encrypted: i=1; AKwUvBx3RbMCCh66kIwHNbnBBDunf1UZ+fHVLVh0Gwe45YutgUS0HzaUza/QcCRAtkX+KQsGV+X4IARgHBSNWB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTea9S47DJ31+CaNivW3/xf2gAUAyVQBAPWFDlLOBxD2zB/qIL
	kI4/XaXGGKwHLnzf07Ha/uwVe1LWjZRA40vL/n4MsD3aT2qA3/ml3KTP8jrZPPNreNEpGT1XVJr
	tpd8bc4N1Av1vaLGm+sNyxMu/aoYPiOjyFaRy/BxhzZfGy0YN+mIp1Y0EDkvvG/65mr6RglIncL
	aqXBMGSCS+niz50WFJHk5hDxUd/ZLRr80BniZiv8vxs+7K2muSXgVfbuexFKYwNUIK0UNISET5A
	qR9jGTqEgOy5UzlvhfdpQl88J4h
X-Gm-Gg: AYBFou1rdx0IN6qpWEGdivzIqpp6KTtIT62Ykejuua+58y8UtGZ1F2SIVbxBoTf5J5D
	8FgjvKKcXCKrh7/7OC6Nm1X9vCxkwXfdo+C2lPpzgKpriLjrSiBEJgIUKPAQ2Wn5ukgw7Prb8FP
	xzR3wrE6L5+ZlpOBEQdmr4JJCLAcan+jdlDA6RoldbvF5ClmxFT+WVll6Wcbk/y/ZI78Ts0COGg
	kkzNDLkEV51I2TM9QRFP1RnCBGuEym3s6xjb5WIi5R0ucX0wbL+2KnijMQkV6kkpS9wIPqjPFdF
	IZ9blqRQWroSdFe9FICouduyOPQSySXfzB0x4t8MWBmXjtLvuaU1gdEd8e+QliQ58uxSPkZOrTa
	jzndtI8bNKwwJJv+LpUoulkudtn1C80IjFxuyRar5CvdfYgSe6uP9D9shiRmh529kJLDC0/zdBF
	8Kl0iUWLEUJRu21zHm5LzFUwG8ooofYJX28MUhESxFAQ==
X-Received: by 2002:a17:90b:55cd:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ad86e9770fmr3631095a91.11.1792666679536;
        Thu, 22 Oct 2026 03:57:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada4897870sm1891575a91.3.2026.10.22.03.57.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:57:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a556c43so37950176d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792666678; x=1793271478; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZcCYOH7VoLC59gec1OLzj5cglCRJ0zulxxEIzuuknA=;
        b=Lxqgfva23BrHv6VobUhXez49m+l8/oDWKA5CGX08BKP8Gf050626BVRvxdBKW4FgQ0
         eR4RdKO1qSg6jgwvqOZxzgQU79E/FCCOJ8nu2s+8a0r1gzUKww5Yc2OzPaFdmhc+s+95
         rg//820camIzxrTl4y2m20Xs7abS8mrEVSFMU=
X-Forwarded-Encrypted: i=1; AKwUvBycV1TiPgaCtENLwkbbWgqahTq2LhoMit3oumzVKiVhBpslyzWWEOmVZKOIfowFqrc/+S28GLIhw7rOl0o=@vger.kernel.org
X-Received: by 2002:a05:6214:240d:b0:91b:88fe:a426 with SMTP id 6a1803df08f44-91c12d0ee58mr85783536d6.0.1792666678251;
        Thu, 22 Oct 2026 03:57:58 -0700 (PDT)
X-Received: by 2002:a05:6214:240d:b0:91b:88fe:a426 with SMTP id
 6a1803df08f44-91c12d0ee58mr85783346d6.0.1792666677848; Thu, 22 Oct 2026
 03:57:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013200645.1346299-1-bhargava.marreddy@broadcom.com>
 <20261013200645.1346299-6-bhargava.marreddy@broadcom.com> <20261020133444.3395670e@kernel.org>
In-Reply-To: <20261020133444.3395670e@kernel.org>
From: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Date: Thu, 22 Oct 2026 16:27:42 +0530
X-Gm-Features: AclHuK_1ADCzYaY-bBjBi7InV9ZMeLTyQoUUQ1qHXyKyg0wNZw8xN8kzIoelU3c
Message-ID: <CANXQDtYjxskxm11cGVV4QbnTjwStwJ5ot-5Kg+P+z5L0pOL5Cw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] bnge: make NQ0 persistent across
 open/stop cycles
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, vsrama-krishna.nemani@broadcom.com, 
	vikas.gupta@broadcom.com, Dharmender Garg <dharmender.garg@broadcom.com>, 
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>, 
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000944831065e6bbc82"

--000000000000944831065e6bbc82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

Thanks for the feedback.

On Wed, Oct 21, 2026 at 2:04=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 14 Oct 2026 01:36:45 +0530 Bhargava Marreddy wrote:
> > NQ0's NAPI keeps running while the interface is down
>
> Sounds like abuse of netdev infra. Creative reuse of this sort makes it
> extremely painful to add stack-level features.

Understood. I agree NAPI shouldn't outlive the open state.

For context: NQ0 differs from the other NQs. Besides Rx/Tx, it also
handles firmware async events and HWRM completions (and MPC/PSP soon).
I kept NAPI running while down so these non-datapath events are still
serviced, independent of the netdev state.

A dedicated async-only vector would cost one MSI-X per PF/VF, taking
it away from Rx/Tx queues, which I'd like to avoid.

What I propose for v4:

1. NAPI for NQ0 is added in ndo_open and deleted in ndo_stop, like
   every other NQ.
2. NQ0's IRQ stays requested across open/stop:
   - When netdev is UP: The IRQ handler schedules NAPI, which handles
     Rx/Tx, async (including link), and HWRM events.
   - When netdev is DOWN: There is no NAPI instance. The IRQ handler
     queues a work item that handles async and HWRM events.
3. Mode switches happen only in open/stop, so only one context
   consumes NQ0 at a time:
   - open: quiesce the IRQ, flush the work item, then enable NAPI.
   - stop: disable NAPI, then allow the work item again.

That way no NAPI context exists outside open/stop, and the vector is
still shared between async events and the datapath.

Would this be acceptable, or do you see a problem with it? If you'd
prefer something different (e.g. a dedicated vector despite the cost),
I'm happy to go that way.

I'll hold off on v4 until we agree on the direction.

Thanks,
Bhargava, Marreddy

--000000000000944831065e6bbc82
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGqjCCBJKg
AwIBAgIMFJTEEB7G+bRSFHogMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNTI1NVoXDTI3MDYyMTEzNTI1NVowge0xCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzERMA8GA1UEBBMITWFycmVkZHkxGDAWBgNVBCoTD0JoYXJnYXZhIENoZW5uYTEWMBQGA1UE
ChMNQlJPQURDT00gSU5DLjEnMCUGA1UEAwweYmhhcmdhdmEubWFycmVkZHlAYnJvYWRjb20uY29t
MS0wKwYJKoZIhvcNAQkBFh5iaGFyZ2F2YS5tYXJyZWRkeUBicm9hZGNvbS5jb20wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCq1sbXItt9Z31lzjb1WqEEegmLi72l7kDsxOJCWBCSkART
C/LTHOEoELrltkLJnRJiEujzwxS1/cV0LQse38GKog0UmiG5Jsq4YbNxmC7s3BhuuZYSoyCQ7Jg+
BzqQDU+k9ESjiD/R/11eODWJOxHipYabn/b+qYM+7CTSlVAy7vlJ+z1E/LnygVYHkWFN+IJSuY26
OWgSyvM8/+TPOrECYbo+kLcjqZfLS9/8EDThXQgg9oCeQOD8pwExycHc9w6ohJLoK7mVWrDol6cl
vW0XPONZARkdcZ69nJIHt/aMhihlyTUEqD0R8yRHfBp9nQwoSs8z+8xZ+cczX/XvtCVJAgMBAAGj
ggHiMIIB3jAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMw
RgYIKwYBBQUHMAKGOmh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZz
bWltZWNhMjAyMy5jcnQwOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dz
Z2NjcjZzbWltZWNhMjAyMzBlBgNVHSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisG
AQQBoDIKAwIwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3Np
dG9yeS8wQQYDVR0fBDowODA2oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2
c21pbWVjYTIwMjMuY3JsMCkGA1UdEQQiMCCBHmJoYXJnYXZhLm1hcnJlZGR5QGJyb2FkY29tLmNv
bTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAd
BgNVHQ4EFgQUkiPQZ5IKnCUHj3xJyO85n4OdVl4wDQYJKoZIhvcNAQELBQADggIBALtu8uco00Hh
dGp+c7lMOYHnFquYd6CXMYL1sBTi51PmiOKDO2xgfVvR7XI/kkqK5Iut0PYzv7kvUJUpG7zmL+XW
ABC2V9jvp5rUPlGSfP9Ugwx7yoGYEO+x42LeSKypUNV0UbBO8p32C1C/OkqikHlrQGuy8oUMNvOl
rrSoYMXdlZEravXgTAGO1PLgwVHEpXKy+D523j8B7GfDKHG7M7FjuqqyuxiDvFSoo3iEjYVzKZO9
NkcawmbO73W8o/5QE6GiIIvXyc+YUfVSNmX5/XpZFqbJ/uFhmiMmBhsT7xJA+L0NHTR7m09xCfZd
+XauyU42jyqUrgRWA36o20SMf1IURZYWgH4V7gWF2f95BiJs0uV1ddjo5ND4pejlKGkCGBfXSAWP
Ye5wAfgaC3LLKUnpYc3o6q5rUrhp9JlPey7HcnY9yJzQsw++DgKprh9TM/9jwlek8Kw1SIIiaFry
iriecfkPEiR9HVip63lbWsOrBFyroVEsNmmWQYKaDM4DLIDItDZNDw0FgM1b6R/E2M0ME1Dibn8P
alTJmpepLqlS2uwywOFZMLeiiVfTYSHwV/Gikq70KjVLNF59BWZMtRvyD5EoPHQavcOQTr7I/5Gc
GboBOYvJvkYzugiHmztSchEvGtPA10eDOxR1voXJlPH95MB73ZQwqQNpRPq04ElwMYICVzCCAlMC
AQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMf
R2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMFJTEEB7G+bRSFHogMA0GCWCGSAFlAwQC
AQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAK33MGnEVmxKdX3ZUlRUBsoxjAIx9c39tLBrkorxvVHTAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjEwMjIxMDU3NThaMFwG
CSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYI
KoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBrCBIB
9orSKHMsdqahq+Sf4vhLDWdvuVB/2AAt6fR5P2eKOEfNjHlDIFL8XOt4SpkYVMHQJVglC/2VNHRL
wC577MNOZqXGGRNXDqLVyIYXXQLrUhb626c8BQfcgj9cqbnE7KW6zF3d7upvdXtHHQFtkOUW+y6C
IjpELSrHRbC9Ep+VlsxDUOEZMfLhtpS198+may2GJXWj5X0ToDH2MeDr8TH8QnkgNrlFbZemlrAR
jp+MIdE3s0V1JfbgzVuwXpn8GAyGe8hJRNNq6rnHamrI9ti3lkOmkedH1xWLncXyRnXLi52BJbNK
WWHzAB3GwYWnbTqs3PV4VGdgiM9EI0aN
--000000000000944831065e6bbc82--
