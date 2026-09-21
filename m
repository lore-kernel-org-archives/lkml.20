Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED014DEC1A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014264; cv=none; b=PZtCNdcRw1A/7ndL5zJ3KmT7NkfTmcaIisDpsux6EWH8icumSIuR2Nk/uz8FGGrcFnXsOClApOClsqD8Jv/tSmZd3sCrzYSRJ45EHUR8W/W16WZYPrSMK/CmjUgs4prasj0BiDiyF0jmUEO6OWf5Ur2LxlGx0uuilrGsvv/e+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014264; c=relaxed/simple;
	bh=r8OyHR25wob5LLSU8KIoz3qfcy/d5HO6vcJ1D42WQBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7uAny/vPTdCcHQ4ixrficFDAl34lkjaw5Mkkmb+8S3SYb0oKT+Zsjdvl6iX4LMHvt4ZWtlAs6ijIJ1lzCEuCDWq4HgojOLnqGtWldzaiRiWYpLiFHFSM7r6QllcQ63ferZg/P64gLs8G8LK8HigZXh2XvBWUqH8OLfTf8+pdMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=R8DTgPOD; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="R8DTgPOD"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d560775ca2so8581495ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014262; x=1790619062;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeZXIKr/xHYJqym5B9EMjr4pfJnP+qeIfW0qwnhyA/k=;
        b=OskTgnSU1ABMx3fch8A2WMjdcMwT3CHIQRQ7RXmZ2A9bb1LyTdx8TA6gTDkR7gYy7H
         FwxTqIySlJ5qO8eZKdjV0Zm/PGAY99i7NZP45P9E/HdknqNxwjknBkqSFTk0dNSLy3du
         a+ivtXt6IVfFa6tcOFj0EeO2Okvwm1zTwAkWxrkPBmDvQsFNmHAFEnGC87iNPFduywUS
         DAvtKhUVFXV73oGWvFCzNhJmMi7PIDE6uSeEvjNrMzCandtVWDzfyaOBfEE0LH0evoq2
         60kfy7YPihwSagQZVnvu7P00PkX09BIIGn+RdLD0cBIDKGF3voU5X1isvgFDlkcUfuz7
         vxWw==
X-Forwarded-Encrypted: i=1; AKwUvBxn89lD7QP0PyfQHTByPcwam/fDm+qz3/aRItCf2hgOTYGGWBDJMl9T6FrWVvHfpBbaRgTH56gCZaGHr/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k0gwAcXYgZFSUnwNlCYS1pV6yYzfmuI4CHJrxdg2iRN7J0KEYu
	VvSrNu358oCBrXQ7f/CT+Btocb6xM80nS7JY9dIATrrljIJtToHvlxsoqMwBL5Vx72OgCa4BAs7
	EUnbManbtoFcQXsFltZAbofEXzyvGxQos05bIwlM4ebFY+f7Js6Y+pZR90tUVl/wTuX3eJOtO+F
	kp0EXQahJUpZdkVjzQCI19A1vz0h2R4+1i0Td1OO6jj8onv4D8hWF8k/vb4LxBPhoYZCo/Z9ES6
	BcmkcBafXzzYj14yCM=
X-Gm-Gg: AYBFou3kZDa9vQPJTElB7LpyY738766GbUuaX594SlW+4nr4wPj7IXiC6+PcyewzTlm
	AWvybnxTvI1+GflTt8n+w/bcqejEVa8/4eAVpYHqxZ2IJF7ldnskqC6ACHrJqLSGY7JltxNiYgF
	3jLSaAmdkINvWGihVsIbG3EuA8K7YkT9pQgV1ciJfVco4GqR0SCoGDEJMiCuq9r2FsiB4tBBekE
	kyTZIqEhJmAtthmKor6Cb7/o0CDSaOPr5ZQynQ6hwDXA/PEITe1M15Sa0AJQ3hL9u+XrLxyC6Y0
	8xBHhhV6xO15tZfP0zdsHljcF0ugCxO1Ij9hKhh1Cgz7Lc7GkotJ8aEyRrcdzqEuTRbXHg3fTdy
	KgBh23SpBh1SYcxG2JmDswc4POaMeyVRO1zaKpXAYqvIzdBYlyD+LUQ+nn1AvyaPkSujcynZyrX
	cNR2mOTzgYiYXP+tgOdAVucs/PyQEq9e6cltQ=
X-Received: by 2002:a17:903:8c8:b0:2dd:c100:4b75 with SMTP id d9443c01a7336-2ddc1007eeemr109211335ad.44.1790014262261;
        Mon, 21 Sep 2026 11:11:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ddc17a8d69sm2643445ad.14.2026.09.21.11.11.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:11:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c252b87e9a2so277266366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790014260; x=1790619060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeZXIKr/xHYJqym5B9EMjr4pfJnP+qeIfW0qwnhyA/k=;
        b=R8DTgPOD2qvXRnGfsaUEx3+B++61rtKJ9rl9jSGzpjE/p9Ky9OCV93OcyvGDBwmtpw
         gClRsajnzGf3vrZLIm+HcFAXXGoC/kg7jTnxt2Np0GRzz7bvBEUNZzmMhMn6z8IAlSGy
         RAlqsUiP68DJbzz3aBKtbwVrNRxFr/yH9n+4M=
X-Forwarded-Encrypted: i=1; AKwUvBwZZPaHVaLn+SnPRvB4ZQDiO4iOf36bxXIbtIlUgfj4wlOmhIU7EYjhCJ4W3LKCPPqn/m7i+JtOWDco76Y=@vger.kernel.org
X-Received: by 2002:a17:907:94c2:b0:c29:5996:6624 with SMTP id a640c23a62f3a-c2a157fc32emr964224166b.37.1790014260288;
        Mon, 21 Sep 2026 11:11:00 -0700 (PDT)
X-Received: by 2002:a17:907:94c2:b0:c29:5996:6624 with SMTP id
 a640c23a62f3a-c2a157fc32emr964220766b.37.1790014259714; Mon, 21 Sep 2026
 11:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917233218.1160001-1-joe@dama.to>
In-Reply-To: <20260917233218.1160001-1-joe@dama.to>
From: Michael Chan <michael.chan@broadcom.com>
Date: Mon, 21 Sep 2026 11:10:48 -0700
X-Gm-Features: AcwNN1WxozH0cILCxNv7TFxo16p519jJlK7c9N54vDUbgN27zq1IalRM5U9G_bo
Message-ID: <CACKFLinHp3FZVL7uSRm39WfknvFJerQhDswFZsEb2jWkjximSw@mail.gmail.com>
Subject: Re: [RFC net-next 0/2] bnxt_en: Recover from failed TX RING_FREE
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000254e71065c022cf7"

--000000000000254e71065c022cf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 4:32=E2=80=AFPM Joe Damato <joe@dama.to> wrote:

> But... if the completion ring is dead, the completion never arrives.
>
> This is reachable on production systems today:
>
>   - TX completions stop
>   - netdev watchdog fires
>   - reset closes the device
>   - every RING_FREE routed through that dead completion ring times out
>   - ring memory freed by the driver but still in use by the FW
>
> The result on an IOMMU host is IO_PAGE_FAULT or DMAR fault against freed
> pages.

If the FW did not receive the HWRM_RING_FREE command from the driver,
there is no guarantee that DMA will stop.  I agree that the driver is
not very robust in handling this in the close path.  We just continue
after the timeout hoping that the FW actually received it but couldn't
respond.

In contrast, the error recovery path for fatal errors is a little more
robust.  For example, in bnxt_fw_fatal_close(), we call
pci_disable_device() to stop DMA from the device.

We probably should do something similar in the close path when
HWRM_RING_FREE is not responding at all.  Maybe even FLR.

>
> I tried to test the code in patch 2 on a BCM57504 with FW 235.1.208.0/pkg
> 235.1.208.0.
>
> I hacked something together to inject a failure to test the reset paths o=
n my
> device. It seems like HWRM_RING_RESET ring_type=3DTX is accepted by thte =
FW and
> the polled RING_FREE also succeeds, but in my testing the TX ring was idl=
e. I
> never tested a reset against a ring with descriptors in flight. Which lea=
ds me
> to my questions.....
>
> 1. Does HWRM_RING_RESET with ring_type=3DTX cause the FW to abandon work =
already
> outstanding on that ring and stop DMA ? If not .... then this code is wro=
ng :(
> and maybe see question (3) below.

HWRM_RING_RESET is not supported on BCM5750X and BCM5760X.  Even if
the FW accepts it, it probably does nothing internally.

>
> 3. Maybe the TX reset isn't necessary at all? Maybe instead the code shou=
ld
> retry the RING_FREE over polled transport and that's good enough? This de=
pends
> on the answer to question (1) above, but I guess it would simplify the co=
de if
> a polled RING_FREE is enough?
>

If interrupt is not working and the HWRM_RING_FREE doesn't complete
using the interrupt path, it will timeout using the same FW polling
timeout.  In other words, if FW received it but just couldn't post the
completion on the completion ring and interrupt, the wait should be
long enough for it to complete.   One additional thing we can do that
we're currently not doing is to check for a valid response length and
check the valid bit anyway on interrupt timeout.  If these look valid,
the FW has accepted the HWRM_RING_FREE but just couldn't interrupt.
If these are not valid, sending a second HWRM_RING_FREE should yield
the same results.

Thanks for looking into this.

--000000000000254e71065c022cf7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAMjRt0
8mjvC1IoPoGoZj6E+O9sQyhCWb2YJDAXEeEpjTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA5MjExODExMDBaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBMIRvJnT0k9B31Qr6InIl4S8BvKwuKsBu5jkgYep4g
CC/qMW+fDrWF0k9HVUY4RFG+ZE1JPsTK9WmU1WbbSU83W7GJB8bt20y8x0fep8NMfpw/uhVkXfjP
NtrT2bi5ZQX5cjeg4oq3xNN9jMk99/X4eJrEKlOvOglNR7YwwqB5DhqI19CEQahnaV/MHBsxog6t
F91d+pwfc1uB+Hpcu8KDFjLiAxATCt87zqKwAXW9sytBPva+qPAROKbQZNMOkeBcejlTO1xeFMSV
2TU2tclolGJSvXMhnP28DXKnFltjkMVSWA4efWU5aBvDU+lq5gOwxB8q7d4exj241Vma/h6c
--000000000000254e71065c022cf7--
