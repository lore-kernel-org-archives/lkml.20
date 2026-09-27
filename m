Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECD5547046
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467422; cv=none; b=Z0UfNgz2H8iurmE0kXD5pY74HopKZjT+/dHBcB6RYstQHgEqLvKqQZ/k/z4X9dscGLtfD3sSOk2n9Asq/QpJXEr0ws0v0F8hUtYMACfuzmE2zHgt7aM1mUfxI+zXcUhlRHXJFlGBhItIE9pPtYFud21uZ3xbZ9apnyn78QSQ+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467422; c=relaxed/simple;
	bh=DHoSz/E/5pl7d/NuidhrXo3nEtnqsKS07o28y8ae++o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOkaNCmxcn14K7jHfzMPkn6XyqIzIdtT8C+Aq6Kmqg8I9uGG5XoZjo6zMVoxzl5q3Z/Bm9V4gMlxZktmNujeECNGlxaTlULjEAnwEzE1FwLhsXpYQn21sJaxgQgJFJIGsFMmeNwNZ6HlqHpVMjqd7CIUk0OwAAygtyR57peMLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=TT8xTZas; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="TT8xTZas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1790467417;
	bh=t1NV1h1nSPt4cYWoKLftL9MH2NWX+QPNIV0D+GSaeoE=;
	h=From:Subject:Date:Message-ID;
	b=TT8xTZas0It64tKtWR2p4aQkcUoMBWNHWIVAfhBDRYZnOqiMKcakWdobCttIzx3Vt
	 lLZNo51uVkw5etIZHeLqqYsSLJq/unYBAn0Zixp5xTPY92eFMB9ZI7sWjN5uCS8nBZ
	 +TPciMEUuFxCaeJwXLCBKxgHjs5GO7kQdg41vAD4=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6AB85D5200006D2A; Sun, 27 Sep 2026 08:03:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 924834456770
X-SMAIL-UIID: F10C53ADF8B44D0E820DF1EC2C9DBC9C-20260927-080333-1
From: Hillf Danton <hdanton@sina.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+1b129b44597a126d2d79@syzkaller.appspotmail.com
Subject: Re: [PATCH] drm/virtio: share one vbuf cache across all devices
Date: Sun, 27 Sep 2026 08:03:21 +0800
Message-ID: <20260927000323.299-1-hdanton@sina.com>
In-Reply-To: <20260926162452.136863-1-ngocthang2710.1999@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 26 Sep 2026 23:24:52 +0700 Nguyen Ngoc Thang wrote:
> virtio_gpu_alloc_vbufs() creates a kmem_cache with the fixed name
> "virtio-gpu-vbufs" for every device and destroys it from
> virtio_gpu_release(), which only runs once the last drm_device
> reference is dropped. If a reference outlives the PCI removal (for
> instance an open /dev/fbN), a rescan probes the device again while the
> old cache still exists:
> 
>   kmem_cache of name 'virtio-gpu-vbufs' already exists
>   WARNING: mm/slab_common.c:111 at __kmem_cache_create_args
>   Call Trace:
>    virtio_gpu_alloc_vbufs
>    virtio_gpu_init
>    virtio_gpu_probe
>    ...
>    pci_rescan_bus
>    rescan_store
> 
> kmem_cache_create() then fails and the new device does not probe.
> 
> The vbuf size is the same for every device, so create the cache once
> at module init and destroy it at module exit instead of per device.
>
What is unclear -- why is kmalloc failing to work in 2026?
