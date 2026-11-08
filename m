Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794155527;
	b=Ry3n/x3PJOh+jYQiNf40ommtXVTRre2zIXYGT7yShBGLBLkpdty8Q6UiVOGfaJ2TgD02
	 8+GHq3oOcFr6Pv0pNSMa23D6pjtqJKQlRz6ZcZPEnMaDNs67RVnZk2ec8TpK7HgS2d+DY
	 fAckJytpw3wXYMsd9+LRclwBrzyp0f4UJyV2RqucE1NXnz6ob2wTXNg18SruMBpMfIJJY
	 oXfQyCW68D3EV5KO1PTwE7Zt1RYRPw1ecRw/LRysj45kEaOC4kc5QtAJacpdLZ8XOqWk/
	 VI5QBcjP6jAI2XAJ35lRyR5T9WtZS01OFN3iYIHac/0wg0vc0wc96ZMr6XbmCNJSaig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794155527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nRA3uBFq/unnmFefY9OZatsKPIJhx+OZZvSDJnxcK8I=;
	b=NvkzLKoYArSVnpq9WrlKz3EZ4QwAzbIhv8tFclNbgIFTVsCO6Pu9Fu7qgh/MLmpq+Squ
	 DqHn660CJlp96lGsGw8IryRJ7pIOiPpPph1fJkbSsMzBIT5uHJNbfQpdLhut2inAHl2Hd
	 F/hV2kgzaeOB8AoTc7rXBwY8hcPpzMqF3yXzFp1Esqxc5t1cQeofNNAtGyz35S8ysXpRw
	 aDINrAzqhV8//3QmyJWPOst5vISh5YlHV8+bPKqfk03SO7TdV8oJmWnc8vE+ZgulgoS+q
	 rOaP9BRkzyxoDlBkLWV1zh1LBGp094XcMLaRH2Z+rpt9pgGDZ4uj70GCJFzGOAELYHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=omnibond.com;
	spf=pass smtp.mailfrom=omnibond.com;
	dkim=pass header.d=omnibond.com header.i=@omnibond.com header.a=rsa-sha256 header.s=google header.b="CaBSZ8J/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4EC606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=omnibond.com header.i=@omnibond.com header.a=rsa-sha256 header.s=google header.b=CaBSZ8J/
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso77965a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794155526; cv=none;
        d=google.com; s=arc-20260327;
        b=hbr+md08o423QXenfhed2Doe/KpA4utIuiy0iqz7fUbcNWcf2oBw3Ek25Nxhd3Edkg
         +dJbwx6OWcz9AemmpxTP4FKTLaujnUSrrIAzffAsL7T4BiKif5xcqguyhBR1IUUWZ6JS
         MgxVqVeRsAVtymxsecXwoIdsGAghN83n2RZrkxyGoab1f/gAJQA9PVDreBBtrgzX+4lP
         43MQIfhWyjJAlguopI3i6ZI/g6KCb4/6QhJcClufno+A5W+vX6O4+IQlMGMtJpcP7yxt
         s6Za9oA7siibnahzpkFh6NWS9vaINDKWtmtwgGVPj7lUeEpJmOOlNCfiyGQa94Q7LqTR
         Aw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRA3uBFq/unnmFefY9OZatsKPIJhx+OZZvSDJnxcK8I=;
        fh=LFTrmTGn5eZX3Bmkkrtj0jsqesQi2PtTjGQgUiChc9M=;
        b=o7Z2ZiGt7DKy01AfK+d7bngLQwBFWxMcdNtc34afxQTkqLHIXhivbE+GmPQK+kwd3Q
         su1w36KuxDkg2IUd4hNNy2dJX+mZuTFdKe+9Xxmr5EGyMXBwcVUarIjpcSClWIDqRNcT
         JFGqIh1PBX7pQamsJ84q0JPyhmYb6aiw05t8bLvfVX959D11/pvvPoqujZF4E/82jE15
         LTNNK16+iGwRxuHVkb9KfGhaMkF3vhF7vtV7dVwk7UrHr4GGM4r1+Rq5b7JiSck3dpFI
         sYqNHmIIH1ddZz1KDGCRbpRLO0DUIR1d52tgoawHF7DGYPlBrDCNjC8Uv/u8aaHGAM3u
         vipA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond.com; s=google; t=1794155526; x=1794760326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRA3uBFq/unnmFefY9OZatsKPIJhx+OZZvSDJnxcK8I=;
        b=CaBSZ8J/go7wNJ3SZ2z3CPOXIlMd3pXwhYegM4lzKGJ1K75rarqHhQliFeTcAdjcuj
         o8NdwsygVqa0pjIuPLeQOlsCuCz1fp5+wuVT54Fr7H1vrB1aTAcEnE7ds5XC4qdbsW2t
         WieaCOLluJlfD2zUBiKlqPYIvrtEgy+/hTcxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794155526; x=1794760326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRA3uBFq/unnmFefY9OZatsKPIJhx+OZZvSDJnxcK8I=;
        b=KbMSmCuUfFfheXirbGc6dnphLBZhAdQJDgKhe4F3DWZa0CffI7n/ZYhBHlngGt9q/B
         vNby6t8RMnESrm7S51eZTWp83C93T0f6tKz2nawz16cVbI1+PSE9tf47exusAifQNwcn
         ypsyCEGE2525mVSA1qXsWHrSaBbLVjR+5gIKJDNcDXpz/MPGTQAfk3gOAxVWHK3B4C6D
         Nnc45R6b2Qkn01VkVFHIZoEr85VkOftYmqUqT8Xqwo57UYjgLNcqbWybueAQLh8LIoEg
         NZKAbJORtBUA8ifWt++43nLDH8jYoS9avC1YQkzOifqIt/ek/EiEl8S5WwnudJQCs5Ep
         QKuw==
X-Gm-Message-State: APuU4Z/97/TY1ZQJ6Jj8WCLx0agWrGYtybFashF9jEc/brONVCQ8IhPU
	t+ezNKi8L4zTXLoUWATcodeWK/qqwUO2eRZoMbYMf6NMrRAV9Ag3+EOXHGK5M59vNAnTY5JmsAd
	xrALIaEAHiqxUA4KlU5GV7xPsv1Hc2kHRNUdeJsTP
X-Gm-Gg: AYBFou1YgC7ketRBh4SUSMzkv+LkIW7B9YRuFDM4Gue/Nx3tkqM3iaQStcuw/GnyX6J
	qcKd1tGLLbKMa2wdNIJg3LpqIxJftDY+DELAJ5DR6xWol0DLc9yDYR+gN7LYj9A0OWqjUsAMmFI
	/Wo35lCgAC8FbmCGKPKm/ltgsyoWlhj28P0vxpa0tH4twSHfcwrYFpS1TxIg9oJ7Aec2l8KtbpS
	I8+sUdgBG9zHf9YamGhi5kSC7oRRmsGGmzYfkwgDDbz3u3bvzy9CEgFMdELOtSedmvqrMCSK0An
	2TZIVR44UxNPsyDPEV3MhFQjPD7z7CI7grNB6giRLjFqdULNt9oBiua9q7m2VuzV9QgoIWsUJ43
	GgRiU5aIR4pklcjBOU3g8fHtmyDn+IZm8VFQzLXKGIu/epuik
X-Received: by 2002:a17:90b:54c4:b0:3ab:36c4:b500 with SMTP id
 98e67ed59e1d1-3b12d108881mr1704045a91.5.1794155526074; Sun, 08 Nov 2026
 08:32:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_5D9DCBD693C37FAA4FBCA042AB2FCF222207@qq.com>
In-Reply-To: <tencent_5D9DCBD693C37FAA4FBCA042AB2FCF222207@qq.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Sun, 8 Nov 2026 11:31:55 -0500
X-Gm-Features: AclHuK_X-4AOoWa9U2JXIk1B5q8F8ohCWp8rOY8hKOQGXDZ07iazbVSsef87fOo
Message-ID: <CAOg9mSTSnkVmt92ehkDDD5SNO4O8==gnxnmte421N6AQEALt7Q@mail.gmail.com>
Subject: Re: [PATCH] orangefs: bound op_timeout_secs and slot_timeout_secs
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your patch looks good and runs through xfstests fine.
I've added it to the stuff I intend to put on my linux
next... Thanks...

-Mike

On Tue, Nov 3, 2026 at 9:40=E2=80=AFAM Yingjie Wang <1075151112@qq.com> wro=
te:
>
> service_operation() and wait_for_free() multiply op_timeout_secs and
> slot_timeout_secs by HZ as int and pass the result to
> schedule_timeout(). orangefs_init() only replaces negative module
> parameters with 0, and the /sys/fs/orangefs attributes store any int.
> Negative values are not valid timeouts, and values above INT_MAX / HZ
> overflow the signed multiplication. The result can be negative, zero,
> or much shorter than configured. Negative results make
> schedule_timeout() print "wrong timeout value" with a stack dump and
> return at once; all of these cases can make the operation fail with
> -ETIMEDOUT before the configured interval.
>
> Reject values outside 0..INT_MAX / HZ when the attributes are written,
> and clamp the module parameters to that range at load time, as negative
> values already were.
>
> Fixes: 274dcf55bd4a ("Orangefs: kernel client part 3")
> Signed-off-by: Yingjie Wang <1075151112@qq.com>
> ---
>
> Notes:
>     Tested on x86-64 (HZ=3D1000) in QEMU with the orangefs module and no
>     client daemon, so a pvfs2 mount waits in service_operation(). On the
>     base kernel, op_timeout_secs values of 2147484, 2147483647 and -1 wer=
e
>     accepted, and the mount failed with ETIMEDOUT after 14-29 ms with the
>     schedule_timeout() warning; loading the module with 2147484 did the
>     same. With the patch those writes fail with EINVAL and keep the old
>     value, the module parameter is clamped to 2147483, and the mount wait=
s
>     (stopped by a 3 s userspace timeout). 1 and 2147483 behaved the same =
on
>     both kernels. slot_timeout_secs was checked through store and readbac=
k
>     only; its wait needs a running client. Also built for i386 with W=3D1=
.
>
>  fs/orangefs/orangefs-mod.c   |  8 +++-----
>  fs/orangefs/orangefs-sysfs.c | 19 +++++++++++++++++--
>  2 files changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/fs/orangefs/orangefs-mod.c b/fs/orangefs/orangefs-mod.c
> index f591f09531da..7a62d4987175 100644
> --- a/fs/orangefs/orangefs-mod.c
> +++ b/fs/orangefs/orangefs-mod.c
> @@ -83,11 +83,9 @@ static int __init orangefs_init(void)
>         int ret;
>         __u32 i =3D 0;
>
> -       if (op_timeout_secs < 0)
> -               op_timeout_secs =3D 0;
> -
> -       if (slot_timeout_secs < 0)
> -               slot_timeout_secs =3D 0;
> +       /* The timeouts are multiplied by HZ as int. */
> +       op_timeout_secs =3D clamp(op_timeout_secs, 0, INT_MAX / HZ);
> +       slot_timeout_secs =3D clamp(slot_timeout_secs, 0, INT_MAX / HZ);
>
>         /* initialize global book keeping data structures */
>         ret =3D op_cache_initialize();
> diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
> index a02bfc7b3542..1873a4f5cd16 100644
> --- a/fs/orangefs/orangefs-sysfs.c
> +++ b/fs/orangefs/orangefs-sysfs.c
> @@ -270,6 +270,21 @@ static ssize_t sysfs_int_show(struct kobject *kobj,
>         return rc;
>  }
>
> +/* The timeouts are multiplied by HZ as int. */
> +static int sysfs_timeout_secs_store(const char *buf, int *timeout_secs)
> +{
> +       int val;
> +       int rc;
> +
> +       rc =3D kstrtoint(buf, 0, &val);
> +       if (rc)
> +               return rc;
> +       if (val < 0 || val > INT_MAX / HZ)
> +               return -EINVAL;
> +       *timeout_secs =3D val;
> +       return 0;
> +}
> +
>  static ssize_t sysfs_int_store(struct kobject *kobj,
>      struct orangefs_attribute *attr, const char *buf, size_t count)
>  {
> @@ -280,10 +295,10 @@ static ssize_t sysfs_int_store(struct kobject *kobj=
,
>                      attr->attr.name, buf);
>
>         if (!strcmp(attr->attr.name, "op_timeout_secs")) {
> -               rc =3D kstrtoint(buf, 0, &op_timeout_secs);
> +               rc =3D sysfs_timeout_secs_store(buf, &op_timeout_secs);
>                 goto out;
>         } else if (!strcmp(attr->attr.name, "slot_timeout_secs")) {
> -               rc =3D kstrtoint(buf, 0, &slot_timeout_secs);
> +               rc =3D sysfs_timeout_secs_store(buf, &slot_timeout_secs);
>                 goto out;
>         } else if (!strcmp(attr->attr.name, "cache_timeout_msecs")) {
>                 rc =3D kstrtoint(buf, 0, &orangefs_cache_timeout_msecs);
>
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> --
> 2.43.0
>
