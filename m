Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5F4BE457
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057020; cv=pass; b=E3rNJnKAFktCPcqNeMcomDWmhlhiLHCVoRSJ12ykbM6vbjm0eKhD+o7G362ZLvvN6obJcST3FQ1JLTAhjIME7/WXasxisz16AbbM92mwhgiigQOE2CQeW0RQ94YWZpJvQcn7micwnOt0/uKlBzPgy3zhzheOj4gaEVPEZZBGkeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057020; c=relaxed/simple;
	bh=T2UYgqMqBFLaXt6hIoV8pbqyPc4eFhSqWtS38bBei8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szIau1A0HOHUh0oJrQnGBefEQua1aGY5fIjUgF8REAxnJz2BSkto5ly393W/ur2k51a2C7QSAJbQNbeljK5FPYZ3zi+Gb7mpJ3emSoeMwVX5ymqrmyb4x2HZXawIksrKH6HVvhF9cpqyX/AecMQzllK0q+CUXM2QfyB/suA4tl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rqu6Z/b6; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rqu6Z/b6"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67123200bf5so364255d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789057017; cv=none;
        d=google.com; s=arc-20260327;
        b=n5Djto9JaOYOPc1r730PJ8ACGRvXWlGmCRX0LBOOWt+5+fBEOOPdf+iutmVcEXChkf
         5XSLr/29RuPC6FPxft70CYLGm6/Mrl0u/GeUkz3yWUuPhBOEeQdNPAv1ERLXh8xhMijG
         lRxRUlzjk1Y3xExWrgZakR5Gaa+A/q6sWlsNijlSC+llZwCSRQ2bU3OAH7MFQc/LlKnJ
         FRs+lkzfmicPpVdJEt8GLk9pxBfFXGSDhhPqVIn6VZoXEJdU58AMkkV7r3X56Ghq5Btx
         jliSSu5sFrbRnnU7WB0oZQZTEZtDXd8VpSAjKHRf/hN0Sm8jJYt6yTxJRnwvuZH0I3zD
         jBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4cv9uYclcto8QyQAuk68xuQ2c7a+oiqgLKGB7MqDkSo=;
        fh=DuEtlxGDnBy7h3TKNlG8blejqP5wKskEFvorYrnvl2U=;
        b=TFqpogzmK+Vmd4yuaDYgBi7CZoP69bHWTzTuP/RBbz8f6ozo25jpvzSDF2lDXHYG50
         l/KeTSRqW+MAeKYQo21iV9F8jgej1vgUuBGoPbKSag4s6aHl/V4bV5lR+TBOfb6jMA6F
         cD1JL3mAt4fgMFOLZc0ddZPTScHENKGX/jgRJFQaSuz+fFXwHkZJ3USjMaWp95Qgbje8
         eK3IjXYf7oztMpHIu7fyK7hrccJ9xs4aeosK1ubO0JQsBPowRrhOzBZvRXtJ+hYDqEqc
         gzXnYcAeE2ogTEILnCINLvrP6zjbkfym3d9hfH3JvxxJay9aKbtSmQaEAIUcBuWtFDpT
         A9Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789057017; x=1789661817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cv9uYclcto8QyQAuk68xuQ2c7a+oiqgLKGB7MqDkSo=;
        b=Rqu6Z/b6kWjDMkpts+lD1N7i2w8SddLMVy/A0Eo+MT8Pf52IXBWXtB2ECBUggc0P1n
         FeB8jiLtuRi6ptp37/ghLfiqnT1ZWk9kWzEy+aERQ4AqL+zmY7pYih8B//CyTTXmzBYL
         JBALQoCy0hex4VS+Y2s/Qp4DExmsDDRmCALBn4PS53IeOZLjEfamMrUKBZ1O7hCFDzi+
         u663DiTnZAWj3pOF+QitrnU0rK0mnarDH3qfmjjc7UMZpAOwAW9R5uGAzUGz3gdjNRDJ
         CmbZw8nxH1tiobdRZDalt6b6C5kYkFkal8ckqROfenqURxJW4OfZmkWqj6QlMBRPuQE6
         lFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057017; x=1789661817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cv9uYclcto8QyQAuk68xuQ2c7a+oiqgLKGB7MqDkSo=;
        b=hPvkhr2XrjCnfh2J74W191wypxycwUVIJSLmzpgpqtPMob7IYhgCt43FZn0H8iGLek
         vCGQlGLLmnGtQKKnl8b4DjxgrVBs8nNESwLYkcm7fM8uLM5Z+SVfL/vE+2hoU6R5Mp6u
         0CXFfWgJmGdJzHKZ8jt5rjoK6gEvdtubWVWjwgQbOJGYwW87Itqcv46zBH6dISEDqAd3
         xDlExH4Di9NfaeHHPjEjarmixYK9CCei2gB06UrXy+2DBMc4lNBbMWoSfartNc4lFB+I
         IlOk5WGm6CZ111GS7U94h7R9lO8Tx3setETiU95mNBmjSOEzL/Q+K4V4Y0kVEcxIQXm5
         gAWg==
X-Forwarded-Encrypted: i=1; AKwUvBwoHILm7wNddcjUXovoOERjMtL654Bo0qOQ8soTNRZshG2CRWM5OL0D+jBdtxMWxleTiS9LF332RY/fOBk=@vger.kernel.org
X-Gm-Message-State: AFuF++k8qtKCZuIev5gQzM/x0l30ibGxcgA3TW6J5m4i8XztdaD0dOQ8
	YlW/SgiTs/zW9nKzmm5NKLGbQMCSAfeOJ8FxIo7QjgSMEHkliU5/N7mGU5uRsTt/dOLT/PP8s3J
	BjHfOaPuI3pihLnbQA0sDz3XYZFp4aHs=
X-Gm-Gg: AYBFou2hyeBCWcxLKlgaiweuM6kt+UwbRmso1Nf52Vv4N3RlA04LGOYnQHI6GtgLkcm
	CluswEQUxVtf4SHA+8jV706HR+/UqoZlWhjFDzD4DtJEbmTpStZc1o8Vo+owLvXOG472V1x1h81
	NWRl9n8bt7CztRiBVBxYckqm1y/8gJ+uZJeVtdpT8+qTx+I6sLDLgOKb+OUtEVe/J0pOt26tW3T
	BcLyZFqlZGq27xLsbUoX/5qI/BGsPqAGkU5HxqfogYxwmBJEcurHPBz/q08mDm66nKG+dFCGHf5
	wIanMQcnI2o9RBsK9w8ZkVVFOc1SHzfeOjwdEnRat2Mxb3xH12gMdQct4/ZYkj4=
X-Received: by 2002:a05:690e:4093:b0:66e:64e6:e1c8 with SMTP id
 956f58d0204a3-66fb59788f8mr14806680d50.18.1789057017370; Thu, 10 Sep 2026
 09:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178905331374.213925.295025394754459843.stgit@devnote2> <178905332413.213925.3179977110281463499.stgit@devnote2>
In-Reply-To: <178905332413.213925.3179977110281463499.stgit@devnote2>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 11 Sep 2026 01:16:45 +0900
X-Gm-Features: AcwNN1VBGHIABPdjEVRaY02wV_3QN8nn1VPa9_CdaqSnwKVid2qdbDyb0T1-q3A
Message-ID: <CABFDxMHoTpsLZNPAyaS9SUDGFGDdqMzoUNYiJhKhFt3OvtrGKw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tools/bootconfig: Fix integer overflow and
 truncation in size checks
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
> Sashiko reported that on 32-bit systems, if an attacker crafts size in
> the bootconfig footer such that adding BOOTCONFIG_FOOTER_SIZE wraps aroun=
d
> (for instance, if size is 0xFFFFFFFF), the size check in
> load_xbc_from_initrd() can be bypassed:
>
>     if (stat.st_size < size + BOOTCONFIG_FOOTER_SIZE) {
>         pr_err("bootconfig size is too big\n");
>         return -E2BIG;
>     }
>
> Furthermore, on 64-bit systems with an initrd > 4.29 GB, comparing a
> corrupted 32-bit size (e.g. 0xFFFFFFFF) against
> stat.st_size - BOOTCONFIG_FOOTER_SIZE can also bypass the check if
> size is not bounded. Similarly, load_xbc_file() passes 64-bit stat.st_siz=
e
> directly into the 32-bit int size parameter of load_xbc_fd(), truncating
> large standalone files (>=3D 2GB).
>
> In both cases, passing 0xFFFFFFFF to load_xbc_fd() truncates to -1,
> resulting in malloc(0), an integer overflow in read(), and an
> out-of-bounds null-byte write.
>
> Fix this by:
> 1. Rejecting size > XBC_DATA_MAX or
>    size > stat.st_size - BOOTCONFIG_FOOTER_SIZE in load_xbc_from_initrd()=
.
> 2. Rejecting stat.st_size > XBC_DATA_MAX in load_xbc_file() before passin=
g
>    it to load_xbc_fd().
> 3. Checking size < 0 || size > XBC_DATA_MAX defensively in load_xbc_fd().
>
> Fixes: 950313ebf79c ("tools: bootconfig: Add bootconfig command")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260909161113.16C691F00A3A@smtp.kern=
el.org/
> Closes: https://lore.kernel.org/all/20260910010137.EE0431F000FF@smtp.kern=
el.org/
> Assisted-by: Antigravity:gemini-3.8-flash
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
> Changes in v3:
>  - Reject size > XBC_DATA_MAX and
>    size > stat.st_size - BOOTCONFIG_FOOTER_SIZE in load_xbc_from_initrd()
>    to prevent bypass on initrd > 4.29 GB.
>  - Check stat.st_size > XBC_DATA_MAX in load_xbc_file() to prevent
>    truncation on large standalone files.
>  - Check size < 0 || size > XBC_DATA_MAX defensively in load_xbc_fd().
> Changes in v2:
>   - Add Cc: stable.
>   - Also reject if "size > XBC_DATA_MAX", that is obviously wrong.
> ---
>  tools/bootconfig/main.c |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
> index 7dc9fff9b637..17d971d47f87 100644
> --- a/tools/bootconfig/main.c
> +++ b/tools/bootconfig/main.c
> @@ -140,6 +140,9 @@ static int load_xbc_fd(int fd, char **buf, int size)
>  {
>         int ret;
>
> +       if (size < 0 || size > XBC_DATA_MAX)
> +               return -EINVAL;
> +
>         *buf =3D malloc(size + 1);
>         if (!*buf)
>                 return -ENOMEM;
> @@ -168,6 +171,13 @@ static int load_xbc_file(const char *path, char **bu=
f)
>                 return ret;
>         }
>
> +       if (stat.st_size > XBC_DATA_MAX) {
> +               pr_err("%s size is too big\n", path);
> +               ret =3D -E2BIG;
> +               close(fd);
> +               return ret;
> +       }
> +
>         ret =3D load_xbc_fd(fd, buf, stat.st_size);
>
>         close(fd);
> @@ -218,7 +228,8 @@ static int load_xbc_from_initrd(int fd, char **buf)
>         csum =3D le32toh(csum);
>
>         /* Wrong size error  */
> -       if (stat.st_size < size + BOOTCONFIG_FOOTER_SIZE) {
> +       if (size > XBC_DATA_MAX ||
> +           size > stat.st_size - BOOTCONFIG_FOOTER_SIZE) {
>                 pr_err("bootconfig size is too big\n");
>                 return -E2BIG;
>         }
>

Reviewed-by: Sang-Heon Jeon <ekffu200098@gmail.com>
