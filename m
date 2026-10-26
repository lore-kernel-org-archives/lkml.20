Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793005367;
	b=x7EhnfRNSAy03/DhxwSBswEumGIKC9mPW5dEcHDrshlePbCjUUlw/MIUd6GgNKSCVy80
	 9lX3RI+DyIVExx7+UJvHbU6M1sVo+lxILD69tFyR1bnTbWWBcHBr/oRsXh+gP4YDVTDzR
	 pYYa1/2MYvMu7rf1txueXcz/NAZ2OX/QU/ijMp335AWY7U6o7nJH4QvTjFJCN/CBFwrYA
	 1E++Rsz3ysr+Hf2cKDHFziu/G5SEcE2USGbEKYyTwTBF2Yt8evLb1OlUVe/OmYQZw1Cka
	 1N8bdRk6MP7xBNs8jZHB6jZEBrX24fs531bGAmowbIMFoRcCiBccNzshCGFocxebh2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g4ANt8QiPje/vd+XmOCfwQ8O8188yDlc5I5mBp2AsQY=;
	b=0v8xrD/C5TurMqxLbPgcv9ETH8gfgIk1nFRCGDCaJo2QK+i2TbrRKn0krg2KwwwXkwkz
	 PmjBbBHS2J1n3yI/NMyznQ91FGgZxvoGWv24pqe8bdsrpK+4sU0G5PnzUXW++G8QBckGk
	 HY6WXSbVGnpdUK39G8DFDE+EYow4q9mqPOZ58xKAYETyZD4f+9GneXrbIcHfeYPdtAE/C
	 FIfVsqwbxYqR2ZQ6usnG3JgXqGvyHqqvbraBkK0lo2XfsJ4t4E8gQt+0eOiWddGoPAfJq
	 bBZ17aPzPnXLZJI4OvKSkXTNQz2a0V+wc1qGL5H890bXLRnpE3zzukM8d9tKBfTrqtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qLZsAbGj;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B58606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qLZsAbGj
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3922254a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793005365; cv=none;
        d=google.com; s=arc-20260327;
        b=QYVaWKdOuYikc8mjLuN58JFPRlZyD+Qddf7/vOtw9QLShXqKjUUEDaJGaXqoTdo+Zy
         MmpnNXXP+aFX8r0Fng11igbLMqazxbVUFPge32OWpd8OpC1/pTdzKMRn/sAKoFZrf/og
         OJAqVL4rTOzdpRErx97GDKcPUNaQ3jfHULnX7pbZcrW2ZiKzVUt7k9pWpLTFptKJ78xA
         WSnvN0eVzbiDy8wYGJhWQe+6An1YcKGkCEgQ7i8lWrc0J4XZRPQ7mmYFeQl5aeOZDigU
         49Ta3Cyhqm+H+Z0iR9QqquSGj1T5fVDX0y633/kfotW2WKDziXKJJcdgsjwaDpqTzKoW
         8ELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4ANt8QiPje/vd+XmOCfwQ8O8188yDlc5I5mBp2AsQY=;
        fh=Uy1sWpKVGdO96KYSxUpdUXxmi5S/6iJnOfpdPKte+CE=;
        b=Yk2nHsCrsW2GIOfIRdpAdUA80zljSnyeYI/Nz8mMZwjil77iDBFzukjn880luMBmCE
         ZyiDMsZXEVAIzpYW6gl0vQkgS+qQZcR8mtLIfHTkZbwvPL1Q/F1yxm2r9YduYGkNHb70
         93tyagB7VWO7vAW8a6/KdqH1i8CGJjE/CHtcG2FlkrAgKibYDBdx1BoOrfa/SmkOwKta
         r84XlG1JHVyWgCkL6eT5d5M6ndDqcxc43LQ3sV5mNLiqFGZWJQnHG+Ch0Lr9+VVbleyq
         aFTP7NW7Yj8KSthKXPPKg8hwg9y5IIPqUV+p+Ufd/KG7j1NBdg52IrK0DVSGfucTZ9Gt
         zCVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793005365; x=1793610165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4ANt8QiPje/vd+XmOCfwQ8O8188yDlc5I5mBp2AsQY=;
        b=qLZsAbGjyhOdJYoX4EsSnYS4ZxHYKYOA5sWs+jPhLE8FVmdXf2M5MlK6AoPKeVw0EC
         IFKRqq3vpCOpcybm9W8p1utbSK78D+GC7CKCDRA7EzPslPZda9G4Hx+aUNowG5n9m5HH
         Q7zI0oz7lBoS+j8xPojdDeBhv5h4sNXUM2hnlQVTcSFrGFS9L4vZscL1pUk5xM4TGx+Q
         IshB5L7JTrlqlJsEkQ3vmOcc3EmCW2eFVJwkM9CUTM7ldURZC0zw8XuiLgqPiRLSt9P2
         GxnWMgavOQuFtwmggQY/pXnr3BrFQ+IyKQZf1tTCSMvUOPrN/ZKbUxJ70XDEAIaa+era
         wW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005365; x=1793610165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4ANt8QiPje/vd+XmOCfwQ8O8188yDlc5I5mBp2AsQY=;
        b=qxIIxbSFPB7e267t/o5WCfKnllo4IUUt46TOjKz0Wy+2o9EZSVRp4M5b+tH+b73fI3
         +p9PcEBT6LiLID0oN0hbXb8RDoZ0D/Gb4ARXuZeUhNND4h7jOrcRGlerqBVcwZyxa3TD
         Rou38ewH6b38JcJzbCIWmkADRFEKzOp/+f/EPgGx4DBOBe6MFc2JnBQ7HSGkD35wJ5Ht
         IaaIrX+LitpMvx6T3GdrHAd2rVs1q4eNMCkl+0NfFu2nRfWZCN45IlHDaVLv7tmgjsUb
         b1niam/v5Vd8OQeCABFUZWH17C639e6EpGBnAWdR3TsEtBEcA1iJUNP4emaCZFnt/NXW
         iF6w==
X-Forwarded-Encrypted: i=1; AKwUvBxoeHa1FQfMSnV09+hRJR6rh7il+w9q038nTv17o2IvStmVR6z7sLDuCCEmjywmSU9kbaOJNR0HPPVWIEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBwqq6fPw3ndNd2fGpTOsGX/6DPrkaRWDolPubmbmgc/lkp7QM
	llT1WybFTaSMMPaZCRl9IofFrq+4FF6WM6dhVbrrtV7ZallFVnoTTOOnUf7NoD5rsPkL1vPAb9B
	NwAnwxt2bLKix4N2uKXjmFrdeUPd4aA0=
X-Gm-Gg: AYBFou0YbuVR8OezLqdEf+U8O3WWr5MtoEufBE4czboc5VWrNF/R9nylUyR//uspGuB
	ZrfTJ1oO3oSedgVyAB1OMXiyYwiNQC/PbvGRziiHbY1DzvUFxlm0Y60NQ1i8ScFfAUZKVsWhpSr
	EzxFZWn//ZGA71C2Ad8CEzPfu+JSUzWgzncZxUSlRkTCciN3diz984tiWr1O9F2AEh1gJ3+YUP3
	vEksiWHQ3bbE+f88SWhrl7Q0iXoLbbf1HoDw8gBcH0JcKOyNsf3jyp5fdIYEZG2KGyWQ7164IYl
	ia3RYFUr49e4HbjeCmEzpEXiE6hQPjZ/a5rBGtlkzNRQC5hZxUuC4/O8hE7CnvDilJUCg99ZXC8
	SWXC6QpMIRmToywqIqcDtbLD0Ryq33I7zbKuRMjDdhHKzGyvl6YN8qg4QLju42U7jorAb2g==
X-Received: by 2002:a05:6402:4410:b0:6b4:203:a182 with SMTP id
 4fb4d7f45d1cf-6b442a89b98mr8306001a12.3.1793005363531; Mon, 26 Oct 2026
 02:02:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026015738.46230-1-dennylin0707@gmail.com>
In-Reply-To: <20261026015738.46230-1-dennylin0707@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 26 Oct 2026 11:02:31 +0200
X-Gm-Features: AclHuK8o2w3ue0fEsBYRmit5mrje2LPX_3oSwwLStLIHIXFr91Z3Gm5NRG4zIpo
Message-ID: <CAOQ4uxhxwOw4LNi6NV1FZzSePHZ4_SEg5QikvoH-L7GcKrkoPw@mail.gmail.com>
Subject: Re: [PATCH] fs: skip copy_file_range write limits when there is no data
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	djwong@kernel.org, dchinner@redhat.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:58=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> generic_copy_file_checks() reduces count to zero for a source offset at
> or beyond EOF, but still checks the destination write limits. If pos_out
> is at RLIMIT_FSIZE, this sends SIGXFSZ and returns -EFBIG even though
> there is no data to write.
>
> For example, GNU cat copying a 1024-byte regular file to another regular
> file with RLIMIT_FSIZE=3D1024 copies all bytes and is then killed by its
> next copy_file_range() call at EOF. A zero-length request can fail in
> the same way.
>
> Check write limits only when count is nonzero, as the ordinary write
> checks already do. Keep the other copy validation in place.
>
> Fixes: 96e6e8f4a68d ("vfs: add missing checks to copy_file_range")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Thanks for the fix!

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/read_write.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 4da846a2bf17..c05ad2c42e75 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -1531,9 +1531,11 @@ static int generic_copy_file_checks(struct file *f=
ile_in, loff_t pos_in,
>         else
>                 count =3D min(count, size_in - (uint64_t)pos_in);
>
> -       ret =3D generic_write_check_limits(file_out, pos_out, &count);
> -       if (ret)
> -               return ret;
> +       if (count) {
> +               ret =3D generic_write_check_limits(file_out, pos_out, &co=
unt);
> +               if (ret)
> +                       return ret;
> +       }
>
>         /* Don't allow overlapped copying within the same file. */
>         if (inode_in =3D=3D inode_out &&
> --
> 2.43.0
>
