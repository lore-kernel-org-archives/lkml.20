Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B20D2EB874
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113904; cv=none; b=rTOWBQe/krGFeDniEbATMmDg2ngF4eyfq30vxPze5FxdKY9VOkMvCaVYU29s3oDsw0X3O+K+FdgceCU8w4Cm2kFcVJhD0ec4fwiHsFseVIlIudJ42VgY2ty82ZjFswJFpLJXkupMCyHN8HZV5FtBIVqMf+qWR3LGBxI00l1sc3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113904; c=relaxed/simple;
	bh=CatLO2z6PdpthGcnB7pFn6c3nDckDPAhg3UryOB/W/k=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=KJje1tVT1UtzVGWR+aaNn2Jn9rCjJM6hKICSiTJjgGXgnknZooXsgzi3Ag05OHuhPDecvXroEuRUNduOo0wh7hUoYRHRhavzzSvqFKDcbmg7bB1G3Y3un3nSW6e2+yyR2SozJmnZRjtfHXq+v+luPxzHaSC/brltQzxysurclBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j5S0q4mfvz8XrrJ;
	Fri, 16 Oct 2026 09:24:59 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 69G1OrPZ066351;
	Fri, 16 Oct 2026 09:24:53 +0800 (+08)
	(envelope-from hu.shengming@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 16 Oct 2026 09:24:54 +0800 (CST)
X-Zmail-TransId: 2af96ad17ce6809-7b4dc
X-Mailer: Zmail v1.0
Message-ID: <20261016092454394HJ4ACd4Qd8oKYogL2CB7H@zte.com.cn>
In-Reply-To: <20261010203906.93156-1-kmehltretter@gmail.com>
References: 20261010203906.93156-1-kmehltretter@gmail.com
Date: Fri, 16 Oct 2026 09:24:54 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <hu.shengming@zte.com.cn>
To: <kmehltretter@gmail.com>
Cc: <vbabka@kernel.org>, <harry@kernel.org>, <akpm@linux-foundation.org>,
        <kmehltretter@gmail.com>, <hao.li@linux.dev>, <cl@gentwo.org>,
        <rientjes@google.com>, <roman.gushchin@linux.dev>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gbW0vc2x1YjogaW5pdGlhbGl6ZSB0aGUgZnJlZSBwb2ludGVyIG9mIHRoZSBib290c3RyYXAga21lbV9jYWNoZV9ub2Rl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 69G1OrPZ066351
X-TLS: YES
X-ENVELOPE-SENDER: hu.shengming@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 16 Oct 2026 09:24:59 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD17CEB.000/4j5S0q4mfvz8XrrJ

kmehltretter@gmail.com wrote:
> With slub_debug=FZPU, validating kmem_cache_node reports
> 
>   BUG kmem_cache_node (Not tainted): Freepointer corrupt
>   Object 0xffff888000140040 @offset=64 fp=0x5a5a5a5a5a5a5a5a
> 
> and taints the kernel. Poisoning places the bootstrap object's free
> pointer outside the object, where check_object() checks it even while
> allocated.
> 
> early_kmem_cache_node_alloc() previously took this object from a
> freelist with an initialized pointer. It now takes it from the slab
> iterator and builds the freelist only for the remaining objects,
> leaving its pointer filled with POISON_INUSE.
> 
> Initialize the bootstrap object's free pointer to NULL.
> 
> Fixes: dc795d4c0282 ("mm/slub: defer freelist construction until after bulk allocation from a new slab")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks for the patch, LGTM!
Reviewed-by: Shengming Hu <hu.shengming@zte.com.cn>

--
With Best Regards,
Shengming

> ---
> QEMU x86_64 and custom QEMU SH7785LCR model, slub_debug=FZPU:
> validation reports "Freepointer corrupt" before the fix, clean after.
> 
>  mm/slub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 54ec125033571..9a20aa820bb0f 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -7777,6 +7777,7 @@ static void early_kmem_cache_node_alloc(int node)
>  
>      n = next_slab_obj(kmem_cache_node, &iter);
>      BUG_ON(!n);
> +    set_freepointer(kmem_cache_node, n, NULL);
>  
>      slab->inuse = 1;
>      build_slab_freelist(kmem_cache_node, slab, &iter);
> -- 
> 2.53.0
