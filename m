Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B7637C109
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792278814; cv=none; b=pacljPCXu8a5AnM1Voz1sY193vvFTJ4zp373EAH/Z5NzxCHJ8X8oWA81virdxE3n2eZdCjopQ8mGrV8cwgcZqMxX/2OqlZIRpq2HYEiRZTI+GK9z2L6/yWqOtNHXBLEThVo/vuG/UdWq+NqSpUKmpUIm/XWm8Xz2aUpBLvoK2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792278814; c=relaxed/simple;
	bh=zU0+UFHVhDrQe+w83tYZ0i4aFeokOFS/sQOCoIEsOBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ST0habSmiL+ROGBbNSQclOHiReSEFgiPEVXwZSXTVsUCFHcb868Ij5EBRFOFYLCk95p5C0QCzzIwIsUfzvYl72bGT8XlRr1JJJ/SqIrwZHf7JSNurbgH/R5mie8PgeyecG0O4kLcjzSHCYZg10Z9/Rz5uisGVRzWIwp967KFPYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIDaf-003kaO-P9;
	Sat, 17 Oct 2026 19:13:25 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Baoquan He <baoquan.he@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] mm/vmalloc: read vm_map_ram block regions from the requested offset
Date: Sat, 17 Oct 2026 19:13:25 -0400
Message-ID: <20261017231325.796986-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
References: <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading a vm_map_ram() mapping through /proc/kcore returns the wrong
memory for every page except the first page of the first used region in
its vmap block.  read_kcore_iter() calls vread_iter() one page at a
time, so a root user reading a live system with drgn, crash or gdb gets
that first page in place of every later page of the mapping, and in
place of the zeroes of the unused pages after it.  This affects every
vm_map_ram() mapping that fits in a vmap block (up to BITS_PER_LONG
pages): erofs and f2fs decompression buffers, videobuf2 vmalloc/dma-sg
buffers, udmabuf vmaps, fuse readdir pages.  Kernels since v6.3 are
affected.

vmap_ram_vread_iter() walks the used regions of the block and, for each
region, zero-fills up to its start and then copies from
start + offset_in_page(addr).  A read starting in a later page of a
region therefore copies the region's first page, and a read starting
past the end of a region still copies from that region.

Skip regions that end at or before addr, and copy from addr itself,
i.e. use addr - start as the offset into the region.  The region is
re - rs pages long, not re - rs + 1: for_each_set_bitrange() returns
[rs, re) with re the first clear bit.  The extra page is one whose
used_map bit is clear, and vb_free() clears the bits before it unmaps
the pages, so a read racing with vm_unmap_ram() copied the page being
freed instead of zero-filling it.

Tested on x86_64 by queueing a 29-page V4L2_MEMORY_USERPTR buffer on a
vivid capture device, which videobuf2-vmalloc maps with vm_map_ram(),
page i starting with "userptr page i", and reading every page of its
vmap block through /proc/kcore.  Before, all 1024 pages of the block
read as page 0.  After, pages 0..28 read back in order and the rest of
the block carries no tag.  With a second buffer in the same block and a
100-page buffer outside the block path, reads at unaligned offsets,
across page and region boundaries, into and within the unused part of
the block, and of the whole block return the true contents.  With an
msleep() inserted between the bitmap_clear() and the
vunmap_range_noflush() of vb_free(), a read of a one-page buffer being
unmapped between two mapped ones returns zeroes.

Fixes: 06c8994626d1 ("mm/vmalloc.c: allow vread() to read out vm_map_ram areas")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Changes in v2:
      - region length is (re - rs) pages, not (re - rs + 1); suggested by
        Andrew Morton.  The extra page was shown with an msleep() added to
        vb_free() between its bitmap_clear() and its vunmap_range_noflush():
        a one-page buffer being unmapped between two mapped ones then read
        back its own bytes through /proc/kcore with v1 and zeroes with v2.
    
    Reproducer (CONFIG_PROC_KCORE=y, CONFIG_VIDEO_VIVID=y or =m, root):
    
      /* short.c: argv[1] = vivid capture node */
      #include <elf.h>
      #include <fcntl.h>
      #include <linux/videodev2.h>
      #include <stdio.h>
      #include <string.h>
      #include <sys/ioctl.h>
      #include <sys/mman.h>
      #include <unistd.h>
    
      int main(int argc, char **argv)
      {
      	struct v4l2_format fmt = { .type = V4L2_BUF_TYPE_VIDEO_CAPTURE };
      	struct v4l2_requestbuffers req = { .count = 1,
      		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE, .memory = V4L2_MEMORY_USERPTR };
      	struct v4l2_buffer b = { .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
      		.memory = V4L2_MEMORY_USERPTR };
      	static Elf64_Phdr ph[64];
      	static char buf[4096], line[256];
      	unsigned long lo, hi, a;
      	int fd = open(argc > 1 ? argv[1] : "/dev/video0", O_RDWR);
      	int kc = open("/proc/kcore", O_RDONLY), i, n, np, c;
      	Elf64_Ehdr eh;
      	FILE *f;
      	char *p;
    
      	ioctl(fd, VIDIOC_G_FMT, &fmt);
      	fmt.fmt.pix.width = 320;
      	fmt.fmt.pix.height = 180;
      	ioctl(fd, VIDIOC_S_FMT, &fmt);
      	np = (fmt.fmt.pix.sizeimage + 4095) / 4096;	/* 29 for YUYV */
      	p = mmap(NULL, np * 4096, PROT_READ | PROT_WRITE,
      		 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
      	for (i = 0; i < np; i++)
      		sprintf(p + i * 4096, "userptr page %d", i);
      	b.m.userptr = (unsigned long)p;
      	b.length = np * 4096;
      	if (ioctl(fd, VIDIOC_REQBUFS, &req) || ioctl(fd, VIDIOC_QBUF, &b))
      		return perror("QBUF"), 1;	/* buffer now vm_map_ram()ed */
    
      	f = fopen("/proc/sys/kernel/kptr_restrict", "w");	/* raw %pK */
      	fputs("1", f);
      	fclose(f);
      	if (pread(kc, &eh, sizeof(eh), 0) != sizeof(eh) || eh.e_phnum > 64 ||
      	    pread(kc, ph, eh.e_phnum * sizeof(*ph), eh.e_phoff) < 0)
      		return perror("/proc/kcore"), 1;
      	f = fopen("/proc/vmallocinfo", "r");
      	while (fgets(line, sizeof(line), f)) {
      		if (!strstr(line, "vm_map_ram") ||
      		    sscanf(line, "0x%lx-0x%lx", &lo, &hi) != 2)
      			continue;
      		printf("%lx:", lo);
      		for (c = 0, a = lo; a < hi; a += 4096)
      			for (i = 0; i < eh.e_phnum; i++)
      				if (ph[i].p_type == PT_LOAD && a >= ph[i].p_vaddr &&
      				    a < ph[i].p_vaddr + ph[i].p_memsz &&
      				    pread(kc, buf, 4096, ph[i].p_offset +
      					  a - ph[i].p_vaddr) == 4096 &&
      				    sscanf(buf, "userptr page %d", &n) == 1 &&
      				    c++ < 32)
      					printf(" %d", n);
      		printf("%s (%d pages carry a tag)\n", c > 32 ? " ..." : "", c);
      	}
      	return 0;
      }
    
      $ gcc -static -o short short.c
      # modprobe vivid; ./short /dev/videoN     # N = vivid capture node
    
    Before:
      ff32776280800000: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ... (1024 pages carry a tag)
    After:
      ff636d6c00800000: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 (29 pages carry a tag)

 mm/vmalloc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..643299c9ca15 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4588,7 +4588,7 @@ static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
 	struct xarray *xa;
 	unsigned long offset;
 	unsigned int rs, re;
-	size_t remains, n;
+	size_t remains, n, size;
 
 	/*
 	 * If it's area created by vm_map_ram() interface directly, but
@@ -4622,6 +4622,10 @@ static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
 			goto finished;
 
 		start = vmap_block_vaddr(vb->va->va_start, rs);
+		size = (re - rs) << PAGE_SHIFT;
+
+		if (addr >= start + size)
+			continue;
 
 		if (addr < start) {
 			size_t to_zero = min_t(size_t, start - addr, remains);
@@ -4635,8 +4639,8 @@ static size_t vmap_ram_vread_iter(struct iov_iter *iter, const char *addr,
 		}
 
 		/*it could start reading from the middle of used region*/
-		offset = offset_in_page(addr);
-		n = ((re - rs + 1) << PAGE_SHIFT) - offset;
+		offset = addr - start;
+		n = size - offset;
 		if (n > remains)
 			n = remains;
 

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

