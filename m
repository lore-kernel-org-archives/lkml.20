Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2550EBFD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803568; cv=none; b=jRMGT5gQTwHO1howeHql1U925my9hapNPSjLN4Y7eqtwMhqy/PQKOVb8NhAakgCoXW1Tgr90jd1qp4iv1NX4Y+K8OII0QiUYgM5IE0oy6xTuu8uCW3U6JhP6NFI8KRmDqcS7SarATVDJzxf1T8wpqeV7AGwFAgV6B9nJaE7IqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803568; c=relaxed/simple;
	bh=iXpeLJ2IQz6dj06pIp8CpdyiSrvgdjV2iaNmpg8p4ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0giWS44/w8I2uafOrkP8UdP8SlbQIJaZttQkw9SMsoBIma4OormHDdVNKC/4+aT8tEhNaEfk0wtdCRMPzSZ5Vr/slTNVoWbzAuRn6p5P8ZdOlL8jmx4VvU3BwX2iaiKS1ZT143VbqVPScsxOgc23ipwNjsewGjGu229ro7gRDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsVxrfn2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsVxrfn2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so34773245e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803564; x=1791408364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NcEBo2bS8P+fcdvedqvJ3Az2pTigqmXIzaSqCZiwQc=;
        b=NsVxrfn2Kljkmos8XO1C4TcS63vOjOpRnApgTy+8RX/0eZ5tiYSQZ+DSYvtv8OFqwR
         KCyb/UI4nPc23lkbaYA+3GqL1O2o6EHU8il03ie9jKkcg2Q1kK9gNTk7xRUvQiEdbTHf
         Juhh2qiKRVNEvF8/lDV6f8CJv9/MSXEoDllGrwwZM08eVe6VTceAOJtCS+G4MuBcTdhL
         G1y9o5CJarQu3i9y0iNVxTYPNY59GWmepUTaEm5lQix4DROPQgNlPCD4Y2zOiNfcZOAO
         2WOPdEGb8Uu2Muyr7ozNvxIQL+E/zjnFKw8BVHw9WAhoQxo8HnjEFaxh/+MrwQRnyhXh
         1iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803564; x=1791408364;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NcEBo2bS8P+fcdvedqvJ3Az2pTigqmXIzaSqCZiwQc=;
        b=KgL5haoE+K2dE6OLl1jhq5PH7CyYj08CsO5Ti3Tm5W1S/5JycnwxW4iZ6ZVU77G5D/
         FgQ9jkv6wEentEBVLJQ2A2fty2SeRh183+9zEsGAHMs4cwkNFrd0KX66do1V7C2FxKeD
         lKzBbQsFinrKqoxflg/VbmfssCAjQuVFcaY7dZwSeFZ/iruGT56G/OPua+FMEckeFoRr
         kNQBQ6FUeUVKEr8Q2ll/c/bisC+60K1IL+HFXnbJDAgiEYdnh48ob4gQMt5/gB+wWBgT
         SLH2iN8cthubb5MIr8QLh3acva5oGeNb090laTjNsfp6GRJOBaE2k3WVxMG4Ymwu+w3S
         z2sw==
X-Forwarded-Encrypted: i=1; AKwUvBxpkBF272XkrS/6yQ1qvi+EyliR85EGvVi8FAhcg3enrL8Y2v6yWJuIu40eLOdq5Pvs3v9QMWE2cyBEMxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKBwlxcNe3/nKXj7XJVbuR4oatgy5jVEWf4zekuev40LrI9frP
	aAudyL6930YmCRl2sOksu92axRXAwmMdEuva27N2yQOI5C9naXJDqHYC
X-Gm-Gg: AYBFou0YiCR1VlhwtFbtNqtuTTYA0w0DrLG64oO69wiUPmsvKjVxQUB6ODd3c3CImmw
	6MF5tV5WRhmmxaGDkxFMuVTNlXxqRGXoTFZQoyfOzlLVRA8nDt0x9KLbWpR1os0LT01dTsV8wgS
	PHJy2uYMtCrv+742/PeDtuwdP/zryEA/WN1T1coUuW2IsgKNbfdskKz1RPWHtsZ4ExC66g8SZwL
	9MiE2440dxll6MIIl9jQ2ordsvF/8Bfn8NjuTy53FjT6FDKeToaKpRqigIHrX9yJurYjGkI/Amk
	nMSGCzGmkrkRqSE5Zs22HHQo5zLYV/hCib0ZdbqSeJKLwNI/m1qq0DmKg/rbtSl3GQ1Qt1CUuK9
	EuMemT45FMebrYrYxzy/VCuC+znQLBrqNMwN1I2Jq/LJ/y9nruEv9tgR+welR5yAigg7Nt9XXxi
	/E5OmNSFE6PHnfx8ULD6L7wdZvevKyG0LPpZAh9RSW7RUB4EUbN8kQfUhIqRI=
X-Received: by 2002:a05:6000:40ca:b0:488:6561:b324 with SMTP id ffacd0b85a97d-48b024dc409mr4686934f8f.9.1790803564433;
        Wed, 30 Sep 2026 14:26:04 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068bd8c9sm1825610f8f.2.2026.09.30.14.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:26:04 -0700 (PDT)
Date: Wed, 30 Sep 2026 23:26:01 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Imre Kaloz <kaloz@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/slab: sample slab_state once in kmem_cache_destroy()
Message-ID: <ar153_VaZlIY3qeQ@gmail.com>
References: <20260930195110.13296-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930195110.13296-1-kaloz@kernel.org>

On Wed, Sep 30, 2026 at 09:51:09PM +0200, Imre Kaloz wrote:
> kmem_cache_destroy() tests slab_state >= FULL for sysfs_slab_unlink()
> and again in kmem_cache_release() for sysfs_slab_release(), with the
> cache already off slab_caches in between. If slab_late_init() runs in
> that gap it sets slab_state to FULL but never calls sysfs_slab_add() for
> the unlinked cache, so kmem_cache_release() ends up in kobject_put() on
> a kobject that was never initialized:
>
>   WARNING: lib/kobject.c:734 at kobject_put+0x64/0x2c0, CPU#1: kworker/u8:3/55
>   kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_put() is being called.
>   refcount_t: underflow; use-after-free.
>   kobject_put+0x64/0x2c0
>   sysfs_slab_release+0xc/0x20
>   kmem_cache_destroy+0x104/0x1e0
>   bioset_exit+0x13c/0x1e0
>   disk_release+0x54/0x140
>   put_disk+0x18/0x40
>   floppy_async_init+0xbec/0xd10
>
> Seen on sparc64 at boot, where the asynchronous floppy init tears down
> its bio slab while the late initcalls are running.
>
> Read slab_state once, under slab_mutex which slab_late_init() holds when
> it sets FULL, and use the result for both the unlink and the release.
> The kobject flags (state_initialized, state_in_sysfs) were considered as
> the key instead, but slab_state is what cache creation and
> slab_late_init() decide on.

the enum has nothing between UP and FULL, and the create path skips
sysfs_slab_add() while slab_state <= UP, so both tests are the one that
decides whether the kobject exists, and a false value cannot skip a
kobject_put() that was owed.

it would read better to me if the changelog said that. otherwise LGTM.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

> debugfs_slab_release() is not part of the race: it only looks the cache
> up by name in the debugfs root and does nothing before that root exists.
>
> Fixes: 4ec10268ed98 ("mm, slab: unlink slabinfo, sysfs and debugfs immediately")
> Cc: stable@vger.kernel.org
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>

--
cheers,
jose a. p-a
