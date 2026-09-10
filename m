Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664D29B77E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018251; cv=pass; b=qqgpkrPSa87Ys75GVlq2xStQ2Sf1+1AZX7h33pfpRqyuA6tKdRXsW9IHzuQ2A4V+B6hVPrPITDD/2zod2eo4cKN1Ki5fKNPKrxBj2AmJ3ko05uWT+nM4fMzB5lTI7UWLkl/hLy3E8R+f54UyLZZXS2nxuOW+TK8ogOsVGesvWH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018251; c=relaxed/simple;
	bh=dE4Bhn4aMAfw7L0+vfoJlYFnh18vk+oBsGbKmTG1fRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fp6YPTNcQRoUC2TxV5s8NtwcePnogVhGAdfFTUtqBaGsC/ekO/N9/6FmqClz/VAvUJcsB39SITEI65AUTKkQDuJhqvhmbdLj/+mvTmMCSs/OE2b01MjwtXn9OHlTR1Ai3PWxdX2JUEHtz40PxVoIuxumUmYLubWozSNIT1eXPiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=By14Sld9; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="By14Sld9"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67109935888so940039d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789018249; cv=none;
        d=google.com; s=arc-20260327;
        b=OhfgDKCWjY7Q1dyPdF0/BSj5fyWY0MYjICPqOgClYR7O35mFakOx8HMBQM431uEp7/
         WNLPR8OkVi0geMZn0ZLI6n0d0xKwPI5UPTSFuQeMGVKNXu/mXTDMo+CptZby2g23uCK2
         InxcPl5JdGuKKDtS2y8MwVTNbQY1cIOvsVP1LUs7kKqim1VZfWv8xSeZOSxPdNlSDnnf
         lDcsAWFRZ7iuEYoGvX3+lO0SktFEgBb+++8WKeUl/rd91yZiFIolWQlZsNl932eRCxmU
         0QB7q3FJ0roCF8pIBdcdXNoUVnHGNFYk5avdTWGilmJpqFcCWF77/4YqCx2azMXk9rx4
         rceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8BnU44OQF4n8pesOxTTujOGr5i8FN4Osn0bed3yU4M=;
        fh=/obaA55fh0/t/+FELXej0xgc2sQKr6Keb+dXf3/0heY=;
        b=T2egLWXWu6oVjTnJsJ/4krSziZKY84YU9LiWkeyNtv5DHxZNK8Yyzx0ZQ80w/wW1mS
         Jp24I5rHCSVd56+gCbDStDKAGM26ftWWf1fEUlvVokxzmrCKTguGjfjsDNoM4z9s37AO
         ztmEXGzpLK+aS2VB6CaXXVFXGJwewRDhcVK7wj94i00YLmtHmv3UrZ/IQ3ApePf6sM6q
         k5xncBJmH7UvsIdkp63l1Jkt1mho8eic/au+FcHVedCog4/I4+N4YzEy9C/yMrKQzYxs
         fvV0XtC8cGFKVXLGmWXKYIhnu+Y8jXd16aqSAGqdSFl6HxPrc/vGAfl3fPhuuLtJPlDj
         T8lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789018249; x=1789623049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8BnU44OQF4n8pesOxTTujOGr5i8FN4Osn0bed3yU4M=;
        b=By14Sld9For71U52TW2ZD/MvjDbnBE4QSzDtB08TAoJNP7Bv7ZdDMT4VSC0GFy8vTf
         IlfTqAikjzoVYw51EBRPXLuf1BNLmwPaZaa/JLIz00cUNX9/c/QsdPCIFpNerjr7idF2
         HgRNqTMrZIJ/YBXHXuBewgsjtmPYayJKa1bduVCRKb7ZOKKHv5gbfvRHXxocS+4KBNld
         6hQO+hqWayIWP4VwqQyUKCQrGoDsOhVFtUcUa8DO5p9hueSbp0MYa5FDi0me61ydj0yL
         L7w2CFyN6TxSBj4ISxUbI+w7DDFsUegXhbUjlgISgNUlaJVBRlE7uvzU5W2E6ANscLOR
         2qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789018249; x=1789623049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8BnU44OQF4n8pesOxTTujOGr5i8FN4Osn0bed3yU4M=;
        b=AeJ4gtR62fBo+DSOrALc6mA8xL18Jts0FnVXFQ3kixqfUzOnxhKiFPj1qYuq5lbXFs
         m9mKl/qYhzWQ5qpkNMtYT0h6AjmgdIVlVCN1iUia2oiDDgv5I1V5JM+wysPg1cQDBC9c
         515soKOJU9vqZgMmTL+3Q2PMyGKZh3RY736WK/9Ck07M5wmrxWzMyAXbeE5lDIKUGoXb
         r8VFxOaEclYQLHZUsSx4WeOR1rrCN28DBU4Vx83cF12S61KUbMy5s4WhsJ4bRPgcmbH0
         HQxpyZXEtR9aYYp7xsieqQYBH4JPWt7B8TY9iy8sW3o/GrOqOqqcqXHrTchy7KfRByhe
         B0ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwwZ4JH8f69r1+oPDHmWdb1kdgIr7Co0O6DFzFY0yFkZB1pANrf+SWUYnqn0YzyWCszX15JIAPovUkc7Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++nxMWFkwCuPo0NawP/KxvkHOh/wsr0RxfTtwrXO9CE7V9GnZn2+
	6Uvdhz/HBIwcBW6HmBHbq05LRjwqgCW+3hnHwzqAfqOnkSCVhKMiwJBIQyKWb+oc5P7BqSL766+
	2Tz4mg2ckKrmKjIyegpkrAQgH8uVYJ7qa1deT
X-Gm-Gg: AYBFou0JJUtvnXBGb3KvISbd4CCXOeosLhuhw3fzXBNpyIy7BMQnvhRyBe1RAIdgKdz
	xG6frL8UqKZVjUADSQqxQYOFwGLJPJCQM/19B4Or7sk2yJjs8EFKbbIpRpc7uuzSydHZ2qxtG98
	5kVj1CieinlorTj+4sbQL/dz0AaQQmQ4CSRBz/+8erqH7vU9iEKf7cry6CcoyeE5+pkJrTw+zcL
	HdjCjDhnF32Dmq4gFNRJjNNdTxgwZeLoCaEWUtvK7CvkyTjA/kBurO+AGmzIxXXcdfJW8qEbkyp
	7BN2etbKZ/J3W4AIR3WBDwO5ZGf5++a9Jr3qjz59BSdvEahmss4R
X-Received: by 2002:a05:690e:408e:b0:671:1aab:4356 with SMTP id
 956f58d0204a3-6711aab4a50mr95160d50.0.1789018249516; Wed, 09 Sep 2026
 22:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178896921555.177508.434402948295885560.stgit@devnote2> <178896924262.177508.71609739247457811.stgit@devnote2>
In-Reply-To: <178896924262.177508.71609739247457811.stgit@devnote2>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 10 Sep 2026 14:30:37 +0900
X-Gm-Features: AcwNN1UJy0r07ZVVV7zgcFyQPB2Z0ZjgWQo3JaJAvHZUC2RTRjHxqi3cr250T0k
Message-ID: <CABFDxMGkRUt+_ymOODpMNR0KqkyP60UTgy_i_MaoU4v76d=rJg@mail.gmail.com>
Subject: Re: [PATCH 3/3] bootconfig: Skip internal tree sanity checks in kernel
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:54=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> In xbc_verify_tree(), the loop iterating through all nodes to check that
> xbc_nodes[i].next < xbc_node_num and xbc_nodes[i].child < xbc_node_num
> is a defensive sanity check against implementation regressions (such
> an out-of-bounds index cannot be produced by malformed input).
>
> Running this check in the kernel adds unnecessary boot-time overhead.
> Split this check out into xbc_sanity_check_tree() for userspace, so
> that it continues to run during userspace bootconfig validation (e.g.
> when applying or testing bootconfig with tools/bootconfig), but is
> omitted in the kernel to speed up initialization.
>
> Reported-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> Closes: https://lore.kernel.org/all/20260905141637.1547429-1-ekffu200098@=
gmail.com/
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  lib/bootconfig.c |   38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/lib/bootconfig.c b/lib/bootconfig.c
> index 0ec2874db9c7..884f186b1989 100644
> --- a/lib/bootconfig.c
> +++ b/lib/bootconfig.c
> @@ -1000,9 +1000,30 @@ static int __init xbc_close_brace(char **k, char *=
n)
>         return __xbc_close_brace(n - 1);
>  }
>
> +#ifndef __KERNEL__
> +/* Sanity check for regression: node indices must be within bounds */
> +static int __init xbc_sanity_check_tree(void)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < xbc_node_num; i++) {
> +               if (xbc_nodes[i].next >=3D xbc_node_num) {
> +                       return xbc_parse_error("No closing brace",
> +                               xbc_node_get_data(xbc_nodes + i));
> +               }
> +               if (xbc_nodes[i].child >=3D xbc_node_num) {
> +                       return xbc_parse_error("Broken child node",
> +                               xbc_node_get_data(xbc_nodes + i));
> +               }
> +       }
> +
> +       return 0;
> +}
> +#endif
> +
>  static int __init xbc_verify_tree(void)
>  {
> -       int i, depth;
> +       int depth;
>         size_t len, wlen;
>         struct xbc_node *n, *m;
>
> @@ -1019,17 +1040,6 @@ static int __init xbc_verify_tree(void)
>                 return -ENOENT;
>         }
>
> -       for (i =3D 0; i < xbc_node_num; i++) {
> -               if (xbc_nodes[i].next >=3D xbc_node_num) {
> -                       return xbc_parse_error("No closing brace",
> -                               xbc_node_get_data(xbc_nodes + i));
> -               }
> -               if (xbc_nodes[i].child >=3D xbc_node_num) {
> -                       return xbc_parse_error("Broken child node",
> -                               xbc_node_get_data(xbc_nodes + i));
> -               }
> -       }
> -
>         /* Key tree limitation check */
>         n =3D &xbc_nodes[0];
>         depth =3D 1;
> @@ -1199,6 +1209,10 @@ int __init xbc_init(const char *data, size_t size,=
 const char **emsg, int *epos)
>         ret =3D xbc_parse_tree();
>         if (!ret)
>                 ret =3D xbc_verify_tree();
> +#ifndef __KERNEL__
> +       if (!ret)
> +               ret =3D xbc_sanity_check_tree();
> +#endif
>
>         if (ret < 0) {
>                 if (epos)
>

Thanks for doing this.

Reviewed-by: Sang-Heon Jeon <ekffu200098@gmail.com>
