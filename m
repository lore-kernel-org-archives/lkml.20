Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E047013F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039011; cv=pass; b=KLNKPpfHcHVPDtpRt+drp2j6lHWxpZ5C/aQJ1cz2WmiPZmAR5YGG4PRS27HTyGLXEISMdQGMEHm23T0NIkcJMHMtfozK9AidpwDWAS0E6BOERzB5s93vBwKqMN+SxryVLtLzf2d9MfAES9R49ZswbTwQMaxBMrNybtp00rXkDsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039011; c=relaxed/simple;
	bh=+W3Wfbrm9l0QBxIY85+kvJuwhr0yXrpNOQry462mnzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRiBlNzPK5G89Lg7rhkwyi6trB4YggD8I97w6FxNp03LiMEemMTjxmld2QmRw5ac4QCMe5Zlj1XHHSIJtXs78I9g6QT5IQhvkjBDevMTcxmFq1aG/B09LusU0+r3MDSoRGFWrxPjq57MUV3kmEY8CytjK7vnTZMhHPDbRr8JYpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpGbzV/r; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpGbzV/r"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c259e5c22ffso848185866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789039007; cv=none;
        d=google.com; s=arc-20260327;
        b=VlSVAzeGfMGK6GLCFXEy+RQRWQPbrAZybaYDDwkRq1emxCdDFfqVMB6QFHbew9WGnK
         Jo4bwSo9E7Ehmcwte9JQCz9PzJ3He4HhPzThs6Ns5ZN+h3iGeeXFxRlhIhuGVzSM1OyB
         YTONU3XYLwCz+L8lYO09Hn0pFvtlN3/O/H4HvpSjodZCj5tgMXqEVp+2w/V4JS/ibm1M
         +7/ELFcbeCTiLqhAKQaEF3kBvCD0A2ohpAYHS9Blpgw0JF7E9j2ANoCFgrQxkuLBiiKa
         nKJLZHSKpIfhGg6NkpWcBKPyGxLUEG/FJ4doIBNiDtw4Bskr+u0VhuwoSXXmU4of2WZq
         bvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XO6VaobXZGWia1X7kMvnC3RKOfj+R33S1pbngB91qrc=;
        fh=R62R57hkFr2CmmddTVut53d5sWkeunSJxgnhAYTuZKs=;
        b=KZZSq8x0qghoXHUDHCsZtDyS61XBAU5LBAXdie4r9iONY5l6DHeBCYq0jFFQkZm7ON
         MPRELuevmTEUyofJpOWc7+M7wTN1l7HNlzB72GanvEKNFgu6AH3gy/oe2oXm0pn7ygQD
         wVjD66c9tjGng/VZRaTAf8mK04nAbSazavbmgRn0a1JxY3Q2eE17Mf/6bN097cgt49/x
         qE8nxnJtsUJq7wKcEHP2SGDYJSuZTgALteNeW+WXqCHsdGrpgp71FQVM6Bo04QwLdjVN
         rdF78GIVMUY/+7eQwwlHEpUzWENrt3OL26LXExeERF0X2CgmCR4xVT3AzCwD7sPYwhVj
         v+AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039007; x=1789643807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XO6VaobXZGWia1X7kMvnC3RKOfj+R33S1pbngB91qrc=;
        b=ZpGbzV/ruwuUYdUDp34niY+2i8QFR9nc673L3bL/ilboA0OUbcpHMaUtKiEH3Q05F5
         pdj+8souSj9hkCLDbJjrL1a0Py5oNkVG2h6hOvm2e/rwzU8n97ibBWpZNzLei9rmIKFe
         /ic9AGkwHVZ3JRPESMJ4lulYIAVFhi4grng6M+B1jSg6AclE9vIWStLi3SIby+Qc4APv
         sFYmZgIF9BXlzoTb0iXsweY9q9ZSiK37W8BLU2ahvH+0ui0GpWlMsFWqk7tH+QB1uNVN
         oSYOHuLND/TirFn5vAToOYWmby/seKDuXhcawaNf7MuREXDsZXG77PKZ5E2kQrkEeV9v
         SuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039007; x=1789643807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XO6VaobXZGWia1X7kMvnC3RKOfj+R33S1pbngB91qrc=;
        b=prNKBF6xbCcvPoqKWpVqbU+hkzOsIImSe4XTwXWwvYU8hauDYk8yLimOmrALB0y7ad
         i266/Sl8ILmw5+TLxPLve15TVFophm3hYp8xrlJ6VPUmjbiJn9qgdM4YsEguj4p2VHDM
         TDr43CsaG6y8ePQcmRnbWT9l5IbmW+f2DhtdWiXYiaejkDtiJmdIqRVT+QIm5T6LM6a4
         aL8726xrPyFefI3DRzOzYoJVINROBLLDLQvcwcRtrt1meOPupkEFTDNQmfnjfnIhwxHL
         BU+PEdZR+yU0gxrPwHQnjEkiwTzjkOyMjJp71iwHi1Jz/ugF98UQ30L8TQQrl81F+kxi
         tMGA==
X-Forwarded-Encrypted: i=1; AKwUvBwdOAzHZlyUrziqhV2LBbiOpKq0Ns2FORNDmlN6x9RwaCzAKabpeAbkiQlp83oGejYrZmXXego6TuZ+f2o=@vger.kernel.org
X-Gm-Message-State: AFuF++nUBiGEjy54fyOTH4Wx1lEtWXEPG8VwqxI6AcYLNI1d8HEvlQyv
	TuxoDH1zLgqeAtpun6lmn7woysR5xJAVt/6xgXijxBBTkOjhk9d/27iKJfL6khMfuiueK8PpOZI
	QRoE0h+8NW6rhFCW5/qL0e9Axybc7rq69lLxN9Hc=
X-Gm-Gg: AYBFou2a/X6Bdb4tLLkYF+vJEANXynOPND6skBA2F4Nn9VGNvHEG5C9jHSu3/Rq61Pl
	cVnfwIIZC7Y261Q8WDpoBMOji1XdDwyDbt5OvoHcaIoyPupPq0nVmg4AE3B6aNPkDRGOlSCcekT
	JHXOkAKl2BY3CORQR/oVYUquIs4HxRwu9zbqc7xK2OReYaDZ4lj/j+AjxloIzJS3vzMG6ZfNiqV
	m7SI3B8AwwuS2RjcNdJ1Rr3ANskao0Dzfm8LDnORqJ1A2P987xvybzgBURpgZ9nq2pV1I/LGD54
	bSaHVmuJBckdJ5OAXB07rl4ueYrmQQERiLYKZYl+rE3IZwUsw95MQZzvCzYzNVE=
X-Received: by 2002:a17:907:940b:b0:c26:1691:b366 with SMTP id
 a640c23a62f3a-c261691b9d4mr1569867666b.31.1789039007375; Thu, 10 Sep 2026
 04:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829224500.14278-1-drifabdelmalekmohamedsaid@gmail.com>
In-Reply-To: <20260829224500.14278-1-drifabdelmalekmohamedsaid@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Thu, 10 Sep 2026 12:16:36 +0100
X-Gm-Features: AcwNN1VS3paqKY9JiTjA9U6ccb_T4MIJg3qpXTm9q7N8BpiXIyE1ikzKXupgueo
Message-ID: <CA+xk8n8Ox61s-o4JXjzf_A-V77Dsg92jYQS4XUUcYohCWSCcNg@mail.gmail.com>
Subject: Re: [PATCH] cachefiles: convert deprecated simple_strtoul() to
 kstrtoul() in percentage command handlers
To: David Howells <dhowells@redhat.com>
Cc: netfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this one =E2=80=94 seems to have gotten buried during the me=
rge window.

Thanks,


On Sat, Aug 29, 2026 at 11:45=E2=80=AFPM Drif Abdelmalek Mohamed Said
<drifabdelmalekmohamedsaid@gmail.com> wrote:
>
> Convert the six <N>% percentage command handlers -
> cachefiles_daemon_frun(), _fcull(), _fstop(), _brun(), _bcull(), and
> _bstop() - from the deprecated simple_strtoul() to kstrtoul(). These
> are the only handlers in this file that take a trailing '%' after
> the number; other nearby commands take plain values and are
> unaffected.
>
> Since kstrtoul() requires the whole input to be a valid number, each
> handler now walks the digit run itself, checks it's followed by '%'
> and NUL, and temporarily null-terminates at the '%' to isolate the
> number for kstrtoul(), restoring it afterwards.
>
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gm=
ail.com>
> ---
>  fs/cachefiles/daemon.c | 78 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 66 insertions(+), 12 deletions(-)
>
> diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
> index 1a66e0af2837..12c38b366881 100644
> --- a/fs/cachefiles/daemon.c
> +++ b/fs/cachefiles/daemon.c
> @@ -331,16 +331,25 @@ static int cachefiles_daemon_range_error(struct cac=
hefiles_cache *cache,
>  static int cachefiles_daemon_frun(struct cachefiles_cache *cache, char *=
args)
>  {
>         unsigned long frun;
> +       char *end =3D args;
> +       int ret;
>
>         _enter(",%s", args);
>
>         if (!*args)
>                 return -EINVAL;
>
> -       frun =3D simple_strtoul(args, &args, 10);
> -       if (args[0] !=3D '%' || args[1] !=3D '\0')
> +       while (isdigit(*end))
> +               end++;
> +       if (end =3D=3D args || *end !=3D '%' || end[1] !=3D '\0')
>                 return -EINVAL;
>
> +       *end =3D '\0';
> +       ret =3D kstrtoul(args, 10, &frun);
> +       *end =3D '%';
> +       if (ret)
> +               return ret;
> +
>         if (frun <=3D cache->fcull_percent || frun >=3D 100)
>                 return cachefiles_daemon_range_error(cache, args);
>
> @@ -355,16 +364,25 @@ static int cachefiles_daemon_frun(struct cachefiles=
_cache *cache, char *args)
>  static int cachefiles_daemon_fcull(struct cachefiles_cache *cache, char =
*args)
>  {
>         unsigned long fcull;
> +       char *end =3D args;
> +       int ret;
>
>         _enter(",%s", args);
>
>         if (!*args)
>                 return -EINVAL;
>
> -       fcull =3D simple_strtoul(args, &args, 10);
> -       if (args[0] !=3D '%' || args[1] !=3D '\0')
> +       while (isdigit(*end))
> +               end++;
> +       if (end =3D=3D args || *end !=3D '%' || end[1] !=3D '\0')
>                 return -EINVAL;
>
> +       *end =3D '\0';
> +       ret =3D kstrtoul(args, 10, &fcull);
> +       *end =3D '%';
> +       if (ret)
> +               return ret;
> +
>         if (fcull <=3D cache->fstop_percent || fcull >=3D cache->frun_per=
cent)
>                 return cachefiles_daemon_range_error(cache, args);
>
> @@ -379,16 +397,25 @@ static int cachefiles_daemon_fcull(struct cachefile=
s_cache *cache, char *args)
>  static int cachefiles_daemon_fstop(struct cachefiles_cache *cache, char =
*args)
>  {
>         unsigned long fstop;
> +       char *end =3D args;
> +       int ret;
>
>         _enter(",%s", args);
>
>         if (!*args)
>                 return -EINVAL;
>
> -       fstop =3D simple_strtoul(args, &args, 10);
> -       if (args[0] !=3D '%' || args[1] !=3D '\0')
> +       while (isdigit(*end))
> +               end++;
> +       if (end =3D=3D args || *end !=3D '%' || end[1] !=3D '\0')
>                 return -EINVAL;
>
> +       *end =3D '\0';
> +       ret =3D kstrtoul(args, 10, &fstop);
> +       *end =3D '%';
> +       if (ret)
> +               return ret;
> +
>         if (fstop >=3D cache->fcull_percent)
>                 return cachefiles_daemon_range_error(cache, args);
>
> @@ -403,16 +430,25 @@ static int cachefiles_daemon_fstop(struct cachefile=
s_cache *cache, char *args)
>  static int cachefiles_daemon_brun(struct cachefiles_cache *cache, char *=
args)
>  {
>         unsigned long brun;
> +       char *end =3D args;
> +       int ret;
>
>         _enter(",%s", args);
>
>         if (!*args)
>                 return -EINVAL;
>
> -       brun =3D simple_strtoul(args, &args, 10);
> -       if (args[0] !=3D '%' || args[1] !=3D '\0')
> +       while (isdigit(*end))
> +               end++;
> +       if (end =3D=3D args || *end !=3D '%' || end[1] !=3D '\0')
>                 return -EINVAL;
>
> +       *end =3D '\0';
> +       ret =3D kstrtoul(args, 10, &brun);
> +       *end =3D '%';
> +       if (ret)
> +               return ret;
> +
>         if (brun <=3D cache->bcull_percent || brun >=3D 100)
>                 return cachefiles_daemon_range_error(cache, args);
>
> @@ -427,16 +463,25 @@ static int cachefiles_daemon_brun(struct cachefiles=
_cache *cache, char *args)
>  static int cachefiles_daemon_bcull(struct cachefiles_cache *cache, char =
*args)
>  {
>         unsigned long bcull;
> +       char *end =3D args;
> +       int ret;
>
>         _enter(",%s", args);
>
>         if (!*args)
>                 return -EINVAL;
>
> -       bcull =3D simple_strtoul(args, &args, 10);
> -       if (args[0] !=3D '%' || args[1] !=3D '\0')
> +       while (isdigit(*end))
> +               end++;
> +       if (end =3D=3D args || *end !=3D '%' || end[1] !=3D '\0')
>                 return -EINVAL;
>
> +       *end =3D '\0';
> +       ret =3D kstrtoul(args, 10, &bcull);
> +       *end =3D '%';
> +       if (ret)
> +               return ret;
> +
>         if (bcull <=3D cache->bstop_percent || bcull >=3D cache->brun_per=
cent)
>                 return cachefiles_daemon_range_error(cache, args);
>
> @@ -451,16 +496,25 @@ static int cachefiles_daemon_bcull(struct cachefile=
s_cache *cache, char *args)
>  static int cachefiles_daemon_bstop(struct cachefiles_cache *cache, char =
*args)
>  {
>         unsigned long bstop;
> +       char *end =3D args;
> +       int ret;
>
>         _enter(",%s", args);
>
>         if (!*args)
>                 return -EINVAL;
>
> -       bstop =3D simple_strtoul(args, &args, 10);
> -       if (args[0] !=3D '%' || args[1] !=3D '\0')
> +       while (isdigit(*end))
> +               end++;
> +       if (end =3D=3D args || *end !=3D '%' || end[1] !=3D '\0')
>                 return -EINVAL;
>
> +       *end =3D '\0';
> +       ret =3D kstrtoul(args, 10, &bstop);
> +       *end =3D '%';
> +       if (ret)
> +               return ret;
> +
>         if (bstop >=3D cache->bcull_percent)
>                 return cachefiles_daemon_range_error(cache, args);
>
> --
> 2.43.0
>
