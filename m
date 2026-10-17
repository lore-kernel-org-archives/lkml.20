Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B734CF465
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.66.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210194; cv=none; b=ugzsIYc3D7r6RXlGDAAH9htobvZ3+qcCwXcRdfWKIY1mHcnhvfnZjNDdQZ+PdpF0bRcKXazxsjCc9KnXZMkXEertRd2HXzpnhbaJWk1nqE6g25g6KzkuLSzM8p0RMA0qou+MXoneRUxW3zO9O3B8TXbDcjCGnWqj6SXXvkLiVow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210194; c=relaxed/simple;
	bh=h9U1Qnti0FK0GS1kziSTcjtTk0JV7PFXzKKowuzy/sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTwMsohc/me4Yem+9XU8MOIQ/jS+TBRKkVh5liTyn0FCE1XM/1aAdaH3iJRxt1izW5HOZdqMCrYUwLWm/SQf7O4ng5EclwvWkCBIWX8TMYLwMlCTF9H6XGHAf22yBrud385pKhQ9dShRYEhKdxiS5aMtnbHmcX/JFjVlc3G7CcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com; spf=unknown smtp.mailfrom=hallyn.com; dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b=ULVniT6t; arc=none smtp.client-ip=178.63.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=hallyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b="ULVniT6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
	t=1792209574; bh=h9U1Qnti0FK0GS1kziSTcjtTk0JV7PFXzKKowuzy/sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULVniT6tFC8SBtRtnI2DYI/YZM1OdLv0rZ2gCr+ukoQOtKEnbgDzNYKnPGVdxvr6d
	 iAvDAKoYIVucRJnljtah0kmxqfWgMSUqJnaCCYEjozXyiWfjGj9VkMaHD+G2Ibx7A4
	 d8lODdRUxkgI+Tqh3TynNPM1V1uEP6fmbCLDv0U2MLi/wq6zLtjUuGPkNGxT5KEJAD
	 gs4xYrRalNnjzOUx+V7Yg4XXqUl9/TAj+ogy2HibLxddt1o8Pf110Rs7/R71dDrOzr
	 oKf9xLpGJRlkVXC89hkU5/+fPNoMKHgq3WDbCsKKnmH0J3Gp/NlPNkAQ8U4NKlUy+j
	 /rPzTWRhuCtrg==
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id A163883F; Fri, 16 Oct 2026 22:59:34 -0500 (CDT)
Date: Fri, 16 Oct 2026 22:59:34 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] nsproxy: Fix cred leak in the error path of
 prepare_nsset()
Message-ID: <atLypmEatVE4gC7h@hallyn.com>
References: <20261017033538.793280-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017033538.793280-1-nickolai@csail.mit.edu>

On Fri, Oct 16, 2026 at 11:35:38PM -0400, Nickolai Zeldovich wrote:
> A task that calls setns() with CLONE_NEWUSER together with CLONE_NEWNS
> and at least one more namespace flag leaks a struct cred (and the
> user_namespace, ucounts and group_info references it holds) whenever the
> call fails at the fs_struct copy.  On a kernel with CONFIG_USER_NS the
> leak is one cred per failed setns(); under memory pressure, or driven by
> a fault-injecting attacker, it accumulates and pins user namespaces that
> can then never be freed.
> 
> prepare_nsset() sets nsset->flags only on the success path:
> 
> 	if (flags & CLONE_NEWUSER)
> 		nsset->cred = prepare_creds();
> 	...
> 	} else if (flags & CLONE_NEWNS) {
> 		nsset->fs = copy_fs_struct(me->fs);
> 		if (!nsset->fs)
> 			goto out;	/* flags still 0 here */
> 	}
> 	nsset->flags = flags;
> 	return 0;
> out:
> 	put_nsset(nsset);
> 
> put_nsset() decides what to release from nsset->flags:
> 
> 	if (flags & CLONE_NEWUSER)
> 		put_cred(nsset_cred(nsset));
> 
> On the copy_fs_struct() failure arm prepare_creds() has already
> allocated the cred, but nsset->flags is still the zero from the caller's
> "struct nsset nsset = {}", so put_nsset() does not see CLONE_NEWUSER and
> never drops it.  The caller (__do_sys_setns) returns the error without
> touching nsset, so the cred is lost.
> 
> Set nsset->flags at the start of prepare_nsset(), before anything can
> fail, so every error exit through put_nsset() releases what was taken.
> commit_nsset(), which clears nsset->cred on success, is unaffected.
> 
> Reproduced on x86_64 under QEMU with failslab aimed at the fs_struct
> cache and kmemleak enabled: 500 calls of
> setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWUTS) each fail with
> -ENOMEM and leave 851 unreferenced cred objects allocated from
> prepare_creds() via setns() before the fix, and none after (the program
> is in the notes below).
> 
> Found by formal verification of kernel/nsproxy.c.
> 
> Fixes: 303cc571d107 ("nsproxy: attach to namespaces via pidfds")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Reviewed-by: Serge Hallyn <serge@hallyn.com>

thanks,
-serge

> ---
> 
> Notes:
>     The leak is reachable from userspace on a CONFIG_USER_NS kernel:
>     setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWUTS) where
>     copy_fs_struct() returns NULL. copy_fs_struct() allocates from fs_cachep
>     ("fs_cache"), so CONFIG_FAILSLAB with that cache's per-slab failslab knob
>     forces the error arm deterministically; otherwise it needs real memory
>     pressure. The leaked object is the cred from prepare_creds() and the
>     user_namespace, ucounts and group_info references it holds; CONFIG_USER_NS
>     LSM blobs hung off that cred (security_prepare_creds) leak with it.
>     
>     Reproduced under QEMU (x86_64 defconfig + CONFIG_USER_NS, CONFIG_FAILSLAB,
>     CONFIG_FAULT_INJECTION_DEBUG_FS, CONFIG_SLUB_DEBUG, CONFIG_DEBUG_KMEMLEAK;
>     booted with slab_nomerge so fs_cache keeps refcount 1 for the per-cache
>     knob). A task marks fs_cache for failslab, marks itself (make-it-fail), and
>     calls setns() 500 times; every call returns -ENOMEM. On 70dd4ee72eb2 the
>     "cred" slab grows (active 120 -> 660) and kmemleak reports the leaked creds:
>     
>       unreferenced object 0xff4bc4614195c000 (size 184):
>         comm "test", ...
>         backtrace:
>           kmem_cache_alloc_noprof+0x188/0x3c0
>           prepare_creds+0x22/0x280
>           __se_sys_setns+0x131/0x710        (prepare_nsset is inlined here)
>           do_syscall_64+0x109/0x330
>     
>     kmemleak: before 851 unreferenced cred objects via prepare_creds<-setns,
>     RESULT FAIL; after 0, RESULT PASS. (The SLUB /proc/slabinfo active count is
>     approximate, so kmemleak is the signal.)
>     
>     Reproducer (needs CONFIG_FAILSLAB + CONFIG_DEBUG_KMEMLEAK, boot slab_nomerge,
>     run as root):
>       cc -O2 -Wall -static -o setns_cred_leak setns_cred_leak.c
>       ./setns_cred_leak   # before: RESULT: FAIL; after: RESULT: PASS
>     
>     // SPDX-License-Identifier: GPL-2.0
>     /* setns() prepare_nsset() cred leak: fail copy_fs_struct() with failslab. */
>     #define _GNU_SOURCE
>     #include <sched.h>
>     #include <stdio.h>
>     #include <string.h>
>     #include <unistd.h>
>     #include <errno.h>
>     #include <fcntl.h>
>     #include <sys/mount.h>
>     #include <sys/syscall.h>
>     
>     #define N 500
>     
>     static void w(const char *path, const char *val)
>     {
>     	int fd = open(path, O_WRONLY);
>     	if (fd >= 0) {
>     		if (write(fd, val, strlen(val)) < 0)
>     			perror(path);
>     		close(fd);
>     	}
>     }
>     
>     int main(void)
>     {
>     	char line[512];
>     	int pidfd, i, enomem = 0, leaks = 0;
>     	FILE *f;
>     
>     	mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL);
>     	w("/sys/kernel/slab/fs_cache/failslab", "1");	/* needs slab_nomerge */
>     	w("/sys/kernel/debug/failslab/cache-filter", "1");
>     	w("/sys/kernel/debug/failslab/task-filter", "1");
>     	w("/sys/kernel/debug/failslab/ignore-gfp-wait", "0");	/* fail GFP_KERNEL */
>     	w("/sys/kernel/debug/failslab/probability", "100");
>     	w("/sys/kernel/debug/failslab/interval", "1");
>     	w("/sys/kernel/debug/failslab/times", "-1");
>     
>     	pidfd = syscall(SYS_pidfd_open, getpid(), 0);
>     	w("/proc/self/make-it-fail", "1");
>     	for (i = 0; i < N; i++)
>     		if (setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWUTS) &&
>     		    errno == ENOMEM)
>     			enomem++;
>     	w("/proc/self/make-it-fail", "0");
>     	w("/sys/kernel/slab/fs_cache/failslab", "0");
>     	w("/sys/kernel/debug/failslab/times", "0");
>     
>     	w("/sys/kernel/debug/kmemleak", "scan");
>     	sleep(5);
>     	w("/sys/kernel/debug/kmemleak", "scan");
>     	sleep(1);
>     	f = fopen("/sys/kernel/debug/kmemleak", "r");
>     	while (f && fgets(line, sizeof(line), f))
>     		if (strstr(line, "prepare_creds"))	/* one per leaked cred */
>     			leaks++;
>     	if (f)
>     		fclose(f);
>     
>     	printf("setns x%d: ENOMEM=%d; kmemleak cred leaks=%d\n", N, enomem, leaks);
>     	printf("RESULT: %s\n", leaks > N / 10 ? "FAIL" : "PASS");
>     	return leaks > N / 10;
>     }
> 
>  kernel/nsproxy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
> index 3fb1595a4a59..028019f3e387 100644
> --- a/kernel/nsproxy.c
> +++ b/kernel/nsproxy.c
> @@ -355,6 +355,7 @@ static int prepare_nsset(unsigned flags, struct nsset *nsset)
>  {
>  	struct task_struct *me = current;
>  
> +	nsset->flags = flags;
>  	nsset->nsproxy = create_new_namespaces(0, me, current_user_ns(), me->fs);
>  	if (IS_ERR(nsset->nsproxy))
>  		return PTR_ERR(nsset->nsproxy);
> @@ -375,7 +376,6 @@ static int prepare_nsset(unsigned flags, struct nsset *nsset)
>  			goto out;
>  	}
>  
> -	nsset->flags = flags;
>  	return 0;
>  
>  out:
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> -- 
> 2.53.0
