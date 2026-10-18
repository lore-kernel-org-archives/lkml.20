Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C77345EAE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314609; cv=none; b=SgTcwve9mR+aoQI+jnbsYYJbo5P9NjF/4L2YQX1zNh24e8Tfd3Z5xbtoEA2sa4K3XSvQos7uUWsRsnU2JC5OxQe0OVI8EmalqflHMXXA6fZe9cePWT+yzFjWixYvtPRbPt4j+Yu2oeYsq7im/yn4zmDoU8+81MusWcPQkSEZjX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314609; c=relaxed/simple;
	bh=wvi9L5Qe/FbkTNThk7axxXV5FRLCREpGqCv/pxRK53A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrFZLKS7D6dpoXPY4W7YzXtq+olCr0505qX145FFzWrN3PusqaOlfIa8CEe5w7n4pJNqa5kEthbLmNC4FkRX9PyoV2mzyHqv3wWpnF6HJAdoP3xNRDn7O2TffcUi9bFc/uSNBxiP2Nn6zSUU0MlczyCJcsSxuelenXt1vVTwMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgVDamO3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgVDamO3"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso183422266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792314606; x=1792919406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X96Dw2kONVYl3pYurol2SUKv+j8HTJxgA5k41JeZl3E=;
        b=dgVDamO3oMLTxzrvF3XYuMBfec3RVQRbB45JYkoO0F/GHNZ1Kvuq5q628c7vApaHCT
         2fLDzU5OzQAJg12CAV2P4lBIpDc9W95fCsQUgG8hMKk1r6E0wDMP0I6ngh8sd+wXxJfl
         KaEXPf2EyJrbq+SsecbdPFgouBFeSCvgRdeWKnW/UxXkMhqIoZmtd2UEXheWhhl3gm0V
         u4NzaMd12bOjG0l3dSX3jDOlhauurKlEM0eoz1oYfYuU70c7cBuV6SNljzHRJXY6uQjD
         YWyDOkCljfX2pWGcgyvvrz20KsuENgua9P28Wnx4xxhe4DTgzmTu73FqzC+y0koHqy1Q
         japw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314606; x=1792919406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X96Dw2kONVYl3pYurol2SUKv+j8HTJxgA5k41JeZl3E=;
        b=hiKTZ8wNoqBkt9910k8TQi6KGy/v37ViU2Df2bNumoPShxlcJgmiEMNY3xP6wwSKKf
         8TKITUXX2zGpiW253ZiG2V+eI57M+1VORJv1QjLUUmlotf1xluarCUnKj2ZpeWVXaMnV
         2PrbLQNvs4sZRqjUzLu1zaGIOH8OdPsjNcTwxrPm/T4t5Ttc4XAbk3upza6QZ77qUBq3
         BKpVKKUi84tUKwj12irdsphAMcpG1ZlNmtg5gqcI8Qi4/BpnZbm4/wa2F/tSK7R5vD7T
         fqGX8+RwZmHiJPUksV+h78WshbIuSHhoizQKQOyVas87Rs0SOyzU7+46Zx7Hwcy3DaoY
         sMaQ==
X-Forwarded-Encrypted: i=1; AKwUvByJt2mcRbjf7KeOgqi1P5hYipNFFv3S6QjXsazw9EcKPaM4YZmynb6Fc+grJwNqCUExT0CyOjjyDqHCuxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1VeNxmMitjaQk1OWXley4aMjEAnWKBvP5A+EhJ4MB1+d+Rjnp
	18fbP/7+jerE29hgXo1bO22BU7Beg5SNg6itaC1rhHo6KieeVMiNUa4a
X-Gm-Gg: AYBFou1aY8/gSGz7Qix6NTFqSzqgn7Ki3DQfvzw8ctSkRrXHgkERH+BDZDht8t8lTaF
	RvTUECBBGx9vuQq+FIKygfOeCEj8tdn62NozaNtRVYst9IZ59qUo9T9RB63GxwEHP8AW24ci52t
	bfrsNbFG0/80qni2kyP4GCrh0A9wU1esMm8pmkkZZUzJMk2FOY57MWHsh0/yudxmqwD6lZZ7a5t
	3eO4imunOQTFkcYzHqaw6qRhg0t9HDnh2nKy2zMu/rj04EJ66Z2SiX/PvUtiav+pGB6HfFIhPFQ
	2oMpjea7pX1EmgexChJ7nJgLJsmtXM9ND1sVxE8rMJdls6+yvnKgs/qpO4iflGK5rUV+2A71oic
	0PFqTvdLVQGo1iJTkN4q9TuYTj+NzAD4jmPBBVesgQ9Ql4+1C4tyATzdzrG2Mp1LBHFO67Hevw2
	5B7sr1DdWGOAgKfQ+L3NxsgW8lcM4Aa3Gm7y8=
X-Received: by 2002:a17:907:1ca2:b0:c2a:f439:f028 with SMTP id a640c23a62f3a-c419e639ffbmr342064366b.24.1792314606094;
        Sun, 18 Oct 2026 02:10:06 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42a3f4eaa0sm88973966b.0.2026.10.18.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 02:10:05 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 18 Oct 2026 11:10:03 +0200
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vmalloc: read vm_map_ram block regions from the
 requested offset
Message-ID: <atSM69faDNgmLNVJ@milan>
References: <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
 <20261017231325.796986-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017231325.796986-1-nickolai@csail.mit.edu>

On Sat, Oct 17, 2026 at 07:13:25PM -0400, Nickolai Zeldovich wrote:
> Reading a vm_map_ram() mapping through /proc/kcore returns the wrong
> memory for every page except the first page of the first used region in
> its vmap block.  read_kcore_iter() calls vread_iter() one page at a
> time, so a root user reading a live system with drgn, crash or gdb gets
> that first page in place of every later page of the mapping, and in
> place of the zeroes of the unused pages after it.  This affects every
> vm_map_ram() mapping that fits in a vmap block (up to BITS_PER_LONG
> pages): erofs and f2fs decompression buffers, videobuf2 vmalloc/dma-sg
> buffers, udmabuf vmaps, fuse readdir pages.  Kernels since v6.3 are
> affected.
> 
> vmap_ram_vread_iter() walks the used regions of the block and, for each
> region, zero-fills up to its start and then copies from
> start + offset_in_page(addr).  A read starting in a later page of a
> region therefore copies the region's first page, and a read starting
> past the end of a region still copies from that region.
> 
> Skip regions that end at or before addr, and copy from addr itself,
> i.e. use addr - start as the offset into the region.  The region is
> re - rs pages long, not re - rs + 1: for_each_set_bitrange() returns
> [rs, re) with re the first clear bit.  The extra page is one whose
> used_map bit is clear, and vb_free() clears the bits before it unmaps
> the pages, so a read racing with vm_unmap_ram() copied the page being
> freed instead of zero-filling it.
> 
> Tested on x86_64 by queueing a 29-page V4L2_MEMORY_USERPTR buffer on a
> vivid capture device, which videobuf2-vmalloc maps with vm_map_ram(),
> page i starting with "userptr page i", and reading every page of its
> vmap block through /proc/kcore.  Before, all 1024 pages of the block
> read as page 0.  After, pages 0..28 read back in order and the rest of
> the block carries no tag.  With a second buffer in the same block and a
> 100-page buffer outside the block path, reads at unaligned offsets,
> across page and region boundaries, into and within the unused part of
> the block, and of the whole block return the true contents.  With an
> msleep() inserted between the bitmap_clear() and the
> vunmap_range_noflush() of vb_free(), a read of a one-page buffer being
> unmapped between two mapped ones returns zeroes.
> 
> Fixes: 06c8994626d1 ("mm/vmalloc.c: allow vread() to read out vm_map_ram areas")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>     Changes in v2:
>       - region length is (re - rs) pages, not (re - rs + 1); suggested by
>         Andrew Morton.  The extra page was shown with an msleep() added to
>         vb_free() between its bitmap_clear() and its vunmap_range_noflush():
>         a one-page buffer being unmapped between two mapped ones then read
>         back its own bytes through /proc/kcore with v1 and zeroes with v2.
>     
>     Reproducer (CONFIG_PROC_KCORE=y, CONFIG_VIDEO_VIVID=y or =m, root):
>     
>       /* short.c: argv[1] = vivid capture node */
>       #include <elf.h>
>       #include <fcntl.h>
>       #include <linux/videodev2.h>
>       #include <stdio.h>
>       #include <string.h>
>       #include <sys/ioctl.h>
>       #include <sys/mman.h>
>       #include <unistd.h>
>     
>       int main(int argc, char **argv)
>       {
>       	struct v4l2_format fmt = { .type = V4L2_BUF_TYPE_VIDEO_CAPTURE };
>       	struct v4l2_requestbuffers req = { .count = 1,
>       		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE, .memory = V4L2_MEMORY_USERPTR };
>       	struct v4l2_buffer b = { .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
>       		.memory = V4L2_MEMORY_USERPTR };
>       	static Elf64_Phdr ph[64];
>       	static char buf[4096], line[256];
>       	unsigned long lo, hi, a;
>       	int fd = open(argc > 1 ? argv[1] : "/dev/video0", O_RDWR);
>       	int kc = open("/proc/kcore", O_RDONLY), i, n, np, c;
>       	Elf64_Ehdr eh;
>       	FILE *f;
>       	char *p;
>     
>       	ioctl(fd, VIDIOC_G_FMT, &fmt);
>       	fmt.fmt.pix.width = 320;
>       	fmt.fmt.pix.height = 180;
>       	ioctl(fd, VIDIOC_S_FMT, &fmt);
>       	np = (fmt.fmt.pix.sizeimage + 4095) / 4096;	/* 29 for YUYV */
>       	p = mmap(NULL, np * 4096, PROT_READ | PROT_WRITE,
>       		 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>       	for (i = 0; i < np; i++)
>       		sprintf(p + i * 4096, "userptr page %d", i);
>       	b.m.userptr = (unsigned long)p;
>       	b.length = np * 4096;
>       	if (ioctl(fd, VIDIOC_REQBUFS, &req) || ioctl(fd, VIDIOC_QBUF, &b))
>       		return perror("QBUF"), 1;	/* buffer now vm_map_ram()ed */
>     
>       	f = fopen("/proc/sys/kernel/kptr_restrict", "w");	/* raw %pK */
>       	fputs("1", f);
>       	fclose(f);
>       	if (pread(kc, &eh, sizeof(eh), 0) != sizeof(eh) || eh.e_phnum > 64 ||
>       	    pread(kc, ph, eh.e_phnum * sizeof(*ph), eh.e_phoff) < 0)
>       		return perror("/proc/kcore"), 1;
>       	f = fopen("/proc/vmallocinfo", "r");
>       	while (fgets(line, sizeof(line), f)) {
>       		if (!strstr(line, "vm_map_ram") ||
>       		    sscanf(line, "0x%lx-0x%lx", &lo, &hi) != 2)
>       			continue;
>       		printf("%lx:", lo);
>       		for (c = 0, a = lo; a < hi; a += 4096)
>       			for (i = 0; i < eh.e_phnum; i++)
>       				if (ph[i].p_type == PT_LOAD && a >= ph[i].p_vaddr &&
>       				    a < ph[i].p_vaddr + ph[i].p_memsz &&
>       				    pread(kc, buf, 4096, ph[i].p_offset +
>       					  a - ph[i].p_vaddr) == 4096 &&
>       				    sscanf(buf, "userptr page %d", &n) == 1 &&
>       				    c++ < 32)
>       					printf(" %d", n);
>       		printf("%s (%d pages carry a tag)\n", c > 32 ? " ..." : "", c);
>       	}
>       	return 0;
>       }
>     
>       $ gcc -static -o short short.c
>       # modprobe vivid; ./short /dev/videoN     # N = vivid capture node
>     
>     Before:
>       ff32776280800000: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ... (1024 pages carry a tag)
>     After:
>       ff636d6c00800000: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 (29 pages carry a tag)
> 
>  mm/vmalloc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bea9f76ed7e7..643299c9ca15 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4588,7 +4588,7 @@ static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
>  	struct xarray *xa;
>  	unsigned long offset;
>  	unsigned int rs, re;
> -	size_t remains, n;
> +	size_t remains, n, size;
>  
>  	/*
>  	 * If it's area created by vm_map_ram() interface directly, but
> @@ -4622,6 +4622,10 @@ static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
>  			goto finished;
>  
>  		start = vmap_block_vaddr(vb->va->va_start, rs);
> +		size = (re - rs) << PAGE_SHIFT;
> +
> +		if (addr >= start + size)
> +			continue;
>  
>  		if (addr < start) {
>  			size_t to_zero = min_t(size_t, start - addr, remains);
> @@ -4635,8 +4639,8 @@ static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
>  		}
>  
>  		/*it could start reading from the middle of used region*/
> -		offset = offset_in_page(addr);
> -		n = ((re - rs + 1) << PAGE_SHIFT) - offset;
> +		offset = addr - start;
> +		n = size - offset;
>  		if (n > remains)
>  			n = remains;
>  
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> -- 
> 2.53.0
> 
IMO, it should be improved by dropping more and make the code more
cleaner. For example offset. Basically what we need here is to
have a payload start address and its end.

The addr is within that range(skip if addr >= end), so we have
a clear picture what we need to read.

how much to read is: end - addr, read starts from addr.

--
Uladzislau Rezki
