Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC324CEEA
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222097; cv=pass; b=eKn5wVrirF6AUaAMfwv5kbQtZ4PqQjY+igUxFrMWoBLuZaz23/QDp8hClxKvl3WZdmCVcUkpDweeUzgYxhbncwGLQInogu8ZxNGHRTEv+DAJTFxhdgBIDIZO0Hu4Kx4FXGFGDCtDZI/MrmsJG2+eN5s/ygTmXdsiJx3ixO9/BIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222097; c=relaxed/simple;
	bh=5uOr8p7DqRt2I5FaIN0QytKVHrrF/qtai+yJg4KKO8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekZ4SN1ts9vk1yTjctm1/e5Td8XB+DArK+Dw1Yx7ZJtyJYVN9KyI2zbELSlqjEnVV+3jRJSL6egYHj76wvmJ5gk6D9F0fg8zYp4Ch5A+fTJqJ9mv5BJ0hjCxbJR+oSUAL9VJzquDdvkqsueiwIA56gN3vtNmPfs+kCsKzh51unQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrYOCJCS; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrYOCJCS"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20a32so431759d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789222095; cv=none;
        d=google.com; s=arc-20260327;
        b=FOrrURcmd5PUTsMIEmhVwTK9tYr2J+klfA+oc3I3VyKHDngPM3VHZ24KcgXyJcaqgO
         36gucYCf2QiqkcOqwIWR2M8BwXv/BWNy3j9qs1yCWnLAeulu8c19IEb6TWZ5z6wLMGng
         TPhbIbt+3F9E8qUASTB+RroFWGMk/BDlQhW44f0JXBlSe8oprQ5lgcHg5OfvdXxZklM1
         LT81QA0/K4L/ITAwPg03RmEo6w1TLaSdREJ/bUl2cFTGcon9Kk4wuNVItUglxw4UFNqW
         TxK5k9w6FbIQ54QFUUGAswcKfA/czPekWvb5LmVu5TS/x5AASX21o8rbO7dFiqCASwKB
         asDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7WjkJsu7el/anrZUUUZZcrgixqtrFoxXXx7mkONjgg=;
        fh=aRt6xqNzm5SwdavgcEozMHVzd7FM5Lx/+K7Qs6KZ0ZY=;
        b=i01etNzrOyQJ+7oiRFxpCanD8K6LiS++eFwOnOx1GdnB6ZWIrCCZ6YIKLdkJhFAbsv
         Rpnlt8Eb9OiF4OSDly4jLKf5/Lg3tDIEq6VlHG7P4NW3IKAGes1aGr9wp/MZjQMbF49E
         3IVnWnJYuq/u+Sztttz0kNjxCWazC6j6qWBUdGetsfVRZ+gzBxe+0bu85VBetzGCzkbO
         mnNoQqygULZElQIJaiU5Lq0O76KYTvM4ZJ67wyZfzDMCuve20NwcC1lzHVPonnF6uONY
         segp6nXCt4r4pUlyRPylH05ayI5ofXsWjOkEQHJK/73OIlLAbJbRFfbzniZBuW1WwVQj
         WN8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222095; x=1789826895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7WjkJsu7el/anrZUUUZZcrgixqtrFoxXXx7mkONjgg=;
        b=JrYOCJCSRVmAclpH2D9Dr968jjyzcVlZHoPSJxNG62/tD2sVOPz1i9Kbzs5NFY1l26
         FHUMNTdjTy4Yx49LzDeVB03cbVZGVLpPsD0TuKbMx1a9qLvVYvfznOc1q4nCuCaXnRtQ
         LMLGTLh50CbB6f7DuqRsj3VSE/WhRVGDH+75gRmcdlvErmcTup9W8bAjPoUeU8wrVu/9
         Cg0ieRiPn8Nj/2fLIiZnNh/N7rt2LBWfB4SIRCdlWmhtDcuQOzbdJRH/c4YGFBW9ivgH
         3ukY73GbU/9OJmVejUUTaMC93bK6MNA9A5Z6xnH2/yfEN5H9BFd9lG2Pw4jGTZp43NMa
         pZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222095; x=1789826895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7WjkJsu7el/anrZUUUZZcrgixqtrFoxXXx7mkONjgg=;
        b=b+kWR/OTeLMBEHS4o1U+kJyJioOOpz9N4Rl36i6ANWHwawEBqeBLQ/iXxq115rZXRH
         68qO+JqFyqX88Q84jN/3JG51GxJeNwXMRsWgIgxVn97guoQElF3iVMyXh5RpDqefkp22
         +uAudfsL5FtWTO3ys29QzPRokvw6B6ToUvVHQvzhWquFdvXvTxQWqU4kdnFxhYuTG54U
         t+2hm89VlsxF06D6OLmxs655JPyrAcgn02D4bxFhAaHSJM7nV6/BkU4NDmHCzaA1zUeD
         uZg40irVUPPDbwss8eR6xs8Dw0ft6xtMbZB1wXHd+HqlZlnZ39znsqABBXJCqycSrV7z
         axJA==
X-Forwarded-Encrypted: i=1; AKwUvBz5mmmevT2sEDdG+unJSzdqn8E55V8yOzJlXwKK4vOahKVmDdB3n/HpzXsTm2lNpOJNLlVXw4zlRt/HHew=@vger.kernel.org
X-Gm-Message-State: AFuF++kFEzSTDwGrECM2YGjgxF1x9XKrXCH151jbExQzdFL3gUsZ0qff
	5olBQSCfijrb7E8z/mlJ5ciA/Fi8lvU0j38WQG7e4WCu1SKNrlamKD0DOoIMybQCM2UN199c48B
	2/I7WXBDB/8dFieLPknt1PtTtY2vlwQE=
X-Gm-Gg: AYBFou0IEGC8CFLUGT78uBMu7rdaKszcUyfbi8C+hCM0s+gs4xNtyME45ntZ+cKnFOn
	8Kp1BJOjzySSykiklTbEmGpYN1+yIdiUUSa0My43WteJvwn9w97XHTaPNl0RL44OIRPhtlHmDLK
	/mBSqTAvP8LUTyRAUdQNlM0whMWFsFtWFpsL/rOThAI+50r7Squy+Tyfu73sN7F00ELL6y9PvNS
	tym3Y7fFVSlnWHkOa2/xR2UOZizwzo9zgKY2xlhI+EtuLqgCAU0Vu6j2k7HpnZ8V5E6SKTZPXK0
	psagkk+Il0qnzwSNFYsd9QgPKS7mqxbRKd6UcCo5/3Ahcfdr+epy
X-Received: by 2002:a53:a0c8:0:b0:671:19a5:895 with SMTP id
 956f58d0204a3-67135ac5a6bmr425263d50.66.1789222095116; Sat, 12 Sep 2026
 07:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178913597653.248794.1237187523153227751.stgit@devnote2> <178913601321.248794.4786502771058559887.stgit@devnote2>
In-Reply-To: <178913601321.248794.4786502771058559887.stgit@devnote2>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sat, 12 Sep 2026 23:08:02 +0900
X-Gm-Features: AcwNN1XrUgkqLzl5OLmwwDb4kzXPEVcKPgnPsG-Q3skEgQyxDC4sfeIpF9Foyu4
Message-ID: <CABFDxMG4JZODpPyov2w4N7jsq8YoBsf47QP0oE1fuq5PLFf-Xw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] bootconfig: Move BOOTCONFIG_FOOTER_SIZE to include/linux/bootconfig.h
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:13=E2=80=AFPM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> BOOTCONFIG_FOOTER_SIZE was defined locally in tools/bootconfig/main.c.
> Move it to include/linux/bootconfig.h so that it can be shared with
> the kernel and user-space tools. Also, use it in init/main.c instead
> of the hardcoded (BOOTCONFIG_MAGIC_LEN + 8) expression when checking
> the initrd size.
>
> Suggested-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  Changes in v2:
>   - Newly added.
> ---
>  include/linux/bootconfig.h |    4 ++++
>  init/main.c                |    2 +-
>  tools/bootconfig/main.c    |    4 ----
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
> index deda507500da..6f23ec11baab 100644
> --- a/include/linux/bootconfig.h
> +++ b/include/linux/bootconfig.h
> @@ -27,6 +27,10 @@ bool __init cmdline_has_extra_options(void);
>  #define BOOTCONFIG_ALIGN       (1 << BOOTCONFIG_ALIGN_SHIFT)
>  #define BOOTCONFIG_ALIGN_MASK  (BOOTCONFIG_ALIGN - 1)
>
> +/* Bootconfig footer is [size][csum][BOOTCONFIG_MAGIC]. */
> +#define BOOTCONFIG_FOOTER_SIZE \
> +       (sizeof(uint32_t) * 2 + BOOTCONFIG_MAGIC_LEN)
> +
>  /**
>   * xbc_calc_checksum() - Calculate checksum of bootconfig
>   * @data: Bootconfig data.
> diff --git a/init/main.c b/init/main.c
> index 16749bb7a219..37168bd68126 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -278,7 +278,7 @@ static void * __init get_boot_config_from_initrd(size=
_t *_size)
>         int i;
>
>         if (!initrd_end || initrd_end < initrd_start ||
> -           initrd_end - initrd_start < BOOTCONFIG_MAGIC_LEN + 8)
> +           initrd_end - initrd_start < BOOTCONFIG_FOOTER_SIZE)
>                 return NULL;

Cool!

>         data =3D (char *)initrd_end - BOOTCONFIG_MAGIC_LEN;
> diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
> index 652e491b9c33..d4aa96da970e 100644
> --- a/tools/bootconfig/main.c
> +++ b/tools/bootconfig/main.c
> @@ -17,10 +17,6 @@
>
>  #define pr_err(fmt, ...) fprintf(stderr, fmt, ##__VA_ARGS__)
>
> -/* Bootconfig footer is [size][csum][BOOTCONFIG_MAGIC]. */
> -#define BOOTCONFIG_FOOTER_SIZE \
> -       (sizeof(uint32_t) * 2 + BOOTCONFIG_MAGIC_LEN)
> -
>  static void show_xbc_error(const char *data, const char *msg, int pos)
>  {
>         int lin =3D 1, col, i;
>

Thank you :)

Reviewed-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Best regards,
Sang-Heon Jeon
