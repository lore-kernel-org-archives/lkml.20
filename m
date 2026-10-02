Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6480F45198A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979597; cv=none; b=HnwLwEI9+A3S6hnuxrIeZeZNVRBaKYwsQdomStiFjdJqLRI6ArojxFdiVm+huUeLby8cDT+fsr6NT8fELeBA3QFFUAR2L3LR6gL0Ce1RxpZCNTSIxgUgzDnB7OtTNLw4dD2x4vmc49h00wSGM4/p0POON/4bwtZ+wWARwqO1fB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979597; c=relaxed/simple;
	bh=Ih6lWXVnEFre+v9zrwzRmmdo7jH/Yws9UsTpBnmtnIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aW3WGIMu2i/AsAy8qyKD9kpcs7tSoauGQojnkyCd3LXXFy1DSLCKgdzWCUSiHYsiUYIYHrlo0FzDKMkvvejJbN0ZDPgqys/RbzI8PWVhy/lZRy6xmMZMa6WjA9VzNZ+1JBoo+pXiamBAoKQCXF2iGWT9pgedJRs3iJqm0VWXhas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Au+ktloC; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Au+ktloC"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso53533066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790979593; x=1791584393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iI79X65k5sE53QTcdTBS+HaqtjRvgMdMXAnjEVa6Oas=;
        b=Au+ktloCRDdrmL2Q9vyDQX14aDNG2e4JN/IduozknA4CgcNxJlYPasF63PFuu8FwFW
         nez/NYf45cKJZA8kdUc/UCzHJBtItaMu8cdOVO6xB2XXf6bQqpXD9rlH0+kuNDh9Rt3h
         AFw/Hl0fOOWjvv5flv7TaFC8Y9Jh5mnRo5kBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790979593; x=1791584393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iI79X65k5sE53QTcdTBS+HaqtjRvgMdMXAnjEVa6Oas=;
        b=V0UQwDfiC+0uLkOUyMtg3gMa0PhHjq58dEhQKVQNtReCfCzCGD7L5TH/gM4FzYTx2A
         bqHiralsi7VO0S3gxLBeSSKHgKkputtUwNB6DeQFaokab7KxT9Hk42j56FhdB40ttS1o
         ew8Gwxzph8GATSfBLUDgy30+CyAF24/3koDVH+uwee7Si+66tUYTzOW0Qy0F3zQZMyEh
         mDusUxf6+hTB768FilyrdhWdAKOR1JySQpzIiWZ+QswWoUCp373JhmZLd+guYBhVIAJi
         S+xsHbdiBXRWoGtdz27oSpoUuOEBCr6ujc5NlInx+nhVBU62R3DUCLC4T6PikkZehdrK
         BmNg==
X-Forwarded-Encrypted: i=1; AKwUvBwYiZVnrg6TXQtlbURUVvgvZqHR9TiC2DpIGO9ZPcP+5mqr5cYiAtLItVsGfmmh1aU8D+3bdO8kp9UFUH8=@vger.kernel.org
X-Gm-Message-State: AFuF++lydAytGLjAY/nsobwqz7rtvdiyf6l225TuWyFjg6OxPxYsnIbM
	FFLq0iJLiZw86sOHvhhbl9n678vs0TmNDSfxS4TY2vSGYb0lBl2dIVC3jO3Z+bMgI+TsAlP0ru7
	m05CnhA==
X-Gm-Gg: AYBFou2wlHHtR/uud8Qb+uZmlT4XUt+IOlN9RxEeBZ0gVa9hjA5sxyaCmppsY4JpIKv
	MhYpEKFpzE5NTNve9PQr/Jxvn+lRnAm0pZ3qjNVHdriCSwHJPTH3aaIblhUsBeAA03hok/Pu/7o
	m2QLYn2+sgS/w50fLmjpQvMW8KU22GjD4UEfEA3xM57D04egE8EfDEPOAWCNLqmJqgDMgRamGEj
	lrGlcdyZyR4TveAxg7Ba+OAB7sof4ACggRfSpVl+RgsvFHRsiT7ODGxnl5UeNHjnNCEj0kL4vDB
	VWgDgSFHYEV1k3oQ5J24p2mpvw8LCVRzzZLSH9OLy8cgRXPOLsiVYoZFi7jHlS9TM1AO9ZrJNWX
	6A9lOCxBv3FL9Z/tjV6I3AIkd9Cm4qRrFDT+1buvXkU82Av94R41tjoiA7kx1CTZnWqDOIAxDwr
	9QdNvT4l1glJ43x0J+IdTyuUUQOWFBizFe4hLvWLhb3KcXOif6KuX15Dfa5wXVGlrbAowFKVrmU
	wVVnuK6nRjqFR5IjRjXsBrsK2dAK4z0EU4acA5Q7eCnOgvv
X-Received: by 2002:a17:907:3d52:b0:c2a:46a2:5b57 with SMTP id a640c23a62f3a-c2e4ad568c9mr309123566b.10.1790979593507;
        Fri, 02 Oct 2026 15:19:53 -0700 (PDT)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com. [74.125.225.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd260d1sm137427166b.29.2026.10.02.15.19.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 15:19:53 -0700 (PDT)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so239239f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:19:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5WibineiiXqCZyck4gs6RUa3V1DgnWa7UwvsuBXMBjHsEp0SeblSomO8IC1ZGjaIkNPimWztNThdD2Vg=@vger.kernel.org
X-Received: by 2002:a05:6000:27cd:b0:48b:e25:21e6 with SMTP id
 ffacd0b85a97d-48b1272d22cmr5204353f8f.15.1790979591148; Fri, 02 Oct 2026
 15:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002175000.1-brads@mainlining.org> <CAD=FV=XZZpWUBEQzr9HAOCqC+KkF63=wU2rpw1YMcC8JYxnOWQ@mail.gmail.com>
 <B6936CB8-9A77-4DE5-BC6F-F924E2FA7EE6@mainlining.org>
In-Reply-To: <B6936CB8-9A77-4DE5-BC6F-F924E2FA7EE6@mainlining.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Oct 2026 15:19:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-uH7iTA8Gs_vTqzbKjpk9uwCiSRGbPchmJc7DAWR43w@mail.gmail.com>
X-Gm-Features: AclHuK9trCkhwZg4Kyj1Vq9Hpc5Tb2ciTGZu4Wr68oniNgcekM3uaNWLSOk9oLI
Message-ID: <CAD=FV=U-uH7iTA8Gs_vTqzbKjpk9uwCiSRGbPchmJc7DAWR43w@mail.gmail.com>
Subject: Re: [PATCH] watchdog/perf: reject empty config before the raw event parse
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, blum@kernel.org, tglx@linutronix.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 2, 2026 at 3:17=E2=80=AFPM Bradley Morgan <brads@mainlining.org=
> wrote:
>
> On 2 October 2026 23:12:33 BST, Doug Anderson <dianders@chromium.org>
> wrote:
> >Hi,
> >
> >On Fri, Oct 2, 2026 at 10:46=E2=80=AFAM Bradley Morgan <brads@mainlining=
.org>
> >wrote:
> >>
> >> Date: Fri, 2 Oct 2026 17:39:13 +0000
> >> Subject: [PATCH] watchdog/perf: reject empty config before the raw eve=
nt
> >parse
> >>
> >> Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
> >> manual NUL-termination") replaced strscpy(buf, str, sizeof(buf)) plus =
a
> >> manual buf[len] =3D 0 with strscpy(buf, str, len). strscpy() writes
> >> nothing at all when the count is zero, so on a comma directly after
> >> the "r" prefix, nmi_watchdog=3Dr,1 for example, len is 0, buf stays
> >> uninitialized, and kstrtoull() parses whatever stack garbage is there.
> >>
> >> The old code was safe here by accident, strscpy() filled the whole
> >> buffer before buf[len] =3D 0 overwrote the comma position, so a zero
> >> length just produced an empty string and a clean parse failure.
> >>
> >> Treat an empty config the same as an overlong one and return early.
> >>
> >> Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
> >manual NUL-termination")
> >> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> >> ---
> >>  kernel/watchdog_perf.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> >> index cf05775a96d3..cca0485ba28c 100644
> >> --- a/kernel/watchdog_perf.c
> >> +++ b/kernel/watchdog_perf.c
> >> @@ -301,7 +301,7 @@ void __init hardlockup_config_perf_event(const cha=
r
> >*str)
> >>         } else {
> >>                 unsigned int len =3D comma - str;
> >>
> >> -               if (len > sizeof(buf))
> >> +               if (!len || len > sizeof(buf))
> >>                         return;
> >>
> >>                 strscpy(buf, str, len);
> >
> >I fed your patch to my AI, and it wasn't happy with it. While you fix
> >one corner case, the larger problem is still there.
> >
> >Image if `str` is "300,panic". Then `comma - str` will be 3. Passing 3
> >to `strscpy` will copy at most 2 characters so it has room to use the
> >3rd character as termination. That means `buf` will have "30", not
> >"300". Oops.
> >
> >My AI suggests the correct fix is to change the "len >" to "len >=3D"
> >and then pass "len + 1" to strscpy().
> >
> >if (len >=3D sizeof(buf))
> >  return;
> >
> >strscpy(buf, str, len + 1);
>
> Makes sense. Do you think you could put this into a separate patch, or
> would you like me to respin? :)

In the end, it's up to Andrew. If it were me, I'd request you respin.
The patch is currently in Andrew's "provisional" tree
(mm-nonmm-unstable), so if you send a v2 he will just drop the old
patch and replace it with your v2.

-Doug
