Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BFD4A35
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331891; cv=none; b=V/0kddm9f1N0RQpU5IIEYkxsxOMD75O0j8RNSpWBrv439+Z9awIUEpCTFBWbmFoBf09Ou1qG2fUM/2FToEuX1oMAGv/M9IAuhVD9N88l/IFxS2iNsDbPDjYBDY2O8w7atexA4XoAezhFv3brjV5sNKx4dAwACOhCzUiLpaRKTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331891; c=relaxed/simple;
	bh=arqCZb3KmT7ttTW7K7kjMhnyYTxyy2jZlEgDTxtoBfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuBc2CchwyPUF/biS4oAujSqviPCSLkvS+rGv6wb2zQXa/YfShLv9/liz79GKTIWgi7Hl8HnYYI25XaDXydZ0ADLXOZl2VmHor3DwyODhcC+l2j4SffUfYNdRaqGM2A9dMbZ22cIBpfZc+ytIbM9iK+ejRBkMOfUJoBA8k32MvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i4xu/CBM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i4xu/CBM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so11039265e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789331887; x=1789936687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZQDT499tvRU+RaO06zRbDjSc9tK0xny57+LuUc51kQ=;
        b=i4xu/CBMZXcAgOCx9dH6qehkM8x1CYttaCVfl9wwZliVMLfYW9utZ+QO3oI4WG2LIH
         kI3WBzCRCPTvh+HNy/L2tyAEritGHWEgYfhe9xJrQehB6XtWPPpnsQCbkdD/oW5V2qII
         3Lhp9+DeY1FpO1CmyjZgWHobY8LZMbSK76WzBVl+ScFXHNQRofBq4qPynP0+P2XpbVm4
         l8s6hPr5YT/8YRXMIjfm0G5iWa3aX/o/H4miKfYccGqde3N8KIVOW20aXcxnxn3ADJz5
         Ob+sxBNs/s8rS5rmESLLSAPrliNUl5miVaZfPQ5pWC1tOiJ5WRsOrikz7PVAUdMd1ize
         AGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331887; x=1789936687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZQDT499tvRU+RaO06zRbDjSc9tK0xny57+LuUc51kQ=;
        b=ftUzrjWRTu3yVzIUTmwibkD1qr5cEgXgqyzYpufwiTbfiOHen9O41dSQkz25Rzi5qk
         CVI2TPOZ1moHqe1ToeMzVKcHkKywAeAgU3D9pP/pCKL+cBVikRmvqWb1ajNK5xQNy+C6
         rzV7FqS8oo6M7vAk38ZsMWZMZILFTmSTt3n87K9TXHeKzGYJX23GpA+fNKWVXQ7G4HSN
         vtu5yC+LabxTy1VFdoohOCjax1IeXOeXqe5EN1C3grJbV6oFmbl1Qp8AKfVYWByf0b7r
         x654DTaMKXUqfjE6/6EX30uoUikrP+qypGK9D3paP9WBoZ3PPa086+nN/ewVP5eZ6jlS
         G65w==
X-Forwarded-Encrypted: i=1; AKwUvBzMduI7P+S76Cy1sXMwr2/u37kiLDF4n5hpkwvJYKHnyckRfRG7CJ8cY5pxfKSyRcYb89N2L0L6bdWY2qU=@vger.kernel.org
X-Gm-Message-State: AFuF++ly+w5fWXrzMUj8Z7/vYGyhtrURQZyWHWFxG2ukwCdDCg+aLDj7
	UPiCxrpir9mlvZE5HTXaYN7RdwBx1Senitmk5vXeWCuEp8WQYEjslraPUIoM0v/zEg==
X-Gm-Gg: AYBFou3VZXunLpvS/7iteCqGLcdYzG//ssJ2Fcjm4HU2jvoTvTCtCRlKSdWH4lXIWxs
	ZdVf+slDOpNEwsLxwf6SzRIMfP3CUGs5n1xtt0JZBKKWTzSspePf+SlrwIpp84lT7644PKQIRwU
	9pY8zbd03wbLsUEzBueVWST+E8+mLeDYmlZIeyA3/GnJFcwCsp3f01MUdU01c8bk6mvaSZGgszF
	2+90Ot6zoodxSYFM1jj3GtH1fnoEzenyd1VEgpSX1X6u91Ij6zpCF9kZYWY1fawaFt6yRiGCi5C
	zisMZOgmKW7IcPxDrifMd34ExtOjGB1SV+8EFONHC890q9L4BRJoH/lGcA36iOeTH9MJ/qUzWMv
	s/nYL7izCcvG7k+0g0AJXbYsD24kMF7vZzs2G5aeMWTr0Mguv3mnWDlnShPhoLaimYCtCO92I4J
	IxHO7/H7x9olxf/7Pa+de+pMqlV6S0iEbqZoXNf1rvaAK+vd9vU4Ku4QN1fb5OI+EiEsnxs3C0Z
	iXk8rv5ErknySKuT4F1tX4FYzr/D6dmuVW/nu68M5Y=
X-Received: by 2002:a05:600c:3148:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49e6cbfc241mr82363315e9.21.1789331887136;
        Sun, 13 Sep 2026 13:38:07 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60946249sm282307525e9.0.2026.09.13.13.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:38:06 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:38:03 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: David Carlier <devnexen@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ring-buffer: Check resize_disabled before publishing the
 new subbuf order
Message-ID: <aqcJq1-R-LaK9uBi@google.com>
References: <20260912103938.1127021-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912103938.1127021-1-devnexen@gmail.com>

On Sat, Sep 12, 2026 at 11:39:38AM +0100, David Carlier wrote:
> ring_buffer_subbuf_order_set() stores the new order and only then walks
> the CPUs, returning -EBUSY if any of them has resizing disabled. A user
> mapped buffer has resizing disabled, and __rb_map_vma() reads
> buffer->subbuf_order without buffer->mutex, so an mmap of an already
> mapped CPU racing the failing order change sizes the mapping with the
> new order and inserts pages past the sub-buffer into the VMA.
> 
> Check the CPUs before storing the new order.
> 
> Fixes: 117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  kernel/trace/ring_buffer.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 9c03a555a6ba..d7e5e4620d09 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7474,6 +7474,14 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
>  
>  	old_capacity = rb_subbuf_capacity(buffer);
>  
> +	/* The mmap fast path reads subbuf_order without buffer->mutex. */
> +	for_each_buffer_cpu(buffer, cpu) {
> +		if (!cpumask_test_cpu(cpu, buffer->cpumask))
> +			continue;
> +		if (atomic_read(&buffer->buffers[cpu]->resize_disabled))
> +			return -EBUSY;
> +	}
> +
>  	atomic_inc(&buffer->record_disabled);
>  
>  	/* Make sure all commits have finished */
> -- 
> 2.55.0
>

I do not think this is correct.

__rb_map_vma() reads subbuf_order without the the buffer lock __only__ if it is
already ->user_mapped, which means it has already the resized disabled.

During the first setup, it takes buffer->mutex.

-- 
Vincent
