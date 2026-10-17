Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7E47F3CA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230423; cv=none; b=cp2fvc+GV1sa/MPVqVvCBcewbJm2gzUF/yLiK7uwKRTkBxPQF5OHiDocGGbZJZHod407VncOq85Egc0bfEqXHztXNBXsFJhlB53e5J2KvYWiUDcS/e/DKQKeFASQCp6RbKEebEqd3i3r6FdS2G+2uxrDtIHQfbYwY76eMh5YNWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230423; c=relaxed/simple;
	bh=0+4EcF+28LSbjk09TRll/UcHslVJ8LpapruRYa45sB4=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Ygt21TRCCji8t48O6l1UDh0RgvWScdTlTlIEJ+LxInsdYQr67BJFLHZh34bWaVZUi9RhPl6zjIrCgRhWwWZe0iDHe6jZJhFiS+FyIuvNZYUmsu8w8/zm9pG8x4dSawZ6ujQH+4gi5u5kRLJ/M0+xMvfbfJ2jWWgpJSt+Wlfg/DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nkqjsz5E; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LKlgRttT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nkqjsz5E";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LKlgRttT"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792230419; bh=IiioPecZQfgf0VgJTHM9BWW
	cXOpdcjSdoRH4kGFgfI8=; b=nkqjsz5EBzpAoyT3Y+WxkdrNwQSjilfRwlq3l4GYAIS4TSIh0d
	H7W+QvN5aZqHxmDLFimyOkWNkzibfurduZsXbWoDMPgcpIy5EDUMBKSn9TiWUSiaPe2rs1I6ZdA
	3/E1grF9MRBp4LjwAPmFfxVLB6bChIg+ZTc5O7gO71TxKAJS+QoXk0EfR8SosVbzE9jL3K2UwGo
	erTu6JV7UAO8unHtWd0V4ZuEb6T3mVMcGAspryqwDyObeHhJPetbueY/4BawmrJKjQ/dQomNQYb
	9uFwKuNHepzpjVF2DXzLHyXLrvN4m9PfeAykUq4ogP8mSb+JCD7x0BgBhlVJ6TcrzqA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792230419; bh=IiioPecZQfgf0VgJTHM9BWW
	cXOpdcjSdoRH4kGFgfI8=; b=LKlgRttT9qOxN+MkU3DeVBuXuTLddJHB/r6151tiSnD0tpRMxR
	jSOM3YSpfFVHj7l6xADtwb2T5tOJXQ7T7KDQ==;
Date: Sat, 17 Oct 2026 10:46:59 +0100
From: Bradley Morgan <brads@mainlining.org>
To: nickolai@csail.mit.edu
CC: brauner@kernel.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 mic@digikod.net, serge@hallyn.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_nsproxy=3A_Fix_cred_leak?=
 =?US-ASCII?Q?_in_the_error_path_of_prepare=5Fnsset=28=29?=
In-Reply-To: <20261017033538.793280-1-nickolai@csail.mit.edu>
Message-ID: <97C8FE23-D2F6-4294-9C31-6DDAE2C6507D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 17 October 2026 04:35:38 BST, Nickolai Zeldovich
<nickolai@csail.mit.edu> wrote:
>A task that calls setns() with CLONE_NEWUSER together with CLONE_NEWNS
>and at least one more namespace flag leaks a struct cred (and the
>user_namespace, ucounts and group_info references it holds) whenever the
>call fails at the fs_struct copy.  On a kernel with CONFIG_USER_NS the
>leak is one cred per failed setns(); under memory pressure, or driven by
>a fault-injecting attacker, it accumulates and pins user namespaces that
>can then never be freed.
>
>prepare_nsset() sets nsset->flags only on the success path:
>
>	if (flags & CLONE_NEWUSER)
>		nsset->cred = prepare_creds();
>	...
>	} else if (flags & CLONE_NEWNS) {
>		nsset->fs = copy_fs_struct(me->fs);
>		if (!nsset->fs)
>			goto out;	/* flags still 0 here */
>	}
>	nsset->flags = flags;
>	return 0;
>out:
>	put_nsset(nsset);
>
>put_nsset() decides what to release from nsset->flags:
>
>	if (flags & CLONE_NEWUSER)
>		put_cred(nsset_cred(nsset));
>
>On the copy_fs_struct() failure arm prepare_creds() has already
>allocated the cred, but nsset->flags is still the zero from the caller's
>"struct nsset nsset = {}", so put_nsset() does not see CLONE_NEWUSER and
>never drops it.  The caller (__do_sys_setns) returns the error without
>touching nsset, so the cred is lost.
>
>Set nsset->flags at the start of prepare_nsset(), before anything can
>fail, so every error exit through put_nsset() releases what was taken.
>commit_nsset(), which clears nsset->cred on success, is unaffected.
>
>Reproduced on x86_64 under QEMU with failslab aimed at the fs_struct
>cache and kmemleak enabled: 500 calls of
>setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWUTS) each fail with
>-ENOMEM and leave 851 unreferenced cred objects allocated from
>prepare_creds() via setns() before the fix, and none after (the program
>is in the notes below).
>
>Found by formal verification of kernel/nsproxy.c.
>
>Fixes: 303cc571d107 ("nsproxy: attach to namespaces via pidfds")
>Assisted-by: LLM

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
>---
>
>Notes:
>    The leak is reachable from userspace on a CONFIG_USER_NS kernel:
>    setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWUTS) where
>    copy_fs_struct() returns NULL. copy_fs_struct() allocates from fs_cachep
>    ("fs_cache"), so CONFIG_FAILSLAB with that cache's per-slab failslab knob
>    forces the error arm deterministically; otherwise it needs real memory
>    pressure. The leaked object is the cred from prepare_creds() and the
>    user_namespace, ucounts and group_info references it holds; CONFIG_USER_NS
>    LSM blobs hung off that cred (security_prepare_creds) leak with it.
>    
>    Reproduced under QEMU (x86_64 defconfig + CONFIG_USER_NS, CONFIG_FAILSLAB,
>    CONFIG_FAULT_INJECTION_DEBUG_FS, CONFIG_SLUB_DEBUG, CONFIG_DEBUG_KMEMLEAK;
>    booted with slab_nomerge so fs_cache keeps refcount 1 for the per-cache
>    knob). A task marks fs_cache for failslab, marks itself (make-it-fail), and
>    calls setns() 500 times; every call returns -ENOMEM. On 70dd4ee72eb2 the
>    "cred" slab grows (active 120 -> 660) and kmemleak reports the leaked creds:
>    
>      unreferenced object 0xff4bc4614195c000 (size 184):
>        comm "test", ...
>        backtrace:
>          kmem_cache_alloc_noprof+0x188/0x3c0
>          prepare_creds+0x22/0x280
>          __se_sys_setns+0x131/0x710        (prepare_nsset is inlined here)
>          do_syscall_64+0x109/0x330
>    
>    kmemleak: before 851 unreferenced cred objects via prepare_creds<-setns,
>    RESULT FAIL; after 0, RESULT PASS. (The SLUB /proc/slabinfo active count is
>    approximate, so kmemleak is the signal.)
>    
>    Reproducer (needs CONFIG_FAILSLAB + CONFIG_DEBUG_KMEMLEAK, boot slab_nomerge,
>    run as root):
>      cc -O2 -Wall -static -o setns_cred_leak setns_cred_leak.c
>      ./setns_cred_leak   # before: RESULT: FAIL; after: RESULT: PASS
>    
>    // SPDX-License-Identifier: GPL-2.0
>    /* setns() prepare_nsset() cred leak: fail copy_fs_struct() with failslab. */
>    #define _GNU_SOURCE
>    #include <sched.h>
>    #include <stdio.h>
>    #include <string.h>
>    #include <unistd.h>
>    #include <errno.h>
>    #include <fcntl.h>
>    #include <sys/mount.h>
>    #include <sys/syscall.h>
>    
>    #define N 500
>    
>    static void w(const char *path, const char *val)
>    {
>    	int fd = open(path, O_WRONLY);
>    	if (fd >= 0) {
>    		if (write(fd, val, strlen(val)) < 0)
>    			perror(path);
>    		close(fd);
>    	}
>    }
>    
>    int main(void)
>    {
>    	char line[512];
>    	int pidfd, i, enomem = 0, leaks = 0;
>    	FILE *f;
>    
>    	mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL);
>    	w("/sys/kernel/slab/fs_cache/failslab", "1");	/* needs slab_nomerge */
>    	w("/sys/kernel/debug/failslab/cache-filter", "1");
>    	w("/sys/kernel/debug/failslab/task-filter", "1");
>    	w("/sys/kernel/debug/failslab/ignore-gfp-wait", "0");	/* fail GFP_KERNEL */
>    	w("/sys/kernel/debug/failslab/probability", "100");
>    	w("/sys/kernel/debug/failslab/interval", "1");
>    	w("/sys/kernel/debug/failslab/times", "-1");
>    
>    	pidfd = syscall(SYS_pidfd_open, getpid(), 0);
>    	w("/proc/self/make-it-fail", "1");
>    	for (i = 0; i < N; i++)
>    		if (setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWUTS) &&
>    		    errno == ENOMEM)
>    			enomem++;
>    	w("/proc/self/make-it-fail", "0");
>    	w("/sys/kernel/slab/fs_cache/failslab", "0");
>    	w("/sys/kernel/debug/failslab/times", "0");
>    
>    	w("/sys/kernel/debug/kmemleak", "scan");
>    	sleep(5);
>    	w("/sys/kernel/debug/kmemleak", "scan");
>    	sleep(1);
>    	f = fopen("/sys/kernel/debug/kmemleak", "r");
>    	while (f && fgets(line, sizeof(line), f))
>    		if (strstr(line, "prepare_creds"))	/* one per leaked cred */
>    			leaks++;
>    	if (f)
>    		fclose(f);
>    
>    	printf("setns x%d: ENOMEM=%d; kmemleak cred leaks=%d\n", N, enomem, leaks);
>    	printf("RESULT: %s\n", leaks > N / 10 ? "FAIL" : "PASS");
>    	return leaks > N / 10;
>    }
>
> kernel/nsproxy.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
>index 3fb1595a4a59..028019f3e387 100644
>--- a/kernel/nsproxy.c
>+++ b/kernel/nsproxy.c
>@@ -355,6 +355,7 @@ static int prepare_nsset(unsigned flags, struct nsset *nsset)
> {
> 	struct task_struct *me = current;
> 
>+	nsset->flags = flags;
> 	nsset->nsproxy = create_new_namespaces(0, me, current_user_ns(), me->fs);
> 	if (IS_ERR(nsset->nsproxy))
> 		return PTR_ERR(nsset->nsproxy);
>@@ -375,7 +376,6 @@ static int prepare_nsset(unsigned flags, struct nsset *nsset)
> 			goto out;
> 	}
> 
>-	nsset->flags = flags;
> 	return 0;
> 
> out:
>
>base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
