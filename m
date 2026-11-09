Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234507;
	b=b3zbHD9F0PqSuD64jttnQRuJtCqaQUeiaG59ueLHQe8EbeEr13OV8lOsFW0LZKy3yb1A
	 kvlcEmzARYURsgIhX9MUXlhPzREw3w/dObJ8Sugskjvn2iLkRgSEpQxDwIzfwUa6o5xcA
	 4eK8Kf9ja0kPpEIFY8u99ghrKH0IWVAQHrgwevfODFMYeB5Mq+E68NLxBX5MEb7GqazYn
	 wtdwq+VBF73JO90KBTKzfr3Je9ZjocTdzRbHGLVbS62C5mBYqCkVr4ZQZCgUwstKbFjZK
	 GEl5qb3y2uOJyy0fHnALWvzm/Y5c+kMtJZ10w0xHyjUqZ2pXGiV0q5O7QkVKbYvyM1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234507;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=JU5cr+KEPXa44cpZ0SWeNAa/ebugOslm0k377/gQv1A=;
	b=JMr5K735NrK3CL1sv7b9mynoBD3FoRv5XJKE0g/h19IiZ0rZW2jKisA6ld+m473KIvMR
	 DaDyMHr+winwiQJBAK5l8J/1hUO7OdDeXJ8giDJiE4+xcMsUnCIJXK4l7kk0LBmNyETuw
	 ZYl/r2V1ppjLuzcR2Ts9oulgv/uG2H92vdXeW3k7KVvbUZTGmDswVJ8hVf6RYkoeyHXp5
	 iiDnSGw7Z2/Bak/TqukOVAKds9AkC10+f9SQv0K61ETSjJyFB6CsS5skd1qr1fs+DNRkZ
	 BdP198xW0hpL6OcFIkWY0m0270HGbJMKTuBrzDJ2YUnzSQn1rusTFsgbgzU5T9gyPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="YyPh4/ST";
	arc=none smtp.remote-ip=74.125.82.99
Received: from mail-dl1-f99.google.com (mail-dl1-f99.google.com [74.125.82.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F0606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YyPh4/ST
Received: by mail-dl1-f99.google.com with SMTP id a92af1059eb24-1b3acec6677so1189233c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234506; x=1794839306;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JU5cr+KEPXa44cpZ0SWeNAa/ebugOslm0k377/gQv1A=;
        b=vKJ8MTMUytWYMsMui3B6hse55aCAl8YQ6Mxzg8YSOe3q2um8cUxkNAFOAyHctrGUBO
         2ZEQumbvai0vwDbtHD5Vtw8V1JuLiAMjRQb/WQt590oyh9NMC78MdvFyTsF8xSYFXCM9
         uJyRAI3maaOFGfTeWnQsp2qsAfsEEk/Tsiihq5WqjwQtkRgH7ieN0iJY3wyKpJKPDtsA
         rw64yEjY9g6iP5H9ZyCUQcLSmifo4Cg0bffMUm29e/TZ92AUBujgb3dqZdvBUoVhRyAp
         lT176yxDely8j80AbaX6fss+rZ29Cw7nFdTh8XKgYjNEk0ysP1nhKcdRY+/CACf+RlS3
         qCuw==
X-Forwarded-Encrypted: i=1; AL+hErF2BsadoGbTq2Vtm7V9C9czt1rrWJODfPv0U926UjBaq1vS3I/IeKYuzRGlakohrKt6p13NWOPQ1UqJmjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mKKvS1CE+lSTmeiRxpiSrztAAi6YdTAd8ZWQbakY4I9naDRkW
	V6RobZV+pcqtiApKCTaLJuANgbZZFXLXNbIxKZNSaBifLkL4O3QX8+FiC3nIc1U/CgvMORZtv2v
	gQ9kgAziixX6GrcVdfNHIHwcy+ggjhqibHecrZUvAAdBFdedgthqYw1elG8tEDXzXf2QjypcOmW
	1WaqXtQc/OWzvNzBDjHgzwhTGSdJQhSBnO3N9qg6FxED2j0hC71A8rZHmwFNR7EISd4rlhz7ErG
	cwwLio5qGr92J97S9M=
X-Gm-Gg: AYBFou0kJMrbnOw2nQSqHnS8802VbZQaUuoPeh9I/JPjISyV1/gA4MRICfFELVTnA4J
	jHk9/bE6VxaVJnq2w7MOodVJCUmTEewp2VvTh3qCikPx82Ljzn00Mwq5SI5BHWUFCEP2HkbFc29
	y5I4yBsYv5C2yKPeOt1MerKVSARHwYGcNsCY5jwgurzOwOCODM/Is1Bn/zwH1VLqYlkC02b+E3L
	j1q3d69hUw4XY/EiDWeCJv+ekvQ6xTivJ2i5OdwsTLa5a5U6mmtHhYutVLRXqx0v+2MUdeOnWha
	9qPor8iBtYRRBVFpnqcfsV31es0CBHMNWpbosOAE1F+PvO1oNpX1eJvv+3B8vbmL4/2rAdn4Yie
	JKKld0mgE2lb7aWe9MB7StN4/comSFUhmIE3vYq5xPXLc3sdabh6szKvgKAy4RM/M3fsUKbQlkx
	IblgK6tydJWC4Vqgw/3Vfjs1VeNqn3Mq2oDAc=
X-Received: by 2002:a05:7022:3b81:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b39fe2fcefmr7694527c88.6.1794234505782;
        Mon, 09 Nov 2026 06:28:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1b3932414ffsm48218c88.7.2026.11.09.06.28.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:28:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4d34d6082fso92824166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794234503; x=1794839303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU5cr+KEPXa44cpZ0SWeNAa/ebugOslm0k377/gQv1A=;
        b=YyPh4/STXHXtCkbcsm7K/GS6gO3GGmOX9ePIFdBygotSEHM+bLebcgzVz5LrLyXBvg
         ZJG+J1beyqamuxBdRmb/UlZ6O4F3bUZ8K4pWVq54ksmv6MS/abTZ+nY4zdEjYw6yLEcQ
         NEw33MmjpZATn1CLBSBfFnaE1n8c4I28xJCwU=
X-Forwarded-Encrypted: i=1; AL+hErHNDrqSRNLrB9v7itOLgX7K+jfcENPHpeIKtzTWXTcmKqPpk/JIONEsunl3U+RrqWkq7OH+lI/mQWUiehk=@vger.kernel.org
X-Received: by 2002:a05:6402:ea7:b0:6b7:417:1037 with SMTP id 4fb4d7f45d1cf-6b722443b22mr2365032a12.24.1794234502922;
        Mon, 09 Nov 2026 06:28:22 -0800 (PST)
X-Received: by 2002:a05:6402:ea7:b0:6b7:417:1037 with SMTP id
 4fb4d7f45d1cf-6b722443b22mr2365009a12.24.1794234501960; Mon, 09 Nov 2026
 06:28:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <w1AJ7wCLHvuqCakfZ0kTc_L-W4jMRfvRL-1b2ivJckwUDD60O40hiI9-wk9mj0mQlyPqT4iHIMjFqDDn7vbW4UGMxln2gEYTtGR2ieyVxrc=@proton.me>
In-Reply-To: <w1AJ7wCLHvuqCakfZ0kTc_L-W4jMRfvRL-1b2ivJckwUDD60O40hiI9-wk9mj0mQlyPqT4iHIMjFqDDn7vbW4UGMxln2gEYTtGR2ieyVxrc=@proton.me>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Mon, 9 Nov 2026 19:58:04 +0530
X-Gm-Features: AclHuK__jcEG0zOCWVPj61HfxfVL9UcJqe12Easwo7UUos3GZBBoWtLXX3kX3Qg
Message-ID: <CALs4sv3umsBcXEw+3L7rt+gjvPe9B_-BkpAA5E9vsvP4jxSvkA@mail.gmail.com>
Subject: Re: [PATCH] net: bnxt: size agg_id_tbl for the full 12-bit agg_id
To: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "michael.chan@broadcom.com" <michael.chan@broadcom.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003f064d065fd8c62a"

--0000000000003f064d065fd8c62a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:23=E2=80=AFAM Noah Weinberger
<NoahWeinberger2003@proton.me> wrote:
>
> Hello,
>
> On P5-generation devices the TPA aggregation ID is a 12-bit field
> (masks RX_TPA_START_CMP_AGG_ID_P5 / RX_TPA_END_CMP_AGG_ID_P5 /
> RX_AGG_CMP_AGG_ID, all 0x0fff), but the per-ring mapping table is
> sized for 10 bits:
>
>     u16 agg_id_tbl[1024];
>
>     static u16 bnxt_alloc_agg_idx(..., u16 agg_id)
>     {
>         u16 idx =3D agg_id & (bp->max_tpa_roundup_size - 1);
>         ...
>         __set_bit(idx, map->agg_idx_bmap);
>         map->agg_id_tbl[agg_id] =3D idx;   /* unmasked agg_id */
>
>     static u16 bnxt_lookup_agg_idx(struct bnxt_rx_ring_info *rxr, u16 agg=
_id)
>     {
>         return map->agg_id_tbl[agg_id]; /* unmasked agg_id */
>
> Any agg_id >=3D 1024 writes a u16 out of bounds (into the trailing
> agg_idx_bmap and the adjacent heap) and the lookup reads an
> out-of-bounds u16 whose value is then used as the index into
> rxr->rx_tpa[]. Pre-P5 parts use a 7-bit field and cannot reach it.
>

This fix is not necessary because the patch assumes the agg_id can use
every value its 12-bit field can hold, but the HW never issues IDs
beyond 1023.

--0000000000003f064d065fd8c62a
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCB2pHdG
Qf4Mrbop7PSoxhHPjqU9JTQ3vxprFLJVzKPlYDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMDkxNDI4MjNaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCtFlaonz0ztYzKVkfjJRPdqVM1xsir/xV+EpH9gyEa
+WOeUCQqeu3GrNMh2oJ3KLRqND7zUgMVBHZnRQlBDsX/nbTHdM22U3tFfYlwk8NTE84g1baO7fZ3
ZSGQncZG3wTlmzGavhI3uP/efKJphKl87h6sNRCr6CjwEOeOloWCPYyXok31KtiEIXFSWeZbEiDY
024wdNliK+e09yoEDarceCqiKSN5pDZxa7bQB8BmGikqAFtouvAI7JgzfrdSqwzzpUXhhr+T+KSq
V/2pJrfMzgeL1aCspjH3zVPvRI83YpdUx4G0ITYm1nJ2qPqDhICWXO3O73bobGb1Ty52VkE0
--0000000000003f064d065fd8c62a--
