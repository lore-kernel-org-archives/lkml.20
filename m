Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292403;
	b=1dxT/gH3jQbG+FVWR5ur6dblga1SL9PqVUCOooMbKugYE2ajAJj28QJq0LLqGxxw1hEf
	 7kkabaEbFxPyks72M91kSGDgwjpE0BqPXcjBL7RBfdftaIXmqo8+DIT78RClanghgjCdC
	 Cj4w9y427OHDjCmRoIRTV3V7I+Qp1gL+LNHFr7XXIrgD6iwUsOFL4AVa5uBZrast9swx7
	 hhkFKZZfeiQNRR5I/4EP3GhYX8lAgPQZDPFO3LGPXJQyauUpRirqNsZN0BB8yXSKTn8ap
	 +vTixg1W/eX1gSzk0aTEsbndHwoqljHolt7adZVuhaGZm2nqX7CAP1TT4W6Qn7hF8yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292403;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=8XesXaIq50W7GkgOwkOWV6JLW2tE4BAF7fazYTNxSzE=;
	b=wuAeperSU9hNhFdRzBOY9ATCMagEA4UI8AjYCD+zl7uliLGDS89aF7Z1/XqZRoL5toOl
	 AHV2Jp34bNUMgkuypyd4HPLya+uYP0BpoJq4GtiJGkI8Zc4tz3XFxyJ7kohN6nyDUVme4
	 4SFos4bOCFjRQ3jezTu8WKp2VegYGVat9fzajo2+0Qq4RJK8OUtHUU30V6CLSo/h5DVF+
	 WAbCnMF+LinoJMZVMSVNo384aTqtz2Qw4iGWGm5SAhtE54uD9sCiOPJHqsCcqiBTy8Tvp
	 sKV7dqKzzMDxe0zIXbEH8E8Uhy0fhdX/SfxlrgvesFYu6lUkrniT0BTXBQ0Fv9+rTeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Hoq7Gifb;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A35606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A35606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Hoq7Gifb
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93f20c3aaa5so215354285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292402; x=1793897202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XesXaIq50W7GkgOwkOWV6JLW2tE4BAF7fazYTNxSzE=;
        b=JTRNtD/23BJrg1o/ezj/AshkI1YPUd+6Xg4MTgKv0+NR0cBnUmbmmq3f4KbaJvCMa5
         tQjvf8ix7TLsSg/W9muPLJiWZty3AgPpDXZLtnduoWNtVSvXQaJe5lb5y7IVQZlL0+cM
         a5auXAAR4Khj5ir15RICk+7AiLYBPEJ2CHHU8+uLs3D+UlOZVLbRnrZS5lglOa8J5Yyw
         LNYu7GZl8+hCxvK4XYwLyFM282eWO038F+X6vQSYy+fqnWziVayfuj6Zeauj3LOi7KJh
         Wp/kMlMOMQKtFwUadSZCSSdAo8RSuQUUz3Id5bm70BTRzU7Gp4OLDcPfPRtJoSY3EbZP
         mTQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+jH2SYznDWCUpN6fs+FYebKCfuTXgJxEN67TsXfqMr9+aY1wbL1pLp5cAykVVA3RzVviNZuicGBqZBnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp1dP0QtUFiGC1itRN/FMYPXj5LXHr+U+JJ7W/P5sPQpGp9KYd
	6qeCfT+2LSDd2WS0gsnR+tvb/0XW1KQQwjcn2eBPQUEEllzXSIRTV6b3w3JYMX0gEMA6KDBL9dy
	LV1gXEYqVAc8VhmOiCEIA+KoCfJuoPMGbNn2sqQX0HDxWKzDXRREqLiOFYQX8GssTIjMNLlimFP
	qKFHY5LdW9ol/rMyCuHOj6EGCdCp8eiLsE+7njMDKwiWT1JZm2wdqW+QwGrKnnsMuzDUjgiUhWG
	TsWkePtLM2fW024Ktc=
X-Gm-Gg: AYBFou3i1XaUGogKMl2OmBWQfkLJG2QYN3duO4OcJqyPvWz7sBSdV5oDbR9E7kjUG4L
	KRKq86oQll7R37NCK9dfe1upzY+F511SaNIwmWtlRQLNwrtvlg4bMgrtEHHtBqJ2bAju2YMczS8
	lYte+Zw2XtZdZ3XOu4ZNeJS0pcZxnSeRX45JGWaVnLCacQJg0ePshKRsXVvjt+dZONnMq4qMrRE
	3yjnn8KT7Dfq+dop2CaxkUaaKvbRAsTbHvuQH4B9slJfqOAUhrehIh9+9s1CWBDgXN2Urc3Zawq
	n2i6vjjRBF60lKPvqfFXHTV4EieJ6vaFsgd60YXMCObONGqPusIdwkQMlXVEKdF9YZHBhXlc1Iz
	nC6F00PXk1k7uYtwjl4/Pz6X7dhEEktrxpOSUNAKCD/CyJ0W4NOVv1F8w/yljffv/yALYaigt93
	7Jekqufwefdlw0KuuTMjyb4WYomLM58fMWi/4=
X-Received: by 2002:a05:620a:2b9b:b0:93f:6f8:9d74 with SMTP id af79cd13be357-94408e06e70mr850966885a.77.1793292401659;
        Thu, 29 Oct 2026 09:46:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-944207fd7dcsm1055385a.11.2026.10.29.09.46.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:46:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so2924677b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793292400; x=1793897200; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XesXaIq50W7GkgOwkOWV6JLW2tE4BAF7fazYTNxSzE=;
        b=Hoq7GifbqlhCHZtiWXay40aPEA13oHMpQKtDdTef9gl7qCNGwibGYxFbZOhvEYyYHF
         TzFBQ9NeR55QNs+yQfZnHWWu5yopOOUJwVkTawhvHtI3tm3zcX8RhgxSTAYLEpDx1Gaz
         zp06whf6IbQSZVJLDJ0YbH6zeDWgvAKGBE5TQ=
X-Forwarded-Encrypted: i=1; AKwUvBxFsVoN+PeN7ReVoxL+ozZHELJOOF8CX5V6JYq5ANsnBwov24wZjdaRYqOY26gyfua2d+fIFKQh/hbSFAI=@vger.kernel.org
X-Received: by 2002:a05:6a00:a25c:b0:89f:28c3:aab0 with SMTP id d2e1a72fcca58-8a6e8b82575mr4435942b3a.40.1793292400439;
        Thu, 29 Oct 2026 09:46:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:a25c:b0:89f:28c3:aab0 with SMTP id
 d2e1a72fcca58-8a6e8b82575mr4435926b3a.40.1793292400034; Thu, 29 Oct 2026
 09:46:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALjTZvYKHWrD5m+RXimjxODvpFPw7Cq_EOEuzRi1PZT9_JxF+g@mail.gmail.com>
 <CALs4sv2vN3+MOzRnK=nQ_uMXbR4Fi8xW9H8LdX79vYA7tHx+2g@mail.gmail.com>
 <CALjTZvbopTcm9P7Hp1ep54R3_7yODg7r4j=OR2y3WOA1X84e2Q@mail.gmail.com>
 <CALs4sv2DgtkcWtMSsMiP9VLW98+5T9hz13j+O3qnqKYce6G+qw@mail.gmail.com>
 <CALjTZvYPsYb8FYsmN+YSO6U4UGPRGJSbVyxCmAfVQ4jSyBSzMg@mail.gmail.com> <CALjTZvbs2JP555bT9NGp=WePTP7KVue8qPtisG=P6sYV+HrTWg@mail.gmail.com>
In-Reply-To: <CALjTZvbs2JP555bT9NGp=WePTP7KVue8qPtisG=P6sYV+HrTWg@mail.gmail.com>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Thu, 29 Oct 2026 22:16:28 +0530
X-Gm-Features: AclHuK-fombAWQl8CJ9-Oqz0KCvKh_fJlSkYyTS1ksxZ84OHU9SS-CP3reJSg6E
Message-ID: <CALs4sv39-Jf0_fivOeXMtF63BinbaZGkYgMPLiSa2u7Z3UxeWQ@mail.gmail.com>
Subject: Re: [REGRESSION] tg3 is broken since 6.13-rc1
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: mchan@broadcom.com, kuba@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000087645d065efd6ccb"

--00000000000087645d065efd6ccb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

()

On Thu, Oct 29, 2026 at 5:42=E2=80=AFPM Rui Salvaterra <rsalvaterra@gmail.c=
om> wrote:
>
> Hi, Pavan,
>
>
> On Thu, 8 May 2025 at 10:14, Rui Salvaterra <rsalvaterra@gmail.com> wrote=
:
> >
> [snipped]
> >
> > > Can you please mention your model and the make again? Let me see if I
> > > can find one in our lab or near me.
> >
> > The machine is a late 2012 Mac Mini (DMI: Apple Inc. Macmini6,2).
> > From lspci -nn, the Ethernet controller is a...
> >
> > 01:00.0 Ethernet controller [0200]: Broadcom Inc. and subsidiaries
> > NetXtreme BCM57766 Gigabit Ethernet PCIe [14e4:1686] (rev 01)
>
> It's been over a year since I sent this email, and almost two years
> since I reported the regression. Is this ever going to be fixed, or do
> I have to carry the revert in my tree forever? From my dmesg, with
> Linux 7.3=E2=80=A6
>

Hi Rui, first of all, apologies for the delay in providing you with a solut=
ion.
The only reason I did not pursue this report further was that I could
not explain why dma_set_coherent_mask() with lower mask would fail in
your system, while not being able to reproduce the error in our lab.
Now with the benefit of AI, I hope to figure that out.
In fact I fed your kconfig to it and looks like there is a probable
cause in CONFIG_ZONE_DMA not being set.
Let me investigate and get back asap..

> [    1.203519] tg3 0000:01:00.0: Unable to obtain 64 bit DMA for
> consistent allocations
> [    1.203584] tg3 0000:01:00.0: probe with driver tg3 failed with error =
-5
>
> My kconfig is attached.
>
>
> Kind regards,
>
> Rui Salvaterra

--00000000000087645d065efd6ccb
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
/HTPxpDrr4vzZL0yoc9XefyCbdiwfyFl99oBekp+1ZxXc5bZsVhRPVyEWFtCys66nqu5cU2GPT3a
ySQEHOtIKyGGgzMVvitOzO2suQkoMvu/swsftfgCY/PObdlBZhv0BD97+WwR6CQJh/YEuDDEHYCy
NDeiVtF3/jwT04bHB7lR9n+AiCSLr9wlgBHGdBFIOmT/XMX3K8fuMMGLq9PpGQEMvYa9QTkE9+zc
MddiNNh1xtCTG0+kC7KIttdXTnffisXKsX44B8ECAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUxJ6fps/yOGneJRYDWUKPuLPk
miYwDQYJKoZIhvcNAQELBQADggIBAI2j2qBMKYV8SLK1ysjOOS54Lpm3geezjBYrWor/BAKGP7kT
QN61VWg3QlZqiX21KLNeBWzJH7r+zWiS8ykHApTnBlTjfNGF8ihZz7GkpBTa3xDW5rT/oLfyVQ5k
Wr2OZ268FfZPyAgHYnrfhmojupPS4c7bT9fQyep3P0sAm6TQxmhLDh/HcsloIn7w1QywGRyesbRw
CFkRbTnhhTS9Tz3pYs5kHbphHY5oF3HNdKgFPrfpF9ei6dL4LlwvQgNlRB6PhdUBL80CJ0UlY2Oz
jIAKPusiSluFH+NvwqsI8VuId34ug+B5VOM2dWXR/jY0as0Va5Fpjpn1G+jG2pzr1FQu2OHR5GAh
6Uw50Yh3H77mYK67fCzQVcHrl0qdOLSZVsz/T3qjRGjAZlIDyFRjewxLNunJl/TGtu1jk1ij7Uzh
PtF4nfZaVnWJowp/gE+Hr21BXA1nj+wBINHA0eufDHd/Y0/MLK+++i3gPTermGBIfadXUj8NGCGe
eIj4fd2b29HwMCvfX78QR4JQM9dkDoD1ZFClV17bxRPtxhwEU8DzzcGlLfKJhj8IxkLoww9hqNul
Md+LwA5kUTLPBBl9irP7Rn3jfftdK1MgrNyomyZUZSI1pisbv0Zn/ru3KD3QZLE17esvHAqCfXAZ
a2vE+o+ZbomB5XkihtQpb/DYrfjAMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDzsU4H
a5ILrftHPFyzk3zNFzZX7qpkPzwl0pEhJRHt0zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjEwMjkxNjQ2NDBaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBt92cnuJk9v6Lrsd3TbnB6WoFML/WpeUAHOmLDOzRE
cchga8wkd8WRWBzcf5AXiBCjRMzYRlMJAll6vOJ4w4nj7e6l3+7EasfefJKe7f2YsSWIjE0weJXJ
XSQZ8BHye0j24Ip4foIwBQnyDVUwLtwKrLeagWFh5KMLvrVTd93znUX+FuZcQl/NJITjPHQkXRf+
j5AUx1LrU73y0UuhUn7cRcOeNGz3iKHO6s8ZDJyPijHYiMnJpEcllumoon6m7jViboCAk+XrT+iV
EI9gdlH0mbdGC/M9YW2zfZrleorCe5hlu66t/DnGAvjhCK+QC0rVMBRsc9GT4KHiF9yPF1Ee
--00000000000087645d065efd6ccb--
