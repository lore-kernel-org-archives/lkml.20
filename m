Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184FA3BB674
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158343; cv=pass; b=hcxSJwc9jex1AyS9xZbyt/p4Rl9dJ2bFyxze32x8fvLbKrWwTa3lbN7vWmxPuBfAX5JygKZ0jRaHcovNatugpnysC7SmKWFv7IMpwm9ycHJryuRI7AICbqIC2wy40ykjHN2rbRznnbJWH2u743kJH2EYwRQrAXQiL2JzuBDyL7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158343; c=relaxed/simple;
	bh=WyFxXTxnrLGLJIPSIqsrO/ZcpicbyLFQnZGYq3EeUtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4/pAXHxhouM5Ok1bd7qxS4ybIFxdBLDD6zamhteCiR5mdfJE94OyF0LEJfLaTYwpsV6+lYLZb9jj1//LIWWxhS0aoPOnKk2FaOMFSDUZF58k+a/l5tzFkXPwMOfN44Y8KZzOkmHrgLOR2WxXhH5Cj9GlhREfpiI4TWihOeEEBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQib4TgQ; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQib4TgQ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso1702571e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788158340; cv=none;
        d=google.com; s=arc-20260327;
        b=Ny/Ze/IfQHBggR2RNjbwSJLHYWXjCtAYhNnkj4O98oUjYJvGuu0nim0ByRrQ4i0LND
         w6A854YEeTSVaGczxyUSQZQpOPHRA7+5dBVne/ivBhJOgQIr04Kh3kcAY1ggCDoWl2PQ
         LZySEiGo1wtcch0l8ElNzOqi/r6KJGXrL0FDTOTw0MpI/MiGVgpNFdi50quTSqh3vPli
         fqLOAykxsyMCC1hZpyH3YL/3Yo1xQqp4R6zALTSaCauqXNbEEfT+fHH5kPQGO1av5Izf
         8814SDdNSQiJU9CHMVO5Gm7xMwNkweNCMBJoiK+fzFHIwYxx+OjKrD+mBnwlJgWJgjft
         mMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LcRf9fmLOAPhyUnEka3JXX5kuV18LOZCrKI4V5sQVg0=;
        fh=U+LhKIGDv/4wLyJQzimx8YLCeUUKv8FXkjhUs7OJV4k=;
        b=e7H5FS1BvvEGR2qJ3cxyDQkpv8uqpy5Hele7Uqdot9flk4x4Rx5i2F3t1s0Waag3F9
         UKDXAiSsahIPMKV1UsPRWhy6tWRb3/XDFsIg5qKtR/77rI9T48uPtLpWE9g49/Ls92ve
         +zgZ4d3MqLVZLLlvNBbcZdTuR/DeGvLTQukjgdhGhv7rveC2/2VyP9gG/VODXqCnLtO0
         LaZZ1V8WX5kckcqru0Rc9M6MnI+x4lKrewCmyblOumMlHf7hcC0mz4sWmYobyNdlBWhO
         F/IB3e1dOoj4Hg1nK4qzb39WkY9VIIH/XrFUwYkuk+tX2fjLAe9rIAKt4Sa2qpVtl7SR
         aaKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788158340; x=1788763140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LcRf9fmLOAPhyUnEka3JXX5kuV18LOZCrKI4V5sQVg0=;
        b=TQib4TgQE3wnZphuWu8hsI/osljugboTBMeHL+Pjj7nyizQHXMt8IdEQVWftl1bggp
         LOSVu8Nh6fl2P43pQI9XiaZ7s4DiPmfjP4zNcWrK77m6tIDAkkf2R3cuqw+i+xixIXlB
         dASDuGE4W98BIb6JIWEXqRz61LRss1DHuA7bpPhjiGHoGAQ2lAyGMFe0Vbk7HhJemc9b
         Jd1mRBdypvOcyKK+QrsVPGum4hca88Ylo1mNwIv/Cn4ZwBae2bHstkTOsUwuot+NMSOI
         Aifaa4I9F6WaIJ9biW0M6B9ts5HMdi6LthB9Hhe8ccZcMVuUaD8TAMc1z8lk1II935QW
         IB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788158340; x=1788763140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcRf9fmLOAPhyUnEka3JXX5kuV18LOZCrKI4V5sQVg0=;
        b=UH34uL7IGm6zlFISHVCgnHtvRVxRYjyCHGUQfeq60nXTsOMoQBZRgZmMJ9Rzwb10EK
         0gTTqYGfsS1ydXqEOEdSeBCmXzXUuVWUBcaXAvYJeOI3VE36c3B0fHzjbWy4BMx1L26I
         1bW8JXiBbEIYlKozVDEEsy4/iK9tYJzAkVV5QRWPmNqkDp5tgYb/tFQt8jH0f3hyqHuQ
         deCg7m9FzqimmH3fXFHlQR1vm5wxt6owC9qLF3PtWHZV3n+4OILukawJKrO9+S/+Ql4+
         dZixJ27sYSO3kKR+DyWsyuV6qM0sv3CxtQIJO8WgOl9Y4XmIfg6GACJLfCmmTsebj1FN
         jZ1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjdMAdaVlf9pHhkJqMBLcEycN+CHZIrjC/SjjMc3v0+EpGalxE97tX6WoiZ3f2ClExKuKlaq7FRsMIYkE=@vger.kernel.org
X-Gm-Message-State: AFuF++nYvGMkrycCFgTZStkFvZ0UpS57uc+EUzj7GFM9QrD3VR5+8jDP
	9Tv3gXKwIG6z+PJp00bMTRth3QkXKff8oH/zLdF6K6V22iXslc54gB7xoSTPxJqR7mZz28JwSi1
	io0PUsdJn/ofJsHEtICTaNjVo7TVkuCg=
X-Gm-Gg: AYBFou3wKX9yrjKSCrVr0uIcaskQeLx6DYN/e6UB8pJIBrUZGnsNDlkolerU8N2dBxm
	u3dQXCf/aFVjAm3waVruhngOYDMAuGMXLezJ8k8hf1aDWf56efPnLZ1gwYBUqm5GJs0+r+7bbCo
	MZP0K3kuWr+u9rVk8mlTPgUC+iZm9U/twpPLqnb4iPupO5siXU1b0VHh5A1HggspVvxMit/NpPr
	ApOzxNSTuETGvBskgiPVLWSzFbzPjIZyW/xIeciNM8BXIEJWZplTUHp1D9gjbgFycNtKwB1curL
	5QTkgCplztC9KWl1KdtA2ibsg9jMBFqqdv44uA1DiRhi
X-Received: by 2002:a05:6512:3d1e:b0:5b2:c068:3530 with SMTP id
 2adb3069b0e04-5b5f616282cmr1297039e87.13.1788158339788; Sun, 30 Aug 2026
 23:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122734.2129830-1-liubaolin12138@163.com> <20260826122734.2129830-2-liubaolin12138@163.com>
In-Reply-To: <20260826122734.2129830-2-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 31 Aug 2026 15:38:47 +0900
X-Gm-Features: AcwNN1XIYNyCC_MFAJzGJp5h0Y1cJmsJQmPRtCCMs6JhV8AVEh2oRugaZInCA9o
Message-ID: <CANFS6ba-=yXwSrA+NGnnZ84Yffmm-gNrAWEWpyjdC5fazWSXxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ntfs: report volume errors to fsnotify
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolin,

2026=EB=85=84 8=EC=9B=94 26=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 9:28, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> The ntfs driver reports volume corruption only to dmesg. Wire up the
> generic fserror infrastructure at NVolSetErrors(), the point where the
> driver concludes the volume metadata is inconsistent, so that an
> FS_ERROR event is emitted as well. This lets health monitoring daemons
> watching the mount with fanotify(FAN_FS_ERROR) learn about corruption
> without scraping kernel logs.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>  fs/ntfs/super.c  |  8 ++++++++
>  fs/ntfs/volume.h | 14 +++++++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index cd8fa2c13370..5229eb27bb30 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -14,6 +14,7 @@
>  #include <linux/sched/mm.h>
>  #include <linux/fs_context.h>
>  #include <linux/fs_parser.h>
> +#include <linux/fserror.h>
>
>  #include "sysctl.h"
>  #include "logfile.h"
> @@ -330,6 +331,13 @@ const struct option_t on_errors_arr[] =3D {
>         { 0,                    NULL }
>  };
>
> +/* Mark the volume as corrupt and notify fanotify(FAN_FS_ERROR) listener=
s. */
> +void NVolSetErrors(struct ntfs_volume *vol)
> +{
> +       set_bit(NV_Errors, &vol->flags);
> +       fserror_report_metadata(vol->sb, -EFSCORRUPTED, GFP_ATOMIC);
> +}

NVolSetErrors() is also reached when some functions
return -EIO. Could you preserve the original errno?

And in some situations, fserror_report_file_metadata()
can be useful instead of fserror_report_metadata().

--=20
Thanks,
Hyunchul
