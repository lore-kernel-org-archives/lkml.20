Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693746AED1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760198; cv=none; b=UcG+KlEUC5A1nD72gWasVK7amXo3kQfAoqGa9vvztp3KZnfs+H4HI7srdrJPmzaQWLW0495PVknV54i4s0oCR1Eko8+RPlY0Ry/DfKNx7d1Jv23gO6VGgmB/Svwe8D5Sofwnjhz1KlMsmPEqxJlqV7bPWsPQ0Vv3LHgGszT8kFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760198; c=relaxed/simple;
	bh=0kQ3OMu2pmqnXOygeK3HCrZtn91nnTMTphSQNfzrQh8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qUIgzS8IJxasvwCEpQ4HuyzTl+YUDNLIRUusXS+SMGsbGdsrB+dC5LSSkZjh6BhyMkYsDr/EtH8B0qEO39JM4Jb8JIPgRYHau6Faxo6MzNArwgXDk56lcBdVIoZfJY9rxpe7iXucIDOJl7p7xtm+f/c76MsDvRrfglqoc4gid2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEe7RFDm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEe7RFDm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2055573c8cso155450566b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791760193; x=1792364993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1C+/UfWRH1aZTh2lowaNCBV8nzSL83fUW+4TYxeBx0I=;
        b=qEe7RFDmBwp5spyjPnp6TjCHlRXxbqzWovVx1TlT6ioa/XRpyjh39Nel1CZyC2yL/d
         jcyfdm4Y2p6DSEp+UbYP1yLWMnbmv8urjVMYOP9vlwzUbaXvpmfYpPtqpEHw3/SPkWpl
         fZiPVRqbX0klRYDHCcMn3+MzPxvzn9hL28jNWiQ6524jtHLXjq41KvjAn7ZBb3pGY8pY
         9LMAHzDOWbbIHa3HEaiLzJNmAXXCrMlagOBmtKlP3QRH4y4AgmEioSEyBqlC1ofcBAIM
         x0RwdJhqrXMoqlkDd9bJPes/rhmwGQS77sfRQgO1V4byqS7twxjtrWZZ2ahOKCNR8DPL
         nxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760193; x=1792364993;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C+/UfWRH1aZTh2lowaNCBV8nzSL83fUW+4TYxeBx0I=;
        b=G7GoRWItk96PBYWx6xJ3BIKpAM2H9nhxe0y15kdIZOL82SdI0dHt2oixE5OKeEjGGl
         uNPptzqR+oUKNWAc2njGYqQiRi2qtL7bED06ecGastU+VsPGyU7pnPHEDnYTVoF2HooU
         vqvSPyONnuBPKYYgS7Alvq+vH4GT1J5afAi7Qgnuzxb4BeIU5KHof8hjvHiVpt9dTGJT
         kyKW0fDrOITfz1RC4acbDWT17LAGFoi0UM+aeeRxFOCoMcXR9ByRFaOO6UJ5GotMbOji
         CUjmQ1rwhdmgnd7yPbYy56b1NIGzvywcQbknoYzY49j6f2LKz4WtHvF9KNsXRy52cWtJ
         90Uw==
X-Forwarded-Encrypted: i=1; AKwUvByE0GkbicfyLDJEPVnMOc5s0BCyy6M8drh1xTBKBoaQXYpUi2wn7sD+kMaW3JgWdwWKDMR7D+BlRuCSoIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+hCDhi/IUBDZDYcFvQ5BaZsQGjxO5RKV09Sm1tSRSsYGol+ol
	wFMWnx9tTa3sCuxqtINSFIKsoUBNS3YSDMJBpwcr4bCYR3dpF+qsSrJ5
X-Gm-Gg: AYBFou2Yu4mDWljB0I7YmXd6o0p6dZIIO4QmgegyWHVZyHuq4zheWCAuonVQrKQlwzm
	Eg08iPUPp1bOt1fRpxoA2WQnqvriZ79RmBWuPuRDYoxqCX8URzbY9cQ76/fVK/sJH8VEXvgIYld
	ojFYOiJWIdYb56kMl7LjUR7hNwcpZKvcLVlicBLxYz+sCqocaig6MSmcw8/wmZUrX7YPHN1tyIP
	AF3ECdyxn10k+/dynmpX3Qj63QnyIlSHYjJPUCjb70GoxSG6N0QAX00m2HvIpuFyxPqbTsEbYQR
	xMlET5RB2LDFLeYPIpDIiHYAXfpx98L8nYgoX8gLBbCd2ABNvgCIcH32Gf1smQtPe2VSjUeUyAf
	YmDJhcRJ0uJ0+kqQELypSASC0OSyXUMKM/FKkPd17chcSq3ptty/C9U7zypPtwXq1qzb81IIn7q
	n09dREOAscw+9bgZwYhAId88A70fA0hwhb24P5EhgHDpsUbT8W5CTg1YpobWSMrPJHSd8YKIHSA
	9rpoTTpA+oCc/31hYTzVaRJ
X-Received: by 2002:a17:907:3f05:b0:c29:9691:ec9d with SMTP id a640c23a62f3a-c31a9d10c75mr867705666b.22.1791760193492;
        Sun, 11 Oct 2026 16:09:53 -0700 (PDT)
Received: from erwin (109241130011.warszawa.vectranet.pl. [109.241.130.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm406369866b.70.2026.10.11.16.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:09:53 -0700 (PDT)
Sender: =?UTF-8?Q?Micha=C5=82_Nazarewicz?= <mnazarewicz@gmail.com>
From: =?utf-8?Q?Micha=C5=82?= Nazarewicz <mina86@mina86.com>
To: Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH] tools: usb: ffs-test: read the descriptor counts with
 unaligned accesses
In-Reply-To: <20261011223445.2328181-1-sashal@kernel.org>
References: <20261011223445.2328181-1-sashal@kernel.org>
Date: Mon, 12 Oct 2026 01:09:52 +0200
Message-ID: <lx+m4kkf9bvbpe7f+l7y+7tc@mina86.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11 2026, Sasha Levin wrote:
> descs_to_legacy() reads the descriptor counts through a __le32 pointer
> taken from a member of a packed struct, which may be unaligned:
>
>   ffs-test.c:235:40: warning: taking address of packed member of 'struct =
<anonymous>' may result in an unaligned pointer value [-Waddress-of-packed-=
member]
>
> Walk the counts with a byte pointer and get_unaligned_le32().
>
> Fixes: b9a4274699c69 ("tools: ffs-test: add compatibility code for old ke=
rnels")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/usb/ffs-test.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
> index 22b938fbdfb77..f08060459b3f1 100644
> --- a/tools/usb/ffs-test.c
> +++ b/tools/usb/ffs-test.c
> @@ -232,7 +232,8 @@ static size_t descs_to_legacy(void **legacy, const vo=
id *descriptors_v2)
>  			const struct usb_functionfs_descs_head_v2 header;
>  			const __le32 counts[];
>  		} __attribute__((packed)) *const in =3D descriptors_v2;
> -		const __le32 *counts =3D in->counts;
> +		const unsigned char *counts =3D
> +			(const unsigned char *)descriptors_v2 + sizeof(in->header);

Why not:

+		const unsigned char *counts =3D (const void*)in->counts;

Or maybe change the structure to `const unsigned char counts[4][]` and
the variable `const unsigned char (*counts)[4]`?

>  		__u32 flags;
>=20=20
>  		if (le32_to_cpu(in->header.magic) !=3D
> @@ -252,9 +253,9 @@ static size_t descs_to_legacy(void **legacy, const vo=
id *descriptors_v2)
>  				break;			\
>  			if (length < 4)			\
>  				return 0;		\
> -			ret =3D le32_to_cpu(*counts);	\
> +			ret =3D get_unaligned_le32(counts); \
>  			length -=3D 4;			\
> -			++counts;			\
> +			counts +=3D 4;			\
>  		} while (0)
>=20=20
>  		GET_NEXT_COUNT_IF_FLAG(fs_count, FUNCTIONFS_HAS_FS_DESC);

--=20
Best regards
=E3=83=9F=E3=83=8F=E3=82=A6 =E2=80=9C=F0=9D=93=B6=F0=9D=93=B2=F0=9D=93=B7=
=F0=9D=93=AA86=E2=80=9D =E3=83=8A=E3=82=B6=E3=83=AC=E3=83=B4=E3=82=A3=E3=83=
=84
=C2=ABIf at first you don=E2=80=99t succeed, give up skydiving=C2=BB
