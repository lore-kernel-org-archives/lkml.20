Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793271361;
	b=1mmaxoA09wQoeVf0/aYZPT3XMsQRqQOA7j2JbcWBwqjbkSnqpKNZC+GGrx3m3uQ14Nyb
	 fWG4kbcQ8DpDhte2aW6YkAb5HHO0c6w9behVrupyayLvTr3TsMjh7681nGB1IDcDdQ/yM
	 UeyZKVDRQWNzLcmVemTHMY2T7bEHLHwBZdaPp1mAzp1XE6HM0RmyEUpVIb/ykX53kmHlz
	 9k/SrTjfegF/HqcyUM1ScOnZkChP2ReqN9EA58zr4BgyOHt4xjx25CNP45sS2JX/LYUqz
	 c510sdBnUJBC4PzG9WQGju4OEcQ9z6zx/UvWVuI3rD+uTvqdmo3DReWPcpIYwv9J/ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3fGS6loIim+Swa1mX7t46+mUdJqeixhvle4YB5lLPZ4=;
	b=PvPrQsXatAWXily29cAc2nHOgm8Hy/b9eP5J3hwOCmu0q/4HLiWTRIUtdEornMT1TZ88
	 O+fgtsPKyMn7bU8RR7ZQz2HBCec/YOAN3dmyUp3BcalSdIeAwI0orRkGsW4jW3VraIqd6
	 0iOQ/GbJwyZv3mN2xucXo3Ljh5vLQcUctlq+7i8cpPSTcFU1brvxH2m8icf4x5E2ssDis
	 hAvirdLKUvcCknjf5XHI7PDVCMkhSN42K06kYK0k05XJqXt5N2CpnJWmj7l8DH1aZ4pxQ
	 qWG4+yba65YmqSayJmoOmtUaNuDLONOxMxSUMUaLzvQROVI1T4UJjdGtDSCbWuoXLGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDa6YDIn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1238E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDa6YDIn
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c46bd7a7345so109587966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793271359; cv=none;
        d=google.com; s=arc-20260327;
        b=duphSDU10eqqBtvrcyPlnLUDMUws3WSy9frD2bw+FyioYBQUx3dBlfhMssszRvI2FH
         eKKJsp97wiMxbCj2RBdLHsaTsuDPm1qFNE9jjejh/sicCUNMYkz+gyHw6jcLnttDsS/F
         CPHLgCCtoWw7P4z+SKkRxhE3qK/L1l37moKVGwpVcT7zm30VKgXrukoG2ygoz/gCbaA4
         4w2NsLoWAolpo1LPG7mG+j0mEnf23z19I4jcul4pQJH0rce8OQYEU0CIkoS+YRiQinNS
         1ntUrOLdaVpOfxBzDBQx7FYBN1geswNQGBY2+vpFJu7CwLCj1lmyR7D5Ddipk0FoG9Yg
         VOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fGS6loIim+Swa1mX7t46+mUdJqeixhvle4YB5lLPZ4=;
        fh=nZvFGYgSFUyeO55yYM8x3nSHq+Z4f1NrEMOsa25tUJc=;
        b=hVlnov/92Dq97qRPV3z6ajYS0AqHq+XK8F8yNOFAdEtrqSaFBE3RMVIYXJDvhzjuUr
         nsOnuQP8vtZyx6cwomQeZt2XLezkS3dzFw1JHPDWigbYRUKO9N+bVJGfh0SS2whKy71F
         dQtLr4S29UrGskgj2jTLfUUN18eGwScVpDvmtRSjTKuQe3wWdMMzChsS2OJowNisvFZL
         4IkuACc9zX+Tg/At22O5s+aN4lVcakTQ5MVmDorcowUVsxpO8OYKpPTF4xUuTaaDeanJ
         mpXbDZSIic4CLkSGIXcdJNqZS9Gnf7dwctIjp3YAawsJL8DaAFdgz6fBMxT3pXVZWhnM
         bf6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271359; x=1793876159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fGS6loIim+Swa1mX7t46+mUdJqeixhvle4YB5lLPZ4=;
        b=aDa6YDIns00zqTqrPCKgp5NqUduDBvv/bV2D9/roX28//Qm4jLBZeNEDCJBoxLxGYQ
         3deQplSXIB4dGOBpsXUlzlSyGM8+f/V65tj2kzCO+HIFi23vUmupF/K2QwQrMt6eBNFz
         NvwDNZJi4UCAi4M0oQHbYVPmxVudV9V1fWpgW5IneFG2GZIFBXRNTcPKxhERt80v0+j9
         DBItCsZ5yudK5t35vTLzHsgO0WbzthAXGGQKmQPFzA3FhrDwQLCU+Gg0I/Icf18qQCSY
         xROhsSzumYexKJtliqcMeqogE6Zs3iKhWq58DD0amHAcIztBMpIfeCsfWWEg6e+3OZXA
         yIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271359; x=1793876159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fGS6loIim+Swa1mX7t46+mUdJqeixhvle4YB5lLPZ4=;
        b=mEQP2Q4gWFlUQmxPsTtHT1oZzhZZFBg733BBp0wpJ7NLSBcerZqoleMCo4vBkPVUYd
         ebKAvGbEAnwMlW0IcFx+ZJ+Qy5GtGcxPAJHZc/auKGdN9tiO83b97mWhcr5EJ2mhjTmv
         D2dJ2+LNO8dkptgqJa1RsyChVKeTkGTcYWzNjK2iErIP32H4S7Gqy3yt+09xPLAitThS
         QXB099zfnFjmfyKrykbYFufw0ZPbJ8cr9XZ8OeGuJSNPmFaPGnuVO82el6lWDa1SePuI
         M1l6kG1BAdqRlg9RhjHodLk1bejRheSvsXNRDYxraESeBmJrcoVMsoXBDD4aSdbd6oX7
         yCgw==
X-Forwarded-Encrypted: i=1; AKwUvBxhPFz3apuOhWwOkCMyPPUCZoCnTF+bA+H/3l8Y5V2ZyPpUsNaKKmWJVkEY/CbIJGBAreBLCud8PGi6o4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBMYpc88UWfv7kTXXNCown4w8GSjvwJ7CIkXqXvCmuZC7ulAgb
	pVGcYaMg40hikRLZqMCovI9BYmNCb64jVdHAEOvmKmOJia/mUB6o6KjGgVyO40N3dK+Vql85y3q
	6Bjy5VGfQmHSMWW4tyP4DOc7qL796oJ8=
X-Gm-Gg: AYBFou3EVUyckn7bqm6rePmU4o+nA3DxxRlgP7LikJbqhs3ToqXY4TENFP/V4j4Adeq
	zVxeN71mRX0o+jA+upLcvnT4Yne2UI1s7FzrzW8Phx6uCjVd7OyqvJ3xnRLbW5FSWd2viWyAgDH
	TqCYp94cAksAO3l0nA4mLmPSqbdV+r9o8rZUlyfbnDvQs/+XxYjgT4z4L6HR7BnYue2BJhjJKvc
	vu9N5OOgZJGZwU3Hzd4fLbLr5UXul64H1nJWWmaIbyDvMdTbls8cOaEXJ82nLXWD4EeozGF0FNm
	Jl6B+s+u9DHVW+na4MlDv570jhrYtSzY1EckSi+LYkhmqTLutXli+eScsqpvxVpoLIQ1jfszIwA
	nBt9b9iJNV6GyB/gh3mCamlw1z4PiSLvkinSXAxDyOVRAUTxQhUQ2UiPgofnIezt3uYnBZg==
X-Received: by 2002:a17:907:d308:b0:c2e:2275:1168 with SMTP id
 a640c23a62f3a-c49d13b7f8amr182816166b.19.1793271359214; Thu, 29 Oct 2026
 03:55:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028195133.86636-1-dennylin0707@gmail.com>
In-Reply-To: <20261028195133.86636-1-dennylin0707@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 29 Oct 2026 11:55:47 +0100
X-Gm-Features: AclHuK9ES-fJm4qV7qIWyYn7jHeO1ZZUKHOCjIZSlhGweuLSd8vCQZhkASRtuK0
Message-ID: <CAOQ4uxgDk-NQ3hrHLwPkLT_6T6EvM1Mxk1aOtCsz1TYgup_FNg@mail.gmail.com>
Subject: Re: [PATCH] ovl: reserve space for the casefolded name terminator
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: miklos@szeredi.hu, andrealmeid@igalia.com, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:51=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> ovl_casefold() allocates NAME_MAX bytes and passes that capacity to
> utf8_casefold(), which also needs room for a terminating NUL. A valid
> name whose folded form is exactly NAME_MAX bytes therefore fails to
> fold, and ovl_fill_merge() falls back to comparing the original bytes.
>
> For example, when two casefolded layers contain directories named with
> 255 uppercase and lowercase ASCII letters respectively, readdir lists
> both names even though lookup treats them as the same directory. The
> same names merge correctly at 254 bytes.
>
> Reserve one additional byte in both the allocation and the folding
> capacity so that NAME_MAX-byte folded names use the canonical merge key.
>
> Fixes: ee95c5fc86dd ("ovl: Create ovl_casefold() to support casefolded st=
rncmp()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  fs/overlayfs/readdir.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
> index 7d6f7f6022eb..6113d690f8ad 100644
> --- a/fs/overlayfs/readdir.c
> +++ b/fs/overlayfs/readdir.c
> @@ -81,13 +81,13 @@ static int ovl_casefold(struct ovl_readdir_data *rdd,=
 const char *str, int len,
>             name_is_dot_dotdot(str, len))
>                 return 0;
>
> -       cf_name =3D kmalloc(NAME_MAX, GFP_KERNEL);
> +       cf_name =3D kmalloc(NAME_MAX + 1, GFP_KERNEL);
>         if (!cf_name) {
>                 rdd->err =3D -ENOMEM;
>                 return -ENOMEM;
>         }
>
> -       cf_len =3D utf8_casefold(rdd->map, &qstr, cf_name, NAME_MAX);
> +       cf_len =3D utf8_casefold(rdd->map, &qstr, cf_name, NAME_MAX + 1);
>         if (cf_len > 0)
>                 *dst =3D cf_name;
>         else
> --
> 2.43.0
>

Queued for ovl-fixes

Thanks,
Amir.
