Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E41238C2A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018217; cv=pass; b=idqrFMch1T9gVjyJqwEaF6ChvYl1zz3w4vDnNSkGptY/2oPZEnsFO8VBFMA3pjKusVm/NZkwDXOmAY/tAVvXF9J64FufCLO0p9pLNCad6O+X+PAbJLzq6tuabxMObSVmI7wdGX6TsoxAqeYCX6VBkzXt2FoO+k+gK7WllcSWbBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018217; c=relaxed/simple;
	bh=6+r/l5FWByQ+n4faO2Eo/5Uc3+EXctJlMmoaEasmkFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PI4v+t9Ngm32+SH1FRFXX6r5qHIDEhzZOqiXa0JKest0IUzrlj0zz13ahXRtu4DQZ9HRy8ho8x8OY3sm4jq4fEfZPtt3YBX6aHOlizXFNilycTD6eRFIQpoBdbbBW7TRCVUec+oAjAuMIb9rUbDuqfY0hkMKK0vMvcTu9rKjyo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3BEL4jM; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3BEL4jM"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201f9so1218336d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789018213; cv=none;
        d=google.com; s=arc-20260327;
        b=XNPcVkNSRE5SoHYisFp5twJgXwohVYOTYSZ0jVGMfX4SbUyvbHt+11XZwt8ApJZqnS
         2nYtsDLT0PoKEY+otTGJiwiRWqXVk8Ag00YHJeic9btGyEfqrUW1oT9ZVNoe5KZf+Cvy
         bhRQgFSqkO+qrsUN8ydHaq801ihQbi4j+drzKeHa62nCAJvsdste29fMSqXJiXmwGlrU
         77pnu7r/m67CWhHffYFmpk67eD9ZO0HCynBVitbWa/rcIjNfIlgUvSrnQuLIm+JH2AN7
         SJNTH/7uyQnIRUwDIGuMh2WsaR0fSDz9Mj6M55RdZ7i8EkerjtuydDCVrchcyuRyRaoI
         qPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SL/Ub/01ZpDBq9q8t75/9PevaRdy7NryO7lt0HzkAFI=;
        fh=0DBEy8VnjcCZoYE40eU3Hv7n+2ALJcwVMnAisaD4X7c=;
        b=X4Mck0fzjBB2SW0BWrc+l7akifiXYZe4rRMCAqym8Oqn28xGmno8AOvqrmIMyqpdhX
         aasADYfcuSISaJO2zbtVsmWWNCPMfF1WPa1uKAkQkRIORQs+pPdTl0N21kGWAHSufIxH
         0MDkxxqxrgcx6JexZitJd8qEJ20NbrPqEnzp2IGDZBUhXU57dPkoXeOog1R7BqgrOFxx
         Qs/KZ/XoPMk9VGSuhjnfWER41SKaLVw++PoJJ3U6ToDChu+Re+EYS3lWgpOENCJuQA5g
         d/NYnc77lC550gUMBjALmlNiSl8dTw3bJzP1l13rdjuZzWW9FwjivrR8azZxq6KhuMQx
         oMFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789018213; x=1789623013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SL/Ub/01ZpDBq9q8t75/9PevaRdy7NryO7lt0HzkAFI=;
        b=S3BEL4jMxRVfc3N14cG0KRRp2oUITRHAeU7gW9Au2Q7USemm5LzUdTWkL9+FvflH22
         QCj2CvtFDrSbWaabsWAsaM6Yza09JqoQGYzH+QXwQWnb21XsM9u1PyFxydl0AuIxExtU
         gaQ81zbfuJbgfSV3i6X9XU3mxZzIU5RfKu9jQS3QS7TgGTJDl6Q19CpvNgQP3POVQAcV
         1WZXjk9x27KTBDwu7tV+MscZLmnY0I/kmrnyif8fp9/a4e3mayis0eqfqKPCsxhrZtKq
         klzoxZ7exgiNaEaUSoGal2QDW2KL+fpxayEKAxzmQR8LKuql2PLwdnSqLUaLtCkBKkq7
         ixVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789018213; x=1789623013;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SL/Ub/01ZpDBq9q8t75/9PevaRdy7NryO7lt0HzkAFI=;
        b=rRbh8tmzC34A/k0Am/gMZqQhW3/Y+nqjqR9QhjY6E1RqyrVzxBYWwtbWMRi7GTErpl
         um55rsrVCJr7rZ64CspT8AL5h0juNgCv7z7N4PSgPBMDRTwrOVohIUJCyWNHCwHeDuEj
         9zreCQysdNbrWp0paDUtPlhkg6pmR8NvoU+u4X8DHG+ScdFNB5BcZS3VKmydco2mlvff
         5XXIDpeh385lLGDB2boC8OVHNnBWFgpTwW+raHjqJLNUReNa/hOLc9Cp7t7SbH/g0mPJ
         N8vqfoEaoJqDeGersXFKTur27eSyaqaFjUGYRoHK2J7gNHW3NUhD3mWDO6op78dBVouU
         N0hw==
X-Forwarded-Encrypted: i=1; AKwUvBxk0ocbtTEQdR3BHH011AADhq0Anivp8+KvWSPDoL/RA8G/CCo2QSEyknrO+wLYhUObML10ShchCmYYbzE=@vger.kernel.org
X-Gm-Message-State: AFuF++msCWw93nfW+hjXDOupX5YuzlbscOZYSPrJiwu9stiTQmuRwkCB
	XoBG5JVmIPtjffRzoLSL/cXRvrEz/DdNzN9e8QVsdqmHysne5/Q7BXyWjo1PTom6jySQyGz9iva
	Bc0ybfr5+HsgbmG+fWA+12PIuCVAs3K0=
X-Gm-Gg: AYBFou135CYMaRogf7/mywNUPjUjwOWV8+C1MF+bwA6r0WSJkSo/WYgvPOL8oztoPWa
	fmA8RLpmfuteD+NDsyj/beJFILwoiC8DDPTlrtIA0BgWHSz2X0huhouMpUbEDPgO+p8Om5+4IYA
	sGnBG59gI1eRCtIwznnuA+bLwVoQAFx0o+1pMUKSyCuHbwzCK9aBn4BzdVWrkxcfqczZRppwWOY
	QOvZxBT8OIG27nZFhS1vHMENHcNecB0FOYh5QUpx76YnFhyE4b1buRj2PVK8FwG6q2LYPYPhBUv
	BnFzc7bAOoAZ32PDfE1uAhcRPE7jhUoG4ikLAkysOM3Msj+92MUs
X-Received: by 2002:a05:690e:13c7:b0:671:1ac1:d68f with SMTP id
 956f58d0204a3-6711ac1d6d2mr41659d50.60.1789018213253; Wed, 09 Sep 2026
 22:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178896921555.177508.434402948295885560.stgit@devnote2> <178896923375.177508.14682854552827605824.stgit@devnote2>
In-Reply-To: <178896923375.177508.14682854552827605824.stgit@devnote2>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 10 Sep 2026 14:30:02 +0900
X-Gm-Features: AcwNN1W39DebY4-NKSzrC47yPXJPl1Spc-xzJ07-z_uT4CDOuu2q6Jgrby-ybv8
Message-ID: <CABFDxMFbHoDrGKr7039XL3BwHOjZC+4Qt2YQNeGbyuAitQPGDg@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/bootconfig: Consolidate xbc_init() to error
 message wrapper
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:53=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> Use init_xbc_with_error() for all bootconfig initialization in the
> bootconfig tool instead of showing errors in different way.
>
> This simplifies the code logic and make it easy to maintain.
>
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  tools/bootconfig/main.c |  108 ++++++++++++++++++++++-------------------=
------
>  1 file changed, 51 insertions(+), 57 deletions(-)
>
> diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
> index 6035404733c3..7117aa9b2a83 100644
> --- a/tools/bootconfig/main.c
> +++ b/tools/bootconfig/main.c
> @@ -21,6 +21,47 @@
>  #define BOOTCONFIG_FOOTER_SIZE \
>         (sizeof(uint32_t) * 2 + BOOTCONFIG_MAGIC_LEN)
>
> +static void show_xbc_error(const char *data, const char *msg, int pos)
> +{
> +       int lin =3D 1, col, i;
> +
> +       if (pos < 0) {
> +               pr_err("Error: %s.\n", msg);
> +               return;
> +       }
> +
> +       /* Note that pos starts from 0 but lin and col should start from =
1. */
> +       col =3D pos + 1;
> +       for (i =3D 0; i < pos; i++) {
> +               if (data[i] =3D=3D '\n') {
> +                       lin++;
> +                       col =3D pos - i;
> +               }
> +       }
> +       pr_err("Parse Error: %s at %d:%d\n", msg, lin, col);
> +
> +}
> +
> +static int init_xbc_with_error(char *buf, int len)
> +{
> +       char *copy =3D malloc(len);
> +       const char *msg;
> +       int ret, pos;
> +
> +       if (!copy)
> +               return -ENOMEM;
> +
> +       memcpy(copy, buf, len);

Can we remove this? xbc_init() already copies buf and does not change
it, so show_xbc_error() can use buf directly.


> +       /* We do not terminate the copy with \0 for sanity checking */
> +
> +       ret =3D xbc_init(buf, len, &msg, &pos);
> +       if (ret < 0)
> +               show_xbc_error(copy, msg, pos);
> +       free(copy);
> +
> +       return ret;
> +}
> +
>  static int xbc_show_value(struct xbc_node *node, bool semicolon)
>  {
>         const char *val, *eol;
> @@ -187,7 +228,6 @@ static int load_xbc_from_initrd(int fd, char **buf)
>         int ret;
>         uint32_t size =3D 0, csum =3D 0, rcsum;
>         char magic[BOOTCONFIG_MAGIC_LEN];
> -       const char *msg;
>
>         ret =3D fstat(fd, &stat);
>         if (ret < 0)
> @@ -238,52 +278,9 @@ static int load_xbc_from_initrd(int fd, char **buf)
>                 return -EINVAL;
>         }
>
> -       ret =3D xbc_init(*buf, size, &msg, NULL);
> -       /* Wrong data */
> -       if (ret < 0) {
> -               pr_err("parse error: %s.\n", msg);
> -               return ret;
> -       }
> +       ret =3D init_xbc_with_error(*buf, size);
>
> -       return size;
> -}
> -
> -static void show_xbc_error(const char *data, const char *msg, int pos)
> -{
> -       int lin =3D 1, col, i;
> -
> -       if (pos < 0) {
> -               pr_err("Error: %s.\n", msg);
> -               return;
> -       }
> -
> -       /* Note that pos starts from 0 but lin and col should start from =
1. */
> -       col =3D pos + 1;
> -       for (i =3D 0; i < pos; i++) {
> -               if (data[i] =3D=3D '\n') {
> -                       lin++;
> -                       col =3D pos - i;
> -               }
> -       }
> -       pr_err("Parse Error: %s at %d:%d\n", msg, lin, col);
> -
> -}
> -
> -static int init_xbc_with_error(char *buf, int len)
> -{
> -       char *copy =3D strdup(buf);
> -       const char *msg;
> -       int ret, pos;
> -
> -       if (!copy)
> -               return -ENOMEM;
> -
> -       ret =3D xbc_init(buf, len, &msg, &pos);
> -       if (ret < 0)
> -               show_xbc_error(copy, msg, pos);
> -       free(copy);
> -
> -       return ret;
> +       return ret < 0 ? ret : size;
>  }
>
>  static int show_xbc_kernel_cmdline(void)
> @@ -412,9 +409,8 @@ static int apply_xbc(const char *path, const char *xb=
c_path)
>         char *buf, *data;
>         size_t total_size;
>         struct stat stat;
> -       const char *msg;
>         uint32_t size, csum;
> -       int pos, pad;
> +       int pad;
>         int ret, fd;
>
>         ret =3D load_xbc_file(xbc_path, &buf);
> @@ -427,6 +423,13 @@ static int apply_xbc(const char *path, const char *x=
bc_path)
>                 size++;
>         csum =3D xbc_calc_checksum(buf, size);
>
> +       /* Verify the data format */
> +       ret =3D init_xbc_with_error(buf, size);
> +       if (ret < 0) {
> +               free(buf);
> +               return ret;
> +       }
> +
>         /* Backup the bootconfig data */
>         data =3D calloc(size + BOOTCONFIG_ALIGN + BOOTCONFIG_FOOTER_SIZE,=
 1);
>         if (!data) {
> @@ -435,15 +438,6 @@ static int apply_xbc(const char *path, const char *x=
bc_path)
>         }
>         memcpy(data, buf, size);
>
> -       /* Check the data format */
> -       ret =3D xbc_init(buf, size, &msg, &pos);
> -       if (ret < 0) {
> -               show_xbc_error(data, msg, pos);
> -               free(data);
> -               free(buf);
> -
> -               return ret;
> -       }
>         printf("Apply %s to %s\n", xbc_path, path);
>         xbc_get_info(&ret, NULL);
>         printf("\tNumber of nodes: %d\n", ret);
>
