Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351869;
	b=Hivu1IFa/dy6J1WdeCujJJL6elbKMyiFOMIGQEuqobEGJTmAvFP3BUjgufhxeID2ScBe
	 NxD3rU6DAzQ3794sgTPSdyagp21uP5804IZBKAwoALzFSScrzpqzexLV+ONrgoCBbUxGq
	 EodrSXmD+u5JPDmqaTxz7TIy/o8wKdSHDbYOGwdJYirznO1qU23Z9Lf9e4hfGm8aREmbN
	 +kAOGDG7mf6Z8xiX888c6ot0YRMP+iHdwlBoi4wGGE8tkAsg64e3XuJRx6PDU6W9rH3J8
	 azplaZjrbRxl3tNGjcgHGOkBsShz5oQxDplUsgeVOL6m0d6WLwjwIyHOzZEGW01Ag7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351869;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:X-DetectorID-Processed:
	 Content-Type;
	bh=sEA7Uv5xEAI97cqz6EkNlQdTKpPR4tI/PN+TW0MB1vI=;
	b=aOutEb2xem5KnSTzVk3lK0RJ4s+2+mKAy0WJ4Pd2YciA0Au8SGXLfNcsgB9uTrA1py9/
	 wY2h7fOfk0Xc6kcbgku3F48Dh43F4iyUtF3aq0z5SuPq6OZIqBRUanmqhho7YOFfhuZay
	 lkI09QQb3ZeHE7UG8xUW2KaACD2r0S2oLg8NSxpRuTRDua1C1mx3J1Of/U8VZruqJ5lh0
	 ss7oXXmNWJJx1KpkdJHZ4W9lLatX8QE67qtj3ml5/RVUDixVS4jWavq81c796ezDVwq41
	 IObqUqYNziomzIujUGkVRyzQusL+oz0xFux+aWTbpcXmoCrXzX966y2BswITr7Hox8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fVV7Zcla;
	arc=none smtp.remote-ip=74.125.82.225
Received: from mail-dy1-f225.google.com (mail-dy1-f225.google.com [74.125.82.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D28606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D28606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fVV7Zcla
Received: by mail-dy1-f225.google.com with SMTP id 5a478bee46e88-37628596783so1163316eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351868; x=1794956668;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sEA7Uv5xEAI97cqz6EkNlQdTKpPR4tI/PN+TW0MB1vI=;
        b=MySLsQn6a+r9HJ5tYXHKzadSgvQ7eFAR9iYu6eaalky4VVrYjmT4RnrhonPeVwOplD
         bHim59LzAs57oiSQzrdpYtLKAn0tawuP9lF2xv3HVbEVKeZlJ/jon6vbFb0jrQDyp7O7
         PgRyaPQS0XV95F3wlaNE1rrmnE9v5SIDELHxjiptZl6qv+OLJzdx9sTKqvbqsPW29zqb
         NqEmVSlV5UQgUmtJl0h1mZueEPgl23h+HJQb8alsrEQiEcBTDtKhVLAVbuxSvAQB6WHr
         /KMv7hlUY2+RUvu2Ccj+AbXdK3JHxZZfXs1gYkNTRoeXzpf5tUaxBlTzaeZpDUytmx5x
         HMvw==
X-Forwarded-Encrypted: i=1; AL+hErHNv+IiglFdR8EIMtGmogJveHu+7LRSMz1nfVFOSsx7suVhnRgoXuXj4yljK2z9iLEV+1QjcNqyb4EzPYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cRoli2VpRWK+fGqEnlr4nr4vvlic5IGg7s5Cj/IJDzjE1zwuq
	6rmO12eB+kM3521vvxt4yK97IjeQEuZwZepKERhRMRdecgrc4CIq9Vm1zIskcSWbH5mNkVnMhzj
	VWpx6BCY5XPC0hPZdn+g5+4jmDUhf5S7lzxobwTPXDCqpkqWItYmW+ZXHCx6kCaDl/gKy9WAtcy
	rNWtpEoI7hKKWh9gljBMCC8Q6A1cVxoaORhNfTOitWPC+jobnRQPsxo9OwMs2jRe8HjdzPiPidU
	ioA2Uc4EfN7B5uwVks=
X-Gm-Gg: AYBFou2NLliLh3HkaafF+Me2vDKwo2vG+ZVCFVCVTLlJ3F1oN7GGbo0Bn8jVy0P0vH7
	DsbfnoyPMnAOcnPoldbXKVrOjqReYoojBHx9rppddaHeNmzq7NA9gePMqYBvfEdzmh+EIj1WZvx
	9YpqDl4hn2fwliWbUI/VxggVnpvhI406DaW9Ur9+bZFzr/nXAifyxOjdVCrKR1XCzmSq3noawy3
	0KqZEY+QfAPsj5AWwbNXI6KYbTfvp0iiHz3TChukAXTy+NuqZ2ea8n1tVCE1aZC1xwSklBWskx6
	+80Ce0LLZeizhu7rt/KyzhNaghz/j9mOaU7QiUf0xQgIYEk3lYorxEiUBecFOX6RCrSFVZiUQor
	6FELC8rRbJ/CkdH+N5mZUZmKWbFyS3h/+6dntHWTK9kdrW6tv/212tgfjV9GMOVp9CFm4htoHpq
	fqlpp6uR79PgMbZpSTaCSUYgGR4eE2kW7as8w=
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr1075900eec.23.1794351867639;
        Tue, 10 Nov 2026 15:04:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3751d9f02a4sm38605eec.3.2026.11.10.15.04.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:04:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4cd91204f4so201818766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794351865; x=1794956665; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEA7Uv5xEAI97cqz6EkNlQdTKpPR4tI/PN+TW0MB1vI=;
        b=fVV7ZclaogIO674GonldZeKAfsN0AtXtkdi37FQk8HT6qyYCsGHdApZBHWfz7W5rYd
         cVcJgzKDiG0EJgbLE6UOUKtrspj3FbR6gSCfdUQJRO6RT1i0pLo93rHKeYBQATK+iWLR
         DWMzYTsvH594dE+6Vfr6mX0IsnajbzMxjkmJc=
X-Forwarded-Encrypted: i=1; AL+hErFzqNj5Ae/w/a4UCICgx0DOMEbS/0zs24ope0Pi+smdVbEqqlCwrJVunAzjW4dUApuaapSMVcngExFsNLA=@vger.kernel.org
X-Received: by 2002:aa7:d901:0:b0:6b1:b97b:745 with SMTP id 4fb4d7f45d1cf-6b7775ec3c7mr399095a12.29.1794351865390;
        Tue, 10 Nov 2026 15:04:25 -0800 (PST)
X-Received: by 2002:aa7:d901:0:b0:6b1:b97b:745 with SMTP id
 4fb4d7f45d1cf-6b7775ec3c7mr399086a12.29.1794351865049; Tue, 10 Nov 2026
 15:04:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106191423.4194081-1-joe@dama.to> <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
 <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
 <avNWzavrxJSasfp5@devvm20253.cco0.facebook.com> <CACKFLikU8ax8-VN+EiAhrn_w+2=yex2TNHPxEYqni6g0BKHKKQ@mail.gmail.com>
 <avOXJf5yl8ajf8Qr@devvm20253.cco0.facebook.com>
In-Reply-To: <avOXJf5yl8ajf8Qr@devvm20253.cco0.facebook.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 10 Nov 2026 15:04:12 -0800
X-Gm-Features: AclHuK_cW_HHwh2JJSfJN6ZxDLcIaDEDtetVv56JzQyB31my1TzTAGufMW1nTAI
Message-ID: <CACKFLinsQdoZhEnhmZmMEMZVyGC10KZZRciBGLzA12W2iOK60Q@mail.gmail.com>
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
To: Joe Damato <joe@dama.to>, Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org, 
	Selvin Xavier <selvin.xavier@broadcom.com>, 
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008e71e4065ff41934"

--0000000000008e71e4065ff41934
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:13=E2=80=AFPM Joe Damato <joe@dama.to> wrote:
>
> On Tue, Nov 10, 2026 at 10:14:50AM -0800, Michael Chan wrote:
> > I'm copying our RoCE developers Selvin and Kalesh.  I think that if
> > you call bnxt_re_suspend() before you disable DMA, nothing special
> > needs to be done because the chip is still functioning.  It will go
> > through the normal removal process.
>
> I'm probably missing something but I think that the ring frees can only f=
ail
> in __bnxt_close_nic, where rtnl and the netdev instance lock are held. DM=
A has
> to be stopped before bnxt_free_mem. bnxt_re_suspend() takes both locks, s=
o it
> can't be called.
>
> I think there's two options:
>
> 1. Stop DMA as now, but queue a work item to run bnxt_ulp_stop without th=
e
> locks. bnxt_re_suspend would need to treat BNXT_STATE_DMA_STOPPED like
> FW_FATAL_COND and take the detach path.
>
> or
>
> 2. Call bnxt_ulp_stop() in bnxt_reset() before taking the locks, the way
> bnxt_fw_reset() does, and bnxt_ulp_start() after a successful reopen. Tha=
t
> covers the TX timeout reset, which is where all the ring free failves I'v=
e
> seen come from and it doesn't need any bnxt_re change, but it restarts Ro=
CE on
> every TX timeout and it wouldn't cover a case where the user triggers
> close/open.
>

I have a slight preference for option 2 because TX timeout ->
bnxt_reset() should be rare and stopping RoCE briefly even if all the
HWRM_RING_FREE calls succeed should be ok.  We don't want to stop RoCE
unnecessarily during a user-initiated close/open though (failure
should be very rare).  So we may still need option 1 to cover the
other rare failure cases.

Let's wait for Selvin's and Kalesh's feedback.

--0000000000008e71e4065ff41934
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCxbv1W
c38b1Jj+HMctxcqV8K/4+OEoCbPCTbHC71XD0zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMTAyMzA0MjVaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBSnmJw9Q2BhoUDEClPex8S43xM8QvMJ66kgWiq3fMl
iRcTtnXIPXRjYknqhuBq/POTHjuBA7oYCZnRm8+85XJzI8KWimbh1Dm3J6qRD9SbBhRemcBzUAjK
4HBEX/8JyotR/LM4dO3gIs/ZgH4y3U9Virp8Anysv3igOEzUxrpCWQRvaI1N+S8EF4zMHnX2Bi20
Q6yN3J3MJXkVVdZf5znSdTXCGXMNYaDwlGAnqZ8uxYoObFn10X2FHpZAjVRWc9VcHaeIsg2DusBk
MA1EygzCm+Qy/IabpqwDSsV60lX2PpNMd1uy/dE90ZC1ZttHuX/ErTBbIYSUpsS2Ij6aPLkR
--0000000000008e71e4065ff41934--
