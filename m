Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C267F4483A8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772924; cv=pass; b=PlGm3J3828nCcABdmDYqE9SbZX65TW/billP7/wbXc4anYVZ2Rbf91cnUQIjJ+Ucsk1lRas9yoDnh2Yl82QtKorWjLW8bTe/gOdFeRI/7anZ/71Y9U9V3v4kIljHXrhZ6PozmzJxPBeaB067XUYI3B5PtwE2WqwP5FQ9GU8rYWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772924; c=relaxed/simple;
	bh=jdC3YU8dHQs+R1DdVna6vLRwPjsbGknBcowKTw7Do2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tqe6ZkFh5jS/BW65+LCwooGV9Tzmu2JvLr+Lv0bVh1qMRMm2cir/+GM21yVSlH78e1XwtH4esjdCRsJfeQJPh6ioWmcds9yMEuKh7LLH7NhgekYqU8uloY50Brmky7QMXzKA0bp2ERiv4OU557ipSwc4chWsv20Wld8Cay+PgZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0i9whWa; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0i9whWa"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-864cd11a932so39800177b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788772921; cv=none;
        d=google.com; s=arc-20260327;
        b=s3+ob+1F+76yOQzdBYI7VlJQl+R3lf/ah7K1+6dIcv0l1egJxS2DXrY/4zB/IOFlNv
         qhJ21Bv6gunGdgPLv7GBrVRKJkzByztHNQv3luWMNL71EUFC24l0nD2lizsNczaxI6V1
         KWw1Sd37vKX03bshXhyqMO7ctNImFn2bBNny5Qb+XFPiPzVXmX4OsqW932M27Wqe/HLT
         NqX+8p4nebl5N0MD0lSFqBXbNH3CtkabpFajW+Jsj3qHhdBWx2sXi/9UnT3l3ftAZvP0
         7+l/L3v5dYOSeDrbV4iFrduji4v4LXlO5sRIdvEgrVqvVbBSP7uF4J26BHsLCUgo5jFi
         LHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J0t5MHJvx2iLkVwFpdNQYQKKsnnTlLCT8TZwcuf3lTs=;
        fh=9Ud8Fu/g7aYWh4lYNsfjP7z/Iy0vxBIuSKBDS8kbfRE=;
        b=rIAhw5WWPn352bpq+xbSh46eghC8PGezAtZJUD4TIo9Iw5ZJI0iZHBz50LvqtZ2hCO
         MD22gky/HoLspJuCrrphyWIPKAu7isjKYigZuTlhSy2QtkY1ByWIH4VovVZkeXTxWStQ
         qCmyI/qHv5uifIAhiqIKqQxgQ0uqotGYTRdt7luZhroYsiYOlSU+VaUegwDs/bVCu+Es
         RBgX6UJqvuPsE86tdf67W52RkKyZJaQ5GOBxYwvnuP5TC+qlvz6vq4o0k9+4k9LNmu2l
         AR0HOljBQPwsEMzC6A834wigRNeC60WXKGRPLP3W3rTnA4b7R5dVFzye/h9OX/5XUnP2
         YDaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772921; x=1789377721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0t5MHJvx2iLkVwFpdNQYQKKsnnTlLCT8TZwcuf3lTs=;
        b=c0i9whWazaJQ3HCZjS/S03gbBX0v/e/P3Zu3HsA1Co31h88O5avmljerX+lSDzu967
         9qSTP0/nVn3L/ExlmtFnZ0ysCvpNGRXr+vQdpmGboMUgdyFB4dRZXMieg2uZcar4owzL
         DBaZ4QUsKKShnmKpgmBxnZ3F9r1JXHsuYpKqIt248fzmrbtZO39+BPe3hZLewgMbdsF6
         qhFEwcYoX0pu1dC4gW8PLaEfM1+IcCeby+ErY/1CN3J+5yCXs/I/EyWQR76XZXYxZugO
         ZZ2/dTKXEULwOTWyzAQNRf1EWVdRY/HfqLOa8O/SrHS24ClRPFdyPo1Gm5HsSbCrm4vv
         6Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772921; x=1789377721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J0t5MHJvx2iLkVwFpdNQYQKKsnnTlLCT8TZwcuf3lTs=;
        b=N4e07tcv+g2PVhG/YQ86lK8gktkuAIOs1WtzmQ5HncXgRwI+2C8SR0VwOORS4zni59
         sJMAWMaAzKbpjuh4h0LTwjZwEKWYuxVZQdUqPz4HrDYRjlgQB/clUiDvagl6yjRWoVzx
         3hPvMjApwXtPPBYM/q/qZf8LYkTb3qx/hI2EXQTFbiR/oFturwin+oqwlll46LAgXR7k
         oQl79uqJeYp5LAu1Qf3a6ALpjeNrF4uiJXp+EgvVx89MmCQrtpXk172YVBOL6GaVlQdg
         02IOr7LSiwVJPGpTiiTRmK1kW5BuN6hhPAzco2dhjeGlFA19ri2p+LlOu/fU+qX6fFMr
         P7Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwFpdE2I2FAOFKgvTwIHqWCCqCv86IQxr3KTdX0h4HQ5pkpABdH+YJjpabLodIp0FpsOHDI814JE2Hh/aE=@vger.kernel.org
X-Gm-Message-State: AFuF++lJaGMQP3p44XYRUXp5nie/T2rb5YAVLYZk0K5C0DQfK0IlgxiX
	c+swkj2x2wplLI0mx0ACX5FVC6Ka8AY5RWFaWsDaVFzLDN0qVjL7kmHa9rJcUiU3kASEG57jD75
	+w/b56im57Rq+6hE3YFV2jJIf2eaGICs=
X-Gm-Gg: AYBFou20nQPt7mzBBLR2zOnoC8G84iqd4iG1bFG4V8cFn51QxjSqoCIHdxJJQya3A1B
	OWoV/yhlkfWoBoL5dliK7gInhqhYARqEbVybl1xNTdoBGU6Hgbz7nVVLHZT7sNNdLDiRBavaX5C
	htsoyHHrYtNRRqrbVY5lxGPZ0EpEUjMxMb3Ih4KMc6InhZVymn0VS6/t5TKpnDvvLN+7TP8zjuN
	QUxYZTvuEf/2/dPb6L6+Gdb4aINpIK6/RvXixvnaNthEvnw53eibUpDJf32TfrqqBqibj6VmWDg
	fts8zh6jfO6xwrrZM/3njhZZfPOJMiLY7KNdgkbV53XtwUfjWW7EJ6wZR2W5QpdVGn4hvkKfTTb
	I
X-Received: by 2002:a05:690c:a84:b0:7f0:38f7:6ca6 with SMTP id
 00721157ae682-86e6d7905ccmr100098477b3.5.1788772921510; Mon, 07 Sep 2026
 02:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063531.23981-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907063531.23981-1-hemanth.selam@gmail.com>
From: Frediano Ziglio <frediano.ziglio@gmail.com>
Date: Mon, 7 Sep 2026 10:21:50 +0100
X-Gm-Features: AcwNN1UZe9OK-phDYGL6Rp7bdzbs1SB4QayVK-l7Y6JKSNPJ-dx1Aq5zzRqdwzM
Message-ID: <CAHt6W4erMMhNoqD+OjG+BmpWvZEcWLjoszFok_guwM2gANR14Q@mail.gmail.com>
Subject: Re: [PATCH] xen: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 07:36, Hemanth Selam <hemanth.selam@gmail.com> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/scsi/xen-scsifront.c     | 2 +-
>  drivers/xen/mcelog.c             | 2 +-
>  include/xen/interface/platform.h | 4 ++--
>  include/xen/interface/xen.h      | 2 +-
>  include/xen/xenbus.h             | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
> index 989bcaee42ca..f86a47056ea8 100644
> --- a/drivers/scsi/xen-scsifront.c
> +++ b/drivers/scsi/xen-scsifront.c
> @@ -1076,7 +1076,7 @@ static void scsifront_do_lun_hotplug(struct vscsifrnt_info *info, int op)
>
>                 /*
>                  * Front device state path, used in sdev_configure called
> -                * on successfull scsi_add_device, and in sdev_destroy called
> +                * on successful scsi_add_device, and in sdev_destroy called
>                  * on remove of a device.
>                  */
>                 snprintf(info->dev_state_path, sizeof(info->dev_state_path),
> diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
> index 32ab419bb503..f19cc7a67f36 100644
> --- a/drivers/xen/mcelog.c
> +++ b/drivers/xen/mcelog.c
> @@ -1,6 +1,6 @@
>  /******************************************************************************
>   * mcelog.c
> - * Driver for receiving and transferring machine check error infomation
> + * Driver for receiving and transferring machine check error information
>   *
>   * Copyright (c) 2012 Intel Corporation
>   * Author: Liu, Jinsong <jinsong.liu@intel.com>
> diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
> index 79a443c65ea9..462e36392a9f 100644
> --- a/include/xen/interface/platform.h
> +++ b/include/xen/interface/platform.h
> @@ -421,10 +421,10 @@ struct xenpf_pcpuinfo {
>         /* IN */
>         uint32_t xen_cpuid;
>         /* OUT */
> -       /* The maxium cpu_id that is present */
> +       /* The maximum cpu_id that is present */
>         uint32_t max_present;
>  #define XEN_PCPU_FLAGS_ONLINE   1
> -       /* Correponding xen_cpuid is not present*/
> +       /* Corresponding xen_cpuid is not present*/
>  #define XEN_PCPU_FLAGS_INVALID  2
>         uint32_t flags;
>         uint32_t apic_id;
> diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
> index 40c9793e9880..f9acb21875cf 100644
> --- a/include/xen/interface/xen.h
> +++ b/include/xen/interface/xen.h
> @@ -94,7 +94,7 @@
>  #define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
>  #define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
>  #define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
> -#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occured           */
> +#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred           */
>  #define VIRQ_XC_RESERVED 11 /* G. Reserved for XenClient                     */
>  #define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
>  #define VIRQ_XENPMU     13  /* PMC interrupt                                 */
> diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> index 8ca15743af7f..6424c5cf8ef5 100644
> --- a/include/xen/xenbus.h
> +++ b/include/xen/xenbus.h
> @@ -63,7 +63,7 @@ struct xenbus_watch
>         unsigned int nr_pending;
>
>         /*
> -        * Called just before enqueing new event while a spinlock is held.
> +        * Called just before enqueuing new event while a spinlock is held.
>          * The event will be discarded if this callback returns false.
>          */
>         bool (*will_handle)(struct xenbus_watch *,

Reviewed-by: Frediano Ziglio <freddy77@gmail.com>

Frediano
