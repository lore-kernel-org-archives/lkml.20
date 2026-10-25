Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934538;
	b=XYZ0WhAcz24ZP3LsBw9L3lb9Tg4e0VC8n6ivxTNp4+K/ikxUjytVYRTvCYAR5N86XViE
	 l4hhkAfc/2TkLtMbqvVrxwlNDhcuSjUw7tIaUWefpOTTc0APLgC6yqSsMu0fv88jLzJz3
	 zY4lDyWMfMKaer95BtnAiIKb09p1AEUgHM+NC6T+mk+3R6Ont5QoRqsvbEnncLWosH2Rp
	 saxInfI21QipRG5gtkrT3sGFPdSt6iPS1DI6v82CuI63kLKpcWtvGZOAaqc3OF9xdeg45
	 n7iG5HZO6JKeFlL4kJhIn/irRpYXikBFr86nO4Ccu8ucFwfisNUm3lHJjwFEw3NiJkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
	b=xD5fIGc1J+8TddE5jgAY7aKZOdC/+OhdHSqh54zaZ+oPmw8st+v2aUoMMj5UUDcVXVk0
	 7QdBFbtKRLusxtlIcKTFGYYfgh6hvS4rPEv48vvztIJQqEjLD8qB5bW+r0pqO6uLU0/hg
	 f54TQYjWlEB0LlfFYgt7PHuFot+FR5Ent3Bl5hvTYqlmoRzWuP53TDTlEItudAUqqGt+C
	 oxmJ1gTZsHdLEmyzBPfroIIlORRv6JOEKbOWC8OGWDfpD8BeCpqt5vdGMtOuuwa/sTqv6
	 C9xzCVLtl3guVeSDHAFcH1k5JJoowYOrR8uVRdBNcL+lzmU7YB9JB5hOcld4YqW+SlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KrtQG2sh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F4606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KrtQG2sh
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53bb57f1310so4153391cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934536; cv=none;
        d=google.com; s=arc-20260327;
        b=Kf5Djxt+w87hyICvsFG9tqCPuhvpMkPiXu0WqSneaSEGTSIjZ8GLkB/aFAyfbUj7DS
         5INkMpLw8H9GxsfT1OUW/fLbWRfqDG+yVd0sU1CVbBMT8/YYNU9FqKab568t0HUTz4pr
         +CKMwOZM4U0ayJsyBdvHuBHlWEmNSrIBo8LSqQhYKAUIN0vyVteVawdQGQ4ec7YQm7wG
         N1ozqayFMMNmrlOYe2mZ6KW8gdJVXklwWYYSd6m2mQC/72spnVirshDki8fj98/WYpsx
         vs6hhypwSTnuoIzLrjKnvv4IiGwfpXGlTv/J3D57qS3fUz5jd5iMo1sBm/69KIczGsIO
         NNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
        fh=KhSAV6POfifR9Y4Blf1cKxmMHHUF3aFbb/gOZsoslEE=;
        b=U4cCi+PbD+kku+gA2N3WPdW8fxYdRzDZKGRm4qx8MKUjkcTKOjcJSQ45vIdrRQSmp0
         ExU9O2Cxjqj5gOQnSznM5i1MhEPI7NqvyWsBksFs8Ny8EhXBcC/fSKWVfYtlxaCT8gY0
         ER+2hCbOxXzBantQHnOGPGJFhsGSovNp4RCO10mfAAx45hOMPlaEsTyX9W+t6ibvFRKl
         V6gSQIj/Qpbf95uzCDePc3OSkHap7iT4E0583BtBDm4tv6i8oevubRqHlkFChN/FrqTu
         yIQvW76chSR9nBxNaAm0K9jVHFXeUSGW8LHxW7m6nyJq+WWqSZy5kV7KNihVMVR62dDF
         xKrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934536; x=1793539336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
        b=KrtQG2shgBOu7+Z0DtX+eCmMa0WXKipTZloNp25qZl60hLpX0BxBwduNRK8bvhC1XW
         RgY+tKNEWhr6JOAjZX6Vn66I7E+dxWry7bBpgsXIq4ZPCCgPZcw6qMvvgtLN8945EQCd
         ODLw9qW1p6brqcXm6p/PVhEABQqlL01nBUgsZc/DmnFGX4LH2sI9vUQzJQ8oOSQEGOt6
         Jqy+YuzcMFD1Nx9UVDj+43gBQORHA+QW1JiwqLaCzAWBnfuLYp5by6ZVE7RKRO1mmEh1
         mlrLK8gHIdOUoJM+c9VimTmsioS+w67YklsggVbPx9jCUiMvVErmZE0L5hFkUZP1Fk+R
         V9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934536; x=1793539336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
        b=iaxHDZo8M490XuKpMmHjd27QbN7gLZ/D724K5U3IyFgTJz4CrXU1i8g3laRUf+IDDm
         YkJxdaO20miJYEJ/dzvg3NBDvRaZ44J1ZCAvKW1njfiw6wuNvFf7m1Q630jb1K76Nmuv
         /ah0bXt9HIKbT68vpjnWPZPMG3JwazNys+xVo+wUarCF5vH43rmaXsO2pLqrWuxffh7a
         k2HqUfytttKTXGAnQtj4/T0H/BR+f+VRphIna7c/LJQEiWyc6C3kb7XMWDQUaJPm59k6
         Eyc2DhN0fmXb87JOw6TsAxwcxDOVRkyQYee2mrnawhLDBvqJlv9Pq1wj79ZmPBEJZO9D
         7kdQ==
X-Forwarded-Encrypted: i=1; AKwUvByx1fVI1rYGZ4S7xDBnEw03+iexc8VW2WG5ePr0V1WB2OZufUEfevMYQ/ghuA0/C6zXwhZ3J+9P+3kzXFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRIoWnfbmjeLS158fWzNQtP60Fepzja0cirannf/pJN4HVSOcg
	8Zo5fuSlr0B0dKBkr1lWxh0cjmuaG1Ujt+t1WZcYmnyo0V1pHENKDTS+FIkOxLicn+q7QXFtEMZ
	8TNA2xsIe3EDKcosVe6lgqIlL1MgKFHo=
X-Gm-Gg: AYBFou20arWQVFok6LS4PeTd3hPJbdXXNfAM3zt4egxIhj/e29NE9r/xBgzNqn5YWj5
	hBV6lcRyunxJJ+vFkZm7EaTIgzSgNUe1eC6JtHVmeldlyGme0an//Suu6Ut4khQ9xsIvjvkhR7E
	8IhvQvKSSwLp/zAPghLQH1N7JNudKg3ZAHP56ezWX9pVAK0z6s+xTn6jxJQSvPWGaAT9oKHTR9w
	lv0fI902r7AMkUA14gxE4V7qtO0OyGDOmaaK/8IaNrbTC1FCD5VHZN2MPMnmzNMwxS0kbkBXGRt
	5VrpIE/HqES8W1Vxli/cG9zPB3oHBIyqlW9tBJaYxRrOKATkUkafKLjsoy4W15Yl+jjtbNg79wj
	4gi1BwvSsZON6BZMeN9YH/4U5kkBnPQNNSg15huU8z2KepRRO5IihV0D+4l2XhmuPwGJGKtZzBb
	ApF7S1VPLdry0korxey6VJZBK5S2j4TE8hjfzbTA37wCtoD0nrL3M=
X-Received: by 2002:a05:622a:1e0a:b0:536:8f5a:64a with SMTP id
 d75a77b69052e-5383b5d8095mr65259641cf.63.1792934536433; Sun, 25 Oct 2026
 06:22:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
In-Reply-To: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:22:05 -0300
X-Gm-Features: AclHuK_RzNSAMZBWg3A6xIKtAXs72wHUSwnE42f611HZttmQYdbPl-cqobyZqvE
Message-ID: <CAMAsx6c7MVuP1gsOdepwyjostG8eYnkXrw1rttqFupiT_GmbKQ@mail.gmail.com>
Subject: Re: [PATCH] binfmt_misc: fix typo in "auxiliary vector"
To: atanaskunchev@proton.me
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	kees@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026, Atanas Kunchev wrote:
> Fix "auxilary" -> "auxiliary".

Hi Atanas,

I searched Documentation/ for the misspelling and this is the only
remaining instance, so nothing else needs fixing. The change touches a
single word in the description of the "O" flag, and the fix is correct.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel


Em sex., 23 de out. de 2026 =C3=A0s 14:55, Atanas Kunchev via B4 Relay
<devnull+atanaskunchev.proton.me@kernel.org> escreveu:
>
> From: Atanas Kunchev <atanaskunchev@proton.me>
>
> Fix "auxilary" -> "auxiliary".
>
> Signed-off-by: Atanas Kunchev <atanaskunchev@proton.me>
> ---
> Fix a spelling mistake in the binfmt_misc documentation.
> ---
>  Documentation/admin-guide/binfmt-misc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/ad=
min-guide/binfmt-misc.rst
> index 9e84b877d06d..e37668371453 100644
> --- a/Documentation/admin-guide/binfmt-misc.rst
> +++ b/Documentation/admin-guide/binfmt-misc.rst
> @@ -73,7 +73,7 @@ Here is what the fields mean:
>             Legacy behavior of binfmt_misc is to pass the full path
>              of the binary to the interpreter as an argument. When this f=
lag is
>              included, binfmt_misc will open the file for reading and pas=
s its
> -            descriptor into the auxilary vector with the key "AT_EXECFD"=
, thus
> +            descriptor into the auxiliary vector with the key "AT_EXECFD=
", thus
>              allowing the interpreter to execute non-readable binaries. T=
his
>              feature should be used with care - the interpreter has to be=
 trusted
>              not to emit the contents of the non-readable binary.
>
> ---
> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> change-id: 20261023-binfmt-typo-bf80308e23a0
>
> Best regards,
> --
> Atanas Kunchev <atanaskunchev@proton.me>
>
>
>
