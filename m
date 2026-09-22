Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82F5437CC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081510; cv=none; b=JzvaH/BltBwfrh6qd4SY5KKQURE+M1AifJje0x+jboTFXgCs6ggKkoMYxMlCSpdhtmfilBQOLaPOvvhnZv4PUBHpUrBshK67zWiBAnVnx3Vi9D3KxKtxbVZxhN6wyJnh1YDwH1DSZ2IuZUrbUGrGF8IWbHtHsiMzxsr4IhhDvkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081510; c=relaxed/simple;
	bh=OXzfeDmD951o3euygjRBAF9wXGmT9BdYgGl/v+Cm9r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMw0dUrCAnGR2WfEwXeLdw6Ltm+CL2UxRPNAacsdMBkNts5SzFgJp0+gX60PFzfLeia8tzkJYn76iY4+b60sIkfS6Yf79PfmuVAwmmBq38OiUxCd0SwHfI+KyqAQDFxfsUUMbmImejCGg3Y/pFOwV8+x2HuH/8wj+jYW7VAQcRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9RIVInQ; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9RIVInQ"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso6009755a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081506; x=1790686306; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0pT1Bz/Ukk2yKj9z6fcgefhEfOADcNNQjef2vknbn4=;
        b=g9RIVInQdKaSdYWatGpXagCypwmcCzhBgFGKFtf762MF/3ZlsAjt9BfnvnPqi59kXM
         Kd50sPec7U0J3dHaMPnkUa1Tle3dHmGG/xXDCHQJ9NidFY1pQpxpnP2l2RZtWq+wUJSA
         NNFhZ+l6JXMXraxZZXSCHcOP8qbj3D62X2y3KoqOoBw96sX8zkYlhP3cussrfGSUGsQj
         mZA0gRnTJ7KLLgcfhL/r2uKG72U9SRJTFgQr7yPIYoib9SRyh9navUWGguetckKZU+Sr
         baR257uIfabsuKCLjezL/3kUFI6WnPNor+fZBs7KYeiiKrT6tSs/uLRaBPUZx3Owx7gj
         OYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081506; x=1790686306;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G0pT1Bz/Ukk2yKj9z6fcgefhEfOADcNNQjef2vknbn4=;
        b=bh1kuZae1sdkWYUzOZQ7S/Kr6e3yzNFQlOS/P5dbj2tdHLngvXUSjWliFMFL33a2+d
         zHRtJSeQiV8/900h5d/RB/CYIUxVAAp5Ds1NS46imVXVjiehMSDaSJVuDy2G0HJPybEc
         JntPokaP3TS4qY0OjtyVXaGMqNh99E3WJPncESDKlTt40wQxcmFtBPow6TmL8cR3ms8R
         HtucrCtm2UoUA/o6GWpzu7HZdhWjpj+QMbU6zfjnkVHRRewAzzPEtsp+DCSnS2IZ14Cz
         E5s4W5a6UhYwgtoYEvDuy2/Pvs+IgcXH9eOgLWs/d/aZxoQ3/zktg7igP0RH8Avwrcyj
         3AUg==
X-Forwarded-Encrypted: i=1; AKwUvBw/ytHTSleUkDfXOVV2be/uX9BPG8lyQimXEcaRLK6NvsERJ/Xt3G1ffrxUIwLILk2whZuU64Y5TGz2fGU=@vger.kernel.org
X-Gm-Message-State: AFuF++k4RPBCdAF50Tgy/Zc35pCiVqD0Ox6K2nNgAz88tFiCzYvS3YNq
	TSd4D82nM57X1FXf/4BVbM4rTEUEePsZpvq4ty/+jx5mlxYR3Cxm7EW5
X-Gm-Gg: AYBFou0mB3kX6fPKzVEVWXhuLN1ywYFBH5hCVrMwIxl4uPEW5QE/O9bCgj6vNd+2Hmm
	FzCc8LrXqqLDYe0jBIa3hwAZpeXSNhlKCitxJAATAkWQhhAxe49XUDmQl3vj1MeAdzgEXn54qwD
	5Qi9zFQBn0wwgk0Rj39sDNIXH1vnu9KgxGlGQTisL6Cyu2n1wfleYlff6em/TN8Ym7TXnVdMHj3
	i7lgZW0FglDLivH0wsC7Mu86VjdVncxBasuFuRhkFczVBQtWlw+zZ2wXDPZ0vqT09gw5zZPgeuc
	kURjb8X2bJLNxl/HhGI9A/T6m7F8k41+vDZZn4AbHfp/gA1eNV3fGG3C8H7F2VE/Gat1jxo5rJG
	H/cm0y9CUhv64fTMPhJtnWmj6j7WXeh8OgStFUwhsuV6dmA8DIc0VLVCM7hGf+hUUtC47LM7M8Y
	xlgRZTpBR0lzQ4O036KW4404jZ+iRbZfMcqBwdsYxAHg5kk4OZ2X6H+y71i3jl2DXUQZmB
X-Received: by 2002:a05:6402:1d4f:b0:6aa:9823:218a with SMTP id 4fb4d7f45d1cf-6aa982324cfmr3582241a12.31.1790081506095;
        Tue, 22 Sep 2026 05:51:46 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1073668a12.30.2026.09.22.05.51.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2026 05:51:45 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:51:45 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Yuan Liu <yuan1.liu@intel.com>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	Nanhai Zou <nanhai.zou@intel.com>,
	Chen Zhang <zhangchen.kidd@jd.com>,
	Jason Zeng <jason.zeng@intel.com>, Chen Yu <yu.c.chen@intel.com>,
	Pan Deng <pan.deng@intel.com>, Tianyou Li <tianyou.li@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] mm/memory_hotplug: optimize zone contiguous
 check when changing pfn range
Message-ID: <20260922125145.3fygpy7gxoztsa3n@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260920084946.3266279-1-yuan1.liu@intel.com>
 <20260920084946.3266279-3-yuan1.liu@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084946.3266279-3-yuan1.liu@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Sun, Sep 20, 2026 at 04:49:46AM -0400, Yuan Liu wrote:
>When move_pfn_range_to_zone() or remove_pfn_range_from_zone() updates a
>zone, set_zone_contiguous() rescans the entire zone pageblock-by-pageblock
>to rebuild zone->contiguous. For large zones this is a significant cost
>during memory hotplug and hot-unplug.
>
>Add a new zone member, pages_with_online_memmap, that tracks the
>number of pages within the zone span that have an online memory map,
>including present pages and memory holes whose memory map has been
>initialized and for which pfn_to_online_page() succeeds.
>
>For early boot memory, pages_with_online_memmap is calculated in
>memmap_init_zone_range(). PFNs initialized by memmap_init_range() are
>included in pages_with_online_memmap, and hole PFNs for which
>pfn_to_online_page() succeeds are also counted in
>init_unavailable_range(). For hotplugged memory,
>pages_with_online_memmap is updated through adjust_present_page_count(),
>which is called during memory online and offline operations. When
>spanned_pages == pages_with_online_memmap, every PFN in the zone span
>has a valid memmap entry, so pfn_to_page() can be called for any PFN
>within the zone span without an additional pfn_valid() check.
>
>Note: this counter may temporarily undercount when pages with an
>online memory map exist outside the current zone span. Such pages
>are only created during boot, when initializing the memory map of
>pages that do not fall into any zone span. The undercount itself
>can only happen after boot, during memory hotplug, when growing
>the zone to cover such pages and later shrinking it back, which
>may result in a "too small" value. This is safe: it merely
>prevents detecting a contiguous zone.
>
>Here is an example (page numbers are just for illustration purposes):
>  after boot:
>      [  zone span  ]
>      [   zone pages   ]
>      spanned=10, initialized=15, online=10
>      online == spanned  ->  contiguous
>
>  growing after hotplug (hotplug 5):
>      [  zone span                          ]
>      [   zone pages   ]   [   zone pages   ]
>      spanned=30, initialized=20, online=15
>      online != spanned  ->  not contiguous
>
>  shrinking after hotunplug (hotunplug 5 again):
>      [  zone span     ]
>      [   zone pages   ]
>      spanned=15, initialized=15, online=10
>      online != spanned  ->  not contiguous although contiguous
>
>The contiguity check using pages_with_online_memmap is stricter than
>the old pageblock-by-pageblock scan. The old set_zone_contiguous()
>iterated at pageblock granularity via pageblock_pfn_to_page(), so a
>zone could be marked contiguous even if a subsection-sized hole
>existed within a pageblock. The new check requires
>spanned_pages == pages_with_online_memmap, meaning every PFN in the
>zone span must satisfy pfn_to_online_page().
>
>The following test cases of memory hotplug for a VM [1], tested in the
>environment [2], show that this optimization can significantly reduce the
>memory hotplug time [3].
>
>+----------------+------+---------------+--------------+----------------+
>|                | Size | Time (before) | Time (after) | Time Reduction |
>|                +------+---------------+--------------+----------------+
>| Plug Memory    | 256G |      10s      |      3s      |       70%      |
>|                +------+---------------+--------------+----------------+
>|                | 512G |      36s      |      7s      |       81%      |
>+----------------+------+---------------+--------------+----------------+
>
>+----------------+------+---------------+--------------+----------------+
>|                | Size | Time (before) | Time (after) | Time Reduction |
>|                +------+---------------+--------------+----------------+
>| Unplug Memory  | 256G |      11s      |      4s      |       64%      |
>|                +------+---------------+--------------+----------------+
>|                | 512G |      36s      |      9s      |       75%      |
>+----------------+------+---------------+--------------+----------------+
>
>[1] Qemu commands to hotplug 256G/512G memory for a VM:
>    object_add memory-backend-ram,id=hotmem0,size=256G/512G,share=on
>    device_add virtio-mem-pci,id=vmem1,memdev=hotmem0,bus=port1
>    qom-set vmem1 requested-size 256G/512G (Plug Memory)
>    qom-set vmem1 requested-size 0G (Unplug Memory)
>
>[2] Hardware     : Intel Icelake server
>    Guest Kernel : v7.3-rc3
>    Qemu         : v9.0.0
>
>    Launch VM    :
>    qemu-system-x86_64 -accel kvm -cpu host \
>    -drive file=./Centos10_cloud.qcow2,format=qcow2,if=virtio \
>    -drive file=./seed.img,format=raw,if=virtio \
>    -smp 3,cores=3,threads=1,sockets=1,maxcpus=3 \
>    -m 2G,slots=10,maxmem=2052472M \
>    -device pcie-root-port,id=port1,bus=pcie.0,slot=1,multifunction=on \
>    -device pcie-root-port,id=port2,bus=pcie.0,slot=2 \
>    -nographic -machine q35 \
>    -nic user,hostfwd=tcp::3000-:22
>
>    Guest kernel auto-onlines newly added memory blocks:
>    echo online > /sys/devices/system/memory/auto_online_blocks
>
>[3] The time from typing the QEMU commands in [1] to when the output of
>    'grep MemTotal /proc/meminfo' on Guest reflects that all hotplugged
>    memory is recognized.
>
>Reported-by: Nanhai Zou <nanhai.zou@intel.com>
>Reported-by: Chen Zhang <zhangchen.kidd@jd.com>
>Tested-by: Yuan Liu <yuan1.liu@intel.com>
>Reviewed-by: Jason Zeng <jason.zeng@intel.com>
>Reviewed-by: Chen Yu <yu.c.chen@intel.com>
>Reviewed-by: Pan Deng <pan.deng@intel.com>
>Co-developed-by: Tianyou Li <tianyou.li@intel.com>
>Signed-off-by: Tianyou Li <tianyou.li@intel.com>
>Signed-off-by: Yuan Liu <yuan1.liu@intel.com>
>Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

LGTM, thanks for the effort.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
