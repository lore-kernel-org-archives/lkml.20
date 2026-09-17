Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31D4DEC09
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672772; cv=pass; b=OurRGmx5mHJrJD4rwwif8kjsaS2aXyRZOpOK2VBpgpTwuc/NPSzL1IvDgOjQqJaHFbuK6KIp1NaCcCaJCl9MWKmRr3WjSzrvhogyjaKjLWRxiVmCijGJuTyrxwsOsRLAO2NXd71/wwW6QRRb6EJgW4x1CFhC03e2hJ6PomcEFBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672772; c=relaxed/simple;
	bh=vg/HnBjL6ui8rIqhl2mHTCgUWM64HScF5/iWIe/ShIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVxiCQezMq+IkBjoLFLwSSJzW7WrLtaH4uxazqvpjbBXp2LFOK2Pr5Igvmm01FJmO+vpr0VJsMN482tVtBq9E83m+GaA9fEB/KsBi8J1nyErw+kSpNx2kYXVXqYyhncmMpVHtUBOHD3EjVbZQbL8skhp3i+/Ylx8sc0+2/5nE/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=nLybyOiJ; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="nLybyOiJ"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E5AF33FCF5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1789672766;
	bh=9ZQkQJ8DBmzRmP+IXbsxhfErJtZ6ER/ycldjmLcGGe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nLybyOiJ7SKhwDnpnmvhMCEFIaInDvUq8COaa8Wp+wRRI4aOKLDA+6lnwYzawaCj0
	 LkF3zgmWRAgiG5ZOkoCJav5IlSDycklo3IyplmPXxmisalPOVcreZibfdoe+fNSjgK
	 7BcebBbr5R6XlMUJ9BJa+yI8eSLSOyS91NyC8yOv+HALineqoU2m16mkWmy7t1BoQf
	 cF/fI9WEomcqcXhKjhvHUgQQ1apEfSgizZF01mc33DYOeh3uEAqKP2qwvJkaioVJ4y
	 fHBI0nfp2UYZSG1QYzrc5P0leByRPN92yIfCqLZ+pO09ecMx0Q47qdctZ0tAB8dv3Z
	 febwGU8Kmz0AOeBUyXSZF+8Vtp+SMkTlC66xBIrCcaBZYc3OvZxbpv7ARCgn8apbFb
	 4ADmgxLS1HTkh6V8OI3mMxWlmPxvtxlCTwpPpV8h+ati2+k5fqCc6Ua/DcdTHfcKbs
	 mIFa6F7S4vu4NkZG5qYnB30mMx1X+5FdXL8aVu9ZwYzr2Ke/cWow1WbEsfUpugvLgw
	 V4g7hTYvTwvxrBFqfT8eM7pGYJjKOzjNOpRN9O3AAUVbL0/9pK5Ook5QxwBGOGlmhC
	 +baUGAsZQZKxIx/TJDIezTUUfAVEuYPPQD3sPht9ZfQtLI8DcEXZEsGazpGvKex0+B
	 A/q/Hl+hZC+43aAv2s2NrNY0=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c253185765dso143030266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789672766; cv=none;
        d=google.com; s=arc-20260327;
        b=BXjlPtt60gm8fpJnlbM+fBsHlH4yPLn6Y0KouEICwUK+Tf/x9llVuWmttQMFIsQx5+
         4PT3zIqEhoVMz9INTHtRFqUSBlk974JGxuDDD/b8ehSUn5L6am+y40VL/PjIDto37TjZ
         nnvoF6nQGVqUC7f1oBC+6LgNpNrY8wH+Wl9ZDk5zAug9GEOSfhiB3d2LvD0Lo+U7mv3s
         2dcoW3MN3usoaSr/nF6QsoMeD4R6beO9enwXBySZag+MM96r7D9nt1rWKRAaOhBgUKpf
         pEIarr4vuRdBULs0urIAb3BLvO0h1lgxDyVrFqFnpPgdXPFXc9aXgSvRwsKcoWNEW2Qt
         s9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=9ZQkQJ8DBmzRmP+IXbsxhfErJtZ6ER/ycldjmLcGGe8=;
        fh=byFjlnpjPdCXJno5Oom+Ck4lrhewjb6iXJut78nMv84=;
        b=CNyV4uUT4vz8hqbLiuzuWnsqYjuSC1y3oXV+ibMGl/vzF0wvBB0Ndja6lTW10l9vDH
         wWZmeVTrpDdc3dcrl2q2hPxLiRrWky6WgO/YWuNDsh8BdOo+s/sfIGmT3x29dkQxcq27
         b935di+xPXirHJ9aSg8qIw7ddRWO+6AsbWI0z6PkO9tiIIKXDnQpNpBzb7vReQbeZFXL
         wKikVGxJI1zxIZM7hg257sX5UgtcmHYGij2chV9H2xiNgGmR3Q3Hyf7cd2UuDL+6lybd
         6Drb544fqx+lHuSoR5wAfhgxtj50HpOnmzQuML1tA+HqBj8Z3IrczNsn0Lbv0AU+g6ub
         b8tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672766; x=1790277566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZQkQJ8DBmzRmP+IXbsxhfErJtZ6ER/ycldjmLcGGe8=;
        b=eDvL4rePiL4cPh6H9h0gevYmPD0sP6qvwM3E2BAGbOjLjDVLokltPCMvf2Bp9qPNMM
         Gqbe+8/0YV6Afro8eFuNXL5CzSa1TqP6HnQKXPDzoufjPwTbdJhM81tEPU+3LCUXGVwL
         A0DpHD3g2oyl3ddywFJ45Gvd8jM4xRSqCfH3XKI6fS96yhQGDfL++p+SKrzcMN38R9zc
         AAqo/1KgrV5qPBHp/YRJZhGUVk92MffedsUQ9iE0FhGEf1APyJyxUboukEQn++iCqNB3
         CDa0pMJtFtxiJtNbf9kBUp42ja6U1V09ER3h6qreVIrhgUf0IupmJ1dPo5GjAZxxAuzs
         80WQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ4q1VlpaSdqcjNYG6hDnZQ9lzb7hcqVf7TJynjms8H65EXeFE3nFtyx2xEtlb2++Gu1DMMary3G3L6UQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kroIbnDydER99mFlWClDj5Ghqu0O2CCskWvjXVjeciFhCcfGNb
	3xEZGsjtp4aMDhXDCzrmbB8tPl6NPVEvpfHKjawdH6Ioc9z4mm7PZhPZe2n5j7FRvN05ldiETEN
	sdNWnaFBWNwJCofsRhI+oRjkV7T1fQM3Meljczd/Mkt82K+4QAD7yxPi5bOIui8rmzCYij+w2kY
	umUCoaX+Qwx6WaE5WxALBhm9dixlbLAPkfUxeUZWGSZuCMLYFVVzilemnv
X-Gm-Gg: AYBFou2synORKQ1BGVSJVnxKGe6nGJS3Pi/96f1I79YLrKpNDB+siuEuVejhbvbOfmx
	P1iJUD+XedfYjOZ2adMSxOeR6ghr70k2kaH1HN10NWGJ5oKyTzWOMNg07UQIjk/xIbF2cXcLXt7
	XiRu5yqL5xgN8V4AwDIBrUOSQrKH4VqyGdkR6M6wKDsnMQ0Vjo0Y9D7fy4k/NwxCO8s1zGLPpsb
	YU4R4UO56U53mpbBphwnQFEhC7X8Ct4uUey/0SIFEU=
X-Received: by 2002:a17:907:d07:b0:c26:1691:b374 with SMTP id a640c23a62f3a-c2a15827d9fmr13364966b.45.1789672766386;
        Thu, 17 Sep 2026 12:19:26 -0700 (PDT)
X-Received: by 2002:a17:907:d07:b0:c26:1691:b374 with SMTP id
 a640c23a62f3a-c2a15827d9fmr13363866b.45.1789672766071; Thu, 17 Sep 2026
 12:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917164136.2162858-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917164136.2162858-1-vulab@iscas.ac.cn>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 17 Sep 2026 12:19:12 -0700
X-Gm-Features: AcwNN1Wzvx_67694p1o28AQ7birKEsyjcvTFnAQ2BuPeUqdnKMT1U0VxjCdP-Ys
Message-ID: <CAKCV-6uui82r4U3+ab=2ZFQvGQYnxfhYMHJNzLim-HEw6pRp7A@mail.gmail.com>
Subject: Re: [PATCH] apparmor: Fix label reference leak in aa_unix_file_perm()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: apparmor@lists.ubuntu.com, jmorris@namei.org, john.johansen@canonical.com, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	paul@paul-moore.com, serge@hallyn.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:59=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> The inner block in aa_unix_file_perm() re-declares plabel, shadowing the
> outer variable that is released at the out label. The reference taken by
> aa_get_label_rcu() is thus lost when the block exits, and aa_put_label()
> at out is a no-op on the still NULL outer plabel, leaking one label per
> permission check on a non-filesystem unix socket.
>
> Drop the shadowing declaration so the outer plabel is used and released.
>
> Fixes: 88fec3526e84 ("apparmor: make sure unix socket labeling is correct=
ly updated.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  security/apparmor/af_unix.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
> index fdb4a9f212c3..ecb40cfe7e14 100644
> --- a/security/apparmor/af_unix.c
> +++ b/security/apparmor/af_unix.c
> @@ -758,7 +758,6 @@ int aa_unix_file_perm(const struct cred *subj_cred, s=
truct aa_label *label,
>                            unix_fs_perm(op, request, subj_cred, label,
>                                         is_unix_fs(peer_sk) ? &peer_path =
: NULL));
>         } else if (!is_sk_fs) {
> -               struct aa_label *plabel;
>                 struct aa_sk_ctx *pctx =3D aa_sock(peer_sk);
>
>                 rcu_read_lock();
> --
> 2.34.1
>
>

NACK: this exact patch has been proposed before, and unfortunately
exposes an additional latent bug around plabel handling that results
in a use-after-free if the shadowed declaration is removed without
additional fixes.

I can try to dig out the relevant exchange from the AppArmor mailing
list later, if you'd be interested.

Ryan
