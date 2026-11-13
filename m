Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568947;
	b=04LxgCUL3Ypipb31P9yl0FF7XxMs61Km9pjOOmKhezAXRsx/NbZ4hhSZJQjFITc38hlU
	 k9FtRJ86HSAzO4tgoQYcq7tECSBVbb3WRXwnwpDydyKnggeGw9iUSIAD+EhKqpVTtJqvA
	 dX7vETI5RibM/NvXM0isoJxwJ6MOUQG2m967aXkm7JVAdYkOEpXj+TodlB6Yfufx0uWVn
	 Q7RMeltnn9v1+i33oe+focF02lh6SL3nIxshxxUmOm0q4wNtZpSsRAd7HzXSdEO0seFuZ
	 GE6h6Yz6gSVBw36xU1oXMwo20PUz6TcZjQIl9gPdVG2y6ShqOElPjJ6Z8qT+Mn3CbJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=jhZJPwyqkT2jXkPI1fAXCUzZovCR8gpp0OeWDLPOIpE=;
	b=j2H+lb4eQNbksh2xmeUPvHJ+0eZNKtfQJsBYYf1+ON1POcYrBGBzR3qlE2y610DjrB3q
	 xzdvLTv/WG4E0ohTKsVgf6ZgaDPqtdWIrKoa1PKEUOZZC6nY7mEAYchQImkg4G/+XUk0s
	 0rZEzmhDVjDUFgRvNOw5aHn4bBKZiPn4dPP+dGwZbsQgFGE/7samPqSwbsULg4liQOrXn
	 fwrZoyUFcqyydXgUth8ABxIfZgZe5PSztHkay7k7K2eAjZvVLzZiP45e+epx6+RHETP1F
	 bGfEnO43uNI2jk/bSzaoNqCxFunCV3NGaNqcrQbvu639zmf5ruHB3sZJioRd/LZSHxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TcRryGPu;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B48606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B48606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TcRryGPu
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36ecc11bd26so103751eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794568946; x=1795173746; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jhZJPwyqkT2jXkPI1fAXCUzZovCR8gpp0OeWDLPOIpE=;
        b=TcRryGPun9xt9v6yNLv/QrrsnZ3lArbzuVg+YMM1Xvxvm4nPNKvf9iM8UZpR+hhEqG
         Pt0Z2RrwngqQXOq6u+sTPuj0Xn3TZdtX5lP8TMVH93a2RwbcCA7iszJmFYT1rJ1hcDwh
         ntqqVmNYdpndaogTVpyPlzxtSMP2dK4nVkVFSHqQI3XWi8QSz8wtV0lMcmM6OjPyh2+f
         tmS9DSBvz7kpiFwcuT/P5SOHaXLN5q5djj3KJrkN1lUNvo4Xjnfsp72CpZyOwxml341w
         iyYhqmRl1/Oc1zExdYDzjoXnlGoLIVbhlJE8YZVqK0PassS2K0620Fa86mYcSx1Lyvii
         u5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568946; x=1795173746;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhZJPwyqkT2jXkPI1fAXCUzZovCR8gpp0OeWDLPOIpE=;
        b=q2es91vBuvrNuE7Mxj0glsEX4htbRdcHranCU+0NQpizLCHjXlbEe4LsX+0BAAhUyV
         QdIKIA6KsueIVS2XzI01LkOndDRishImVoQTWoD9YHz2PUCFfvdyAGDYNZ2lunpOrF0w
         up/QOBnhGJsCu6P8J81pp6AmKzYy/IYBdVPce5RbIE+4vNdbV5bnoFAq/6TgVfK0UJ+h
         tuEstx+JcM+NvtW2GJzk2GSrPprYuZz+AyG07BZAjwf/5bVFNWTmCG3gYDxiZVMpgsRs
         TKilWuxaGt+P9B4/6oBHOzPCMJcinGh8SJm+48BtUx7cOQYEnAH83zOfE4n6IZKhw4to
         tW0A==
X-Forwarded-Encrypted: i=1; AL+hErFTOvRlOQftqjLIq+TLLQoyKiq/VDg+HlMDpcRfpOOkRsUbhl/TI6d1OTdbDe2imB3lN419tm0kh1Zc2Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ObSbRFrKrGmTcH/fOdQxA5+wezokqpEL96/Kfl2501d+JLX4w
	/QPHtCUFQFl777ny7/VZw6NW+1UYrAvD9sSFv257gAAiwR0ZlmDIbaBV
X-Gm-Gg: AYBFou0AiJ1bz8L7eo5Dvzw49C6ecwdWK02VgZIvxDk4T0777/E0tca2kz15Bam0jeR
	ceT8VfzE3eS/1r6iks3THymMRkgqOkQVfKGASaK24MIm2WeZE0M7ssOUqm1eGcp8SqiPTZSBF2d
	AOz0sWYxbZ3jzxGS+XOsMdM/5V50NyfcZbfPSqjSQqhjhf9SUT5+Tto7fWIsceX7LYDYwcBn5/4
	2QxSUknG+gKnUpSf7R4wM474DSLFabkJCQcGvRschbOe1Kr+icAPAmtuEcWUi5dQ3LXTSEg736S
	9Rb/LZ3+v6ZAL63021iENVpAIaeCkaEJD99m7flEE4oS72FHVvl9zcFT6SMP61wBP0RilsN/+Y8
	0lqUuaHnSRrEmXUrTMAg1+3pazbLSYUcxlMEfhVfwiJTAETDnMa5RqbZTXWiOXvV9z9UihUpH57
	rj/LRPiv3NWd2hoCfDpA/zIjWfCL/stFC7qHR/Ezp0skxZzKHEIYyOLhV2lroz0/pLh0ZDXgPks
	2bZfk91uspqYxYSGzT4ps2rHS1Nlxs280UXTu610711PyFFdvC3bpnxHKNA/mQ+jhUnOzLQ+UZX
	0x3X571sGbsUz8QQpLwXmNWTNa+g71ZxBfp0GBrlOylT7b1ZygGtIHYQJ4CFRZnuQkA=
X-Received: by 2002:a05:7301:a0a:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3796038259fmr2893772eec.0.1794568945402;
        Fri, 13 Nov 2026 03:22:25 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm7133252eec.1.2026.11.13.03.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:22:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Nhat Pham <nphamcs@gmail.com>
In-Reply-To: <f9ee662a-4da0-4204-89ce-33704044c88c@hust.edu.cn>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <f9ee662a-4da0-4204-89ce-33704044c88c@hust.edu.cn>
Date: Fri, 13 Nov 2026 19:22:13 +0800
Message-Id: <179456893350.2142163.5558519210108805249.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-13 10:12 +0800, Dongliang Mu wrote:
> 
> On 11/11/26 8:41 PM, Xueyuan Chen wrote:
> > CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> > counters are updated regardless of this option.
> >
> > Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> > stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> > debugfs is unavailable.
> >
> > Remove the Kconfig entry and replace the existing CONFIG_ZSMALLOC_STAT
> > settings with CONFIG_DEBUG_FS=y. Update the English and Chinese
> > documentation to match, and clarify the pool name in the debugfs path.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> |The documentation changes look good to me. Acked-by: Dongliang Mu 
> <dzm91@hust.edu.cn> # Documentation|
thanks!
> 
> > ---
> > Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional. The
> > option only controls the debugfs interface, while the class counters are
> > updated unconditionally. Removing it simplifies the code.
> >
> > Following Nhat's suggestion, remove CONFIG_ZSMALLOC_STAT and rely on
> > the existing debugfs API stubs when CONFIG_DEBUG_FS=n.
> > ---
> > Changes in v3:
> > - Squash the three patches into one (Nhat, Sergey).
> > - Add Nhat's Reviewed-by.
> > - Update the documentation wording.
> > - Link to v2: https://patch.msgid.link/20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com
> >
> > Changes in v2:
> > - Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional.
> > - Update configuration files and documentation.
> > - Link to v1: https://patch.msgid.link/20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com
> > ---
> >   Documentation/mm/zsmalloc.rst                    |  4 +--
> >   Documentation/translations/zh_CN/mm/zsmalloc.rst |  2 +-
> >   arch/s390/configs/debug_defconfig                |  2 +-
> >   arch/s390/configs/defconfig                      |  2 +-
> >   drivers/gpu/drm/ci/arm.config                    |  2 +-
> >   drivers/gpu/drm/ci/arm64.config                  |  2 +-
> >   drivers/gpu/drm/ci/x86_64.config                 |  2 +-
> >   mm/Kconfig                                       |  9 -------
> >   mm/zsmalloc.c                                    | 33 ++----------------------
> >   9 files changed, 10 insertions(+), 48 deletions(-)
> >
> > diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> > index d2bbecd78e14..4c0786378dc3 100644
> > --- a/Documentation/mm/zsmalloc.rst
> > +++ b/Documentation/mm/zsmalloc.rst
> > @@ -33,8 +33,8 @@ proper handle-based APIs.
> >   stat
> >   ====
> >   
> > -With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
> > -``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
> > +With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
> > +``/sys/kernel/debug/zsmalloc/<pool-name>``. Here is a sample of stat output::
> >   
> >    # cat /sys/kernel/debug/zsmalloc/zram0/classes
> >   
> > diff --git a/Documentation/translations/zh_CN/mm/zsmalloc.rst b/Documentation/translations/zh_CN/mm/zsmalloc.rst
> > index 4c8c9b1006a9..b555a07ac871 100644
> > --- a/Documentation/translations/zh_CN/mm/zsmalloc.rst
> > +++ b/Documentation/translations/zh_CN/mm/zsmalloc.rst
> > @@ -32,7 +32,7 @@ zs_unmap_object()解除映射。
> >   stat
> >   ====
> >   
> > -通过CONFIG_ZSMALLOC_STAT，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
> > +启用CONFIG_DEBUG_FS，我们可以通过 ``/sys/kernel/debug/zsmalloc/<pool-name>``
> >   看到zsmalloc内部信息。下面是一个统计输出的例子。::
> >   
> >    # cat /sys/kernel/debug/zsmalloc/zram0/classes
> > diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
> > index d44674b63715..83193ef8efb9 100644
> > --- a/arch/s390/configs/debug_defconfig
> > +++ b/arch/s390/configs/debug_defconfig
> > @@ -100,7 +100,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
> >   CONFIG_IOSCHED_BFQ=y
> >   CONFIG_BINFMT_MISC=m
> >   CONFIG_ZSWAP=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >   CONFIG_SLAB_BUCKETS=y
> >   CONFIG_SLUB_STATS=y
> >   # CONFIG_COMPAT_BRK is not set
> > diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
> > index e00e252d4694..694a309377d5 100644
> > --- a/arch/s390/configs/defconfig
> > +++ b/arch/s390/configs/defconfig
> > @@ -94,7 +94,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
> >   CONFIG_IOSCHED_BFQ=y
> >   CONFIG_BINFMT_MISC=m
> >   CONFIG_ZSWAP=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >   CONFIG_SLAB_BUCKETS=y
> >   # CONFIG_COMPAT_BRK is not set
> >   CONFIG_MEMORY_HOTPLUG=y
> > diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
> > index d7c51670da2f..fc0a8a4bfb18 100644
> > --- a/drivers/gpu/drm/ci/arm.config
> > +++ b/drivers/gpu/drm/ci/arm.config
> > @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
> >   CONFIG_ZRAM_MEMORY_TRACKING=y
> >   CONFIG_ZRAM_WRITEBACK=y
> >   CONFIG_ZRAM=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >   
> >   # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
> >   CONFIG_BLK_DEV_INITRD=n
> > diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> > index c46125c1f80f..10b01b55a66d 100644
> > --- a/drivers/gpu/drm/ci/arm64.config
> > +++ b/drivers/gpu/drm/ci/arm64.config
> > @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
> >   CONFIG_ZRAM_MEMORY_TRACKING=y
> >   CONFIG_ZRAM_WRITEBACK=y
> >   CONFIG_ZRAM=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >   
> >   # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
> >   CONFIG_BLK_DEV_INITRD=n
> > diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> > index 7ac98a78691e..8225b806dad8 100644
> > --- a/drivers/gpu/drm/ci/x86_64.config
> > +++ b/drivers/gpu/drm/ci/x86_64.config
> > @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
> >   CONFIG_ZRAM_MEMORY_TRACKING=y
> >   CONFIG_ZRAM_WRITEBACK=y
> >   CONFIG_ZRAM=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >   
> >   CONFIG_PWM=y
> >   CONFIG_PM_DEVFREQ=y
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index afff1b25b543..4a77cda7f1d7 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -130,15 +130,6 @@ menu "Zsmalloc allocator options"
> >   
> >   comment "Zsmalloc is a common backend allocator for zswap & zram"
> >   
> > -config ZSMALLOC_STAT
> > -	bool "Export zsmalloc statistics"
> > -	select DEBUG_FS
> > -	help
> > -	  This option enables code in the zsmalloc to collect various
> > -	  statistics about what's happening in zsmalloc and exports that
> > -	  information to userspace via debugfs.
> > -	  If unsure, say N.
> > -
> >   config ZSMALLOC_CHAIN_SIZE
> >   	int "Maximum number of physical pages per-zspage"
> >   	default 8
> > diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> > index 7ef80e0da626..104ccf3aa170 100644
> > --- a/mm/zsmalloc.c
> > +++ b/mm/zsmalloc.c
> > @@ -222,9 +222,7 @@ struct zs_size_stat {
> >   	unsigned long objs[NR_CLASS_STAT_TYPES];
> >   };
> >   
> > -#ifdef CONFIG_ZSMALLOC_STAT
> >   static struct dentry *zs_stat_root;
> > -#endif
> >   
> >   static size_t huge_class_size;
> >   
> > @@ -279,9 +277,7 @@ struct zs_pool {
> >   	/* Compact classes */
> >   	struct shrinker *shrinker;
> >   
> > -#ifdef CONFIG_ZSMALLOC_STAT
> >   	struct dentry *stat_dentry;
> > -#endif
> >   #ifdef CONFIG_COMPACTION
> >   	struct work_struct free_work;
> >   #endif
> > @@ -565,14 +561,10 @@ static inline unsigned long class_stat_read(struct size_class *class, int type)
> >   	return class->stats.objs[type];
> >   }
> >   
> > -#ifdef CONFIG_ZSMALLOC_STAT
> > -
> >   static void __init zs_stat_init(void)
> >   {
> > -	if (!debugfs_initialized()) {
> > -		pr_warn("debugfs not available, stat dir not created\n");
> > +	if (!debugfs_initialized())
> >   		return;
> > -	}
> >   
> >   	zs_stat_root = debugfs_create_dir("zsmalloc", NULL);
> >   }
> > @@ -650,10 +642,8 @@ DEFINE_SHOW_ATTRIBUTE(zs_stats_size);
> >   
> >   static void zs_pool_stat_create(struct zs_pool *pool, const char *name)
> >   {
> > -	if (!zs_stat_root) {
> > -		pr_warn("no root stat dir, not creating <%s> stat dir\n", name);
> > +	if (IS_ERR_OR_NULL(zs_stat_root))
> >   		return;
> > -	}
> >   
> >   	pool->stat_dentry = debugfs_create_dir(name, zs_stat_root);
> >   
> > @@ -666,25 +656,6 @@ static void zs_pool_stat_destroy(struct zs_pool *pool)
> >   	debugfs_remove_recursive(pool->stat_dentry);
> >   }
> >   
> > -#else /* CONFIG_ZSMALLOC_STAT */
> > -static void __init zs_stat_init(void)
> > -{
> > -}
> > -
> > -static void __exit zs_stat_exit(void)
> > -{
> > -}
> > -
> > -static inline void zs_pool_stat_create(struct zs_pool *pool, const char *name)
> > -{
> > -}
> > -
> > -static inline void zs_pool_stat_destroy(struct zs_pool *pool)
> > -{
> > -}
> > -#endif
> > -
> > -
> >   /*
> >    * For each size class, zspages are divided into different groups
> >    * depending on their usage ratio. This function returns fullness
> >
> > ---
> > base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> >
> > --
> > Best regards,
> > Xueyuan
> 
> 


