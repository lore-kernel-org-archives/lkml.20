Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773473290AA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989149; cv=none; b=PXqvqO1P+/lP2+TwQxiVBlhmWNG0xo4t9lqj3yWrxPMCFBbaKzIbieDmhmPJdJHMbyrwnVmu7f0pCcCRHu9R5ISXEekuSdOrSqb8GLmJWQlvQ6nBx7jXigv5peVsRbocjuYgJVvOaeMH0OK1DeFs33kweHYMu6WuBLB5FKUgRXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989149; c=relaxed/simple;
	bh=qgP5kK2eb5KfoI8U6h6fGTctmnQlB2W4zjFonYlkdY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDsGSbOqhssETo3BGNsz1anNdGKXVmEzHj0tx+foxMGzNbmPFXNrXWpmQX9WkV7mCRcc8oTfHeBfCIJsQrQVTw8slJbiHceOwNvhCYMg3++JI8HkMaF5cERbHfhBH/71RgR9kNjHIuXF72btqVS7+Rszf8NGVih89wEyJP7xrzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fPflhVcx; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fPflhVcx"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e8662d5e95so7336625ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989148; x=1792593948;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvx+HPexuukw4kdDq7t2crsAHFu7sIKzL+v2+JuaBCE=;
        b=HbMcvq0RtPUkoYyVWqTaB1mAto/ovi564CQ29bYJ2qCj0mxdI8jQ7WsjOY+bX81PBs
         cfoil3hZP3OL92E2QhOy7Em5nDBn4s21cnJvaaIQLcDzondgo3NzmdLB+A6yddk8WpZG
         96Vt1MchcaKQubdDNNlYaqrNCfIijq0ZR5DIYWff+npVwX5fT8sAc+41YesxRUGQH5ly
         rQHdhptM8gT1OQR3mBw3r6JXEjb8gfe7kGpdsbp41Zqv8krX831KBK4ZFNbAM8GHvoKf
         YkMPq6uIDnXgG5f9dCcNG8a3lJQUXq3ZYOqbVHbitJa9EnST9af171nnXWJYuYZ7aUAg
         dbOw==
X-Forwarded-Encrypted: i=1; AKwUvBy/WQTQCcLOtoNhKAmeZo4ri82K4lJ6fTRkE8tGpiMxGDPE9Nx3L/BiWxi+HSFzGToHjKF3mMt0u/3ssRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHjAdfYOJz+ukNZpPFieg6p04LoASQQl2UzKI8VhZWW35V/NjX
	uWSDpYox32BIbesO5kLP6kBWbj81iFrzNJgvgNbP4UP15xhzyrzzU7trmm5L69sI6M3oEFp9Mxs
	iDSGfIo3yeEAFPVM4Tqzng8IplXfhN+IxapMWD5yTzPzh99Z3LmmA1PWP4EfZrONK/qTw8Towag
	M1dopsy4+zpw0MNzUsAzNrz6W+s1pVd5q4u0Ejn8gZ/fc8Hnsd2FSyUwmabTrjfBQPY952liFC3
	BxJ1OIZTYOIX36qEPHy
X-Gm-Gg: AYBFou2jsuyyA5YsOxMp9RjYKCwxsBuK59tfWO/K7y8MmmCGKN93jatbxvGnj8hlKk3
	WPIMxZ96iQ+7jfc1+H2176Bd3AhfWla8qmyqGKmKViFfGRsZzJGZwayTworjOmlEryou3vSYqMt
	5+18p0bFH2f3nOXJdJH8sDjsvd3TB+eAAv5taM2DQelpEg9rW0hJrpQtE62+lwfMOSxMUztROaq
	WXUqTDCI3cxQ/5Fq3Vk8uDbOEux7xE1qe/zPrgh59F/u4l7HAx16iVPDRiTERPKR8j7vR0ue6e1
	sD7dmKI1YIuJ13oedEqLhIqHRFt/OPCVjAPpDr5ktQR5KiKhQcICuoSnf9wX3sNn/TzjsD/8G5m
	zG0GQBj74svM9pO02e9AB/6EclhwX9KzXKoDEiVmVPe2MPgVvaBl2EeYJLevWzbjESOj7ZFb4o4
	2EIxPGUYj3O0+BdDPX19eiVvvXTAJ+2CUkVddoDJM=
X-Received: by 2002:a17:903:94e:b0:2e9:4243:431d with SMTP id d9443c01a7336-2e942434bd5mr16354795ad.30.1791989147027;
        Wed, 14 Oct 2026 07:45:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2e8419ec36fsm5701355ad.2.2026.10.14.07.45.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:45:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2e41c60b42so283558966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791989145; x=1792593945; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvx+HPexuukw4kdDq7t2crsAHFu7sIKzL+v2+JuaBCE=;
        b=fPflhVcxO+L7zTvjzhpyzkhCFABCUit7J2fXwM68nfyug7bgQm6205ycuyq0vtnMeG
         Fs/bzsl0iNj7LineFcjLatOiBM+u+GIDDca14L9AaISQ6pGZPuocxB5Lu9xzOgusQwqV
         taZOTMa1Us5WkhnorP/NBNTs3hmZAcjfqJwPc=
X-Forwarded-Encrypted: i=1; AKwUvByqvAiOe3F/qYRR/cWkmtpo1x0cA24hr8VtzjKCRED0P6JbtXJDNloScrXbEOq5aaq1OKAmST3PpQ5d3Iw=@vger.kernel.org
X-Received: by 2002:a05:6402:a0ca:b0:6b1:c6fa:c45c with SMTP id 4fb4d7f45d1cf-6b1c6fac5femr5974853a12.38.1791989144699;
        Wed, 14 Oct 2026 07:45:44 -0700 (PDT)
X-Received: by 2002:a05:6402:a0ca:b0:6b1:c6fa:c45c with SMTP id
 4fb4d7f45d1cf-6b1c6fac5femr5974839a12.38.1791989143922; Wed, 14 Oct 2026
 07:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911233541.1650895-1-james.quinlan@broadcom.com> <179197952602.38040.4438252459530233972.b4-ty@b4>
In-Reply-To: <179197952602.38040.4438252459530233972.b4-ty@b4>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 14 Oct 2026 10:45:32 -0400
X-Gm-Features: AclHuK9b2HukVChamYvAbAQFqc8oVbXMQj3aiVF5tb5QwJogHH1q1hyVc_gReBw
Message-ID: <CA+-6iNwE935j4wn4BWxs+t1qh3iRtWb0xNjZ-hRS0j-tkLx8=w@mail.gmail.com>
Subject: Re: [PATCH 00/13] PCI: brcmstb: Stop using chip numbers for conditions
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, bcm-kernel-feedback-list@broadcom.com, 
	jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006fc316065dcdfc1e"

--0000000000006fc316065dcdfc1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 8:05=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
>
> On Fri, 11 Sep 2026 19:35:25 -0400, Jim Quinlan wrote:
> > PCI: brcmstb: Stop using chip numbers for conditions
> >
> > Much of the brcmstb PCIe driver code does (essentially) this:
> >
> >         if (pcie->chip =3D=3D 0x1234 || pcie->chip =3D=3D 0x5678) {
> >                 /* ... */
> >         }
> >
> > [...]
>
> Applied, thanks!

Hi Manivannan,

I apologize for not submitting a V2 promptly -- I thought that only
Sashiko was waiting for me :-).
I have a V2 series, where 10 V1 commits are unchanged, 3 are modified,
and 5 are new.
Shall I submit the changed/new commits in a new series since you have
applied V1?

Thanks & regards,
Jim Quinlan
Broadcom CM/STB

PS Despite my delay I am a big fan of Sashiko.

>
> [01/13] PCI: brcmstb: Remove redundant const specifier for struct fields
>         commit: 46edf058e1531ceac70c59b0e69c3ff35b22e3f1
> [02/13] PCI: brcmstb: Use flags u32 instead of bools
>         commit: 17bf3521be9674ecdea6354af3ea2a38ca979ffa
> [03/13] PCI: brcmstb: Add Broadcom quirks macro
>         commit: ac87f644cec7f86681f56e2e07fb5124e622d26d
> [04/13] PCI: brcmstb: Declare and assign quirk OB_WIN_32BIT_ADDR
>         commit: 8f3d8492346ef55e20099eda7d170befcb2ad97d
> [05/13] PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
>         commit: 3c34e04a5ceb9f25453b51943127f3e242318a81
> [06/13] PCI: brcmstb: Declare and assign flag IS_BMIPS
>         commit: 19db283e770e9efbba6fcab0786210e4d870d7c0
> [07/13] PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
>         commit: 11c1752f24e643d7a3281f1add22f6a99d56a64a
> [08/13] PCI: brcmstb: Declare and assign quirk NO_RGR1_TIMER
>         commit: d3e27c1f1c1a3df58495f3cb51ce5ff0e6551256
> [09/13] PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
>         commit: 644c94d347f644acf48801cd8841cea55e730bd9
> [10/13] PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF
>         commit: 1e840300326d6977cce6211e62e94022d569ac73
> [11/13] PCI: brcmstb: Put max_burst_size setting in cfg_data
>         commit: db776dbcfd25fc8e354aa4b3c16bdc4a7c59d99e
> [12/13] PCI: brcmstb: Use order-0 indexing for inbound BAR window array
>         commit: f22f415f21daaeb6d0e6b1537460513d3421d166
> [13/13] PCI: brcmstb: Split up complicated function into two variants
>         commit: f22895a0c371adaa8345dd76616462b868a8f38f
>
> Best regards,
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
>
>

--0000000000006fc316065dcdfc1e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
P6nIShznyqOL2EoCa0IXujxvXUo0pANFYsDhrCVF5JOVPeEL3Y2m+4flRtOI+YlRQoepb+TEVdkY
/g1rlWG7GIYrtHxrFFRvn2/Iqqpv/x5kzJgoTYFOyTTGlXIqGkKTqCWFrN09kJWzhhmxhxtJprJs
KveDLF8yhHSbqmXfKTkT+CIrynXXDro+80qXEXC8CM9W9d+2lDDM+hWTlC6Pt/ikMYf/ZB4K2Nr8
VFruDYGZfAHhh9/lqK3SpS2Z/8cB88K62U+Eb1yNAgMBAAGjggHeMIIB2jAOBgNVHQ8BAf8EBAMC
BaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYB
BQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNV
HSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wQQYDVR0fBDowODA2oDSg
MoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCUGA1Ud
EQQeMByBGmphbWVzLnF1aW5sYW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQiuRLoBkhIaas+1j3yf23P
ffVFcjANBgkqhkiG9w0BAQsFAAOCAgEAp1y0fznw9Uo7UzExANVpYjj+OG1c3C7MhWOvAd7LvfPX
BSFisMaabop5Pyfc/sWzb/jCNfVkkDW5Ij2mzpUsUca2qpILoFhOUT9b0d+nc48MCZ4/Wj6vX5QJ
i9VdYeuv3DYASZsQdH8iYnV5X5YCYo1AO/pyW+M4gG022Nsji9+3A9zkx8JRPDIXkPaDLrzcGD9L
rEVIYnnSK9b/4VHzITVgEmSsUTAIzOD6M6TzgrSoJZFmKNMXlAqo+m1nlNyJkM4OyOvaDx5y+2hA
mp4tzD9gJNU9TzQpQRZFz53+c8BkCpzvcHqT8lMluRlCrIYWqaSOUDHX9HPYvzbtO4iYV+irMdGN
2PBz6Wtfaoi1xTfFSKK9ON1mvxACK+E4B5gycSoZcOBADTbGXLDMqiygl7Wz0oooAPqZpUnaD1nc
x/pX7N8Ff6YK+iN3vVah34vLkE1CMFyDQMtyTCzQPW+7XCTxCL9ML3LBAF+eNAtKpPOsrGIdRHy5
6oQr+2ZquSMvWj447q4v3sk1LHs7ata+sP8/kmcPKn3WPXQ/4xMevqFVyv2VIFrBK9ZnOZ//fz8R
7SjJ7t2kOITvbWcMkizMc33S9hfmYiXaVTjIi89NiO3EXCJouYShpptgGNG6mpYHcddnfdKiILOS
06KlKNuHO4IpRmaGrzcDjsUQQSn8amMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIARU
O5DTL4MBriX6O5pBZJJSVMiAHrbLR8FLZNJHRUl6MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAxNDE0NDU0NVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHNMdszc19c8U9HEWTuw5jOFrA6uj3+VE09DAdC8
GUYMJz41rnfpspJltqwvXh/pGocI0AWZRe4gXaSk0eUL2MYKFRvLbMAiz1GmMnZt1d1JXJXXOlk3
qIjrSqFO/B0invDSgzHHSjx+U3SBbEvxFXqs4WcNWFMyHYAeMOP3l+FhRmImpNzc357y50awdT48
Ol30LjzohWALPJD7e3/UQBpDsHK5l2jxEeQVesErU2TvtbetFgOqBL8dlDoQ23NX+OdnwGT1KOgg
BJT5HWRJsXROUZIL+W5gevl8dwV+uJCnjAElByVb6cKwXxoX5lEfz/flvONu+lo1zCql645kPMs=
--0000000000006fc316065dcdfc1e--
