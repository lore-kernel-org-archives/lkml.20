Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577326;
	b=Zkgpjx4sl/xkFpHUQqxU5MYNhtVoiWXHm49Vq8JO4ly+r+WFKj21I2XGJbNJhsAmJ5hJ
	 GgQtA+z9W/+aUXCUPQB2IoFsFqIe2BaYPrfWlLV3IKYbsOqxcBY7glOnCIWkHG28qtPJf
	 VeND9PIjXGrV7bXetTrMhUVD/Yh3iPk6GUm4FGtBJbPjsAaADXxAN+tDEoGPfGs9GB3Eq
	 e75YLRGSUcc3d5DunMc//MQM99w2XPKztloTdLbjcHPHU+QPCU2Iuy7pFXVFb+SFvI/6C
	 lldXi3iu02bZBpqYVxp2+9x9Lm66lYDaLcN44mHIl1gD7STA9ePJ9+XSHlp1hz0+2Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oyo60OYFmXZXL90Hj9PED7vL+lEsAHp4eJo0r71AKr0=;
	b=KLuBaauob04kbJ00c/udMYIQj57xvqN5b1X4dJPxIKoidXlqNhSoOavSPoBuXM7pc/IF
	 Rub9A7Q55tPdoTGq2ofilibOqMttk3QDSmCkmpUNLwCrDlrOYQen3iEzNt6baGnnGr11e
	 Mev9vq52IOU8Y8DoPLEWWtXzB+HAbhgwFMzkp+Bg4NUhaTi4yo3Rl10hkhBsDaMWNIAdg
	 2L2TzSnltrz+zVlQLdcR5nNI5VGIJdkpIrkQR9n8qRPj0enlayIrDilCojGXZnOejjgqS
	 mIKlqBPNmMI24nB28SQmV08pjHn1pzFOiOhcLa3dQV/6XvpgIboXa+e/goaFzzusnzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOa7II5d;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE1E606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE1E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOa7II5d
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4b769975b2bso3036565e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794577324; x=1795182124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oyo60OYFmXZXL90Hj9PED7vL+lEsAHp4eJo0r71AKr0=;
        b=NOa7II5damg6gQvNRjgE78WmIN2diCb07p+4JQhSAQpeelhU254cT8Cg7lZwAoOHub
         yQx0d1fIlpvSzAOvYg7JdfGwDSiZ/LCWFS07eTFAVFgEX7gwi6v3wjlTxOKX5mqeFGXF
         xp9IexDPibcPdmuahYmGRp1u1J+tnlYWLwpUylUkLyrv8EnpmM6u+6srdvTFBcmPYzRP
         0sr4jNLy+904Z6u4M0d48h1Obfw7kNNPiJwwGYleDa84Zw6BSucsqxxZOq6PiPQgO6QA
         BMswkMDWID4In8qLb3w0o1z8T8jZk7ZkSl0UFNSKdOr2lK5dWwodhpn3wHN6OlJL+oKF
         Utyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577324; x=1795182124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oyo60OYFmXZXL90Hj9PED7vL+lEsAHp4eJo0r71AKr0=;
        b=2bWxh+7DbVDC55TfMakd3HASm0o0c9ylWXU5TrzeGIWJkzRl7rwTkEi2RT0xzm7BFf
         441yv8K7TMoXv4cGcjlE9O/z01xZS2RnNEWaVvfmBrlFb7iUvWsegJj7sekXpotAQrLE
         9N3uzQSMiEVXIksNQdYxc0SjMPDGJsxX8LjzRwN8bVJJUFQ6ffxD6gc7Vm8AXIShq0nC
         SVDWngxtCoC94djNrUE5lZjc8FT9AVHHL0JdmfWQeODjLKwAoauXKul3poUoXMppmwQP
         5LJdad5vDy94m5jLzro3T+SDclps0ol5st6O7RxwomOcKZEzT9buntida28kCq68RbbU
         Jqdg==
X-Forwarded-Encrypted: i=1; AL+hErHA7doml/z09/cqDBGau/S6fE0hie5vap8SCJUbxPF3wEg9NKFiqIVe2Ww88V4dUcbOGHGCwAlnsgpc+W0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ow3i6wDhBvxrm8ZIuS/Ch5frmTvvyzK+MW2KS7OzaCEwyIFOX
	Jql7fa2YAmPX3yIHxua/rlS3yfo0ZC5lFRh3gIuTu3Oy3/FT1oLZMRNE
X-Gm-Gg: AYBFou1ZfjJQwKj5/qE4Yx84Uoz4jsO2y05kDck6DRLcppzlQtna3gN7c/L0t9nyVuD
	KHr9cE6lnWvY7hKeLhg+4JYlltc37YBfgyhc8jIfZPBLfocK8unL/gidOXQ9heELKJ4Zyml1/RT
	dj1xmRuX88lxMu0dcw1HU/wZmnfJIuEv60vjeGl8lc3rtNddz2d7YidaY967nak2r0UTqpdEe4F
	BQofMDGdG7m/Fcmwtpc2+VGfNNwWhcdYiqoShgoz0CZbDb33+CEIRE1w1OAdJ3nKeDEwdfw93Cr
	XgdSEKGsy8PETuzcYF7R4JTBjCIQjamkLndqyodsXtCF2RE94HgANbEOuppSEx0+7UJAagnZKPk
	DOqQU6k9qfJzTA34sKi+E4A2z2wxruEvAE5aHDdZ4Bm/Vpw0/dvnFtNcoVcD8ARZXbewbk10sZP
	nmh1h+fOsogxE5zk5QaxplM59luHDzDChEtj+R3PuLb9eCEs9qxDWJ/SEyVSE1PfEc7mtG6Ukf0
	XcijNfOJ55JE57aruosVJlLlkxCnbXuR1BRN8Sik3V2CvUkOi8GSuFRpCs5vNdegIfkWPYB3cby
	zHtBaTtMeju86qRGzIqae5TYZoBPKUo7Hd3UT8XZmE6KuA3SL6zahGxz1b4=
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr52996795e9.13.1794577323783;
        Fri, 13 Nov 2026 05:42:03 -0800 (PST)
Received: from [192.168.100.182] ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5085715f8f.21.2026.11.13.05.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:42:02 -0800 (PST)
Message-ID: <5ccd1e39-94f0-4e02-87d2-aae8985d1b12@gmail.com>
Date: Fri, 13 Nov 2026 18:41:58 +0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Add KASAN shadow mapping to flush_cache_vmap()
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Muchun Song <muchun.song@linux.dev>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261102134422.610837-1-alitariq45892@gmail.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <20261102134422.610837-1-alitariq45892@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Gentle ping on this fix. Muchun has acked it. It fixes a boot crash on
riscv KASAN kernels (2 of 30 boots on Orange Pi RV2). Could it go in 
through the riscv fixes branch?

Thanks,
Ali Tariq

On 11/2/26 6:44 PM, Ali Tariq wrote:
> flush_cache_vmap() sets a per-CPU flag, and a kernel page fault
> that finds the flag set gets an sfence.vma and a retry.
> flush_cache_vmap() only sets the flag for vmalloc, module and vmemmap
> ranges. kasan_populate_vmalloc() maps new shadow pages and calls
> flush_cache_vmap() on the shadow range, so no flag gets set.
> For vmap()-style areas, kasan_unpoison_vmalloc() writes
> the new shadow right away. If the CPU hasn’t seen the new entry yet,
> the store faults, and since there is no flag set, the kernel crashes.
> 
> [    0.675216] Unable to handle kernel paging request at virtual address fffffff7c009a000
> Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x0000000004504000
> [fffffff7c009a000] pgd=000000009ff6e001, p4d=000000009ff6e001, pud=000000009ff6e001, pmd=00000000400e7401, pte=00000000403cb0e7
> status: 0000000200000120 badaddr: fffffff7c009a000 cause: 000000000000000f
> __memset+0x60/0xfe
> kasan_unpoison+0x26/0x4e
> __kasan_unpoison_vmalloc+0x20/0x2e
> __get_vm_area_node+0x1c6/0x276
> get_vm_area_caller+0x52/0x84
> vmap+0xf0/0x264
> dma_common_contiguous_remap+0xa0/0xd0
> atomic_pool_expand+0xb6/0x310
> __dma_atomic_pool_init.isra.0+0xf6/0x1c0
> dma_atomic_pool_init+0xf6/0x1aa
> do_one_initcall+0x134/0x928
> kernel_init_freeable+0x532/0x60a
> kernel_init+0x28/0x162
> ret_from_fork_kernel+0x82/0x94c
> ret_from_fork_kernel_asm+0x16/0x18
> 
> The PTE is valid, so the mapping was in place when the CPU faulted.
> 
> Tested on Orange Pi RV2: without this patch 2 of 30 boots crashed,
> with it 50 of 50 booted.
> 
> Add the KASAN shadow region to the ranges for which flush_cache_vmap()
> calls mark_new_valid_map(), as commit 4edd70ee6a7d ("mm/sparse-vmemmap:
> flush_cache_vmap() after hotplugging vmemmap") did for vmemmap.
> 
> Fixes: 503638e0babf ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
> Crash Log: https://kernelci.cloud-v.co/scheduler/job/541
> ---
>   arch/riscv/include/asm/cacheflush.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index c2b0a2928f06..c95b2f6007fd 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,6 +8,8 @@
>   
>   #include <linux/mm.h>
>   
> +#include <asm/kasan.h>
> +
>   static inline void local_flush_icache_all(void)
>   {
>   	asm volatile ("fence.i" ::: "memory");
> @@ -57,7 +59,9 @@ static inline void mark_new_valid_map(void)
>   static inline void flush_cache_vmap(unsigned long start, unsigned long end)
>   {
>   	if (is_vmalloc_or_module_addr((void *)start) ||
> -	    (start >= VMEMMAP_START && end <= VMEMMAP_END))
> +	    (start >= VMEMMAP_START && end <= VMEMMAP_END) ||
> +	    (IS_ENABLED(CONFIG_KASAN) &&
> +	     start >= KASAN_SHADOW_START && end <= KASAN_SHADOW_END))
>   		mark_new_valid_map();
>   }
>   #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)

