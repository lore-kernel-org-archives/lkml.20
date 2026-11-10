Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271554;
	b=BsY4WG+0lUijB7qe7eziplSLLad5xDj8Df0zQlzBWWNU8sLHthU25HawVZol2a5F9maJ
	 GgyZelsajTb7aTuwAgpitFU9BuzcQn+eVbEG9D/3l/6FXEwVsUAerTkEYMIQoBud09FKO
	 RCCjrWJp/8OIlsheWii2QZGPj8N9j7XCm8BeqPgLS3gNxp1VcKh8YWAzEJ8ioDlT4uVfE
	 BTmn+3UdhRhOp1ZVw899icQLmmnjx/FX4UOVbBVebAcJJPI2oF6vKXAilz8OAL2Zd5i4l
	 PbAswe/FrqNtWZtcNoMcCwyzZ5TV7rvy2b8iD3BtupwTX8Ikmyj1Nx29kKVIu1gNMhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZkmTpzpvYUC7ntJzmKPOJ6Gzor9QviyvVoNYRgK5Xt4=;
	b=HZ+anQfw96Dd66qr1SBLeLp3pl3XwKU7MLFSClwSv/FwW9L8W4NybK/KYcHRNpfxZPBd
	 xqHvaJCBFLvfT8ShggIsvdruUT2HKjIngSjIbufbyUIPnB2cqtGgIvIJjOTcqZujaQGUw
	 A2ow5MmDiGr/TZ2iNh4XmcedBjvRjbHeC3/49DGafj1X8x1dzzdkSilCZVoRfBCnnIqFG
	 4LcxqbKjJqIv+s5qJ7LZGnesuA++3QMuxhvNqWxiEicWhO5/7ZLZUxKnLGpXjxpSszJqo
	 jisaR85L5xWItZsTVfpZ9FNC/GUnKuKFKOupWx3vXipMiXtBS0YqmpVC8c2Q9Yk6CMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KENk10Ex;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE78606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE78606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KENk10Ex
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53653e30353so19251871cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794271552; x=1794876352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZkmTpzpvYUC7ntJzmKPOJ6Gzor9QviyvVoNYRgK5Xt4=;
        b=KENk10ExSThPjvJIbaRaSz12k7D0dwtjtTSi8PUD6FLJH49GtS9Y6UtKu9xmF5uxwO
         eI+rY9S/jjkWoOzplgjXCMqTcClA0ndKp35QlMr6KWBTpmFf9OsInuafRL0utB+LlIBU
         /vdJUikbjsT7x6f4H3veFQHzkOFyfCqId1BwR74P3uhqroyQc0kb2gIo5q+u1ZVXwhEK
         fjp2LYYz/3ukm0c7tvaGhqCCZ7o6z9mw7DifmV/xvMwNpi8yeNpAkh2/XRhyS16xLrdJ
         jBgXCYfzW8pci3DknpzuhmuQyFXC4miXUUHjOC3zP3ZqF9wUmlM5lrxmkUs21LJ/ZL+n
         ddbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271552; x=1794876352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkmTpzpvYUC7ntJzmKPOJ6Gzor9QviyvVoNYRgK5Xt4=;
        b=RJpdXly8E3G8MGpyM8JYtD7BA6LN6/L6/2zECbkYvxbTxKLU3+fE51BAzTM9bNYt6/
         1YU2etfAxgERJBm+TYzF+nnOTChtPZTGZqInuEfgytr0uXqoYhnDoLd5AI6dmEQneSgi
         +sddy+QePsGxc+HGKr9pEMSOa+fQ+HYk0TdpDVBMKi45JOIzMlHomuK22Wd4w4wSvEsr
         i4/s5l0L0EVe5r2OWwP9uhqk9aGgUbskt39cJnswOs/E55KCv8jDL6s70gfnFqaa5bvh
         eGqS8quRei1xAwjlCCbAedOMeoP5bKecRrK2/N47jJbPs+dIOvggONPaL0G1scBG0WrR
         Ngjg==
X-Forwarded-Encrypted: i=1; AL+hErHYHDmvTvAr8h1Pb7tCuc93X0n7UrJBeNxYbT8zJgvYsErA25TDD2hSKhmhOaieGfyRKpyR5DHwJV8nf9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z++fX9yIaIp9GvoVSnV55jy0fhNEuFGF7wocF5HuHmfgbEmj6UE
	GMkuNkexgocTGnJeh31MEueHE+aQt6Gnqvw/DKa2WqTDggx9MmxyqMpxodP8y4S4g2c=
X-Gm-Gg: AYBFou1L41Bc/1y9ucQSUe1vc/sztDfFg8ypXQnzgwfLqRhZ5++4UwSvasmQNWTMH2Y
	pC5gvuYf7BSiySumjUu/M2bfpAaM2M8cbnIYdPW0gGCefw3+CBsS0+sNBiRvliUeHJ1IL6w2JSo
	5SUkngKiYLbGU0uAMhAYJ3uwgxF27Z9qPU0sS1fav7pk/DsKzf/ZqA9e+n4sFyDnNqxaEY/n3Me
	IHhaVuzIsf4znW4+3LDBOIJuu3w8ee/GYLuwvichMbbjRs8kvid3DmzvVW8wRV61V18QgkirWBP
	WtwFjsqMZ0ayS6+gM8gApbbJ/jJ+t168p3+fUCGqcg8VCXLTm2iTmGyQFAohJGyoZoDcAzNSPZO
	xtbEuBuhamPuxPAU2FISq0+hFRqkV3ov77J1DIkX2G+l9wIbyp9fIF4b9qXjtejvfGrcDkmwkzk
	hzu+/TxJl1PXHu4J9OyNOMOmT2JcXDR/4ZIQNOzzVij3BVpIXZrwAi/95CAnbnrND5A6r/o2hSt
	UzIND5J5Z3qDm+edAvX3pJi7+X/cd+J/dzhGNtEedafytjDy17Tm0DqGSfa2eK2wu9icWZEwNB6
	nuc1gi0QySo7C3E6vbkmwEdTlpaXkeHlOI/xrREKD4p8MWCLGC5Cl4xADeG6AUw4oAXlXUDJwHf
	D4gcLEGmSmDWmcpCICN3dhUCLoDCExseR
X-Received: by 2002:a05:622a:17ce:b0:538:10e7:da7f with SMTP id d75a77b69052e-55528109297mr16657431cf.46.1794271551944;
        Mon, 09 Nov 2026 16:45:51 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b9425c5sm10544221cf.17.2026.11.09.16.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:45:51 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQZzi-00000003MI6-1peu;
	Mon, 09 Nov 2026 20:45:50 -0400
Date: Mon, 9 Nov 2026 20:45:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: leon@kernel.org, hemanth.selam@gmail.com, yishaih@nvidia.com,
	edwards@nvidia.com, mrgolin@amazon.com, michael.j.ruhl@intel.com,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Subject: Re: [PATCH] RDMA/uverbs: Fix radix tree node leak in uapi_add_elm()
Message-ID: <20261110004550.GT663069@ziepe.ca>
References: <20261106013908.21789-1-kartikey406@gmail.com>
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
In-Reply-To: <20261106013908.21789-1-kartikey406@gmail.com>

On Fri, Nov 06, 2026 at 07:09:08AM +0530, Deepanshu Kartikey wrote:
> syzbot reported a memory leak of radix_tree_node objects allocated
> while registering a siw device:
> 
>   unreferenced object 0xffff88810d78f488 (size 576):
>     radix_tree_node_alloc+0x81/0x1a0 lib/radix-tree.c:276
>     radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
>     uapi_add_elm+0x61/0x140 drivers/infiniband/core/uverbs_uapi.c:41
>     uverbs_alloc_api+0x85/0xc50 drivers/infiniband/core/uverbs_uapi.c:659
>     ib_uverbs_add_one+0x1b1/0x350 drivers/infiniband/core/uverbs_main.c:1196
>     ib_register_device+0x4fe/0x7f0 drivers/infiniband/core/device.c:1503
>     siw_newlink+0x36a/0x3f0 drivers/infiniband/sw/siw/siw_main.c:433
> 
> radix_tree_insert() can fail with -ENOMEM after __radix_tree_create()
> has already linked intermediate nodes into the tree, leaving them with
> no entries. uapi_add_elm() frees the element on failure, but nothing
> frees these empty nodes: uverbs_destroy_api() only removes populated
> slots, and radix tree nodes are freed only as a side effect of
> deleting an entry. The nodes are therefore leaked when the uapi is
> destroyed.
> 
> On -ENOMEM, populate the same key with a dummy entry and delete it
> again so that radix_tree_delete() reclaims the empty node chain.

That seems like an absurd thing to do, can we fix
uverbs_destroy_api() to free the entire tree rather just populated
slots somehow?

Jason
