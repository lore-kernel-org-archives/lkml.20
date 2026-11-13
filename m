Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569597;
	b=ImEBjrWiUFrjIDLJPUIQWLoqZnDt+1BOj6/WipfWbKJo7zACNUT7vnUrWYeCZgNQnKKB
	 7JX0Q8f8WvzPCxPKyPgZK+O+P8rehswMYsjqobYR1jimEQPnNTPVTF3Muo2OIHDzeJ+MK
	 MgSrjhagS/2xFk2JYekF7f1GDVUtVkk0ftaJ0FGi1uLrUVlyFX0Pir2P7N+9wAw56oocz
	 DN89qLFIjP4HuoltHFKXKaHbCEy7/U0EhtgYa/V29W9sPNhFb/YD8uaBuJdm4kG3ZO5aQ
	 GemF1LjNE9+bNXTygAnKVj3Uu5AjzCIp9Cd5aUzBzsm/yYRVaXE8RoIK/umK/aaz0iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569597;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kWV/Rka7apALZ8FQuu0KZSYeIdyVG7amVJeeN+9yJFY=;
	b=LXPamCtza2bq+N2JFaGybWfiWWHMV33GVg7GmdiZrJt82h95N+zJGlk8Ka/hbAgblfqE
	 tX/1axMEBIhgJqayftNrvfpAMxrNhGDGoxSfa6SMVBjdaIBmI57EqKLqb3BKNYedbUQD3
	 G51Nmf9y/mhhtJGqs4yK8+FzijyKlTQuX/JKal9DmVhD/DkuLDVgp+ikXkR4316w2jlvg
	 9UFdwKgwOUIaVuZwjQRL1ijccx9+SMt5v9eIio3rbrcMcImHlsiUCkrXOWg2qHJ1etFBO
	 LjJ8OnnhKAf5vpRKo2wO6pRGVT7M+Wa0gHoBymBYajYGAWcyJZ1zoGbd3R8EB3nH4zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E22606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E22606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b305e10ac7so9011677b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569596; x=1795174396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWV/Rka7apALZ8FQuu0KZSYeIdyVG7amVJeeN+9yJFY=;
        b=btucZDyc5VJVJo14rqtmMI5eRSEAhl70ryzFEKcgaqU5DxI4kyz7wLLlNeV1M80zJa
         V210FJ+n7k8YnzIoghDg2uMopFoqukATkIpENNxEF+e7uuSlkkWLLr0l3GxgdBkWPXMK
         Ls7o1EzcAlipWOqlB2tcUQepa3w/HA4pbQx7s48lm5vtwiw8vyLQ4dat+7Zt9F7x64G9
         keYUh5oN7XkjfJosVVb4HWy95BuHI0V7XXu+0p0GcV6hJU9d8WhbAI/9BnQiX/8q8QhG
         swZnpprhmMklIJRSMFGezAphpyWXoE5nKarBeBXQRif8mGPWRfFPuKVRTpja+XBrr9QN
         7Lxw==
X-Forwarded-Encrypted: i=1; AL+hErGayHxnmQMhWq1cMWlrvG/VbVaZnZuAauT6Z8mEMUpsEIVCQfRM4DnBFwMlMMyaKjkiAhYjVCPVBtESVY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fo96TPaBRK0r92Q599JjdUvvIFE7Ynt9XiCryex6YuzXbbF5H
	KynDaExS/OtwgnGWqRdf9PW90Not7vYz9mXHT1F+iEHlXZNrxAXWLgDe
X-Gm-Gg: AYBFou28h14y14dJcPmkxZdc+p4m1Y4kEqC82/EiTb5IMmb3ewFIpSL66Y5TkcNYW5u
	2EvPVBO9VWhf+uETPRGmz954T0q9V9I8jDhbiZxOkTNIQmQuMH6YmIZdKsXL2bzxG06n91KyDgF
	UcVCNO/6LT7xS45avM+R0nSSC39zsVxbTlyTH6SwANgmh0vpWpv9Io7KeAjT+0pc8v1Mn9eJBV7
	S8iuFk53VexX1C1/JhIDjp9BhuzIbBsJ3ue65FHLlF52SJehD8ud7XqSxNKO7yduolHX5qlTcOV
	iMe6Mr5+TM5HdlkNQwYtDOVsehUWUyccAWCjr7c5f2R8pVEhByB0FxgYYqESlYVJJESog+i+YRj
	HZc+lp06Jf5Cj4QhQ9SwjEqoWexo+qra8UN8iFL+fNXB6udtphxm4YUBB/+6LFJOU/Mw8+JXW7T
	qHr0yok1EenxOtuw2bTXyQeD5SPxDWH1Q2osx1QPmbwLsQaOcQhX1P8YwXQ6D5HRCEGXeRnmOCT
	upNGCagHSiS4qW3vIZwkvyzn6N+wd7cMi4aoYwjaA8v1m4mv+hoTEqXB/O+hAWx1CAvAwlVTKwU
	kUMEMvuBkObyGhpnu0k=
X-Received: by 2002:a05:690c:e3c3:b0:873:5c0f:27c with SMTP id 00721157ae682-8b4aa319951mr15044427b3.38.1794569596541;
        Fri, 13 Nov 2026 03:33:16 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:6::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa958d0asm17666217b3.22.2026.11.13.03.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:33:16 -0800 (PST)
Date: Fri, 13 Nov 2026 03:33:14 -0800
From: Breno Leitao <leitao@debian.org>
To: Yuichiro Goto <goto@k-tech.co.jp>
Cc: a.hindborg@kernel.org, viro@zeniv.linux.org.uk, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] configfs: wait for pending RCU callbacks on module exit
Message-ID: <avb1CyLqJGI_MtXv@gmail.com>
References: <20261113033833.124797-1-goto@k-tech.co.jp>
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
In-Reply-To: <20261113033833.124797-1-goto@k-tech.co.jp>

On Fri, Nov 13, 2026 at 12:38:33PM +0900, Yuichiro Goto wrote:
> configfs inodes are freed from an RCU callback: destroy_inode() queues
> i_callback() with call_rcu(), and i_callback() then calls the
> ->free_inode() of the super block, configfs_free_inode(). Nothing in
> configfs_exit() waits for these callbacks, so the module can go away
> while some of them are still pending, and they later jump into freed
> module text.

Is this still the case on mainline? Since commit 3bc999d944b3 ("mm/slab:
introduce kfree_rcu_nolock()") in v7.3, kmem_cache_destroy() calls
rcu_barrier() unconditionally, and configfs_exit() already reaches it:

configfs_exit()
	kmem_cache_destroy(configfs_dir_cachep)
		kvfree_rcu_barrier_on_cache()
			rcu_barrier()

so the pending configfs_free_inode() calls finish before configfs_exit()
returns.
