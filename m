Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DAF46EF64
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857682; cv=none; b=LoOBsIhc0u0aNHLQ9hCs2GVwQboWRPWHOPFFrQDoMZEuAWh1TNcnHiBZnagmUUkp4zZzOLrnSEaSLKLa/ycat5+GlzDMullpCFqgxPgBbC+Mui/H8IMHTV7dQAlZ3nZzWy7vRQgUwbt9qNul5bmqM6XwvPgGgAlCVos9/Iahgh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857682; c=relaxed/simple;
	bh=v/bJiyrCf7+4kPlZEa6UJaQDMIa5G6pQEje23xqcEHY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ADs1HVp/fEQ7KIoBuZ1XGI0t8kNDwyfRUJVc6VgQQ3MRApzVCnNusYFKxlClYBCbriVbUu4ua61rh9QnrkMdArTq1KdwU6fEQAAjCw/H4cmqng5/25tDtynIwBSvN9IFQtefXa02Xj0cdGzDyVSqp1WBoSGZTr4u0r+geQLZZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqaShCAd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqaShCAd"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c315869241fso336849366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791857678; x=1792462478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3jJRpzLKl64v1Zv2perxTA72cfcB4N9Q2Y5ebHZPD4=;
        b=pqaShCAd4v/Aq5Mec0SF9yR/ysueEVDp4VNrPo5Ooqg6pljsuVqLJ+BVDAIk/8OdOI
         IeZfo3lhd6dYwiBRhyReTDYVbyXLfE/GkvYnARZ5MPgh35JBbthzhEdIXG//JnpJtZyB
         kUkl0qb2LTEGS3KIlyx5QOMxe26QB4sOsvK4B5ThBM9s61LdjeC1gGLEwFZMbHNVR4JU
         q13siTnwGqHfIyuwieEyjWav+xNxfEm/N70Q802EDOgQAUORHz76TXMYy9fOAq6zvlSk
         rBTOvWKPuFsBF4CjD0SrprP/6jIPW2o2l5NVgfYB/PIn6uq2YWTbQ5fl7sO+NSjyDuDj
         gUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791857678; x=1792462478;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3jJRpzLKl64v1Zv2perxTA72cfcB4N9Q2Y5ebHZPD4=;
        b=1Nn3j3xnAPit0NJHthdoYHuUoGFr0Y37pFIVAsXiuckgbH2+j4mqKLgmUlfxwFw+9S
         MSiW8jgaSUVR87uwYHqXgDLJd7maCyNyDOhs8aDwjGqC7AstE/wFkrCE3E00KAqaz5L+
         v8y8b9jnczCEYiDsZCnGvpoERql703wOD8DyCjIu+18WhsmP2bRln0aet3e+9dN5p34D
         1UnTb8seuGKPLbZpeF7C7AzsKmha6gXi4uSFLLg2d7/vm0khzHqpKbBahLSYnUDAN5Y5
         Al7AzvqoMqm9Z+IXEqR6DaO/W29TCFcseHcoZpvuGHVqaUbfS0I4CZidvAwQNup0PH4u
         Te6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEpqEajxC9WBdebPHMnqVUOzSmYLH93jXggFh/ZHgqRU1DfYuz6Yn2mTQL5RzLbVQfk6L0ltFu+PgPd/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5E66Y1duz1VVUGl1MXhAEE1QfujXJOfBA8qtPKGvz4buE8Wkr
	H957mK+Bh+W/SSVRpXuKZ1fooaELO52I2pbUwu+HxMlMcdkkLiHTUv4p
X-Gm-Gg: AYBFou1sMDaZ+bEQCEi6eDwV6hIxGrdWkhOdmFUBK3a8ARuBHs8hdBq5nRbaATI6Q1S
	dIpcmBeZuZOben/NgkXuiJy4Mb3EythiFDFJaiBJERSDApjsBBYHjcNO6UqXc8Dhje/8hqn2HdC
	j2RSbZl0hLiu2SwicCgP65RFlDaJ5Xem8dlH/CirkYEdBXNTdOR67ywWi7Al9tS0jj+IKF/L7F8
	FYcfoCNMZQ8YtAZzTrQ7kB0waNPk5AkwMBTmXds1xkRG4g/fcGAJnT4f1ig4OZ8yDeWdolBWaWB
	nM0EuiKz1z7p4X1ieq6jK7+suFR/eIdhvcMSBOnNj1VTjTDY6MowftaZ6Fly4YBBdMXOMkHO5+Y
	oEoPtvGluL66M+Kqxr+xaQnEyVDkZd8RhFFngrrgnLtXOdcRDUbOFivktrKQ+6YkkecDmkLETJy
	J6Rg8JkrPzf/uUb5ZMTE9RHI2L32H7ns3p4LWGP1oZ6RufANR/s9GzctifaFvIFN3w6b55ZYQMd
	0y+hIUYvYlnTRVIVBuaRH+YjQ==
X-Received: by 2002:a17:907:3f1f:b0:c29:3a1b:ec8e with SMTP id a640c23a62f3a-c31a9a04dfcmr1039475066b.3.1791857678022;
        Mon, 12 Oct 2026 19:14:38 -0700 (PDT)
Received: from erwin (109241130011.warszawa.vectranet.pl. [109.241.130.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38050sm526822166b.24.2026.10.12.19.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:14:37 -0700 (PDT)
Sender: =?UTF-8?Q?Micha=C5=82_Nazarewicz?= <mnazarewicz@gmail.com>
From: =?utf-8?Q?Micha=C5=82?= Nazarewicz <mina86@mina86.com>
To: Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH v2] tools: usb: ffs-test: read the descriptor counts
 with unaligned accesses
In-Reply-To: <20261011234707.2475490-1-sashal@kernel.org>
References: <lx+m4kkf9bvbpe7f+l7y+7tc@mina86.com>
 <20261011234707.2475490-1-sashal@kernel.org>
Date: Tue, 13 Oct 2026 04:14:36 +0200
Message-ID: <10ibi+um8lcsadwjotc6p04h@mina86.com>
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

Acked-by: Micha=C5=82 Nazarewicz <mina86@mina86.com>

> ---
> Changes in v2:
> - Take the byte pointer from in->counts instead of computing it from
>   descriptors_v2 (Micha=C5=82 Nazarewicz)
> - Link to v1: https://lore.kernel.org/r/20261011223445.2328181-1-sashal@k=
ernel.org
>
>  tools/usb/ffs-test.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
> index 22b938fbdfb77..4453d810e9412 100644
> --- a/tools/usb/ffs-test.c
> +++ b/tools/usb/ffs-test.c
> @@ -232,7 +232,7 @@ static size_t descs_to_legacy(void **legacy, const vo=
id *descriptors_v2)
>  			const struct usb_functionfs_descs_head_v2 header;
>  			const __le32 counts[];
>  		} __attribute__((packed)) *const in =3D descriptors_v2;
> -		const __le32 *counts =3D in->counts;
> +		const unsigned char *counts =3D (const void *)in->counts;
>  		__u32 flags;
>=20=20
>  		if (le32_to_cpu(in->header.magic) !=3D
> @@ -252,9 +252,9 @@ static size_t descs_to_legacy(void **legacy, const vo=
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
