Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793218120;
	b=ihoSM4q39n+6G2i1z9qhXhaSO0tSGSUQ1FdaYsW2P4dViBttT/4/k1sTxxvoAVujDwxi
	 5b/aagP6nAwwo9vQp2KhdsBEHA4c9IH1sn4lXI97bh1ALh5yt6UVwPJtckGurn6OwyZfx
	 ZNoV6E0WXHM2mXs8aMKTND4oysaE/lnfr4urGx9FGBKshKYVUATlous+gdKR/WVIh67jt
	 SECtJM4DEgeE8Qs30ThsCZK6Ml7881iGbH9o9Udm/pQdU60UNU1wAfVAxUCErdKXKTfaU
	 1pR+LotZ2EbmatZVWYsrU73EUY0vxxPHRZYQbk5JCMAuvlbGY16IpJCNuQ2w8qEZqhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
	b=xO0Uvqsh9EUNRRJPQ9RAKQ0VmHn+CELF6NaXhEnopqWZYNy/bWqyPe/hlHmOEUY4Vj+1
	 XYy69OZuqXKCMfNQFo39UXEdcNDs6JLsTAM0DCB1YfSujUK54VFXHpbkkkC9hgU+FNP9e
	 +0YN6fhEnSzXGRBFjMP2MJnKAU6cIzVkFW+OjdSoBAroaLWRc1K8k09so8OtXR1l81+ld
	 MywPdn/RTdWUC4MchwjIGRlEQtTnotSuM30FzIpEfrXU3e23WSfiVtwl+KaB8o/rzHy/2
	 i9KIahs1aVshckIA2BcAnIlneB75Ua6GcWAaRWVPpn3b+afzoIclHKbmeOHD38aoftQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEEyH69v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91AD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEEyH69v
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53394bffe0fso525591cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793218118; cv=none;
        d=google.com; s=arc-20260327;
        b=sUI3djmIg76JasY/wl+7jHEaAxhYNc3cV3/az/RtKpMWfNlZMNvEbh33I/0304cE2a
         PgHBqslEk8TeiA+WfUItVaaT+pnHe24fBDK0E2I3mEyRV3A6VoI3Bs42XUd8N9rHCYLb
         AOx4WdnKsHaQlFtmjh87O4VrtVj8lN2NA7iCr5nuik6xFSC/B3hShoLCFMegz6Ix5+Lg
         giMPYl2/NDGFDIlfAd5s8p/qDmA6pYFrM33/cQ7dM1geaxQabjpEgSANKpN1U0mH5gcn
         O97YihvYFXh5u8FoCFsQ9cI5zgMPDvyUUgye/bMEgKhE+xpNKXftvI5k+8Rjj2ehOaMO
         TNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
        fh=37qyNa0bSQ2j57F7qEzUbFEN5jXqn/bF0Ndezxl8id4=;
        b=EMsMr5DqX6DcyJIhSQOjKq9Mlh+J42EDdBBL1t/qe7F3BKUEGv44YrSguinBDVtFRy
         S7Ia4Hk5CwIOyI2m87+LejSeSkscA//fCODUcNsaxKzZhG49PG31xYzYhmruRA2gXAHQ
         6xY7+3XN1yXQnfqNCBWaQElwTxxuji48mucf7/dYoEm/B4uD3eZoxDp9UT380XIb84Wg
         JkGUl31LvZ5N1Ava/Um0endkR+sNqUE4Lwb/osSxcLb7/X+kIisuVf0taVidFGkvvdDh
         UHdUg7nDs1p+w8EFGBEEgojZ4vTPLnUafm/8GxxFKVdUBA4WmtLVFTJfrvcHrzFrTf9s
         RmVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218118; x=1793822918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
        b=pEEyH69vxKtSyHuyBt7arv5S8VDh2KqYgKh6Ks8fU6542uTGOHyDvP9pc1eXUHpH3W
         7o32mLFeBCdXyq9AM99UsisHetc+5nEvPsIND3gp3p7VTVFvkaQwc6VOAI5JorBP8TE+
         XknsGrI8jacondmk9wddOBAZvMaclAu5eWgQT2adG6qA7x/clF+Qv7d2gvt8Y9HWSwH1
         d9y0Z2DwD79D32DaAHyllvDTKfpsh0ty27D6eopNa/qfSAbFO4Npd732J+GfnqPRv9ya
         PAb+02JWX0F/R+catQiXGply4TuKSjQ8sttpbgAnxUKkO/5z8iyVDySrb7Mm5vrKJgxW
         PXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218118; x=1793822918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
        b=mCvyzzMAzWZo6viY/l82CGjVNygVv5L7J6n3qkzZbg2nDASq06BmiPjdWkq+NEz2dY
         V6U08pHE0kjQ5y+aQBP4+UHYUY6RLGjuqT9fslwZvXTJDJaZyTJFqRse+i4nRAYYTQ/4
         VwUIBXlOtlveawHb5YS9srqZoGDWxZqvan4CaZdvgXNZiRGE4tasD3kLeDu4U0LQriEz
         FHNI3WBq2AYj2aeU89WllskiP7RPC787rXAijUz+b0gmZ7KRHmmNuKaqjLTPziV6JTqr
         GuQ7KB6qHb6o26seWQ3UbqYRurC6cgtiOYq/RaWpJ74L1/2myfG8vSxOaFzFCtf4Q4Bt
         JjCA==
X-Gm-Message-State: AFq9FYLw+pEby7nn7XGZ4atWsXlaE56VEX0nckiRDLsGmLY1IpagxT70
	PGmAypy5q/iksnuREivIbzPe1be57fMSnQKCUPH1EmY99jN0PzYukS0r6dL6i2urj3kPqThiLGo
	A+uH3rAi8M6nr7TEt/NrwSceRnzlS5acx3XnqwMP4VQ==
X-Gm-Gg: AYBFou2Yvnwybj0uF7DBR4EQBzX0PXCNWor/A+ev56aWL3s4FsZK1Dcfe+kUfEDehYH
	aQ5FMFGNLIvpxerbEz6pr44Vslqjn/mT9LaXGIXASXAXmVdNIX2OEY+4s1UdYRS+9y6vkLHIpAE
	PWJ1MYJCfmUKVkBcgFJhQmYkoK245FnlmJ9khn832H51BTGgGe0Fqzaqxyqz5P2Q8HVx0WCV/NW
	nx86Zpoppk5dnrHIBzwyc14eHHmGHlAbUiB7CfARJHIn0ni72pdZNNLFKJXa/Y2cvrLZ+ySyfmE
	Aoiq5GkX0IGpuy0sPsJ2DZGJLf5Dw1J1oHuLjxmRaiHkoG8bNsTk3crkH0VbZVE+5UQvXiUR/1y
	PdOTtRaYpgLndNT4OldW9w9Vmf4DnmRMFDyyD
X-Received: by 2002:a05:622a:514c:b0:534:7732:a15f with SMTP id
 d75a77b69052e-5411cb788a4mr10834971cf.2.1793218118381; Wed, 28 Oct 2026
 13:08:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028074946.12728-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261028074946.12728-1-mbkchelofficialdev@gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Wed, 28 Oct 2026 22:08:27 +0200
X-Gm-Features: AclHuK8kbOca6LOVXStMUukgPdJcdeoP4mrHtDed58W5Ys5XPqyWRig-M14_mXM
Message-ID: <CA+YDrKDv3br+wwTfUZH7z5mRpMFSAY3T5cKwzTfqUeA0dCCStg@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array const
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that I made a typo in my last name in the "From" and
"Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".

If the patch is accepted, could you please apply it with the corrected name=
?

Thanks,
Ivan

=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 09:49, Iva=
n Tverdohleb <mbkchelofficialdev@gmail.com>:
>
> Make g_fbmode array const as it is not modified after initialization.
> This fixes a checkpatch.pl warning.
>
> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm=
750.c
> index 21e310274..47d2917cc 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -12,7 +12,7 @@
>  static int g_hwcursor =3D 1;
>  static int g_noaccel __ro_after_init;
>  static int g_nomtrr __ro_after_init;
> -static const char *g_fbmode[] =3D {NULL, NULL};
> +static const char * const g_fbmode[] =3D {NULL, NULL};
>  static const char * const g_def_fbmode =3D "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview __ro_after_init;
> --
> 2.56.0
>
