Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752699;
	b=ue9XJvSDK9+IwsnP0FN6ah0nQ00ONGOsQTHYmy1OryOSGiaUxlhEhQZTZMvrFIzYDRg5
	 mQ+vkP9NRQTZzM5pMq5uKXV6pepP2CW6diEOqpK9INVk7fHAifQ4uuglHXNwbbhCGKwQP
	 rd0kWQFgiYJLG8NrWKtDji7FHj9UR2mEeaVdWwl8Ir/B9E5t80q12tLMYKV5U0fOYiY7f
	 Y0uXHLVfaNXAvB3xBDuCy7jjfWGdGzfm4He6n1jZkzYk/rdG9YsVzb9NuFHgtJp+tJczW
	 rIgV6Q/tCkGBOZwFkvkDXuh8EzG5ltsAcP6OTWwFvjlsG2GPIBlnS+K+fb6udH20g3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752699;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=ZI/jWFSUpK9WyTo+E+G27clHiH6WPIOS6hDg2pOWU8E=;
	b=174GXK8k4U1liWKUa9vRwhvzv8A4eVLiF7MCzp3i6ksYZqb7QOr0nXhMA3oxmurG8Lqe
	 CNlRT5uloZAU4oTvpIsSqT2Y3kREPdAJAck+OXetrONWvtoM7rqaVTiq9BFPTVmhFYdD3
	 pMqi+ZC0hdUo3UMzUbZxh6S/VEGpVMsNEL0EEE9+XJbxAZofgWEPdNOAGrz+gE5jneEQt
	 IrHF5CviaaWxw3q7tTalLv4GkgBpGol6Egp5sg4MLX9doFY4wbdiTwJER5KZiFAwX0cXS
	 qzspCv6gAd05BjFIgFY/jxbffGYejn0aLvGH1u8RzSGNVtreQgS0nxdmWifn+fGLjIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF24606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF24606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-568249fbf5eso3148308b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752698; x=1795357498;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZI/jWFSUpK9WyTo+E+G27clHiH6WPIOS6hDg2pOWU8E=;
        b=LA9x5W+GUFmUZ3H3E8NotnU2knWjPwIeUp3FfGv1Dm5H69xlWZdOjTtZb6CFSfprVX
         tRfaY3YdXAAJW6MRwTOiWmmBEGw/bovMbbhp+cpESk+YV5aNIZGIgLFAXPzYGiHHQROC
         mgTQoYEpgHuNWUuyvCLFpk6MsCUgyPMRV5n02q+UJmJEMBi0OxpaJ5wjteCFx+C0ISHz
         pp3/AXVJSkHesrwQDnkdkflvaIO68t06gGWy+I9t0i2xyarIrNu9Rj41ptwkW9zbWEre
         vNbPNZOTTEQfsQOCSDLAp2t8gYJuq1jcJMPtmuq6SH/ohju9TT4qDzMS8YPkg6Vel+6G
         tXUw==
X-Forwarded-Encrypted: i=1; AL+hErFmVntLe/9dVvOY8CJbHmPAIGFvPAcB0IFueTE2ZhTcrQOXBXlJTBvrq9vfcZvqEkPBz781uNauxQVEy0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V9BbJOJUttfFYKQ+O3dh1gTcCkXrclnYkHV6mgcPyzocKq54V
	38q0CkzUkE/2Rh2uSKCJ1DzIIAlH/1xiFeE8gC+usf0saCZNBuErNeCDl45tQgw8F+hkJstJBZM
	62BeDHaOh3s/MD8aByhgBaIcS7b+vnt6Gtm/9oBQ7ZS+DB0B9QUMfKdCvpTk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:244f:b0:4e9:7d56:846f with SMTP id
 5614622812f47-56e640bc904mr6950073b6e.41.1794752698457; Sun, 15 Nov 2026
 06:24:58 -0800 (PST)
Date: Sun, 15 Nov 2026 06:24:58 -0800
In-Reply-To: <20261115142448.21160-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9c0ba.920b2b3a.148c65.0027.GAE@google.com>
Subject: Re: [PATCH v2] RDMA/uverbs: Free all radix tree nodes in uverbs_destroy_api()
From: syzbot <syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com>
To: kartikey406@gmail.com
Cc: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
>
> syzbot reported a memory leak of radix_tree_node objects allocated
> while registering a siw device:
>
>   radix_tree_node_alloc+0x81/0x1a0 lib/radix-tree.c:276
>   radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
>   uapi_add_elm+0x61/0x140 uverbs_uapi.c:41
>   uverbs_alloc_api+0x85/0xc50 uverbs_uapi.c:659
>   siw_newlink+0x36a/0x3f0 siw_main.c:433
>
> radix_tree_insert() can fail with -ENOMEM after it has already linked
> intermediate nodes into the tree, leaving them with no entries.
> uverbs_destroy_api() only removes populated slots through
> uapi_remove_range(), and radix tree nodes are freed only as a side
> effect of deleting an entry, so these empty nodes are leaked when the
> uapi is destroyed.
>
> Call xa_destroy() after removing the entries so that all remaining
> nodes are freed.
>
> Reported-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
> Fixes: 9ed3e5f44772 ("IB/uverbs: Build the specs into a radix tree at runtime")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> Changes in v2:
> - Drop the dummy insert/delete workaround in uapi_add_elm()
> - Call xa_destroy() in uverbs_destroy_api() to free all remaining
>   nodes, as suggested by Jason
> ---
>  drivers/infiniband/core/uverbs_uapi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
> index b67db3790f03..77a4eb494936 100644
> --- a/drivers/infiniband/core/uverbs_uapi.c
> +++ b/drivers/infiniband/core/uverbs_uapi.c
> @@ -621,6 +621,7 @@ void uverbs_destroy_api(struct uverbs_api *uapi)
>  		return;
>  
>  	uapi_remove_range(uapi, 0, U32_MAX);
> +	xa_destroy(&uapi->radix);
>  	kfree(uapi->write_methods);
>  	kfree(uapi);
>  }
> -- 
> 2.43.0
>
