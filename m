Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371847;
	b=XWGfANrG5db/FJUqk0AEunUVBjNWWOrVtR/j+TbX/yIKcNcmhSLQv+JrI+EuqI0BMQWD
	 1OivIG9xFxrsPQVx6/NZVcT2jYnKJDHTUmaOG87X/qaI1U6BvP2K8Gc1+fa7uZRS3r6o1
	 H3sJsqewkbO9uOI7c3/fZejgdOq6fm3ZowtSPblTbvY3Jy7UrbYZveFaGBjbIe7ELfaFi
	 0v84s3+H/MO6iQSDCrRBSHk6afhOsU2twEsSKXhDlGNzVwHxto1no4EZnopxcF2ZJTguv
	 hOQpT8F6MmyP+AahDDgIbwA93gjUrjnm8/DzA46llzEtgzSgWVyP1HBYtKBijY57LCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aqUC+/6z93QymM4YxzfDDeUBQDkxF93aItbIpXtMw+w=;
	b=L2570BXlH4dY6WuP6sdwWg4cN7IoT0jsJRVs1St1WCWHiu2jQKtB3CbS1Xex7V2xe0+N
	 2GcTxiU6xO8qLBg3CSQkNVzWBBGptkTqwLIlH4roYasqSIxlrE2n8TfdZ/EDWf+RvWbd1
	 JFeLAH+Qq9o9aiEeFH/6hGd/VDYsJYSMvuDxX13piXBAIUQFzipanzgbMPaviet9BgAra
	 /M214bs9kIxA96uiG2f7jzPGNWbRt1KmbnFwZr5zkiotHtA3dy4dfR3B82qiKPqHBGlMY
	 Hvvmws28ufkq53vIBStgpTAyF5hwIODIhTHw5r8oQtcU4mpevOweH1YAI6qBjwKXtig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C7k2nbue;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF24606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C7k2nbue
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1695556a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794371847; x=1794976647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqUC+/6z93QymM4YxzfDDeUBQDkxF93aItbIpXtMw+w=;
        b=C7k2nbuewYdBgDBOdRGBCZ/OmS51qTWi91otDqdvvHUULVvdL5QnWibY7HQMMISrLD
         Apd+by4fDliDIQtd/jplW/EzldVHK5tPn7J3jUmmds53uNKYm1wGcXpryzF9QxjbBWzH
         bRklSB6P168t0TMNx78oAz+m8lbqZ42g+icGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371847; x=1794976647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqUC+/6z93QymM4YxzfDDeUBQDkxF93aItbIpXtMw+w=;
        b=r6uTNvnVhW07nF0nIEcD8xdVsXYgzNk9s//waiFKi86TghrYk+wCrYrjeYTaJfJ3Ux
         Z4JLbEmPOviwTlBEIFA0X4Hq2OCy4kPtUJ+I1XW+RnBT3YAEc5Eqd+FbLE+6rkuZpuJU
         tmC8oug7/6jr66jBENl+MuPJoYlkbzD34G5N8heHogV83Qmlb8KKa6wga9lpb6Yy57g0
         zIb+bKTPygfmfoyXgLO4xnmsZGQzBw0lQzZ8KmvUXBxhhJIClf16zIaLLA7lps1aK/Bf
         n2+eSlr1GWL4zujQeKiC956PfeD7KA29T5NV7++/zRFGzwBxoykElIMHkTtckEB/oDy5
         IqJw==
X-Forwarded-Encrypted: i=1; AL+hErFRp/OMw2j/hTVtJtU0fIDoI3/rUBkJxyW71pRbhHp03YVtF0l1e29rl0/t2WmPsRuz7/is8K80rrvFl8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z88iJBbrVCY6CP+/d/yUXYzZEpXVJiyb5btG9IedFA/ZzHjRgk7
	fKy2vPPi35WZ+uI9f8u32ZkLdMnNV+VeKtKyCZMzvNXIBz4VVYmkZnSLpHZy8j7tqQ==
X-Gm-Gg: AYBFou1o0Mw609BKolrTCRLUPBqEfDMQqio319vE5s7bzEcqLgm4Cp9deQjAyKvqWrN
	BgAlES/c4B50eK9pY30rLgnz7E3yHp9AS/9R+wLssrdqYVeCyuA9Dr/lCU6i+lZrfUPGkVC/027
	xHA51mdSt7DBIhYa4id8++YLV/3bxRNmji1KxhijigRf7qNx5c1kIV45Fg2Q1bsASxOaQtqySJ0
	XwpP1WPgK12WqAVVxhHpa0l3G5ElYOvDGmCBNjZTBKp4TWP/LN4PTKuIeYE7eiFfcsTsHDANrHA
	3cP42RI+wFwXeRW64NU+Q6wIPmyKibPQ1yYPbvht428NtgryDNHTxEb/U3Ty9rENq0vxBIU2Ca6
	cpTvuda/H0UaxPmQ9XGklOCoi6tSH8WnoMoqD6+lpL6Cj2yM14f/rz8WpbKv2nnt0x0MmfMyR3Z
	TLyzJ1AsqvwZgVnJDyRcT2epiiO0LQj7DlIkAJybps55pRoW7LbxjDxqekiPbqM0xK+adu3P81V
	+2A/NNWBDAvXoQ2/JLRlCMYdxBY8QndL+lmkMBXfrHHJsWFXBvNoPqWFo4LIxadrWEX0Weep/bV
	3mde+hEw+O9cVddyWNmL6RN8JecLKB2K41XJE62g1abb5qMo5tyukXF/agZ1Gp7d7oCz+w==
X-Received: by 2002:a17:90b:37c3:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3b182ebe741mr1582140a91.32.1794371846525;
        Tue, 10 Nov 2026 20:37:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm1509639a12.5.2026.11.10.20.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:37:25 -0800 (PST)
Date: Wed, 11 Nov 2026 13:37:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Minchan Kim <minchan@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mm: remove CONFIG_ZSMALLOC_STAT
Message-ID: <avPw3zBWbqmKE93R@google.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>
 <avPvrCY3AywQRz5j@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avPvrCY3AywQRz5j@google.com>

On (26/11/11 13:33), Sergey Senozhatsky wrote:
[..]
> > diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
> > index d44674b63715..83193ef8efb9 100644
> > --- a/arch/s390/configs/debug_defconfig
> > +++ b/arch/s390/configs/debug_defconfig
> > @@ -100,7 +100,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
> >  CONFIG_IOSCHED_BFQ=y
> >  CONFIG_BINFMT_MISC=m
> >  CONFIG_ZSWAP=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >  CONFIG_SLAB_BUCKETS=y
> >  CONFIG_SLUB_STATS=y
> >  # CONFIG_COMPAT_BRK is not set
> > diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
> > index e00e252d4694..694a309377d5 100644
> > --- a/arch/s390/configs/defconfig
> > +++ b/arch/s390/configs/defconfig
> > @@ -94,7 +94,7 @@ CONFIG_UNIXWARE_DISKLABEL=y
> >  CONFIG_IOSCHED_BFQ=y
> >  CONFIG_BINFMT_MISC=m
> >  CONFIG_ZSWAP=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >  CONFIG_SLAB_BUCKETS=y
> >  # CONFIG_COMPAT_BRK is not set
> >  CONFIG_MEMORY_HOTPLUG=y
> > diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
> > index d7c51670da2f..fc0a8a4bfb18 100644
> > --- a/drivers/gpu/drm/ci/arm.config
> > +++ b/drivers/gpu/drm/ci/arm.config
> > @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
> >  CONFIG_ZRAM_MEMORY_TRACKING=y
> >  CONFIG_ZRAM_WRITEBACK=y
> >  CONFIG_ZRAM=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >  
> >  # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
> >  CONFIG_BLK_DEV_INITRD=n
> > diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> > index c46125c1f80f..10b01b55a66d 100644
> > --- a/drivers/gpu/drm/ci/arm64.config
> > +++ b/drivers/gpu/drm/ci/arm64.config
> > @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
> >  CONFIG_ZRAM_MEMORY_TRACKING=y
> >  CONFIG_ZRAM_WRITEBACK=y
> >  CONFIG_ZRAM=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> >  
> >  # abootimg with a 'dummy' rootfs fails with root=/dev/nfs
> >  CONFIG_BLK_DEV_INITRD=n
> > diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> > index 7ac98a78691e..8225b806dad8 100644
> > --- a/drivers/gpu/drm/ci/x86_64.config
> > +++ b/drivers/gpu/drm/ci/x86_64.config
> > @@ -5,7 +5,7 @@ CONFIG_CRYPTO_ZSTD=y
> >  CONFIG_ZRAM_MEMORY_TRACKING=y
> >  CONFIG_ZRAM_WRITEBACK=y
> >  CONFIG_ZRAM=y
> > -CONFIG_ZSMALLOC_STAT=y
> > +CONFIG_DEBUG_FS=y
> 
> Really not sure what those are.  I'd rather prefer not to touch
> any configs at all.


Never mind, scratch my last comment.
