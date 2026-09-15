Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D78339872
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456586; cv=none; b=b/q1z3OFiYezrp9Z2bi4XJutIPWIzeOpfK1kkpUkpBLsg+HWO9HcXx6AD4YMkmpTLanAKydvud3AXa6x3t2imC29fL469/r7rTALGEdmr2Vw926Zmq6Y3E+kv2rMOhvfMZalRRUT8fDHOlQ5bfN+wj1u9KaxHh8gMNqCQkattYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456586; c=relaxed/simple;
	bh=0OEldKzHhvkbzoc57SjOq6JvGavLCHquBbc6Yq5zze0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBV9EbD6fm3WMnXq4tB/vWS1/gOjGxYgcfQeaJ4Y27QBH6JjA035LH5EoH8/PVcgJDXYoyZO/G9r9jncwlsKxtIsMdPLqonf4DkRKUe66Jq2HKqrlFkYmmX3n8HznnKlyLsZnPPn7E7RNydl+wxm32YLYoNnb9ljTn7n+0tlFFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hq0qtWYa; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hq0qtWYa"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso4559743a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789456580; x=1790061380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W+PRomH3eBPy4oMEKXIP3fH6Wa2h0KkiuNEK9e340p8=;
        b=Hq0qtWYaKxMcGScWSb4W4GIoFRYwCWnxQY6BfK32sxrCGPJj5n7v3iWpw+cyPQ8aN5
         ctafwXNTKj9a/C6qYpMS757///HMhMWlRua7XqWSj2RKvqV1cwHvK9JlDEd1yfDu8Tj0
         y1OutLwvT5+VaDKbBKYT6c3ffZu5Q7n2OvrSvh/onUG9poi83WNfmkgZOzahuVJxO1g/
         5XK+P0xKnCnczTiSkwM3HuEBK2FI3S6tx/RVxSWZj09z6RTG8NqsV1JSN+gJBYH14tIi
         jcO2VHeZhGdpwSiH1CaoMy3zituJFlBeiRQTt3kkLef+nV0l2v3so9A1J4Nly5FWcimj
         UJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456580; x=1790061380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+PRomH3eBPy4oMEKXIP3fH6Wa2h0KkiuNEK9e340p8=;
        b=P6V5LUgrWfzEqE4fp6MDXLCOryJzuzXmACOjVYV7gDph/AWmuzDPBTr0n0705rfUHM
         qdiTHUDdkrQTFCSfnfgK9A8/vWKYtUo4Jwx3FdYpvPFmHkhY07RWnuP9M9UFlvWm4sqY
         BRCzL3sC/YOi+FrfuDOnzsQZy68BqL6g7zq1WdMWlTWzDkeFi5B/h9ZZ39U1pAqSJDKd
         gfArF30EUc/mtSkwjz5U1hKiUDckrM7KE/4/dBIOJAgHGmf/M8IYd9PDmCdvsLVo6ND+
         Jtd2xqxMlZ9lTsLby0vZeZ7c5RihQWhnJsI9UZPurvA8VA3DIvly5OV8Vj33L9Qk88Y4
         U4zg==
X-Forwarded-Encrypted: i=1; AKwUvBymCJGM/FNA4MG88Br5m1iI08l+ApZ+o3SquK07xXGmolb0RCkPVUncnFt/I+HigQk3fRI781tNjQMz8rU=@vger.kernel.org
X-Gm-Message-State: AFuF++kzROxIs1GrGj63feFVb1OebYd2a0+EOJoi06CWtwQ3LZslT/3i
	JRRSsUcElboK9Z6/ULw1G1wXz8928h48RF13b1MH09Ww9njns/q51snWxVD+uez3vQ==
X-Gm-Gg: AYBFou3+sV717Mzz88ey03fGs5zbasGE9k5RlqSo8+CLDCcz/uiqXDWDA6ezyiCUodo
	KOVbzMYVwFq40HuBm9UMaHZZcbJ2pkTiRRLOSp8xeIVN5NXAoZWuwphqd8/u/RnUrqjGfVfnDx9
	ivzKMIoGJi136rPxJFEUJf2WlPw6v3McYJFhm2N2MP3YPKJCEhc2d58guptFz8BtXQHez3OcKQg
	Vhg1mF49A0CU3X+o6zRJ1pQDLFqucixGUS+KOhKIJ1xwTouoD+/rjKQH1yUphm79xFHxOT9YNMU
	lSPwl3Edg6ZKHq7i8Z4ce8afsXqj4rqFHoOIcpVjvCyG9oDDmAkc384JDLB87NWjOf0jiMytiw/
	ABXMQ84wVMdwQmDPfh5JL2HoWiM4fWISH8d3t7eIi8zz1Wuq4piHqDIxbOpUQsu6M4JrsUl+OsI
	dm+g9qSy9q3rRDHwxs0UgZI3EY7sit8+HUHaqC0Holp+eDHE/cAE5eCbXwu4m2Xd16u+GV6hPU5
	SHz0YQauQYGFHbmqYPqDjfctQ62P906jfhLJdEqC4U=
X-Received: by 2002:a05:6402:4617:b0:6a5:f4eb:df3 with SMTP id 4fb4d7f45d1cf-6a9f61e4e87mr7464066a12.2.1789456579785;
        Tue, 15 Sep 2026 00:16:19 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9d0ef7228sm3569166a12.9.2026.09.15.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:18 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:16:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: David Carlier <devnexen@gmail.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ring-buffer: Take cpus_read_lock() when changing the
 subbuf order
Message-ID: <aqjwvznfLPcN1G-J@google.com>
References: <20260914182850.21449-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914182850.21449-1-devnexen@gmail.com>

On Mon, Sep 14, 2026 at 07:28:43PM +0100, David Carlier wrote:
> A CPU coming online during ring_buffer_subbuf_order_set() can be added

nit: a "new" CPU or "A CPU we've never seen before"?

Offlined CPUs aren't removed from ->cpumask.

> to buffer->cpumask after the allocation loop, and the install loop then
> uses its empty new_pages list, corrupting the buffer.
> 
> Take cpus_read_lock() as ring_buffer_resize() does.
> 
> Fixes: f9b94daa542a ("ring-buffer: Set new size of the ring buffer sub page")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  kernel/trace/ring_buffer.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 04bb94c29f58..445931bc9ae0 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7464,6 +7464,12 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
>  	if (psize > RB_WRITE_MASK + 1)
>  		return -EINVAL;
>  
> +	/*
> +	 * Keep CPUs from coming online while changing the order to
> +	 * synchronize with new per CPU buffers being created.
> +	 */

Can we drop this comment? cpus_read_lock is self-explanatory.

> +	guard(cpus_read_lock)();
> +
>  	/* prevent another thread from changing buffer sizes */
>  	guard(mutex)(&buffer->mutex);
>  
> -- 
> 2.55.0
> 

-- 
Vincent
