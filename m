Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773457;
	b=hw1FkRBbLeMkyKo6GLK/vzgqQibxbgwSl0yJeTclPNR1whngCton7BnJhWJLvf3ZsUDv
	 fXUpnl4LQIDu5lG/wzUOk85RCqv0pM01PYqhCDdm3GvGvlXTQmxgfE2fW4tKhCOb6Tt2o
	 oUJoUEqhdft/bCZ5w5SOrp2mxtU7CCDwmpejHSqVOhaaEwdb/kWLIOKA7YdbkZ861DG0a
	 MhZ+ax+mozhK7TBpYPugBNca4F+Fpce7fHIoIwPAC2DMokFLZirK/ea03j9vxbUjNMN5H
	 RFEFzQR5Kd2ycldbiReWum4AVh++5vpOgWphDucDV+hI6n4DfQDcpj6BJFzqjxeN8jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773457;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Q6quEbk1wjADIYDnbmI8RxySF7eMLqCwXbNeK/3QTbQ=;
	b=4DkOslyXa4EpMyT/1cH/AKKjnW3Zk+p+YWTOQjB2o6RQf7C/q6uMtRkfTfx/uv3ToWnL
	 7Y1Uw9LauYNh7jko7NTWvqB1A1ydeg91XRqUu+pdZaA3MnnokK61qUtmxY24PTaiWaWbr
	 I5ta2C3RBZCmDAdK1Z1ke5q3aJIkVTN9MSjYOf+NfCJQ1+HkBS35JfzyLQIHHQ6l8qEVj
	 CX7BJl9xNzrN4Diyssuf9Ujal+fv5Q0X6frm/GfHkeMRS4hqiP84aQB+qWjtH8gVj9x0E
	 X11PGrLzl4ozM7K715qs7e5c8sGfesjG8RVLRpjJSbHESNlxHyF0FjUT3zOg9HnylDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fB5S3V/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABE606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fB5S3V/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458281F01825;
	Fri, 23 Oct 2026 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773457;
	bh=Q6quEbk1wjADIYDnbmI8RxySF7eMLqCwXbNeK/3QTbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fB5S3V/LaS0CaeNTSAaiAwX6QQaGxO+OqMWheFNTKPAvbenke7l17ptFB0A7vQjb2
	 JHvJGb6q3DIEyS/cw6/UVetwp0iUl8hd5HXKpVWv9ECNJNlcHsBYVnzI6Gd4ZtPYE8
	 oOlobM1tBmOifszaS3w7PmFzmoUXQeWZBv+GoYyzSU3L9tu8HGfXFF1u4zlQ/X1QFI
	 /pul3GxhWLCswfRS3qeRhzKZZaau5Vpf6R+DkpWAyaT2Q1yXLZsqVJ16O4jIO33YnM
	 N4xKOh5r1qKFveuMPJoE7khOS1YZ7HWmA4gBGV344J3/484dRvoqbOlF1M6el/vCzv
	 Cz6tzE5ePpetw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Greg Thelen <gthelen@google.com>
Cc: Mike Rapoport <rppt@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Evangelos Petrongonas <epetron@amazon.de>,
  kexec@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kho: check fdt_phys in is_kho_boot()
In-Reply-To: <20261023054518.3258350-1-gthelen@google.com> (Greg Thelen's
	message of "Thu, 22 Oct 2026 22:45:18 -0700")
References: <20261023054518.3258350-1-gthelen@google.com>
Date: Fri, 23 Oct 2026 18:37:33 +0200
Message-ID: <2vxzmrs4fk4y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 22 2026, Greg Thelen wrote:

> During arm64 setup_arch(), efi_init() -> reserve_regions() calls
> is_kho_boot() before arm64_memblock_init() initializes memstart_addr.
> At this point memstart_addr still holds its initial sentinel value (-1).
>
> When booting via kexec with KHO enabled, kho_populate() sets
> kho_in.fdt_phys from the /chosen FDT node. Calling is_kho_boot() ->
> kho_get_fdt() invokes phys_to_virt(kho_in.fdt_phys), which evaluates
> PHYS_OFFSET and triggers VM_BUG_ON(memstart_addr & 1) on arm64 kernels
> built with CONFIG_DEBUG_VM=y:
>
>   kernel BUG at ./arch/arm64/include/asm/memory.h:377!
>   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>   Call trace:
>    is_kho_boot+0x2c/0x38 (P)
>    efi_init+0x94/0xf8
>    setup_arch+0xf0/0x240
>    start_kernel+0x84/0x490
>    __primary_switched+0x88/0x98
>
> Check kho_in.fdt_phys directly in is_kho_boot() instead of calling
> kho_get_fdt() so that early boot callers do not invoke phys_to_virt()
> before the linear map offset is initialized.
>
> Fixes: d6d511639185 ("kexec: introduce is_kho_boot()")
> Assisted-by: Gemini:gemini-3.8-flash
> Signed-off-by: Greg Thelen <gthelen@google.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
