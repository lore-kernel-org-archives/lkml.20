Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559927;
	b=kv/4YtrpcvVSVSjBth8ynGzWug24QirzJMd20zSdyJRZazqGt3Wlsq2MH53cL1FIpmpV
	 JHNPPyiZxPfdpD3t+QHNbsKzfCKYcMfdvfd9Z5eVCTO5q+FHbMmEVEX7IHTENjCCI2vpM
	 2dnWvNM/+hBM2ivmVtclwAxtf5iX13gLdVc4C42yv1O7f5OYBpvGwOb+i78SzQsJsC5G0
	 7KSUbCdK14jlav34+vqfTOf7HBuCQEpvRssx5Fsgv5ht02H8KViFg5C6w8RT9DOpAWrCN
	 bsp0SX8k6oaQhB6iBvgyOxBXJXlbRfQncT1UcBnwTrpS0HFiZHVXmdEo++CTfK83TVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=bwUDB2KW6o606MZkDo/fjGb0dXbOTwa5lnzMBFGM+38=;
	b=zsE+Rh1xruUz1flwU9EdgChHcJ3u8QrGJZ99KdZ1ec8+zZeLtzku7/hzPSTpqkRsboRd
	 Ojw7qAefLhvQUrE+NJpSR+18GEeURwabh0qjAaXQ7jHr/ARGM3skZor6BcgUtymfjKl+I
	 herPSjtAuh6AaxYJRYywtEXf26MkajRB6Vl+2L6BdRGdkxJb+z6t48xI+JAZXUMQRCsvR
	 4GxvqhfeFs+RErpWUQSi2/GgZt9yNfvE2+mpuXX+Q1TPRBF60Acss8iGEsYQfdNSMCSDq
	 ZWnNpWKFTL1IxoAj11ByJ/qsnYtDp45aooyIpBKmeGlQBMhbKxyqpW54iZkn4Zc+Jnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qfYTAkPa;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA4606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADA4606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qfYTAkPa
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b1a38a5088so195955a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559926; x=1795164726; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwUDB2KW6o606MZkDo/fjGb0dXbOTwa5lnzMBFGM+38=;
        b=qfYTAkPaHlJoKZndJ1amhv8QdpihkbMCquLcZkhGlKDUylG8GW0BZvSAikFffhjx0t
         ii9EpRoXoEVeVC9qma7452DsMHJMLibW+zE9u831VDMGj9Z9IWM/6pd+uf+2NLS0IVgc
         ZwzONvdSovIkb4u/wurJ2rUTWJNcZZjBVVUVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559926; x=1795164726;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwUDB2KW6o606MZkDo/fjGb0dXbOTwa5lnzMBFGM+38=;
        b=DdRSVi1vbdNMUGdb4kPJzDTF0jqXhL74p+eykAeW0c4NE641M8tq6I+fNB/6geR223
         nCowcZO2XsUmEs9sPxOe7OPE0ATDVVeR4DqfyKFUAFUfOH2F2oEBRExkNijVFCWNv/6f
         s3OMfPL9uJ8B1daI7TUVnwpd552m0GdNNd30wUiwaHSdkAY/FR3F5bsPGhU9cn8cSdKi
         ffnfeUvhE4WPjlmX/M0hqFC3DmJl9yynHkMwNCbjB8AqW3/WiDFiuLzE9kVvDwiyZvn6
         N+vlT63PKJa3tqHGLkx9lZqvHC/VTGgKXmfB/IxWDjwl8rbIc2mS7LDpWll76FLzTghh
         57pg==
X-Forwarded-Encrypted: i=1; AL+hErFM3AUUvWmwzjyR0gAhlrt1vBv7OBFTecHli28VubDQwchoZKLfd+bFDWLBlb/n/AOECXwu1Mq3DzJUsBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FDsWUXVJoM8JPdRHaaCr+NJWXlKgUCyg3HHam5kspuAYONBWu
	Q3bW6zwlRxh7bXeR2UqQiP6VYjtUajEpK1hU6to7LUbB4F22GeLmXbFZd6C1auoxeys=
X-Gm-Gg: AYBFou3KrxBcNA52jKpBs+0RsImoHcO+x2+edUnjCb8Kd/zQ+0aLeRYCC/dDIzLEZqs
	9wEYZg0QgkUjTsXSQ9dlaDaDPN1jVqnSW0FMLThQWuVVsv5FKK69tgY9xJh5SiX6GtuYOEOyXvs
	el9/eVqVTMz/kKYVDudCIv8TTRdp0NsujRQy1uK8n5aLPh6N6784KEf5Dz8m9I+Nwx5SxT6vODD
	7TwjfRil7niR/DbQh/3CQTh99Zz5zj/vO2OQJ8KVJa+Du+A/jnTGuHvY515oPUDwBsQ4XamQZBX
	++STyhYNFZXYCXSmS3aeWW4YHslqUG28XcO60oIhvNeLZGPzY10S3dcc/HZTt45WQwmol8PlacZ
	g3CtcdORLFuXoWJvNZoWiVI+R7ViihACE/CAQ/JzShLkg9aN3p2H9HBY12ikONrCPpyj3oKsVs5
	SLmrQRMHjg5hmBirAxULU/3SQnK9KM6vRyuQSG3JYgakC689nVGm5tTk96NyfNNUdGyY6Vl77v6
	npLnxHpkFRNnvNHpS0R0XxlS6PJDJ/uGNmDcACvru2EXPsIYTd7aMZAU6Zph/gAwinsM1OgOxF3
	zfpnb0CX7kS45QXWLQwQ1Aiuo0VKz0HdOXN+R++SDAREkVnboDKcabrvoKUHqpsdN0DJysM1KFd
	Z68rMNazh2j7kCxsNDQ5ziQiDdpLRQ3KH+yxUDavmjTlZ7+WT2uvPXj5Vy0Bh2qO+RH8OGychO8
	s1wFoKfkmvEkyNfdVIJMY9s4lvjqVat+kfromaFkRLE2MvBvksjhWFpYGnPXY=
X-Received: by 2002:a17:90b:3148:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b1b07ff58amr1597563a91.6.1794559926135;
        Fri, 13 Nov 2026 00:52:06 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm8791005a91.8.2026.11.13.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:05 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:59 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
In-Reply-To: <202610302115.8C7AD110@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <9a68a4d95830352ad3821437c2e22c30a673055b.1793253633.git.chris@chrisdown.name> <202610302115.8C7AD110@keescook>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005159.840c7b1a6049a81b@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>I thought the issue here was about calling convention (i.e. with
>CONFIG_SLAB_BUCKETS Vlastimil had suggested making the argument lists
>for the call chain shorter by dropping the bucket argument entirely).

I think you might be thinking of Harry's kmalloc_params idea from the
slab_alloc_context thread [1], which would fold the bucket and token
arguments into one struct. That's a separate thing. This patch can't
change the calling convention: with slab_buckets=0 the kmem_buckets
argument is still passed down, it's just NULL, so kmalloc_slab() picks
the normal caches.

What this patch is about is being able to build one image with
CONFIG_SLAB_BUCKETS=y and not pay for the separate caches on hosts which
don't want them. Harry measured that at about 1 MiB after boot [2], so
it's the smaller of the two, but it's the same "needs a separate kernel"
problem as kmalloc_partition=.

>Regardless, I still prefer this being a static branch so we don't end
>up with a needless rodata global check.

The flag is only read in kmem_buckets_create() and
create_kmalloc_caches(), when a set of buckets is created. It isn't read
on the allocation path. Allocations never look at it: they just get the
NULL that kmem_buckets_create() returned. So a static key wouldn't save
anything at runtime. Also, some architectures (arm, for example) parse
early params before jump_label_init(). So we'd still need the bool, and
would have to flip the key later as init_on_alloc does.

Is there somewhere else you had in mind for it?

[1] https://lore.kernel.org/r/e650e125-5f6c-4de7-88b5-9da666bb0a4e@kernel.org
[2] https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org

Thanks!

Chris
