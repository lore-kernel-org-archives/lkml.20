Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44362364059
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791698811; cv=pass; b=d6S0E7b80WGF+YgUjHxJ3KWLSc7Dmd5heWOIfx8477hAt4bEh0HWiU88g6lyuc3BCBwUlECpqH15zR8z+4m4tgyUmpXBbLEbpQ0d5EhQSC10/1mQibet9a4RXOb2/YKiZaqeSj7u+Zh0TPNVRhnSg4ggUwzqUSgJ3RVTWhPInrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791698811; c=relaxed/simple;
	bh=L0xjsPO0dageaCm5EnmOV3npT9NMmldJ1OdH583Oiwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8Lu66fKPOgz5ZF7A4aXZc9eaMABMOONpv0gdAdyiHjQlmkKxhd4YnhDX2/2VoQ1S2Gqq533F3DC7jrPosI9JIBFIslbrUd4dFPrZULl8kbRRFDtkE4b1oXrbFFiMbYHJN27YWHjmTKKKr+jIz3TzkjKrVCTpIjVRwHWKsvbm5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEznfOEw; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEznfOEw"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8a7523c2be4so351707b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791698805; cv=none;
        d=google.com; s=arc-20260327;
        b=cRxbjfbCusmRfUz4+kiHp/CtkXZ+BMgIs2ikQVqLtleU0NenaehzeHD+HXjDlwSLaO
         EiFH59NbOfWf7WQwS4cz+84quTZ7W0sFwWAw1oxqsXBHHj/mg3hLwo+rNWfPBm/tcfCK
         7tv5ELqp077nvcURGDpfvctC7DIkzT8+E1zX3WEGrSrLsMBDTCFVLAK8T48d+R0USGtG
         Qxdo1uyqp7MwXIkNP1tyAqi6WRd0VEDLCFB/UVz6XYyE7P/t584KhUgvzhbIILOP6tEG
         b9yArXDcfEcCvQvRiGDNkKSoQ5jeVZsCyZUuSG4lqORFvU69tSQKVRkAz9wytmECqtN5
         NkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9QEKW7arrkNR3tpw3Z2BxesbCJ4by5YCPWmZN+zoiQ=;
        fh=HEarHzCYzJQQmYT1Cm39HYMOlHJOP9Vdi5oZy7tdyZc=;
        b=Wg+PCqfLgT4k8P1GRwdl02pEAcucyN4uyzLeOr/q5TOUs6NmAyYQMVwChjrZ2BGL/e
         cDFSBETkSWJ2cuBiz+UslJoeKBF6VhpSNp8/7ZZXCq3bzN5yQcjGG9gRwOIToFLrJPVI
         WDcBkKl2DZslQBMc4XUDdsTsyx7RmhtV6OlWktq04P0hcVShOdcUl0qQQHUSuXPi4zTi
         kXeY0IVWsUpDw2UhjEHJr7Wjbc5Feu41Lg3ulAnYDzuCVNO6yss0InCSRom41tOtEpuP
         C5wD72aop06m0HbEE933nUML6nG9d1uUsVBAcZheTOOWuHu5y5Pye7GwWSgx/e/N2+tk
         Tzqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791698805; x=1792303605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9QEKW7arrkNR3tpw3Z2BxesbCJ4by5YCPWmZN+zoiQ=;
        b=UEznfOEwbJiCvdZDg0O9q+z6qNTOJFH4EdMnu+j7Peqrzk1B+2MN4ofnYDgcLjv1FV
         b6cViZccom06sMsmJicubIugGsjqDsdzTFBGCz0nTI7Hioq6BeuLiS+j8UIVXeA5zZDR
         uDf9wGjLWqktnkZApdID0gukVetL6mJbVwtBBLV7k1+Lx+XLasFtmH0Kv73lRkO1SZlQ
         mcxIskdoCF0nORjNETt8AKmcl10Buiw7MFMGgmVcYQtizoFC3MqEbaYfQqjL2a+6iPUA
         qVx3zI/x1AuMcYpWCJf4QfWdcwHG/i005MawWyUntJeXFZt1A7TIRjyhyyfGku6xaklc
         7ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791698805; x=1792303605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9QEKW7arrkNR3tpw3Z2BxesbCJ4by5YCPWmZN+zoiQ=;
        b=ufb2NOvOMOIHIZ3gZJ/KIv/2YwZpR6MNIblqhK3ENXUXogzVTcmCYKLaoRLXJvwlHu
         yxai83XN2b3DhstmqpfTFJ3+Yu828ujbftlBOAigyMBpfHA4X5BcC9F/S3oZLix/UXTW
         ND/WWLcke9hH3HpbERqhIjhtbP2JP8rDE8mzMcHHRT1KY3Kdxl0T9B4jIq3hZ1esWj2r
         DUgJ3nFEaPrwzZa+2Yb+aGVyYg3ieXE/WrRq1Hs5pIw1LFz4oxDAQkFsjb+qgrw13BOy
         wNM3CNlFb9Icy3Qw8iKMSVecxZo7unB5yrqejw5Tm/OvBwPIs1WCSVXARXKfxBv3v3u6
         J+xg==
X-Forwarded-Encrypted: i=1; AKwUvByu9tXuPQCjBdDxtm1hz6pLrVIMTWqzQGS6lHzZcaa565qdCM8WMM3MhYIQgwrNq69B8YSsb2AIu0NbFYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRh0jYlLPKBKig+GH/p1g6zpHpFvfa2ggl8z1816LPQ+4w5xFF
	vWskMo09bS0XByNsm8xhG327HMx2VI2yTd+MDeGrmo+IUW43QGpIqY/u5SNQwZI+9ohCJkBQCzt
	mixWWiYWj4uSRT+b4nwlAh8XpI6HNQIc=
X-Gm-Gg: AYBFou0W9+H1QcYKDoI3R4EX9BJygJbMUQOnY/kH3yThUnrMmCFVzuS3Kst1h2lQTRV
	d3DBHIw7pudVB4TrjZIWNVrrdYQYv/FnRsyB9oXCCcohSmN5VWfogPeSIOgOJenpQNw+RHc6sMq
	4GV135pjr4ULnqAAh+Aw1q50hGNVEA1N7opvbrskvYcSMCOAV+I1NSZ5k4H1bgZfdX9kIiPzuBa
	iyMvs00spkXSW7+4MCqeCGwOQwgafCf2p30IAr0zObVE/7grSN7kDO1cD7fErxs+xBMwasZ1P45
	ycM88jtr8q49QwmGfsFJEgVHcHI8JLo5LR6eayDjQnzcR+KWJope5hNvmw==
X-Received: by 2002:a05:690c:3346:b0:863:29e8:a9bc with SMTP id
 00721157ae682-8b07ed65de6mr41630957b3.2.1791698804847; Sat, 10 Oct 2026
 23:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011055955.1487087-1-charsyam@gmail.com>
In-Reply-To: <20261011055955.1487087-1-charsyam@gmail.com>
From: CharSyam <charsyam@gmail.com>
Date: Sun, 11 Oct 2026 15:06:33 +0900
X-Gm-Features: AclHuK_Q2ERhKi5UKeLKEtH53kUObVOxPUwVMIZwD4utFinQ8ZLZT4N8mhh3IyI
Message-ID: <CAMrLSE6bvD9dH_KGU6bgkKPSE4xnrJatj_to7NcJyxp6+NNBHQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: match the full EA name in single-entry queries
To: linkinjeon@kernel.org
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this patch. I found that the same EA name length
check was already proposed by Ze Tan in [RFC PATCH v2 6/9] ksmbd:
support
security.capability EAs: https://lists.openwall.net/linux-kernel/2026/07/17=
/194

Sorry for the duplicate.

2026=EB=85=84 10=EC=9B=94 11=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 3:00, =
DaeMyung Kang <charsyam@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> An SMB2 QUERY_INFO request can name a specific extended attribute with
> FILE_GET_EA_INFORMATION. smb2_get_ea() compares only EaNameLength bytes
> of each xattr name, so a request for "Foo" also matches "Foobar". If
> both EAs exist and listxattr() returns "Foobar" first, ksmbd returns
> "Foobar" and its value instead of "Foo". It also returns "Foobar" when
> "Foo" does not exist.
>
> Check the xattr name length after removing the user. prefix before
> comparing the name bytes. This keeps enumeration without a requested
> name unchanged.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
> ---
>  fs/smb/server/smb2pdu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
> index 12a43efdb53f..a49cc3a0c9de 100644
> --- a/fs/smb/server/smb2pdu.c
> +++ b/fs/smb/server/smb2pdu.c
> @@ -6738,8 +6738,9 @@ static int smb2_get_ea(struct ksmbd_work *work, str=
uct ksmbd_file *fp,
>                         continue;
>
>                 if (req->InputBufferLength &&
> -                   strncmp(&name[XATTR_USER_PREFIX_LEN], ea_req->name,
> -                           ea_req->EaNameLength))
> +                   (name_len - XATTR_USER_PREFIX_LEN !=3D ea_req->EaName=
Length ||
> +                    strncmp(&name[XATTR_USER_PREFIX_LEN], ea_req->name,
> +                            ea_req->EaNameLength)))
>                         continue;
>
>                 if (smb2_is_private_ea(&name[XATTR_USER_PREFIX_LEN],
> --
> 2.43.0
>
