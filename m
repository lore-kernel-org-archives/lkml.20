Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200161;
	b=5BhAbI3BrrMqLa+z3POvByvQTJhW8dSvb5SEKzpJQqttSnwIoONcqIn44zNZ3B/37olT
	 nOWUTKGybH4mMOWcG5xEcX70mx31OUkg4cF4MheNCHrbTu2ZJHFZjmzuPtLUX9F8z9wbw
	 81PBo7ZHFKN/i4kpYb3swgrE++TfiI9o8Rg8OOZEUQjU8YcuamuR80IvFIafXcLi71fKE
	 U6PEb0Zt34l2z0ViKZ3SeJ/ApHReNL1aitV18OGCPrNfocKWbswA4Eq3ORta0gA/ZHbIK
	 znTeXiX7X3Xbg09qBv7aFAqE3AvoDjyd1+wHNLvmFBKVnGrXGRHfY2oWd/hVOdJPNbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200161;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4BSzauKWBXzEWh2NOL2cEOkqWKg5lTP3fLJkY7UAIBE=;
	b=liLTTHVaM45ziBgdDT5S51OO3UsOlOhW4vyDYfh2eEGjYdnAbHW6T4VtXk9omj8Nro1N
	 ltQlbl3woR7qjJ81O5lqKXQhfITPHdhtFuQNLprIN5k96nJob4wCz0leMaTOUbrHhffV5
	 o7OnOLhPnzLsqXUxkekbbP8kTir3B4IS7LligZ8BSBzdFJdGAFpteLg/L4LaV4Bpaph2G
	 KiYfzPIB+0ZBwa2Cv98j2N5c2KstnkQnzeOmR4RyvLVDdTKPEg2AsEDgHJQhNWXpfRbjR
	 xUvWJa/ue80ZCaTsIx7vaMe8bEFN/gj4vYl1x/OJTqBw3qprrIVhIJQHSLXiTDlMwtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=jXbCJZ7u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004A606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=jXbCJZ7u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104141F0089F;
	Mon,  9 Nov 2026 04:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794200161;
	bh=4BSzauKWBXzEWh2NOL2cEOkqWKg5lTP3fLJkY7UAIBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jXbCJZ7upjP3ExijCs7FPIurR6qi5cqjHGNPUg/LOiv/YNR7Y9lZVwJcWXViqlN4x
	 /AIe10dfRMt1Hwrj3JgfS4i57TRLfC10PcgYnOIXu0VzkZtbcNbVrPF01TxPDD6eVk
	 YkF/3OkXptbd4KilBEW0pjxC29g9BrCjgRSqw3k0=
Date: Sun, 8 Nov 2026 20:56:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] debugobjects: Fix NULL pointer dereference in
 kmem_alloc_batch()
Message-Id: <20261108205600.3e737ad18ce85b6ce3049309@linux-foundation.org>
In-Reply-To: <20261109041215.11280-2-ekffu200098@gmail.com>
References: <20261109041215.11280-1-ekffu200098@gmail.com>
	<20261109041215.11280-2-ekffu200098@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 13:12:10 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> During boot, debug_objects_replace_static_objects() calls
> kmem_alloc_batch() while obj_cache is still NULL.
> 
> If kmem_cache_zalloc() fails, kmem_alloc_batch() tries to free the
> allocated objects with free_object_list(). But free_object_list()
> always calls kmem_cache_free() with obj_cache, which causes a NULL
> pointer dereference.
> 
> So use the cache passed to kmem_alloc_batch() instead.

Thanks.

We conventionally assume that memory allocations in __init code cannot
fail.  Because if they do fail, something has already gone horribly
wrong with the kernel and it simply isn't viable.  If an unchecked
allocation results in an oops then that's fine - it was inevitable
anyway.


