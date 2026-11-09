Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235065;
	b=TEmB/nWA7yQfw9nrwtS9TsA763u7o/lI2qK5mCpzbZ5sWS8AvNVVL7/aU2YLCc0TRBKU
	 FHYP/2GH6nqiiJBufI99SxqAcfobQiY3J1r9nTWWpVkEnYBLt/uhNurCZNS6ggEybE7fO
	 nGjrKrwiUX+ntFVp98WorR92TiDTKlmsXV4NzRmWSsm9gkpNqdLKrJRoefdYMDAqiSbWs
	 1wCQ9L1y5ASHUNbg8Hx3FPUfEvGq95hBlmr18Rw9Pb32tbohk7oPtp2XkCMqeAV1F3jy6
	 rOvNBGfA8W6NTb3dcg7pViXc5/aQykpTtr1SUJGdqMNAlL/yLQylBd2Zy2OOUu+EBMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235065;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=BglDF8oZim/sb747jbET/HoyeA7xLwKBU+DGm81LXms=;
	b=DHx3YgyetazYjqzbXzBg3NQ+XVtcLbcYUhJjgpoqpDnfLHeFhq6CGFwUBe5sryJi22pw
	 Qvq9/DeUC39DQfi8dXaEdy8GDRSw5w8oVGCW0Vkrbh24dkjkk9nT+DMHzrLYB7f9bJS27
	 7UxspcTtBeuhnsrB5la0UfiRHhvaJ8CmM11GalYrRovQOvkp+1EZeTClXnJmaKucToTex
	 lEmWSVLf2d/d3H9u2aBQQJ2Fo8rsoh6QEUtqPrqkTaKKBvG56aRIYuHv8vLu1nSjThISL
	 RWpikGSE17u9xWKznudOyOoNBmCytFv8MdtpocpLJzDSkDOCV/ays7SYDB4uoA9tr4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Op3lWPaz;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36EF606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Op3lWPaz
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so334165a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235064; x=1794839864;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BglDF8oZim/sb747jbET/HoyeA7xLwKBU+DGm81LXms=;
        b=1J2PYtt/GU7l66R5yhyakJq7gCA6P0LHqjTbwJXh9+r5KEKEMM5Kjojtxk//1KuF+A
         LS8M0xOrAVLDIbWgKjKoUMP/YhNfEAkkwEmWI2xWomdUZAj/dZP9jaqA4rw2GF5fHglW
         QYkz4QZV8trOsbW3dANzYf3Urel1pIxx+0lk7dZjZm5nkoczUcrTzZwOetu8ELzapwGE
         PK7icn2v8PMVonlpVeGJyJsuFBv81JX5NVdibxy9cjduQhHoWMVGaBdvmGx58dA2YIEE
         ZYEXz2A1qDS+Ls5BTrXPABhz/oOsM8HY96cBfH2qtRn1ogMiZTnP0Aon9QzzBZeqGogJ
         bs8w==
X-Forwarded-Encrypted: i=1; AL+hErF/cOoZUkqjOgZ6eabA5AfCcIgKT91IwbauaYVP9WvH+BHVIZaQOsSBeYnAhzlf8iWV9fJ4BuAMGCifapQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sYDtTaEQrGwU6edcRw0FSmqSLMGm0SsfrJ3Oc/zHjFcyw2Pgo
	b2oBphX46uIAax2/9KE6zuSWH+Hu9uGC/oYH2nf+PBjVIB2Mi+QwAeEIIF1fWUyGi962wheXJGA
	ppMXCmNjVqK6on5W81nGxh3cnk9U4Bv8hUOoF9t+R4QZQKTaPEp30IjuKFcmx39kzz/TmIhxoEM
	emuRsJ+NyllBMZXAmT7I9hpoDmk3TyD3+ZHvqTCzXu2Lzodl8EC3jI8GuayHcQx71W7Dz8Zn6sQ
	F7AE43P7DoIHzSAs2Q=
X-Gm-Gg: AYBFou1VP1/tDrjgzp64ugtpHBR0kN4gNB4vbnR+LNE3qf6gusL+EUEdaozElIs5V1c
	M4MjKt2HhZmPFTXNyd8OJgrd647St9C1qzMr/2oyYuhXZSc6fZzIN4rpzhJvBc8h0xenCbZzwDR
	p4ZkJt6nO/byRSLRgkcDcCq4Ag+Mth8DFwGXYNTVxC+SHG8FiqTkwSK7fUMEC1f0XKJamptMbxb
	wio5pkHvu+PnvOow9gshN0psrdlOsIsZ9VPcr0YB9s1NsIQv69F7KAdS/Zj7+47QeLtdsf9LjhW
	SzG72N4w8nUpPcAEa8XPyiylPAXk/Z8SIBrVGCK5QibFq4Vf7035s0AYw6aQr0LCIUMydPgGSB/
	zQ31VWb185u8g2ceqm+CiqyPuRIIL2LmuXZLdcTb7ztABpjsesUXmNYSm3/Iqyod1/p0JDl6zo/
	2OfJii2LxAJKkZuQjou/zjj6vHzqPHdJUW3V0=
X-Received: by 2002:a17:90a:d2c8:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b12d0e74aamr3634379a91.7.1794235063901;
        Mon, 09 Nov 2026 06:37:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1278f06b5sm3611586a91.6.2026.11.09.06.37.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:37:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b56a350f2aso1245729a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794235061; x=1794839861; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BglDF8oZim/sb747jbET/HoyeA7xLwKBU+DGm81LXms=;
        b=Op3lWPazPqj1XyDGreXk8JtEzpjScO0pZXKiGdqQa0weAed2LgVp1qpZ3hI1KsfK1A
         RLytgKcNBaP11iskUwHP0qL4Sc3pqsYBm4hplkqMfM1ykPhQqUrxfK9G1zTPjNSM/PHj
         IOTEK9fHlqaQyLwgbrKVoEyV9+DpR68WOlAuk=
X-Forwarded-Encrypted: i=1; AL+hErFNayh/q7kvbu7wEWE0iuFBEWJgqoFM5NEOeq4kH/ADkSRG3W7o7cMs5jiQhugiQ3E9o6e0O2R+wQCYTZo=@vger.kernel.org
X-Received: by 2002:a05:6402:449b:b0:6b4:21f6:ff48 with SMTP id 4fb4d7f45d1cf-6b722375ae3mr2770577a12.3.1794235061547;
        Mon, 09 Nov 2026 06:37:41 -0800 (PST)
X-Received: by 2002:a05:6402:449b:b0:6b4:21f6:ff48 with SMTP id
 4fb4d7f45d1cf-6b722375ae3mr2770557a12.3.1794235061058; Mon, 09 Nov 2026
 06:37:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <TIlHjNE2soPd4hqQEaUjl54m4NFcW_adHswMv3pH_yaDdgd7LS0NoMFDR0Db1Uh39Ijcz3vUPreYR6OQTCFavkEKMuOCGYe1oMuyODuMo9o=@proton.me>
In-Reply-To: <TIlHjNE2soPd4hqQEaUjl54m4NFcW_adHswMv3pH_yaDdgd7LS0NoMFDR0Db1Uh39Ijcz3vUPreYR6OQTCFavkEKMuOCGYe1oMuyODuMo9o=@proton.me>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Mon, 9 Nov 2026 20:07:26 +0530
X-Gm-Features: AclHuK9qpHDdFM4Kocqp6X39KLZDmKIw6T9AtC3800V71thocPNKs5c4gsSCeN8
Message-ID: <CALs4sv0WkEOpZ0gdYpRwm9p06kCeyYBrcgD5e5Due2qz6NU2Xw@mail.gmail.com>
Subject: Re: [PATCH] net: bnxt: validate HWRM response length
To: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "michael.chan@broadcom.com" <michael.chan@broadcom.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000821d75065fd8e718"

--000000000000821d75065fd8e718
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:23=E2=80=AFAM Noah Weinberger
<NoahWeinberger2003@proton.me> wrote:
>
> Hello,
>
> Both HWRM completion paths compute the address of the valid bit
> from the firmware-provided response length without bounding it to the
> response area:
>
>     len =3D le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>     valid =3D ((u8 *)ctx->resp) + len - 1;
>     ...
>     if (*valid)   /* poll */
>     ...
>     *valid =3D 0;   /* zero for compatibility */
>
> The response area is the last PAGE_SIZE of the 2*PAGE_SIZE DMA
> allocation (BNXT_HWRM_RESP_RESERVED). Firmware that reports a
> resp_len above PAGE_SIZE (the field is u16, so up to 65535) makes the
> poll read and the *valid =3D 0 write land up to ~61 KB past the
> allocation, on every command. Lengths below the response header size
> are also accepted today.
>
> The patch rejects both cases before the pointer arithmetic, on the
> interrupt path and the polling path.

Its the FW's responsibility to properly write the response that fits
in the provided buffer and we must expect FW will do it.
IMO this patch is not necessary.

--000000000000821d75065fd8e718
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAwKIjV
xXw3mvc5RDCqqB3YBHoA1Dxn/3oBQuK+wrmGyTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMDkxNDM3NDFaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQB2bNvr2g5T4za0hIJya8ac2ne/tXVGdGWile0posvt
N7pNuNoq8tVXsWwPySrStKCc8TXRe+j27SoT6OHVu+oQpqKUO2Ho4HHb8V/cukkxdf494G8sZG9A
kmWCn/vZg/uMqNER0gPYrmTm1NitfWS2JmxgPWYf83+PMMyC8iUiHEzoPdHjpL8KlpT68WU2xZfv
aaCAHinr+AjYrjgy0Wk8zI6R9n5sgdV3therhFV6cmY9BkGKAh6qaFY7AdtNNr6U4rhahTG7TTvR
As7B4mx2XnJoGRtUyIFRLeuvImSpSa8x76WLfKLvAcS9vfAKrtVUNdwLMxffETGvvH7PqoWY
--000000000000821d75065fd8e718--
