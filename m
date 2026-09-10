Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5703B1EEF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057803; cv=pass; b=MKAc+fYvrsYeMRjGJXb1ZN0iuiKLFIfOc4e8NHdBMIXzT3X37dC8pRhVR7l4XbiJ6ka4HOeGV30qAsLoyx6OZYriI9Q8zhKe3vaDZ5E7QlEwpGwylgfuJy+oIUEI88V8T7ROSAcXNq5xI6O7Km6MkDkOWsPYbESrsiY+C2FQoSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057803; c=relaxed/simple;
	bh=BBkQ9owM4UN7HjyC+I5EPj2XFIiMDuhZupokt1yGInY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGt6SDv6noiqLtNwr4pPl53Gni0lkY54lIvHUAuZfgj2bxMRdZd2/3mwbjZF59LsIjvKe0JdAQoF9BRXa4loaOm5VK/446PT+UZ3J+BVqFByUU+jqCwK0PCU7GudstfxPmpwlTpfCvHRNTxg1JqExVpO7UzPp//7FGGSGLf4vcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtkBb2AI; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtkBb2AI"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66fca0709caso5123871d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789057800; cv=none;
        d=google.com; s=arc-20260327;
        b=G+8F+Q8pvuyxfbsgcQItb0vSLxlyItG3dtsrw+D/+9083WY+cKB+W0ZibZTmUUJv9m
         AxgQLET/lsmouFv+2SIMTq4bqtOKSCHvgxdJ0mvJajqf7hTwa88F7Fr9r1W6JTs7M1Es
         nC8U0CYX1tXE4ka2kqYQU+msg515w6v+4LOPTjeL9EiI7WOwyyeWVjk9yiLSaxvtg8kL
         T40yTYr1oqZuXd/+ULjT39BBqoaxjRRX45VhzqXHboC1ZcX91tVzGjjmIKLw/brFe+TP
         15AgtIOjexKwnYqqsKkUZgQtM0SSmseKR/p9c8e1gypmM+KZvNxMh7TXI64RBfFTT9Fr
         lw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJU9YUENvOE810OZrMLcmDFYvKrM4tnNdpUx1KzH7KM=;
        fh=En6UTFSurjexc2ytOXs6ox38BpCgJrT78II4TMN3fAA=;
        b=pJ2xu1Jk+uOBlDws7G207ljvCB+SZe0FDL67gO5jDR0rWHhyeCgJcYheDIuwvVofJT
         quOx38Xqyttb28U+RNzKTlkAgb6YReNNVIW7vpHo//YGCPuMX12YoPTq2srVhK4Tpdiw
         k63YNSOk2nAFsmANnUZDS0CWrc3QhPSIqS5S2lIj39EXktbxqsoGrHbTywME9dnwGPr9
         EwfAHnjBLOj2TQR2Nt/3ognrewFk5nNZLuzSInd11mKF5qtJXjZAwIvJvHXudp6zi6va
         VQpaPLdiRuKsU+XdY+294yyfepRjV00K3SYHHY+diRbI8ofbkxwabl1ZmFMH1diRSP5a
         8gNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789057800; x=1789662600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJU9YUENvOE810OZrMLcmDFYvKrM4tnNdpUx1KzH7KM=;
        b=GtkBb2AIBkw39FGqfMwCueN2WwFrK4Lnk09weUWNjztolDm7X/WmYdUQYLN6YWuAD1
         YekMwAOpNmvAePTkymcwzNlFTVs56vpEuXoHA5DlzKwLDor0yrrDMTlCqNTtAaS4ZGpJ
         qtd6uLUizVVodfDfjMtU1H6hBazuu8Lq6Xy4EzFb+YfSsbqId6drXyhEdz0JPSBypPGv
         CLqKsRmO5HzAUvUVEJh80CVwwDzJce4OV+sXkBVgSMX2NcmpaNM5i39HIF5wlNZpXodP
         LUKn8m5NqT/D/1SHRzZq01bhZMjq94+KjSseqq1ydAlBOjmzpqI5aLIAVMGoGGysWVZp
         E91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057800; x=1789662600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJU9YUENvOE810OZrMLcmDFYvKrM4tnNdpUx1KzH7KM=;
        b=m3aexo21KWmKHvYB+2GIia3BsPnuZdKYskvIzmWRTAZd99og3mw/nWgLa9ecFhgBZ8
         afZS2HLzSw/0XVP/bZsRPY/p4UN2D6gu55KnsP45T4gkqolacFRciudTatD0j6BjC+iu
         8B6NaRD0OSz51xxh8P2MvsReVrQt5chxPeqsldufOp5p7dLJMlHfWl6B73jETuU4kTwQ
         rS3O7EkR3/rbz1/xJ1IQBCSg7cLElsRm/Q5589daIR/yhhazO+t0f/wDPx4dtfYlN7j3
         jDj7mw2OvBqFFEBMuFoYEJe5Q4kNrJxO/2L2658G6w5Z2Pzr/khafJn25tgrVRRCdcTF
         am3A==
X-Forwarded-Encrypted: i=1; AKwUvBwN1rd0PyCQCwxxj2hStbL86sK7XrEpVWj3dMLUbzluD2N/18IZF4qPlGW5IyjBnc2eJnT0RqMVcxHDmI8=@vger.kernel.org
X-Gm-Message-State: AFuF++k6/p8kmhrnLOCB981re2TEZwdulI55AAoWtbMtACOaLvNMgBav
	yGB/OXNs3IZ4txGoNaF4qAXmT/9QwK/wOuauckzG1/ENU6bVXTHqriJrFbyH2bTvH4wtRnigrow
	ss/LsUvvt10Wc7WjXrX6AZJMMc77uO+4=
X-Gm-Gg: AYBFou2Z+th73AnAVNiOM8PzhowvkaRkRytlegZSBeE2KI+knuYKLw6RN0A+Gr+UqKz
	/q8G1YG0RaVTiS/IGPTbBR89OOt4ABEJ6bbpckPFuCUO1Zp0iJGNI+5CvQm1AlJHbn96eSLgH7F
	4YIxUHZy0Yios4f5WdzOdNVCf7I0xry8ml+zm5Ijg0Qs8yr/X5TZBoKTwi7VVHp2Eckk8eeLXYz
	tOWTo6esboTC5+zdrxh5fUjCDD1sGX6HpEDP21L8rxAJ0Rts1jS6Y2GudtnVFeESpbulA+MCbCw
	ftpOI40udHk9NQfmR2N+WZXAWYDvmMRWOaou5lyXilubmIyGze3u
X-Received: by 2002:a05:690e:43d0:b0:66d:151a:8390 with SMTP id
 956f58d0204a3-6712455db3fmr16262d50.3.1789057800113; Thu, 10 Sep 2026
 09:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178905331374.213925.295025394754459843.stgit@devnote2> <178905333479.213925.1358412668943562406.stgit@devnote2>
In-Reply-To: <178905333479.213925.1358412668943562406.stgit@devnote2>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 11 Sep 2026 01:29:48 +0900
X-Gm-Features: AcwNN1VREyB4q5zwLtIZujnDUISlLPvEW2AcNPTgjqcyHIPMzOih7zYo-54zTTM
Message-ID: <CABFDxMHKQpa_WGk-RhEqQtzZoNfvZMj3J8JSYQn4-=RG+R1q6A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] bootconfig: Fix integer overflow in initrd size check
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Christian Brauner <brauner@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:15=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> Sashiko reported that in get_boot_config_from_initrd(), a crafted initrd
> with a huge bootconfig size (such as 0xFFFFFFFF) can cause the pointer
> arithmetic:
>
>     data =3D ((void *)hdr) - size;
>
> to wrap around on 32-bit systems (or when pointer subtraction overflows).
> Because data wraps around, the subsequent bounds check:
>
>     if ((unsigned long)data < initrd_start)
>
> evaluates to false, bypassing the check. The kernel then calls
> xbc_calc_checksum(data, size), which attempts to read 4GB of memory,
> hitting unmapped pages and triggering a fatal kernel page fault during
> early boot. Furthermore, on 64-bit systems with an initrd > 4.29 GB, an
> unbounded 32-bit size can similarly bypass the initrd_start check.
>
> Fix this by:
> 1. Ensuring the initrd is at least large enough to contain the bootconfig
>    footer and verifying hdr is within the initrd bounds.
> 2. Checking that size does not exceed XBC_DATA_MAX and does not exceed
>    the available space between initrd_start and hdr before performing
>    pointer subtraction.
>
> Fixes: de462e5f1071 ("bootconfig: Fix to remove bootconfig data from init=
rd while boot")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260910010137.EE0431F000FF@smtp.kern=
el.org/
> Assisted-by: Antigravity:gemini-3.8-flash
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  Changes in v4:
>   - Accurate the error message for size > XBC_DATA_MAX in
>     get_boot_config_from_initrd().
>   - Remove redundant (and wrong) size >=3D XBC_DATA_MAX check from
>     setup_boot_config().
> ---
>  init/main.c |   25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/init/main.c b/init/main.c
> index 2613d3f9b3ce..16749bb7a219 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -277,7 +277,8 @@ static void * __init get_boot_config_from_initrd(size=
_t *_size)
>         u8 *hdr;
>         int i;
>
> -       if (!initrd_end)
> +       if (!initrd_end || initrd_end < initrd_start ||
> +           initrd_end - initrd_start < BOOTCONFIG_MAGIC_LEN + 8)
>                 return NULL;

(nit) how about moving BOOTCONFIG_FOOTER_SIZE from tools and using it inste=
ad?

>         data =3D (char *)initrd_end - BOOTCONFIG_MAGIC_LEN;
> @@ -294,16 +295,26 @@ static void * __init get_boot_config_from_initrd(si=
ze_t *_size)
>
>  found:
>         hdr =3D (u8 *)(data - 8);
> +       if ((unsigned long)hdr < initrd_start)
> +               return NULL;
> +
>         size =3D get_unaligned_le32(hdr);
>         csum =3D get_unaligned_le32(hdr + 4);
>
> -       data =3D ((void *)hdr) - size;
> -       if ((unsigned long)data < initrd_start) {
> -               pr_err("bootconfig size %d is greater than initrd size %l=
d\n",
> +       if (size > XBC_DATA_MAX) {
> +               pr_err("bootconfig size %u is greater than max size %d\n"=
,
> +                       size, XBC_DATA_MAX);
> +               return NULL;
> +       }
> +
> +       if (size > ((unsigned long)hdr - initrd_start)) {
> +               pr_err("bootconfig size %u is greater than initrd size %l=
u\n",
>                         size, initrd_end - initrd_start);
>                 return NULL;
>         }
>
> +       data =3D ((void *)hdr) - size;
> +
>         if (xbc_calc_checksum(data, size) !=3D csum) {
>                 pr_err("bootconfig checksum failed\n");
>                 return NULL;
> @@ -394,12 +405,6 @@ static void __init setup_boot_config(void)
>                 return;
>         }
>
> -       if (size >=3D XBC_DATA_MAX) {
> -               pr_err("bootconfig size %ld greater than max size %d\n",
> -                       (long)size, XBC_DATA_MAX);
> -               return;
> -       }
> -

Nice cleanup!

>         ret =3D xbc_init(data, size, &msg, &pos);
>         if (ret < 0) {
>                 if (pos < 0)
>

Thanks for doing this work!

Reviewed-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Best regards,
Sang-Heon Jeon
