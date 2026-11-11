Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416279;
	b=QwRHIF3HGIMV5gteqLkL5deQEHOf15lcOvsEV3DLKWx9cqHK9qvBXnQkuFnpBNmit1MW
	 vkkpAVw9cknbbQPEZ6uyQiSJ5uo5XZuL/ky0uZPrFZZGWY+uVYF79H/PfhHo6uu3Z8Fuk
	 gr32/CDFp5juNMrh0Mg6iRbrAjOKti0BrtEbauo9GhOTSTSHkgFea4/IKI1yuo7NUnl5T
	 1gBUnripmFgDEwZzeE8HnmG5n4RWPSjRBpXiz3B14CJBOYbW+39qyL/K0HzjG7+m34NjN
	 T9rjjKLWXYBBoWOZItD0pyIslM/ULMxkU6V875tcBaKiCg2+DYXhu/tXpq2w4AfDoig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5NwrvkVcWYRXcvvXDVMbg9XZrRoxtHq7/a0L67gwNMo=;
	b=NgTWrcShOZq2YLA00XO/vBxSbZ7hCVolwY5s24+CoPRP9AQdkxRRKYwhfDXj2Cfo4IlQ
	 VF9qxZ7jiE+DzzHbYY91HQG3QqtsKEYU0Aw+Z+MtKeOiWfSLJNwCW4BZjx9Ja47PLUcsH
	 CpukuYjc/9KKir0agr1uIfdkVsk5omGKXdGN2Km1ycCaeRC33V3gWX1Kce6mFr3H2MFLL
	 88DywzrfThBGfGSB9dGfXSsSiSF8GU8LfXqnzG3MhJPFhQ+L7I6auGHhXHjt6oT/Hk1Ng
	 S3ML0qB4ysOzINnbp6+gIK1wE/8Pi0OAy8S0BFHXxN7vY6ZnGfMiHCVEl2LmYJL9Ykw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cN4/F5iF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FD606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cN4/F5iF
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36ecc11bd26so92546eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416278; cv=none;
        d=google.com; s=arc-20260327;
        b=CJ2SmkVN9axF9EF1wCjSb3REG5abqYSEYrFmQvOzbhxuHNeNHf3wQEIzMMOmErTWsV
         gieuQy+aTOsQg0DRBHHqHZ+fSTKs678LN9cFWzaO7/0sT/E6ftfHlUGmBVzfDz5pXMZS
         M1W7ckfsRNkjbvQy0/7JWXA9RVsJw8i5HAyQyMid0N/TUj03giXzIBzukwo18pTXeglA
         bFXiywhtPmvu8HuNIrEaIQSIMZNkRrS0mhkOESiHB8f17mvAYatwWd0p7ndRmHOOIzia
         BENZJaWV3wr8t7wLpobRTt0WJF3DxuusIk1Rn0e5+Ws/0D8VxdLaglNRedcgZqUpj0ZP
         fu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5NwrvkVcWYRXcvvXDVMbg9XZrRoxtHq7/a0L67gwNMo=;
        fh=bEcx5eqBYF53Y1j0klP9QF1iwSIACWJOikpbxevx6yg=;
        b=AB4HafNIdnemcIkMMfj9cSkgFeILzpeaV1A4qECbvl/QEd6m1ZUkASrXfBbxqMrgdj
         q+l7p17z6EwkJ+DBRjsnLXR2Q/j+QmAMZPYeLY6Vlk6wJ4DMwdXJpVfHICyc//XX0Usi
         UbHlM4x/FnG8Q4QLU8CCo/2tzkml2+WlDbEbTQDJQaC95FTHbMGOuIqSH/d+uRZe4ddv
         GTIOd5VPEyJvclJYOWBO7cg2kGptrQ0qvt+Lug7Jf0+oarMX2tRU0daMjZFvaQJS0j8i
         +9oZit3Ic6Uou66jOjkP33ueEytrklYEBvbJD/BoMbp4LjJky40rwp4qCvq6X01QHHim
         ugvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416278; x=1795021078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5NwrvkVcWYRXcvvXDVMbg9XZrRoxtHq7/a0L67gwNMo=;
        b=cN4/F5iF/CG0EvWhbdzFqxo82CVAUhO1VjwE1B1+edUZhwojye4uGs8REFZMc7VAqo
         UTtvGfiymtlMAoGATxpuaS09UBP1Q/yVQgt2qZErpsdNMJKvBHJMDMKa4NVhedTLSLLn
         8am9gddHQKtyP5X7EsMJgE1DM48hbHBxBkjbKC6yT8invGEezbe8TTQN7NxCOL4KR1Ou
         Gxb2VsVSmR5sSLE/BPeZsKNZNsg8YCyiUX4PFIWRZv1ZIUguPlY3PqRKdN89jAUyBIej
         zIYhtR16CZPZ4c/SYU/C6hbBX7rDfCyi2xsjyUp2UCQgSs147iz9roC7GkWVZ76hrZXj
         UZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416278; x=1795021078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NwrvkVcWYRXcvvXDVMbg9XZrRoxtHq7/a0L67gwNMo=;
        b=ZQgVvngcMJbjY6w9ZlE/lIG35EGYpwuKUC9dsTv2Y78qjGLKh4XQ6/pIDthF91cR7B
         NYdlBKKdu52kYTkPWCb8k7vejGVDJpxTNvkBIHgqr9g+WDopPzWkNw7FkX1Mgn/Mj8U5
         E7nGC7LcUvwwqiZIst3smYyptOyXOMSg/zaWkSkuPj1Am+NpOpf2FHipLHUd1YLSqWjR
         /CyfzMKcAzHp2k8XgB3bu/Mb+Dea4vV4McG1welhKTNaFMsldvGpk5lo6wZhS+3F0Fza
         6IWGB4FgX/4P1YeNUZ9toL3Vg1s7JEwR+h+BQ1pc76ayBnHXzOsFJizSzDpt8OVfcO+E
         DF0Q==
X-Forwarded-Encrypted: i=1; AL+hErHskg9Qc7MCeBgFXhF6auNRgiz9uK/1Db+cFhf6DQI89fUinTVrdRTS79DEY0/xlAu4cGV0fBERSV3ZaPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S45Ck9Wh53SyJNzdoaWST8uKYTj35aQ11Qz6m/Uty1jc5V/o+
	w8OwJ8DDRPmja7oVKQHLLU2v0PmvA9GJ7hPyTIpVfaThgObjVO/sAMQ+Vz4BRcSyD77TtvkFDRQ
	5uiF5ufPykKzjzTlUWRivf8QRrvia214=
X-Gm-Gg: AYBFou3MIOa3Q5s2vIr8QW7olj90CYMoBsAIE7ylnyjeANxxylmsnklDcEbN2VuuuNy
	xK2qGeCaE/4xpSorsgBMo9/hwwh3KQM/LKTMnJodf6CSkO6zC+Kq+wJbi7Mdi32/F6Qbl/2QwzN
	TB1ZUwavQqybUEF1VaV5rh8NanQ33x9k3KzIpc/Muqq/+1E9YyINkS0HOeP4pvNpotsJMz7+J2n
	numI1J7LLcZ/TxTWPf8XMA/+fyzSU83fd8Nit+WdBNfdy549BghT4Sr8ZdjWaj5WbusxQmKTMs1
	xZezycrdRZ1o7Zl1Jm8Mc4hLKZUlUIzcv4klCfrKfT8+WdBmf0pnxh/E9XvL+d7LTyls9VpYVhv
	/iNYbCP9Z3hreEOhAvlNhpy/SSgQ2hSIUtDXYNVBXrmnjt83ivMq2KkLN0gLKVtsU+LG2a7I8Ho
	FerGX520nDGEwJkrCD6mol0FKU3xlkzoY+S9inzDuhh64QdxbOCnrcdQ5BTn+zsHas2toXvfcev
	1vnrLtM
X-Received: by 2002:a05:701b:450c:20b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-1b3c02cf135mr4291753c88.1.1794416277403; Wed, 11 Nov 2026
 08:57:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4VYoOFUjYIK--SKrUsijHVOOHA6ruEc8z_hXR_OMj7syXD6492lPaEKmsRRV3iLW1QAkn2X29F7_-lVKnIx4vUE1KQtKx8Zdk8sX_rFaZIA=@proton.me>
In-Reply-To: <4VYoOFUjYIK--SKrUsijHVOOHA6ruEc8z_hXR_OMj7syXD6492lPaEKmsRRV3iLW1QAkn2X29F7_-lVKnIx4vUE1KQtKx8Zdk8sX_rFaZIA=@proton.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 11:57:43 -0500
X-Gm-Features: AclHuK-DMzwioV5PBa5WXoevsVpI761BeBU3ynr40SlnxuCKodphabVoHdQR7zc
Message-ID: <CADnq5_Mp0dxiK1cJOgkCcHap_0y4GhwnW0E52PR7gkySnkMk3g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/atom: do not dereference NULL vbios string pointer
To: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.com" <simona@ffwll.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 4:41=E2=80=AFAM Noah Weinberger
<NoahWeinberger2003@proton.me> wrote:
>
> Hello,
>
> In atom_get_vbios_pn(), when the part-number string is empty and
> atom_find_str_in_rom() cannot find the ATOMBIOS anchor, the fallback
> computes NULL + sizeof(BIOS_ATOM_PREFIX) - 1, i.e. (unsigned char *)8:
>
>     vbios_str =3D atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64=
);
>     if (vbios_str =3D=3D NULL)
>             vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;
>
> The subsequent range check is false for a near-NULL pointer, so the
> value survives and *vbios_str dereferences address 8 - a NULL-page oops
> during probe with a malformed VBIOS that passes the magic checks. The
> recent hardening of the neighboring date/version/build helpers closed
> their OOB reads; this fallback path was left intact.
>
> Simply leave the part number empty when the anchor is not found.
>
> Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670b=
d (v7.4-rc1, 2026-11-07), drivers/gpu/drm/amd/amdgpu/atom.c:1491-1503 (atom=
_get_vbios_pn).
> Pointer-arithmetic-on-NULL is pre-existing; this window's hardening serie=
s made it the sole fallback outcome.
>
> This was found during an assisted (AI-supported) static source review of
> mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07);=
 every code path cited below was re-verified by the
> reporter against that tree. The patch below has NOT been compiled and has
> NOT been runtime tested, and no reproducer was produced - the triggering
> conditions are described above instead. Please treat this as a report for
> verification rather than a battle-tested fix.
>
> Reported-by: Noah Weinberger <noahweinberger2003@proton.me>

Missing your Signed-off-by.

Alex

> ---
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdg=
pu/atom.c
> index 1a599d5..7598606 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> @@ -1493,8 +1493,6 @@ static void atom_get_vbios_pn(struct atom_context *=
ctx)
>
>         if (vbios_str =3D=3D NULL || *vbios_str =3D=3D 0) {
>                 vbios_str =3D atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX,=
 3, 1024, 64);
> -               if (vbios_str =3D=3D NULL)
> -                       vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;
>                 if (vbios_str >=3D p_rom + ctx->bios_size)
>                         vbios_str =3D NULL;
>         }
>
