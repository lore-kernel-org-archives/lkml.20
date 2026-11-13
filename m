Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557484;
	b=rVOrxPiL2xVzkB/YS+NYoul49uSCarHRzYkXQSDCTsntMZ/FssYu8bwRlgSodt3mAbg4
	 lJTM2ub3VcmQCOFY9j00I3p4Ue3kovl88CbSm0XcFHTyFwCrBgRi9nEtr+sFIGjubWVDE
	 pgC0bWFk+cVtjU5kixGOiQOmWUM7H6MUPhnJe6NOnv6xAqQcdbazVNwKkqs48FwD6Fjt1
	 zVpFP61qbnK8aLZ11N6ZqqUltUgPHDpWQEtCbxRReabQJp1nKJPlOvUi9z4SaTOk/dSSh
	 C9IKCIouWic8aW57osNFRTs1SZdQYYyrq2KfPzWzWTBFODHJFgWhvfv0dpJqO859Q5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
	b=488OeSEJGwPLwyoP4KuSZLw9+jZeGV+87Jtewkc/6eorJSmd09vK7XIEr0+BxauktYR4
	 H8HybRre0ObjA0Ihvgh/AYeixfAxbzrvZO9L2OFYelvqLvLnGCC6eYXZ5rRnt51t2k1BM
	 2EGTKyIovWKHK6Ig1io59kSL0DKV6fsTwh/3k7MAE65HsO2kWbND8zzjD/LuyiREqJKYJ
	 el5/+PmlH7YFNxAfruPsFbLPOBiQe0YJoD31LZvTciJYavV5m8/oy71ELVvpYATF5elcH
	 Pec4CoRowx2tE7alqggV2wKbVvBPnxEabHM/YZYQrXcamhMtqeR8Ezo13gEzbAF6WvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=RoiB4+Uo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B75E606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B75E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=RoiB4+Uo
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50737c64c8so11001866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557482; cv=none;
        d=google.com; s=arc-20260327;
        b=TUZGsT5RPlYe9epyymt7YBY7QWsScjBLRdYDLd2RmlcPD0yVO2p0zakWiGvV8fxPTx
         mCHX015NvnZtprjS/2eE51FwbbjQp++4usacAEODDxewa/SFQ9jOt9LPCaX7vKvSS8n3
         RBfigRr3GdFml9MNakRy9oGLD0F3BIOOff0uAnotQju1kOWPXEmI05iTU4D12fdlwgjx
         c6xLeSyuvuB4lmL/sQ5iJqqhkaVTUog2qpBKAJdYmoLgtsUeYdzEDwhUUl7hmCZoZ/5A
         PzF46RWdHXI94+X1M8sy32oDkMK1HM4/R4eRPdkVmnA5/d7ZnDmvlyObNmMo8Jee3kB6
         jobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        fh=uGk5SQQi4mD1JoCMblbKH0En1ky4YZod43Vkpucz9Yc=;
        b=Amt6YRDz9TtnKqUrD7u2iRpHgSwdurBK4RWcmLiZ1jAbEGzRuPSZX6z9lROl7GuJCS
         O6SPBatBo7qsyNbfrhitMxweO5htRFlBzCYosugupHbLLX/dRGT4t8K3gKZDDk0xB+hz
         jZE3eLVsXQtKqERB5B/YiZhbid4cTN+trqMfLDuHrdyCwGuHZfuYrdxphrWh3AgFV9IA
         8ykj73RHQJkWJGaNM0lNKbeHWeF5pO10qQu3XLOKiQw6k5kYhKSMXVwmIi9sgFqm3Lth
         mqKdLRmadQKztvvv+IedP/RMzE2zS0U3kTUzTH+cqWVvpSKlZ5DVJi9aJ8oJoAjT4yr6
         RjzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794557482; x=1795162282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=RoiB4+UoGSczVUtmvGGqpCMRdVCJB7IYCoFNsDaXMTFxQglY8TD9+u00qf9xfVBLTM
         OVUgTPCC25F+Ez/mrvl6dgpMVGIzbBpmJ9drIsW6Q8/HCtCMvvdBsAbH1cmmbBkAF/ye
         4GMeoWkKO6XKgzzBCJu6ad8YOym0QKOKJf3Zd+oceBCFSAeoiLl68MzvSGU54u3HPl3k
         MJ8UxTZ08ogM3OjhlkTAwNiK0rv1R5b5Q+EhfIIQ+lcA1+vQFiumEDay+FpnpOKcfrhe
         W/742E3xH6z0ccxiwYHGJ9YgELqSd1U/kuJHlJo7Wk7kF45PJ/vt5MNigvWAn4elvSAx
         ODNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557482; x=1795162282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=uSfCeZRvmPmCbYhB8m0qVdvXH7uaECZIe2v2c4IEBlaPoNaos6J5ZqtF/W5T6+Thby
         84uIjY3aMO0nugDdqnP6u450yCmurJsq1VwM9EwcLz8REGH0QKE7DzF8NOyaRyt+dnB1
         2g+5xno+myfaGeo3U4kNvA3j0BZbUMPK5g2a5xqYjRKEBSNIE0UmG4vzc6Agt9tzceN8
         +BoEIN1f5D5a7moM1FuNWKspfN6tmJPU1NTVfyYpQlWWl+fUQZACQgsTTuGBReoZKuS8
         FufJHCR/trMijder4Cyuj0YGRkxzeD2ld+Hr4HQ90pDDZK2IQ8/DzEErD/yQV5BZ3EXV
         vC+g==
X-Forwarded-Encrypted: i=1; AL+hErEufpZrMcyvntJgUfMmKLDwR5yr8ZFk2Oex3nHp9PbKSYGtz0AlmZ16jep6KBkKgTyInJh0EaVSY+VpGo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z94KyXY6VN084jAlSG8uoE8hNpgnoCsEIrlgnkGyIELhIRDlb5f
	S9zEbl65xFFPlNwxFdhU/qYRDui94tL2MmL9Id95KcqaHLIbreOXPXfNVrXoEM2N7yKLi2lckwE
	GMdGRizLGwmGAa6ZiL8e1HnWxge17MjQ7foq4duvz8Q==
X-Gm-Gg: AYBFou0SUIwdvy5hoQ658ob5k1ouBXHNzAskFz7uRwTbLjckLeqGZ4icWuFpP49NjiA
	iGy21oNYGsB0f8jjs4Yb314JqK2osRC+KvDVx2cg0UzAo1DYKy7YVJqWk9chfMV7h/nFpBXEB1O
	jAFW+Esiplb+izBeQOGKpceh1y7itjDq+5LEIeBILca/r16soktXgsn2CxWt6InQEkfd13zpwzE
	x9TLXOouQQPbsXv6J3xSB2wZWBv6l0UDbzkgS1JyOhE5KrbjhYK31mfafSuxb9iRANUGbXOeHb+
	WIBn+y6rSUzjj+EvXvH5fFXREA2pgkBp/HxpC6jwEVclWxJN4P5rMHWanerJzuylGmk/L9AIxsj
	6BJ7V7mMO3U/GnCaIfpjInhftHvfayAUC9he7F86PC8sT4eO2KXOIEBBuikuCG/nOoPvIBA==
X-Received: by 2002:a17:906:f183:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c509642ceeamr126451666b.4.1794557481497; Fri, 13 Nov 2026
 00:11:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112134700.372702-2-jinpu.wang@cloud.ionos.com> <202611130354.oOiDWpa1-lkp@intel.com>
In-Reply-To: <202611130354.oOiDWpa1-lkp@intel.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 13 Nov 2026 09:11:10 +0100
X-Gm-Features: AclHuK_ijeVtZl53-Nr24xIboJn-g0mWRkSzGcLkYkpL9J_f9DfqfuDTwKSOTUg
Message-ID: <CAMGffE=bCVxcuDzUdGk=btfu-bdHhwofHQ6qkgx7UmQTpvSyhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] block: suspend bio based disks around queue limits updates
To: kernel test robot <lkp@intel.com>, sashiko-reviews@lists.linux.dev
Cc: Yu Kuai <yukuai@fygo.io>, Song Liu <song@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all

I will fix the __releases(&disk->queue->limits_lock) annotation in
next version, will wait a bit if any other comments.

Thanks!


On Thu, Nov 12, 2026 at 8:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jack,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Wang/block-su=
spend-bio-based-disks-around-queue-limits-updates/20261112-144659
> base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> patch link:    https://lore.kernel.org/r/20261112134700.372702-2-jinpu.wa=
ng%40cloud.ionos.com
> patch subject: [PATCH v4 1/2] block: suspend bio based disks around queue=
 limits updates
> config: arm-randconfig-1002-20261112 (https://download.01.org/0day-ci/arc=
hive/20261113/202611130354.oOiDWpa1-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
b1fed44d3dcca649a9877915d57c3357a98124e)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261113/202611130354.oOiDWpa1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611130354.oOiDWpa1-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from block/blk-map.c:12:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
>    2 warnings generated.
> --
>    In file included from block/blk-sysfs.c:14:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
> >> block/blk-sysfs.c:909:3: warning: mutex '(kobj - #undefined)->queue->l=
imits_lock' is not held on every path through here [-Wthread-safety-analysi=
s]
>      909 |                 blk_disk_resume(disk);
>          |                 ^
>    block/blk-sysfs.c:897:9: note: mutex acquired here
>      897 |                 lim =3D queue_limits_start_update(q);
>          |                       ^
>    3 warnings generated.
>
>
> vim +680 block/blk.h
>
>    675
>    676  static inline int blk_disk_commit_limits(struct gendisk *disk,
>    677                                           struct queue_limits *lim=
)
>    678  {
>    679          if (disk->fops->suspend)
>  > 680                  return queue_limits_commit_update(disk->queue, li=
m);
>    681          return queue_limits_commit_update_frozen(disk->queue, lim=
);
>    682  }
>    683
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
