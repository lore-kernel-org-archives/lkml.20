Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30D48A2BF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586448; cv=none; b=Jz/F+Ttzwpykb57GviP/2t6FjLDGUC+xsAF7U0gV8UP5f5XfHYoMWamH1QUqoQT6RPCGFQjSMaDPsd+Oe5xbkU+vqv/PsIKCYPLFZ1o/UQrv9qWKouWzGBaAhq41LyX7fEMgrnSs3lO0Mo184/lfAcnqe8o9RARQ8e3zFtfGneE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586448; c=relaxed/simple;
	bh=jkafQPvENBXIRN4pWLUuazsdW6dxF1NR2ozZZ699IpU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbIqZc9ewYJNkAI2Wgcuh0qRdXuxfndfQ+z4EzjUFBzUBB2uY84n1HJl/640Sc5CHLoZdjmXTd77ErWllYOULsq7oRpoktxxGo7hpLoiHfmRseQzjHp0HO1/VgHWzui0rZtaEIK6TLX56AJU4L8xcHN+zT8idik0Cd9JlzK3khI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5SyCBq2; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5SyCBq2"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2b4138d3deso252040266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586444; x=1791191244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rz4A9u2HwDkmyVBaHthqdE81Vhdpzal2brNiQu6Y4JM=;
        b=R5SyCBq2k8P4zh29OEtgeqGhoEeRTnix+BFk6bwbyHdRan9o6ouipRvoFCumnuRkIS
         9tOi4WCbabSVM3sZK7Unq4QNh/Grv7mA4n3KtWDG3VpFydA7JY7JqGLTV12phtQuHZ6e
         N9J8FvScqKrCVOfw+TLCLp+DAafFDqY5pDJ3Dvpt5h7QHsPZjLtzusYWJxXKbP0PxX7D
         vWBQWSBM6pFzAm9Bqv2GD1015b3dOPJfq0O09xx/YId6D+RyWV5ZdJXgwp4rxoXy8b1M
         fzfAuPoRVmaUAH8BMBVlGZW+2ThsqH889q9WQiJQu8WvQaBBRT5jtKMgGIkuDOt0ndlG
         tYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586444; x=1791191244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rz4A9u2HwDkmyVBaHthqdE81Vhdpzal2brNiQu6Y4JM=;
        b=Dbme6lt8xqVULJViseHMWWvothmzoRa2ZF3VveqM91qm0RLwmuIwCxPzMlixDr2aYg
         Ome6eMQ64qYtv0+hV6bBu2J7zDmknegerFeTIKHVPt4MT509a1+2mZVYgtyZRReja/3k
         LAdbH3kagtxzCIku3Ekwjs4B5ivMJh7qyBUlfQoUtTCjxT3kKR5eWsAr6tbKfS0+KEn1
         Yr5rhbXKPjdOKWA5G0dvb5kV8QYoMCSzVUjWn7QXJqBG35y1F8UkA3zpHs1zHQfVH11q
         FkFd0LkFjifZ49RPE9Kv7FEqSZqcV/sDs4w9TKej8G8Sp0w50EObbWE18oe3aQptH4HT
         d3qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL5F7ER0knVhKcINoor9wvE54vq5oMDcwWMODn7VA20XX85fwMusGod8ZdNaoiZWT/EZyYwENf5NuXhHk=@vger.kernel.org
X-Gm-Message-State: AFuF++lbOH8bNOwHuQdh2ZhUQreF7h50rUGEeK9YtxZH/tFYcf7vgeCH
	9S6LBR1vpS76HO6btaoaA9kEQBvX+y1DemXjrbfybkNR0lBDNen/wJj5
X-Gm-Gg: AYBFou0tYoMhdUpRtZIiqWB748Xeup1EkwyYcyh44ntG85reejJN9VoaRCBfc7eA+b/
	SEFKMQww2UvadSVuq2bmU959qbx5KJ8Fkodq27cw1wzS/Ou5CDY+CbUW26Jy5FfJWlLSFVo3Bpr
	drhcRutRypk+bkIhGFv6bufrMSo7NBDIL3gyFZEh54av+F3k9yE59Q1MD/tEa7iL4OKiL1Zj5D7
	nH1yPIhLSfLQk/DOnna5JF3q56EA2GH/SpVSZLfwPIoHBIu1ZwNTAK/U0XXYbkHnMxSTPt51i+b
	t2jH89wVapjRUA0stpqvJnK0nrQqhhQEOVN7x4kePh+bEiU51s2JBFrfXYZ3bqe4wZQTSfH8nJH
	PzrZN9poR159n9EDgKzFM8uUCInGB0dPmaLAj6SnoWTBHrCwUEZNhepKfW0lNQT3pnM6Yt+9h1s
	0tV3npNI1tV5IpcJCl+K/AnSAF3KETlhxYbdI=
X-Received: by 2002:a17:907:6091:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c2ac23d6040mr1043044966b.20.1790586443621;
        Mon, 28 Sep 2026 02:07:23 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757ac8dsm438371866b.25.2026.09.28.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:07:23 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 28 Sep 2026 11:07:21 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v4 0/2] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Message-ID: <arouSec6y9oVau10@milan>
References: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>

On Mon, Sep 28, 2026 at 04:15:53PM +0800, Ye Liu wrote:
> vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
> allocations.
> 
>   1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
>      and outside the VA lookup range.
> 
>   2. The function searches only one vmap node, but allocations
>      larger than 64 KiB may span multiple vmap zones whose VA
>      is stored in a different node's rb-tree.
> 
> Patch 1 fixes the alignment, patch 2 fixes the cross-zone search.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
> Changes in v4:
> - Patch2: Simplify find_vmap_area() to return va directly.
> - Patch2: Simplify locked_vn initialization in find_vmap_area_lock().
> - Link to v3: https://lore.kernel.org/r/20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev
> 
> Changes in v3:
> - Patch3 drop.
> - Patch2 Extract find_vmap_area_lock as a helper to simplify the code.
> - Link to v2: https://lore.kernel.org/r/20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev
> 
> Changes in v2:
> - Use is_vmalloc_or_module_addr() instead of is_vmalloc_addr() to
>   avoid filtering module/BPF/execmem addresses. (sashiko-bot)
> - Link to v1: https://lore.kernel.org/r/20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev
> 
> ---
> Ye Liu (2):
>       mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
>       mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup
> 
Both look good to me.

Thank you.

--
Uladzislau Rezki
