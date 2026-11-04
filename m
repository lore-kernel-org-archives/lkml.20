Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805885;
	b=DuK8+Vq6FWlL3Ll2w8cWe80QMaFRTpk4c2vNjZW0KcttP1zjWK6cs8lapjNH5Cr7aOUq
	 J/jQ2znvbHQd6Rw0e55PVB5xpXNNat2Pxsx702AdkbSrqQrurMM1APnW3d7g3uAQpfrGM
	 iWsA6Mr+Mf7uPrA30SkgbwFXw8gCad6FKa08X8XMFTR/XUMsbQuj3qoAlpKD0uQcnDsBB
	 HK7AJSoxUteePzrCCDx6zHxzatAzYr8+qL6hHW+o2LxWwpOjVTf6tSISxzEmK7kXrkXpu
	 u1IWUEKWpv44SnguMR3cLaKdbuO1D+gZyypeL4lrbsVpXUXXqtHK6unPKeGkTwRePoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
	b=GJSajCVKUDP1nnsPbIKeR7oQ0K8JxYkRHfe+fn68qkZZvHMAWApX6qVk+wh9pDrsln8u
	 GK7uVOrRPb+0fOHhAZ/b1WY0KUaEwyZMSCFq9HE7/fsTbolpJ3sLCvtCXVFw02WM7hxrU
	 Wu4tVfMXb260+VSgQHedZHOQ7km/OWLjSw4fPAh9PY786hbyFlKJ4yjZFZkTNVtdfl/nf
	 yvv41GYHOwCmrNDkpAGDs/nwJ2NbdOJphufbQKDkM3vDGe6k1bab6VCRwzqdAorFREspK
	 FCBguXJSxtJ9FPgeDpkZmlSSAA+C3G1rhcy9B5xOglFB00bkEDhKFXb2nGqpB9pSbEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=F2FlsQEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE979606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE979606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=F2FlsQEw
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a6f1a4cb8cso33542fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805884; cv=none;
        d=google.com; s=arc-20260327;
        b=LTxTkcKqC9tPU5hxBVviUJq/D+f4yXyIaxLT4d9F5BOItO1iuSFucr320OtQRk3tyU
         AFhuZa2GwGrxHtlZyX7aBmVrmJ1P5ITrH9vpR9RfEtmCjMjfyMNxhoIoT9RAtSB/b24l
         j6j7pFlIYsx/KYmX3WaEajzPoDYqZsVwV5e774XwgUfuXaLUVwHQDluRdD6catCF4c4M
         iY2mzv5yezRoM+Sv3Pv7gw1qE10D9QVFciqu1RvFbYUlD82lMMf3R8qIDy+/VqDb7adi
         sWq/6sz+XYqE4JnQDkNyZM8pmdmBBSbNiYgwxySU+fepLwjrYFnWoJQV1k46nFLKk4uf
         Gbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
        fh=iGPbU5PB+ieJnxPW4n2PWaPEunljHhgXLM4usibqgzQ=;
        b=obuf/cSBoCLfPSIrygueUNCpeBB6d6WNgUeq0xZVqRaOx6Gq9KPWjTZX1Af+krWv9V
         jasZrNL/mkDjhnM6YBEBRFuQsZZTt7xpkpdzNjO5o5FtWBCtWDRLEKvxhUu+DAEL4+ZY
         lPNQAi6VQNbzG1Ca07wqbohZyRpF/TomHR15NGwd3O/vOfCVhCh5z4h+eqbMZRefz1YM
         UXGXrkujUSbkMwiwQ3il/BduUIghZ8xIwHUWLjLu5MrLqZHuxTGA30BE3xt07Auvr5jL
         jgcAC7ZzVhUe4jiXhvtFsI8AxjVXPWVmR/gKesgp0ASsJeD83B4hM76cf3CLxB5u3dKa
         HLnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793805884; x=1794410684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
        b=F2FlsQEwuvngD0Cs3xUh/uc9NpdhUow1/QhCVrIX6rEcw4PgpCGa6Qy7QfVlZOf8eJ
         2ELX/a1fHRXZyGSXTaDoC0QtbeCd5xbShvqfew/jAuwifMw+Zf742BHoCyqeTTiaMCOJ
         UbT5ILvHZpsOCOcp0aKMIGxYBpY9OMXYlo6qL4WaZsaFHuPPKKICpVYqN5b8GDz5XBj+
         /XjT8VpWUEw7P35P2OF4ep/XAtv9MPJxxz/NL3AJhJBrLY7YyqAi5eUP9zfG1dWy33SI
         /3FKa7cAs/q+meWYCL9PdjVcA/+uZHYBHh0C5woYIDdVkZfKjTcCR1jchUfA+LouX4gg
         5pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805884; x=1794410684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
        b=0++6L5iSwZ1LNqlP1wNCqAEutDYaEeQfEqWg9hqsGkfgtTbvXHGgOABaFWk/nlpdxX
         xfbn9l0j6feuHaON30JcoOFFidihgUEOzxIoXDA7KjVDgUiTlB65VY/lcVkqfLvTDrZF
         hZJ8iV+4mfC/gnXHMt/P9P1vlBK5NkIxo6idlVTHHKxO8ArACgwcyhs3HHkSIST+b0KG
         EZeEU0v3d8vw+4M/K5Z2OR4lygI/Yp7gdS9+azqFQ/qB6HXm6+Zs32MiENrOXLwLzZhm
         GFps0FFJCV3lky9WdjeicPQEpspszNqf1zyQDic/tGk/fINTia3k4+r5mdg2u+8fvS3I
         YsBA==
X-Forwarded-Encrypted: i=1; AKwUvBxdr9RMSdtf1r4oJ7QeOWkiGO/469YRbw+Ij5u7BQIRW2hMahDZZw4W3SnQVetYIdc3OfwBCuQpJCZc0Uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zzkDokTQOV56FMrouyDuJ/5xfuMjkpT7Dg9+TVajXrMIyI5Ee
	OLL+dZOx28K+BN+ITYpJ0q1zn6CRwMs3CdJT/nN2YYdMF8P+aH4mBuEKRhs8/x2yzKxxArwcUpz
	DATBy8tbsSWhE30Kw6VvsiwKMSaxKESanNqCo+/aBBQ==
X-Gm-Gg: AYBFou39l+TllzRt4HxepxdcoqkWYGprhdC4OC2wK7n/wCumjWe4DoNoaUArKJr7gB1
	iTS9UhajLyv4Ty/ZkZA0UbDnQ77toV34nC0XB8FfyWsPn4umFlN8wroTy+Sjltk38tBIf/JoepO
	RX+dHeXAOBH6rIFIFDEZ/vfAss+3EITOIIttGz1+9+/0r95r7FqGeTK4grmAxaKIlYiT5ZswIF6
	DEtqQgvFWwbOi2flGN74o4D6TzQnuCIqbjBo+YtS69SQJnWsCa0E+X2tpz3cy5cghnPA0a7xSXb
	ICfx/xywMa4Ccn9TLBFeawKdvzrTBpavj/3jaw3LWqxeKhXO9Mqs8XcnQXMw0pwQunWARCp/+7K
	nBwvFFnS3oYH1xNlJrYw5Br3Bi8CtqpOd6AO3
X-Received: by 2002:a05:687c:40c9:10b0:4a7:fe04:7dfa with SMTP id
 586e51a60fabf-4a906c5ce81mr12210477fac.0.1793805883319; Wed, 04 Nov 2026
 07:24:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104104909.129656-1-thuth@redhat.com>
In-Reply-To: <20261104104909.129656-1-thuth@redhat.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 4 Nov 2026 07:24:31 -0800
X-Gm-Features: AclHuK9voeX4CroBKewKkDb-TCTAm3mHMofh5zqgIby-6JO5pA3M1-VHQAtqXLY
Message-ID: <CADUfDZrwgy38Nt4bFeZd=nfHAOTScy=1PKjanTAoUFzUkydkbQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: Fix include path for out-of-tree builds
To: Thomas Huth <thuth@redhat.com>
Cc: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:49=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrote=
:
>
> When building the seltests out of tree with "make kselftest-all",
> the compilation of the ublk tests can currently fail since they
> are using the headers from the distro instead the headers from the
> kernel source. For example, I'm getting:
>
>  kublk.c: In function =E2=80=98ublk_ctrl_dump=E2=80=99:
>  kublk.c:190:27: error: =E2=80=98UBLK_F_IO_DESC_SIZE=E2=80=99 undeclared =
(first use in
>   this function); did you mean =E2=80=98UBLK_F_UPDATE_SIZE=E2=80=99?
>    190 |         if (info->flags & UBLK_F_IO_DESC_SIZE)
>        |                           ^~~~~~~~~~~~~~~~~~~
>        |                           UBLK_F_UPDATE_SIZE
>  kublk.c:190:27: note: each undeclared identifier is reported only once
>   for each function it appears in
>  kublk.c:191:53: error: =E2=80=98struct ublksrv_ctrl_dev_info=E2=80=99 ha=
s no member
>   named =E2=80=98io_desc_size=E2=80=99
>    191 |             ublk_log("\tio_desc_size %u\n", info->io_desc_size);
>        |                                                 ^~
>  ... etc ...
>
> Fix it by using the KHDR_INCLUDES from the main selftest Makefile that
> should contain the right include path in either case.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tools/testing/selftests/ublk/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selfte=
sts/ublk/Makefile
> index fc64b8f028332..ba6df7c0b530b 100644
> --- a/tools/testing/selftests/ublk/Makefile
> +++ b/tools/testing/selftests/ublk/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -CFLAGS +=3D -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)/usr/include
> +CFLAGS +=3D -O3 -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)

Sasha Levin already sent a patch for this:
https://lore.kernel.org/linux-block/20261103130131.4069212-7-sashal@kernel.=
org/

Best,
Caleb
