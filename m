Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548BE3F0AB8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081089; cv=none; b=FCt+VEtFci70CE+c4VRWNWnE/Z3Al4ypG8+Q7VDHqlpCjUuvMV/gjXhHcrdEK0hXeK65dmTtGYoX9lHrGFZI8V0ySRJMnguofANUOpwh+hn3gQ6ayatGp6YyEVlEaQEkaa0UgViF5w55nWtT5EuyRzpuzIIPpmGuXU399vmSxJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081089; c=relaxed/simple;
	bh=jeUVrhwd46D+up96et8GFjtNYfnaOkqvhtPcw43aOm8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfepIuMJ1+QrdPbUHJ21KZqEqRhR4YPblM/twfz6So3Pj8SssSwNZ6NC71keUeWvll06cjWW8WVgN6VHP0B30WSlmUF6OIl2a5HuJsY7Wu1Bb3iQqab3hR9P2+yN1wvdnI96nNanBrVOa6jmQvXWzJI/ABkcGI/ck0n8691l4Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIPrdJUT; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIPrdJUT"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so65503466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081086; x=1790685886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2/mloYlrcJ4io0NzgMvmL7ZcyTYG1Hsn6kSPBsACzk=;
        b=hIPrdJUTYGu2ef3IfnpfSbPIrdYrsJ4Syz2aYEWfzCYzsI67ZBp2GVyxxMOxLElMoT
         ZRasCAwJnZVmtpstIZigT/j8AMy9WcCsK7Ylr4IUujqUl/fLVT94m0A4rXM6dX8I6eKU
         1KcSLznIPXaS1V0tzFhFHwZWSIDrPEwxZ47WMyvJ03j+f2bAFuK6ivIrz0eWYR6vUUFy
         sWmTz4DKfWWvGzIwrmHSBlMkN/COOW+lf1xEc9y8SllB7svlkhp86L0X17ywkI7WI3cx
         Cbt7QoaFOsOK3tJk9UEMsJIYrvBuPjnlrujHrD4K0hNezq5+R/4ZhRWg5CoB3nszAd1w
         l2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081086; x=1790685886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2/mloYlrcJ4io0NzgMvmL7ZcyTYG1Hsn6kSPBsACzk=;
        b=PgEoQKS7Q5fYUahhQst3p0Azqk93wMXj9I57fK6xPMN26ksPFx8iU6nSfZw75oQ+i6
         ue2p9NbrUHBytWbjaf/kUzMGGtW+SQreuJ3YrzR160kkEafpDMIZhx/7qHCgI8ZkJS85
         +CWSn1N36x0UFim53cxO1ltOidOJP8jaID67XEPIbBLgiZwVrOX9yw5uK/cBEAQq/Llk
         GoiVPVk6grSDi+Bntr18feD3Tr8V8CFwRWsfj0trK13OxzrO2Wl9lT9uwdIkJDbymMuY
         I4ykjPCO70NFOwf/3F7ZPcXFjVTpJbirKFTajhJYAcfQaSWPUi516jeWvDAx12d76auq
         T/oA==
X-Forwarded-Encrypted: i=1; AKwUvBxaoOdlvWCcMQYqpZRv2wdLJPyFfQoiKEUCsBJzB3qGkk6rIbHgacPFHMSLskcjVwdskxrZ1MgJ1Til9UY=@vger.kernel.org
X-Gm-Message-State: AFuF++l2jmCSEqPqze0mcwf57SMs91ofrzffTy/1wSa9o5uo9Ik3OaV1
	b1GGqo5St/rCXsNZLQ+wNZdw9pbEHrd2sHyzRFnPiNSSwmGUQFC1FOlS
X-Gm-Gg: AYBFou2FLhd1yb2BMLBWwyTThFWrUixzyj2wxhPRFkBnlNFzwuwOViQXpUEu+iXARV6
	jHdBZv1P6EKtjyaBVSFNQLFpaCykuVXjTAX59nDqQeXzJjlVHHprf8JHw6kSBGBBM4TqfRJyfyd
	FaUCb0QHzJYOyNG3gCRZFhc0wjGWy6ZAkF7fSlhf11oMpFov/x2Gnf64lwvWd05vyZwLL4YnT2u
	VKdVk/ehIxUtGRd5qjTMsJTCrsV9TNGFIjyMQOSq5YI4PhhUQeD4CtKnLU4n2gaek3+kZwfTREE
	HpBW+z8bbSdatqyuGTwVQd0LI7Yf4zUQSAbF1E4RslpfzOB016k7l4qm04NY+TJx6s4OlOeDp+r
	CEMPobxUIOCzTyJayckc0+etVMikXfu8WHD2oEaxPN6TglPggAFmQprkSd6BbV6G80qEWTdT4My
	qji2IP/ysyyzvbkR6lGqddUO5c89mAyJKJxfY=
X-Received: by 2002:a17:907:3f24:b0:c29:439b:d5c1 with SMTP id a640c23a62f3a-c2a1585a618mr1167923466b.16.1790081086414;
        Tue, 22 Sep 2026 05:44:46 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c580d2fsm74868466b.26.2026.09.22.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:44:46 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 22 Sep 2026 14:44:44 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v2 2/3] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Message-ID: <arJ4PLGlF7uhNWOs@milan>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-2-73fceb3ed1c8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vmalloc_dump_obj-v2-2-73fceb3ed1c8@linux.dev>

On Mon, Sep 21, 2026 at 09:17:22PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() searches only one vmap node (addr_to_node(addr)),
> but a vmalloc allocation may span multiple vmap zones.  The VA is
> stored in only one node's rb-tree (addr_to_node(va_start)), so an
> object pointer in a different zone than va_start maps to a different
> node and the search misses.  This affects any allocation larger than
> vmap_zone_size (64 KiB) on multi-CPU systems.
> 
> Iterate all vmap nodes using for_each_vmap_node, like find_vmap_area()
> does, but with spin_trylock instead of spin_lock as this function can
> be called from atomic dump contexts (OOM, KASAN, RCU).
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index df42d8a6f058..30c610f678dc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5278,17 +5278,29 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long nr_pages;
>  
>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
> -	vn = addr_to_node(addr);
>  
> -	if (!spin_trylock(&vn->busy.lock))
> -		return false;
> +	/*
> +	 * A vmalloc allocation may span multiple vmap zones, so the
> +	 * node whose rb-tree holds the VA may differ from the node
> +	 * the address maps to.  Search all nodes.  Use trylock as
> +	 * this function can be called from atomic dump contexts.
> +	 */
> +	va = NULL;
> +	for_each_vmap_node(vn) {
> +		if (!spin_trylock(&vn->busy.lock))
> +			continue;
> +
> +		va = __find_vmap_area(addr, &vn->busy.root);
> +		if (va && va->vm)
> +			break;
>  
> -	va = __find_vmap_area(addr, &vn->busy.root);
> -	if (!va || !va->vm) {
>  		spin_unlock(&vn->busy.lock);
> -		return false;
> +		va = NULL;
>  	}
>  
> +	if (!va)
> +		return false;
> +
>  	vm = va->vm;
>  	addr = (unsigned long) vm->addr;
>  	caller = vm->caller;
> 
> -- 
> 2.25.1
> 

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 89c327a6ce7d..3719dc02dcaf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2511,7 +2511,22 @@ static void free_unmap_vmap_area(struct vmap_area *va)
 	free_vmap_area_noflush(va);
 }
 
-struct vmap_area *find_vmap_area(unsigned long addr)
+static inline int next_vmap_node_id(int i)
+{
+	return (i + nr_vmap_nodes - 1) % nr_vmap_nodes;
+}
+
+enum vmap_lock_mode {
+	VMAP_LOCK,
+	VMAP_TRYLOCK,
+};
+
+/*
+ * Add a comment here.
+ */
+static struct vmap_area *
+find_vmap_area_lock(unsigned long addr, struct vmap_node **locked_vn,
+		enum vmap_lock_mode mode)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
@@ -2534,16 +2549,40 @@ struct vmap_area *find_vmap_area(unsigned long addr)
 	 * addr is within 2 or 0 nodes we should do extra work.
 	 */
 	i = j = addr_to_node_id(addr);
+
 	do {
 		vn = &vmap_nodes[i];
 
-		spin_lock(&vn->busy.lock);
+		if (mode == VMAP_LOCK) {
+			spin_lock(&vn->busy.lock);
+		} else {
+			if (!spin_trylock(&vn->busy.lock))
+				continue;
+		}
+
 		va = __find_vmap_area(addr, &vn->busy.root);
+		if (va) {
+			*locked_vn = vn;
+			return va;
+		}
+
 		spin_unlock(&vn->busy.lock);
+	} while ((i = next_vmap_node_id(i)) != j);
 
-		if (va)
-			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
+	*locked_vn = NULL;
+	return NULL;
+}
+
+struct vmap_area *find_vmap_area(unsigned long addr)
+{
+	struct vmap_node *vn;
+	struct vmap_area *va;
+
+	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
+	if (va) {
+		spin_unlock(&vn->busy.lock);
+		return va;
+	}
 
 	return NULL;
 }


and we use the helper in the vmalloc_dump_obj()?

--
Uladzislau Rezki
